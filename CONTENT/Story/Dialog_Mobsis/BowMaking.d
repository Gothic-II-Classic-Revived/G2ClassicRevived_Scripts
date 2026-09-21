// ****************************************************
// BowMaking
// ****************************************************

var int BowMakingBows;
var int BowMakingCrossbows;
var int BowMakingAmmo;

FUNC VOID BOWMAKING_S1 ()
{
	var C_NPC her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_BOWMAKING;
		BowMakingBows = FALSE;
		BowMakingCrossbows = FALSE;
		BowMakingAmmo = FALSE;
		Ai_ProcessInfos (her);
	};
};

// ****************************************************
// Crafting categories
// ****************************************************

INSTANCE PC_BowMaking_Bows (C_Info)
{
	npc         = PC_Hero;
	nr          = 1;
	condition   = PC_BowMaking_Bows_Condition;
	information = PC_BowMaking_Bows_Info;
	permanent   = TRUE;
	description = "Craft bows";
};

FUNC INT PC_BowMaking_Bows_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == FALSE)
	&& (BowMakingCrossbows == FALSE)
	&& (BowMakingAmmo == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Bows_Info ()
{
	BowMakingBows = TRUE;
};

INSTANCE PC_BowMaking_Crossbows (C_Info)
{
	npc         = PC_Hero;
	nr          = 2;
	condition   = PC_BowMaking_Crossbows_Condition;
	information = PC_BowMaking_Crossbows_Info;
	permanent   = TRUE;
	description = "Craft crossbows";
};

FUNC INT PC_BowMaking_Crossbows_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == FALSE)
	&& (BowMakingCrossbows == FALSE)
	&& (BowMakingAmmo == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Crossbows_Info ()
{
	BowMakingCrossbows = TRUE;
};

INSTANCE PC_BowMaking_Ammunition (C_Info)
{
	npc         = PC_Hero;
	nr          = 3;
	condition   = PC_BowMaking_Ammunition_Condition;
	information = PC_BowMaking_Ammunition_Info;
	permanent   = TRUE;
	description = "Craft ammunition";
};

FUNC INT PC_BowMaking_Ammunition_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == FALSE)
	&& (BowMakingCrossbows == FALSE)
	&& (BowMakingAmmo == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Ammunition_Info ()
{
	BowMakingAmmo = TRUE;
};

INSTANCE PC_BowMaking_Back (C_Info)
{
	npc         = PC_Hero;
	nr          = 99;
	condition   = PC_BowMaking_Back_Condition;
	information = PC_BowMaking_Back_Info;
	permanent   = TRUE;
	description = DIALOG_BACK;
};

FUNC INT PC_BowMaking_Back_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& ((BowMakingBows == TRUE) || (BowMakingCrossbows == TRUE) || (BowMakingAmmo == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Back_Info ()
{
	BowMakingBows = FALSE;
	BowMakingCrossbows = FALSE;
	BowMakingAmmo = FALSE;
};

// ****************************************************
// End
// ****************************************************

INSTANCE PC_BowMaking_End (C_Info)
{
	npc         = PC_Hero;
	nr          = 999;
	condition   = PC_BowMaking_End_Condition;
	information = PC_BowMaking_End_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT PC_BowMaking_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == FALSE)
	&& (BowMakingCrossbows == FALSE)
	&& (BowMakingAmmo == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_End_Info ()
{
	B_ENDPRODUCTIONDIALOG ();
	BowMakingBows = FALSE;
	BowMakingCrossbows = FALSE;
	BowMakingAmmo = FALSE;
};

// ****************************************************
// Bows
// ****************************************************

INSTANCE PC_BowMaking_Bow_01 (C_Info)
{
	npc         = PC_Hero;
	nr          = 10;
	condition   = PC_BowMaking_Bow_01_Condition;
	information = PC_BowMaking_Bow_01_Info;
	permanent   = TRUE;
	description = NAME_BOW_REVIVED_01;
};

FUNC INT PC_BowMaking_Bow_01_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_01] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Bow_01_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 2)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 1)
	&& (Npc_HasItems (hero, ItAt_Teeth) >= 2)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 2);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 1);
		Npc_RemoveInvItems (hero, ItAt_Teeth, 2);
		CreateInvItems (hero, ITRW_REVIVED_BOW_CRAFT_01, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingBows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Bow_02 (C_Info)
{
	npc         = PC_Hero;
	nr          = 11;
	condition   = PC_BowMaking_Bow_02_Condition;
	information = PC_BowMaking_Bow_02_Info;
	permanent   = TRUE;
	description = NAME_BOW_REVIVED_02;
};

FUNC INT PC_BowMaking_Bow_02_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_02] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Bow_02_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 3)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 2)
	&& (Npc_HasItems (hero, ItAt_Claw) >= 2)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 3);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 2);
		Npc_RemoveInvItems (hero, ItAt_Claw, 2);
		CreateInvItems (hero, ITRW_REVIVED_BOW_CRAFT_02, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingBows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Bow_03 (C_Info)
{
	npc         = PC_Hero;
	nr          = 12;
	condition   = PC_BowMaking_Bow_03_Condition;
	information = PC_BowMaking_Bow_03_Info;
	permanent   = TRUE;
	description = NAME_BOW_REVIVED_03;
};

FUNC INT PC_BowMaking_Bow_03_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_03] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Bow_03_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 4)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 2)
	&& (Npc_HasItems (hero, ItAt_LurkerClaw) >= 2)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 4);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 2);
		Npc_RemoveInvItems (hero, ItAt_LurkerClaw, 2);
		CreateInvItems (hero, ITRW_REVIVED_BOW_CRAFT_03, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingBows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Bow_04 (C_Info)
{
	npc         = PC_Hero;
	nr          = 13;
	condition   = PC_BowMaking_Bow_04_Condition;
	information = PC_BowMaking_Bow_04_Info;
	permanent   = TRUE;
	description = NAME_BOW_REVIVED_04;
};

FUNC INT PC_BowMaking_Bow_04_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_04] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Bow_04_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 5)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 3)
	&& (Npc_HasItems (hero, ItAt_ShadowHorn) >= 1)
	&& (Npc_HasItems (hero, ItMi_Nugget) >= 2)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 5);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 3);
		Npc_RemoveInvItems (hero, ItAt_ShadowHorn, 1);
		Npc_RemoveInvItems (hero, ItMi_Nugget, 2);
		CreateInvItems (hero, ITRW_REVIVED_BOW_CRAFT_04, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingBows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Bow_05 (C_Info)
{
	npc         = PC_Hero;
	nr          = 14;
	condition   = PC_BowMaking_Bow_05_Condition;
	information = PC_BowMaking_Bow_05_Info;
	permanent   = TRUE;
	description = NAME_BOW_REVIVED_05;
};

FUNC INT PC_BowMaking_Bow_05_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_05] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingBows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Bow_05_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 6)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 4)
	&& (Npc_HasItems (hero, ItAt_DrgSnapperHorn) >= 1)
	&& (Npc_HasItems (hero, ItAt_DragonBlood) >= 1)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 6);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 4);
		Npc_RemoveInvItems (hero, ItAt_DrgSnapperHorn, 1);
		Npc_RemoveInvItems (hero, ItAt_DragonBlood, 1);
		CreateInvItems (hero, ITRW_REVIVED_BOW_CRAFT_05, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingBows = FALSE;
};

// ****************************************************
// Crossbows
// ****************************************************

INSTANCE PC_BowMaking_Crossbow_01 (C_Info)
{
	npc         = PC_Hero;
	nr          = 20;
	condition   = PC_BowMaking_Crossbow_01_Condition;
	information = PC_BowMaking_Crossbow_01_Info;
	permanent   = TRUE;
	description = NAME_CBOW_REVIVED_01;
};

FUNC INT PC_BowMaking_Crossbow_01_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_01] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingCrossbows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Crossbow_01_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 3)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 2)
	&& (Npc_HasItems (hero, ItAt_Teeth) >= 3)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 3);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 2);
		Npc_RemoveInvItems (hero, ItAt_Teeth, 3);
		CreateInvItems (hero, ITRW_REVIVED_CROSSBOW_CRAFT_01, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingCrossbows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Crossbow_02 (C_Info)
{
	npc         = PC_Hero;
	nr          = 21;
	condition   = PC_BowMaking_Crossbow_02_Condition;
	information = PC_BowMaking_Crossbow_02_Info;
	permanent   = TRUE;
	description = NAME_CBOW_REVIVED_02;
};

FUNC INT PC_BowMaking_Crossbow_02_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_02] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingCrossbows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Crossbow_02_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 4)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 2)
	&& (Npc_HasItems (hero, ItAt_Claw) >= 3)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 4);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 2);
		Npc_RemoveInvItems (hero, ItAt_Claw, 3);
		CreateInvItems (hero, ITRW_REVIVED_CROSSBOW_CRAFT_02, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingCrossbows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Crossbow_03 (C_Info)
{
	npc         = PC_Hero;
	nr          = 22;
	condition   = PC_BowMaking_Crossbow_03_Condition;
	information = PC_BowMaking_Crossbow_03_Info;
	permanent   = TRUE;
	description = NAME_CBOW_REVIVED_03;
};

FUNC INT PC_BowMaking_Crossbow_03_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_03] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingCrossbows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Crossbow_03_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 5)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 3)
	&& (Npc_HasItems (hero, ItAt_CrawlerMandibles) >= 3)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 5);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 3);
		Npc_RemoveInvItems (hero, ItAt_CrawlerMandibles, 3);
		CreateInvItems (hero, ITRW_REVIVED_CROSSBOW_CRAFT_03, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingCrossbows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Crossbow_04 (C_Info)
{
	npc         = PC_Hero;
	nr          = 23;
	condition   = PC_BowMaking_Crossbow_04_Condition;
	information = PC_BowMaking_Crossbow_04_Info;
	permanent   = TRUE;
	description = NAME_CBOW_REVIVED_04;
};

FUNC INT PC_BowMaking_Crossbow_04_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_04] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingCrossbows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Crossbow_04_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 6)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 4)
	&& (Npc_HasItems (hero, ItAt_ShadowHorn) >= 1)
	&& (Npc_HasItems (hero, ItMi_Nugget) >= 3)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 6);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 4);
		Npc_RemoveInvItems (hero, ItAt_ShadowHorn, 1);
		Npc_RemoveInvItems (hero, ItMi_Nugget, 3);
		CreateInvItems (hero, ITRW_REVIVED_CROSSBOW_CRAFT_04, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingCrossbows = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_Crossbow_05 (C_Info)
{
	npc         = PC_Hero;
	nr          = 24;
	condition   = PC_BowMaking_Crossbow_05_Condition;
	information = PC_BowMaking_Crossbow_05_Info;
	permanent   = TRUE;
	description = NAME_CBOW_REVIVED_05;
};

FUNC INT PC_BowMaking_Crossbow_05_Condition ()
{
	if (PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_05] == TRUE)
	&& (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingCrossbows == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID PC_BowMaking_Crossbow_05_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_CUT) >= 8)
	&& (Npc_HasItems (hero, ITMI_REVIVED_LEATHER) >= 5)
	&& (Npc_HasItems (hero, ItAt_DrgSnapperHorn) >= 2)
	&& (Npc_HasItems (hero, ItAt_DragonBlood) >= 1)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_CUT, 8);
		Npc_RemoveInvItems (hero, ITMI_REVIVED_LEATHER, 5);
		Npc_RemoveInvItems (hero, ItAt_DrgSnapperHorn, 2);
		Npc_RemoveInvItems (hero, ItAt_DragonBlood, 1);
		CreateInvItems (hero, ITRW_REVIVED_CROSSBOW_CRAFT_05, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingCrossbows = FALSE;
};

// ****************************************************
// Ammunition
// ****************************************************

FUNC INT PC_BowMaking_Ammo_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_BOWMAKING)
	&& (BowMakingAmmo == TRUE)
	{
		return TRUE;
	};
};

// ****************************************************
// Arrows
// ****************************************************

INSTANCE PC_BowMaking_Arrow (C_Info)
{
	npc         = PC_Hero;
	nr          = 30;
	condition   = PC_BowMaking_Ammo_Condition;
	information = PC_BowMaking_Arrow_Info;
	permanent   = TRUE;
	description = "Arrows (x10)";
};

FUNC VOID PC_BowMaking_Arrow_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_STICK) >= 10)
	&& (Npc_HasItems (hero, ItMiSwordraw) >= 2)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_STICK, 10);
		Npc_RemoveInvItems (hero, ItMiSwordraw, 2);
		CreateInvItems (hero, ItRw_Arrow, 10);
		Print (PRINT_ArrowSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingAmmo = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_MagicArrow (C_Info)
{
	npc         = PC_Hero;
	nr          = 31;
	condition   = PC_BowMaking_Ammo_Condition;
	information = PC_BowMaking_MagicArrow_Info;
	permanent   = TRUE;
	description = "Magic Arrows (x10)";
};

FUNC VOID PC_BowMaking_MagicArrow_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_STICK) >= 10)
	&& (Npc_HasItems (hero, ItMiSwordraw) >= 2)
	&& (Npc_HasItems (hero, ItMi_Nugget) >= 5)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_STICK, 10);
		Npc_RemoveInvItems (hero, ItMiSwordraw, 2);
		Npc_RemoveInvItems (hero, ItMi_Nugget, 5);
		CreateInvItems (hero, ITRW_REVIVED_MAGICARROW, 10);
		Print (PRINT_ArrowSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingAmmo = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_FireArrow (C_Info)
{
	npc         = PC_Hero;
	nr          = 32;
	condition   = PC_BowMaking_Ammo_Condition;
	information = PC_BowMaking_FireArrow_Info;
	permanent   = TRUE;
	description = "Fire Arrows (x10)";
};

FUNC VOID PC_BowMaking_FireArrow_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_STICK) >= 10)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 5)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 5)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_STICK, 10);
		Npc_RemoveInvItems (hero, ItMi_Pitch, 5);
		Npc_RemoveInvItems (hero, ItMi_Sulfur, 5);
		CreateInvItems (hero, ITRW_REVIVED_FIREARROW, 10);
		Print (PRINT_ArrowSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingAmmo = FALSE;
};

// ****************************************************
// Bolts
// ****************************************************

INSTANCE PC_BowMaking_Bolt (C_Info)
{
	npc         = PC_Hero;
	nr          = 33;
	condition   = PC_BowMaking_Ammo_Condition;
	information = PC_BowMaking_Bolt_Info;
	permanent   = TRUE;
	description = "Bolts (x10)";
};

FUNC VOID PC_BowMaking_Bolt_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_STICK) >= 10)
	&& (Npc_HasItems (hero, ItMiSwordraw) >= 2)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_STICK, 10);
		Npc_RemoveInvItems (hero, ItMiSwordraw, 2);
		CreateInvItems (hero, ItRw_Bolt, 10);
		Print (PRINT_ArrowSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingAmmo = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_MagicBolt (C_Info)
{
	npc         = PC_Hero;
	nr          = 34;
	condition   = PC_BowMaking_Ammo_Condition;
	information = PC_BowMaking_MagicBolt_Info;
	permanent   = TRUE;
	description = "Magic Bolts (x10)";
};

FUNC VOID PC_BowMaking_MagicBolt_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_STICK) >= 10)
	&& (Npc_HasItems (hero, ItMiSwordraw) >= 2)
	&& (Npc_HasItems (hero, ItMi_Nugget) >= 5)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_STICK, 10);
		Npc_RemoveInvItems (hero, ItMiSwordraw, 2);
		Npc_RemoveInvItems (hero, ItMi_Nugget, 5);
		CreateInvItems (hero, ITRW_REVIVED_MAGICBOLT, 10);
		Print (PRINT_ArrowSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingAmmo = FALSE;
};

// ****************************************************

INSTANCE PC_BowMaking_FireBolt (C_Info)
{
	npc         = PC_Hero;
	nr          = 35;
	condition   = PC_BowMaking_Ammo_Condition;
	information = PC_BowMaking_FireBolt_Info;
	permanent   = TRUE;
	description = "Fire Bolts (x10)";
};

FUNC VOID PC_BowMaking_FireBolt_Info ()
{
	if (Npc_HasItems (hero, ITMI_REVIVED_WOOD_STICK) >= 10)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 5)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 5)
	{
		Npc_RemoveInvItems (hero, ITMI_REVIVED_WOOD_STICK, 10);
		Npc_RemoveInvItems (hero, ItMi_Pitch, 5);
		Npc_RemoveInvItems (hero, ItMi_Sulfur, 5);
		CreateInvItems (hero, ITRW_REVIVED_FIREBOLT, 10);
		Print (PRINT_ArrowSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();
	BowMakingAmmo = FALSE;
};
