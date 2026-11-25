// **************
// B_GivePlayerXP
// **************

func void B_ApplyEarnedPlayerLevels()
{
	hero.level += 1;
	hero.exp_next += (hero.level + 1) * 500;
	hero.attribute[ATR_HITPOINTS_MAX] += HP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS] += HP_PER_LEVEL;
	hero.LP += LP_PER_LEVEL;

	if (hero.exp_next > 0) && (hero.exp >= hero.exp_next)
	{
		B_ApplyEarnedPlayerLevels();
	};
};

func void B_GivePlayerXP (var int add_xp)
{
	if (hero.level == 0)
	{
		hero.exp_next = 500;
	};
	//----------------------------------------------------------------------------
	hero.exp = hero.exp + add_xp;

	//----------------------------------------------------------------------------
	var string concatText;
	concatText = PRINT_XPGained;
	concatText = ConcatStrings (concatText,	IntToString(add_xp));
	PrintScreen	(concatText, -1, YPOS_XPGained, FONT_ScreenSmall, 2);

	//----------------------------------------------------------------------------
	if (hero.exp_next > 0) && (hero.exp >= hero.exp_next)
	{
		B_ApplyEarnedPlayerLevels();
		PrintScreen (PRINT_LevelUp, -1, YPOS_LevelUp, FONT_Screen, 2);
		Snd_Play ("LevelUp");
	};
	B_Checklog ();
};








