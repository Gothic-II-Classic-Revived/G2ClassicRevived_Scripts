// ************************
// B_TeachPlayerTalentRunes
// ************************

func int B_TeachPlayerTalentRunes (var C_NPC slf, var C_NPC oth, var int spell)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_RUNES, spell);
	
	
	//EXIT IF...
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
			
	// FUNC
				
	// ------ Lernpunkte abziehen ------			
	oth.lp = oth.lp - kosten;
	
	Log_CreateTopic (TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry (TOPIC_TalentRunes,"To create a rune I need the scroll for the spell and certain ingredients for each rune. Using those ingredients and a blank runestone I can create the desired rune at a rune table.");
	
	var C_NPC ScrollTrader;
	
	if	(Npc_IsDead(Gorax)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Gorax);
	}
	else if (Npc_IsDead(Isgaroth)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Isgaroth);
	}
	else if	(Npc_IsDead(Engor)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Engor);
	}
	else if	(Npc_IsDead(Orlan)== FALSE)
	{
		ScrollTrader = Hlp_GetNpc(Orlan);
	};
	
	// ------ Rune lernen ------
	if (spell == SPL_PalLight)				{	PLAYER_TALENT_RUNES[SPL_PalLight] 				= TRUE;	};		
	if (spell == SPL_PalLightHeal)			{	PLAYER_TALENT_RUNES[SPL_PalLightHeal] 			= TRUE;	};		
	if (spell == SPL_PalHolyBolt)			{	PLAYER_TALENT_RUNES[SPL_PalHolyBolt] 			= TRUE; };		
	if (spell == SPL_PalMediumHeal)			{	PLAYER_TALENT_RUNES[SPL_PalMediumHeal] 			= TRUE;	};		
	if (spell == SPL_PalRepelEvil)			{	PLAYER_TALENT_RUNES[SPL_PalRepelEvil] 			= TRUE;	};		
	if (spell == SPL_PalFullHeal)			{	PLAYER_TALENT_RUNES[SPL_PalFullHeal] 			= TRUE;	};		
	if (spell == SPL_PalDestroyEvil)		{	PLAYER_TALENT_RUNES[SPL_PalDestroyEvil]			= TRUE;	};		
	if (spell == SPL_PalTeleportSecret)		{	PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] 		= TRUE;	};		
	if (spell == SPL_TeleportSeaport)		{	PLAYER_TALENT_RUNES[SPL_TeleportSeaport] 		= TRUE;	};		
	if (spell == SPL_TeleportMonastery)		{	PLAYER_TALENT_RUNES[SPL_TeleportMonastery] 		= TRUE;	};		
	if (spell == SPL_TeleportFarm)			{	PLAYER_TALENT_RUNES[SPL_TeleportFarm] 			= TRUE;	};		
	if (spell == SPL_TeleportXardas)		{	PLAYER_TALENT_RUNES[SPL_TeleportXardas] 		= TRUE;	};		
	if (spell == SPL_TeleportPassNW)		{	PLAYER_TALENT_RUNES[SPL_TeleportPassNW] 		= TRUE;	};		
	if (spell == SPL_TeleportPassOW)		{	PLAYER_TALENT_RUNES[SPL_TeleportPassOW] 		= TRUE;	};		
	if (spell == SPL_TeleportOC)			{	PLAYER_TALENT_RUNES[SPL_TeleportOC] 			= TRUE;	};		
	// Teleport-Joker fehlen
	// Circle 1
	if (spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Firebolt, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_FIREBOLT);
	};
	if (spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Icebolt, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_ICEBOLT);
	};
	if (spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Sleep, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SLEEP);
	};
	if (spell == SPL_Charm)
	{
		PLAYER_TALENT_RUNES[SPL_Charm] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Charm, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_CHARM);
	};
	if (spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Light, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_LIGHT);
	};
	if (spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_LightHeal, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_LIGHTHEAL);
	};
	if (spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_SumGobSkel, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONGOBLINSKELETON);
	};
	// Circle 2
	if (spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_InstantFireball, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_INSTANTFIREBALL);
	};
	if (spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Zap, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_ZAP);
	};
	if (spell == SPL_Telekinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Telekinesis] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_TELEKINESIS, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_TELEKINESIS);
	};
	if (spell == SPL_Shrink)
	{
		PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Shrink, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SHRINK);
	};
	if (spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Windfist, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_WINDFIST);
	};
	if (spell == SPL_Swarm)
	{
		PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_SWARM, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SWARM);
	};
	if (spell == SPL_GreenTentacle)
	{
		PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_ROOTSNARE, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_GREENTENTACLE);
	};
	if (spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_MediumHeal, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_MEDIUMHEAL);
	};
	if (spell == SPL_ConcussionBolt)
	{
		PLAYER_TALENT_RUNES[SPL_ConcussionBolt] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_CONCUSSIONBOLT, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_CONCUSSIONBOLT);
	};
	if (spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_SumWolf, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONWOLF);
	};
	if (spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_SumSkel, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONSKELETON);
	};
	// Circle 3
	if (spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Firestorm, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_FIRESTORM);
	};
	if (spell == SPL_FireFist)
	{
		PLAYER_TALENT_RUNES[SPL_FireFist] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_FIREFIST, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_FIREFIST);
	};
	if (spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Icelance, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_ICELANCE);
	};
	if (spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Waterfist, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_WATERFIST);
	};
	if (spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_IceCube, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_ICECUBE);
	};
	if (spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Whirlwind, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_WHIRLWIND);
	};
	if (spell == SPL_SuckEnergy)
	{
		PLAYER_TALENT_RUNES[SPL_SuckEnergy] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_STEALENERGY, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUCKENERGY);
	};
	if (spell == SPL_ManaRecovery)
	{
		PLAYER_TALENT_RUNES[SPL_ManaRecovery] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_MANARECOVERY, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_MANARECOVERY);
	};
	if (spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_HarmUndead, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_DESTROYUNDEAD);
	};
	if (spell == SPL_SummonZombie)
	{
		PLAYER_TALENT_RUNES[SPL_SummonZombie] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_ZOMBIE, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONZOMBIE);
	};
	if (spell == SPL_SummonSkeletons)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeletons] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_SUMMONSKELETONS, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONSKELETONS);
	};
	// Circle 4
	if (spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_ChargeFireball, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_CHARGEFIREBALL);
	};
	if (spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_PYROKINESIS, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_PYROKINESIS);
	};
	if (spell == SPL_LargeFireStorm)
	{
		PLAYER_TALENT_RUNES[SPL_LargeFireStorm] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_LargeFireStorm, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_LARGEFIRESTORM);
	};
	if (spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Geyser, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_GEYSER);
	};
	if (spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_ThunderBall, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_CHARGEZAP);
	};
	if (spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_LightningFlash, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_LIGHTNINGFLASH);
	};
	if (spell == SPL_Control)
	{
		PLAYER_TALENT_RUNES[SPL_Control] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_CONTROL, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_CONTROL);
	};
	if (spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Fear, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_FEAR);
	};
	if (spell == SPL_Berserk)
	{
		PLAYER_TALENT_RUNES[SPL_Berserk] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_BERSERK, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_BERSERK);
	};
	if (spell == SPL_Earthquake)
	{
		PLAYER_TALENT_RUNES[SPL_Earthquake] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_EARTHQUAKE, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_EARTHQUAKE);
	};
	if (spell == SPL_Explode)
	{
		PLAYER_TALENT_RUNES[SPL_Explode] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_EXPLODE, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_EXPLODE);
	};
	if (spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_FullHeal, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_FULLHEAL);
	};
	if (spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_SumGol, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONGOLEM);
	};
	// Circle 5
	if (spell == SPL_Extricate)
	{
		PLAYER_TALENT_RUNES[SPL_Extricate] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_EXTRICATE, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_EXTRICATE);
	};
	if (spell == SPL_Inflate)
	{
		PLAYER_TALENT_RUNES[SPL_Inflate] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_INFLATE, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_INFLATE);
	};
	if (spell == SPL_Energyball)
	{
		PLAYER_TALENT_RUNES[SPL_Energyball] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_BELIARSWRATH, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_ENERGYBALL);
	};
	if (spell == SPL_SummonGuardian)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGuardian] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_GUARDIAN, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONGUARDIAN);
	};
	if (spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_SumDemon, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SUMMONDEMON);
	};
	// Circle 6
	if (spell == SPL_FireWave)
	{
		PLAYER_TALENT_RUNES[SPL_FireWave] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_FIREWAVE, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_FIREWAVE);
	};
	if (spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Firerain, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_FIRERAIN);
	};
	if (spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_IceWave, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_ICEWAVE);
	};
	if (spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_Thunderstorm, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_THUNDERSTORM);
	};
	if (spell == SPL_Skull)
	{
		PLAYER_TALENT_RUNES[SPL_Skull] = TRUE;
		CreateInvItems (ScrollTrader, ITSC_REVIVED_CRYOFTHEDEAD, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_SKULL);
	};
	if (spell == SPL_MasterOfDisaster)
	{
		PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_MASTEROFDISASTER);
	};
	if (spell == SPL_BreathOfDeath)
	{
		PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_BreathOfDeath, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_BREATHOFDEATH);
	};
	if (spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_MassDeath, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_MASSDEATH);
	};
	if (spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		CreateInvItems (ScrollTrader, ItSc_ArmyOfDarkness, 1);
		B_LogEntry (TOPIC_TalentRunes, LOGENTRY_RECIPE_RUNE_ARMYOFDARKNESS);
	};

	// Scrolls und Runen-Joker fehlen
							
	PrintScreen			(PRINT_LearnRunes, -1, -1, FONT_Screen, 2);
	
	// ------ bei jeder Rune: Runen-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_RUNES, 1);
	return TRUE;
};
