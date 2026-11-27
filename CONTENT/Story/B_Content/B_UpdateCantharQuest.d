func int C_CantharLetterExpired()
{
	return ((MIS_Canthars_KomproBrief == LOG_RUNNING) && ((Wld_GetDay() - MIS_Canthars_KomproBrief_Day) >= 2));
};

func void B_CantharTakesStall(var int blockTrade)
{
	if (!Hlp_IsValidNpc(Canthar)) || (Npc_IsDead(Canthar))
	{
		return;
	};

	Canthar_InStadt = TRUE;
	B_StartOtherRoutine(Canthar, "MARKTSTAND");
	AI_Teleport(Canthar, "NW_CITY_SARAH");
	if (blockTrade && !Canthar_Pay)
	{
		Canthar_Sperre = TRUE;
	};
};

func void B_UpdateCantharQuest()
{
	if (C_CantharLetterExpired())
	{
		Canthar_LetterExpired = TRUE;
		MIS_Canthars_KomproBrief = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_Canthar, LOG_OBSOLETE);
	}
	else if ((MIS_Canthars_KomproBrief == LOG_OBSOLETE) && Andre_CantharFalle)
	{
		// Older saves recorded the missed deadline only when Andre spoke.
		Canthar_LetterExpired = TRUE;
	};

	if ((Kapitel >= 3) && Canthar_Ausgeliefert && !Canthar_WiederRaus)
	{
		if (Hlp_IsValidNpc(Canthar) && !Npc_IsDead(Canthar))
		{
			Canthar_WiederRaus = TRUE;
		};
	};

	if (Canthar_LetterExpired || (Canthar_Ausgeliefert && Canthar_WiederRaus))
	{
		B_RemoveNpc(VLK_470_Sarah);
		Sarah_KickedOut = FALSE;
		if (!Canthar_KilledSarah)
		{
			Canthar_KilledSarah = TRUE;
			B_CantharTakesStall(TRUE);
		};
		return;
	};

	// Both refusing the letter and never receiving the offer leave Sarah free.
	if ((Kapitel >= 3) && !Sarah_KickedOut)
	&& ((MIS_Canthars_KomproBrief == 0) || (MIS_Canthars_KomproBrief == LOG_OBSOLETE))
	&& (Hlp_IsValidNpc(Sarah) && !Npc_IsDead(Sarah))
	{
		B_StartOtherRoutine(Sarah, "TAVERNE");
		AI_Teleport(Sarah, "NW_TAVERNE_GREGSBENCH");
		Sarah_KickedOut = TRUE;
		B_CantharTakesStall(MIS_Canthars_KomproBrief == LOG_OBSOLETE);
		if (Sarah_WaffenGesehen)
		{
			B_LogEntry(Topic_CityTrader, "Sarah now sells weapons at Orlan's tavern.");
		};
	};
};
