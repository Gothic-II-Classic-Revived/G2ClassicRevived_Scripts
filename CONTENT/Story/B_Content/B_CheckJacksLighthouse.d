func void B_CheckJacksLighthouse()
{
	if (MIS_Jack_KillLighthouseBandits != LOG_SUCCESS)
	|| (zDExt_Hlp_IsValidVob("NW_JACKLIGHTHOUSE_CLEANED"))
	{
		return;
	};

	Ext_RemoveVobTree("NW_JACKLIGHTHOUSE_BANDITS");
	Ext_InsertVobTree("VOBTREE/NW_JACKLIGHTHOUSE_CLEANED.ZEN");
	REV_SetObjectRoutine_Fire("FIREPLACE_LIGHTHOUSE_01");
	REV_SetObjectRoutine_Fire("FIREPLACE_LIGHTHOUSE_02");
	REV_SetObjectRoutine_Fire("FIREPLACE_LIGHTHOUSE_03");
};
