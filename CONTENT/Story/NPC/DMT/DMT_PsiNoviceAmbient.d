PROTOTYPE Default_AmbientPsiNovice (C_NPC)
{
	name 		= NAME_PsiNovice;
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

FUNC VOID B_SetDMTPsiNoviceAmbientL()
{
	B_SetAttributesForLevel(self, 45);
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self, "Humans_Militia.mds");
	EquipItem(self, ITMW_REVIVED_1H_MACE_01);
};

FUNC VOID B_SetDMTPsiNoviceAmbientM()
{
	B_SetAttributesForLevel(self, 50);
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self, "Humans_Militia.mds");
	EquipItem(self, ITMW_REVIVED_1H_MACE_04);
};

FUNC VOID B_SetDMTPsiNoviceAmbientH()
{
	B_SetAttributesForLevel(self, 55);
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 2);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self, "Humans_Militia.mds");
	EquipItem(self, ITMW_REVIVED_1H_MACE_02);
};

instance DMT_PsiNoviceAmbientL (Default_AmbientPsiNovice)
{
	B_SetDMTPsiNoviceAmbientL();
	B_SetNpcFullVisual(self, MALE, "Hum_Head_Bald", Face_W_Hum_TattooMad14, Body_W_Hum_Tattoo, Body_White, Teeth_Yellow, ITAR_REVIVED_NOV_L);
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_PsiNoviceAmbientM (Default_AmbientPsiNovice)
{
	B_SetDMTPsiNoviceAmbientM();
	B_SetNpcFullVisual(self, MALE, "Hum_Head_Bald", Face_L_Hum_TattooMad2, Body_L_Hum_Tattoo, Body_Latino, Teeth_Normal, ITAR_REVIVED_NOV_M);
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_PsiNoviceAmbientH (Default_AmbientPsiNovice)
{
	B_SetDMTPsiNoviceAmbientH();
	B_SetNpcFullVisual(self, MALE, "Hum_Head_Bald", Face_B_Hum_TattooMad1, Body_B_Hum_Tattoo, Body_Black, Teeth_Gold, ITAR_REVIVED_NOV_H);
	start_aistate = ZS_Stand_Dementor;
};
