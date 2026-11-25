func void B_Say_Smalltalk()
{
    var int random;	random = Hlp_Random (120);
	
	var int Choice;
	Choice = Hlp_Random(2);

	if 		(random <   5)
	{
		B_Say		( self, self, "$SMALLTALK01");
	} 
	else if (random <  10)
	{
		B_Say		( self, self, "$SMALLTALK02");
	}
	else if (random <  15)
	{
		B_Say		( self, self, "$SMALLTALK03");
	}
	else if (random < 20)
	{
		B_Say		( self, self, "$SMALLTALK04");
	}
	else if (random < 25)
	{
		B_Say		( self, self, "$SMALLTALK05");
	}
	else if (random < 30)
	{
		B_Say		( self, self, "$SMALLTALK06");
	}
	else if (random < 35)
	{
		B_Say		( self, self, "$SMALLTALK07");
	}
	else if (random < 40)
	{
		B_Say		( self, self, "$SMALLTALK08");
	}
	else if (random < 45)
	{
		B_Say		( self, self, "$SMALLTALK09");
	}
	else if (random < 50)
	{
		B_Say		( self, self, "$SMALLTALK10");
	}
	else if (random < 55)
	{
		B_Say		( self, self, "$SMALLTALK11");
	}
	else if (random < 60)
	{
		B_Say		( self, self, "$SMALLTALK12");
	}
	else if (random < 65)
	{
		B_Say		( self, self, "$SMALLTALK13");
	}
	else if (random < 70)
	{
		B_Say		( self, self, "$SMALLTALK14");
	}
	else if (random < 75)
	{
		B_Say		( self, self, "$SMALLTALK15");
	}
	else if (random < 80)
	{
		B_Say		( self, self, "$SMALLTALK16");
	}
	else if (random < 85)
	{
		B_Say		( self, self, "$SMALLTALK17");
	}
	else if (random < 90)
	{
		B_Say		( self, self, "$SMALLTALK18");
	}
	else if (random < 95)
	{
		B_Say		( self, self, "$SMALLTALK19");
	}
	else if (random < 100)
	{
		B_Say		( self, self, "$SMALLTALK20");
	}
	else if (random < 105)
	{
		B_Say		( self, self, "$SMALLTALK21");
	}
	else if (random < 110)
	{
		if (Npc_GetTrueGuild (self) == GIL_NOV)
		|| (Npc_GetTrueGuild (self) == GIL_PAL)
		|| (Npc_GetTrueGuild (self) == GIL_KDF)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK28");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK22");
			};
		}
		else if (Npc_GetTrueGuild (self) == GIL_BDT)
		|| 		(Npc_GetTrueGuild (self) == GIL_SLD)
		|| 		(Npc_GetTrueGuild (self) == GIL_DJG)
		|| 		(Npc_GetTrueGuild (self) == GIL_PIR)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK25");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK22");
			};
		}
		else
		{
			B_Say		( self, self, "$SMALLTALK22");
		};	
			
	}
	else if (random < 115)
	{
		
		if (Npc_GetTrueGuild (self) == GIL_NOV)
		|| (Npc_GetTrueGuild (self) == GIL_PAL)
		|| (Npc_GetTrueGuild (self) == GIL_KDF)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK29");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK23");
			};
		}
		else if (Npc_GetTrueGuild (self) == GIL_BDT)
		|| 		(Npc_GetTrueGuild (self) == GIL_SLD)
		|| 		(Npc_GetTrueGuild (self) == GIL_DJG)
		|| 		(Npc_GetTrueGuild (self) == GIL_PIR)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK26");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK23");
			};
		}
		else
		{
			B_Say		( self, self, "$SMALLTALK23");
		};	
			
	}
	else if (random <= 120)
	{		
		if (Npc_GetTrueGuild (self) == GIL_NOV)
		|| (Npc_GetTrueGuild (self) == GIL_PAL)
		|| (Npc_GetTrueGuild (self) == GIL_KDF)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK30");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK24");
			};
		}
		else if (Npc_GetTrueGuild (self) == GIL_BDT)
		|| 		(Npc_GetTrueGuild (self) == GIL_SLD)
		|| 		(Npc_GetTrueGuild (self) == GIL_DJG)
		|| 		(Npc_GetTrueGuild (self) == GIL_PIR)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK27");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK24");
			};
		}
		else
		{
			B_Say		( self, self, "$SMALLTALK24");
		};	
			
	};
};

const int SmallTalkFreq = 4;

// Wld_DetectNpc sets other. Check that this actor has reached the meeting place.
func int C_SmalltalkPartnerReady()
{
	if (Npc_GetDistToNpc(self, other) >= PERC_DIST_DIALOG)
	{
		return FALSE;
	};
	if (!Npc_IsOnFP(other, "SMALLTALK"))
	{
		if (Npc_GetDistToWP(other, other.wp) > TA_DIST_SELFWP_MAX)
		{
			return FALSE;
		};
	};
	return Npc_CanSeeNpcFreeLOS(self, other);
};

func int B_SmalltalkLoop()
{
	if (!Npc_IsOnFP(self, "SMALLTALK"))
	{
		if (Wld_IsFPAvailable(self, "SMALLTALK"))
		{
			AI_GotoFP(self, "SMALLTALK");
			AI_StandUp(self);
			AI_AlignToFP(self);
			return LOOP_CONTINUE;
		};
	};

	if (Npc_GetStateTime(self) < (SmallTalkFreq * 2))
	{
		return LOOP_CONTINUE;
	};

	Npc_SetStateTime(self, 0);
	Npc_PerceiveAll(self);
	var int hasPartner;
	hasPartner = FALSE;
	if (Wld_DetectNpc(self, -1, ZS_Smalltalk, -1))
	{
		hasPartner = C_SmalltalkPartnerReady();
	};
	if (!hasPartner)
	{
		if (Wld_DetectNpc(self, -1, ZS_Bandit, -1))
		{
			if (other.aivar[AIV_TAPOSITION] == BANDIT_POS_SMALLTALK)
			{
				hasPartner = C_SmalltalkPartnerReady();
			};
		};
	};
	if (hasPartner)
	{
		Npc_SetStateTime(other, SmallTalkFreq);
		B_TurnToNpc(self, other);
		B_Say_Smalltalk();
		return LOOP_CONTINUE;
	};

	// Wait at the meeting place until a partner arrives.
	var int idle;
	idle = Hlp_Random(6);
	if (idle == 0)
	{
		AI_PlayAni(self, "T_SEARCH");
	}
	else if (idle == 1)
	{
		AI_PlayAni(self, "R_SCRATCHHEAD");
	};
	return LOOP_CONTINUE;
};
