const string AREA_MUSIC_OLDWORLD_DEFAULT_DAY_ID = "OWD_DAY_STD";
const string AREA_MUSIC_OLDWORLD_DEFAULT_NIGHT_ID = "OWD_NGT_STD";

const string AREA_MUSIC_OLDWORLD_OLDCAMP_DAY_ID = "OC_DAY_STD";
const string AREA_MUSIC_OLDWORLD_OLDCAMP_NIGHT_ID = "OC_DAY_STD";

const string AREA_MUSIC_OLDWORLD_OLDCAMP_CASTLE_DAY_ID = "OCC_DAY_STD";
const string AREA_MUSIC_OLDWORLD_OLDCAMP_CASTLE_NIGHT_ID = "OCC_DAY_STD";

const string AREA_MUSIC_OLDWORLD_NEW_CAMP_DAY_ID = "NCI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_NEW_CAMP_NIGHT_ID = "NCI_DAY_STD";

const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_DAY_ID = "FOR_DAY_STD";
const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_NIGHT_ID = "";

const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_TEMPLE_DAY_ID = "BMI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_STONE_FORTRESS_TEMPLE_NIGHT_ID = "BMI_DAY_STD";

const string AREA_MUSIC_OLDWORLD_PSICAMP_DAY_ID = "SWA_DAY_STD";
const string AREA_MUSIC_OLDWORLD_PSICAMP_NIGHT_ID = "SWA_DAY_STD";

const string AREA_MUSIC_OLDWORLD_PSICAMP_TEMPLE_DAY_ID = "PSI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_PSICAMP_TEMPLE_NIGHT_ID = "PSI_DAY_STD";

const string AREA_MUSIC_OLDWORLD_SILVESTRO_MINE_DAY_ID = "SIL_DAY_STD";
const string AREA_MUSIC_OLDWORLD_SILVESTRO_MINE_NIGHT_ID = "SIL_DAY_STD";

const string AREA_MUSIC_OLDWORLD_SUNKEN_XARDAS_TOWER_DAY_ID = "DT_DAY_STD";
const string AREA_MUSIC_OLDWORLD_SUNKEN_XARDAS_TOWER_NIGHT_ID = "DT_DAY_STD";

const string AREA_MUSIC_OLDWORLD_OLD_XARDAS_TOWER_DAY_ID = "DT_DAY_STD";
const string AREA_MUSIC_OLDWORLD_OLD_XARDAS_TOWER_NIGHT_ID = "DT_DAY_STD";

const string AREA_MUSIC_OLDWORLD_FOG_TOWER_DAY_ID = "BMI_DAY_STD";
const string AREA_MUSIC_OLDWORLD_FOG_TOWER_NIGHT_ID = "BMI_DAY_STD";

const string AREA_MUSIC_OLDWORLD_GOBLIN_CAVE_DAY_ID = "BAN_DAY_STD";
const string AREA_MUSIC_OLDWORLD_GOBLIN_CAVE_NIGHT_ID = "BAN_DAY_STD";

const string AREA_MUSIC_OLDWORLD_ORC_TERRITORY_DAY_ID = "ORC_DAY_STD";
const string AREA_MUSIC_OLDWORLD_ORC_TERRITORY_NIGHT_ID = "ORC_DAY_STD";

const string AREA_MUSIC_OLDWORLD_SEA_MONASTERY_DAY_ID = "SEA_DAY_STD";
const string AREA_MUSIC_OLDWORLD_SEA_MONASTERY_NIGHT_ID = "SEA_DAY_STD";

const string AREA_MUSIC_OLDWORLD_VOLCANO_DAY_ID = "TRC_DAY_STD";
const string AREA_MUSIC_OLDWORLD_VOLCANO_NIGHT_ID = "TRC_DAY_STD";

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
var int OrcTerritoryArea;
var int SeaMonasteryArea;
var int VolcanoArea;

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
	else if (AM_IsHeroIn(SeaMonasteryArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_SEA_MONASTERY_DAY_ID,
			AREA_MUSIC_OLDWORLD_SEA_MONASTERY_NIGHT_ID
		);
	}
	else if (AM_IsHeroIn(VolcanoArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_VOLCANO_DAY_ID,
			AREA_MUSIC_OLDWORLD_VOLCANO_NIGHT_ID
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
	else if (AM_IsHeroIn(OrcTerritoryArea))
	{
		AreaMusic_PlayDayNight(
			AREA_MUSIC_OLDWORLD_ORC_TERRITORY_DAY_ID,
			AREA_MUSIC_OLDWORLD_ORC_TERRITORY_NIGHT_ID
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

	if (OrcTerritoryArea != 0)
	{
		AM_Destroy(OrcTerritoryArea);
	};

	if (SeaMonasteryArea != 0)
	{
		AM_Destroy(SeaMonasteryArea);
	};

	if (VolcanoArea != 0)
	{
		AM_Destroy(VolcanoArea);
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

	OrcTerritoryArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPoint(OrcTerritoryArea, 10856.6, 16982.0);
	AM_AddPoint(OrcTerritoryArea, 11900.2, 16296.5);
	AM_AddPoint(OrcTerritoryArea, 13130.8, 15727.5);
	AM_AddPoint(OrcTerritoryArea, 14963.8, 14678.7);
	AM_AddPoint(OrcTerritoryArea, 15848.9, 13804.1);
	AM_AddPoint(OrcTerritoryArea, 16945.8, 12996.9);
	AM_AddPoint(OrcTerritoryArea, 18304.7, 11799.4);
	AM_AddPoint(OrcTerritoryArea, 19210.4, 10923.5);
	AM_AddPoint(OrcTerritoryArea, 20589.4, 10109.6);
	AM_AddPoint(OrcTerritoryArea, 21110.0, 9399.92);
	AM_AddPoint(OrcTerritoryArea, 21741.4, 8712.28);
	AM_AddPoint(OrcTerritoryArea, 22187.6, 7514.96);
	AM_AddPoint(OrcTerritoryArea, 22649.9, 6327.1);
	AM_AddPoint(OrcTerritoryArea, 23444.4, 4341.43);
	AM_AddPoint(OrcTerritoryArea, 22696.4, 3230.72);
	AM_AddPoint(OrcTerritoryArea, 22320.2, 2531.62);
	AM_AddPoint(OrcTerritoryArea, 21719.9, 1731.81);
	AM_AddPoint(OrcTerritoryArea, 20601.0, 1212.92);
	AM_AddPoint(OrcTerritoryArea, 19433.6, 557.653);
	AM_AddPoint(OrcTerritoryArea, 17882.3, -173.822);
	AM_AddPoint(OrcTerritoryArea, 17200.6, -1077.63);
	AM_AddPoint(OrcTerritoryArea, 16696.8, -2152.14);
	AM_AddPoint(OrcTerritoryArea, 15582.9, -4010.47);
	AM_AddPoint(OrcTerritoryArea, 15672.9, -5284.9);
	AM_AddPoint(OrcTerritoryArea, 15993.0, -6552.03);
	AM_AddPoint(OrcTerritoryArea, 16138.5, -8433.04);
	AM_AddPoint(OrcTerritoryArea, 16464.2, -9661.44);
	AM_AddPoint(OrcTerritoryArea, 17023.1, -10796.4);
	AM_AddPoint(OrcTerritoryArea, 17781.6, -12881.8);
	AM_AddPoint(OrcTerritoryArea, 18701.7, -13888.7);
	AM_AddPoint(OrcTerritoryArea, 20045.0, -15640.6);
	AM_AddPoint(OrcTerritoryArea, 21224.8, -15318.9);
	AM_AddPoint(OrcTerritoryArea, 22533.1, -14880.3);
	AM_AddPoint(OrcTerritoryArea, 24270.1, -14432.5);
	AM_AddPoint(OrcTerritoryArea, 25348.1, -14323.3);
	AM_AddPoint(OrcTerritoryArea, 29069.9, -14283.5);
	AM_AddPoint(OrcTerritoryArea, 30571.0, -16679.4);
	AM_AddPoint(OrcTerritoryArea, 30438.4, -18022.0);
	AM_AddPoint(OrcTerritoryArea, 29535.7, -25435.3);
	AM_AddPoint(OrcTerritoryArea, 33529.6, -36736.0);
	AM_AddPoint(OrcTerritoryArea, 50671.8, -42813.4);
	AM_AddPoint(OrcTerritoryArea, 67767.4, -36358.0);
	AM_AddPoint(OrcTerritoryArea, 84661.7, -34403.1);
	AM_AddPoint(OrcTerritoryArea, 57773.5, 60455.6);
	AM_AddPoint(OrcTerritoryArea, 20032.6, 38888.0);
	AM_AddPoint(OrcTerritoryArea, 11891.4, 29347.0);
	AM_AddPoint(OrcTerritoryArea, 11163.9, 22763.5);
	AM_AddPoint(OrcTerritoryArea, 11932.4, 17680.6);
	AM_Add(OrcTerritoryArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	SeaMonasteryArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPoint(SeaMonasteryArea, 20905.0, 19149.5);
	AM_AddPoint(SeaMonasteryArea, 21489.6, 19481.5);
	AM_AddPoint(SeaMonasteryArea, 22158.6, 19973.9);
	AM_AddPoint(SeaMonasteryArea, 26190.1, 25067.2);
	AM_AddPoint(SeaMonasteryArea, 27609.9, 27700.0);
	AM_AddPoint(SeaMonasteryArea, 27931.1, 31307.1);
	AM_AddPoint(SeaMonasteryArea, 19205.5, 34710.6);
	AM_AddPoint(SeaMonasteryArea, 12433.4, 32107.8);
	AM_AddPoint(SeaMonasteryArea, 15111.4, 20573.2);
	AM_AddPoint(SeaMonasteryArea, 15710.7, 20513.3);
	AM_AddPoint(SeaMonasteryArea, 17275.2, 20469.3);
	AM_AddPoint(SeaMonasteryArea, 18522.5, 20308.2);
	AM_SetMinHeight(SeaMonasteryArea, -400.0);
	AM_SetMaxHeight(SeaMonasteryArea, 6360.0);
	AM_Add(SeaMonasteryArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	VolcanoArea = AM_Create("VALLEYOFMINES\\OLDWORLD.ZEN");

	AM_AddPoint(VolcanoArea, -15750.8, 32134.9);
	AM_AddPoint(VolcanoArea, -14650.4, 34238.5);
	AM_AddPoint(VolcanoArea, -15058.9, 35976.4);
	AM_AddPoint(VolcanoArea, -16683.0, 38134.7);
	AM_AddPoint(VolcanoArea, -19865.5, 37135.3);
	AM_AddPoint(VolcanoArea, -21567.5, 34875.3);
	AM_AddPoint(VolcanoArea, -21135.4, 32077.8);
	AM_AddPoint(VolcanoArea, -20803.7, 27594.5);
	AM_Add(VolcanoArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

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

	AM_AddPoint(PsiCampArea, 44248.8, -4768.57);
	AM_AddPoint(PsiCampArea, 42330.6, -6256.46);
	AM_AddPoint(PsiCampArea, 42059.1, -6507.81);
	AM_AddPoint(PsiCampArea, 40033.4, -16065.0);
	AM_AddPoint(PsiCampArea, 40130.6, -40790.8);
	AM_AddPoint(PsiCampArea, 77034.1, -34464.2);
	AM_AddPoint(PsiCampArea, 65559.9, 2966.63);
	AM_AddPoint(PsiCampArea, 50297.5, 4759.91);
	AM_AddPoint(PsiCampArea, 43111.2, 4913.57);
	AM_AddPoint(PsiCampArea, 40128.4, 433.446);
	AM_SetMaxHeight(PsiCampArea, -1500.0);
	AM_SetWeather(PsiCampArea, 1);
	AM_Add(PsiCampArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	PsiCampTempleArea = AM_Create("ValleyOfMines\\OLDWORLD.ZEN");

	AM_AddPoint(PsiCampTempleArea, 50044.5, -465.232);
	AM_AddPoint(PsiCampTempleArea, 51700.9, -1097.84);
	AM_AddPoint(PsiCampTempleArea, 52099.2, -1999.21);
	AM_AddPoint(PsiCampTempleArea, 51399.2, -3598.88);
	AM_AddPoint(PsiCampTempleArea, 50849.9, -4501.98);
	AM_AddPoint(PsiCampTempleArea, 48543.7, -6539.4);
	AM_AddPoint(PsiCampTempleArea, 47660.4, -6702.83);
	AM_AddPoint(PsiCampTempleArea, 45949.3, -6451.57);
	AM_AddPoint(PsiCampTempleArea, 45430.4, -4050.65);
	AM_AddPoint(PsiCampTempleArea, 45138.2, -4366.96);
	AM_AddPoint(PsiCampTempleArea, 45580.3, -696.749);
	AM_AddPortalRoom(PsiCampTempleArea, "PSIT01");
	AM_SetMaxHeight(PsiCampTempleArea, -1500.0);
	AM_SetWeather(PsiCampArea, 1);
	AM_Add(PsiCampTempleArea, OldWorld_UpdateAreaMusic, OldWorld_UpdateAreaMusic);

	AreaMusic_SetDefaultThemes(
		AREA_MUSIC_OLDWORLD_DEFAULT_DAY_ID,
		AREA_MUSIC_OLDWORLD_DEFAULT_NIGHT_ID
	);
	AM_SetProcessCallback(OldWorld_UpdateAreaMusic);
	OldWorld_UpdateAreaMusic();
};
