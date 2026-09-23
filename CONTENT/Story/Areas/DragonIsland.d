const string AREA_MUSIC_DRAGON_ISLAND_DEFAULT_DAY_ID = "INS_DAY_STD";
const string AREA_MUSIC_DRAGON_ISLAND_DEFAULT_NIGHT_ID = "INS_DAY_STD";

const string AREA_MUSIC_DRAGON_ISLAND_TEMPLE_DAY_ID = "TMP_Day_Std";
const string AREA_MUSIC_DRAGON_ISLAND_TEMPLE_NIGHT_ID = "TMP_Day_Std";

const string AREA_MUSIC_DRAGON_ISLAND_CATHEDRAL_DAY_ID = "CAT_Day_Std";
const string AREA_MUSIC_DRAGON_ISLAND_CATHEDRAL_NIGHT_ID = "CAT_Day_Std";

var int IrdorathTempleArea;
var int IrdorathCathedralArea;

func void DragonIsland_UpdateAreaMusic()
{
	// Portal-room areas precede polygons so interiors override surrounding regions.
	if (AM_IsHeroIn(IrdorathTempleArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_DRAGON_ISLAND_TEMPLE_DAY_ID,
			AREA_MUSIC_DRAGON_ISLAND_TEMPLE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(IrdorathCathedralArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_DRAGON_ISLAND_CATHEDRAL_DAY_ID,
			AREA_MUSIC_DRAGON_ISLAND_CATHEDRAL_NIGHT_ID
		);
	}
	else
	{
		AreaMusic_PlayDefault();
	};
};

func void DragonIsland_CreateAreas()
{
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
	AM_Add(IrdorathTempleArea, DragonIsland_UpdateAreaMusic, DragonIsland_UpdateAreaMusic);

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
	AM_Add(IrdorathCathedralArea, DragonIsland_UpdateAreaMusic, DragonIsland_UpdateAreaMusic);

	AreaMusic_SetDefaultThemes(
		AREA_MUSIC_DRAGON_ISLAND_DEFAULT_DAY_ID,
		AREA_MUSIC_DRAGON_ISLAND_DEFAULT_NIGHT_ID
	);
	AM_SetProcessCallback(AreaMusic_PlayDefault);
	AreaMusic_PlayDefault();
};