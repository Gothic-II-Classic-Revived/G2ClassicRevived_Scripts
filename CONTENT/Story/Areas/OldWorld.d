const string AREA_MUSIC_OLDWORLD_DEFAULT_DAY_ID = "OWD_DAY_STD";
const string AREA_MUSIC_OLDWORLD_DEFAULT_NIGHT_ID = "OWD_NGT_STD";

const string AREA_MUSIC_OLDWORLD_OLDCAMP_DAY_ID = "OC_DAY_STD";
const string AREA_MUSIC_OLDWORLD_OLDCAMP_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_OLDCAMP_CASTLE_DAY_ID = "OCC_DAY_STD";
const string AREA_MUSIC_OLDWORLD_OLDCAMP_CASTLE_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_NEW_CAMP_DAY_ID = "NCI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_NEW_CAMP_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_DAY_ID = "FOR_DAY_STD";
const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_TEMPLE_DAY_ID = "BMI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_TEMPLE_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_PSICAMP_DAY_ID = "";
const string AREA_MUSIC_OLDWORLD_PSICAMP_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_PSICAMP_TEMPLE_DAY_ID = "PSI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_PSICAMP_TEMPLE_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_SILVESTRO_MINE_DAY_ID = "SIL_DAY_STD";
const string AREA_MUSIC_OLDWORLD_SILVESTRO_MINE_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_SUNKEN_XARDAS_TOWER_DAY_ID = "DT_DAY_STD";
const string AREA_MUSIC_OLDWORLD_SUNKEN_XARDAS_TOWER_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_OLD_XARDAS_TOWER_DAY_ID = "DT_DAY_STD";
const string AREA_MUSIC_OLDWORLD_OLD_XARDAS_TOWER_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_FOG_TOWER_DAY_ID = "BMI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_FOG_TOWER_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_GOBLIN_CAVE_DAY_ID = "BMI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_GOBLIN_CAVE_NIGHT_ID = "";

var int OldCampArea;
var int OldCampCastleArea;
var int NewCampArea;
var int StoneFortressArea;
var int StoneFortressTempleArea;
var int PsiCampArea;
var int PsiCampTempleArea;
var int SilvestroMineArea;
var int SunkenXardasTowerArea;
var int OldXardasTowerArea;
var int FogTowerArea;
var int GoblinCaveArea;

func void OldWorld_UpdateAreaMusic()
{
	// Portal-room areas precede polygons so interiors override surrounding regions.
	if (AM_IsHeroIn(SilvestroMineArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_SILVESTRO_MINE_DAY_ID,
			AREA_MUSIC_OLDWORLD_SILVESTRO_MINE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(SunkenXardasTowerArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_SUNKEN_XARDAS_TOWER_DAY_ID,
			AREA_MUSIC_OLDWORLD_SUNKEN_XARDAS_TOWER_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(OldXardasTowerArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_OLD_XARDAS_TOWER_DAY_ID,
			AREA_MUSIC_OLDWORLD_OLD_XARDAS_TOWER_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(FogTowerArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_FOG_TOWER_DAY_ID,
			AREA_MUSIC_OLDWORLD_FOG_TOWER_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(GoblinCaveArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_GOBLIN_CAVE_DAY_ID,
			AREA_MUSIC_OLDWORLD_GOBLIN_CAVE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(StoneFortressTempleArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_STONE_FORTRESS_TEMPLE_DAY_ID,
			AREA_MUSIC_OLDWORLD_STONE_FORTRESS_TEMPLE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(StoneFortressArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_STONE_FORTRESS_DAY_ID,
			AREA_MUSIC_OLDWORLD_STONE_FORTRESS_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(OldCampCastleArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_OLDCAMP_CASTLE_DAY_ID,
			AREA_MUSIC_OLDWORLD_OLDCAMP_CASTLE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(PsiCampTempleArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_PSICAMP_TEMPLE_DAY_ID,
			AREA_MUSIC_OLDWORLD_PSICAMP_TEMPLE_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(OldCampArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_OLDCAMP_DAY_ID,
			AREA_MUSIC_OLDWORLD_OLDCAMP_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(NewCampArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_NEW_CAMP_DAY_ID,
			AREA_MUSIC_OLDWORLD_NEW_CAMP_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(PsiCampArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_PSICAMP_DAY_ID,
			AREA_MUSIC_OLDWORLD_PSICAMP_NIGHT_ID
		);
	}
	else
	{
		AreaMusic_PlayDefault();
	};
};

func void OldWorld_CreateAreas()
{
	if (OldCampArea != 0)
	{
		AM_Destroy(OldCampArea);
	};

	if (OldCampCastleArea != 0)
	{
		AM_Destroy(OldCampCastleArea);
	};

	if (NewCampArea != 0)
	{
		AM_Destroy(NewCampArea);
	};

	if (StoneFortressArea != 0)
	{
		AM_Destroy(StoneFortressArea);
	};

	if (StoneFortressTempleArea != 0)
	{
		AM_Destroy(StoneFortressTempleArea);
	};

	if (PsiCampArea != 0)
	{
		AM_Destroy(PsiCampArea);
	};

	if (PsiCampTempleArea != 0)
	{
		AM_Destroy(PsiCampTempleArea);
	};

	if (SilvestroMineArea != 0)
	{
		AM_Destroy(SilvestroMineArea);
	};

	if (SunkenXardasTowerArea != 0)
	{
		AM_Destroy(SunkenXardasTowerArea);
	};

	if (OldXardasTowerArea != 0)
	{
		AM_Destroy(OldXardasTowerArea);
	};

	if (FogTowerArea != 0)
	{
		AM_Destroy(FogTowerArea);
	};

	if (GoblinCaveArea != 0)
	{
		AM_Destroy(GoblinCaveArea);
	};

	SilvestroMineArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPortalRoom(SilvestroMineArea, "SILVESTRO");
	AM_AddPortalRoom(SilvestroMineArea, "CAVE");
	AM_AddPortalRoom(SilvestroMineArea, "KIEDYCZAS");
	AM_AddPortalRoom(SilvestroMineArea, "QUEEN");
	AM_Add(SilvestroMineArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	SunkenXardasTowerArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPortalRoom(SunkenXardasTowerArea, "UTEMP01");
	AM_Add(SunkenXardasTowerArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	OldXardasTowerArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPortalRoom(OldXardasTowerArea, "DTOWER01");
	AM_AddPortalRoom(OldXardasTowerArea, "DTOWER02");
	AM_AddPortalRoom(OldXardasTowerArea, "DTOWER03");
	AM_AddPortalRoom(OldXardasTowerArea, "DTOWER04");
	AM_AddPortalRoom(OldXardasTowerArea, "DTOWER05");
	AM_AddPortalRoom(OldXardasTowerArea, "DTOWER06");
	AM_AddPortalRoom(OldXardasTowerArea, "DTOWER07");
	AM_AddPoint(OldXardasTowerArea, -11605.8, -34644.5);
	AM_AddPoint(OldXardasTowerArea, -11477.9, -34043.1);
	AM_AddPoint(OldXardasTowerArea, -11808.5, -33521.8);
	AM_AddPoint(OldXardasTowerArea, -11283.5, -33181.9);
	AM_AddPoint(OldXardasTowerArea, -10989.8, -34088.6);
	AM_AddPoint(OldXardasTowerArea, -11058.8, -34829.9);
	AM_SetMinHeight(OldXardasTowerArea, 3603.06);
	AM_Add(OldXardasTowerArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	FogTowerArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPortalRoom(FogTowerArea, "ND01");
	AM_AddPortalRoom(FogTowerArea, "ND02");
	AM_AddPortalRoom(FogTowerArea, "ND03");
	AM_AddPortalRoom(FogTowerArea, "ND04");
	AM_Add(FogTowerArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	GoblinCaveArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPortalRoom(GoblinCaveArea, "GOBBO01");
	AM_Add(GoblinCaveArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	StoneFortressTempleArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPortalRoom(StoneFortressTempleArea, "BDTMINE01");
	AM_AddPortalRoom(StoneFortressTempleArea, "TEMPLE");
	AM_Add(StoneFortressTempleArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	StoneFortressArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPoint(StoneFortressArea, 17256.2, -32262.1);
	AM_AddPoint(StoneFortressArea, 15341.6, -34339.0);
	AM_AddPoint(StoneFortressArea, 15978.7, -38779.8);
	AM_AddPoint(StoneFortressArea, 17474.4, -40331.5);
	AM_AddPoint(StoneFortressArea, 18843.4, -40564.3);
	AM_AddPoint(StoneFortressArea, 25124.1, -39691.6);
	AM_AddPoint(StoneFortressArea, 24354.5, -33973.6);
	AM_AddPoint(StoneFortressArea, 21916.1, -31150.2);
	AM_AddPoint(StoneFortressArea, 18265.1, -31981.6);
	AM_AddPortalRoom(StoneFortressArea, "BFG2");
	AM_AddPortalRoom(StoneFortressArea, "GRD1");
	AM_AddPortalRoom(StoneFortressArea, "BF1");
	AM_AddPortalRoom(StoneFortressArea, "BFK");
	AM_AddPortalRoom(StoneFortressArea, "BF2");
	AM_AddPortalRoom(StoneFortressArea, "BFS");
	AM_AddPortalRoom(StoneFortressArea, "BFM");
	AM_AddPortalRoom(StoneFortressArea, "BFT");
	AM_AddPortalRoom(StoneFortressArea, "BFP2");
	AM_AddPortalRoom(StoneFortressArea, "BFP");
	AM_Add(StoneFortressArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	NewCampArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPoint(NewCampArea, -34742.0, -19185.7);
	AM_AddPoint(NewCampArea, -40899.0, -15711.2);
	AM_AddPoint(NewCampArea, -43096.4, -13344.0);
	AM_AddPoint(NewCampArea, -43833.3, -9394.23);
	AM_AddPoint(NewCampArea, -43900.1, -6103.31);
	AM_AddPoint(NewCampArea, -45906.3, -4303.39);
	AM_AddPoint(NewCampArea, -50790.7, -1513.01);
	AM_AddPoint(NewCampArea, -49762.3, 5485.58);
	AM_AddPoint(NewCampArea, -44337.5, 5372.22);
	AM_AddPoint(NewCampArea, -39088.7, 6965.0);
	AM_AddPoint(NewCampArea, -36499.3, 10315.5);
	AM_AddPoint(NewCampArea, -37613.9, 12156.1);
	AM_AddPoint(NewCampArea, -49400.4, 27885.2);
	AM_AddPoint(NewCampArea, -68010.4, 26392.0);
	AM_AddPoint(NewCampArea, -70401.9, 17990.9);
	AM_AddPoint(NewCampArea, -67299.8, 6100.64);
	AM_AddPoint(NewCampArea, -67468.0, -6002.65);
	AM_AddPoint(NewCampArea, -54464.2, -22011.1);
	AM_AddPoint(NewCampArea, -41406.1, -24532.8);
	AM_SetWeather(NewCampArea, 2);
	AM_Add(NewCampArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	OldCampArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPoint(OldCampArea, -7441.92, 6132.27);
	AM_AddPoint(OldCampArea, -6767.91, 5921.54);
	AM_AddPoint(OldCampArea, -6600.44, 5632.46);
	AM_AddPoint(OldCampArea, -5790.92, 5982.38);
	AM_AddPoint(OldCampArea, -4783.82, 6287.54);
	AM_AddPoint(OldCampArea, -3671.42, 6375.67);
	AM_AddPoint(OldCampArea, -2769.92, 6500.52);
	AM_AddPoint(OldCampArea, -1901.91, 6514.61);
	AM_AddPoint(OldCampArea, -580.42, 6397.02);
	AM_AddPoint(OldCampArea, 239.415, 6385.72);
	AM_AddPoint(OldCampArea, 1172.99, 6559.9);
	AM_AddPoint(OldCampArea, 2255.77, 6460.88);
	AM_AddPoint(OldCampArea, 2884.86, 6136.4);
	AM_AddPoint(OldCampArea, 3637.05, 6231.66);
	AM_AddPoint(OldCampArea, 4770.25, 6635.88);
	AM_AddPoint(OldCampArea, 5858.28, 6448.5);
	AM_AddPoint(OldCampArea, 6671.35, 5976.15);
	AM_AddPoint(OldCampArea, 7338.09, 5519.49);
	AM_AddPoint(OldCampArea, 7811.69, 4495.09);
	AM_AddPoint(OldCampArea, 7843.02, 3306.73);
	AM_AddPoint(OldCampArea, 7881.84, 2605.58);
	AM_AddPoint(OldCampArea, 8002.93, 1885.23);
	AM_AddPoint(OldCampArea, 8270.25, 1022.36);
	AM_AddPoint(OldCampArea, 8313.21, 182.733);
	AM_AddPoint(OldCampArea, 8043.53, -1093.76);
	AM_AddPoint(OldCampArea, 7944.28, -1713.54);
	AM_AddPoint(OldCampArea, 8057.38, -2599.11);
	AM_AddPoint(OldCampArea, 7780.32, -3854.85);
	AM_AddPoint(OldCampArea, 7346.31, -4850.88);
	AM_AddPoint(OldCampArea, 6700.92, -5430.77);
	AM_AddPoint(OldCampArea, 5411.03, -5996.92);
	AM_AddPoint(OldCampArea, 5499.38, -6904.06);
	AM_AddPoint(OldCampArea, 4662.1, -7295.24);
	AM_AddPoint(OldCampArea, 4153.86, -7149.7);
	AM_AddPoint(OldCampArea, 3997.29, -6845.83);
	AM_AddPoint(OldCampArea, 3657.23, -6703.19);
	AM_AddPoint(OldCampArea, 2760.31, -7502.75);
	AM_AddPoint(OldCampArea, 2017.13, -7960.79);
	AM_AddPoint(OldCampArea, 1278.35, -7979.7);
	AM_AddPoint(OldCampArea, 626.338, -7981.62);
	AM_AddPoint(OldCampArea, -499.269, -8138.39);
	AM_AddPoint(OldCampArea, -1640.64, -8499.23);
	AM_AddPoint(OldCampArea, -3043.01, -8501.59);
	AM_AddPoint(OldCampArea, -4213.77, -8131.74);
	AM_AddPoint(OldCampArea, -4953.67, -7699.99);
	AM_AddPoint(OldCampArea, -5531.28, -7318.24);
	AM_AddPoint(OldCampArea, -6228.78, -7216.77);
	AM_AddPoint(OldCampArea, -7263.78, -6951.92);
	AM_AddPoint(OldCampArea, -8023.98, -6402.28);
	AM_AddPoint(OldCampArea, -8803.32, -5049.8);
	AM_AddPoint(OldCampArea, -8800.61, -4095.25);
	AM_AddPoint(OldCampArea, -8836.26, -3225.82);
	AM_AddPoint(OldCampArea, -8919.68, -2304.54);
	AM_AddPoint(OldCampArea, -8812.2, -1724.56);
	AM_AddPoint(OldCampArea, -8755.4, -740.158);
	AM_AddPoint(OldCampArea, -8996.96, 274.517);
	AM_AddPoint(OldCampArea, -9147.71, 1497.69);
	AM_AddPoint(OldCampArea, -8986.48, 3369.74);
	AM_AddPoint(OldCampArea, -8006.83, 4832.97);
	AM_AddPoint(OldCampArea, -8061.12, 5186.26);
	AM_AddPoint(OldCampArea, -7969.1, 5840.28);
	AM_Add(OldCampArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	OldCampCastleArea = AM_Create("ValleyOfMines\\OLDWORLD.ZEN");

	AM_AddPoint(OldCampCastleArea, -2950.27, 2325.32);
	AM_AddPoint(OldCampCastleArea, -2352.57, 2622.64);
	AM_AddPoint(OldCampCastleArea, -2215.88, 2409.01);
	AM_AddPoint(OldCampCastleArea, -2154.61, 2347.77);
	AM_AddPoint(OldCampCastleArea, -1475.74, 2539.47);
	AM_AddPoint(OldCampCastleArea, -1532.43, 2879.54);
	AM_AddPoint(OldCampCastleArea, -1080.26, 2864.51);
	AM_AddPoint(OldCampCastleArea, 639.117, 2917.92);
	AM_AddPoint(OldCampCastleArea, 762.267, 2912.38);
	AM_AddPoint(OldCampCastleArea, 744.388, 2281.69);
	AM_AddPoint(OldCampCastleArea, 710.295, 1639.32);
	AM_AddPoint(OldCampCastleArea, 1737.83, 1599.97);
	AM_AddPoint(OldCampCastleArea, 1855.18, 2016.43);
	AM_AddPoint(OldCampCastleArea, 2351.19, 1882.56);
	AM_AddPoint(OldCampCastleArea, 3129.58, 1686.02);
	AM_AddPoint(OldCampCastleArea, 4010.76, 1475.52);
	AM_AddPoint(OldCampCastleArea, 3714.94, 506.769);
	AM_AddPoint(OldCampCastleArea, 4318.03, 353.28);
	AM_AddPoint(OldCampCastleArea, 3828.58, -1617.16);
	AM_AddPoint(OldCampCastleArea, 4437.76, -1735.83);
	AM_AddPoint(OldCampCastleArea, 4092.98, -3110.12);
	AM_AddPoint(OldCampCastleArea, 2780.57, -2774.04);
	AM_AddPoint(OldCampCastleArea, 2824.31, -2450.67);
	AM_AddPoint(OldCampCastleArea, 1824.76, -2447.8);
	AM_AddPoint(OldCampCastleArea, 1819.92, -3651.35);
	AM_AddPoint(OldCampCastleArea, 146.226, -3653.77);
	AM_AddPoint(OldCampCastleArea, 161.318, -3187.93);
	AM_AddPoint(OldCampCastleArea, -553.51, -3190.53);
	AM_AddPoint(OldCampCastleArea, -662.954, -3173.39);
	AM_AddPoint(OldCampCastleArea, -663.193, -3799.14);
	AM_AddPoint(OldCampCastleArea, -1478.14, -3750.54);
	AM_AddPoint(OldCampCastleArea, -3509.94, -3790.08);
	AM_AddPoint(OldCampCastleArea, -3507.52, -3340.29);
	AM_AddPoint(OldCampCastleArea, -4262.04, -3345.55);
	AM_AddPoint(OldCampCastleArea, -4192.81, -3672.43);
	AM_AddPoint(OldCampCastleArea, -5526.03, -3982.95);
	AM_AddPoint(OldCampCastleArea, -5805.99, -2655.6);
	AM_AddPoint(OldCampCastleArea, -5708.75, -2637.71);
	AM_AddPoint(OldCampCastleArea, -5207.1, -2617.65);
	AM_AddPoint(OldCampCastleArea, -5471.67, -1407.28);
	AM_AddPoint(OldCampCastleArea, -6366.27, -1069.59);
	AM_AddPoint(OldCampCastleArea, -5563.18, 1035.02);
	AM_AddPoint(OldCampCastleArea, -5521.17, 1263.34);
	AM_AddPoint(OldCampCastleArea, -4645.86, 936.513);
	AM_AddPoint(OldCampCastleArea, -4112.69, 1565.69);
	AM_AddPoint(OldCampCastleArea, -4212.71, 1754.87);
	AM_AddPoint(OldCampCastleArea, -3581.84, 2037.38);
	AM_Add(OldCampCastleArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	PsiCampArea = AM_Create("ValleyOfMines\\OLDWORLD.ZEN");

	AM_AddPoint(PsiCampArea, 42325.4, -6258.53);
	AM_AddPoint(PsiCampArea, 44248.9, -4769.32);
	AM_AddPoint(PsiCampArea, 42537.9, -1317.9);
	AM_AddPoint(PsiCampArea, 41076.8, 2167.85);
	AM_AddPoint(PsiCampArea, 43209.7, 3609.08);
	AM_AddPoint(PsiCampArea, 45001.7, 6993.6);
	AM_AddPoint(PsiCampArea, 51000.7, 6322.49);
	AM_AddPoint(PsiCampArea, 53599.3, 5499.9);
	AM_AddPoint(PsiCampArea, 62654.2, -6753.81);
	AM_AddPoint(PsiCampArea, 63813.9, -11368.2);
	AM_AddPoint(PsiCampArea, 64120.5, -16190.4);
	AM_AddPoint(PsiCampArea, 61373.8, -17145.1);
	AM_AddPoint(PsiCampArea, 56869.4, -18344.6);
	AM_AddPoint(PsiCampArea, 51489.3, -20417.9);
	AM_AddPoint(PsiCampArea, 50150.4, -20003.2);
	AM_AddPoint(PsiCampArea, 44935.2, -16285.8);
	AM_AddPoint(PsiCampArea, 44383.9, -16031.4);
	AM_AddPoint(PsiCampArea, 42401.0, -11969.2);
	AM_AddPoint(PsiCampArea, 41996.7, -8123.84);
	AM_AddPoint(PsiCampArea, 42057.2, -6512.31);
	AM_SetMaxHeight(PsiCampArea, -1663.31);
	AM_SetWeather(PsiCampArea, 1);
	AM_Add(PsiCampArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	PsiCampTempleArea = AM_Create("ValleyOfMines\\OLDWORLD.ZEN");

	AM_AddPoint(PsiCampTempleArea, 45457.3, -3968.58);
	AM_AddPoint(PsiCampTempleArea, 42513.6, 1151.61);
	AM_AddPoint(PsiCampTempleArea, 42607.7, 2138.6);
	AM_AddPoint(PsiCampTempleArea, 43384.9, 2777.7);
	AM_AddPoint(PsiCampTempleArea, 46206.5, 4554.2);
	AM_AddPoint(PsiCampTempleArea, 47762.3, 5765.55);
	AM_AddPoint(PsiCampTempleArea, 51524.3, 2254.06);
	AM_AddPoint(PsiCampTempleArea, 49534.4, -554.822);
	AM_AddPoint(PsiCampTempleArea, 50382.5, -961.046);
	AM_AddPoint(PsiCampTempleArea, 50857.0, -1372.01);
	AM_AddPoint(PsiCampTempleArea, 51139.9, -2103.35);
	AM_AddPoint(PsiCampTempleArea, 51275.2, -2843.1);
	AM_AddPoint(PsiCampTempleArea, 51136.2, -3693.85);
	AM_AddPoint(PsiCampTempleArea, 50914.2, -4422.29);
	AM_AddPoint(PsiCampTempleArea, 50540.9, -4902.56);
	AM_AddPoint(PsiCampTempleArea, 49244.2, -5790.22);
	AM_AddPoint(PsiCampTempleArea, 48522.4, -6175.5);
	AM_AddPoint(PsiCampTempleArea, 47892.1, -6359.3);
	AM_AddPoint(PsiCampTempleArea, 47260.6, -6299.27);
	AM_AddPoint(PsiCampTempleArea, 46961.8, -6249.22);
	AM_AddPoint(PsiCampTempleArea, 46307.3, -6053.96);
	AM_AddPoint(PsiCampTempleArea, 45801.7, -5713.26);
	AM_AddPoint(PsiCampTempleArea, 45473.1, -5152.41);
	AM_SetMaxHeight(PsiCampTempleArea, -1663.31);
	AM_SetWeather(PsiCampArea, 1);
	AM_Add(PsiCampTempleArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	AreaMusic_SetDefaultThemes(
		AREA_MUSIC_OLDWORLD_DEFAULT_DAY_ID,
		AREA_MUSIC_OLDWORLD_DEFAULT_NIGHT_ID
	);
	AM_SetProcessCallback(OldWorld_UpdateAreaMusic);
	OldWorld_UpdateAreaMusic();
};
