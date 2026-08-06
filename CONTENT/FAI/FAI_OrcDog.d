// ***********************
// Kampf - AI Orc Dog (13)
// ***********************


// ************************************
// Meine Reaktionen auf Gegner-Aktionen
// ************************************

// ------ Gegner attackiert mich ------
INSTANCE FA_ENEMY_PREHIT_13 (C_FightAI)
{
	// 0.94b: Orc Dogs always retreat instead of mixing retreat and strafe.
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_JUMPBACK;
	move[2] = MOVE_JUMPBACK;
	move[3] = MOVE_JUMPBACK;
	move[4] = MOVE_JUMPBACK;
	move[5] = MOVE_JUMPBACK;
};

// ------ Gegner macht Sturmattacke ------
INSTANCE FA_ENEMY_STORMPREHIT_13 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
};


// *******************************************
// Gegner in W-Reichweite (Treffer-Reichweite)
// *******************************************

// ------ Ich renne auf den Gegner zu ------
INSTANCE FA_MY_W_RUNTO_13 (C_FightAI)
{
	// 0.94b Orc Dog difference.
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_RUN;
	move[2] = MOVE_RUN;
};

// ------- Ich Strafe gerade ------
INSTANCE FA_MY_W_STRAFE_13 (C_FightAI)
{
	move[0] = MOVE_STRAFE; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner im Fokus (kann treffen) -------
INSTANCE FA_MY_W_FOCUS_13 (C_FightAI)
{
	// 0.94b Orc Dog difference: more waiting, fewer direct attacks than Wolf.
	move[0] = MOVE_WAIT;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_ATTACK;
	move[5] = MOVE_ATTACK;
};

// ------- Ich habe Gegner NICHT im Fokus -------
INSTANCE FA_MY_W_NOFOCUS_13 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// *************************************************
// Gegner in G-Reichweite (Sturmattacken-Reichweite)
// *************************************************

// ------ Ich renne auf den Gegner zu (kann treffen) ------
INSTANCE FA_MY_G_RUNTO_13 (C_FightAI)
{
	move[0] = MOVE_ATTACK; // Sturmattacke
};

// ------- Ich Strafe gerade ------
INSTANCE FA_MY_G_STRAFE_13 (C_FightAI)
{
	// 0.94b Orc Dog difference.
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

// ------- Ich habe Gegner im Fokus -------
INSTANCE FA_MY_G_FOCUS_13 (C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};


// ***************************************
// Gegner in FK-Reichweite (weit entfernt)
// ***************************************

// ------- Ich habe Gegner im Fokus -------
INSTANCE FA_MY_FK_FOCUS_13 (C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner NICHT im Fokus (gilt auch fuer G-Distanz!) -------
INSTANCE FA_MY_G_FK_NOFOCUS_13 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// ***********************************
// FAI fuer Fernkampf und Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
INSTANCE FA_MY_FK_FOCUS_FAR_13 (C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
};

// ------ Gegner NICHT im Fokus ------
INSTANCE FA_MY_FK_NOFOCUS_FAR_13 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};


// ***********************************
// FAI fuer Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
INSTANCE FA_MY_FK_FOCUS_MAG_13 (C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

// ------ Gegner NICHT im Fokus -------
INSTANCE FA_MY_FK_NOFOCUS_MAG_13 (C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};
