const string AREA_MUSIC_DRAGON_ISLAND_DEFAULT_DAY_ID = "INS_DAY_STD";
const string AREA_MUSIC_DRAGON_ISLAND_DEFAULT_NIGHT_ID = "INS_DAY_STD";

func void DragonIsland_InitAreaMusic()
{
	AreaMusic_SetDefaultThemes(
		AREA_MUSIC_DRAGON_ISLAND_DEFAULT_DAY_ID,
		AREA_MUSIC_DRAGON_ISLAND_DEFAULT_NIGHT_ID
	);
	AM_SetProcessCallback(AreaMusic_PlayDefault);
	AreaMusic_PlayDefault();
};

func void DragonIsland_TryInitAreaMusic()
{
	if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		DragonIsland_InitAreaMusic();
	};
};
