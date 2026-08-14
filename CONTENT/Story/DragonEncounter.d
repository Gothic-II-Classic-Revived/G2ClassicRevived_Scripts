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

func void B_DragonFight_StartAttacker(var C_NPC attacker)
{
	Npc_SetTarget(attacker, hero);
	AI_StartState(attacker, ZS_MM_Attack, 0, "");
};

func void B_DragonFight_SpawnSupports(var C_NPC dragon)
{
	var C_NPC attacker;

	if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Rock))
	{
		Wld_InsertNpc(StoneGolem_Dragon, "OW_STONEDRAGON");
		attacker = Hlp_GetNpc(StoneGolem_Dragon);
		B_DragonFight_StartAttacker(attacker);
	}
	else if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Ice))
	{
		Wld_InsertNpc(IceGolem_Dragon, "FM_162");
		attacker = Hlp_GetNpc(IceGolem_Dragon);
		B_DragonFight_StartAttacker(attacker);
	}
	else if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Fire))
	{
		Wld_InsertNpc(FireGolem_Dragon, "OW_FIREDRAGON");
		attacker = Hlp_GetNpc(FireGolem_Dragon);
		B_DragonFight_StartAttacker(attacker);
	}
	else if (Hlp_GetInstanceID(dragon) == Hlp_GetInstanceID(Dragon_Swamp))
	{
		Wld_InsertNpc(SwampGolem_Dragon, "OW_SWAMPDRAGON");
		attacker = Hlp_GetNpc(SwampGolem_Dragon);
		B_DragonFight_StartAttacker(attacker);
	};
};

func void B_DragonFight_Begin(var C_NPC dragon)
{
	if (C_DragonFight_IsValleyDragon(dragon))
	&& (dragon.aivar[AIV_DragonFightStage] == DRAGON_STAGE_DORMANT)
	{
		dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_ONE;
		dragon.flags = 0;
	};
};

func void B_DragonFight_StartSummonStage(var C_NPC dragon)
{
	dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_SUMMONS;
	dragon.attribute[ATR_HITPOINTS] <= dragon.attribute[ATR_HITPOINTS_MAX] / 2;
	dragon.flags = NPC_FLAG_IMMORTAL;
	dragon.NoFocus = TRUE;

	Npc_ClearAIQueue(dragon);
	B_ClearPerceptions(dragon);
	AI_PlayAni(dragon, "T_WARN");

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

	Npc_ClearAIQueue(dragon);
	AI_Teleport(dragon, returnWaypoint);
	Npc_SetTarget(dragon, hero);
	AI_StartState(dragon, ZS_MM_Attack, 0, "");
	dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_FINAL;
};

func void B_DragonFight_OnSupportDeath(var C_NPC support)
{
	var C_NPC dragon;

	if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(StoneGolem_Dragon))
	{
		if (Npc_IsDead(StoneGolem_Dragon))
		{
			dragon = Hlp_GetNpc(Dragon_Rock);
			B_DragonFight_ReturnDragon(dragon, "OW_STONEDRAGON");
		};
	}
	else if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(IceGolem_Dragon))
	{
		if (Npc_IsDead(IceGolem_Dragon))
		{
			dragon = Hlp_GetNpc(Dragon_Ice);
			B_DragonFight_ReturnDragon(dragon, "FM_162");
		};
	}
	else if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(FireGolem_Dragon))
	{
		if (Npc_IsDead(FireGolem_Dragon))
		{
			dragon = Hlp_GetNpc(Dragon_Fire);
			B_DragonFight_ReturnDragon(dragon, "OW_FIREDRAGON");
		};
	}
	else if (Hlp_GetInstanceID(support) == Hlp_GetInstanceID(SwampGolem_Dragon))
	{
		if (Npc_IsDead(SwampGolem_Dragon))
		{
			dragon = Hlp_GetNpc(Dragon_Swamp);
			B_DragonFight_ReturnDragon(dragon, "OW_SWAMPDRAGON");
		};
	};
};
