// ********************
// NSC betet an Meditate-FP
// ********************

func void ZS_Pray_Sleeper_FP ()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	AI_SetWalkmode 	(self,NPC_WALK);
		
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};		
};

func int ZS_Pray_Sleeper_FP_Loop ()
{
	if (Npc_IsOnFP (self, "MEDITATE"))
	{	
		if (!C_BodyStateContains(self, BS_SIT))
		{
			AI_AlignToFP 	(self);
			AI_PlayAni 	(self, "T_IDOL_STAND_2_S0");
			AI_PlayAniBS 	(self, "T_IDOL_S0_2_S1", BS_SIT);
		};		
	}
	else if (Wld_IsFPAvailable(self,"MEDITATE"))
	{
		AI_GotoFP 		(self, "MEDITATE");
		AI_StandUp 		(self);
		AI_AlignToFP 	(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Pray_Sleeper_FP_End ()
{
	AI_PlayAni 	(self, "T_IDOL_S1_2_S0");
	AI_PlayAniBS 	(self, "T_IDOL_S0_2_STAND", BS_STAND);
};


