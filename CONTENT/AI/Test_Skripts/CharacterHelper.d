//**************************************
//Characterhelper
//**************************************
	INSTANCE MobsiBrief		(C_Item)
{
	name 				=	"Workbench recovery note";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseMobsiBrief;
	scemeName			=	"MAP";
	description			= 	"Workbench recovery note";
};
func void UseMobsiBrief ()
{
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE]=FALSE;
	
		var int nDocID;

		nDocID =	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID,  0, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, "Workbench recovery"									);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Your workbench session has been cleared."						);
					Doc_PrintLines	(nDocID,  0, "PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;"			);
					Doc_PrintLines	(nDocID,  0, "self.aivar[AIV_INVINCIBLE] = FALSE;"				);
					Doc_Show		(nDocID);
};
//****************************************************************************
//				Sack voll neuer addon waffen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_Addon_Sack (C_Item)
{	
	name 				=	"Bag of weapons";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Sack;

	description			= 	name;
	TEXT[2]				= 	"Contains an assortment of weapons.";
	
};

	FUNC VOID Use_Sack()
	{
		Print("You found a cache of weapons.");
		
		CreateInvItems (self, ItMW_Addon_Knife01,1);
		CreateInvItems (self, ItMW_Addon_Stab01,1);
		CreateInvItems (self, ItMW_Addon_Stab02,1);
		CreateInvItems (self, ItMW_Addon_Stab03,1);
		CreateInvItems (self, ItMW_Addon_Stab04,1);
		CreateInvItems (self, ItMW_Addon_Stab05,1);
		CreateInvItems (self, ItMW_Addon_Hacker_1h_01,1);
		CreateInvItems (self, ItMW_Addon_Hacker_2h_01,1);
		CreateInvItems (self, ItMW_Addon_Hacker_2h_02,1);
		CreateInvItems (self, ItMW_Addon_Hacker_1h_02,1);
		CreateInvItems (self, ItMW_Addon_Keule_1h_01,1);
		
		CreateInvItems (self, ItMW_Addon_Keule_2h_01,1);
		
	};

INSTANCE CH (NPC_DEFAULT)
{
// ------ NSC ------
	name 		= "Character Helper";
	guild 		= GIL_NONE;
	id 			= 0;
	voice 		= 15;
	flags       = 0 ;																
	npctype		= NPCTYPE_FRIEND ;
	
	//aivars
	aivar[AIV_IgnoresArmor] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	//B_SetFightSkills (self, 70); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcFullVisual (self, MALE, "Hum_Head_Pony", Face_Special_Hero, Body_Special_Hero2, Body_Player, Teeth_Normal, NO_ARMOR);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_0;
};

FUNC VOID Rtn_Start_0 ()
{	
	TA_Stand_ArmsCrossed(08,00,23,00,"XXX");
    TA_Stand_ArmsCrossed(23,00,08,00,"XXX");
};
//***************************************************************************
//	Hero bekommt Level (1-50)
//***************************************************************************
func void CH_SetLevelStats (var int targetLevel)
{
	// Keep extra hit points from equipment and permanent bonuses when changing levels.
	var int bonusHP;
	bonusHP = hero.attribute[ATR_HITPOINTS_MAX] - (40 + hero.level * HP_PER_LEVEL);
	if (bonusHP < 0)
	{
		bonusHP = 0;
	};
	hero.level = targetLevel;
	hero.exp = 250 * targetLevel * (targetLevel + 1);
	hero.exp_next = hero.exp + 500 * (targetLevel + 1);
	hero.LP = targetLevel * LP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS_MAX] = 40 + targetLevel * HP_PER_LEVEL + bonusHP;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};
//***************************************************************************
//	Hero bekommt Waffe 
//***************************************************************************
func void B_SetHeroWeapon()
{
	if (hero.level <= 6)
	{
		CreateInvItem (hero, ITMW_REVIVED_1H_SWORD_OLD_01);
		CreateInvItem (hero, ITMW_REVIVED_2H_PICKAXE);
		CreateInvItem (hero, ITRW_REVIVED_BOW_SMALL_01);
		CreateInvItem (hero, ITRW_REVIVED_CROSSBOW_LIGHT_01);
	}
	else if (hero.level <= 12)
	{
		CreateInvItem (hero, ITMW_REVIVED_1H_SWORD_SHORT_04);
		CreateInvItem (hero, ITMW_REVIVED_2H_STAFF_02);
		CreateInvItem (hero, ITRW_REVIVED_BOW_LONG_01);
		CreateInvItem (hero, ITRW_REVIVED_CROSSBOW_LIGHT_02);
	}
	else if (hero.level <= 18)
	{
		CreateInvItem (hero, ITMW_REVIVED_1H_SWORD_02);
		CreateInvItem (hero, ITMW_REVIVED_2H_SWORD_LIGHT_01);
		CreateInvItem (hero, ITRW_REVIVED_BOW_LONG_02);
		CreateInvItem (hero, ITRW_REVIVED_CROSSBOW_01);
	}
	else if (hero.level <= 24)
	{
		CreateInvItem (hero, ITMW_REVIVED_1H_SWORD_BROAD_01);
		CreateInvItem (hero, ITMW_REVIVED_2H_SWORD_LIGHT_03);
		CreateInvItem (hero, ITRW_REVIVED_BOW_LONG_03);
		CreateInvItem (hero, ITRW_REVIVED_CROSSBOW_02);
	}
	else if (hero.level <= 30)
	{
		CreateInvItem (hero, ITMW_REVIVED_1H_SWORD_BASTARD_01);
		CreateInvItem (hero, ITMW_REVIVED_2H_SWORD_01);
		CreateInvItem (hero, ITRW_REVIVED_BOW_LONG_04);
		CreateInvItem (hero, ITRW_REVIVED_CROSSBOW_04);
	}
	else if (hero.level <= 36)
	{
		CreateInvItem (hero, ITMW_REVIVED_1H_SWORD_BASTARD_02);
		CreateInvItem (hero, ITMW_REVIVED_2H_SWORD_HEAVY_01);
		CreateInvItem (hero, ITRW_REVIVED_BOW_LONG_07);
		CreateInvItem (hero, ITRW_REVIVED_CROSSBOW_HEAVY_01);
	}
	else
	{
		CreateInvItem (hero, ITMW_REVIVED_1H_SWORD_BASTARD_03);
		CreateInvItem (hero, ITMW_REVIVED_2H_SWORD_HEAVY_03);
		CreateInvItem (hero, ITRW_REVIVED_BOW_WAR_01);
		CreateInvItem (hero, ITRW_REVIVED_CROSSBOW_HEAVY_03);
	};
	AI_EquipBestMeleeWeapon (hero);
	AI_EquipBestRangedWeapon (hero);
};
//***************************************************************************
//	Hero bekommt Ausrüstung
//***************************************************************************
func void B_SetHeroEquipment()
{
	
    CreateInvItems(hero,ItRw_Arrow,100);
    CreateInvItems(hero,ItRw_Bolt,100);
    CreateInvItems(hero,ItLsTorch,30);
    CreateInvItems(hero,ItMi_Gold,500);
    CreateInvItems(hero,ITPO_REVIVED_HEALTH_03,5);
    CreateInvItems(hero,ITPO_REVIVED_MANA_03,5);
    CreateInvItems(hero,ItKe_Lockpick,30);
  
};

func void CH_ApplyLevelPreset (var int targetLevel)
{
	CH_SetLevelStats (targetLevel);
	B_SetHeroWeapon();
	B_SetHeroEquipment();

	var string summary;
	summary = ConcatStrings ("Level ", IntToString (targetLevel));
	summary = ConcatStrings (summary, "   Learning points: ");
	summary = ConcatStrings (summary, IntToString (hero.LP));
	summary = ConcatStrings (summary, "   Hit points: ");
	summary = ConcatStrings (summary, IntToString (hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen (summary, -1, -1, FONT_Screen, 3);
	Snd_Play ("LEVELUP");
};
//***************************************************************************
//	KDF bekommt Runen 
//***************************************************************************
func void CH_GiveMissingItem (var int itemInstance)
{
	if (Npc_HasItems (hero, itemInstance) == 0)
	{
		CreateInvItems (hero, itemInstance, 1);
	};
};

func void B_SetKDFRunes ()
{
	var int circle;
	circle = Npc_GetTalentSkill (hero, NPC_TALENT_MAGE);

	if (circle == 1)
	{
		CH_GiveMissingItem (ItRu_Firebolt);
		CH_GiveMissingItem (ItRu_Icebolt);
		CH_GiveMissingItem (ItRu_Sleep);
		CH_GiveMissingItem (ITRU_REVIVED_CHARM);
		CH_GiveMissingItem (ItRu_Light);
		CH_GiveMissingItem (ItRu_LightHeal);
		CH_GiveMissingItem (ItRu_SumGobSkel);
	}
	else if (circle == 2)
	{
		CH_GiveMissingItem (ItRu_InstantFireball);
		CH_GiveMissingItem (ItRu_Zap);
		CH_GiveMissingItem (ITRU_REVIVED_TELEKINESIS);
		CH_GiveMissingItem (ItRu_Shrink);
		CH_GiveMissingItem (ItRu_Windfist);
		CH_GiveMissingItem (ItRu_Swarm);
		CH_GiveMissingItem (ItRu_GreenTentacle);
		CH_GiveMissingItem (ItRu_MediumHeal);
		CH_GiveMissingItem (ITRU_REVIVED_CONCUSSIONBOLT);
		CH_GiveMissingItem (ItRu_SumWolf);
		CH_GiveMissingItem (ItRu_SumSkel);
	}
	else if (circle == 3)
	{
		CH_GiveMissingItem (ItRu_Firestorm);
		CH_GiveMissingItem (ITRU_REVIVED_FIREFIST);
		CH_GiveMissingItem (ItRu_Icelance);
		CH_GiveMissingItem (ItRu_Waterfist);
		CH_GiveMissingItem (ItRu_IceCube);
		CH_GiveMissingItem (ItRu_Whirlwind);
		CH_GiveMissingItem (ItRu_SuckEnergy);
		CH_GiveMissingItem (ITRU_REVIVED_MANARECOVERY);
		CH_GiveMissingItem (ItRu_HarmUndead);
		CH_GiveMissingItem (ItRu_SummonZombie);
		CH_GiveMissingItem (ITRU_REVIVED_SUMMONSKELETONS);
	}
	else if (circle == 4)
	{
		CH_GiveMissingItem (ItRu_ChargeFireball);
		CH_GiveMissingItem (ITRU_REVIVED_PYROKINESIS);
		CH_GiveMissingItem (ItRu_LargeFireStorm);
		CH_GiveMissingItem (ItRu_Geyser);
		CH_GiveMissingItem (ItRu_ThunderBall);
		CH_GiveMissingItem (ItRu_LightningFlash);
		CH_GiveMissingItem (ITRU_REVIVED_CONTROL);
		CH_GiveMissingItem (ItRu_Fear);
		CH_GiveMissingItem (ITRU_REVIVED_BERSERK);
		CH_GiveMissingItem (ITRU_REVIVED_EARTHQUAKE);
		CH_GiveMissingItem (ITRU_REVIVED_EXPLODE);
		CH_GiveMissingItem (ItRu_FullHeal);
		CH_GiveMissingItem (ItRu_SumGol);
	}
	else if (circle == 5)
	{
		CH_GiveMissingItem (ITRU_REVIVED_EXTRICATE);
		CH_GiveMissingItem (ITRU_REVIVED_INFLATE);
		CH_GiveMissingItem (ItRu_BeliarsRage);
		CH_GiveMissingItem (ItRu_SummonGuardian);
		CH_GiveMissingItem (ItRu_SumDemon);
	}
	else if (circle == 6)
	{
		CH_GiveMissingItem (ITRU_REVIVED_FIREWAVE);
		CH_GiveMissingItem (ItRu_Firerain);
		CH_GiveMissingItem (ItRu_IceWave);
		CH_GiveMissingItem (ItRu_Thunderstorm);
		CH_GiveMissingItem (ItRu_Skull);
		CH_GiveMissingItem (ItRu_MasterOfDisaster);
		CH_GiveMissingItem (ItRu_BreathOfDeath);
		CH_GiveMissingItem (ItRu_MassDeath);
		CH_GiveMissingItem (ItRu_ArmyOfDarkness);
	};
};
//***************************************************************************
//	Paladin bekommt Runen
//***************************************************************************
func void B_SetPaladinEquipment ()
{
	CH_GiveMissingItem (ItRu_PalLight);
	CH_GiveMissingItem (ItRu_PalLightHeal);
	CH_GiveMissingItem (ItRu_PalHolyBolt);
	CH_GiveMissingItem (ItRu_PalMediumHeal);
	CH_GiveMissingItem (ItRu_PalRepelEvil);
	CH_GiveMissingItem (ItRu_PalFullHeal);
	CH_GiveMissingItem (ItRu_PalDestroyEvil);
	CH_GiveMissingItem (ItRu_PalTeleportSecret);
};
//***************************************************************************
//	Rahmen-Infos
// 	Ende
//***************************************************************************
instance  CH_kriegen (C_INFO)
{
	npc			=  CH;
	nr			=  999;
	condition	=  CH_kriegen_Condition;
	information	=  CH_kriegen_Info;
	permanent	=  TRUE;
	description = "Give the helper one ore nugget";
};                       

FUNC int  CH_kriegen_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	&& (Npc_HasItems (other, ItMi_Nugget) >= 1)
	{		
		return TRUE;
	};
};
FUNC VOID  CH_kriegen_Info()
{
	
	B_GiveInvItems (other, self, Itmi_Nugget, 1);
};
//***************************************************************************
//	Rahmen-Infos
// 	Ende
//***************************************************************************
instance  CH_Geben (C_INFO)
{
	npc			=  CH;
	nr			=  999;
	condition	=  CH_Geben_Condition;
	information	=  CH_Geben_Info;
	permanent	=  TRUE;
	description = "Test item message display";
};                       

FUNC int  CH_Geben_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID  CH_Geben_Info()
{
	//B_GiveInvItems (self, other, Itmi_Nugget, 2);
	
		 AI_PrintScreen ("Gave honey",	 -1, 34, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Gave bread",	 -1, 37, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Gave wine",     -1, 40, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Gave sausage",  	 -1, 43, FONT_ScreenSmall, 2);
};
//***************************************************************************
//	Rahmen-Infos
// 	Ende
//***************************************************************************
instance  CH_Exit (C_INFO)
{
	npc			=  CH;
	nr			=  999;
	condition	=  CH_Exit_Condition;
	information	=  CH_Exit_Info;
	permanent	=  TRUE;
	description = DIALOG_ENDE;
};                       

FUNC int  CH_Exit_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID  CH_Exit_Info()
{
	AI_StopProcessInfos	(self);
};
//***************************************************************************/
//	Reset, stellt PC_Hero wieder her, ohne Talente und mit Startwerten 
//***************************************************************************/
instance  CH_RESET (C_INFO)
{
	npc			=  CH;
	nr			=  20;
	condition	=  CH_RESET_Condition;
	information	=  CH_RESET_Info;
	permanent 	=  TRUE;
	description = "Reset level, guild, trained attributes, weapon skills and magic circle";
};                       

FUNC int  CH_RESET_Condition()
{	
	if (LevelStart == TRUE)
	{	
		return TRUE;
	};	
};
// The displayed value includes equipment and other bonuses that trainers do not count.
func int CH_ResetTrainedValue (var int currentValue, var int trainedValue)
{
	if (currentValue > trainedValue)
	{
		return 10 + (currentValue - trainedValue);
	};
	return 10;
};

func void CH_ResetWeaponSkill (var int talent, var int currentValue)
{
	var int trainedValue;
	trainedValue = B_GetRealFightTalentPercent (hero, talent);
	B_RaiseFightTalent (hero, talent, CH_ResetTrainedValue (currentValue, trainedValue) - currentValue);
	B_RaiseRealFightTalentPercent (hero, talent, 10 - trainedValue);
};

func void CH_RESET_Info()
{
	hero.guild = GIL_NONE;
	Npc_SetTrueGuild (hero, GIL_NONE);
	AI_UnequipArmor (hero);
	CH_SetLevelStats (0);

	hero.attribute[ATR_STRENGTH] = CH_ResetTrainedValue (hero.attribute[ATR_STRENGTH], hero.aivar[REAL_STRENGTH]);
	hero.attribute[ATR_DEXTERITY] = CH_ResetTrainedValue (hero.attribute[ATR_DEXTERITY], hero.aivar[REAL_DEXTERITY]);
	hero.attribute[ATR_MANA_MAX] = CH_ResetTrainedValue (hero.attribute[ATR_MANA_MAX], hero.aivar[REAL_MANA_MAX]);
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	hero.aivar[REAL_STRENGTH] = 10;
	hero.aivar[REAL_DEXTERITY] = 10;
	hero.aivar[REAL_MANA_MAX] = 10;

	CH_ResetWeaponSkill (NPC_TALENT_1H, hero.HitChance[NPC_TALENT_1H]);
	CH_ResetWeaponSkill (NPC_TALENT_2H, hero.HitChance[NPC_TALENT_2H]);
	CH_ResetWeaponSkill (NPC_TALENT_BOW, hero.HitChance[NPC_TALENT_BOW]);
	CH_ResetWeaponSkill (NPC_TALENT_CROSSBOW, hero.HitChance[NPC_TALENT_CROSSBOW]);
	Npc_SetTalentSkill (hero, NPC_TALENT_MAGE, 0);
	PrintScreen ("Level and combat training reset.", -1, -1, FONT_Screen, 2);
};

//***************************************************************************
//	Language
//***************************************************************************

func string CH_LessonPrice (var string label, var int talent, var int skill)
{
	return B_BuildLearnString (label, B_GetLearnCostTalent (other, talent, skill));
};

// Book and discovery recipes do not spend learning points.
func void CH_RecordRecipe (var int talent, var string topic, var string entry)
{
	Npc_SetTalentSkill (other, talent, 1);
	Log_CreateTopic (topic, LOG_NOTE);
	B_LogEntry (topic, entry);
};

INSTANCE CH_Language (C_INFO)
{
	npc				= CH;
	nr				= 7;
	condition		= CH_AtMiscMenu;
	information		= CH_Language_Info;
	important		= 0;
	permanent		= 1;
	description		= "Languages of the Builders";
};

func VOID CH_Language_Info()
{
	Info_ClearChoices (CH_Language);
	Info_AddChoice (CH_Language, DIALOG_BACK, CH_Language_BACK);
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		Info_AddChoice (CH_Language, "Language of the priests (3)", CH_Language_Priest);
	};
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		Info_AddChoice (CH_Language, "Language of the warriors (2)", CH_Language_Warrior);
	};
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice (CH_Language, "Language of the peasants (1)", CH_Language_Peasant);
	};
};
func void CH_Language_BACK ()
{
	Info_ClearChoices	(CH_Language);
};
func void CH_Language_Peasant ()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
	Npc_SetTalentSkill (other, NPC_TALENT_FOREIGNLANGUAGE, 1);
	CH_Language_Info();
};
func void CH_Language_Warrior ()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
	Npc_SetTalentSkill (other, NPC_TALENT_FOREIGNLANGUAGE, 1);
	CH_Language_Info();
};
func void CH_Language_Priest ()
{
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
	PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
	Npc_SetTalentSkill (other, NPC_TALENT_FOREIGNLANGUAGE, 1);
	CH_Language_Info();
};

//***************************************************************************
//	Gildenwahl
//***************************************************************************

INSTANCE CH_Guild (C_INFO)
{
	npc				= CH;
	nr				= 7;
	condition		= CH_Guild_Condition;
	information		= CH_Guild_Info;
	important		= 0;
	permanent		= 1;
	description		= "Choose a guild";
};

FUNC INT CH_Guild_Condition()
{
	if (LevelStart == TRUE)
	{		
		return TRUE;
	};
};
func VOID CH_Guild_Info()
{
    Info_ClearChoices	(CH_Guild);
    Info_AddChoice	(CH_Guild, DIALOG_BACK		, CH_Guild_BACK);
    Info_AddChoice	(CH_Guild, "Novice"      	, CH_NOV);
    Info_AddChoice	(CH_Guild, "Fire Mage"       		, CH_KDF);
    Info_AddChoice	(CH_Guild, "Mercenary"   		, CH_SLD);
    Info_AddChoice	(CH_Guild, "Dragon Hunter"       , CH_DJG);
    Info_AddChoice	(CH_Guild, "Militia"       	, CH_MIL);
    Info_AddChoice	(CH_Guild, "Paladin"  		, CH_PAL);
    Info_AddChoice	(CH_Guild, "Guildless"        	, CH_NONE);
    Info_AddChoice 	(CH_Guild, "Wear a bandit disguise"        , CH_FakeBandit);
};
func void CH_Guild_BACK()
{
	Info_ClearChoices	(CH_Guild);
};
FUNC VOID CH_FakeBandit()
{
	Info_ClearChoices (CH_Guild);
	// These are the disguises recognized by C_PlayerIsFakeBandit.
	CH_GiveMissingItem (ITAR_BDT_M);
	CH_GiveMissingItem (ITAR_BDT_H);
	CH_GiveMissingItem (ITAR_Thorus_Addon);
	AI_EquipArmor (hero, ITAR_BDT_H);
};

func void CH_SetGuildWithArmor (var int guildId, var int armorItem)
{
	Info_ClearChoices (CH_Guild);
	hero.guild = guildId;
	Npc_SetTrueGuild (hero, guildId);
	CH_GiveMissingItem (armorItem);
	AI_EquipArmor (hero, armorItem);
};

func void CH_NOV()
{
	CH_SetGuildWithArmor (GIL_NOV, ITAR_NOV_L);
};

func void CH_KDF()
{
	CH_SetGuildWithArmor (GIL_KDF, ITAR_KDF_L);
};

func void CH_SLD()
{
	CH_SetGuildWithArmor (GIL_SLD, ITAR_REVIVED_SLD_L);
};

func void CH_DJG()
{
	CH_SetGuildWithArmor (GIL_DJG, ITAR_REVIVED_DJG_L);
};

func void CH_MIL()
{
	CH_SetGuildWithArmor (GIL_MIL, ITAR_REVIVED_MIL_L);
};

func void CH_PAL()
{
	CH_SetGuildWithArmor (GIL_PAL, ITAR_REVIVED_PAL_H);
	B_SetPaladinEquipment ();
};

func void CH_NONE()
{
	Info_ClearChoices	(CH_Guild);
	
	other.guild = GIL_NONE;
	Npc_SetTrueGuild (other, GIL_NONE);
	AI_UnequipArmor(hero);
};  
	


//***************************************************************************
//	E1 Levelwahl und Lernpunkte
//***************************************************************************
//---------------------
var int LevelStart ;
//---------------------
INSTANCE CH_Level_Start (C_INFO)
{
	npc				= CH;
	condition		= CH_Level_Start_Condition;
	information		= CH_Level_Start_Info;
	description		= "Level, learning points and guild";
	permanent		=  TRUE;
};

FUNC INT CH_Level_Start_Condition()
{	
	if (LevelStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{
		return TRUE;
	};
};
func VOID CH_Level_Start_Info()
{
	LevelStart = TRUE; 
};
//***************************************************************************
//	E2 Level Stopper 
//***************************************************************************
INSTANCE CH_Level_Stopper (C_INFO)
{
	npc				= CH;
	nr 				= 99;
	condition		= CH_Level_Stopper_Condition;
	information		= CH_Level_Stopper_Info;
	description		= DIALOG_BACK;
	permanent		=  TRUE;
};

FUNC INT CH_Level_Stopper_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Level_Stopper_Info()
{
	Info_ClearChoices (CH_Level_Stopper);
	LevelStart = FALSE; 
};
//***************************************************************************
//	E2  Lernpunkte
//***************************************************************************
INSTANCE CH_Lernpunkte (C_INFO)
{
	npc				= CH;
	nr 				=  5;
	condition		= CH_Lernpunkte_Condition;
	information		= CH_Lernpunkte_Info;
	description		= "Learning points";
	permanent		=  TRUE;
};

FUNC INT CH_Lernpunkte_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Lernpunkte_Info()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	Info_AddChoice (CH_Lernpunkte,DIALOG_BACK      ,CH_Lernpunkte_BACK);
	Info_AddChoice (CH_Lernpunkte,"Add 50 learning points",CH_Lernpunkte_50);
	Info_AddChoice (CH_Lernpunkte,"Add 25 learning points",CH_Lernpunkte_25);
	Info_AddChoice (CH_Lernpunkte,"Add 10 learning points",CH_Lernpunkte_10);
	Info_AddChoice (CH_Lernpunkte,"Add 5 learning points",CH_Lernpunkte_5);
};
FUNC VOID CH_Lernpunkte_BACK ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
};
FUNC VOID CH_Lernpunkte_50 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 50);
	PrintScreen  ("+50 learning points", -1,-1,FONT_Screen,3);
	Snd_Play ("LEVELUP");    
};
FUNC VOID CH_Lernpunkte_25 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 25);
	PrintScreen  ("+25 learning points", -1,-1,FONT_Screen,3);
	 Snd_Play ("LEVELUP");    
};
FUNC VOID CH_Lernpunkte_10 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 10);
	PrintScreen  ("+10 learning points", -1,-1,FONT_Screen,3);
	 Snd_Play ("LEVELUP");    
};
FUNC VOID CH_Lernpunkte_5 ()
{
	Info_ClearChoices (CH_Lernpunkte);
	
	hero.LP = (hero.LP + 5);
	PrintScreen  ("+5 learning points", -1,-1,FONT_Screen,3);
	 Snd_Play ("LEVELUP");    
};
//***************************************************************************
//	Levelwahl 1- 25
//***************************************************************************
INSTANCE CH_Level_niedrig (C_INFO)
{
	npc				= CH;
	nr 				=  2;
	condition		= CH_Level_niedrig_Condition;
	information		= CH_Level_niedrig_Info;
	description		= "Set level (1-25)";
	permanent		=  TRUE;
};

FUNC INT CH_Level_niedrig_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Level_niedrig_Info()
{

	Info_ClearChoices	(CH_Level_niedrig);
	
	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK	   , CH_Level_niedrig_BACK);
	
	Info_AddChoice		(CH_Level_niedrig, "Level 21 - 25" , CH_Level21);
	Info_AddChoice		(CH_Level_niedrig, "Level 16 - 20" , CH_Level16);
	Info_AddChoice		(CH_Level_niedrig, "Level 11 - 15" , CH_Level11);
	Info_AddChoice		(CH_Level_niedrig, "Level  6 - 10" , CH_Level6);
	Info_AddChoice		(CH_Level_niedrig, "Level  1 -  5" , CH_Level1);

};
//***************************************************************************
//	Levelwahl 26 - 50
//***************************************************************************
INSTANCE CH_Level_hoch (C_INFO)
{
	npc				= CH;
	nr 				=  3;
	condition		= CH_Level_hoch_Condition;
	information		= CH_Level_hoch_Info;
	description		= "Set level (26-50)";
	permanent		=  TRUE;
};

FUNC INT CH_Level_hoch_Condition()
{	
	if (LevelStart == TRUE)
	{
		return TRUE;
	};
};
func VOID CH_Level_hoch_Info()
{

	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch, DIALOG_BACK	   , CH_Level_hoch_BACK);
	
	Info_AddChoice		(CH_Level_hoch, "Level 46 - 50" , CH_Level46);
	Info_AddChoice		(CH_Level_hoch, "Level 41 - 45" , CH_Level41);
	Info_AddChoice		(CH_Level_hoch, "Level 36 - 40" , CH_Level36);
	Info_AddChoice		(CH_Level_hoch, "Level 31 - 35" , CH_Level31);
	Info_AddChoice		(CH_Level_hoch, "Level 26 - 30" , CH_Level26);
};
//***************************************************************************
//	Level Funcs
//***************************************************************************
func void CH_Level46()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 50" , CH_Level_50);
	Info_AddChoice		(CH_Level_hoch, "Level 49" , CH_Level_49);
	Info_AddChoice		(CH_Level_hoch, "Level 48" , CH_Level_48);
	Info_AddChoice		(CH_Level_hoch, "Level 47" , CH_Level_47);
	Info_AddChoice		(CH_Level_hoch, "Level 46" , CH_Level_46);
};
func void CH_Level41()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 45" , CH_Level_45);
	Info_AddChoice		(CH_Level_hoch, "Level 44" , CH_Level_44);
	Info_AddChoice		(CH_Level_hoch, "Level 43" , CH_Level_43);
	Info_AddChoice		(CH_Level_hoch, "Level 42" , CH_Level_42);
	Info_AddChoice		(CH_Level_hoch, "Level 41" , CH_Level_41);
};
func void CH_Level36()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 40" , CH_Level_40);
	Info_AddChoice		(CH_Level_hoch, "Level 39" , CH_Level_39);
	Info_AddChoice		(CH_Level_hoch, "Level 38" , CH_Level_38);
	Info_AddChoice		(CH_Level_hoch, "Level 37" , CH_Level_37);
	Info_AddChoice		(CH_Level_hoch, "Level 36" , CH_Level_36);
};
func void CH_Level31()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 35" , CH_Level_35);
	Info_AddChoice		(CH_Level_hoch, "Level 34" , CH_Level_34);
	Info_AddChoice		(CH_Level_hoch, "Level 33" , CH_Level_33);
	Info_AddChoice		(CH_Level_hoch, "Level 32" , CH_Level_32);
	Info_AddChoice		(CH_Level_hoch, "Level 31" , CH_Level_31);
};

func void CH_Level26()
{
	Info_ClearChoices	(CH_Level_hoch);
	
	Info_AddChoice		(CH_Level_hoch,DIALOG_BACK	, CH_Level_hoch_BACK);
	Info_AddChoice		(CH_Level_hoch, "Level 30" , CH_Level_30);
	Info_AddChoice		(CH_Level_hoch, "Level 29" , CH_Level_29);
	Info_AddChoice		(CH_Level_hoch, "Level 28" , CH_Level_28);
	Info_AddChoice		(CH_Level_hoch, "Level 27" , CH_Level_27);
	Info_AddChoice		(CH_Level_hoch, "Level 26" , CH_Level_26);
};  
func void CH_Level21()
{
	Info_ClearChoices	(CH_Level_niedrig);
	
	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 25" , CH_Level_25);
	Info_AddChoice		(CH_Level_niedrig, "Level 24" , CH_Level_24);
	Info_AddChoice		(CH_Level_niedrig, "Level 23" , CH_Level_23);
	Info_AddChoice		(CH_Level_niedrig, "Level 22" , CH_Level_22);
	Info_AddChoice		(CH_Level_niedrig, "Level 21" , CH_Level_21);
	
};  
func void CH_Level16()
{
	Info_ClearChoices	(CH_Level_niedrig);
	
	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 20" , CH_Level_20);
	Info_AddChoice		(CH_Level_niedrig, "Level 19" , CH_Level_19);
	Info_AddChoice		(CH_Level_niedrig, "Level 18" , CH_Level_18);
	Info_AddChoice		(CH_Level_niedrig, "Level 17" , CH_Level_17);
	Info_AddChoice		(CH_Level_niedrig, "Level 16" , CH_Level_16);
};

func void CH_Level11()
{
	Info_ClearChoices	(CH_Level_niedrig);

	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 15" , CH_Level_15);
	Info_AddChoice		(CH_Level_niedrig, "Level 14" , CH_Level_14);
	Info_AddChoice		(CH_Level_niedrig, "Level 13" , CH_Level_13);
	Info_AddChoice		(CH_Level_niedrig, "Level 12" , CH_Level_12);
	Info_AddChoice		(CH_Level_niedrig, "Level 11" , CH_Level_11);
};
func void CH_Level6()
{
	Info_ClearChoices	(CH_Level_niedrig);

	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK	    , CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 10" , CH_Level_10);
	Info_AddChoice		(CH_Level_niedrig, "Level  9" , CH_Level_9);
	Info_AddChoice		(CH_Level_niedrig, "Level  8" , CH_Level_8);
	Info_AddChoice		(CH_Level_niedrig, "Level  7" , CH_Level_7);
	Info_AddChoice		(CH_Level_niedrig, "Level  6" , CH_Level_6);
};

func void CH_Level1()
{
	Info_ClearChoices	(CH_Level_niedrig);

	Info_AddChoice		(CH_Level_niedrig, DIALOG_BACK		, CH_Level_niedrig_BACK);
	Info_AddChoice		(CH_Level_niedrig, "Level 5" 	, CH_Level_5);
	Info_AddChoice		(CH_Level_niedrig, "Level 4" 	, CH_Level_4);
	Info_AddChoice		(CH_Level_niedrig, "Level 3" 	, CH_Level_3);
	Info_AddChoice		(CH_Level_niedrig, "Level 2" 	, CH_Level_2);
	Info_AddChoice		(CH_Level_niedrig, "Level 1" 	, CH_Level_1);
};
func void CH_Level_niedrig_BACK()
{
	Info_ClearChoices	(CH_Level_niedrig);
};
func void CH_Level_hoch_BACK()
{
	Info_ClearChoices	(CH_Level_hoch);
};

func void CH_Level_1()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (1);
};

func void CH_Level_2()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (2);
};

func void CH_Level_3()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (3);
};

func void CH_Level_4()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (4);
};

func void CH_Level_5()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (5);
};

func void CH_Level_6()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (6);
};

func void CH_Level_7()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (7);
};

func void CH_Level_8()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (8);
};

func void CH_Level_9()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (9);
};

func void CH_Level_10()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (10);
};

func void CH_Level_11()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (11);
};

func void CH_Level_12()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (12);
};

func void CH_Level_13()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (13);
};

func void CH_Level_14()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (14);
};

func void CH_Level_15()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (15);
};

func void CH_Level_16()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (16);
};

func void CH_Level_17()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (17);
};

func void CH_Level_18()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (18);
};	

func void CH_Level_19()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (19);
};

func void CH_Level_20()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (20);
};

func void CH_Level_21()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (21);
};

func void CH_Level_22()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (22);
};

func void CH_Level_23()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (23);
};

func void CH_Level_24()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (24);
};

func void CH_Level_25()
{
	Info_ClearChoices (CH_Level_niedrig);
	CH_ApplyLevelPreset (25);
};

func void CH_Level_26()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (26);
};

func void CH_Level_27()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (27);
};

func void CH_Level_28()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (28);
};

func void CH_Level_29()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (29);
};

func void CH_Level_30()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (30);
};
func void CH_Level_31()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (31);
};
func void CH_Level_32()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (32);
};
func void CH_Level_33()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (33);
};
func void CH_Level_34()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (34);
};
func void CH_Level_35()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (35);
};
func void CH_Level_36()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (36);
};
func void CH_Level_37()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (37);
};
func void CH_Level_38()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (38);
};
func void CH_Level_39()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (39);
};
func void CH_Level_40()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (40);
};
func void CH_Level_41()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (41);
};
func void CH_Level_42()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (42);
};
func void CH_Level_43()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (43);
};
func void CH_Level_44()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (44);
};
func void CH_Level_45()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (45);
};
func void CH_Level_46()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (46);
};
func void CH_Level_47()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (47);
};
func void CH_Level_48()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (48);
};
func void CH_Level_49()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (49);
};
func void CH_Level_50()
{
	Info_ClearChoices (CH_Level_hoch);
	CH_ApplyLevelPreset (50);
};//*********************************************
//Geschick und Stärke
//*********************************************
//---------------------------
var int AttributeStart;
//---------------------------
INSTANCE DIA_CH_Attribute_Start (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_Attribute_Start_Condition;
	information	= DIA_CH_Attribute_Start_Info;
	permanent	= TRUE;
	description = "Strength and dexterity";
};                       

FUNC INT DIA_CH_Attribute_Start_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Attribute_Start_Info()
{
	AttributeStart = TRUE;
};
//*********************************************
// Attribute Stopper
//*********************************************
INSTANCE DIA_CH_Attribute_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Attribute_Stopper_Condition;
	information	= DIA_CH_Attribute_Stopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT DIA_CH_Attribute_Stopper_Condition()
{
	if (AttributeStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Attribute_Stopper_Info()
{
	AttributeStart = FALSE;
};
//*********************************************
// Attribute Stärke 
//*********************************************
INSTANCE DIA_CH_Strength (C_INFO)
{
	npc			= CH;
	nr			= 2;
	condition	= DIA_CH_Strength_Condition;
	information	= DIA_CH_Strength_Info;
	permanent	= TRUE;
	description = "Train strength";
};                       

FUNC INT DIA_CH_Strength_Condition()
{
	if (AttributeStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Strength_Info()
{
	Info_ClearChoices (DIA_CH_Strength);
	Info_AddChoice 	  (DIA_CH_Strength, DIALOG_BACK, DIA_CH_Strength_BACK);
	
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Strength + 20"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*20)		,DIA_CH_Strength_20);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Strength + 10"		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*10)		,DIA_CH_Strength_10);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Strength + 5"			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_CH_Strength_5);
	Info_AddChoice	  (DIA_CH_Strength, B_BuildLearnString("Strength + 1"			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_CH_Strength_1);
	
	
};
FUNC VOID DIA_CH_Strength_BACK()
{
	Info_ClearChoices (DIA_CH_Strength);
};
FUNC VOID DIA_CH_Strength_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	DIA_CH_Strength_Info();
};
FUNC VOID DIA_CH_Strength_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	DIA_CH_Strength_Info();
};
FUNC VOID DIA_CH_Strength_10()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 10, T_MAX);
	DIA_CH_Strength_Info();
};
FUNC VOID DIA_CH_Strength_20()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 20, T_MAX);
	DIA_CH_Strength_Info();
};
//******************************************************************************************
// Attribut Geschicklichkeit 
//******************************************************************************************
INSTANCE DIA_CH_Dex (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_Dex_Condition;
	information	= DIA_CH_Dex_Info;
	permanent	= TRUE;
	description = "Train dexterity";
};                       

FUNC INT DIA_CH_Dex_Condition()
{
	if (AttributeStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dex_Info()
{
	Info_ClearChoices (DIA_CH_Dex);
	Info_AddChoice 	  (DIA_CH_Dex, DIALOG_BACK, DIA_CH_Dex_BACK);
	
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Dexterity + 20"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*20)		,DIA_CH_DEX_20);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Dexterity + 10"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*10)		,DIA_CH_DEX_10);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Dexterity + 5"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_CH_DEX_5);
	Info_AddChoice		(DIA_CH_Dex, B_BuildLearnString("Dexterity + 1"			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_CH_DEX_1);
};
FUNC VOID DIA_CH_Dex_BACK()
{
	Info_ClearChoices (DIA_CH_Dex);
};
// ------ 1 Geschick ------
func void DIA_CH_DEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	DIA_CH_Dex_Info();
};

// ------ 5 Geschick ------
func void DIA_CH_DEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	DIA_CH_Dex_Info();
};
// ------ 10 Geschick ------
func void DIA_CH_DEX_10()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 10, T_MAX);
	DIA_CH_Dex_Info();
};
// ------ 20 Geschick ------
func void DIA_CH_DEX_20()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 20, T_MAX);
	DIA_CH_Dex_Info();
};

//******************************************************************************************
// MAGIE: Mana, Runen, Kreise
//******************************************************************************************
//---------------------------
var int MagieStart;
//---------------------------
INSTANCE DIA_CH_MAGIE (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_MAGIE_Condition;
	information	= DIA_CH_MAGIE_Info;
	permanent	= TRUE;
	description = "Mana, magic circles and runes";
};                       

FUNC INT DIA_CH_MAGIE_Condition()
{
	if (LevelStart == FALSE) 
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (KampfStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_MAGIE_Info()
{
	MagieStart = TRUE;
};
//*********************************************
// MAGIE Stopper
//*********************************************

INSTANCE DIA_CH_MAGIE_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_MAGIE_Stopper_Condition;
	information	= DIA_CH_MAGIE_Stopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT DIA_CH_MAGIE_Stopper_Condition()
{
	if (MagieStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_MAGIE_Stopper_Info()
{
	MagieStart = FALSE;
};
//*********************************************
// Mana
//*********************************************

INSTANCE DIA_CH_Mana (C_INFO)
{
	npc			= CH;
	nr			= 3;
	condition	= DIA_CH_Mana_Condition;
	information	= DIA_CH_Mana_Info;
	permanent	= TRUE;
	description = "Train mana";
};                       

FUNC INT DIA_CH_Mana_Condition()
{ 
	if (MagieStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Mana_Info()
{
	Info_ClearChoices (DIA_CH_Mana);

	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 20"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*20)		,DIA_CH_MANA_20);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 10"	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*10)		,DIA_CH_MANA_10);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 5"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_CH_MANA_5);
	Info_AddChoice		(DIA_CH_Mana, B_BuildLearnString("Mana + 1"		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_CH_MANA_1);
	
};
FUNC VOID DIA_CH_Mana_BACK()
{
	Info_ClearChoices (DIA_CH_Mana);
};
// ------ 1 Mana ------
func void DIA_CH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MAX);
	DIA_CH_Mana_Info();
};

// ------ 5 Mana ------
func void DIA_CH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MAX);
	DIA_CH_Mana_Info();
};
// ------ 10 Mana ------
func void DIA_CH_MANA_10()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 10, T_MAX);
	DIA_CH_Mana_Info();
};
// ------ 20 Mana ------
func void DIA_CH_MANA_20()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 20, T_MAX);
	DIA_CH_Mana_Info();
};
//*********************************************
// Kreise
//*********************************************

INSTANCE DIA_CH_KREISE (C_INFO)
{
	npc			= CH;
	nr			= 4;
	condition	= DIA_CH_KREISE_Condition;
	information	= DIA_CH_KREISE_Info;
	permanent	= TRUE;
	description = "Learn a magic circle";
};                       

FUNC INT DIA_CH_KREISE_Condition()
{
	if (MagieStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_KREISE_Info()
{
	Info_ClearChoices (DIA_CH_KREISE);
	Info_AddChoice (DIA_CH_KREISE, DIALOG_BACK, CH_KREISE_BACK);
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 6)
	{
		Info_AddChoice (DIA_CH_KREISE, CH_LessonPrice ("Learn circle 6", NPC_TALENT_MAGE, 6), CH_KREISE_6);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 5)
	{
		Info_AddChoice (DIA_CH_KREISE, CH_LessonPrice ("Learn circle 5", NPC_TALENT_MAGE, 5), CH_KREISE_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 4)
	{
		Info_AddChoice (DIA_CH_KREISE, CH_LessonPrice ("Learn circle 4", NPC_TALENT_MAGE, 4), CH_KREISE_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 3)
	{
		Info_AddChoice (DIA_CH_KREISE, CH_LessonPrice ("Learn circle 3", NPC_TALENT_MAGE, 3), CH_KREISE_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 2)
	{
		Info_AddChoice (DIA_CH_KREISE, CH_LessonPrice ("Learn circle 2", NPC_TALENT_MAGE, 2), CH_KREISE_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice (DIA_CH_KREISE, CH_LessonPrice ("Learn circle 1", NPC_TALENT_MAGE, 1), CH_KREISE_1);
	};
};
//***************************************************************************
// Talente Magische Kreise
//***************************************************************************
FUNC VOID CH_KREISE_BACK()
{
	Info_ClearChoices (DIA_CH_KREISE);
};
FUNC VOID CH_KREISE_1()
{
	if (B_TeachMagicCircle (self, other, 1))
	{
		B_SetKDFRunes();
	};
	DIA_CH_KREISE_Info();
};
FUNC VOID CH_KREISE_2()
{
	if (B_TeachMagicCircle (self, other, 2))
	{
		B_SetKDFRunes();
	};
	DIA_CH_KREISE_Info();
};
FUNC VOID CH_KREISE_3()
{
	if (B_TeachMagicCircle (self, other, 3))
	{
		B_SetKDFRunes();
	};
	DIA_CH_KREISE_Info();
};
FUNC VOID CH_KREISE_4()
{
	if (B_TeachMagicCircle (self, other, 4))
	{
		B_SetKDFRunes();
	};
	DIA_CH_KREISE_Info();
};
FUNC VOID CH_KREISE_5()
{
	if (B_TeachMagicCircle (self, other, 5))
	{
		B_SetKDFRunes();
	};
	DIA_CH_KREISE_Info();
};
FUNC VOID CH_KREISE_6()
{
	if (B_TeachMagicCircle (self, other, 6))
	{
		B_SetKDFRunes();
	};
	DIA_CH_KREISE_Info();
};
//*********************************************
// Runen
//*********************************************

INSTANCE DIA_CH_Runen (C_INFO)
{
	npc         = CH;
	nr          = 5;
	condition   = DIA_CH_Runen_Condition;
	information = DIA_CH_Runen_Info;
	permanent   = TRUE;
	description = "Learn rune recipes";
};

func int DIA_CH_Runen_Condition ()
{
	return ((MagieStart == TRUE) && (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1));
};

func void DIA_CH_Runen_BACK ()
{
	Info_ClearChoices (DIA_CH_Runen);
};

func void DIA_CH_Runen_Info ()
{
	var int circle;
	circle = Npc_GetTalentSkill (other, NPC_TALENT_MAGE);

	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_BACK);
	if (circle >= 6)
	{
		Info_AddChoice (DIA_CH_Runen, "Circle 6 runes", DIA_CH_Runen_6);
	};
	if (circle >= 5)
	{
		Info_AddChoice (DIA_CH_Runen, "Circle 5 runes", DIA_CH_Runen_5);
	};
	if (circle >= 4)
	{
		Info_AddChoice (DIA_CH_Runen, "Circle 4 runes", DIA_CH_Runen_4);
	};
	if (circle >= 3)
	{
		Info_AddChoice (DIA_CH_Runen, "Circle 3 runes", DIA_CH_Runen_3);
	};
	if (circle >= 2)
	{
		Info_AddChoice (DIA_CH_Runen, "Circle 2 runes", DIA_CH_Runen_2);
	};
	if (circle >= 1)
	{
		Info_AddChoice (DIA_CH_Runen, "Circle 1 runes", DIA_CH_Runen_1);
	};
};

func void DIA_CH_Runen_1 ()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_Info);
	if (!PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonGoblinSkeleton, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton), CH_LearnRune_SummonGoblinSkeleton);
	};
	if (!PLAYER_TALENT_RUNES[SPL_LightHeal])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_LightHeal, NPC_TALENT_RUNES, SPL_LightHeal), CH_LearnRune_LightHeal);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Light])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_LIGHT, NPC_TALENT_RUNES, SPL_Light), CH_LearnRune_Light);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Charm])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Charm, NPC_TALENT_RUNES, SPL_Charm), CH_LearnRune_Charm);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Sleep])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Sleep, NPC_TALENT_RUNES, SPL_Sleep), CH_LearnRune_Sleep);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Icebolt])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Icebolt, NPC_TALENT_RUNES, SPL_Icebolt), CH_LearnRune_Icebolt);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Firebolt])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Firebolt, NPC_TALENT_RUNES, SPL_Firebolt), CH_LearnRune_Firebolt);
	};
};

func void CH_LearnRune_Firebolt ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firebolt);
	DIA_CH_Runen_1 ();
};

func void CH_LearnRune_Icebolt ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);
	DIA_CH_Runen_1 ();
};

func void CH_LearnRune_Sleep ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Sleep);
	DIA_CH_Runen_1 ();
};

func void CH_LearnRune_Charm ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Charm);
	DIA_CH_Runen_1 ();
};

func void CH_LearnRune_Light ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Light);
	DIA_CH_Runen_1 ();
};

func void CH_LearnRune_LightHeal ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightHeal);
	DIA_CH_Runen_1 ();
};

func void CH_LearnRune_SummonGoblinSkeleton ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);
	DIA_CH_Runen_1 ();
};

func void DIA_CH_Runen_2 ()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_Info);
	if (!PLAYER_TALENT_RUNES[SPL_SummonSkeleton])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonSkeleton, NPC_TALENT_RUNES, SPL_SummonSkeleton), CH_LearnRune_SummonSkeleton);
	};
	if (!PLAYER_TALENT_RUNES[SPL_SummonWolf])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonWolf, NPC_TALENT_RUNES, SPL_SummonWolf), CH_LearnRune_SummonWolf);
	};
	if (!PLAYER_TALENT_RUNES[SPL_ConcussionBolt])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_ConcussionBolt, NPC_TALENT_RUNES, SPL_ConcussionBolt), CH_LearnRune_ConcussionBolt);
	};
	if (!PLAYER_TALENT_RUNES[SPL_MediumHeal])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_MediumHeal, NPC_TALENT_RUNES, SPL_MediumHeal), CH_LearnRune_MediumHeal);
	};
	if (!PLAYER_TALENT_RUNES[SPL_GreenTentacle])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_GreenTentacle, NPC_TALENT_RUNES, SPL_GreenTentacle), CH_LearnRune_GreenTentacle);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Swarm])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Swarm, NPC_TALENT_RUNES, SPL_Swarm), CH_LearnRune_Swarm);
	};
	if (!PLAYER_TALENT_RUNES[SPL_WindFist])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_WINDFIST, NPC_TALENT_RUNES, SPL_WindFist), CH_LearnRune_WindFist);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Shrink])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Shrink, NPC_TALENT_RUNES, SPL_Shrink), CH_LearnRune_Shrink);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Telekinesis])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Telekinesis, NPC_TALENT_RUNES, SPL_Telekinesis), CH_LearnRune_Telekinesis);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Zap])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Zap, NPC_TALENT_RUNES, SPL_Zap), CH_LearnRune_Zap);
	};
	if (!PLAYER_TALENT_RUNES[SPL_InstantFireball])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_InstantFireball, NPC_TALENT_RUNES, SPL_InstantFireball), CH_LearnRune_InstantFireball);
	};
};

func void CH_LearnRune_InstantFireball ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_Zap ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_Telekinesis ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Telekinesis);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_Shrink ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_WindFist ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WindFist);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_Swarm ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Swarm);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_GreenTentacle ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_GreenTentacle);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_MediumHeal ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MediumHeal);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_ConcussionBolt ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ConcussionBolt);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_SummonWolf ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);
	DIA_CH_Runen_2 ();
};

func void CH_LearnRune_SummonSkeleton ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);
	DIA_CH_Runen_2 ();
};

func void DIA_CH_Runen_3 ()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_Info);
	if (!PLAYER_TALENT_RUNES[SPL_SummonSkeletons])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonSkeletons, NPC_TALENT_RUNES, SPL_SummonSkeletons), CH_LearnRune_SummonSkeletons);
	};
	if (!PLAYER_TALENT_RUNES[SPL_SummonZombie])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonZombie, NPC_TALENT_RUNES, SPL_SummonZombie), CH_LearnRune_SummonZombie);
	};
	if (!PLAYER_TALENT_RUNES[SPL_DestroyUndead])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_DestroyUndead, NPC_TALENT_RUNES, SPL_DestroyUndead), CH_LearnRune_DestroyUndead);
	};
	if (!PLAYER_TALENT_RUNES[SPL_ManaRecovery])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_ManaRecovery, NPC_TALENT_RUNES, SPL_ManaRecovery), CH_LearnRune_ManaRecovery);
	};
	if (!PLAYER_TALENT_RUNES[SPL_SuckEnergy])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SuckEnergy, NPC_TALENT_RUNES, SPL_SuckEnergy), CH_LearnRune_SuckEnergy);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Whirlwind])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Whirlwind, NPC_TALENT_RUNES, SPL_Whirlwind), CH_LearnRune_Whirlwind);
	};
	if (!PLAYER_TALENT_RUNES[SPL_IceCube])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_IceCube, NPC_TALENT_RUNES, SPL_IceCube), CH_LearnRune_IceCube);
	};
	if (!PLAYER_TALENT_RUNES[SPL_WaterFist])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_WaterFist, NPC_TALENT_RUNES, SPL_WaterFist), CH_LearnRune_WaterFist);
	};
	if (!PLAYER_TALENT_RUNES[SPL_IceLance])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_IceLance, NPC_TALENT_RUNES, SPL_IceLance), CH_LearnRune_IceLance);
	};
	if (!PLAYER_TALENT_RUNES[SPL_FireFist])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_FireFist, NPC_TALENT_RUNES, SPL_FireFist), CH_LearnRune_FireFist);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Firestorm])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Firestorm, NPC_TALENT_RUNES, SPL_Firestorm), CH_LearnRune_Firestorm);
	};
};

func void CH_LearnRune_Firestorm ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_FireFist ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FireFist);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_IceLance ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceLance);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_WaterFist ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WaterFist);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_IceCube ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceCube);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_Whirlwind ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Whirlwind);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_SuckEnergy ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SuckEnergy);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_ManaRecovery ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ManaRecovery);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_DestroyUndead ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_SummonZombie ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonZombie);
	DIA_CH_Runen_3 ();
};

func void CH_LearnRune_SummonSkeletons ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeletons);
	DIA_CH_Runen_3 ();
};

func void DIA_CH_Runen_4 ()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_Info);
	if (!PLAYER_TALENT_RUNES[SPL_SummonGolem])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonGolem, NPC_TALENT_RUNES, SPL_SummonGolem), CH_LearnRune_SummonGolem);
	};
	if (!PLAYER_TALENT_RUNES[SPL_FullHeal])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_FullHeal, NPC_TALENT_RUNES, SPL_FullHeal), CH_LearnRune_FullHeal);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Explode])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Explode, NPC_TALENT_RUNES, SPL_Explode), CH_LearnRune_Explode);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Earthquake])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Earthquake, NPC_TALENT_RUNES, SPL_Earthquake), CH_LearnRune_Earthquake);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Berserk])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Berserk, NPC_TALENT_RUNES, SPL_Berserk), CH_LearnRune_Berserk);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Fear])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Fear, NPC_TALENT_RUNES, SPL_Fear), CH_LearnRune_Fear);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Control])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Control, NPC_TALENT_RUNES, SPL_Control), CH_LearnRune_Control);
	};
	if (!PLAYER_TALENT_RUNES[SPL_LightningFlash])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_LightningFlash, NPC_TALENT_RUNES, SPL_LightningFlash), CH_LearnRune_LightningFlash);
	};
	if (!PLAYER_TALENT_RUNES[SPL_ChargeZap])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_ChargeZap, NPC_TALENT_RUNES, SPL_ChargeZap), CH_LearnRune_ChargeZap);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Geyser])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Geyser, NPC_TALENT_RUNES, SPL_Geyser), CH_LearnRune_Geyser);
	};
	if (!PLAYER_TALENT_RUNES[SPL_LargeFireStorm])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_LargeFireStorm, NPC_TALENT_RUNES, SPL_LargeFireStorm), CH_LearnRune_LargeFireStorm);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Pyrokinesis])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Pyrokinesis, NPC_TALENT_RUNES, SPL_Pyrokinesis), CH_LearnRune_Pyrokinesis);
	};
	if (!PLAYER_TALENT_RUNES[SPL_ChargeFireball])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_ChargeFireball, NPC_TALENT_RUNES, SPL_ChargeFireball), CH_LearnRune_ChargeFireball);
	};
};

func void CH_LearnRune_ChargeFireball ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_Pyrokinesis ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_LargeFireStorm ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LargeFireStorm);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_Geyser ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Geyser);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_ChargeZap ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_LightningFlash ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_Control ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Control);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_Fear ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Fear);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_Berserk ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Berserk);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_Earthquake ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Earthquake);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_Explode ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Explode);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_FullHeal ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FullHeal);
	DIA_CH_Runen_4 ();
};

func void CH_LearnRune_SummonGolem ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);
	DIA_CH_Runen_4 ();
};

func void DIA_CH_Runen_5 ()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_Info);
	if (!PLAYER_TALENT_RUNES[SPL_SummonDemon])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonDemon, NPC_TALENT_RUNES, SPL_SummonDemon), CH_LearnRune_SummonDemon);
	};
	if (!PLAYER_TALENT_RUNES[SPL_SummonGuardian])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_SummonGuardian, NPC_TALENT_RUNES, SPL_SummonGuardian), CH_LearnRune_SummonGuardian);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Energyball])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_BeliarsRage, NPC_TALENT_RUNES, SPL_Energyball), CH_LearnRune_Energyball);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Inflate])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Inflate, NPC_TALENT_RUNES, SPL_Inflate), CH_LearnRune_Inflate);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Extricate])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Extricate, NPC_TALENT_RUNES, SPL_Extricate), CH_LearnRune_Extricate);
	};
};

func void CH_LearnRune_Extricate ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Extricate);
	DIA_CH_Runen_5 ();
};

func void CH_LearnRune_Inflate ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Inflate);
	DIA_CH_Runen_5 ();
};

func void CH_LearnRune_Energyball ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Energyball);
	DIA_CH_Runen_5 ();
};

func void CH_LearnRune_SummonGuardian ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGuardian);
	DIA_CH_Runen_5 ();
};

func void CH_LearnRune_SummonDemon ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);
	DIA_CH_Runen_5 ();
};

func void DIA_CH_Runen_6 ()
{
	Info_ClearChoices (DIA_CH_Runen);
	Info_AddChoice (DIA_CH_Runen, DIALOG_BACK, DIA_CH_Runen_Info);
	if (!PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_ArmyOfDarkness, NPC_TALENT_RUNES, SPL_ArmyOfDarkness), CH_LearnRune_ArmyOfDarkness);
	};
	if (!PLAYER_TALENT_RUNES[SPL_MassDeath])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_MassDeath, NPC_TALENT_RUNES, SPL_MassDeath), CH_LearnRune_MassDeath);
	};
	if (!PLAYER_TALENT_RUNES[SPL_BreathOfDeath])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_BreathOfDeath, NPC_TALENT_RUNES, SPL_BreathOfDeath), CH_LearnRune_BreathOfDeath);
	};
	if (!PLAYER_TALENT_RUNES[SPL_MasterOfDisaster])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_MasterOfDisaster, NPC_TALENT_RUNES, SPL_MasterOfDisaster), CH_LearnRune_MasterOfDisaster);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Skull])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Skull, NPC_TALENT_RUNES, SPL_Skull), CH_LearnRune_Skull);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Thunderstorm])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Thunderstorm, NPC_TALENT_RUNES, SPL_Thunderstorm), CH_LearnRune_Thunderstorm);
	};
	if (!PLAYER_TALENT_RUNES[SPL_IceWave])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_IceWave, NPC_TALENT_RUNES, SPL_IceWave), CH_LearnRune_IceWave);
	};
	if (!PLAYER_TALENT_RUNES[SPL_Firerain])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_Firerain, NPC_TALENT_RUNES, SPL_Firerain), CH_LearnRune_Firerain);
	};
	if (!PLAYER_TALENT_RUNES[SPL_FireWave])
	{
		Info_AddChoice (DIA_CH_Runen, CH_LessonPrice (NAME_SPL_FireWave, NPC_TALENT_RUNES, SPL_FireWave), CH_LearnRune_FireWave);
	};
};

func void CH_LearnRune_FireWave ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FireWave);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_Firerain ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_IceWave ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_Thunderstorm ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Thunderstorm);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_Skull ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Skull);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_MasterOfDisaster ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MasterOfDisaster);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_BreathOfDeath ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_MassDeath ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);
	DIA_CH_Runen_6 ();
};

func void CH_LearnRune_ArmyOfDarkness ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);
	DIA_CH_Runen_6 ();
};
//***************************************************************************************************************************************
// Kampftalente
//***************************************************************************************************************************************



//*********************************************
//KampfStart
//*********************************************
//----------------------------
var int KampfStart;
//----------------------------
INSTANCE DIA_CH_Kampf_Start (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Kampf_Start_Condition;
	information	= DIA_CH_Kampf_Start_Info;
	permanent	= TRUE;
	description = "Melee and ranged combat";
};                       

FUNC INT DIA_CH_Kampf_Start_Condition()
{
	if (KampfStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (LevelStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Start_Info()
{
	KampfStart = TRUE;
};
//*********************************************
//Kampf Stopper
//*********************************************
INSTANCE DIA_CH_Kampf_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Kampf_Stopper_Condition;
	information	= DIA_CH_Kampf_Stopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT DIA_CH_Kampf_Stopper_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Stopper_Info()
{
	KampfStart = FALSE;
};
//*********************************************
//Kampf Einhand
//*********************************************
INSTANCE DIA_CH_Kampf_Einhand (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Kampf_Einhand_Condition;
	information	= DIA_CH_Kampf_Einhand_Info;
	permanent	= TRUE;
	description = "One-handed weapons";
};                       

FUNC INT DIA_CH_Kampf_Einhand_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Einhand_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Einhand);
	Info_AddChoice	  (DIA_CH_Kampf_Einhand, DIALOG_BACK, DIA_CH_Kampf_Einhand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("One-handed + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*20)		,CH_Training_Combat_1H_20);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("One-handed + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*10)		,CH_Training_Combat_1H_10);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("One-handed + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)		,CH_Training_Combat_1H_5);
	Info_AddChoice		(DIA_CH_Kampf_Einhand, B_BuildLearnString("One-handed + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))		,CH_Training_Combat_1H_1);
};
FUNC VOID DIA_CH_Kampf_Einhand_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Einhand);
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_1H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
	DIA_CH_Kampf_Einhand_Info();
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_1H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
	DIA_CH_Kampf_Einhand_Info();
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_1H_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 10, 100);
	DIA_CH_Kampf_Einhand_Info();
};

// ------20% Waffentalent ------
func void CH_Training_Combat_1H_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 20, 100);
	DIA_CH_Kampf_Einhand_Info();
};
//******************************************************************************************
//Kampf Zweihand
//******************************************************************************************
INSTANCE DIA_CH_Kampf_Zweihand (C_INFO)
{
	npc			= CH;
	nr			= 7;
	condition	= DIA_CH_Kampf_Zweihand_Condition;
	information	= DIA_CH_Kampf_Zweihand_Info;
	permanent	= TRUE;
	description = "Two-handed weapons";
};                       

FUNC INT DIA_CH_Kampf_Zweihand_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Zweihand_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
	Info_AddChoice	  (DIA_CH_Kampf_Zweihand , DIALOG_BACK, DIA_CH_Kampf_Zweihand_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Two-handed + 20"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*20)			,CH_Training_Combat_2H_20);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Two-handed + 10"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*10)			,CH_Training_Combat_2H_10);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Two-handed + 5"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)				,CH_Training_Combat_2H_5);
	Info_AddChoice		(DIA_CH_Kampf_Zweihand, B_BuildLearnString("Two-handed + 1"	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))				,CH_Training_Combat_2H_1);
};
FUNC VOID DIA_CH_Kampf_Zweihand_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Zweihand );
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_2H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	DIA_CH_Kampf_Zweihand_Info();
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_2H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	DIA_CH_Kampf_Zweihand_Info();
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_2H_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 10, 100);
	DIA_CH_Kampf_Zweihand_Info();
};

// ------20% Waffentalent ------
func void CH_Training_Combat_2H_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 20, 100);
	DIA_CH_Kampf_Zweihand_Info();
};
//***************************************************************************************************************************************
// FERNKAMPF Bogen und Armbrust
//***************************************************************************************************************************************


//******************************************************************************************
//Kampf Bogen
//******************************************************************************************
INSTANCE DIA_CH_Kampf_Bogen (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= DIA_CH_Kampf_Bogen_Condition;
	information	= DIA_CH_Kampf_Bogen_Info;
	permanent	= TRUE;
	description = "Bows";
};                       

FUNC INT DIA_CH_Kampf_Bogen_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Bogen_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
	Info_AddChoice	  (DIA_CH_Kampf_Bogen , DIALOG_BACK, DIA_CH_Kampf_Bogen_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bow + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*20)			,CH_Training_Combat_BOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bow + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*10)			,CH_Training_Combat_BOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bow + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5)			,CH_Training_Combat_BOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Bogen, B_BuildLearnString("Bow + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,CH_Training_Combat_BOW_1);
	
};
FUNC VOID DIA_CH_Kampf_Bogen_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Bogen );
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_BOW_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 100);
	DIA_CH_Kampf_Bogen_Info();
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_BOW_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 100);
	DIA_CH_Kampf_Bogen_Info();
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_BOW_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 10, 100);
	DIA_CH_Kampf_Bogen_Info();
};

// ------20% Waffentalent ------
func void CH_Training_Combat_BOW_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 20, 100);
	DIA_CH_Kampf_Bogen_Info();
};

//******************************************************************************************
//Kampf Armbrust
//******************************************************************************************
INSTANCE DIA_CH_Kampf_Armbrust (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= DIA_CH_Kampf_Armbrust_Condition;
	information	= DIA_CH_Kampf_Armbrust_Info;
	permanent	= TRUE;
	description = "Crossbows";
};                       

FUNC INT DIA_CH_Kampf_Armbrust_Condition()
{
	if (KampfStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Kampf_Armbrust_Info()
{
	Info_ClearChoices (DIA_CH_Kampf_Armbrust );
	Info_AddChoice	  (DIA_CH_Kampf_Armbrust , DIALOG_BACK, DIA_CH_Kampf_Armbrust_BACK);
	
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Crossbow + 20", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*20)			,CH_Training_Combat_CROSSBOW_20);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Crossbow + 10", 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*10)			,CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Crossbow + 5"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)			,CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice		(DIA_CH_Kampf_Armbrust, B_BuildLearnString("Crossbow + 1"	, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,CH_Training_Combat_CROSSBOW_1);
};
FUNC VOID DIA_CH_Kampf_Armbrust_BACK()
{
	Info_ClearChoices (DIA_CH_Kampf_Armbrust );
};
// ------ 1% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 100);
	DIA_CH_Kampf_Armbrust_Info();
};

// ------ 5% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 100);
	DIA_CH_Kampf_Armbrust_Info();
};

// ------ 10% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_10()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 10, 100);
	DIA_CH_Kampf_Armbrust_Info();
};

// ------20% Waffentalent ------
func void CH_Training_Combat_CROSSBOW_20()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 20, 100);
	DIA_CH_Kampf_Armbrust_Info();
};

//*********************************************
//Diebestalente  
//*********************************************
//----------------------------
var int DiebStart;
//----------------------------
INSTANCE DIA_CH_Dieb_Start (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Dieb_Start_Condition;
	information	= DIA_CH_Dieb_Start_Info;
	permanent	= TRUE;
	description = "Thieving and acrobatics";
};                       

FUNC INT DIA_CH_Dieb_Start_Condition()
{
	if (KampfStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (LevelStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Start_Info()
{
	DiebStart = TRUE;
};
//*********************************************
//Dieb Stopper
//*********************************************
INSTANCE DIA_CH_Dieb_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= CH_AtThiefMenu;
	information	= DIA_CH_Dieb_Stopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT CH_AtThiefMenu()
{
	if (DiebStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Dieb_Stopper_Info()
{
	DiebStart = FALSE;
};
//*********************************************
instance DIA_CH_Dieb_Alle (C_INFO)
{
	npc         = CH;
	nr          = 7;
	condition   = CH_AtThiefMenu;
	information = DIA_CH_Dieb_Alle_Info;
	permanent   = TRUE;
	description = "Learn thieving skills and acrobatics";
};

func int CH_MissingThiefSkillCost (var int talent)
{
	if (Npc_GetTalentSkill (other, talent) == 0)
	{
		return B_GetLearnCostTalent (other, talent, 1);
	};
	return 0;
};

func int CH_RemainingThiefSkillsCost()
{
	return CH_MissingThiefSkillCost (NPC_TALENT_PICKLOCK)
		+ CH_MissingThiefSkillCost (NPC_TALENT_PICKPOCKET)
		+ CH_MissingThiefSkillCost (NPC_TALENT_SNEAK)
		+ CH_MissingThiefSkillCost (NPC_TALENT_ACROBAT);
};

func void DIA_CH_Dieb_Alle_Info()
{
	var int totalCost;
	var int cost;
	totalCost = CH_RemainingThiefSkillsCost();
	Info_ClearChoices (DIA_CH_Dieb_Alle);
	Info_AddChoice (DIA_CH_Dieb_Alle, DIALOG_BACK, DIA_CH_Dieb_Alle_BACK);
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		cost = B_GetLearnCostTalent (other, NPC_TALENT_PICKLOCK, 1);
		Info_AddChoice (DIA_CH_Dieb_Alle, B_BuildLearnString ("Lockpicking", cost), CH_Training_Thief_Picklock);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == 0)
	{
		cost = B_GetLearnCostTalent (other, NPC_TALENT_PICKPOCKET, 1);
		Info_AddChoice (DIA_CH_Dieb_Alle, B_BuildLearnString ("Pickpocketing", cost), CH_Training_Thief_Pickpocket);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == 0)
	{
		cost = B_GetLearnCostTalent (other, NPC_TALENT_SNEAK, 1);
		Info_AddChoice (DIA_CH_Dieb_Alle, B_BuildLearnString ("Sneaking", cost), CH_Training_Thief_Sneak);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == 0)
	{
		cost = B_GetLearnCostTalent (other, NPC_TALENT_ACROBAT, 1);
		Info_AddChoice (DIA_CH_Dieb_Alle, B_BuildLearnString ("Acrobatics", cost), CH_Training_Acrobatics);
	};
	if (totalCost > 0)
	{
		Info_AddChoice (DIA_CH_Dieb_Alle, B_BuildLearnString ("Learn all remaining skills", totalCost), CH_Training_Thief_Alle);
	};
};

func void DIA_CH_Dieb_Alle_BACK()
{
	Info_ClearChoices (DIA_CH_Dieb_Alle);
};

func void CH_Training_Thief_Picklock()
{
	B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK);
	DIA_CH_Dieb_Alle_Info();
};

func void CH_Training_Thief_Pickpocket()
{
	B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET);
	DIA_CH_Dieb_Alle_Info();
};

func void CH_Training_Thief_Sneak()
{
	B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK);
	DIA_CH_Dieb_Alle_Info();
};

func void CH_Training_Acrobatics()
{
	B_TeachThiefTalent (self, other, NPC_TALENT_ACROBAT);
	DIA_CH_Dieb_Alle_Info();
};

func void CH_Training_Thief_Alle()
{
	if (other.lp < CH_RemainingThiefSkillsCost())
	{
		PrintScreen (PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		DIA_CH_Dieb_Alle_Info();
		return;
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == 0)
	{
		B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == 0)
	{
		B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == 0)
	{
		B_TeachThiefTalent (self, other, NPC_TALENT_ACROBAT);
	};
	DIA_CH_Dieb_Alle_Info();
};

//Sonstige Talente   (Misc)
//*********************************************
//----------------------------
var int MiscStart;
//----------------------------
INSTANCE DIA_CH_Misc_Start (C_INFO)
{
	npc			= CH;
	nr			= 20;
	condition	= DIA_CH_Misc_Start_Condition;
	information	= DIA_CH_Misc_Start_Info;
	permanent	= TRUE;
	description = "Crafts, hunting and other skills";
};                       

FUNC INT DIA_CH_Misc_Start_Condition()
{
	if (KampfStart == FALSE)
	&& (MagieStart == FALSE)
	&& (AttributeStart == FALSE)
	&& (LevelStart == FALSE)
	&& (DiebStart == FALSE)
	&& (MiscStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Start_Info()
{
	MiscStart = TRUE;
};
//*********************************************
//Dieb Stopper
//*********************************************
INSTANCE DIA_CH_Misc_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= CH_AtMiscMenu;
	information	= DIA_CH_Misc_Stopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT CH_AtMiscMenu()
{
	if (MiscStart == TRUE)
	&& (AlchemyStart == FALSE)
	&& (SmithStart == FALSE)
	&& (AnimalStart == FALSE)
	&& (PaladinStart == FALSE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Stopper_Info()
{
	MiscStart = FALSE;
};
//*********************************************
//Alchemie
//*********************************************
//---------------------------------------------
var int AlchemyStart;
//---------------------------------------------
INSTANCE DIA_CH_Misc_Alchemie (C_INFO)
{
	npc			= CH;
	nr			= 10;
	condition	= CH_AtMiscMenu;
	information	= DIA_CH_Misc_Alchemie_Info;
	permanent	= TRUE;
	description = "Alchemy";
};                       

FUNC VOID DIA_CH_Misc_Alchemie_Info()
{
	AlchemyStart = TRUE;
};
//*********************************************
//Alchemie Stopper
//*********************************************
INSTANCE DIA_CH_Misc_Alchemie_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_Alchemie_Stopper_Condition;
	information	= DIA_CH_Misc_Alchemie_Stopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT DIA_CH_Misc_Alchemie_Stopper_Condition()
{
	if (AlchemyStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Alchemie_Stopper_Info()
{
	AlchemyStart = FALSE;
};
//*********************************************
instance DIA_CH_Misc_Health (C_INFO)
{
	npc         = CH;
	nr          = 5;
	condition   = DIA_CH_Misc_Alchemie_Stopper_Condition;
	information = DIA_CH_Misc_Health_Info;
	permanent   = TRUE;
	description = "Healing and permanent health potions";
};

func void DIA_CH_Misc_Health_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
	Info_AddChoice (DIA_CH_Misc_Health, DIALOG_BACK, DIA_CH_Misc_Health_Back);
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_HEALTH_03] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Health, CH_LessonPrice ("Elixir of Life", NPC_TALENT_ALCHEMY, POTION_Perm_HEALTH_03), CH_Learn_POTION_Perm_HEALTH_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_HEALTH_02] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Health, CH_LessonPrice ("Extract of Life", NPC_TALENT_ALCHEMY, POTION_Perm_HEALTH_02), CH_Learn_POTION_Perm_HEALTH_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_HEALTH_01] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Health, CH_LessonPrice ("Essence of Life", NPC_TALENT_ALCHEMY, POTION_Perm_HEALTH_01), CH_Learn_POTION_Perm_HEALTH_01);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Health, "Pure Life Energy", CH_Learn_POTION_Health_04);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Health, CH_LessonPrice ("Elixir of Healing", NPC_TALENT_ALCHEMY, POTION_Health_03), CH_Learn_POTION_Health_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Health, CH_LessonPrice ("Extract of Healing", NPC_TALENT_ALCHEMY, POTION_Health_02), CH_Learn_POTION_Health_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Health, CH_LessonPrice ("Essence of Healing", NPC_TALENT_ALCHEMY, POTION_Health_01), CH_Learn_POTION_Health_01);
	};
};

func void DIA_CH_Misc_Health_Back()
{
	Info_ClearChoices (DIA_CH_Misc_Health);
};

func void CH_Learn_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	DIA_CH_Misc_Health_Info();
};

func void CH_Learn_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
	DIA_CH_Misc_Health_Info();
};

func void CH_Learn_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03);
	DIA_CH_Misc_Health_Info();
};

func void CH_Learn_POTION_Health_04()
{
	PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
	CH_RecordRecipe (NPC_TALENT_ALCHEMY, TOPIC_TalentAlchemy, LOGENTRY_RECIPE_HEALTH_04);
	DIA_CH_Misc_Health_Info();
};

func void CH_Learn_POTION_Perm_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_HEALTH_01);
	DIA_CH_Misc_Health_Info();
};

func void CH_Learn_POTION_Perm_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_HEALTH_02);
	DIA_CH_Misc_Health_Info();
};

func void CH_Learn_POTION_Perm_HEALTH_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_HEALTH_03);
	DIA_CH_Misc_Health_Info();
};

instance DIA_CH_Misc_Mana (C_INFO)
{
	npc         = CH;
	nr          = 6;
	condition   = DIA_CH_Misc_Alchemie_Stopper_Condition;
	information = DIA_CH_Misc_Mana_Info;
	permanent   = TRUE;
	description = "Mana and permanent mana potions";
};

func void DIA_CH_Misc_Mana_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
	Info_AddChoice (DIA_CH_Misc_Mana, DIALOG_BACK, DIA_CH_Misc_Mana_Back);
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_MANA_03] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Mana, CH_LessonPrice ("Elixir of Spirit", NPC_TALENT_ALCHEMY, POTION_Perm_MANA_03), CH_Learn_POTION_Perm_MANA_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_MANA_02] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Mana, CH_LessonPrice ("Extract of Spirit", NPC_TALENT_ALCHEMY, POTION_Perm_MANA_02), CH_Learn_POTION_Perm_MANA_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_MANA_01] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Mana, CH_LessonPrice ("Essence of Spirit", NPC_TALENT_ALCHEMY, POTION_Perm_MANA_01), CH_Learn_POTION_Perm_MANA_01);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Mana, "Pure Magic Energy", CH_Learn_POTION_Mana_04);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Mana, CH_LessonPrice ("Elixir of Magic Energy", NPC_TALENT_ALCHEMY, POTION_Mana_03), CH_Learn_POTION_Mana_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Mana, CH_LessonPrice ("Extract of Magic Energy", NPC_TALENT_ALCHEMY, POTION_Mana_02), CH_Learn_POTION_Mana_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Mana, CH_LessonPrice ("Essence of Magic Energy", NPC_TALENT_ALCHEMY, POTION_Mana_01), CH_Learn_POTION_Mana_01);
	};
};

func void DIA_CH_Misc_Mana_Back()
{
	Info_ClearChoices (DIA_CH_Misc_Mana);
};

func void CH_Learn_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	DIA_CH_Misc_Mana_Info();
};

func void CH_Learn_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
	DIA_CH_Misc_Mana_Info();
};

func void CH_Learn_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
	DIA_CH_Misc_Mana_Info();
};

func void CH_Learn_POTION_Mana_04()
{
	PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
	CH_RecordRecipe (NPC_TALENT_ALCHEMY, TOPIC_TalentAlchemy, LOGENTRY_RECIPE_MANA_04);
	DIA_CH_Misc_Mana_Info();
};

func void CH_Learn_POTION_Perm_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_MANA_01);
	DIA_CH_Misc_Mana_Info();
};

func void CH_Learn_POTION_Perm_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_MANA_02);
	DIA_CH_Misc_Mana_Info();
};

func void CH_Learn_POTION_Perm_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_MANA_03);
	DIA_CH_Misc_Mana_Info();
};

instance CH_AttributePotions (C_INFO)
{
	npc         = CH;
	nr          = 7;
	condition   = DIA_CH_Misc_Alchemie_Stopper_Condition;
	information = CH_AttributePotions_Info;
	permanent   = TRUE;
	description = "Strength and dexterity potions";
};

func void CH_AttributePotions_Info()
{
	Info_ClearChoices (CH_AttributePotions);
	Info_AddChoice (CH_AttributePotions, DIALOG_BACK, CH_AttributePotions_Back);
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX_03] == FALSE)
	{
		Info_AddChoice (CH_AttributePotions, CH_LessonPrice ("Elixir of Dexterity", NPC_TALENT_ALCHEMY, POTION_Perm_DEX_03), CH_Learn_POTION_Perm_DEX_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX_02] == FALSE)
	{
		Info_AddChoice (CH_AttributePotions, CH_LessonPrice ("Extract of Dexterity", NPC_TALENT_ALCHEMY, POTION_Perm_DEX_02), CH_Learn_POTION_Perm_DEX_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX_01] == FALSE)
	{
		Info_AddChoice (CH_AttributePotions, CH_LessonPrice ("Essence of Dexterity", NPC_TALENT_ALCHEMY, POTION_Perm_DEX_01), CH_Learn_POTION_Perm_DEX_01);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR_03] == FALSE)
	{
		Info_AddChoice (CH_AttributePotions, CH_LessonPrice ("Elixir of Strength", NPC_TALENT_ALCHEMY, POTION_Perm_STR_03), CH_Learn_POTION_Perm_STR_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR_02] == FALSE)
	{
		Info_AddChoice (CH_AttributePotions, CH_LessonPrice ("Extract of Strength", NPC_TALENT_ALCHEMY, POTION_Perm_STR_02), CH_Learn_POTION_Perm_STR_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR_01] == FALSE)
	{
		Info_AddChoice (CH_AttributePotions, CH_LessonPrice ("Essence of Strength", NPC_TALENT_ALCHEMY, POTION_Perm_STR_01), CH_Learn_POTION_Perm_STR_01);
	};
};

func void CH_AttributePotions_Back()
{
	Info_ClearChoices (CH_AttributePotions);
};

func void CH_Learn_POTION_Perm_STR_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR_01);
	CH_AttributePotions_Info();
};

func void CH_Learn_POTION_Perm_STR_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR_02);
	CH_AttributePotions_Info();
};

func void CH_Learn_POTION_Perm_STR_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR_03);
	CH_AttributePotions_Info();
};

func void CH_Learn_POTION_Perm_DEX_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX_01);
	CH_AttributePotions_Info();
};

func void CH_Learn_POTION_Perm_DEX_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX_02);
	CH_AttributePotions_Info();
};

func void CH_Learn_POTION_Perm_DEX_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX_03);
	CH_AttributePotions_Info();
};

instance CH_PowerPotions (C_INFO)
{
	npc         = CH;
	nr          = 8;
	condition   = DIA_CH_Misc_Alchemie_Stopper_Condition;
	information = CH_PowerPotions_Info;
	permanent   = TRUE;
	description = "Power and speed potions";
};

func void CH_PowerPotions_Info()
{
	Info_ClearChoices (CH_PowerPotions);
	Info_AddChoice (CH_PowerPotions, DIALOG_BACK, CH_PowerPotions_Back);
	if (PLAYER_TALENT_ALCHEMY[POTION_SPEED_03] == FALSE)
	{
		Info_AddChoice (CH_PowerPotions, CH_LessonPrice ("Potion of Haste", NPC_TALENT_ALCHEMY, POTION_SPEED_03), CH_Learn_POTION_SPEED_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_SPEED_02] == FALSE)
	{
		Info_AddChoice (CH_PowerPotions, CH_LessonPrice ("Potion of Velocity", NPC_TALENT_ALCHEMY, POTION_SPEED_02), CH_Learn_POTION_SPEED_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_SPEED_01] == FALSE)
	{
		Info_AddChoice (CH_PowerPotions, CH_LessonPrice ("Potion of Swiftness", NPC_TALENT_ALCHEMY, POTION_SPEED_01), CH_Learn_POTION_SPEED_01);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_MASTER_03] == FALSE)
	{
		Info_AddChoice (CH_PowerPotions, CH_LessonPrice ("Potion of Godhood", NPC_TALENT_ALCHEMY, POTION_Perm_MASTER_03), CH_Learn_POTION_Perm_MASTER_03);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_MASTER_02] == FALSE)
	{
		Info_AddChoice (CH_PowerPotions, CH_LessonPrice ("Potion of Supremacy", NPC_TALENT_ALCHEMY, POTION_Perm_MASTER_02), CH_Learn_POTION_Perm_MASTER_02);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_MASTER_01] == FALSE)
	{
		Info_AddChoice (CH_PowerPotions, CH_LessonPrice ("Potion of Power", NPC_TALENT_ALCHEMY, POTION_Perm_MASTER_01), CH_Learn_POTION_Perm_MASTER_01);
	};
};

func void CH_PowerPotions_Back()
{
	Info_ClearChoices (CH_PowerPotions);
};

func void CH_Learn_POTION_Perm_MASTER_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_MASTER_01);
	CH_PowerPotions_Info();
};

func void CH_Learn_POTION_Perm_MASTER_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_MASTER_02);
	CH_PowerPotions_Info();
};

func void CH_Learn_POTION_Perm_MASTER_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_MASTER_03);
	CH_PowerPotions_Info();
};

func void CH_Learn_POTION_SPEED_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_SPEED_01);
	CH_PowerPotions_Info();
};

func void CH_Learn_POTION_SPEED_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_SPEED_02);
	CH_PowerPotions_Info();
};

func void CH_Learn_POTION_SPEED_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_SPEED_03);
	CH_PowerPotions_Info();
};

instance DIA_CH_Misc_Special (C_INFO)
{
	npc         = CH;
	nr          = 9;
	condition   = DIA_CH_Misc_Alchemie_Stopper_Condition;
	information = DIA_CH_Misc_Special_Info;
	permanent   = TRUE;
	description = "Special recipes and the Eye of Innos";
};

func void DIA_CH_Misc_Special_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
	Info_AddChoice (DIA_CH_Misc_Special, DIALOG_BACK, DIA_CH_Misc_Special_Back);
	if (PLAYER_TALENT_ALCHEMY[POTION_Special_DragonDrink] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Special, "Dragon egg potion", CH_Learn_POTION_Special_DragonDrink);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Special_Experience] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Special, "Elixir of Mental Alteration", CH_Learn_POTION_Special_Experience);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Special, "Embarla Firgasto", CH_Learn_POTION_MegaDrink);
	};
	if (PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Special, "Recharge the Eye of Innos", CH_Learn_CHARGE_INNOSEYE);
	};
};

func void DIA_CH_Misc_Special_Back()
{
	Info_ClearChoices (DIA_CH_Misc_Special);
};

func void CH_Learn_CHARGE_INNOSEYE()
{
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	Npc_SetTalentSkill (other, NPC_TALENT_ALCHEMY, 1);
	Print ("Recharge the Eye of Innos learned.");
	DIA_CH_Misc_Special_Info();
};

func void CH_Learn_POTION_MegaDrink()
{
	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
	Npc_SetTalentSkill (other, NPC_TALENT_ALCHEMY, 1);
	Print ("Embarla Firgasto learned.");
	DIA_CH_Misc_Special_Info();
};

func void CH_Learn_POTION_Special_Experience()
{
	PLAYER_TALENT_ALCHEMY[POTION_Special_Experience] = TRUE;
	Npc_SetTalentSkill (other, NPC_TALENT_ALCHEMY, 1);
	Print ("Elixir of Mental Alteration learned.");
	DIA_CH_Misc_Special_Info();
};

func void CH_Learn_POTION_Special_DragonDrink()
{
	PLAYER_TALENT_ALCHEMY[POTION_Special_DragonDrink] = TRUE;
	Npc_SetTalentSkill (other, NPC_TALENT_ALCHEMY, 1);
	Print ("Dragon egg potion learned.");
	DIA_CH_Misc_Special_Info();
};

//Schmieden Start
//*********************************************
var int SmithStart;
//---------------------------------------------
INSTANCE DIA_CH_Misc_SmithStart (C_INFO)
{
	npc			= CH;
	nr			= 10;
	condition	= CH_AtMiscMenu;
	information	= DIA_CH_Misc_SmithStart_Info;
	permanent	= TRUE;
	description = "Smithing";
};
FUNC VOID DIA_CH_Misc_SmithStart_Info()
{
	SmithStart = TRUE;
};
//*********************************************
//Schmieden Stopper
//*********************************************
INSTANCE DIA_CH_Misc_SmithStopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_SmithStopper_Condition;
	information	= DIA_CH_Misc_SmithStopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};

FUNC INT DIA_CH_Misc_SmithStopper_Condition()
{
	if (SmithStart == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_SmithStopper_Info()
{
	SmithStart = FALSE;
};
//*********************************************
instance DIA_CH_Misc_Smithniedrig (C_INFO)
{
	npc         = CH;
	nr          = 4;
	condition   = DIA_CH_Misc_SmithStopper_Condition;
	information = DIA_CH_Misc_Smithniedrig_Info;
	permanent   = TRUE;
	description = "One-handed steel blades";
};

func void DIA_CH_Misc_Smithniedrig_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
	Info_AddChoice (DIA_CH_Misc_Smithniedrig, DIALOG_BACK, DIA_CH_Misc_Smithniedrig_Back);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_05] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Smithniedrig, CH_LessonPrice (NAME_1H_REVIVED_05, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_05), CH_Learn_WEAPON_1H_REVIVED_05);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_04] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Smithniedrig, CH_LessonPrice (NAME_1H_REVIVED_04, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_04), CH_Learn_WEAPON_1H_REVIVED_04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_03] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Smithniedrig, CH_LessonPrice (NAME_1H_REVIVED_03, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_03), CH_Learn_WEAPON_1H_REVIVED_03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_02] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Smithniedrig, CH_LessonPrice (NAME_1H_REVIVED_02, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_02), CH_Learn_WEAPON_1H_REVIVED_02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_01] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Smithniedrig, CH_LessonPrice (NAME_1H_REVIVED_01, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_01), CH_Learn_WEAPON_1H_REVIVED_01);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_Smithniedrig, CH_LessonPrice (NAME_1H_COMMON_01, NPC_TALENT_SMITH, WEAPON_Common), CH_Learn_WEAPON_Common);
	};
};

func void DIA_CH_Misc_Smithniedrig_Back()
{
	Info_ClearChoices (DIA_CH_Misc_Smithniedrig);
};

func void CH_Learn_WEAPON_Common()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_Common);
	DIA_CH_Misc_Smithniedrig_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_01()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_01);
	DIA_CH_Misc_Smithniedrig_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_02()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_02);
	DIA_CH_Misc_Smithniedrig_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_03()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_03);
	DIA_CH_Misc_Smithniedrig_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_04()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_04);
	DIA_CH_Misc_Smithniedrig_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_05()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_05);
	DIA_CH_Misc_Smithniedrig_Info();
};

instance CH_SmithTwoHanded (C_INFO)
{
	npc         = CH;
	nr          = 5;
	condition   = DIA_CH_Misc_SmithStopper_Condition;
	information = CH_SmithTwoHanded_Info;
	permanent   = TRUE;
	description = "Two-handed steel blades";
};

func void CH_SmithTwoHanded_Info()
{
	Info_ClearChoices (CH_SmithTwoHanded);
	Info_AddChoice (CH_SmithTwoHanded, DIALOG_BACK, CH_SmithTwoHanded_Back);
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_05] == FALSE)
	{
		Info_AddChoice (CH_SmithTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_05, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_05), CH_Learn_WEAPON_2H_REVIVED_05);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_04] == FALSE)
	{
		Info_AddChoice (CH_SmithTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_04, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_04), CH_Learn_WEAPON_2H_REVIVED_04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_03] == FALSE)
	{
		Info_AddChoice (CH_SmithTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_03, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_03), CH_Learn_WEAPON_2H_REVIVED_03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_02] == FALSE)
	{
		Info_AddChoice (CH_SmithTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_02, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_02), CH_Learn_WEAPON_2H_REVIVED_02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_01] == FALSE)
	{
		Info_AddChoice (CH_SmithTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_01, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_01), CH_Learn_WEAPON_2H_REVIVED_01);
	};
};

func void CH_SmithTwoHanded_Back()
{
	Info_ClearChoices (CH_SmithTwoHanded);
};

func void CH_Learn_WEAPON_2H_REVIVED_01()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_01);
	CH_SmithTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_02()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_02);
	CH_SmithTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_03()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_03);
	CH_SmithTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_04()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_04);
	CH_SmithTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_05()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_05);
	CH_SmithTwoHanded_Info();
};

instance DIA_CH_Misc_SmithHoch (C_INFO)
{
	npc         = CH;
	nr          = 6;
	condition   = DIA_CH_Misc_SmithStopper_Condition;
	information = DIA_CH_Misc_SmithHoch_Info;
	permanent   = TRUE;
	description = "One-handed ore blades";
};

func void DIA_CH_Misc_SmithHoch_Info()
{
	Info_ClearChoices (DIA_CH_Misc_SmithHoch);
	Info_AddChoice (DIA_CH_Misc_SmithHoch, DIALOG_BACK, DIA_CH_Misc_SmithHoch_Back);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_ORE_05] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_SmithHoch, CH_LessonPrice (NAME_1H_REVIVED_ORE_05, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_ORE_05), CH_Learn_WEAPON_1H_REVIVED_ORE_05);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_ORE_04] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_SmithHoch, CH_LessonPrice (NAME_1H_REVIVED_ORE_04, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_ORE_04), CH_Learn_WEAPON_1H_REVIVED_ORE_04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_ORE_03] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_SmithHoch, CH_LessonPrice (NAME_1H_REVIVED_ORE_03, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_ORE_03), CH_Learn_WEAPON_1H_REVIVED_ORE_03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_ORE_02] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_SmithHoch, CH_LessonPrice (NAME_1H_REVIVED_ORE_02, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_ORE_02), CH_Learn_WEAPON_1H_REVIVED_ORE_02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_ORE_01] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_SmithHoch, CH_LessonPrice (NAME_1H_REVIVED_ORE_01, NPC_TALENT_SMITH, WEAPON_1H_REVIVED_ORE_01), CH_Learn_WEAPON_1H_REVIVED_ORE_01);
	};
};

func void DIA_CH_Misc_SmithHoch_Back()
{
	Info_ClearChoices (DIA_CH_Misc_SmithHoch);
};

func void CH_Learn_WEAPON_1H_REVIVED_ORE_01()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_ORE_01);
	DIA_CH_Misc_SmithHoch_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_ORE_02()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_ORE_02);
	DIA_CH_Misc_SmithHoch_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_ORE_03()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_ORE_03);
	DIA_CH_Misc_SmithHoch_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_ORE_04()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_ORE_04);
	DIA_CH_Misc_SmithHoch_Info();
};

func void CH_Learn_WEAPON_1H_REVIVED_ORE_05()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_REVIVED_ORE_05);
	DIA_CH_Misc_SmithHoch_Info();
};

instance CH_SmithOreTwoHanded (C_INFO)
{
	npc         = CH;
	nr          = 7;
	condition   = DIA_CH_Misc_SmithStopper_Condition;
	information = CH_SmithOreTwoHanded_Info;
	permanent   = TRUE;
	description = "Two-handed ore blades";
};

func void CH_SmithOreTwoHanded_Info()
{
	Info_ClearChoices (CH_SmithOreTwoHanded);
	Info_AddChoice (CH_SmithOreTwoHanded, DIALOG_BACK, CH_SmithOreTwoHanded_Back);
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_ORE_05] == FALSE)
	{
		Info_AddChoice (CH_SmithOreTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_ORE_05, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_ORE_05), CH_Learn_WEAPON_2H_REVIVED_ORE_05);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_ORE_04] == FALSE)
	{
		Info_AddChoice (CH_SmithOreTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_ORE_04, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_ORE_04), CH_Learn_WEAPON_2H_REVIVED_ORE_04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_ORE_03] == FALSE)
	{
		Info_AddChoice (CH_SmithOreTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_ORE_03, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_ORE_03), CH_Learn_WEAPON_2H_REVIVED_ORE_03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_ORE_02] == FALSE)
	{
		Info_AddChoice (CH_SmithOreTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_ORE_02, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_ORE_02), CH_Learn_WEAPON_2H_REVIVED_ORE_02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_ORE_01] == FALSE)
	{
		Info_AddChoice (CH_SmithOreTwoHanded, CH_LessonPrice (NAME_2H_REVIVED_ORE_01, NPC_TALENT_SMITH, WEAPON_2H_REVIVED_ORE_01), CH_Learn_WEAPON_2H_REVIVED_ORE_01);
	};
};

func void CH_SmithOreTwoHanded_Back()
{
	Info_ClearChoices (CH_SmithOreTwoHanded);
};

func void CH_Learn_WEAPON_2H_REVIVED_ORE_01()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_ORE_01);
	CH_SmithOreTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_ORE_02()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_ORE_02);
	CH_SmithOreTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_ORE_03()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_ORE_03);
	CH_SmithOreTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_ORE_04()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_ORE_04);
	CH_SmithOreTwoHanded_Info();
};

func void CH_Learn_WEAPON_2H_REVIVED_ORE_05()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_REVIVED_ORE_05);
	CH_SmithOreTwoHanded_Info();
};

//Animlatrophys
//*********************************************
var int AnimalStart;
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_Start (C_INFO)
{
	npc			= CH;
	nr			= 8;
	condition	= CH_AtMiscMenu;
	information	= DIA_CH_Misc_Animal_Start_Info;
	permanent	= TRUE;
	description = "Hunting trophies";
};                       

FUNC VOID DIA_CH_Misc_Animal_Start_Info()
{
	AnimalStart = TRUE;
};
//--------------------------------------------
//Animal Trophys Stopper
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_Stopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_Animal_Stopper_Condition;
	information	= DIA_CH_Misc_Animal_Stopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT DIA_CH_Misc_Animal_Stopper_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_Stopper_Info()
{
	AnimalStart = FALSE;
};
//--------------------------------------------
//Animal Trophys Allgemein
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_allg (C_INFO)
{
	npc			= CH;
	nr			= 5;
	condition	= DIA_CH_Misc_Animal_allg_Condition;
	information	= DIA_CH_Misc_Animal_allg_Info;
	permanent	= TRUE;
	description = "Teeth, claws, skins and hearts";
};                       

FUNC INT DIA_CH_Misc_Animal_allg_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_allg_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_allg);
	Info_AddChoice (DIA_CH_Misc_Animal_allg,DIALOG_BACK,DIA_CH_Misc_Animal_allg_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Remove teeth",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  CH_Training_TROPHYS_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Remove claws",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  CH_Training_TROPHYS_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Skin animals",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  CH_Training_TROPHYS_Fur);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_MagicHeart] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_allg, B_BuildLearnString ("Take magical hearts",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_MagicHeart)),  CH_Training_TROPHYS_Heart);
	};
};

FUNC VOID CH_Training_TROPHYS_Teeth ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
	DIA_CH_Misc_Animal_allg_Info();
};
FUNC VOID CH_Training_TROPHYS_Claws ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws);
	DIA_CH_Misc_Animal_allg_Info();
};
FUNC VOID CH_Training_TROPHYS_Fur ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur);
	DIA_CH_Misc_Animal_allg_Info();
};
FUNC VOID CH_Training_TROPHYS_Heart ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_MagicHeart);
	DIA_CH_Misc_Animal_allg_Info();
};
//--------------------------------------------
FUNC VOID DIA_CH_Misc_Animal_allg_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_allg);
};
//--------------------------------------------
//Animal Trophys Speziell
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_Speziell (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Misc_Animal_Speziell_Condition;
	information	= DIA_CH_Misc_Animal_Speziell_Info;
	permanent	= TRUE;
	description = "Insect and crawler trophies";
};                       

FUNC INT DIA_CH_Misc_Animal_Speziell_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_Speziell_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_Speziell);
	Info_AddChoice (DIA_CH_Misc_Animal_Speziell,DIALOG_BACK,DIA_CH_Misc_Animal_Speziell_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Bloodfly stingers",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  CH_Training_TROPHYS_BFSting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Bloodfly wings",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  CH_Training_TROPHYS_BFWing);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Minecrawler plates",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  CH_Training_TROPHYS_CrawlerPlate	);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_Speziell, B_BuildLearnString ("Mandibles",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  CH_Training_TROPHYS_Mandibles	);
	};
};
//--------------------------------------------
FUNC VOID DIA_CH_Misc_Animal_Speziell_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_Speziell);
};
FUNC VOID CH_Training_TROPHYS_BFSting ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting);
	DIA_CH_Misc_Animal_Speziell_Info();
};
FUNC VOID CH_Training_TROPHYS_BFWing ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing);
	DIA_CH_Misc_Animal_Speziell_Info();
};
FUNC VOID CH_Training_TROPHYS_CrawlerPlate ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate);
	DIA_CH_Misc_Animal_Speziell_Info();
};
FUNC VOID CH_Training_TROPHYS_Mandibles ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles);
	DIA_CH_Misc_Animal_Speziell_Info();
};
//--------------------------------------------
//Animal Trophys Blut, Hörner, Schuppen
//--------------------------------------------
INSTANCE DIA_CH_Misc_Animal_other (C_INFO)
{
	npc			= CH;
	nr			= 7;
	condition	= DIA_CH_Misc_Animal_other_Condition;
	information	= DIA_CH_Misc_Animal_other_Info;
	permanent	= TRUE;
	description = "Horns, tongues, scales and blood";
};                       

FUNC INT DIA_CH_Misc_Animal_other_Condition()
{
	if (AnimalStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_Animal_other_Info()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_other);
	Info_AddChoice 	(DIA_CH_Misc_Animal_other,DIALOG_BACK,DIA_CH_Misc_Animal_other_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Shadowbeast horns",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  CH_Training_TROPHYS_ShadowHorn );
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Fire lizard tongues",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  CH_Training_TROPHYS_FireTongue);
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Dragon snapper horns",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  CH_Training_TROPHYS_DrgSnapperHorn);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Dragon scales",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  CH_Training_TROPHYS_DragonScale);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
	{ 
		Info_AddChoice	(DIA_CH_Misc_Animal_other, B_BuildLearnString ("Dragon blood",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)),  CH_Training_TROPHYS_DragonBlood);
	};
};
//--------------------------------------------
FUNC VOID DIA_CH_Misc_Animal_other_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_Animal_other);
};
FUNC VOID CH_Training_TROPHYS_ShadowHorn ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn);
	DIA_CH_Misc_Animal_other_Info();
};
FUNC VOID CH_Training_TROPHYS_FireTongue ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_FireTongue);
	DIA_CH_Misc_Animal_other_Info();
};

FUNC VOID CH_Training_TROPHYS_DrgSnapperHorn ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn);
	DIA_CH_Misc_Animal_other_Info();
};
FUNC VOID CH_Training_TROPHYS_DragonScale ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale);
	DIA_CH_Misc_Animal_other_Info();
};
FUNC VOID CH_Training_TROPHYS_DragonBlood ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood);
	DIA_CH_Misc_Animal_other_Info();
};

//***************************************************************************
// Paladin Start
//***************************************************************************
var int PaladinStart;
//-------------------
INSTANCE DIA_CH_Misc_PaladinStart (C_INFO)
{
	npc			= CH;
	nr			= 7;
	condition	= CH_AtMiscMenu;
	information	= DIA_CH_Misc_PaladinStart_Info;
	permanent	= TRUE;
	description = "Paladin runes";
};                       

FUNC VOID DIA_CH_Misc_PaladinStart_Info()
{
	PaladinStart = TRUE;
};
//***************************************************************************
// Paladin Stopper
//***************************************************************************
INSTANCE DIA_CH_Misc_PaladinStopper (C_INFO)
{
	npc			= CH;
	nr			= 99;
	condition	= DIA_CH_Misc_PaladinStopper_Condition;
	information	= DIA_CH_Misc_PaladinStopper_Info;
	permanent	= TRUE;
	description = DIALOG_BACK;
};                       

FUNC INT DIA_CH_Misc_PaladinStopper_Condition()
{
	if (PaladinStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_PaladinStopper_Info()
{
	PaladinStart = FALSE;
};
//***************************************************************************
// Paladin Heal
//***************************************************************************
INSTANCE DIA_CH_Misc_PalHeal (C_INFO)
{
	npc			= CH;
	nr			= 5;
	condition	= DIA_CH_Misc_PalHeal_Condition;
	information	= DIA_CH_Misc_PalHeal_Info;
	permanent	= TRUE;
	description = "Light, healing and teleportation";
};                       

FUNC INT DIA_CH_Misc_PalHeal_Condition()
{
	if (PaladinStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_PalHeal_Info()
{
	Info_ClearChoices (DIA_CH_Misc_PalHeal);
	Info_AddChoice (DIA_CH_Misc_PalHeal, DIALOG_BACK, DIA_CH_Misc_PalHeal_BACK);
	if (PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalHeal, CH_LessonPrice (NAME_SPL_PalTeleportSecret, NPC_TALENT_RUNES, SPL_PalTeleportSecret), CH_Training_Runen_Paladin_SPL_PalTeleportSecret);
	};
	if (PLAYER_TALENT_RUNES[SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalHeal, CH_LessonPrice (NAME_SPL_PalFullHeal, NPC_TALENT_RUNES, SPL_PalFullHeal), CH_Training_Runen_Paladin_SPL_PalFullHeal);
	};
	if (PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalHeal, CH_LessonPrice (NAME_SPL_PalMediumHeal, NPC_TALENT_RUNES, SPL_PalMediumHeal), CH_Training_Runen_Paladin_SPL_PalMediumHeal);
	};
	if (PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalHeal, CH_LessonPrice (NAME_SPL_PalLightHeal, NPC_TALENT_RUNES, SPL_PalLightHeal), CH_Training_Runen_Paladin_SPL_PalLightHeal);
	};
	if (PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalHeal, CH_LessonPrice (NAME_SPL_PalLight, NPC_TALENT_RUNES, SPL_PalLight), CH_Training_Runen_Paladin_SPL_PalLight);
	};
};
FUNC VOID DIA_CH_Misc_PalHeal_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_PalHeal);
};
func void CH_LearnPaladinRune (var int spell, var int runeItem)
{
	if (B_TeachPlayerTalentRunes (self, other, spell))
	{
		CH_GiveMissingItem (runeItem);
	};
};

FUNC VOID CH_Training_Runen_Paladin_SPL_PalLight()
{
	CH_LearnPaladinRune (SPL_PalLight, ItRu_PalLight);
	DIA_CH_Misc_PalHeal_Info();
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalLightHeal()
{
	CH_LearnPaladinRune (SPL_PalLightHeal, ItRu_PalLightHeal);
	DIA_CH_Misc_PalHeal_Info();
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalMediumHeal()
{
	CH_LearnPaladinRune (SPL_PalMediumHeal, ItRu_PalMediumHeal);
	DIA_CH_Misc_PalHeal_Info();
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalFullHeal()
{
	CH_LearnPaladinRune (SPL_PalFullHeal, ItRu_PalFullHeal);
	DIA_CH_Misc_PalHeal_Info();
};
//***************************************************************************

func void CH_Training_Runen_Paladin_SPL_PalTeleportSecret()
{
	B_TeachPlayerTalentRunes (self, other, SPL_PalTeleportSecret);
	DIA_CH_Misc_PalHeal_Info();
};

// Paladin Kampf
//***************************************************************************
INSTANCE DIA_CH_Misc_PalKampf (C_INFO)
{
	npc			= CH;
	nr			= 6;
	condition	= DIA_CH_Misc_PalKampf_Condition;
	information	= DIA_CH_Misc_PalKampf_Info;
	permanent	= TRUE;
	description = "Combat runes";
};                       

FUNC INT DIA_CH_Misc_PalKampf_Condition()
{
	if (PaladinStart == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_CH_Misc_PalKampf_Info()
{
	Info_ClearChoices (DIA_CH_Misc_PalKampf);
	Info_AddChoice (DIA_CH_Misc_PalKampf, DIALOG_BACK, DIA_CH_Misc_PalKampf_BACK);
	if (PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalKampf, CH_LessonPrice (NAME_SPL_PalDestroyEvil, NPC_TALENT_RUNES, SPL_PalDestroyEvil), CH_Training_Runen_Paladin_SPL_PalDestroyEvil);
	};
	if (PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalKampf, CH_LessonPrice (NAME_SPL_PalRepelEvil, NPC_TALENT_RUNES, SPL_PalRepelEvil), CH_Training_Runen_Paladin_SPL_PalRepelEvil);
	};
	if (PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice (DIA_CH_Misc_PalKampf, CH_LessonPrice (NAME_SPL_PalHolyBolt, NPC_TALENT_RUNES, SPL_PalHolyBolt), CH_Training_Runen_Paladin_SPL_PalHolyBolt);
	};
};
//***************************************************************************
FUNC VOID DIA_CH_Misc_PalKampf_BACK()
{
	Info_ClearChoices (DIA_CH_Misc_PalKampf);
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalHolyBolt()
{
	CH_LearnPaladinRune (SPL_PalHolyBolt, ItRu_PalHolyBolt);
	DIA_CH_Misc_PalKampf_Info();
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalRepelEvil()
{
	CH_LearnPaladinRune (SPL_PalRepelEvil, ItRu_PalRepelEvil);
	DIA_CH_Misc_PalKampf_Info();
};
FUNC VOID CH_Training_Runen_Paladin_SPL_PalDestroyEvil()
{
	CH_LearnPaladinRune (SPL_PalDestroyEvil, ItRu_PalDestroyEvil);
	DIA_CH_Misc_PalKampf_Info();
};

instance CH_Bowmaking (C_INFO)
{
	npc         = CH;
	nr          = 11;
	condition   = CH_AtMiscMenu;
	information = CH_Bowmaking_Info;
	permanent   = TRUE;
	description = "Bowmaking and ammunition";
};

func void CH_Bowmaking_Info()
{
	Info_ClearChoices (CH_Bowmaking);
	Info_AddChoice (CH_Bowmaking, DIALOG_BACK, CH_Bowmaking_Back);
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_05] == FALSE)
	{
		Info_AddChoice (CH_Bowmaking, CH_LessonPrice (NAME_BOW_REVIVED_05, NPC_TALENT_BOWMAKING, WEAPON_BOW_REVIVED_05), CH_Learn_WEAPON_BOW_REVIVED_05);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_04] == FALSE)
	{
		Info_AddChoice (CH_Bowmaking, CH_LessonPrice (NAME_BOW_REVIVED_04, NPC_TALENT_BOWMAKING, WEAPON_BOW_REVIVED_04), CH_Learn_WEAPON_BOW_REVIVED_04);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_03] == FALSE)
	{
		Info_AddChoice (CH_Bowmaking, CH_LessonPrice (NAME_BOW_REVIVED_03, NPC_TALENT_BOWMAKING, WEAPON_BOW_REVIVED_03), CH_Learn_WEAPON_BOW_REVIVED_03);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_02] == FALSE)
	{
		Info_AddChoice (CH_Bowmaking, CH_LessonPrice (NAME_BOW_REVIVED_02, NPC_TALENT_BOWMAKING, WEAPON_BOW_REVIVED_02), CH_Learn_WEAPON_BOW_REVIVED_02);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_01] == FALSE)
	{
		Info_AddChoice (CH_Bowmaking, CH_LessonPrice (NAME_BOW_REVIVED_01, NPC_TALENT_BOWMAKING, WEAPON_BOW_REVIVED_01), CH_Learn_WEAPON_BOW_REVIVED_01);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_RANGED_AMMUNITION] == FALSE)
	{
		Info_AddChoice (CH_Bowmaking, CH_LessonPrice (NAME_RANGED_AMMUNITION, NPC_TALENT_BOWMAKING, WEAPON_RANGED_AMMUNITION), CH_Learn_WEAPON_RANGED_AMMUNITION);
	};
};

func void CH_Bowmaking_Back()
{
	Info_ClearChoices (CH_Bowmaking);
};

func void CH_Learn_WEAPON_RANGED_AMMUNITION()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_RANGED_AMMUNITION);
	CH_Bowmaking_Info();
};

func void CH_Learn_WEAPON_BOW_REVIVED_01()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_BOW_REVIVED_01);
	CH_Bowmaking_Info();
};

func void CH_Learn_WEAPON_BOW_REVIVED_02()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_BOW_REVIVED_02);
	CH_Bowmaking_Info();
};

func void CH_Learn_WEAPON_BOW_REVIVED_03()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_BOW_REVIVED_03);
	CH_Bowmaking_Info();
};

func void CH_Learn_WEAPON_BOW_REVIVED_04()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_BOW_REVIVED_04);
	CH_Bowmaking_Info();
};

func void CH_Learn_WEAPON_BOW_REVIVED_05()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_BOW_REVIVED_05);
	CH_Bowmaking_Info();
};

instance CH_Crossbowmaking (C_INFO)
{
	npc         = CH;
	nr          = 12;
	condition   = CH_AtMiscMenu;
	information = CH_Crossbowmaking_Info;
	permanent   = TRUE;
	description = "Crossbow making";
};

func void CH_Crossbowmaking_Info()
{
	Info_ClearChoices (CH_Crossbowmaking);
	Info_AddChoice (CH_Crossbowmaking, DIALOG_BACK, CH_Crossbowmaking_Back);
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_05] == FALSE)
	{
		Info_AddChoice (CH_Crossbowmaking, CH_LessonPrice (NAME_CBOW_REVIVED_05, NPC_TALENT_BOWMAKING, WEAPON_CBOW_REVIVED_05), CH_Learn_WEAPON_CBOW_REVIVED_05);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_04] == FALSE)
	{
		Info_AddChoice (CH_Crossbowmaking, CH_LessonPrice (NAME_CBOW_REVIVED_04, NPC_TALENT_BOWMAKING, WEAPON_CBOW_REVIVED_04), CH_Learn_WEAPON_CBOW_REVIVED_04);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_03] == FALSE)
	{
		Info_AddChoice (CH_Crossbowmaking, CH_LessonPrice (NAME_CBOW_REVIVED_03, NPC_TALENT_BOWMAKING, WEAPON_CBOW_REVIVED_03), CH_Learn_WEAPON_CBOW_REVIVED_03);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_02] == FALSE)
	{
		Info_AddChoice (CH_Crossbowmaking, CH_LessonPrice (NAME_CBOW_REVIVED_02, NPC_TALENT_BOWMAKING, WEAPON_CBOW_REVIVED_02), CH_Learn_WEAPON_CBOW_REVIVED_02);
	};
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_01] == FALSE)
	{
		Info_AddChoice (CH_Crossbowmaking, CH_LessonPrice (NAME_CBOW_REVIVED_01, NPC_TALENT_BOWMAKING, WEAPON_CBOW_REVIVED_01), CH_Learn_WEAPON_CBOW_REVIVED_01);
	};
};

func void CH_Crossbowmaking_Back()
{
	Info_ClearChoices (CH_Crossbowmaking);
};

func void CH_Learn_WEAPON_CBOW_REVIVED_01()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_CBOW_REVIVED_01);
	CH_Crossbowmaking_Info();
};

func void CH_Learn_WEAPON_CBOW_REVIVED_02()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_CBOW_REVIVED_02);
	CH_Crossbowmaking_Info();
};

func void CH_Learn_WEAPON_CBOW_REVIVED_03()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_CBOW_REVIVED_03);
	CH_Crossbowmaking_Info();
};

func void CH_Learn_WEAPON_CBOW_REVIVED_04()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_CBOW_REVIVED_04);
	CH_Crossbowmaking_Info();
};

func void CH_Learn_WEAPON_CBOW_REVIVED_05()
{
	B_TeachPlayerTalentBowmaking (self, other, WEAPON_CBOW_REVIVED_05);
	CH_Crossbowmaking_Info();
};

instance CH_HuntRare (C_INFO)
{
	npc         = CH;
	nr          = 8;
	condition   = DIA_CH_Misc_Animal_Stopper_Condition;
	information = CH_HuntRare_Info;
	permanent   = TRUE;
	description = "Reptile, swamp, troll and mantis trophies";
};

func void CH_HuntRare_Info()
{
	Info_ClearChoices (CH_HuntRare);
	Info_AddChoice (CH_HuntRare, DIALOG_BACK, CH_HuntRare_Back);
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MantisHead] == FALSE)
	{
		Info_AddChoice (CH_HuntRare, CH_LessonPrice ("Mantis heads", NPC_TALENT_TAKEANIMALTROPHY, TROPHY_MantisHead), CH_Learn_TROPHY_MantisHead);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollSkin] == FALSE)
	{
		Info_AddChoice (CH_HuntRare, CH_LessonPrice ("Troll hides", NPC_TALENT_TAKEANIMALTROPHY, TROPHY_TrollSkin), CH_Learn_TROPHY_TrollSkin);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollTeeth] == FALSE)
	{
		Info_AddChoice (CH_HuntRare, CH_LessonPrice ("Troll tusks", NPC_TALENT_TAKEANIMALTROPHY, TROPHY_TrollTeeth), CH_Learn_TROPHY_TrollTeeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_LurkerClaws] == FALSE)
	{
		Info_AddChoice (CH_HuntRare, CH_LessonPrice ("Lurker claws", NPC_TALENT_TAKEANIMALTROPHY, TROPHY_LurkerClaws), CH_Learn_TROPHY_LurkerClaws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampsharkSkin] == FALSE)
	{
		Info_AddChoice (CH_HuntRare, CH_LessonPrice ("Swampshark skins", NPC_TALENT_TAKEANIMALTROPHY, TROPHY_SwampsharkSkin), CH_Learn_TROPHY_SwampsharkSkin);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampsharkTeeth] == FALSE)
	{
		Info_AddChoice (CH_HuntRare, CH_LessonPrice ("Swampshark teeth", NPC_TALENT_TAKEANIMALTROPHY, TROPHY_SwampsharkTeeth), CH_Learn_TROPHY_SwampsharkTeeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		Info_AddChoice (CH_HuntRare, CH_LessonPrice ("Reptile skins", NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin), CH_Learn_TROPHY_ReptileSkin);
	};
};

func void CH_HuntRare_Back()
{
	Info_ClearChoices (CH_HuntRare);
};

func void CH_Learn_TROPHY_ReptileSkin()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ReptileSkin);
	CH_HuntRare_Info();
};

func void CH_Learn_TROPHY_SwampsharkTeeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_SwampsharkTeeth);
	CH_HuntRare_Info();
};

func void CH_Learn_TROPHY_SwampsharkSkin()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_SwampsharkSkin);
	CH_HuntRare_Info();
};

func void CH_Learn_TROPHY_LurkerClaws()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_LurkerClaws);
	CH_HuntRare_Info();
};

func void CH_Learn_TROPHY_TrollTeeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_TrollTeeth);
	CH_HuntRare_Info();
};

func void CH_Learn_TROPHY_TrollSkin()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_TrollSkin);
	CH_HuntRare_Info();
};

func void CH_Learn_TROPHY_MantisHead()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_MantisHead);
	CH_HuntRare_Info();
};

instance CH_Wisp (C_INFO)
{
	npc         = CH;
	nr          = 21;
	condition   = CH_AtMiscMenu;
	information = CH_Wisp_Info;
	permanent   = TRUE;
	description = "Will-o'-the-wisp training";
};

func void CH_Wisp_Info()
{
	Info_ClearChoices (CH_Wisp);
	Info_AddChoice (CH_Wisp, DIALOG_BACK, CH_Wisp_Back);
	if (Npc_HasItems (other, ItAm_Addon_WispDetector) == 0)
	{
		Info_AddChoice (CH_Wisp, "Get the wisp amulet", CH_Wisp_GiveAmulet);
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
	{
		Info_AddChoice (CH_Wisp, CH_LessonPrice (NAME_ADDON_WISPSKILL_POTIONS, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS), CH_Learn_WISPSKILL_POTIONS);
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
	{
		Info_AddChoice (CH_Wisp, CH_LessonPrice (NAME_ADDON_WISPSKILL_FOOD, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD), CH_Learn_WISPSKILL_FOOD);
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
	{
		Info_AddChoice (CH_Wisp, CH_LessonPrice (NAME_ADDON_WISPSKILL_MAGIC, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC), CH_Learn_WISPSKILL_MAGIC);
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
	{
		Info_AddChoice (CH_Wisp, CH_LessonPrice (NAME_ADDON_WISPSKILL_RUNE, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE), CH_Learn_WISPSKILL_RUNE);
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
	{
		Info_AddChoice (CH_Wisp, CH_LessonPrice (NAME_ADDON_WISPSKILL_NONE, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE), CH_Learn_WISPSKILL_NONE);
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
	{
		Info_AddChoice (CH_Wisp, CH_LessonPrice (NAME_ADDON_WISPSKILL_FF, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF), CH_Learn_WISPSKILL_FF);
	};
};

func void CH_Wisp_GiveAmulet()
{
	CreateInvItem (other, ItAm_Addon_WispDetector);
	CH_Wisp_Info();
};

func void CH_Wisp_Back()
{
	Info_ClearChoices (CH_Wisp);
};

func void CH_Learn_WISPSKILL_FF()
{
	B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_FF);
	CH_Wisp_Info();
};

func void CH_Learn_WISPSKILL_NONE()
{
	B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_NONE);
	CH_Wisp_Info();
};

func void CH_Learn_WISPSKILL_RUNE()
{
	B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_RUNE);
	CH_Wisp_Info();
};

func void CH_Learn_WISPSKILL_MAGIC()
{
	B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_MAGIC);
	CH_Wisp_Info();
};

func void CH_Learn_WISPSKILL_FOOD()
{
	B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_FOOD);
	CH_Wisp_Info();
};

func void CH_Learn_WISPSKILL_POTIONS()
{
	B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_POTIONS);
	CH_Wisp_Info();
};

instance CH_CookingRecipes (C_INFO)
{
	npc         = CH;
	nr          = 13;
	condition   = CH_AtMiscMenu;
	information = CH_CookingRecipes_Info;
	permanent   = TRUE;
	description = "Cooking recipes";
};

func void CH_CookingRecipes_Info()
{
	Info_ClearChoices (CH_CookingRecipes);
	Info_AddChoice (CH_CookingRecipes, DIALOG_BACK, CH_CookingRecipes_Back);
	if (PLAYER_TALENT_COOKING[COOKING_ConvictStew] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Convict's Stew", CH_Learn_COOKING_ConvictStew);
	};
	if (PLAYER_TALENT_COOKING[COOKING_FruitSalad] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Fruit Salad", CH_Learn_COOKING_FruitSalad);
	};
	if (PLAYER_TALENT_COOKING[COOKING_RiceBowl] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Rice Bowl", CH_Learn_COOKING_RiceBowl);
	};
	if (PLAYER_TALENT_COOKING[COOKING_Marmalade] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Berry Marmalade", CH_Learn_COOKING_Marmalade);
	};
	if (PLAYER_TALENT_COOKING[COOKING_MinecrawlerSoup] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Minecrawler Soup", CH_Learn_COOKING_MinecrawlerSoup);
	};
	if (PLAYER_TALENT_COOKING[COOKING_RootSoup] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Root Soup", CH_Learn_COOKING_RootSoup);
	};
	if (PLAYER_TALENT_COOKING[COOKING_MeatbugRagout] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Meatbug Ragout", CH_Learn_COOKING_MeatbugRagout);
	};
	if (PLAYER_TALENT_COOKING[COOKING_FishSoup] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Fish Soup", CH_Learn_COOKING_FishSoup);
	};
	if (PLAYER_TALENT_COOKING[COOKING_MeatStew] == FALSE)
	{
		Info_AddChoice (CH_CookingRecipes, "Full Meat Stew", CH_Learn_COOKING_MeatStew);
	};
};

func void CH_CookingRecipes_Back()
{
	Info_ClearChoices (CH_CookingRecipes);
};

func void CH_Learn_COOKING_MeatStew()
{
	PLAYER_TALENT_COOKING[COOKING_MeatStew] = TRUE;
	KnowsRecipe_MeatSoup = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_MEATSTEW);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_FishSoup()
{
	PLAYER_TALENT_COOKING[COOKING_FishSoup] = TRUE;
	KnowsRecipe_FishSoup = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_FISHSOUP);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_MeatbugRagout()
{
	PLAYER_TALENT_COOKING[COOKING_MeatbugRagout] = TRUE;
	KnowsRecipe_BugSoup = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_MEATBUGRAGOUT);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_RootSoup()
{
	PLAYER_TALENT_COOKING[COOKING_RootSoup] = TRUE;
	KnowsRecipe_RootSoup = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_ROOTSOUP);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_MinecrawlerSoup()
{
	PLAYER_TALENT_COOKING[COOKING_MinecrawlerSoup] = TRUE;
	KnowsRecipe_CrawlerSoup = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_MINECRAWLERSOUP);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_Marmalade()
{
	PLAYER_TALENT_COOKING[COOKING_Marmalade] = TRUE;
	KnowsRecipe_Marmalade = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_BERRYMARMALADE);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_RiceBowl()
{
	PLAYER_TALENT_COOKING[COOKING_RiceBowl] = TRUE;
	KnowsRecipe_Rice = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_RICEBOWL);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_FruitSalad()
{
	PLAYER_TALENT_COOKING[COOKING_FruitSalad] = TRUE;
	KnowsRecipe_FruitSalad = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_FRUITSALAD);
	CH_CookingRecipes_Info();
};

func void CH_Learn_COOKING_ConvictStew()
{
	PLAYER_TALENT_COOKING[COOKING_ConvictStew] = TRUE;
	KnowsRecipe_OldStew = TRUE;
	CH_RecordRecipe (NPC_TALENT_COOKING, TOPIC_Cooking, LOGENTRY_RECIPE_CONVICTSTEW);
	CH_CookingRecipes_Info();
};

instance CH_BoozeRecipes (C_INFO)
{
	npc         = CH;
	nr          = 14;
	condition   = CH_AtMiscMenu;
	information = CH_BoozeRecipes_Info;
	permanent   = TRUE;
	description = "Distilling recipes";
};

func void CH_BoozeRecipes_Info()
{
	Info_ClearChoices (CH_BoozeRecipes);
	Info_AddChoice (CH_BoozeRecipes, DIALOG_BACK, CH_BoozeRecipes_Back);
	if (PLAYER_TALENT_BOOZE[BOOZE_Mead] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Mead", CH_Learn_BOOZE_Mead);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_RiceSchnaps] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Rice Schnapps", CH_Learn_BOOZE_RiceSchnaps);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_MageWine] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Monastery Wine", CH_Learn_BOOZE_MageWine);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_MonsterDrink] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Monster Drink", CH_Learn_BOOZE_MonsterDrink);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_VinoBooze] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Vino's Special", CH_Learn_BOOZE_VinoBooze);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_TurnipBooze] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Turnip Booze", CH_Learn_BOOZE_TurnipBooze);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_FastHerring] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Hasty Herring", CH_Learn_BOOZE_FastHerring);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_LouHammerDouble] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Lou's Double Hammer", CH_Learn_BOOZE_LouHammerDouble);
	};
	if (PLAYER_TALENT_BOOZE[BOOZE_LouHammer] == FALSE)
	{
		Info_AddChoice (CH_BoozeRecipes, "Lou's Hammer", CH_Learn_BOOZE_LouHammer);
	};
};

func void CH_BoozeRecipes_Back()
{
	Info_ClearChoices (CH_BoozeRecipes);
};

func void CH_Learn_BOOZE_LouHammer()
{
	PLAYER_TALENT_BOOZE[BOOZE_LouHammer] = TRUE;
	KnowsRecipe_LousHammer = TRUE;
	Knows_LousHammer = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_LOUHAMMER);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_LouHammerDouble()
{
	PLAYER_TALENT_BOOZE[BOOZE_LouHammerDouble] = TRUE;
	KnowsRecipe_LousDoubleHammer = TRUE;
	Knows_SchlafHammer = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_LOUHAMMERDOUBLE);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_FastHerring()
{
	PLAYER_TALENT_BOOZE[BOOZE_FastHerring] = TRUE;
	KnowsRecipe_HastyHerring = TRUE;
	Knows_SchnellerHering = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_FASTHERRING);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_TurnipBooze()
{
	PLAYER_TALENT_BOOZE[BOOZE_TurnipBooze] = TRUE;
	KnowsRecipe_TurnipBooze = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_TURNIPBOOZE);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_VinoBooze()
{
	PLAYER_TALENT_BOOZE[BOOZE_VinoBooze] = TRUE;
	KnowsRecipe_VinoBooze = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_VINOBOOZE);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_MonsterDrink()
{
	PLAYER_TALENT_BOOZE[BOOZE_MonsterDrink] = TRUE;
	KnowsRecipe_MonsterDrink = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_MONSTERDRINK);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_MageWine()
{
	PLAYER_TALENT_BOOZE[BOOZE_MageWine] = TRUE;
	KnowsRecipe_MageWine = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_MAGEWINE);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_RiceSchnaps()
{
	PLAYER_TALENT_BOOZE[BOOZE_RiceSchnaps] = TRUE;
	KnowsRecipe_RiceSchnaps = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_RICESCHNAPS);
	CH_BoozeRecipes_Info();
};

func void CH_Learn_BOOZE_Mead()
{
	PLAYER_TALENT_BOOZE[BOOZE_Mead] = TRUE;
	KnowsRecipe_Mead = TRUE;
	CH_RecordRecipe (NPC_TALENT_BOOZE, TOPIC_Booze, LOGENTRY_RECIPE_MEAD);
	CH_BoozeRecipes_Info();
};

instance CH_TobaccoRecipes (C_INFO)
{
	npc         = CH;
	nr          = 15;
	condition   = CH_AtMiscMenu;
	information = CH_TobaccoRecipes_Info;
	permanent   = TRUE;
	description = "Tobacco blends and reefers";
};

func void CH_TobaccoRecipes_Info()
{
	Info_ClearChoices (CH_TobaccoRecipes);
	Info_AddChoice (CH_TobaccoRecipes, DIALOG_BACK, CH_TobaccoRecipes_Back);
	if (PLAYER_TALENT_TOBACCO[TOBACCO_Swampweed] == FALSE)
	{
		Info_AddChoice (CH_TobaccoRecipes, "Swampweed tobacco", CH_Learn_TOBACCO_Swampweed);
	};
	if (PLAYER_TALENT_TOBACCO[TOBACCO_Mushroom] == FALSE)
	{
		Info_AddChoice (CH_TobaccoRecipes, "Mushroom tobacco", CH_Learn_TOBACCO_Mushroom);
	};
	if (PLAYER_TALENT_TOBACCO[TOBACCO_Honey] == FALSE)
	{
		Info_AddChoice (CH_TobaccoRecipes, "Honey tobacco", CH_Learn_TOBACCO_Honey);
	};
	if (PLAYER_TALENT_TOBACCO[TOBACCO_AppleDouble] == FALSE)
	{
		Info_AddChoice (CH_TobaccoRecipes, "Double apple tobacco", CH_Learn_TOBACCO_AppleDouble);
	};
	if (PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Apple] == FALSE)
	{
		Info_AddChoice (CH_TobaccoRecipes, "Apple tobacco", CH_Learn_TOBACCO_Weed_Apple);
	};
};

func void CH_TobaccoRecipes_Back()
{
	Info_ClearChoices (CH_TobaccoRecipes);
};

func void CH_Learn_TOBACCO_Weed_Apple()
{
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Apple] = TRUE;
	CH_RecordRecipe (NPC_TALENT_TOBACCO, TOPIC_Tobacco, "I can roll reefers made with apple tobacco.");
	CH_TobaccoRecipes_Info();
};

func void CH_Learn_TOBACCO_AppleDouble()
{
	PLAYER_TALENT_TOBACCO[TOBACCO_AppleDouble] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_AppleDouble] = TRUE;
	CH_RecordRecipe (NPC_TALENT_TOBACCO, TOPIC_Tobacco, "I can roll reefers made with double apple tobacco.");
	CH_TobaccoRecipes_Info();
};

func void CH_Learn_TOBACCO_Honey()
{
	PLAYER_TALENT_TOBACCO[TOBACCO_Honey] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Honey] = TRUE;
	CH_RecordRecipe (NPC_TALENT_TOBACCO, TOPIC_Tobacco, "I can roll reefers made with honey tobacco.");
	CH_TobaccoRecipes_Info();
};

func void CH_Learn_TOBACCO_Mushroom()
{
	PLAYER_TALENT_TOBACCO[TOBACCO_Mushroom] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Mushroom] = TRUE;
	CH_RecordRecipe (NPC_TALENT_TOBACCO, TOPIC_Tobacco, "I can roll reefers made with mushroom tobacco.");
	CH_TobaccoRecipes_Info();
};

func void CH_Learn_TOBACCO_Swampweed()
{
	PLAYER_TALENT_TOBACCO[TOBACCO_Swampweed] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Regular] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_GreenNovice] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_NorthernDark] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Dreamcall] = TRUE;
	PLAYER_TALENT_TOBACCO[TOBACCO_Weed_DreamcallStrong] = TRUE;
	CH_RecordRecipe (NPC_TALENT_TOBACCO, TOPIC_Tobacco, "I can roll reefers made with swampweed tobacco.");
	CH_TobaccoRecipes_Info();
};

instance CH_Mining (C_INFO)
{
	npc         = CH;
	nr          = 22;
	condition   = CH_AtMiscMenu;
	information = CH_Mining_Info;
	permanent   = TRUE;
	description = "Mining";
};

func void CH_Mining_Info()
{
	Info_ClearChoices (CH_Mining);
	Info_AddChoice (CH_Mining, DIALOG_BACK, CH_Mining_Back);
	if (Knows_Truemmerschlag == FALSE)
	{
		Info_AddChoice (CH_Mining, "Learn the crushing blow", CH_Mining_CrushingBlow);
	};
	if (Hero_HackChance < 100)
	{
		Info_AddChoice (CH_Mining, "Raise mining chance to 100%", CH_Mining_Master);
	};
	if (Hero_HackChance <= 90)
	{
		Info_AddChoice (CH_Mining, "Raise mining chance by 10%", CH_Mining_Add10);
	};
};

func void CH_Mining_Back()
{
	Info_ClearChoices (CH_Mining);
};

func void CH_Mining_CrushingBlow()
{
	Knows_Truemmerschlag = TRUE;
	CH_Mining_Info();
};

func void CH_Mining_Master()
{
	B_Upgrade_Hero_HackChance (100 - Hero_HackChance);
	CH_Mining_Info();
};

func void CH_Mining_Add10()
{
	B_Upgrade_Hero_HackChance (10);
	CH_Mining_Info();
};
