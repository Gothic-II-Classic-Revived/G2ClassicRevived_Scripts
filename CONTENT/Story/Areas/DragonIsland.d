// Create broad regions first: the highest matching handle supplies music.
var int IrdorathTempleArea;
var int IrdorathCathedralArea;

func void DragonIsland_CreateAreas()
{
	AM_Destroy(IrdorathTempleArea);
	AM_Destroy(IrdorathCathedralArea);

	AreaMusic_CreateDefault("NEWWORLD\\DRAGONISLAND.ZEN",
		"INS_DAY_STD", "INS_DAY_STD",
		"DEF_THR_STD", "DEF_THR_STD",
		"DEF_FGT_STD", "DEF_FGT_STD");

	IrdorathCathedralArea = AM_Create("NEWWORLD\\DRAGONISLAND.ZEN");

	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL01");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL011");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL0111");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL0112");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL0113");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL0114");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL02");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL021");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL022");
	AM_AddPortalRoom(IrdorathCathedralArea, "DRIFINAL03");
	AM_SetMusic(IrdorathCathedralArea,
		"CAT_DAY_STD", "CAT_DAY_STD",
		"DEF_THR_STD", "DEF_THR_STD",
		"DEF_FGT_STD", "DEF_FGT_STD");
	AreaMusic_Register(IrdorathCathedralArea);

	IrdorathTempleArea = AM_Create("NEWWORLD\\DRAGONISLAND.ZEN");

	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD01");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD02");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD03");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD04");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD05");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD06");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD07");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0701");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0702");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0703");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD08");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0801");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0802");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0803");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD09");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0901");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0902");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD0903");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD10");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD1001");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD1002");
	AM_AddPortalRoom(IrdorathTempleArea, "DRIUNDEAD1003");
	AM_SetMusic(IrdorathTempleArea,
		"TMP_DAY_STD", "TMP_DAY_STD",
		"DEF_THR_STD", "DEF_THR_STD",
		"TMP_DAY_FGT", "TMP_DAY_FGT");
	AreaMusic_Register(IrdorathTempleArea);
};
