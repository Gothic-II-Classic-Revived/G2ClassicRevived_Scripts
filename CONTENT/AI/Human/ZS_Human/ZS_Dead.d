// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgeführt
// wird auch vom Spieler ausgeführt
// *****************************************

func void ZS_Dead ()
{	
	// ------ aivars resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
		
	// ------ XP ------
	if ( Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER]==TRUE) )
	&& (self.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);			
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	
	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);
		};
	};
	
	// ------ DiegoOW ------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
	{
		Diego_IsDead = TRUE;
	};
	
	if (Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		
		// ------ STORY ------
		
		// ------ Dunkle Seite der Macht -------
		
		if (C_DropUnconscious())
			{
				MadKillerCount = (MadKillerCount + 1); 
			};		
		
		// ------ Fester------
		if (self.guild == GIL_GIANT_BUG)
		&& (MIS_Fester_KillBugs == LOG_RUNNING)
		{
			Festers_Giant_Bug_Killed = Festers_Giant_Bug_Killed + 1;
		};
		// ----- Alligator Jack -----
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Swamprat) 
		&& (MIS_KrokoJagd == LOG_Running)
		{
			AlligatorJack_KrokosKilled = AlligatorJack_KrokosKilled +1;
		};
	};

	// ------ Tod - Kommentare -----
	if(NPC_IsPlayer(self) == TRUE)
	{
		var string deathmsg;
		var int random;
		random = Hlp_Random(10);
		if (random == 0)
		{
			deathmsg = PRINT_DEATH_MESSAGE_0;
		}
		else if (random == 1)
		{
			deathmsg = PRINT_DEATH_MESSAGE_1;
		}
		else if (random == 2)
		{
			deathmsg = PRINT_DEATH_MESSAGE_2;
		}
		else if (random == 3)
		{
			deathmsg = PRINT_DEATH_MESSAGE_3;
		}
		else if (random >= 4)
		{
			deathmsg = PRINT_DEATH_MESSAGE_4;
		};
		
		PrintScreen	(deathmsg ,-1,YPOS_LevelUp,FONT_Screen,2);
	};
		
	// ------ weil sonst Händler bevor man zum ersten Mal TRADE gewählt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN!!!!!!!!!!!!!!!

	// ------ Monster-Inventory abhängig vom Spieler-Talent ------
	B_GiveDeathInv(self);
	B_ClearRuneInv(self); //klaue alle runen!!
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	
	// ------ Equippte Waffen können nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		B_DragonFight_OnSupportDeath(self);
		B_DragonKillCounter (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_CONTINUE;
};
