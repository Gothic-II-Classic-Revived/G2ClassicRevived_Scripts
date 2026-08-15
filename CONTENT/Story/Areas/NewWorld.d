const string AREA_MUSIC_NEWWORLD_DEFAULT_DAY_ID = "DEF_DAY_STD";
const string AREA_MUSIC_NEWWORLD_DEFAULT_NIGHT_ID = "DEF_NGT_STD";

const string AREA_MUSIC_NEWWORLD_KHORINIS_DAY_ID = "KHO_DAY_STD";
const string AREA_MUSIC_NEWWORLD_KHORINIS_NIGHT_ID = "KHO_NGT_STD";

const string AREA_MUSIC_NEWWORLD_KHORINIS_UPPER_QUARTER_DAY_ID = "OBS_DAY_STD";
const string AREA_MUSIC_NEWWORLD_KHORINIS_UPPER_QUARTER_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_KHORINIS_GARRISON_DAY_ID = "KAS_DAY_STD";
const string AREA_MUSIC_NEWWORLD_KHORINIS_GARRISON_NIGHT_ID = "KAS_NGT_STD";

const string AREA_MUSIC_NEWWORLD_KHORINIS_SEWERS_DAY_ID = "BAN_DAY_STD";
const string AREA_MUSIC_NEWWORLD_KHORINIS_SEWERS_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_KHORINIS_SHIP_DAY_ID = "BAN_DAY_STD";
const string AREA_MUSIC_NEWWORLD_KHORINIS_SHIP_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_MONASTERY_DUNGEON_DAY_ID = "MOD_DAY_STD";
const string AREA_MUSIC_NEWWORLD_MONASTERY_DUNGEON_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_MONASTERY_ROAD_DAY_ID = "MOO_DAY_STD";
const string AREA_MUSIC_NEWWORLD_MONASTERY_ROAD_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_MONASTERY_INSIDE_DAY_ID = "MOI_DAY_STD";
const string AREA_MUSIC_NEWWORLD_MONASTERY_INSIDE_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_XARDAS_TOWER_DAY_ID = "XAR_DAY_STD";
const string AREA_MUSIC_NEWWORLD_XARDAS_TOWER_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_WOODS_DAY_ID = "WOO_DAY_STD";
const string AREA_MUSIC_NEWWORLD_WOODS_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_CAVES_DAY_ID = "BAN_DAY_STD";
const string AREA_MUSIC_NEWWORLD_CAVES_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_PYRAMIDS_DAY_ID = "MAY_DAY_STD";
const string AREA_MUSIC_NEWWORLD_PYRAMIDS_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_PORTAL_DAY_ID = "POR_DAY_STD";
const string AREA_MUSIC_NEWWORLD_PORTAL_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_CRYPT_DAY_ID = "FRI_DAY_STD";
const string AREA_MUSIC_NEWWORLD_CRYPT_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_CEMETERY_DAY_ID = "FRI_DAY_STD";
const string AREA_MUSIC_NEWWORLD_CEMETERY_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_TAVERN_DAY_ID = "";
const string AREA_MUSIC_NEWWORLD_TAVERN_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_LIGHTHOUSE_DAY_ID = "LEU_DAY_STD";
const string AREA_MUSIC_NEWWORLD_LIGHTHOUSE_NIGHT_ID = "";

const string AREA_MUSIC_NEWWORLD_FARM_LOBART_DAY_ID = "LOB_DAY_STD";
const string AREA_MUSIC_NEWWORLD_FARM_LOBART_NIGHT_ID = "LOB_NGT_STD";

const string AREA_MUSIC_NEWWORLD_FARM_AKIL_DAY_ID = "LOB_DAY_STD";
const string AREA_MUSIC_NEWWORLD_FARM_AKIL_NIGHT_ID = "LOB_NGT_STD";

var int KhorinisArea;
var int KhorinisUpperQuarterArea;
var int KhorinisGarrisonArea;
var int KhorinisSewersArea;
var int KhorinisShip;
var int MonasteryDungeonArea;
var int MonasteryRoadArea;
var int MonasteryInsideArea;
var int XardasTowerArea;
var int WoodsArea;
var int CavesArea;
var int PyramidsArea;
var int PortalArea;
var int CryptArea;
var int CemeteryArea;
var int TavernArea;
var int LighthouseArea;
var int FarmLobartArea;
var int FarmAkilArea;

func void NewWorld_UpdateAreaMusic()
{
	// Portal rooms and nested polygons precede their surrounding outdoor regions.
	if (AM_IsHeroIn(MonasteryDungeonArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_MONASTERY_DUNGEON_DAY_ID,
			AREA_MUSIC_NEWWORLD_MONASTERY_DUNGEON_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(PortalArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_PORTAL_DAY_ID,
			AREA_MUSIC_NEWWORLD_PORTAL_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(CryptArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_CRYPT_DAY_ID,
			AREA_MUSIC_NEWWORLD_CRYPT_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(CemeteryArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_CEMETERY_DAY_ID,
			AREA_MUSIC_NEWWORLD_CEMETERY_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(TavernArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_TAVERN_DAY_ID,
			AREA_MUSIC_NEWWORLD_TAVERN_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(XardasTowerArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_XARDAS_TOWER_DAY_ID,
			AREA_MUSIC_NEWWORLD_XARDAS_TOWER_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(CavesArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_CAVES_DAY_ID,
			AREA_MUSIC_NEWWORLD_CAVES_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(MonasteryInsideArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_MONASTERY_INSIDE_DAY_ID,
			AREA_MUSIC_NEWWORLD_MONASTERY_INSIDE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(FarmLobartArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_FARM_LOBART_DAY_ID,
			AREA_MUSIC_NEWWORLD_FARM_LOBART_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(FarmAkilArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_FARM_AKIL_DAY_ID,
			AREA_MUSIC_NEWWORLD_FARM_AKIL_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(LighthouseArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_LIGHTHOUSE_DAY_ID,
			AREA_MUSIC_NEWWORLD_LIGHTHOUSE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(MonasteryRoadArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_MONASTERY_ROAD_DAY_ID,
			AREA_MUSIC_NEWWORLD_MONASTERY_ROAD_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(PyramidsArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_PYRAMIDS_DAY_ID,
			AREA_MUSIC_NEWWORLD_PYRAMIDS_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(WoodsArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_WOODS_DAY_ID,
			AREA_MUSIC_NEWWORLD_WOODS_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(KhorinisSewersArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_KHORINIS_SEWERS_DAY_ID,
			AREA_MUSIC_NEWWORLD_KHORINIS_SEWERS_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(KhorinisShip))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_KHORINIS_SHIP_DAY_ID,
			AREA_MUSIC_NEWWORLD_KHORINIS_SHIP_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(KhorinisGarrisonArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_KHORINIS_GARRISON_DAY_ID,
			AREA_MUSIC_NEWWORLD_KHORINIS_GARRISON_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(KhorinisUpperQuarterArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_KHORINIS_UPPER_QUARTER_DAY_ID,
			AREA_MUSIC_NEWWORLD_KHORINIS_UPPER_QUARTER_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(KhorinisArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_NEWWORLD_KHORINIS_DAY_ID,
			AREA_MUSIC_NEWWORLD_KHORINIS_NIGHT_ID
		);
	}
	else
	{
		AreaMusic_PlayDefault();
	};
};

func void NewWorld_CreateAreas()
{
	if (KhorinisArea != 0)
	{
		AM_Destroy(KhorinisArea);
	};

	if (KhorinisUpperQuarterArea != 0)
	{
		AM_Destroy(KhorinisUpperQuarterArea);
	};

	if (KhorinisGarrisonArea != 0)
	{
		AM_Destroy(KhorinisGarrisonArea);
	};

	if (KhorinisSewersArea != 0)
	{
		AM_Destroy(KhorinisSewersArea);
	};

	if (KhorinisShip != 0)
	{
		AM_Destroy(KhorinisShip);
	};

	if (MonasteryDungeonArea != 0)
	{
		AM_Destroy(MonasteryDungeonArea);
	};

	if (MonasteryRoadArea != 0)
	{
		AM_Destroy(MonasteryRoadArea);
	};

	if (MonasteryInsideArea != 0)
	{
		AM_Destroy(MonasteryInsideArea);
	};

	if (XardasTowerArea != 0)
	{
		AM_Destroy(XardasTowerArea);
	};

	if (WoodsArea != 0)
	{
		AM_Destroy(WoodsArea);
	};

	if (CavesArea != 0)
	{
		AM_Destroy(CavesArea);
	};

	if (PyramidsArea != 0)
	{
		AM_Destroy(PyramidsArea);
	};

	if (PortalArea != 0)
	{
		AM_Destroy(PortalArea);
	};

	if (CryptArea != 0)
	{
		AM_Destroy(CryptArea);
	};

	if (CemeteryArea != 0)
	{
		AM_Destroy(CemeteryArea);
	};

	if (TavernArea != 0)
	{
		AM_Destroy(TavernArea);
	};

	if (LighthouseArea != 0)
	{
		AM_Destroy(LighthouseArea);
	};

	if (FarmLobartArea != 0)
	{
		AM_Destroy(FarmLobartArea);
	};

	if (FarmAkilArea != 0)
	{
		AM_Destroy(FarmAkilArea);
	};

	MonasteryDungeonArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER118");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER119");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER120");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER121");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER122");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER123");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER124");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER125");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER126");
	AM_AddPortalRoom(MonasteryDungeonArea, "KLOSTER127");
	AM_Add(MonasteryDungeonArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	MonasteryRoadArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(MonasteryRoadArea, 37888.3, 3404.6);
	AM_AddPoint(MonasteryRoadArea, 40334.5, 2484.7);
	AM_AddPoint(MonasteryRoadArea, 43094.6, 6600.82);
	AM_AddPoint(MonasteryRoadArea, 42673.3, 10355.0);
	AM_AddPoint(MonasteryRoadArea, 46376.3, 12741.2);
	AM_AddPoint(MonasteryRoadArea, 48116.5, 13033.4);
	AM_AddPoint(MonasteryRoadArea, 51573.6, 15697.9);
	AM_AddPoint(MonasteryRoadArea, 54187.1, 19035.4);
	AM_AddPoint(MonasteryRoadArea, 50338.1, 25196.5);
	AM_AddPoint(MonasteryRoadArea, 43775.7, 25008.3);
	AM_AddPoint(MonasteryRoadArea, 42315.9, 24072.0);
	AM_AddPoint(MonasteryRoadArea, 36519.3, 15833.5);
	AM_AddPoint(MonasteryRoadArea, 36081.0, 7234.22);
	AM_AddPoint(MonasteryRoadArea, 37363.5, 3667.05);
	AM_Add(MonasteryRoadArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	MonasteryInsideArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(MonasteryInsideArea, 46043.9, 18982.8);
	AM_AddPoint(MonasteryInsideArea, 46693.5, 19375.0);
	AM_AddPoint(MonasteryInsideArea, 47520.3, 18004.8);
	AM_AddPoint(MonasteryInsideArea, 46870.9, 17611.8);
	AM_AddPoint(MonasteryInsideArea, 47835.0, 16009.8);
	AM_AddPoint(MonasteryInsideArea, 52351.0, 18733.1);
	AM_AddPoint(MonasteryInsideArea, 49596.1, 23304.0);
	AM_AddPoint(MonasteryInsideArea, 45080.4, 20584.3);
	AM_Add(MonasteryInsideArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	XardasTowerArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(XardasTowerArea, "XARTOWER01");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER02");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER021");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER03");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER04");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER041");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER042");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER05");
	AM_AddPortalRoom(XardasTowerArea, "XARTOWER06");
	AM_AddPoint(XardasTowerArea, 31142.1, -14984.4);
	AM_AddPoint(XardasTowerArea, 30646.0, -15297.2);
	AM_AddPoint(XardasTowerArea, 30215.7, -14854.9);
	AM_AddPoint(XardasTowerArea, 29595.7, -14844.0);
	AM_AddPoint(XardasTowerArea, 29642.3, -14268.1);
	AM_AddPoint(XardasTowerArea, 30451.1, -14445.4);
	AM_SetMinHeight(XardasTowerArea, 5917.0);
	AM_Add(XardasTowerArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	WoodsArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint3D(WoodsArea, 31411.8, 3465.7, -18821.0);
	AM_AddPoint3D(WoodsArea, 31135.8, 3263.01, -8778.73);
	AM_AddPoint3D(WoodsArea, 23351.7, 3002.57, -8166.29);
	AM_AddPoint3D(WoodsArea, 21004.5, 3002.57, -10267.5);
	AM_AddPoint3D(WoodsArea, 20334.7, 5556.29, -9904.75);
	AM_AddPoint3D(WoodsArea, 17803.0, 5761.09, -11013.9);
	AM_AddPoint3D(WoodsArea, 21325.7, 5114.56, -20234.9);
	AM_AddPoint3D(WoodsArea, 24000.6, 3061.89, -19984.2);
	AM_AddPoint3D(WoodsArea, 29421.7, 3190.53, -19631.1);
	AM_Add(WoodsArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	PyramidsArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(PyramidsArea, 74567.8, 21281.4);
	AM_AddPoint(PyramidsArea, 75606.9, 20361.6);
	AM_AddPoint(PyramidsArea, 76073.0, 20041.3);
	AM_AddPoint(PyramidsArea, 77418.0, 19496.3);
	AM_AddPoint(PyramidsArea, 78979.7, 19525.9);
	AM_AddPoint(PyramidsArea, 80953.3, 21550.7);
	AM_AddPoint(PyramidsArea, 81864.8, 26290.2);
	AM_AddPoint(PyramidsArea, 81407.3, 27262.1);
	AM_AddPoint(PyramidsArea, 79385.1, 32003.4);
	AM_AddPoint(PyramidsArea, 74384.1, 35029.9);
	AM_AddPoint(PyramidsArea, 73329.6, 34241.1);
	AM_AddPoint(PyramidsArea, 72694.6, 32973.0);
	AM_AddPoint(PyramidsArea, 72314.5, 31963.9);
	AM_AddPoint(PyramidsArea, 72049.1, 30209.6);
	AM_AddPoint(PyramidsArea, 71717.1, 29458.8);
	AM_AddPoint(PyramidsArea, 70920.3, 28775.4);
	AM_AddPoint(PyramidsArea, 70473.9, 28550.4);
	AM_AddPoint(PyramidsArea, 71037.3, 25491.4);
	AM_AddPoint(PyramidsArea, 74164.4, 21687.3);
	AM_Add(PyramidsArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	PortalArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON01");
	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON02");
	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON03");
	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON04");
	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON05");
	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON06");
	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON07");
	AM_AddPortalRoom(PortalArea, "TROLLPORTADDON08");
	AM_Add(PortalArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	CavesArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(CavesArea, "XARCAVE01");
	AM_AddPortalRoom(CavesArea, "XARCAVE02");
	AM_AddPortalRoom(CavesArea, "BANCAVE01");
	AM_AddPortalRoom(CavesArea, "TROLLCAVE03");
	AM_AddPortalRoom(CavesArea, "TROLLMAGECAVE01");
	AM_AddPortalRoom(CavesArea, "TROLLMAGECAVE011");
	AM_AddPortalRoom(CavesArea, "TROLLCAVE01");
	AM_AddPortalRoom(CavesArea, "TROLLCAVE02");
	AM_AddPortalRoom(CavesArea, "GRPCAVE01");
	AM_AddPortalRoom(CavesArea, "GRPCAVE04");
	AM_AddPortalRoom(CavesArea, "GRPCAVE05");
	AM_AddPortalRoom(CavesArea, "GRPCAVE03");
	AM_AddPortalRoom(CavesArea, "NWFORRESTCAVE06");
	AM_AddPortalRoom(CavesArea, "NWFORRESTCAVE04");
	AM_AddPortalRoom(CavesArea, "NWFORRESTCAVE03");
	AM_AddPortalRoom(CavesArea, "NWFORRESTCAVE01");
	AM_AddPortalRoom(CavesArea, "NWCAVE01");
	AM_AddPortalRoom(CavesArea, "SMALLISLAND");
	AM_Add(CavesArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	CryptArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(CryptArea, "CEMENTARY01");
	AM_AddPortalRoom(CryptArea, "CEMENTARY02");
	AM_AddPortalRoom(CryptArea, "CEMENTARY03");
	AM_AddPortalRoom(CryptArea, "CEMENTARY04");
	AM_AddPortalRoom(CryptArea, "CEMENTARY05");
	AM_Add(CryptArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	CemeteryArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(CemeteryArea, "NWFORRESTCAVE05");
	AM_AddPoint(CemeteryArea, 35847.5, -8819.19);
	AM_AddPoint(CemeteryArea, 35556.4, -8454.52);
	AM_AddPoint(CemeteryArea, 34203.3, -6624.9);
	AM_AddPoint(CemeteryArea, 32463.8, -6893.88);
	AM_AddPoint(CemeteryArea, 31329.6, -7618.61);
	AM_AddPoint(CemeteryArea, 30895.1, -9819.3);
	AM_AddPoint(CemeteryArea, 33275.4, -12507.1);
	AM_AddPoint(CemeteryArea, 36758.7, -12873.3);
	AM_Add(CemeteryArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	TavernArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(TavernArea, "FORESTHERBERGE01");
	AM_Add(TavernArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	LighthouseArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(LighthouseArea, -1633.78, 15429.0);
	AM_AddPoint(LighthouseArea, -339.481, 16241.5);
	AM_AddPoint(LighthouseArea, -829.491, 17016.2);
	AM_AddPoint(LighthouseArea, -1320.33, 16708.3);
	AM_AddPoint(LighthouseArea, -1491.56, 16977.9);
	AM_AddPoint(LighthouseArea, -2293.54, 16477.9);
	AM_SetMinHeight(LighthouseArea, 2420.0);
	AM_Add(LighthouseArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	FarmAkilArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(FarmAkilArea, 27695.1, 6707.15);
	AM_AddPoint(FarmAkilArea, 29510.8, 6423.04);
	AM_AddPoint(FarmAkilArea, 30914.2, 6060.04);
	AM_AddPoint(FarmAkilArea, 31508.7, 5011.01);
	AM_AddPoint(FarmAkilArea, 33168.9, 4989.6);
	AM_AddPoint(FarmAkilArea, 34259.7, 6858.08);
	AM_AddPoint(FarmAkilArea, 33986.1, 9123.3);
	AM_AddPoint(FarmAkilArea, 32853.0, 10934.4);
	AM_AddPoint(FarmAkilArea, 31464.0, 11249.8);
	AM_AddPoint(FarmAkilArea, 29924.5, 11541.5);
	AM_AddPoint(FarmAkilArea, 28796.7, 10926.4);
	AM_AddPoint(FarmAkilArea, 28219.3, 9965.86);
	AM_AddPoint(FarmAkilArea, 27405.7, 8528.08);
	AM_SetMaxHeight(FarmAkilArea, 4364.5);
	AM_SetMinHeight(FarmAkilArea, 3258.9);
	AM_Add(FarmAkilArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	FarmLobartArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(FarmLobartArea, 13354.4, -20561.4);
	AM_AddPoint(FarmLobartArea, 11729.6, -19491.5);
	AM_AddPoint(FarmLobartArea, 9777.99, -17230.3);
	AM_AddPoint(FarmLobartArea, 8955.08, -15400.4);
	AM_AddPoint(FarmLobartArea, 8838.85, -13990.1);
	AM_AddPoint(FarmLobartArea, 8776.72, -12915.6);
	AM_AddPoint(FarmLobartArea, 9298.65, -12191.0);
	AM_AddPoint(FarmLobartArea, 9936.16, -12090.2);
	AM_AddPoint(FarmLobartArea, 10162.7, -11387.4);
	AM_AddPoint(FarmLobartArea, 10217.8, -10744.5);
	AM_AddPoint(FarmLobartArea, 10614.6, -10439.6);
	AM_AddPoint(FarmLobartArea, 11030.8, -10003.5);
	AM_AddPoint(FarmLobartArea, 12563.5, -10113.8);
	AM_AddPoint(FarmLobartArea, 13969.5, -11103.4);
	AM_AddPoint(FarmLobartArea, 16998.3, -12201.1);
	AM_AddPoint(FarmLobartArea, 17692.1, -13057.1);
	AM_AddPoint(FarmLobartArea, 18852.8, -14250.9);
	AM_AddPoint(FarmLobartArea, 18758.7, -14650.7);
	AM_Add(FarmLobartArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	KhorinisUpperQuarterArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(KhorinisUpperQuarterArea, 10073.5, -6252.42);
	AM_AddPoint(KhorinisUpperQuarterArea, 10909.8, -5995.05);
	AM_AddPoint(KhorinisUpperQuarterArea, 11583.6, -5759.3);
	AM_AddPoint(KhorinisUpperQuarterArea, 12310.1, -4958.86);
	AM_AddPoint(KhorinisUpperQuarterArea, 13426.3, -4816.34);
	AM_AddPoint(KhorinisUpperQuarterArea, 14031.4, -4649.48);
	AM_AddPoint(KhorinisUpperQuarterArea, 14731.8, -5021.61);
	AM_AddPoint(KhorinisUpperQuarterArea, 15567.0, -5229.41);
	AM_AddPoint(KhorinisUpperQuarterArea, 15947.9, -5029.46);
	AM_AddPoint(KhorinisUpperQuarterArea, 16190.4, -4526.37);
	AM_AddPoint(KhorinisUpperQuarterArea, 16649.2, -4227.68);
	AM_AddPoint(KhorinisUpperQuarterArea, 17185.8, -4172.74);
	AM_AddPoint(KhorinisUpperQuarterArea, 17521.4, -3810.24);
	AM_AddPoint(KhorinisUpperQuarterArea, 17710.5, -3313.96);
	AM_AddPoint(KhorinisUpperQuarterArea, 17913.2, -2744.95);
	AM_AddPoint(KhorinisUpperQuarterArea, 18043.4, -2088.54);
	AM_AddPoint(KhorinisUpperQuarterArea, 17652.3, -1263.59);
	AM_AddPoint(KhorinisUpperQuarterArea, 17668.6, -570.205);
	AM_AddPoint(KhorinisUpperQuarterArea, 17400.1, -33.6985);
	AM_AddPoint(KhorinisUpperQuarterArea, 17072.4, 571.082);
	AM_AddPoint(KhorinisUpperQuarterArea, 16501.1, 1168.33);
	AM_AddPoint(KhorinisUpperQuarterArea, 15884.8, 1456.2);
	AM_AddPoint(KhorinisUpperQuarterArea, 15417.8, 1843.38);
	AM_AddPoint(KhorinisUpperQuarterArea, 14434.9, 2763.04);
	AM_AddPoint(KhorinisUpperQuarterArea, 13956.6, 3088.0);
	AM_AddPoint(KhorinisUpperQuarterArea, 13600.4, 3233.89);
	AM_AddPoint(KhorinisUpperQuarterArea, 13107.4, 3570.78);
	AM_AddPoint(KhorinisUpperQuarterArea, 11718.5, 4078.2);
	AM_AddPoint(KhorinisUpperQuarterArea, 10484.7, 3309.55);
	AM_AddPoint(KhorinisUpperQuarterArea, 10804.0, 2759.92);
	AM_AddPoint(KhorinisUpperQuarterArea, 10722.5, 2370.9);
	AM_AddPoint(KhorinisUpperQuarterArea, 10113.7, 2196.71);
	AM_AddPoint(KhorinisUpperQuarterArea, 10512.7, 765.127);
	AM_AddPoint(KhorinisUpperQuarterArea, 10605.6, 1259.97);
	AM_AddPoint(KhorinisUpperQuarterArea, 10824.6, -1668.81);
	AM_AddPoint(KhorinisUpperQuarterArea, 9833.0, -2871.54);
	AM_AddPoint(KhorinisUpperQuarterArea, 9186.8, -3620.71);
	AM_AddPoint(KhorinisUpperQuarterArea, 9848.16, -6333.03);
	AM_SetMinHeight(KhorinisUpperQuarterArea, 598.915);
	AM_Add(KhorinisUpperQuarterArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	KhorinisGarrisonArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(KhorinisGarrisonArea, 6266.11, 4930.75);
	AM_AddPoint(KhorinisGarrisonArea, 7841.21, 5820.24);
	AM_AddPoint(KhorinisGarrisonArea, 8147.2, 6906.1);
	AM_AddPoint(KhorinisGarrisonArea, 6361.58, 10069.4);
	AM_AddPoint(KhorinisGarrisonArea, 5530.09, 9913.87);
	AM_AddPoint(KhorinisGarrisonArea, 1870.12, 7845.46);
	AM_AddPoint(KhorinisGarrisonArea, 2404.75, 6594.48);
	AM_AddPoint(KhorinisGarrisonArea, 1752.8, 6225.75);
	AM_AddPoint(KhorinisGarrisonArea, 3006.81, 4006.39);
	AM_AddPoint(KhorinisGarrisonArea, 4177.3, 3750.19);
	AM_SetMinHeight(KhorinisGarrisonArea, 736.901);
	AM_Add(KhorinisGarrisonArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	KhorinisSewersArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV01");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV02");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV03");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV04");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV05");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV06");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV07");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV08");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV09");
	AM_AddPortalRoom(KhorinisSewersArea, "CTYTHIEV10");
	AM_Add(KhorinisSewersArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	KhorinisShip = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(KhorinisShip, -14972.1, -8024.61);
	AM_AddPoint(KhorinisShip, -9155.01, -7905.6);
	AM_AddPoint(KhorinisShip, -7308.87, -7643.99);
	AM_AddPoint(KhorinisShip, -6254.7, -8672.31);
	AM_AddPoint(KhorinisShip, -4521.21, -10039.2);
	AM_AddPoint(KhorinisShip, -4452.46, -11043.2);
	AM_AddPoint(KhorinisShip, -5037.74, -11798.8);
	AM_AddPoint(KhorinisShip, -3961.24, -15848.8);
	AM_AddPoint(KhorinisShip, -2542.65, -21000.9);
	AM_AddPoint(KhorinisShip, -1811.33, -21951.4);
	AM_AddPoint(KhorinisShip, -3120.76, -23776.5);
	AM_AddPoint(KhorinisShip, -5184.57, -24284.7);
	AM_AddPoint(KhorinisShip, -12016.4, -24903.1);
	AM_AddPoint(KhorinisShip, -15166.7, -9461.29);
	AM_Add(KhorinisShip, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);

	KhorinisArea = AM_Create("NEWWORLD\\NEWWORLD.ZEN");

	AM_AddPoint(KhorinisArea, -603.625, -6446.62);
	AM_AddPoint(KhorinisArea, -427.038, -6385.18);
	AM_AddPoint(KhorinisArea, -120.676, -6534.55);
	AM_AddPoint(KhorinisArea, 264.085, -6459.86);
	AM_AddPoint(KhorinisArea, 768.118, -6485.57);
	AM_AddPoint(KhorinisArea, 1263.38, -6601.68);
	AM_AddPoint(KhorinisArea, 1642.66, -6580.76);
	AM_AddPoint(KhorinisArea, 1871.1, -6274.02);
	AM_AddPoint(KhorinisArea, 2052.11, -6247.31);
	AM_AddPoint(KhorinisArea, 2330.35, -6450.76);
	AM_AddPoint(KhorinisArea, 2676.22, -6507.1);
	AM_AddPoint(KhorinisArea, 3022.49, -6700.53);
	AM_AddPoint(KhorinisArea, 3704.46, -7461.08);
	AM_AddPoint(KhorinisArea, 3753.55, -7477.55);
	AM_AddPoint(KhorinisArea, 4154.47, -7507.55);
	AM_AddPoint(KhorinisArea, 4477.26, -7312.96);
	AM_AddPoint(KhorinisArea, 4764.89, -6984.0);
	AM_AddPoint(KhorinisArea, 5231.54, -6607.69);
	AM_AddPoint(KhorinisArea, 5945.6, -6015.95);
	AM_AddPoint(KhorinisArea, 6220.2, -6058.81);
	AM_AddPoint(KhorinisArea, 6330.82, -6039.54);
	AM_AddPoint(KhorinisArea, 6515.55, -6012.37);
	AM_AddPoint(KhorinisArea, 6986.6, -6138.39);
	AM_AddPoint(KhorinisArea, 6958.62, -6329.11);
	AM_AddPoint(KhorinisArea, 7110.98, -6433.33);
	AM_AddPoint(KhorinisArea, 7397.88, -6469.77);
	AM_AddPoint(KhorinisArea, 7568.73, -6407.4);
	AM_AddPoint(KhorinisArea, 7814.67, -6437.88);
	AM_AddPoint(KhorinisArea, 8203.36, -6488.38);
	AM_AddPoint(KhorinisArea, 8444.02, -6521.28);
	AM_AddPoint(KhorinisArea, 8591.57, -6627.99);
	AM_AddPoint(KhorinisArea, 8889.78, -6667.04);
	AM_AddPoint(KhorinisArea, 9005.41, -6578.8);
	AM_AddPoint(KhorinisArea, 9075.4, -6414.58);
	AM_AddPoint(KhorinisArea, 9438.53, -6442.51);
	AM_AddPoint(KhorinisArea, 9845.49, -6330.13);
	AM_AddPoint(KhorinisArea, 10073.5, -6252.42);
	AM_AddPoint(KhorinisArea, 10909.8, -5995.05);
	AM_AddPoint(KhorinisArea, 11583.6, -5759.3);
	AM_AddPoint(KhorinisArea, 12310.1, -4958.86);
	AM_AddPoint(KhorinisArea, 13426.3, -4816.34);
	AM_AddPoint(KhorinisArea, 14031.4, -4649.48);
	AM_AddPoint(KhorinisArea, 14731.8, -5021.61);
	AM_AddPoint(KhorinisArea, 15567.0, -5229.41);
	AM_AddPoint(KhorinisArea, 15947.9, -5029.46);
	AM_AddPoint(KhorinisArea, 16190.4, -4526.37);
	AM_AddPoint(KhorinisArea, 16649.2, -4227.68);
	AM_AddPoint(KhorinisArea, 17185.8, -4172.74);
	AM_AddPoint(KhorinisArea, 17521.4, -3810.24);
	AM_AddPoint(KhorinisArea, 17710.5, -3313.96);
	AM_AddPoint(KhorinisArea, 17913.2, -2744.95);
	AM_AddPoint(KhorinisArea, 18043.4, -2088.54);
	AM_AddPoint(KhorinisArea, 17652.3, -1263.59);
	AM_AddPoint(KhorinisArea, 17668.6, -570.205);
	AM_AddPoint(KhorinisArea, 17400.1, -33.6985);
	AM_AddPoint(KhorinisArea, 17072.4, 571.082);
	AM_AddPoint(KhorinisArea, 16501.1, 1168.33);
	AM_AddPoint(KhorinisArea, 15884.8, 1456.2);
	AM_AddPoint(KhorinisArea, 15417.8, 1843.38);
	AM_AddPoint(KhorinisArea, 14434.9, 2763.04);
	AM_AddPoint(KhorinisArea, 13956.6, 3088.0);
	AM_AddPoint(KhorinisArea, 13600.4, 3233.89);
	AM_AddPoint(KhorinisArea, 13107.4, 3570.78);
	AM_AddPoint(KhorinisArea, 11718.5, 4078.2);
	AM_AddPoint(KhorinisArea, 11233.1, 4469.98);
	AM_AddPoint(KhorinisArea, 11100.7, 4949.15);
	AM_AddPoint(KhorinisArea, 11211.3, 5081.33);
	AM_AddPoint(KhorinisArea, 11241.8, 2540.94);
	AM_AddPoint(KhorinisArea, 11081.1, 5487.28);
	AM_AddPoint(KhorinisArea, 10931.0, 5518.06);
	AM_AddPoint(KhorinisArea, 10789.7, 5772.8);
	AM_AddPoint(KhorinisArea, 10438.1, 6315.2);
	AM_AddPoint(KhorinisArea, 10426.5, 6489.94);
	AM_AddPoint(KhorinisArea, 10265.7, 6745.71);
	AM_AddPoint(KhorinisArea, 10108.8, 6777.67);
	AM_AddPoint(KhorinisArea, 9947.55, 6726.54);
	AM_AddPoint(KhorinisArea, 9728.13, 7025.11);
	AM_AddPoint(KhorinisArea, 9377.12, 7368.96);
	AM_AddPoint(KhorinisArea, 8874.2, 7501.27);
	AM_AddPoint(KhorinisArea, 8405.5, 7376.63);
	AM_AddPoint(KhorinisArea, 8184.3, 7252.19);
	AM_AddPoint(KhorinisArea, 7894.46, 7346.86);
	AM_AddPoint(KhorinisArea, 6363.69, 10067.9);
	AM_AddPoint(KhorinisArea, 5533.15, 9914.13);
	AM_AddPoint(KhorinisArea, 1870.12, 7845.46);
	AM_AddPoint(KhorinisArea, 2444.91, 6828.87);
	AM_AddPoint(KhorinisArea, 2403.91, 6593.99);
	AM_AddPoint(KhorinisArea, 1102.02, 5860.84);
	AM_AddPoint(KhorinisArea, 753.039, 5122.9);
	AM_AddPoint(KhorinisArea, 100.424, 4535.99);
	AM_AddPoint(KhorinisArea, -462.5, 4462.08);
	AM_AddPoint(KhorinisArea, -579.066, 5865.02);
	AM_AddPoint(KhorinisArea, -1704.7, 6000.56);
	AM_AddPoint(KhorinisArea, -2509.62, 5411.31);
	AM_AddPoint(KhorinisArea, -13465.4, -5758.07);
	AM_AddPoint(KhorinisArea, -10586.7, -7965.66);
	AM_AddPoint(KhorinisArea, -7592.71, -8469.63);
	AM_AddPoint(KhorinisArea, -605.063, -6446.88);

	AM_Add(KhorinisArea, NewWorld_UpdateAreaMusic, NewWorld_UpdateAreaMusic);
	AreaMusic_SetDefaultThemes(
		AREA_MUSIC_NEWWORLD_DEFAULT_DAY_ID,
		AREA_MUSIC_NEWWORLD_DEFAULT_NIGHT_ID
	);
	AM_SetProcessCallback(NewWorld_UpdateAreaMusic);
	NewWorld_UpdateAreaMusic();
};
