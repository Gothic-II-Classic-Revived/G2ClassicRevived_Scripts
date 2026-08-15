// ***********************************************************************
// Three-stage fights for the four dragons in the Valley of Mines.
// ***********************************************************************

func int C_DragonFight_IsValleyDragon(var C_NPC dragon)
{
	if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Rock))
	|| (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Ice))
	|| (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Fire))
	|| (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Swamp))
	{
		return TRUE;
	};

	return FALSE;
};

// The support golems use the same prone -> rise -> fight sequence as the
// Shattered Golem, but rise automatically after being summoned.
func void ZS_DragonGolemRise()
{
	B_ClearPerceptions(self);
	self.NoFocus = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	self.bodyStateInterruptableOverride = TRUE;
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_DragonGolemRise_Loop()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self, "T_DEAD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		Npc_SetStateTime(self, 0);
		return LOOP_CONTINUE;
	};

	if (Npc_GetStateTime(self) >= 1)
	{
		AI_PlayAni(self, "T_RISE");
		self.NoFocus = FALSE;
		self.flags = 0;
		self.bodyStateInterruptableOverride = FALSE;
		self.start_aistate = ZS_MM_AllScheduler;
		self.aivar[AIV_MM_RestStart] = OnlyRoutine;

		Npc_SetTarget(self, hero);
		AI_StartState(self, ZS_MM_Attack, 0, "");
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_DragonGolemRise_End()
{
};

func void B_DragonFight_SpawnSupports(var C_NPC dragon)
{
	if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Rock))
	{
		Wld_InsertNpc(StoneGolem_Dragon, "OW_STONEDRAGON");
		Wld_InsertNpc(StoneGolem_Dragon2, "OW_STONEDRAGON");
	}
	else if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Ice))
	{
		Wld_InsertNpc(IceGolem_Dragon, "FM_162");
		Wld_InsertNpc(IceGolem_Dragon2, "FM_162");
	}
	else if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Fire))
	{
		Wld_InsertNpc(FireGolem_Dragon, "OW_FIREDRAGON");
		Wld_InsertNpc(FireGolem_Dragon2, "OW_FIREDRAGON");
	}
	else if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Swamp))
	{
		Wld_InsertNpc(SwampGolem_Dragon, "OW_SWAMPDRAGON");
		Wld_InsertNpc(SwampGolem_Dragon2, "OW_SWAMPDRAGON");
	};
};

func void B_DragonFight_PlayElementEffect(var C_NPC dragon)
{
	if (dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		Wld_PlayEffect("spellFX_INCOVATION_GRAY", dragon, dragon, 0, 0, 0, FALSE);
	}
	else if (dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE", dragon, dragon, 0, 0, 0, FALSE);
	}
	else if (dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED", dragon, dragon, 0, 0, 0, FALSE);
	}
	else if (dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		Wld_PlayEffect("spellFX_INCOVATION_GREEN", dragon, dragon, 0, 0, 0, FALSE);
	};
};

func void B_DragonFight_Begin(var C_NPC dragon)
{
	if (C_DragonFight_IsValleyDragon(dragon))
	&& (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_DORMANT)
	{
		dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_ONE;
		dragon.aivar[AIV_DragonSpecialCooldown] = DRAGON_SCREAM_INITIAL_COOLDOWN;
		dragon.flags = 0;
	};
};

func void B_DragonFight_StartSummonStage(var C_NPC dragon)
{
	dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_SUMMONS;
	dragon.attribute[ATR_HITPOINTS] = dragon.attribute[ATR_HITPOINTS_MAX] / 2;
	dragon.flags = NPC_FLAG_IMMORTAL;
	dragon.NoFocus = TRUE;

	Npc_ClearAIQueue(dragon);
	B_ClearPerceptions(dragon);
	AI_PlayAni(dragon, "T_WARN");

	B_DragonFight_PlayElementEffect(dragon);

	AI_Teleport(dragon, "TOT");
	B_DragonFight_SpawnSupports(dragon);
};

func int B_DragonFight_AssessDamage(var C_NPC dragon)
{
	if (!C_DragonFight_IsValleyDragon(dragon))
	{
		return FALSE;
	};

	// Save compatibility for fights which were already started before this
	// stage variable existed.
	if (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_DORMANT)
	&& (dragon.flags == 0)
	{
		dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_ONE;
		dragon.aivar[AIV_DragonSpecialCooldown] = DRAGON_SCREAM_INITIAL_COOLDOWN;
	};

	if (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_ONE)
	&& (dragon.attribute[ATR_HITPOINTS] <= dragon.attribute[ATR_HITPOINTS_MAX] / 2)
	{
		B_DragonFight_StartSummonStage(dragon);
		return TRUE;
	};

	if (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_SUMMONS)
	{
		dragon.attribute[ATR_HITPOINTS] = dragon.attribute[ATR_HITPOINTS_MAX] / 2;
		return TRUE;
	};

	return FALSE;
};

func void B_DragonFight_ReturnDragon(var C_NPC dragon, var string returnWaypoint)
{
	if (dragon.aivar[AIV_DragonFightStage] != DRAGON_STAGE_SUMMONS)
	{
		return;
	};

	dragon.attribute[ATR_HITPOINTS] = dragon.attribute[ATR_HITPOINTS_MAX] / 2;
	dragon.NoFocus = FALSE;
	dragon.flags = 0;
	dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_FINAL;
	dragon.aivar[AIV_DragonSpecialCooldown] = DRAGON_SCREAM_INITIAL_COOLDOWN;

	Npc_ClearAIQueue(dragon);
	AI_Teleport(dragon, returnWaypoint);
	Npc_SetTarget(dragon, hero);
	AI_StartState(dragon, ZS_MM_Attack, 0, "");
};

func void B_DragonFight_OnSupportDeath(var C_NPC support)
{
	var C_NPC dragon;

	if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(StoneGolem_Dragon))
	|| (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(StoneGolem_Dragon2))
	{
		if (Npc_IsDead(StoneGolem_Dragon))
		&& (Npc_IsDead(StoneGolem_Dragon2))
		{
			dragon = Hlp_GetNpc(Dragon_Rock);
			B_DragonFight_ReturnDragon(dragon, "OW_STONEDRAGON");
		};
	}
	else if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(IceGolem_Dragon))
	|| (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(IceGolem_Dragon2))
	{
		if (Npc_IsDead(IceGolem_Dragon))
		&& (Npc_IsDead(IceGolem_Dragon2))
		{
			dragon = Hlp_GetNpc(Dragon_Ice);
			B_DragonFight_ReturnDragon(dragon, "FM_162");
		};
	}
	else if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(FireGolem_Dragon))
	|| (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(FireGolem_Dragon2))
	{
		if (Npc_IsDead(FireGolem_Dragon))
		&& (Npc_IsDead(FireGolem_Dragon2))
		{
			dragon = Hlp_GetNpc(Dragon_Fire);
			B_DragonFight_ReturnDragon(dragon, "OW_FIREDRAGON");
		};
	}
	else if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(SwampGolem_Dragon))
	|| (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(SwampGolem_Dragon2))
	{
		if (Npc_IsDead(SwampGolem_Dragon))
		&& (Npc_IsDead(SwampGolem_Dragon2))
		{
			dragon = Hlp_GetNpc(Dragon_Swamp);
			B_DragonFight_ReturnDragon(dragon, "OW_SWAMPDRAGON");
		};
	};
};

func int B_DragonFight_TryScream(var C_NPC dragon)
{
	var int currentSecond;
	var int elapsedSeconds;

	if (!C_DragonFight_IsValleyDragon(dragon))
	|| (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_DORMANT)
	|| (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_SUMMONS)
	|| (Npc_IsDead(hero))
	|| (C_NpcIsDown(hero))
	|| (hero.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return FALSE;
	};

	currentSecond = Npc_GetStateTime(dragon);
	if (currentSecond <= dragon.aivar[AIV_DragonSpecialLastSecond])
	{
		return FALSE;
	};

	elapsedSeconds = currentSecond - dragon.aivar[AIV_DragonSpecialLastSecond];
	dragon.aivar[AIV_DragonSpecialLastSecond] = currentSecond;

	if (dragon.aivar[AIV_DragonSpecialCooldown] > 0)
	{
		dragon.aivar[AIV_DragonSpecialCooldown] -= elapsedSeconds;
		if (dragon.aivar[AIV_DragonSpecialCooldown] < 0)
		{
			dragon.aivar[AIV_DragonSpecialCooldown] = 0;
		};
		return FALSE;
	};

	if (Npc_GetDistToNpc(dragon, hero) > DRAGON_SCREAM_RANGE)
	|| (Npc_GetHeightToNpc(dragon, hero) > DRAGON_SCREAM_MAX_HEIGHT)
	|| (Hlp_Random(100) >= DRAGON_SCREAM_TRIGGER_CHANCE)
	{
		return FALSE;
	};

	dragon.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(hero);
	Npc_ClearAIQueue(dragon);
	Npc_SetTarget(dragon, hero);
	AI_StartState(dragon, ZS_MM_DragonScream, 0, "");
	return TRUE;
};

func void B_DragonFight_ScreamImpact(var C_NPC dragon, var C_NPC target)
{
	var int screamDamage;

	Wld_PlayEffect("SFX_Circle", dragon, dragon, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_Windfist_Cast", dragon, dragon, 0, 0, 0, FALSE);
	B_DragonFight_PlayElementEffect(dragon);

	if (!Hlp_IsValidNpc(target))
	|| (Npc_IsDead(target))
	|| (Npc_GetDistToNpc(dragon, target) > DRAGON_SCREAM_RANGE)
	|| (Npc_GetHeightToNpc(dragon, target) > DRAGON_SCREAM_MAX_HEIGHT)
	{
		return;
	};

	Wld_PlayEffect("spellFX_Windfist_Cast", target, target, 0, 0, 0, FALSE);

	if (!C_BodyStateContains(target, BS_SWIM))
	&& (!C_BodyStateContains(target, BS_DIVE))
	{
		AI_PlayAniBS(target, "T_FLY", BS_FALL);
		AI_StandUp(target);
	};

	if (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_FINAL)
	{
		screamDamage = DRAGON_SCREAM_DAMAGE_FINAL;
	}
	else
	{
		screamDamage = DRAGON_SCREAM_DAMAGE_ONE;
	};

	B_MagicHurtNpc(dragon, target, screamDamage);
};

func void ZS_MM_DragonScream()
{
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	self.aivar[AIV_DragonSpecialPhase] = 0;
	AI_PlayAni(self, "T_WARN");
};

func int ZS_MM_DragonScream_Loop()
{
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);

	if (self.aivar[AIV_DragonSpecialPhase] == 0)
	&& (Npc_GetStateTime(self) >= 1)
	{
		B_DragonFight_ScreamImpact(self, other);
		self.aivar[AIV_DragonSpecialPhase] = 1;
	};

	if (Npc_GetStateTime(self) >= 2)
	{
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_DragonScream_End()
{
	self.aivar[AIV_DragonSpecialLastSecond] = 0;

	if (self.aivar[AIV_DragonFightStage] == DRAGON_STAGE_FINAL)
	{
		self.aivar[AIV_DragonSpecialCooldown] = DRAGON_SCREAM_COOLDOWN_FINAL;
	}
	else
	{
		self.aivar[AIV_DragonSpecialCooldown] = DRAGON_SCREAM_COOLDOWN_ONE;
	};

	if (Npc_IsDead(self))
	|| (self.aivar[AIV_DragonFightStage] == DRAGON_STAGE_SUMMONS)
	{
		return;
	};

	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if (!Hlp_IsValidNpc(other))
	|| (Npc_IsDead(other))
	{
		other = Hlp_GetNpc(PC_Hero);
	};

	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_MM_Attack, 0, "");
};
