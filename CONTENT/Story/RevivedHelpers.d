func void REV_SetObjectRoutine_Fire (var STRING mobName)
{
	Wld_SetObjectRoutine (00,00, mobName, 1);
	Wld_SetObjectRoutine (20,00, mobName, 1);
	Wld_SetObjectRoutine (05,00, mobName, 0);
};


func string REV_BuildTradeString (var int itemInstance)
{
	var string concatText;
	var string armorName;
	var string protEdge;
	var string protPoint;
	var string protMagic;
	var string value;

	if(itemInstance == ITAR_REVIVED_ARCHER)
	{
		armorName	= "Archer's Suit";
		protEdge	= IntToString(REV_Prot_Edge_ARCHER);
		protPoint	= IntToString(REV_Prot_Point_ARCHER);
		protMagic	= IntToString(REV_Prot_Magic_ARCHER);
		value		= IntToString(REV_Value_ARCHER);
	}
	else if(itemInstance == ITAR_REVIVED_LEATHER_H)
	{
		armorName	= "H. Leather Armor";
		protEdge	= IntToString(REV_Prot_Edge_LEATHER_H);
		protPoint	= IntToString(REV_Prot_Point_LEATHER_H);
		protMagic	= IntToString(REV_Prot_Magic_LEATHER_H);
		value		= IntToString(REV_Value_LEATHER_H);
	}
	else if(itemInstance == ITAR_REVIVED_MIL_M)
	{
		armorName	= "Guard's Armor";
		protEdge	= IntToString(REV_Prot_Edge_MIL_M);
		protPoint	= IntToString(REV_Prot_Point_MIL_M);
		protMagic	= IntToString(REV_Prot_Magic_MIL_M);
		value		= IntToString(REV_Value_MIL_M);
	}
	else if(itemInstance == ITAR_REVIVED_MIL_H)
	{
		armorName	= "H. Guard's Armor";
		protEdge	= IntToString(REV_Prot_Edge_MIL_H);
		protPoint	= IntToString(REV_Prot_Point_MIL_H);
		protMagic	= IntToString(REV_Prot_Magic_MIL_H);
		value		= IntToString(REV_Value_MIL_H);
	}
	else if(itemInstance == ITAR_REVIVED_SLD_M)
	{
		armorName	= "Mercenary's Armor";
		protEdge	= IntToString(REV_Prot_Edge_SLD_M);
		protPoint	= IntToString(REV_Prot_Point_SLD_M);
		protMagic	= IntToString(REV_Prot_Magic_SLD_M);
		value		= IntToString(REV_Value_SLD_M);
	}
	else if(itemInstance == ITAR_REVIVED_SLD_H)
	{
		armorName	= "H. Mercenary's Armor";
		protEdge	= IntToString(REV_Prot_Edge_SLD_H);
		protPoint	= IntToString(REV_Prot_Point_SLD_H);
		protMagic	= IntToString(REV_Prot_Magic_SLD_H);
		value		= IntToString(REV_Value_SLD_H);
	}
	else if(itemInstance == ITAR_REVIVED_DJG_M)
	{
		armorName	= "Dragon Hunter's Armor";
		protEdge	= IntToString(REV_Prot_Edge_DJG_M);
		protPoint	= IntToString(REV_Prot_Point_DJG_M);
		protMagic	= IntToString(REV_Prot_Magic_DJG_M);
		value		= IntToString(REV_Value_DJG_M);
	}
	else if(itemInstance == ITAR_REVIVED_DJG_H)
	{
		armorName	= "H. Dragon Hunter's Armor";
		protEdge	= IntToString(REV_Prot_Edge_DJG_H);
		protPoint	= IntToString(REV_Prot_Point_DJG_H);
		protMagic	= IntToString(REV_Prot_Magic_DJG_H);
		value		= IntToString(REV_Value_DJG_H);
	}
	else if(itemInstance == ITAR_REVIVED_DHT_S)
	{
		armorName	= "Ancient Demon Hunter Armor";
		protEdge	= IntToString(REV_Prot_Edge_DHT_H);
		protPoint	= IntToString(REV_Prot_Point_DHT_H);
		protMagic	= IntToString(REV_Prot_Magic_DHT_H);
		value		= IntToString(REV_Value_DHT_H);
	};
	
	concatText = ConcatStrings (ConcatStrings(armorName, " (Weapon Prot. "), protEdge);
	concatText = ConcatStrings (concatText, ConcatStrings(", Arrow Prot. ", protPoint));
	concatText = ConcatStrings (concatText, ConcatStrings(", Magic Prot. ", protMagic));
	concatText = ConcatStrings (concatText, ConcatStrings("): ", value));
	concatText = ConcatStrings (concatText, " gold.");
	return concatText;
};

func void REV_ChangeStatPercent (var int recover, var int recoverPercent)
{
	var int amountMax;
	var int amountDelta;

	if(recover == ATR_HITPOINTS)
	{
		amountMax = hero.attribute[ATR_HITPOINTS_MAX];
	}
	else if(recover == ATR_MANA)
	{
		amountMax = hero.attribute[ATR_MANA_MAX];
	};
	amountDelta = (amountMax * recoverPercent) / 100;

	if ((amountDelta == 0) && (recoverPercent > 0))
	{
		amountDelta = 1;
	};

	if ((amountDelta == 0) && (recoverPercent < 0))
	{
		amountDelta = -1;
	};

	Npc_ChangeAttribute (hero, recover, amountDelta);
};

FUNC VOID REV_Equip_PaladinWeapon()
{
	if (self.guild != GIL_PAL)
	&& (Npc_GetTrueGuild(self) != GIL_PAL)
	{
		if (Npc_IsPlayer(self))
		{
			Print (PRINT_PALADIN_WEAPON_MISSING);
		};
		
		AI_UnequipWeapons (self);
	};
};

func int REV_IsRequiredKillTarget (var C_NPC slf)
{
	if (slf == SLD_840_Alvares)
	|| (slf == SLD_841_Engardo)
	|| (slf == MIL_335_Rumbold)
	|| (slf == MIL_336_Rick)
	{
		return TRUE;
	};

	return FALSE;
};

// Older saves can know a recipe without its status-screen talent being set.
func void REV_RestoreCraftStatus()
{
	if (!Hlp_IsValidNpc(hero))
	{
		return;
	};

	if (PlayerGetsFinalDJGArmor)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_REVIVED_ORE_04] = TRUE;
		PLAYER_TALENT_SMITH[WEAPON_2H_REVIVED_ORE_04] = TRUE;
	};

	if (Read_BookstandAlchemy == Read_BookstandAlchemy_Max)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == 0)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_04] && PLAYER_TALENT_ALCHEMY[POTION_Mana_04])
	{
		Log_CreateTopic(TOPIC_TalentAlchemy, LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAlchemy, LOGENTRY_RECIPE_HEALTH_04);
		Log_AddEntry(TOPIC_TalentAlchemy, LOGENTRY_RECIPE_MANA_04);
		Npc_SetTalentSkill(hero, NPC_TALENT_ALCHEMY, 1);
	};

	if (Green_Extrem)
	{
		PLAYER_TALENT_TOBACCO[TOBACCO_Weed_GreenNovice] = TRUE;
	};
	if (Knows_LousHammer)
	{
		PLAYER_TALENT_BOOZE[BOOZE_LouHammer] = TRUE;
	};
	if (Knows_Schlafhammer)
	{
		PLAYER_TALENT_BOOZE[BOOZE_LouHammerDouble] = TRUE;
	};
	if (Knows_SchnellerHering)
	{
		PLAYER_TALENT_BOOZE[BOOZE_FastHerring] = TRUE;
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_BOWMAKING) == 0)
	&& (PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_01]
	|| PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_02]
	|| PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_03]
	|| PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_04]
	|| PLAYER_TALENT_BOWYER[WEAPON_BOW_REVIVED_05]
	|| PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_01]
	|| PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_02]
	|| PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_03]
	|| PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_04]
	|| PLAYER_TALENT_BOWYER[WEAPON_CBOW_REVIVED_05]
	|| PLAYER_TALENT_BOWYER[WEAPON_RANGED_AMMUNITION])
	{
		Npc_SetTalentSkill(hero, NPC_TALENT_BOWMAKING, 1);
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_COOKING) == 0)
	&& (PLAYER_TALENT_COOKING[COOKING_MeatStew]
	|| PLAYER_TALENT_COOKING[COOKING_FishSoup]
	|| PLAYER_TALENT_COOKING[COOKING_MeatbugRagout]
	|| PLAYER_TALENT_COOKING[COOKING_RootSoup]
	|| PLAYER_TALENT_COOKING[COOKING_MinecrawlerSoup]
	|| PLAYER_TALENT_COOKING[COOKING_Marmalade]
	|| PLAYER_TALENT_COOKING[COOKING_RiceBowl]
	|| PLAYER_TALENT_COOKING[COOKING_FruitSalad]
	|| PLAYER_TALENT_COOKING[COOKING_ConvictStew])
	{
		Npc_SetTalentSkill(hero, NPC_TALENT_COOKING, 1);
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_BOOZE) == 0)
	&& (PLAYER_TALENT_BOOZE[BOOZE_LouHammer]
	|| PLAYER_TALENT_BOOZE[BOOZE_LouHammerDouble]
	|| PLAYER_TALENT_BOOZE[BOOZE_FastHerring]
	|| PLAYER_TALENT_BOOZE[BOOZE_TurnipBooze]
	|| PLAYER_TALENT_BOOZE[BOOZE_VinoBooze]
	|| PLAYER_TALENT_BOOZE[BOOZE_MonsterDrink]
	|| PLAYER_TALENT_BOOZE[BOOZE_MageWine]
	|| PLAYER_TALENT_BOOZE[BOOZE_RiceSchnaps]
	|| PLAYER_TALENT_BOOZE[BOOZE_Mead])
	{
		Npc_SetTalentSkill(hero, NPC_TALENT_BOOZE, 1);
	};

	if (Npc_GetTalentSkill(hero, NPC_TALENT_TOBACCO) == 0)
	&& (PLAYER_TALENT_TOBACCO[TOBACCO_Apple]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_AppleDouble]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Honey]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Swampweed]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Mushroom]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Regular]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Apple]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_AppleDouble]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Honey]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Mushroom]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_GreenNovice]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_NorthernDark]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_Dreamcall]
	|| PLAYER_TALENT_TOBACCO[TOBACCO_Weed_DreamcallStrong])
	{
		Npc_SetTalentSkill(hero, NPC_TALENT_TOBACCO, 1);
	};
};
