//*****************************
//	Orc Slave Prototype		
//*****************************

PROTOTYPE Mst_Default_OrcSlave(C_Npc)			
{
	//----- Monster -----
	name							=	"Orc Slave";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCWARRIOR;
	voice							=	18;

	//----- Attributes ----
	B_SetMonsterAttributesForLevel(self, 20);

	//----- Protections ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	0;
		
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;

	fight_tactic	=	FAI_ORC_SCOUT;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_ORC_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

//**************
//	Visuals
//**************

func void B_SetVisuals_OrcSlave()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_Slave",	DEFAULT,	DEFAULT,	"Orc_HeadSlave",	DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Orc Slave Roam    														
//******************

INSTANCE OrcSlave_Roam (Mst_Default_OrcSlave)
{
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//******************
//	Orc Slave Rest    														
//******************

INSTANCE OrcSlave_Rest (Mst_Default_OrcSlave)
{
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//******************
//	Orc Slave Sit    														
//******************

INSTANCE OrcSlave_Sit (Mst_Default_OrcSlave)
{
	//-------- visual --------
	B_SetVisuals_OrcSlave();
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};