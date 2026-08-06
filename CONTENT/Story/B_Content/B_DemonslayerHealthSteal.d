// ************************************
// REV_IsDemonicCreature
// ************************************
func int REV_IsDemonicCreature(var C_NPC slf)
{
	if (slf.guild == GIL_DEMON)
	|| (slf.guild == GIL_SUMMONED_DEMON)
	{
		return TRUE;
	};

	return FALSE;
};

// ************************************
// REV_GetDemonslayerHealthSteal
// ************************************
func int REV_GetDemonslayerHealthSteal(var C_ITEM weap)
{
	if (Hlp_IsItem(weap, ITMW_REVIVED_1H_DEMONSLAYER) == TRUE)
	{
		return REV_HealthSteal_Demonslayer_1H;
	};

	if (Hlp_IsItem(weap, ITMW_REVIVED_2H_DEMONSLAYER) == TRUE)
	{
		return REV_HealthSteal_Demonslayer_2H;
	};

	return 0;
};

// ************************************
// REV_DemonslayerHealthSteal
// ************************************
func void REV_DemonslayerHealthSteal(var C_NPC oth, var C_NPC slf)
{
	if (slf.flags == NPC_FLAG_IMMORTAL)
	|| (REV_IsDemonicCreature(slf) == FALSE)
	|| (oth.attribute[ATR_HITPOINTS] >= oth.attribute[ATR_HITPOINTS_MAX])
	{
		return;
	};

	var C_ITEM readyWeap; readyWeap = Npc_GetReadiedWeapon(oth);
	var int healthSteal; healthSteal = REV_GetDemonslayerHealthSteal(readyWeap);

	if (healthSteal <= 0)
	{
		return;
	};

	var int missingHealth;
	missingHealth = oth.attribute[ATR_HITPOINTS_MAX] - oth.attribute[ATR_HITPOINTS];

	if (healthSteal > missingHealth)
	{
		healthSteal = missingHealth;
	};

	Npc_ChangeAttribute(oth, ATR_HITPOINTS, healthSteal);
};
