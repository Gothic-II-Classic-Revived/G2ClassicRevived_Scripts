const string AREA_MUSIC_NO_THEME = "";

var string AreaMusic_CurrentThemeID;
var string AreaMusic_DefaultDayThemeID;
var string AreaMusic_DefaultNightThemeID;

func int AreaMusic_IsDaytime()
{
	return Wld_IsTime(5, 0, 19, 0);
};

func void AreaMusic_Play(var string themeID)
{
	if (Hlp_StrCmp(AreaMusic_CurrentThemeID, themeID) == FALSE)
	{
		AreaMusic_CurrentThemeID = themeID;
		BassMusic_Play(themeID);
	};
};

func void AreaMusic_SetDefaultThemes(
	var string dayThemeID,
	var string nightThemeID
)
{
	AreaMusic_DefaultDayThemeID = dayThemeID;
	AreaMusic_DefaultNightThemeID = nightThemeID;
};

func void AreaMusic_PlayDayNight(
	var string dayThemeID,
	var string nightThemeID
)
{
	if (AreaMusic_IsDaytime())
	{
		if (Hlp_StrCmp(dayThemeID, AREA_MUSIC_NO_THEME) == FALSE)
		{
			AreaMusic_Play(dayThemeID);
		}
		else
		{
			AreaMusic_Play(AreaMusic_DefaultDayThemeID);
		};
	}
	else
	{
		if (Hlp_StrCmp(nightThemeID, AREA_MUSIC_NO_THEME) == FALSE)
		{
			AreaMusic_Play(nightThemeID);
		}
		else
		{
			AreaMusic_Play(AreaMusic_DefaultNightThemeID);
		};
	};
};

func void AreaMusic_PlayDefault()
{
	AreaMusic_PlayDayNight(
		AREA_MUSIC_NO_THEME,
		AREA_MUSIC_NO_THEME
	);
};

func void AreaMusic_Init()
{
	AM_SetProcessCallback(DragonIsland_TryInitAreaMusic);
	//AM_SetDebug(TRUE);
	AreaMusic_CurrentThemeID = AREA_MUSIC_NO_THEME;
	AreaMusic_DefaultDayThemeID = AREA_MUSIC_NO_THEME;
	AreaMusic_DefaultNightThemeID = AREA_MUSIC_NO_THEME;
	BassMusic_SetFullScriptControl(TRUE);
};
