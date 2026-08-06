// ************************
// Kampf - AI Orc Elite (49)
// ************************

// More active than the regular Orc profile without introducing new animations.

INSTANCE FA_ENEMY_PREHIT_49 (C_FightAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_JUMPBACK;
	move[2] = MOVE_SIDEATTACK;
};

INSTANCE FA_ENEMY_STORMPREHIT_49 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

INSTANCE FA_MY_W_COMBO_49 (C_FightAI)
{
};

INSTANCE FA_MY_W_RUNTO_49 (C_FightAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

INSTANCE FA_MY_W_STRAFE_49 (C_FightAI)
{
};

INSTANCE FA_MY_W_FOCUS_49 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_SIDEATTACK;
	move[2] = MOVE_TRIPLEATTACK;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_SIDEATTACK;
};

INSTANCE FA_MY_W_NOFOCUS_49 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_G_COMBO_49 (C_FightAI)
{
};

INSTANCE FA_MY_G_RUNTO_49 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
};

INSTANCE FA_MY_G_STRAFE_49 (C_FightAI)
{
};

INSTANCE FA_MY_G_FOCUS_49 (C_FightAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_RUN;
	move[2] = MOVE_STRAFE;
};

INSTANCE FA_MY_FK_FOCUS_49 (C_FightAI)
{
	move[0] = MOVE_RUN;
};

INSTANCE FA_MY_G_FK_NOFOCUS_49 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_FK_FOCUS_FAR_49 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
};

INSTANCE FA_MY_FK_NOFOCUS_FAR_49 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_FK_FOCUS_MAG_49 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_EXT;
	move[2] = MOVE_WAIT_EXT;
	move[3] = MOVE_WAIT_EXT;
};

INSTANCE FA_MY_FK_NOFOCUS_MAG_49 (C_FightAI)
{
	move[0] = MOVE_TURN;
};
