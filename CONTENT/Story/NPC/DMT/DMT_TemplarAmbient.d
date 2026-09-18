PROTOTYPE Default_AmbientTemplar (C_NPC)
{
	name 		= NAME_Templar;
	guild 		= GIL_DMT;
	voice 		= 19;
	flags       = 0;
	npctype		= NPCTYPE_AMBIENT;

	fight_tactic = FAI_HUMAN_NORMAL;
	damagetype   = DAM_EDGE;

	B_CreateAmbientInv(self);

	aivar[AIV_MM_FollowTime]	= NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel]	= FIGHT_DIST_CANCEL;
	bodyStateInterruptableOverride = TRUE;
};

FUNC VOID B_SetDMTTemplarAmbientL()
{
	B_SetAttributesForLevel(self, 50);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 1);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self, "Humans_Militia.mds");
	EquipItem(self, ITMW_REVIVED_2H_SWORD_LIGHT_01);
};

FUNC VOID B_SetDMTTemplarAmbientM()
{
	B_SetAttributesForLevel(self, 60);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 2);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self, "Humans_Militia.mds");
	EquipItem(self, ITMW_REVIVED_2H_SWORD_LIGHT_02);
};

FUNC VOID B_SetDMTTemplarAmbientH()
{
	B_SetAttributesForLevel(self, 70);
	Npc_SetTalentSkill(self, NPC_TALENT_2H, 2);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self, "Humans_Militia.mds");
	EquipItem(self, ITMW_REVIVED_2H_SWORD_LIGHT_04);
};

instance DMT_TemplarAmbientL (Default_AmbientTemplar)
{
	B_SetDMTTemplarAmbientL();
	B_SetNpcFullVisual(self, MALE, "Hum_Head_Bald", Face_W_Hum_TattooMad9, Body_W_Hum_Tattoo, Body_White, Teeth_Broken, ITAR_REVIVED_TPL_L);
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_TemplarAmbientM (Default_AmbientTemplar)
{
	B_SetDMTTemplarAmbientM();
	B_SetNpcFullVisual(self, MALE, "Hum_Head_Bald", Face_P_Hum_TattooMad1, Body_P_Hum_Tattoo, Body_Pale, Teeth_Yellow, ITAR_REVIVED_TPL_M);
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_TemplarAmbientH (Default_AmbientTemplar)
{
	B_SetDMTTemplarAmbientH();
	B_SetNpcFullVisual(self, MALE, "Hum_Head_Bald", Face_W_Hum_TattooMad24, Body_W_Hum_Tattoo, Body_White, Teeth_Gold, ITAR_REVIVED_TPL_H);
	start_aistate = ZS_Stand_Dementor;
};
