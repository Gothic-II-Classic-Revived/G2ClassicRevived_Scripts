
// ****************************************************
// MAKERUNE_S1
// --------------
// Funktion wird durch Runentisch-Mobsi-Benutzung aufgerufen!
// benötigtes Item dafür: ItMi_RuneBlank
// *****************************************************
FUNC VOID MAKERUNE_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE; 
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_MAKERUNE;
		Ai_ProcessInfos (her);
	};
}; 

//*******************************************************
//	MakeRune Dialog abbrechen
//*******************************************************
INSTANCE PC_MakeRune_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_MakeRune_End_Condition;
	information		= PC_MakeRune_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_MakeRune_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_MakeRune_End_Info()
{
	CreateInvItems (self, ItMi_RuneBlank,1);
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
// Runen- Erschaffung Dialoge
//---------------------------
//*******************************************************
// Circle 1
INSTANCE PC_Circle_01 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_01_Condition;
	information		= PC_Circle_01_Info;
	permanent		= TRUE;
	description		= "Create 1st Circle runes"; 
};
FUNC INT PC_Circle_01_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& ((PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Charm] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Light] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_01_Info ()
{
	Info_ClearChoices (PC_Circle_01);
	Info_AddChoice (PC_Circle_01, DIALOG_BACK, PC_Circle_01_BACK);
	if (PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	{
		Info_AddChoice (PC_Circle_01, "Fire Bolt", PC_ItRu_Firebolt_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	{
		Info_AddChoice (PC_Circle_01, "Ice Bolt", PC_ItRu_Icebolt_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE)
	{
		Info_AddChoice (PC_Circle_01, "Sleep", PC_ItRu_Sleep_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Charm] == TRUE)
	{
		Info_AddChoice (PC_Circle_01, "Charm", PC_RevivedRune_Charm_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Light] == TRUE)
	{
		Info_AddChoice (PC_Circle_01, "Light", PC_ItRu_Light_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	{
		Info_AddChoice (PC_Circle_01, "Heal Light Wounds", PC_ItRu_LightHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE)
	{
		Info_AddChoice (PC_Circle_01, "Goblin Skeleton", PC_ItRu_SumGobSkel_Info);
	};
};
FUNC VOID PC_Circle_01_BACK ()
{
	Info_ClearChoices (PC_Circle_01);
};

// Circle 2
INSTANCE PC_Circle_02 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_02_Condition;
	information		= PC_Circle_02_Info;
	permanent		= TRUE;
	description		= "Create 2nd Circle runes"; 
};
FUNC INT PC_Circle_02_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 2)
	&& ((PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Telekinesis] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_WindFist] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Swarm] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_GreenTentacle] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_ConcussionBolt] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_02_Info ()
{
	Info_ClearChoices (PC_Circle_02);
	Info_AddChoice (PC_Circle_02, DIALOG_BACK, PC_Circle_02_BACK);
	if (PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Fire Ball", PC_ItRu_InstFireball_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Zap", PC_ItRu_Zap_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Telekinesis] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Telekinesis", PC_RevivedRune_Telekinesis_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Shrink", PC_ItRu_Shrink_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_WindFist] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Wind Fist", PC_ItRu_Windfist_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Swarm] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Swarm", PC_RevivedRune_Swarm_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_GreenTentacle] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Root Snare", PC_RevivedRune_GreenTentacle_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Heal Medium Wounds", PC_ItRu_MediumHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ConcussionBolt] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Concussion Bolt", PC_ItRu_ConcussionBolt_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Wolf Skeleton", PC_RevivedRune_SummonWolf_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE)
	{
		Info_AddChoice (PC_Circle_02, "Skeleton", PC_ItRu_SumSkel_Info);
	};
};
FUNC VOID PC_Circle_02_BACK ()
{
	Info_ClearChoices (PC_Circle_02);
};

// Circle 3
INSTANCE PC_Circle_03 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_03_Condition;
	information		= PC_Circle_03_Info;
	permanent		= TRUE;
	description		= "Create 3rd Circle runes"; 
};
FUNC INT PC_Circle_03_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 3)
	&& ((PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_FireFist] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_WaterFist] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SuckEnergy] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_ManaRecovery] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonZombie] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonSkeletons] == TRUE))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_03_Info ()
{
	Info_ClearChoices (PC_Circle_03);
	Info_AddChoice (PC_Circle_03, DIALOG_BACK, PC_Circle_03_BACK);
	if (PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Small Fire Storm", PC_ItRu_Firestorm_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_FireFist] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Fire Fist", PC_ItRu_FireFist_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Ice Lance", PC_ItRu_Icelance_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_WaterFist] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Water Fist", PC_ItRu_Waterfist_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Ice Block", PC_ItRu_IceCube_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Whirlwind", PC_ItRu_Whirlwind_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SuckEnergy] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Steal Energy", PC_RevivedRune_SuckEnergy_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ManaRecovery] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Mana Recovery", PC_RevivedRune_ManaRecovery_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Destroy Undead", PC_ItRu_HarmUndead_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonZombie] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Zombie", PC_RevivedRune_SummonZombie_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonSkeletons] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, "Skeletons", PC_RevivedRune_SummonSkeletons_Info);
	};
};
FUNC VOID PC_Circle_03_BACK ()
{
	Info_ClearChoices (PC_Circle_03);
};

// Circle 4
INSTANCE PC_Circle_04 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_04_Condition;
	information		= PC_Circle_04_Info;
	permanent		= TRUE;
	description		= "Create 4th Circle runes"; 
};
FUNC INT PC_Circle_04_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 4)
	&& ((PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_LargeFireStorm] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Control] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Fear] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Berserk] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Earthquake] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Explode] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_04_Info ()
{
	Info_ClearChoices (PC_Circle_04);
	Info_AddChoice (PC_Circle_04, DIALOG_BACK, PC_Circle_04_BACK);
	if (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Large Fireball", PC_ItRu_ChargeFireball_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Pyrokinesis", PC_ItRu_Pyrokinesis_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_LargeFireStorm] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Large Fire Storm", PC_ItRu_LargeFireStorm_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Geyser", PC_ItRu_Geyser_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Ball Lightning", PC_ItRu_ThunderBall_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Lightning", PC_ItRu_LightningFlash_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Control] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Control", PC_RevivedRune_Control_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Fear] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Fear", PC_ItRu_Fear_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Berserk] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Berserk", PC_RevivedRune_Berserk_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Earthquake] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Earthquake", PC_RevivedRune_Earthquake_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Explode] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Explode", PC_RevivedRune_Explode_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Heal Heavy Wounds", PC_ItRu_FullHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, "Golem", PC_ItRu_SumGol_Info);
	};
};
FUNC VOID PC_Circle_04_BACK ()
{
	Info_ClearChoices (PC_Circle_04);
};

// Circle 5
INSTANCE PC_Circle_05 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_05_Condition;
	information		= PC_Circle_05_Info;
	permanent		= TRUE;
	description		= "Create 5th Circle runes"; 
};
FUNC INT PC_Circle_05_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 5)
	&& ((PLAYER_TALENT_RUNES[SPL_Extricate] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Inflate] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Energyball] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonGuardian] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_05_Info ()
{
	Info_ClearChoices (PC_Circle_05);
	Info_AddChoice (PC_Circle_05, DIALOG_BACK, PC_Circle_05_BACK);
	if (PLAYER_TALENT_RUNES[SPL_Extricate] == TRUE)
	{
		Info_AddChoice (PC_Circle_05, "Extricate", PC_ItRu_Extricate_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Inflate] == TRUE)
	{
		Info_AddChoice (PC_Circle_05, "Inflate", PC_RevivedRune_Inflate_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Energyball] == TRUE)
	{
		Info_AddChoice (PC_Circle_05, "Beliar's Wrath", PC_RevivedRune_Energyball_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonGuardian] == TRUE)
	{
		Info_AddChoice (PC_Circle_05, "Guardian", PC_RevivedRune_SummonGuardian_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE)
	{
		Info_AddChoice (PC_Circle_05, "Demon", PC_ItRu_SumDemon_Info);
	};
};
FUNC VOID PC_Circle_05_BACK ()
{
	Info_ClearChoices (PC_Circle_05);
};

// Circle 6
INSTANCE PC_Circle_06 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_06_Condition;
	information		= PC_Circle_06_Info;
	permanent		= TRUE;
	description		= "Create 6th Circle runes"; 
};
FUNC INT PC_Circle_06_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_MAKERUNE)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	&& ((PLAYER_TALENT_RUNES[SPL_FireWave] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_Skull] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE)
	|| (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE))
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_06_Info ()
{
	Info_ClearChoices (PC_Circle_06);
	Info_AddChoice (PC_Circle_06, DIALOG_BACK, PC_Circle_06_BACK);
	if (PLAYER_TALENT_RUNES[SPL_FireWave] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Fire Wave", PC_ItRu_FireWave_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Fire Rain", PC_ItRu_Firerain_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Ice Wave", PC_ItRu_IceWave_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Thunderstorm", PC_ItRu_Thunderstorm_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Skull] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Cry of the Dead", PC_RevivedRune_Skull_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Holy Missile", PC_SPL_MasterOfDisaster_Create);
	};
	if (PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Breath of Death", PC_ItRu_BreathOfDeath_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Wave of Death", PC_ItRu_MassDeath_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)
	{
		Info_AddChoice (PC_Circle_06, "Army of Darkness", PC_ItRu_ArmyOfDarkness_Info);
	};
};
FUNC VOID PC_Circle_06_BACK ()
{
	Info_ClearChoices (PC_Circle_06);
};

FUNC VOID PC_SPL_MasterOfDisaster_Create()
{
	if 	(Npc_HasItems (hero, ItMi_HolyWater) 	>= 1)
	{
		Npc_RemoveInvItems (hero,ItMi_HolyWater  ,1);
		CreateInvItems 	   (hero,ItRu_MasterOfDisaster,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
INSTANCE PC_SPL_PalTeleportSecret (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_SPL_PalTeleportSecret_Condition;
	information		= PC_SPL_PalTeleportSecret_Info;
	permanent		= TRUE;
	description		= "Create teleport rune"; 
};
FUNC INT PC_SPL_PalTeleportSecret_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& (PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == TRUE  ))
	{
		return TRUE;
	};
};
FUNC VOID PC_SPL_PalTeleportSecret_Info()

{
	Info_ClearChoices (PC_SPL_PalTeleportSecret);
	
	Info_AddChoice 	  (PC_SPL_PalTeleportSecret,DIALOG_BACK,PC_SPL_PalTeleportSecret_BACK);
	if (PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == TRUE)
	{
		Info_AddChoice 	  (PC_SPL_PalTeleportSecret,"The secret of the library!",PC_SPL_PalTeleportSecret_Create);
	};
	
};	
FUNC VOID PC_SPL_PalTeleportSecret_BACK()
{
	Info_ClearChoices (PC_SPL_PalTeleportSecret);
};

FUNC VOID PC_SPL_PalTeleportSecret_Create()
{
	if 	(Npc_HasItems (hero, ItMi_HolyWater) 	>= 1)
	{
		Npc_RemoveInvItems (hero,ItMi_HolyWater  ,1);
		CreateInvItems 	   (hero,ItRu_PalTeleportSecret,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
FUNC VOID PC_ItRu_Light_Info ()
{
	if (Npc_HasItems (hero, ItSc_Light) >= 1)
	&& (Npc_HasItems (hero, ItMi_Gold)  >= 1)
	
	{
		Npc_RemoveInvItems  (hero,ItSc_Light, 1);
		Npc_RemoveInvItems  (hero,ItMI_Gold, 1);
		
		CreateInvItems 	   (hero,ItRu_Light,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_Firebolt_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firebolt) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur)   >= 1)
	
	{
		Npc_RemoveInvItems  (hero,ItSc_Firebolt, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur, 1);
		
		CreateInvItems 	    (hero,ItRu_Firebolt,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_LightHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_LightHeal) >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_LightHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_01,1);
		
		
		CreateInvItems 	   (hero,ItRu_LightHeal,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_SumGobSkel_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGobSkel) >= 1)
	&& (Npc_HasItems (hero, ItAt_GoblinBone) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGobSkel, 1);
		Npc_RemoveInvItems  (hero,ItAt_GoblinBone, 1);
		
		
		CreateInvItems 	    (hero,ItRu_SumGobSkel,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_Zap_Info ()
{
	if (Npc_HasItems (hero, ItSc_Zap) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Zap, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,1);
	
		
		CreateInvItems 	   (hero,ItRu_Zap,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_InstFireball_Info ()
{
	if (Npc_HasItems (hero, ItSc_InstantFireball) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_InstantFireball, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1);
		
		
		CreateInvItems 	   (hero,ItRu_InstantFireball,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_Icebolt_Info ()
{
	if (Npc_HasItems (hero, ItSc_Icebolt) >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz)  >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Icebolt, 1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1);

		
		CreateInvItems 	   (hero,ItRu_Icebolt,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_Windfist_Info ()
{
	if (Npc_HasItems (hero, ItSc_Windfist) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Windfist, 1);
		Npc_RemoveInvItems  (hero,ItMi_Coal, 	 1);

		
		CreateInvItems 	   (hero,ItRu_Windfist,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_FireFist_Info ()
{
	if (Npc_HasItems (hero, ITSC_REVIVED_FIREFIST) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero, ITSC_REVIVED_FIREFIST, 1);
		Npc_RemoveInvItems  (hero, ItMi_Coal, 1);
		Npc_RemoveInvItems  (hero, ItMi_Pitch, 1);

		CreateInvItems     (hero, ITRU_REVIVED_FIREFIST, 1);
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_Sleep_Info ()
{
	if (Npc_HasItems (hero, ItSc_Sleep) >= 1)
	&& (Npc_HasItems (hero, ItPl_Swampherb) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Sleep, 1);
		Npc_RemoveInvItems  (hero,ItPl_Swampherb, 1);
		
		CreateInvItems 	   (hero,ItRu_Sleep,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_MediumHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_MediumHeal) >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_MediumHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_02,  1);
		
		CreateInvItems 	   (hero,ItRu_MediumHeal,1); 
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_LightningFlash_Info ()
{
	if (Npc_HasItems (hero, ItSc_LightningFlash) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_LightningFlash, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,    1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		
		CreateInvItems 	   (hero,ItRu_LightningFlash,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_ChargeFireball_Info ()
{
	if (Npc_HasItems (hero, ItSc_ChargeFireball) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_ChargeFireball, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,1	);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1);
		
		CreateInvItem 	   (hero,ItRu_ChargeFireball); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_SumSkel_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumSkel) >= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumSkel, 1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,1	);
		
		CreateInvItems 	   (hero,ItRu_SumSkel,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_Fear_Info ()
{
	if (Npc_HasItems (hero, ItSc_Fear) >= 1)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Fear, 1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,1	);
		
		CreateInvItems 	   (hero,ItRu_Fear,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_IceCube_Info ()
{
	if (Npc_HasItems (hero, ItSc_IceCube) >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_IceCube, 1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		
		CreateInvItems 	   (hero,ItRu_IceCube,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_ThunderBall_Info ()
{
	if (Npc_HasItems (hero, ItSc_ThunderBall) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Sulfur) 	  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_ThunderBall, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,	1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,  	1);
		
		CreateInvItems 	   (hero,ItRu_ThunderBall,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_ConcussionBolt_Info ()
{
    if (Npc_HasItems (hero, ITSC_REVIVED_CONCUSSIONBOLT) >= 1)
    && (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)
    && (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
    {
        Npc_RemoveInvItems  (hero, ITSC_REVIVED_CONCUSSIONBOLT, 1);
        Npc_RemoveInvItems  (hero, ItMi_Rockcrystal, 1);
        Npc_RemoveInvItems  (hero, ItMi_Sulfur, 1);

        CreateInvItems      (hero, ITRU_REVIVED_CONCUSSIONBOLT, 1);
        Print (PRINT_RunESuccess);
    }
    else
    {
        Print (PRINT_ProdItemsMissing);
        CreateInvItems (self, ItMi_RuneBlank, 1);
    };
    B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_SumGol_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGol) >= 1)
	&& (Npc_HasItems (hero, ItAt_StoneGolemHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGol, 1);
		Npc_RemoveInvItems  (hero,ItAt_StoneGolemHeart,1);
		
		
		CreateInvItems 	   (hero,ItRu_SumGol,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_HarmUndead_Info ()
{
	if (Npc_HasItems (hero, ItSc_HarmUndead) >= 1)
	&& (Npc_HasItems (hero, ItMi_HolyWater)  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_HarmUndead, 1);
		Npc_RemoveInvItems  (hero,ItMi_HolyWater,  1);
		
		
		CreateInvItems 	   (hero,ItRu_HarmUndead,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_LargeFireStorm_Info ()
{
	if (Npc_HasItems (hero, ItSc_LargeFireStorm) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)		
	{
		Npc_RemoveInvItems  (hero,ItSc_LargeFireStorm, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,1	);
		Npc_RemoveInvItems  (hero,ItAt_WaranFiretongue,1);
		
		CreateInvItems 	   (hero,ItRu_LargeFireStorm,1);
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_Firestorm_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firestorm) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Firestorm, 		1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch, 			1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur, 			1);
	
		CreateInvItems 	   (hero,ItRu_Firestorm,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_IceWave_Info ()
{
	if (Npc_HasItems (hero, ItSc_IceWave) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) 	 >= 1)	
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_IceWave,   1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,    1);
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1);
		
		CreateInvItems 	   (hero,ItRu_IceWave,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_FireWave_Info ()
{
	if (Npc_HasItems (hero, ITSC_REVIVED_FIREWAVE) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)
	{
		Npc_RemoveInvItems  (hero, ITSC_REVIVED_FIREWAVE, 1);
		Npc_RemoveInvItems  (hero, ItMi_Sulfur, 1);
		Npc_RemoveInvItems  (hero, ItAt_WaranFiretongue, 1);

		CreateInvItems     (hero, ITRU_REVIVED_FIREWAVE, 1);
		Print (PRINT_RunESuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_SumDemon_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumDemon) >= 1)
	&& (Npc_HasItems (hero, ItAt_DemonHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumDemon, 1);
		Npc_RemoveInvItems  (hero,ItAt_DemonHeart,1);
		
		CreateInvItems 	   (hero,ItRu_SumDemon,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_FullHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_FullHeal) 		 >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_03) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_FullHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_03,1	);
		
		CreateInvItems 	   (hero,ItRu_FullHeal,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_Firerain_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firerain)  >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) 	>= 1)
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Firerain, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,	 1);
		Npc_RemoveInvItems  (hero,ItAt_WaranFiretongue,	1);
		
		CreateInvItems 	   (hero,ItRu_Firerain,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_BreathOfDeath_Info ()
{
	if (Npc_HasItems (hero, ItSc_BreathOfDeath) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) 			>= 1)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 	>= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_BreathOfDeath, 1);
		Npc_RemoveInvItems  (hero,ItMi_Coal,	 1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,1);
		
		CreateInvItems 	   (hero,ItRu_BreathOfDeath,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();			
};
//*******************************************************
FUNC VOID PC_ItRu_MassDeath_Info ()
{
	if (Npc_HasItems (hero, ItSc_MassDeath) 	  >= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone) 	  >= 1)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 	  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_MassDeath, 	1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,	1);
		
		CreateInvItems 	   (hero,ItRu_MassDeath,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_ArmyOfDarkness_Info ()
{
	if (Npc_HasItems (hero, ItSc_ArmyOfDarkness)		>= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone)			>= 1)	
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 			>= 1)	
	&& (Npc_HasItems (hero, ItAt_StoneGolemHeart) 		>= 1)	
	&& (Npc_HasItems (hero, ItAt_DemonHeart) 			>= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_ArmyOfDarkness, 		1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,		1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,			1);
		Npc_RemoveInvItems  (hero,ItAt_StoneGolemHeart,		1);
		Npc_RemoveInvItems  (hero,ItAt_DemonHeart,			1);
		
		CreateInvItems 	   (hero,ItRu_ArmyOfDarkness,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
}; 
//*******************************************************
FUNC VOID PC_ItRu_Shrink_Info ()
{
	if (Npc_HasItems (hero, ItSc_Shrink) 	 >= 1)
	&& (Npc_HasItems (hero, ItAt_GoblinBone) >= 1)	
	&& (Npc_HasItems (hero, ItAt_TrollTooth) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Shrink, 	  1 );
		Npc_RemoveInvItems  (hero,ItAt_GoblinBone,1	);
		Npc_RemoveInvItems  (hero,ItAt_TrollTooth,1	);
		
		CreateInvItems 	   (hero,ItRu_Shrink,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

//##########################################
//			Addon
//##########################################


FUNC VOID PC_ItRu_Whirlwind_Info ()
{
	if (Npc_HasItems (hero, ItSc_Whirlwind) 	 >= 1)
	&& (Npc_HasItems (hero, ItAt_Wing) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Whirlwind, 	  1 );
		Npc_RemoveInvItems  (hero,ItAt_Wing,1	);
		
		CreateInvItems 	   (hero,ItRu_Whirlwind,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Icelance_Info ()
{
	if (Npc_HasItems (hero, ItSc_Icelance) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Icelance, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		
		CreateInvItems 	   (hero,ItRu_Icelance,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Thunderstorm_Info ()
{
	if (Npc_HasItems (hero, ItSc_Thunderstorm) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	&& (Npc_HasItems (hero, ItAt_Wing) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Thunderstorm, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		Npc_RemoveInvItems  (hero,ItAt_Wing,1	);
		
		CreateInvItems 	   (hero,ItRu_Thunderstorm,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Geyser_Info ()
{
	if (Npc_HasItems (hero, ItSc_Geyser) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Geyser, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		
		CreateInvItems 	   (hero,ItRu_Geyser,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Waterfist_Info ()
{
	if (Npc_HasItems (hero, ItSc_Waterfist) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Waterfist, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,1	);
		
		CreateInvItems 	   (hero,ItRu_Waterfist,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Pyrokinesis_Info ()
{
	if (Npc_HasItems (hero, ITSC_REVIVED_PYROKINESIS) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	{
		Npc_RemoveInvItems (hero, ITSC_REVIVED_PYROKINESIS, 1);
		Npc_RemoveInvItems (hero, ItMi_Coal, 1);
		Npc_RemoveInvItems (hero, ItMi_Sulfur, 1);
		CreateInvItems (hero, ITRU_REVIVED_PYROKINESIS, 1);
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank, 1);
	};
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_ItRu_Extricate_Info ()
{
	if (Npc_HasItems (hero, ITSC_REVIVED_EXTRICATE) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)
	{
		Npc_RemoveInvItems (hero, ITSC_REVIVED_EXTRICATE, 1);
		Npc_RemoveInvItems (hero, ItMi_Pitch, 1);
		Npc_RemoveInvItems (hero, ItAt_WaranFiretongue, 1);
		CreateInvItems (hero, ITRU_REVIVED_EXTRICATE, 1);
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank, 1);
	};
	B_ENDPRODUCTIONDIALOG ();
};

// Provisional single-ingredient recipes for spells without a vanilla rune formula.
FUNC VOID PC_RevivedRune_CraftSimple (var int scrollItem, var int ingredientItem, var int runeItem)
{
	if (Npc_HasItems (hero, scrollItem) >= 1)
	&& (Npc_HasItems (hero, ingredientItem) >= 1)
	{
		Npc_RemoveInvItems (hero, scrollItem, 1);
		Npc_RemoveInvItems (hero, ingredientItem, 1);
		CreateInvItems (hero, runeItem, 1);
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank, 1);
	};
	B_ENDPRODUCTIONDIALOG ();
};

FUNC VOID PC_RevivedRune_Inflate_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_INFLATE, ItMi_Rockcrystal, ITRU_REVIVED_INFLATE);
};

FUNC VOID PC_RevivedRune_Charm_Info ()
{
	PC_RevivedRune_CraftSimple (ItSc_Charm, ItMi_Coal, ITRU_REVIVED_CHARM);
};

FUNC VOID PC_RevivedRune_Telekinesis_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_TELEKINESIS, ItMi_Coal, ITRU_REVIVED_TELEKINESIS);
};

FUNC VOID PC_RevivedRune_Control_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_CONTROL, ItMi_Coal, ITRU_REVIVED_CONTROL);
};

FUNC VOID PC_RevivedRune_Berserk_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_BERSERK, ItMi_Coal, ITRU_REVIVED_BERSERK);
};

FUNC VOID PC_RevivedRune_Earthquake_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_EARTHQUAKE, ItMi_Coal, ITRU_REVIVED_EARTHQUAKE);
};

FUNC VOID PC_RevivedRune_Swarm_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_SWARM, ItMi_DarkPearl, ItRu_Swarm);
};

FUNC VOID PC_RevivedRune_GreenTentacle_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_ROOTSNARE, ItMi_DarkPearl, ItRu_GreenTentacle);
};

FUNC VOID PC_RevivedRune_SuckEnergy_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_STEALENERGY, ItMi_DarkPearl, ItRu_SuckEnergy);
};

FUNC VOID PC_RevivedRune_ManaRecovery_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_MANARECOVERY, ItMi_DarkPearl, ITRU_REVIVED_MANARECOVERY);
};

FUNC VOID PC_RevivedRune_Explode_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_EXPLODE, ItMi_DarkPearl, ITRU_REVIVED_EXPLODE);
};

FUNC VOID PC_RevivedRune_Energyball_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_BELIARSWRATH, ItMi_DarkPearl, ItRu_BeliarsRage);
};

FUNC VOID PC_RevivedRune_Skull_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_CRYOFTHEDEAD, ItMi_DarkPearl, ItRu_Skull);
};

FUNC VOID PC_RevivedRune_SummonWolf_Info ()
{
	PC_RevivedRune_CraftSimple (ItSc_SumWolf, ItAt_WolfFur, ItRu_SumWolf);
};

FUNC VOID PC_RevivedRune_SummonZombie_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_ZOMBIE, ItAt_SkeletonBone, ItRu_SummonZombie);
};

FUNC VOID PC_RevivedRune_SummonSkeletons_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_SUMMONSKELETONS, ItAt_SkeletonBone, ITRU_REVIVED_SUMMONSKELETONS);
};

FUNC VOID PC_RevivedRune_SummonGuardian_Info ()
{
	PC_RevivedRune_CraftSimple (ITSC_REVIVED_GUARDIAN, ItAt_StoneGolemHeart, ItRu_SummonGuardian);
};
