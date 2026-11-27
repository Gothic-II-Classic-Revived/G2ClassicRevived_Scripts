func event GameLoop()
{
	if ((CurrentLevel == NEWWORLD_ZEN) && (MIS_Canthars_KomproBrief == LOG_RUNNING))
	{
		if (C_CantharLetterExpired())
		{
			B_UpdateCantharQuest();
		};
	};
};
