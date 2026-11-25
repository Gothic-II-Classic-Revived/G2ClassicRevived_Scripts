var int SwapDragnIsDead;
var int RckDragnIsDead;
var int FreDragnIsDead;
var int IcDragnIsDead;

// Movers and focus teleports belong to the Valley, even when a dragon dies in the Free Mine.
var int SwampDragonUnlockPending;
var int RockDragonUnlockPending;
var int FireDragonUnlockPending;
var int IceDragonUnlockPending;
var int BiffSurvivalCheckPending;

func void B_ApplyValleyDragonUnlocks ()
{
	if (CurrentLevel != OLDWORLD_ZEN)
	{
		return;
	};

	if (SwampDragonUnlockPending)
	{
		Wld_SendTrigger ("FOCUSTELEPORT_CLIFF");
		SwampDragonUnlockPending = FALSE;
	};
	if (RockDragonUnlockPending)
	{
		Wld_SendTrigger ("FOCUSTELEPORT_MONASTERY");
		RockDragonUnlockPending = FALSE;
	};
	if (FireDragonUnlockPending)
	{
		Wld_SendTrigger ("EVT_TROLLSCHLUCHT_GATE");
		Wld_SendTrigger ("FOCUSTELEPORT_TROLLCANYON");
		FireDragonUnlockPending = FALSE;
	};
	if (IceDragonUnlockPending)
	{
		Wld_SendTrigger ("FOCUSTELEPORT_STONEHENGE");
		Wld_SendTrigger ("FOCUSTELEPORT_STONEFORTRESS");
		IceDragonUnlockPending = FALSE;
	};
	if (BiffSurvivalCheckPending)
	{
		if (Hlp_IsValidNpc (Biff))
		&& (Npc_IsDead (Biff) == FALSE)
		{
			DJG_BiffSurvivedLastDragon = TRUE;
		};
		BiffSurvivalCheckPending = FALSE;
	};
};

func int B_RecordValleyDragonDeath (var int dragonId)
{
	if ((dragonId == ID_DRAGON_SWAMP) && !SwapDragnIsDead)
	{
		SwapDragnIsDead = TRUE;
		SwampDragonUnlockPending = TRUE;
	}
	else if ((dragonId == ID_DRAGON_ROCK) && !RckDragnIsDead)
	{
		RckDragnIsDead = TRUE;
		RockDragonUnlockPending = TRUE;
	}
	else if ((dragonId == ID_DRAGON_FIRE) && !FreDragnIsDead)
	{
		FreDragnIsDead = TRUE;
		FireDragonUnlockPending = TRUE;
	}
	else if ((dragonId == ID_DRAGON_ICE) && !IcDragnIsDead)
	{
		IcDragnIsDead = TRUE;
		IceDragonUnlockPending = TRUE;
	}
	else
	{
		return FALSE;
	};

	MIS_KilledDragons += 1;
	if (MIS_KilledDragons == 4)
	{
		MIS_AllDragonsDead = TRUE;
	};
	return TRUE;
};

func int B_DragonKillCounter (var C_NPC current_dragon)
{
	if (current_dragon.guild != GIL_DRAGON)
	{
		return FALSE;
	};

	if (C_DragonFight_IsValleyDragon (current_dragon))
	{
		if (B_RecordValleyDragonDeath (current_dragon.aivar[AIV_MM_REAL_ID]))
		{
			Snd_Play ("MFX_TELEKINESIS_STARTINVEST");
			if (MIS_AllDragonsDead && DJG_BiffParty)
			{
				BiffSurvivalCheckPending = TRUE;
			};
			B_ApplyValleyDragonUnlocks ();
		};
	}
	else if (Hlp_GetInstanceID (current_dragon) == Hlp_GetInstanceID (Dragon_Undead))
	&& (UndeadDragonIsDead == FALSE)
	{
		UndeadDragonIsDead = TRUE;
		
		Log_CreateTopic (TOPIC_BackToShip, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BackToShip, LOG_RUNNING);
		B_LogEntry (TOPIC_BackToShip, PRINT_DragKillCount); 

		//AI_Teleport	(hero, "UNDEAD_ENDTELEPORT");	 

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			PlayVideoEx	("EXTRO_PAL.BIK", TRUE,FALSE);
		}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			PlayVideoEx	("EXTRO_DJG.BIK", TRUE,FALSE);
		}
		else
		{
			PlayVideoEx	("EXTRO_KDF.BIK", TRUE,FALSE);
		};
	};
	return FALSE;
};
