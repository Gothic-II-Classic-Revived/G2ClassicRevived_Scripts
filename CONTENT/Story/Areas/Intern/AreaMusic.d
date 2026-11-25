// Music selection and transitions are handled by AreaManager.
var int AreaMusic_DefaultArea;

func void AreaMusic_OnTransition()
{
};

func void AreaMusic_Register(var int area)
{
	AM_Add(area, AreaMusic_OnTransition, AreaMusic_OnTransition);
};

func void AreaMusic_CreateDefault(
	var string world,
	var string dayStandard,
	var string nightStandard,
	var string dayThreat,
	var string nightThreat,
	var string dayFight,
	var string nightFight
)
{
	AM_Destroy(AreaMusic_DefaultArea);
	AreaMusic_DefaultArea = AM_Create(world);

	// Cover the world without height limits. Local regions are created afterwards.
	AM_AddPoint(AreaMusic_DefaultArea, -1000000.0, -1000000.0);
	AM_AddPoint(AreaMusic_DefaultArea, 1000000.0, -1000000.0);
	AM_AddPoint(AreaMusic_DefaultArea, 1000000.0, 1000000.0);
	AM_AddPoint(AreaMusic_DefaultArea, -1000000.0, 1000000.0);
	AM_SetMusic(AreaMusic_DefaultArea,
		dayStandard, nightStandard,
		dayThreat, nightThreat,
		dayFight, nightFight);
	AreaMusic_Register(AreaMusic_DefaultArea);
};

func void AreaMusic_Init()
{
	AM_ClearProcessCallback();
	AM_Destroy(AreaMusic_DefaultArea);
	AreaMusic_DefaultArea = 0;
	BassMusic_SetFullScriptControl(FALSE);
};
