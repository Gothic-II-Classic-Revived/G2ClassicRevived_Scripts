// *************************
// Kampf - AI Orc Scout (48)
// *************************

// Slower G1-style Orc pacing on top of the current G2 Orc profile.

INSTANCE FA_ENEMY_PREHIT_48 (C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_JUMPBACK;
	move[2] = MOVE_JUMPBACK;
	move[3] = MOVE_JUMPBACK;
	move[4] = MOVE_JUMPBACK;
	move[5] = MOVE_JUMPBACK;
};

INSTANCE FA_ENEMY_STORMPREHIT_48 (C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
};

INSTANCE FA_MY_W_COMBO_48 (C_FightAI)
{
};

INSTANCE FA_MY_W_RUNTO_48 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_W_STRAFE_48 (C_FightAI)
{
};

INSTANCE FA_MY_W_FOCUS_48 (C_FightAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_ATTACK;
	move[5] = MOVE_ATTACK;
};

INSTANCE FA_MY_W_NOFOCUS_48 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_G_COMBO_48 (C_FightAI)
{
};

INSTANCE FA_MY_G_RUNTO_48 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_G_STRAFE_48 (C_FightAI)
{
};

INSTANCE FA_MY_G_FOCUS_48 (C_FightAI)
{
	move[0] = MOVE_RUN;
};

INSTANCE FA_MY_FK_FOCUS_48 (C_FightAI)
{
	move[0] = MOVE_RUN;
};

INSTANCE FA_MY_G_FK_NOFOCUS_48 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_FK_FOCUS_FAR_48 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
};

INSTANCE FA_MY_FK_NOFOCUS_FAR_48 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

INSTANCE FA_MY_FK_FOCUS_MAG_48 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_EXT;
	move[2] = MOVE_WAIT_EXT;
	move[3] = MOVE_WAIT_EXT;
};

INSTANCE FA_MY_FK_NOFOCUS_MAG_48 (C_FightAI)
{
	move[0] = MOVE_TURN;
};
