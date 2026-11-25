func void B_RestartSuckEnergy()
{
	if (Npc_GetLastHitSpellID(self) == SPL_SuckEnergy)
	{
		if (B_BindSuckEnergyCaster())
		{
			Npc_SetStateTime(self, 0);
		};
	};
};

func void B_StopSuckEnergy(var int reactToCaster)
{
	self.aivar[AIV_SuckEnergyCasterId] = 0;
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
	Npc_ClearAIQueue(self);
	AI_StandUp(self);

	if (reactToCaster && !Npc_IsPlayer(self))
	{
		if (self.guild < GIL_SEPERATOR_HUM)
		{
			B_ReactToDamage();
		}
		else
		{
			Npc_SetTempAttitude(self, ATT_HOSTILE);
		};
	};
};

func int ZS_SuckEnergy()
{
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_RestartSuckEnergy);
	Npc_StopAni(self, "S_SUCKENERGY_VICTIM");
	Npc_ClearAIQueue(self);
	AI_StandUp(self);
};

func int B_SuckEnergyTick(var C_NPC caster)
{
	if (self.aivar[AIV_SuckEnergyCasterId] == 0)
	|| (caster.aivar[AIV_SuckEnergyActorId] != self.aivar[AIV_SuckEnergyCasterId])
	|| (Npc_IsDead(caster))
	{
		B_StopSuckEnergy(FALSE);
		return LOOP_END;
	};

	var int elapsed;
	elapsed = Npc_GetStateTime(self);
	if (elapsed > SPL_TIME_SuckEnergy)
	|| (self.aivar[AIV_SuckEnergyStartDist] >= Npc_GetDistToNpc(self, caster) + 100)
	{
		B_StopSuckEnergy(TRUE);
		return LOOP_END;
	};

	if (self.aivar[AIV_SuckEnergyStateTime] == elapsed)
	{
		return LOOP_CONTINUE;
	};
	if (self.aivar[AIV_SuckEnergyStateTime] == -1)
	{
		if (!C_BodyStateContains(self, BS_UNCONSCIOUS))
		{
			AI_PlayAniBS(self, "T_STAND_2_SUCKENERGY_VICTIM", BS_UNCONSCIOUS);
		};
		Wld_PlayEffect("spellFX_SuckEnergy_BloodFly", self, caster, 0, 0, 0, FALSE);
	};
	self.aivar[AIV_SuckEnergyStateTime] = elapsed;

	// Leave the victim one hit point, including when only part of a tick can be drained.
	var int drained;
	drained = self.attribute[ATR_HITPOINTS] - 1;
	if (drained > SPL_SuckEnergy_DAMAGE)
	{
		drained = SPL_SuckEnergy_DAMAGE;
	};
	if (drained > 0)
	{
		B_MagicHurtNpc(caster, self, drained);
		Npc_ChangeAttribute(caster, ATR_HITPOINTS, drained);
	};
	return LOOP_CONTINUE;
};

func int ZS_SuckEnergy_Loop()
{
	// Npc_GetTarget restores the victim's target into 'other' on each AI tick.
	if (Npc_GetTarget(self))
	{
		return B_SuckEnergyTick(other);
	};
	B_StopSuckEnergy(FALSE);
	return LOOP_END;
};

func void ZS_SuckEnergy_End()
{
	Npc_PercEnable(self, PERC_ASSESSMAGIC, B_AssessMagic);
};
