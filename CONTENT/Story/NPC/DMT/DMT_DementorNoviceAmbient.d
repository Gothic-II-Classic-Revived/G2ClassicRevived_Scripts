PROTOTYPE Default_AmbientNovice (C_NPC)
{
	name 		= NAME_Dementor;
	guild 		= GIL_DMT;
	voice 		= 19;
	flags       = 0;
	npctype		= NPCTYPE_AMBIENT;

	B_SetAttributesForLevel(self, 50);
	Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);
	fight_tactic = FAI_HUMAN_NORMAL;

	B_CreateAmbientInv(self);

	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self, "Humans_Mage.mds");

	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
};
