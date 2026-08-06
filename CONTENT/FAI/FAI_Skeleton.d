// ************************
// Kampf - AI Skeleton (17)
// ************************

// G1 melee profile with the G2-only ranged and magic slots retained.

INSTANCE FA_ENEMY_PREHIT_17 (C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
};

INSTANCE FA_ENEMY_STORMPREHIT_17 (C_FightAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_STRAFE;
};

INSTANCE FA_MY_W_COMBO_17 (C_FightAI)
{
};

INSTANCE FA_MY_W_RUNTO_17 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_W_STRAFE_17 (C_FightAI)
{
	move[0] = MOVE_WAIT;
};

INSTANCE FA_MY_W_FOCUS_17 (C_FightAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_ATTACK;
	move[5] = MOVE_ATTACK;
};

INSTANCE FA_MY_W_NOFOCUS_17 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_G_COMBO_17 (C_FightAI)
{
};

INSTANCE FA_MY_G_RUNTO_17 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_G_STRAFE_17 (C_FightAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

INSTANCE FA_MY_G_FOCUS_17 (C_FightAI)
{
	move[0] = MOVE_RUN;
};

INSTANCE FA_MY_FK_FOCUS_17 (C_FightAI)
{
	move[0] = MOVE_RUN;
};

INSTANCE FA_MY_G_FK_NOFOCUS_17 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_FK_FOCUS_FAR_17 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
};

INSTANCE FA_MY_FK_NOFOCUS_FAR_17 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_FK_FOCUS_MAG_17 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_EXT;
	move[2] = MOVE_WAIT_EXT;
};

INSTANCE FA_MY_FK_NOFOCUS_MAG_17 (C_FightAI)
{
	move[0] = MOVE_TURN;
};
