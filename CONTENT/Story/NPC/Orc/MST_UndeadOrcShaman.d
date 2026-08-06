//*********************************
//	Undead Orc Shaman Prototype	
//*********************************

PROTOTYPE Mst_Default_UndeadOrcShaman (C_Npc)			
{
	//----- Monster ----
	name							=	"Undead Orc Shaman";
	guild							=	GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_UNDEADORCWARRIOR;
	voice							=	18;

	//----- Attributes ----
	B_SetMonsterAttributesForLevel(self, 40);

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	200;
		
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ORC;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
		
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_UndeadOrcShaman()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_SHAMAN_UNDEAD",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Orc Shaman Undead    												**
*************************************************************************/

INSTANCE UndeadOrcShaman (Mst_Default_UndeadOrcShaman)
{
	// ------ visuals ------
	B_SetVisuals_UndeadOrcShaman();
	
	// ------ Inventory ------
	EquipItem (self, ITMW_REVIVED_ORC_STAFF_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

