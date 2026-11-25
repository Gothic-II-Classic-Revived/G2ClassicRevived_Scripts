// ************
// ZS_Smalltalk
// ************

func void ZS_Smalltalk () 
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	AI_SetWalkmode 	(self,NPC_WALK);
	 	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
};

func int ZS_Smalltalk_Loop ()
{
	return B_SmalltalkLoop();
};

func void ZS_Smalltalk_End ()
{

};
