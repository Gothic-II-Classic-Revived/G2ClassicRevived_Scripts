// *********************************
// B_TeachPlayerTalentBowmaking
// *********************************

func int B_TeachPlayerTalentBowmaking (var C_NPC slf, var C_NPC oth, var int weapon)
{
	// ------ Determine learning cost ------
	var int cost;
	cost = B_GetLearnCostTalent (oth, NPC_TALENT_BOWMAKING, weapon);

	// ------ Not enough learning points ------
	if (oth.lp < cost)
	{
		PrintScreen (PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");

		return FALSE;
	};

	// ------ Deduct learning points ------
	oth.lp = oth.lp - cost;

	// ------ Learn bowmaking recipe ------
	if (weapon == WEAPON_RANGED_AMMUNITION)
	{
		PLAYER_TALENT_BOWYER[WEAPON_RANGED_AMMUNITION] = TRUE;
		
		Log_CreateTopic (TOPIC_TalentBowyer, LOG_NOTE);
		B_LogEntry (TOPIC_TalentBowyer, "To craft ranged weapons, I need cut wood, leather and animal trophies. More advanced weapons may require rare materials. Ammunition is made from sticks and steel.");
		
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_AMMO);
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_MAGICAMMO);
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_FIREAMMO);
	};

	if (weapon == WEAPON_BOW_REVIVED_01)
	{
		PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_01] = TRUE;

		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_BOW_REVIVED_01));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_BOW_01);
	};
	if (weapon == WEAPON_BOW_REVIVED_02)
	{
		PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_02] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_BOW_REVIVED_02));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_BOW_02);
	};
	if (weapon == WEAPON_BOW_REVIVED_03)
	{
		PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_03] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_BOW_REVIVED_03));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_BOW_03);
	};
	if (weapon == WEAPON_BOW_REVIVED_04)
	{
		PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_04] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_BOW_REVIVED_04));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_BOW_04);
	};
	if (weapon == WEAPON_BOW_REVIVED_05)
	{
		PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_05] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_BOW_REVIVED_05));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_BOW_05);
	};

	if (weapon == WEAPON_CBOW_REVIVED_01)
	{
		PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_01] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_CBOW_REVIVED_01));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_CBOW_01);
	};
	if (weapon == WEAPON_CBOW_REVIVED_02)
	{
		PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_02] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_CBOW_REVIVED_02));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_CBOW_02);
	};
	if (weapon == WEAPON_CBOW_REVIVED_03)
	{
		PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_03] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_CBOW_REVIVED_03));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_CBOW_03);
	};
	if (weapon == WEAPON_CBOW_REVIVED_04)
	{
		PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_04] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_CBOW_REVIVED_04));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_CBOW_04);
	};
	if (weapon == WEAPON_CBOW_REVIVED_05)
	{
		PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_05] = TRUE;
		
		B_LogEntry (TOPIC_TalentBowyer, ConcatStrings("I can now craft a ", NAME_CBOW_REVIVED_05));
		B_LogEntry (TOPIC_TalentBowyer, LOGENTRY_RECIPE_REVIVED_CBOW_05);
	};

	PrintScreen (PRINT_LearnBowyer, -1, -1, FONT_Screen, 2);

	// Used by the status screen in the same way as smithing.
	Npc_SetTalentSkill (oth, NPC_TALENT_BOWMAKING, 1);

	return TRUE;
};
