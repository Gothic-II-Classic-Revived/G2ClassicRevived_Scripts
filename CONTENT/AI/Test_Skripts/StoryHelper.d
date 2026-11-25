
//**************************************
//Storyhelper
//**************************************
INSTANCE SH (NPC_DEFAULT)
{
// ------ NSC ------
	name 		= "Story Helper";
	guild 		= GIL_NONE;
	id 			= 9999;
	voice 		= 15;
	flags       = 0 ;																
	npctype		= NPCTYPE_FRIEND ;
	
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
	daily_routine 		= Rtn_Start_9999;
};

FUNC VOID Rtn_Start_9999 ()
{	
	TA_Stand_ArmsCrossed(08,00,23,00,"XXX");
    TA_Stand_ArmsCrossed(23,00,08,00,"XXX");
};
// Dialogue

INSTANCE StoryHelper_Exit (C_INFO)
{
	npc = SH;
	nr = 999;
	condition = StoryHelper_Exit_Condition;
	information = StoryHelper_Exit_Info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};

func int StoryHelper_Exit_Condition()
{
	return TRUE;
};

func void StoryHelper_Exit_Info()
{
	AI_StopProcessInfos(self);
};

func void StoryHelper_GiveMissingItem(var int itemInstance)
{
	if (!Npc_HasItems(hero, itemInstance))
	{
		CreateInvItems(hero, itemInstance, 1);
	};
};

var int StoryHelper_ValleyDragonsPending;
var int StoryHelper_FreeMineDragonPending;

func void StoryHelper_FinishDragon(var int dragonInstance)
{
	var C_NPC dragon;
	dragon = Hlp_GetNpc(dragonInstance);
	if (Hlp_IsValidNpc(dragon))
	&& (!Npc_IsDead(dragon))
	{
		// Skipping the hunt awards no combat XP. Summoned golems must not restart the fight.
		dragon.aivar[AIV_VictoryXPGiven] = TRUE;
		dragon.aivar[AIV_DragonFightStage] = DRAGON_STAGE_FINAL;
		dragon.flags = 0;
		Npc_ChangeAttribute(dragon, ATR_HITPOINTS, -dragon.attribute[ATR_HITPOINTS_MAX]);
	};
};

func void StoryHelper_FinishSkippedDragons()
{
	if ((CurrentLevel == OLDWORLD_ZEN) && StoryHelper_ValleyDragonsPending)
	{
		StoryHelper_FinishDragon(Dragon_Swamp);
		StoryHelper_FinishDragon(Dragon_Rock);
		StoryHelper_FinishDragon(Dragon_Fire);
		StoryHelper_ValleyDragonsPending = FALSE;
	}
	else if ((CurrentLevel == FREEMINE_ZEN) && StoryHelper_FreeMineDragonPending)
	{
		StoryHelper_FinishDragon(Dragon_Ice);
		StoryHelper_FreeMineDragonPending = FALSE;
	};
};

func void StoryHelper_CompleteDragonHunt()
{
	B_RecordValleyDragonDeath(ID_DRAGON_SWAMP);
	B_RecordValleyDragonDeath(ID_DRAGON_ROCK);
	B_RecordValleyDragonDeath(ID_DRAGON_FIRE);
	B_RecordValleyDragonDeath(ID_DRAGON_ICE);

	// Older helper presets could set the quest flag without counting the dragons.
	MIS_KilledDragons = 4;
	MIS_AllDragonsDead = TRUE;
	B_ApplyValleyDragonUnlocks ();

	StoryHelper_ValleyDragonsPending = TRUE;
	StoryHelper_FreeMineDragonPending = TRUE;
	StoryHelper_FinishSkippedDragons();
};

// Only initialize the milestones crossed by this jump. World entry scripts
// handle their own chapter spawns, including the pass and the mines.
func int StoryHelper_AdvanceChapter(var int targetChapter)
{
	if (Kapitel >= targetChapter)
	{
		return TRUE;
	};

	if ((targetChapter >= 4) && (Kapitel < 4) && (!MIS_ReadyForChapter4) && (CurrentLevel != NEWWORLD_ZEN))
	{
		Print("Start the dragon hunt in Khorinis so the hunters can leave for the Valley of Mines.");
		return FALSE;
	};

	if ((targetChapter >= 5) && (CurrentLevel != OLDWORLD_ZEN)
		&& (DragonHunterReturnCheckPending || (EnterOW_Kapitel4 && (!MIS_AllDragonsDead)
		&& (!GornDJG_is_alive) && (!DJG_Angar_is_alive))))
	{
		Print("Start chapter 5 in the Valley of Mines so the surviving hunters can return to Khorinis.");
		return FALSE;
	};

	if ((Kapitel < 2) && (targetChapter >= 2))
	{
		StoryHelper_GiveMissingItem(ItKe_Pass_MIS);
		if (MIS_OLDWORLD == 0)
		{
			MIS_OLDWORLD = LOG_RUNNING;
			Log_CreateTopic(TOPIC_MISOLDWORLD, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_MISOLDWORLD, LOG_RUNNING);
			B_LogEntry(TOPIC_MISOLDWORLD, "Lord Hagen wants proof from Commander Garond in the Valley of Mines.");
		};
	};

	if ((Kapitel < 3) && (targetChapter >= 3))
	{
		KnowsPaladins_Ore = TRUE;
		MIS_ScoutMine = LOG_SUCCESS;
		MIS_ReadyForChapter3 = TRUE;
		if (targetChapter == 3)
		{
			if (!Npc_HasItems(hero, ItWr_PaladinLetter_MIS))
			{
				B_LogEntry(TOPIC_MISOLDWORLD, "Garond has given me his letter for Lord Hagen.");
			};
			StoryHelper_GiveMissingItem(ItWr_PaladinLetter_MIS);
		}
		else if (CurrentLevel == NEWWORLD_ZEN)
		{
			// Gorn's chapter 3 instance must exist before the chapter 4 transfer.
			B_Kapitelwechsel(3, CurrentLevel);
		};
	};

	if ((Kapitel < 4) && (targetChapter >= 4))
	{
		if (MIS_OLDWORLD == LOG_RUNNING)
		{
			MIS_OLDWORLD = LOG_SUCCESS;
			if (Npc_HasItems(hero, ItWr_PaladinLetter_MIS))
			{
				Npc_RemoveInvItems(hero, ItWr_PaladinLetter_MIS, 1);
			};
		};
		TOPIC_END_INNOSEYE = TRUE;
		PLAYER_TALENT_ALCHEMY[Charge_InnosEye] = TRUE;
		if (!Npc_HasItems(hero, ItMi_InnosEye_Discharged_Mis))
		{
			StoryHelper_GiveMissingItem(ITAM_REVIVED_INNOSEYE);
		};
		if (!MIS_ReadyForChapter4)
		{
			MIS_ReadyForChapter4 = TRUE;
			B_NPC_IsAliveCheck(NEWWORLD_ZEN);
			Log_CreateTopic(TOPIC_DRACHENJAGD, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
			B_LogEntry(TOPIC_DRACHENJAGD, "The Eye of Innos lets me speak to the dragons. I can recharge it at an alchemist's bench with a dragon heart.");
		};
		if ((targetChapter > 4) && (CurrentLevel == OLDWORLD_ZEN))
		{
			// Spawn the chapter 4 hunters before checking who returns to Khorinis.
			B_Kapitelwechsel(4, CurrentLevel);
		};
	};

	if ((Kapitel < 5) && (targetChapter >= 5))
	{
		if (!EnterOW_Kapitel4)
		{
			// These two hunters have never entered combat in the Valley.
			GornDJG_is_alive = SLD_Gorn_is_alive;
			DJG_Angar_is_alive = TRUE;
		}
		else if ((!MIS_AllDragonsDead) && (!GornDJG_is_alive) && (!DJG_Angar_is_alive))
		{
			B_NPC_IsAliveCheck(OLDWORLD_ZEN);
		};
		StoryHelper_CompleteDragonHunt();
		StoryHelper_GiveMissingItem(ITAT_REVIVED_DRAGONHEART_ICE);
	};

	if (targetChapter >= 3) { B_Chapter3_OneTime = TRUE; };
	if (targetChapter >= 4) { B_Chapter4_OneTime = TRUE; };
	if (targetChapter >= 5) { B_Chapter5_OneTime = TRUE; };
	B_Kapitelwechsel(targetChapter, CurrentLevel);
	return TRUE;
};

INSTANCE StoryHelper_Chapters (C_INFO)
{
	npc = SH;
	nr = 1;
	condition = StoryHelper_Chapters_Condition;
	information = StoryHelper_Chapters_Info;
	permanent = TRUE;
	description = "Advance to a chapter";
};

func int StoryHelper_Chapters_Condition()
{
	return (Kapitel < 5);
};

func void StoryHelper_Chapters_Info()
{
	Info_ClearChoices(StoryHelper_Chapters);
	Info_AddChoice(StoryHelper_Chapters, DIALOG_BACK, StoryHelper_Chapters_Back);
	Info_AddChoice(StoryHelper_Chapters, "Chapter 5 - Departure", StoryHelper_StartChapter5);
	if (Kapitel < 4)
	{
		Info_AddChoice(StoryHelper_Chapters, "Chapter 4 - The Dragon Hunt", StoryHelper_StartChapter4);
	};
	if (Kapitel < 3)
	{
		Info_AddChoice(StoryHelper_Chapters, "Chapter 3 - The Eye of Innos", StoryHelper_StartChapter3);
	};
	if (Kapitel < 2)
	{
		Info_AddChoice(StoryHelper_Chapters, "Chapter 2 - Return to the Colony", StoryHelper_StartChapter2);
	};
	if (Kapitel < 1)
	{
		Info_AddChoice(StoryHelper_Chapters, "Chapter 1 - The Menace", StoryHelper_StartChapter1);
	};
};

func void StoryHelper_Chapters_Back()
{
	Info_ClearChoices(StoryHelper_Chapters);
};

func void StoryHelper_StartChapter1()
{
	AI_StopProcessInfos(self);
	StoryHelper_AdvanceChapter(1);
};

func void StoryHelper_StartChapter2()
{
	AI_StopProcessInfos(self);
	StoryHelper_AdvanceChapter(2);
};

func void StoryHelper_StartChapter3()
{
	AI_StopProcessInfos(self);
	StoryHelper_AdvanceChapter(3);
};

func void StoryHelper_StartChapter4()
{
	AI_StopProcessInfos(self);
	StoryHelper_AdvanceChapter(4);
};

func void StoryHelper_StartChapter5()
{
	AI_StopProcessInfos(self);
	StoryHelper_AdvanceChapter(5);
};

INSTANCE StoryHelper_Voyage (C_INFO)
{
	npc = SH;
	nr = 2;
	condition = StoryHelper_Voyage_Condition;
	information = StoryHelper_Voyage_Info;
	permanent = TRUE;
	description = "Chapter 6 - Prepare the voyage to Irdorath";
};

func int StoryHelper_Voyage_Condition()
{
	return ((CurrentLevel == NEWWORLD_ZEN) && (Kapitel < 6) && (!MIS_ReadyforChapter6));
};

func void StoryHelper_Voyage_Info()
{
	Info_ClearChoices(StoryHelper_Voyage);
	Info_AddChoice(StoryHelper_Voyage, DIALOG_BACK, StoryHelper_Voyage_Back);
	if (((!SCGotCaptain) || JackIsCaptain) && Hlp_IsValidNpc(Jack) && (!Npc_IsDead(Jack)))
	{
		Info_AddChoice(StoryHelper_Voyage, "Prepare the ship with Jack as captain", StoryHelper_SailWithJack);
	};
	if (((!SCGotCaptain) || JorgenIsCaptain) && Hlp_IsValidNpc(Jorgen) && (!Npc_IsDead(Jorgen)))
	{
		Info_AddChoice(StoryHelper_Voyage, "Prepare the ship with Jorgen as captain", StoryHelper_SailWithJorgen);
	};
	if (((!SCGotCaptain) || TorlofIsCaptain) && Hlp_IsValidNpc(Torlof) && (!Npc_IsDead(Torlof)))
	{
		Info_AddChoice(StoryHelper_Voyage, "Prepare the ship with Torlof as captain", StoryHelper_SailWithTorlof);
	};
};

func void StoryHelper_Voyage_Back()
{
	Info_ClearChoices(StoryHelper_Voyage);
};

func void StoryHelper_PrepareShip(var C_NPC captain)
{
	AI_StopProcessInfos(self);
	if (!StoryHelper_AdvanceChapter(5))
	{
		return;
	};

	if (Hlp_GetInstanceID(captain) == Hlp_GetInstanceID(Jack))
	{
		JackIsCaptain = TRUE;
		captain.flags = NPC_FLAG_IMMORTAL;
	}
	else if (Hlp_GetInstanceID(captain) == Hlp_GetInstanceID(Torlof))
	{
		TorlofIsCaptain = TRUE;
		captain.flags = NPC_FLAG_IMMORTAL;
	}
	else
	{
		JorgenIsCaptain = TRUE;
	};
	SCGotCaptain = TRUE;
	MIS_ShipIsFree = TRUE;
	StoryHelper_GiveMissingItem(ItWr_Seamap_Irdorath);
	B_CaptainCallsAllOnBoard(captain);
	Print("Use the captain's quarters to sail to Irdorath.");
};

func void StoryHelper_SailWithJack()
{
	StoryHelper_PrepareShip(Jack);
};

func void StoryHelper_SailWithJorgen()
{
	StoryHelper_PrepareShip(Jorgen);
};

func void StoryHelper_SailWithTorlof()
{
	StoryHelper_PrepareShip(Torlof);
};

INSTANCE StoryHelper_RestoreEye (C_INFO)
{
	npc = SH;
	nr = 3;
	condition = StoryHelper_RestoreEye_Condition;
	information = StoryHelper_RestoreEye_Info;
	permanent = TRUE;
	description = "Recover the Eye of Innos";
};

func int StoryHelper_RestoreEye_Condition()
{
	return ((Kapitel >= 4) && (!Npc_HasItems(hero, ITAM_REVIVED_INNOSEYE))
		&& (!Npc_HasItems(hero, ItMi_InnosEye_Discharged_Mis)));
};

func void StoryHelper_RestoreEye_Info()
{
	StoryHelper_GiveMissingItem(ITAM_REVIVED_INNOSEYE);
};

// Give the quest item and leave the hand-in, rewards and journal to its owner.
INSTANCE StoryHelper_Cavalorn (C_INFO)
{
	npc = SH;
	nr = 10;
	condition = StoryHelper_Cavalorn_Condition;
	information = StoryHelper_Cavalorn_Info;
	permanent = TRUE;
	description = "Recover the ore pouch from Cavalorn's hut";
};

func int StoryHelper_Cavalorn_Condition()
{
	return ((MIS_Addon_Cavalorn_TheHut == LOG_RUNNING) && (!TOPIC_End_CavalornTheHut)
		&& (!SC_OpenedCavalornsBeutel) && (!Npc_HasItems(hero, ItSe_Addon_CavalornsBeutel)));
};

func void StoryHelper_Cavalorn_Info()
{
	StoryHelper_GiveMissingItem(ItSe_Addon_CavalornsBeutel);
};

INSTANCE StoryHelper_Daron (C_INFO)
{
	npc = SH;
	nr = 11;
	condition = StoryHelper_Daron_Condition;
	information = StoryHelper_Daron_Info;
	permanent = TRUE;
	description = "Recover Daron's stolen statuette";
};

func int StoryHelper_Daron_Condition()
{
	return ((MIS_Addon_Daron_GetStatue == LOG_RUNNING) && (!Npc_HasItems(hero, ItMi_LostInnosStatue_Daron)));
};

func void StoryHelper_Daron_Info()
{
	StoryHelper_GiveMissingItem(ItMi_LostInnosStatue_Daron);
};

INSTANCE StoryHelper_Edda (C_INFO)
{
	npc = SH;
	nr = 12;
	condition = StoryHelper_Edda_Condition;
	information = StoryHelper_Edda_Info;
	permanent = TRUE;
	description = "Recover Edda's stolen statue";
};

func int StoryHelper_Edda_Condition()
{
	return (Npc_KnowsInfo(hero, DIA_Edda_Stadt) && (!Npc_KnowsInfo(hero, DIA_Edda_Statue))
		&& (!Npc_HasItems(hero, ItMi_EddasStatue)));
};

func void StoryHelper_Edda_Info()
{
	StoryHelper_GiveMissingItem(ItMi_EddasStatue);
};

// Replay Revived's once-per-chapter deliveries through the original quest givers.
INSTANCE StoryHelper_BaltramDelivery (C_INFO)
{
	npc = SH;
	nr = 13;
	condition = StoryHelper_BaltramDelivery_Condition;
	information = StoryHelper_BaltramDelivery_Info;
	permanent = TRUE;
	description = "Let Baltram offer another delivery this chapter";
};

func int StoryHelper_BaltramDelivery_Condition()
{
	return ((CurrentLevel == NEWWORLD_ZEN) && (MIS_Baltram_ScoutAkil == LOG_SUCCESS)
		&& (!BaltramRatOut) && (Baltram_LieferungChapter == Kapitel));
};

func void StoryHelper_BaltramDelivery_Info()
{
	Baltram_LieferungChapter = Kapitel - 1;
	Print("Speak to Baltram for the next delivery from Akil.");
};

INSTANCE StoryHelper_VatrasMessage (C_INFO)
{
	npc = SH;
	nr = 14;
	condition = StoryHelper_VatrasMessage_Condition;
	information = StoryHelper_VatrasMessage_Info;
	permanent = TRUE;
	description = "Let Vatras offer another message this chapter";
};

func int StoryHelper_VatrasMessage_Condition()
{
	return ((CurrentLevel == NEWWORLD_ZEN) && (MIS_Vatras_Message == LOG_SUCCESS)
		&& (Vatras_MessageChapter == Kapitel));
};

func void StoryHelper_VatrasMessage_Info()
{
	Vatras_MessageChapter = Kapitel - 1;
	Print("Speak to Vatras for the next message to Isgaroth.");
};
