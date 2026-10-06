const int	REV_VALUE_RECIPE			=	25;

const int	REV_VALUE_CIRCLE_FIRST		=	75;
const int	REV_VALUE_CIRCLE_SECOND		=	100;
const int	REV_VALUE_CIRCLE_THIRD		=	150;
const int	REV_VALUE_CIRCLE_FOURTH		=	200;
const int	REV_VALUE_CIRCLE_FIFTH		=	250;
const int	REV_VALUE_CIRCLE_SIXTH		=	300;

//****************************************************************************
//			BOOKS
//****************************************************************************

INSTANCE ITWR_REVIVED_CIRCLE_KDF_01(C_Item)
{	
	name 					=	"The Circles of Fire";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FIRST;

	visual 					=	"REV_ITWR_FIRE_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDF_01;

	description				=	name;
	TEXT[1]					=	"Volume I";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDF_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FIRST CIRCLE OF FIRE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The Innos Cult calls it a Spark igniting the Fire.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Innos rules over sunlight and flame. His magic gives heat and light a form that mortal will can direct, from a single burning ember to a consuming blaze.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Fire Bolt");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Hurls a small missile of fire at a single target.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle1 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle1 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDF_02(C_Item)
{	
	name 					=	"The Circles of Fire";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_SECOND;

	visual 					=	"REV_ITWR_FIRE_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDF_02;

	description				=	name;
	TEXT[1]					=	"Volume II";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDF_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE SECOND CIRCLE OF FIRE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "I am the rising sun, the light, and the life");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Light and living warmth belong to Innos. The same divine fire that sustains life becomes a weapon in the hands of his magicians, gathered into flame and cast against their enemies.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Fire Ball");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Hurls a ball of flame that burns the target on impact.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle2 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle2 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDF_03 (C_Item)
{	
	name 					=	"The Circles of Fire";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_THIRD;

	visual 					=	"REV_ITWR_FIRE_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDF_03;

	description				=	name;
	TEXT[1]					=	"Volume III";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDF_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE THIRD CIRCLE OF FIRE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Innos is the keeper of law and order. His fire is an instrument of judgment, and the wrath of the god finds expression in searing heat and violent force.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The Circle of Fire gives that wrath a chosen shape: a concentrated blow, a bursting flame, or a blaze that consumes all within its reach.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Small Fire Storm");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "A fiery missile bursts at its target, burning nearby creatures as well.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Fire Fist");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "A blast of fire and force. Charging the spell increases the strength of the blow.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle3 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle3 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDF_04 (C_Item)
{	
	name 					=	"The Circles of Fire";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FOURTH;

	visual 					=	"REV_ITWR_FIRE_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDF_04;

	description				=	name;
	TEXT[1]					=	"Volume IV";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDF_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FOURTH CIRCLE OF FIRE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Magic is described as an Art.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Innos is the patron of the fire magician's art. His flame may be gathered before release or sustained by concentration. The will of the caster gives the burning power its shape and duration.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Large Fireball");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "A fireball that gains destructive power as more mana is invested before release.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Pyrokinesis");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Burns a living victim while the caster sustains his concentration and supplies mana.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Large Fire Storm");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "A fire storm burns the target and nearby creatures. Charging the spell increases its power.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle4 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle4 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDF_05(C_Item)
{	
	name 					=	"The Circles of Fire";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FIFTH;

	visual 					=	"REV_ITWR_FIRE_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDF_05;

	description				=	name;
	TEXT[1]					=	"Volume V";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDF_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FIFTH CIRCLE OF FIRE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Innos embodies the fierce, active power of fire. Its heat consumes, its light drives back darkness, and its force breaks through the space around the magician.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The greater arts of his circle release that power outward. Flame need no longer be confined to a missile aimed at one foe.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Extricate");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Releases a sudden burst of fire and force around the caster, striking nearby creatures.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Fire Wave");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Sends an expanding wave of flame out from the caster, striking creatures in its path.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle5 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle5 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDF_06(C_Item)
{	
	name 					=	"The Circles of Fire";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_SIXTH;

	visual 					=	"REV_ITWR_FIRE_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDF_06;

	description				=	name;
	TEXT[1]					=	"Volume VI";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDF_06()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE SIXTH CIRCLE OF FIRE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The consuming blaze is the most terrible face of Innos. In it, light and heat become inseparable, and the power held in a spark spreads across the ground and fills the air.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "At the height of fire magic, the magician calls upon this aspect of the god through a rain of fire that descends upon the surrounding ground.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Fire Rain");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Calls down a rain of fire upon creatures within range of the caster.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle6 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle6 = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_CIRCLE_KDW_01(C_Item)
{	
	name 					=	"The Circles of Water";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FIRST;

	visual 					=	"REV_ITWR_WATER_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDW_01;

	description				=	name;
	TEXT[1]					=	"Volume I";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDW_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FIRST CIRCLE OF WATER");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Adanos is the god of balance");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Water is his element, and change belongs to its nature. His magicians command its flowing strength and its frozen stillness, shaping the cold into solid forms.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Ice Bolt");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Hurls a small missile of ice at a single target.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle7 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle7 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDW_02(C_Item)
{	
	name 					=	"The Circles of Water";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_SECOND;

	visual 					=	"REV_ITWR_WATER_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDW_02;

	description				=	name;
	TEXT[1]					=	"Volume II";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDW_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE SECOND CIRCLE OF WATER");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Blessing of Water");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "This is the name given to the arcane gift by the followers of Adanos. His circle studies water, ice and lightning: the quiet depths and the sudden violence of a storm belong to the same art.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Zap");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Strikes a single target with a bolt of electrical energy.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle8 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle8 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDW_03 (C_Item)
{	
	name 					=	"The Circles of Water";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_THIRD;

	visual 					=	"REV_ITWR_WATER_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDW_03;

	description				=	name;
	TEXT[1]					=	"Volume III";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDW_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE THIRD CIRCLE OF WATER");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Adanos is honoured through knowledge and the understanding of nature. Water answers to that understanding in many forms: flowing, striking, or hardened into ice.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "His magic may wound through force or arrest movement through cold. The stillness of a frozen body is as much an expression of his element as the rush of water.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Ice Lance");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Hurls a sharp lance of ice at the target.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Water Fist");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Strikes the target with a concentrated blow of water.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Ice Block");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Encloses a susceptible victim in ice, holding it still and causing harm while it remains frozen.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle9 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle9 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDW_04 (C_Item)
{	
	name 					=	"The Circles of Water";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FOURTH;

	visual 					=	"REV_ITWR_WATER_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDW_04;

	description				=	name;
	TEXT[1]					=	"Volume IV";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDW_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FOURTH CIRCLE OF WATER");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Adanos holds the power of water in both its gentle and its violent forms. The force of a rising torrent and the lightning within a storm reveal the strength of his element.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The magician gathers that strength into a sudden eruption or a charge of crackling energy.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Geyser");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "A violent eruption of water strikes the target.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Ball Lightning");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Hurls a sphere of electrical energy. Investing more mana strengthens it before release.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Lightning");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Strikes the target with a powerful flash of lightning.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle10 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle10 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDW_05(C_Item)
{	
	name 					=	"The Circles of Water";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FIFTH;

	visual 					=	"REV_ITWR_WATER_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDW_05;

	description				=	name;
	TEXT[1]					=	"Volume V";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDW_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FIFTH CIRCLE OF WATER");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Healing belongs to Adanos, whose power preserves the living body. The study of life also reveals how a body may be changed, weakened or brought out of balance.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The deeper arts of his circle also govern the passage of force: a current may strike one creature and leap onward into those around it.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Inflate");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Makes a susceptible human victim swell and suffer repeated damage while the spell lasts.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Chain Lightning");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Lightning leaps from one target to another as the spell continues. Its force may turn against the caster.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle11 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle11 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_KDW_06(C_Item)
{	
	name 					=	"The Circles of Water";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_SIXTH;

	visual 					=	"REV_ITWR_WATER_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_KDW_06;

	description				=	name;
	TEXT[1]					=	"Volume VI";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_KDW_06()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE SIXTH CIRCLE OF WATER");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Adanos commands the stillness of deep water and the binding strength of ice. His element can surround and overwhelm, taking hold of many creatures at once.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The highest circle of water spreads freezing cold across the earth. Movement gives way to stillness as the creatures caught within it are enclosed in ice.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Ice Wave");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Sends out a wave of cold that freezes susceptible creatures around the caster and harms them while frozen.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle12 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle12 = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_CIRCLE_BELIAR_01(C_Item)
{	
	name 					=	"The Forbidden Spells";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_THIRD;

	visual 					=	"REV_ITWR_BELIAR_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_BELIAR_01;

	description				=	name;
	TEXT[1]					=	"Volume I";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_BELIAR_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "FORBIDDEN SPELLS");
	Doc_PrintLines(nDocID, 0, "SECOND CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Kiss of the Night");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Such a name befits the gift of Beliar, lord of darkness and death. His forbidden magic binds the body, torments living flesh and draws power from the life it consumes.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Swarm");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Biting insects repeatedly harm the victim and disrupt its actions.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Root Snare");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Grasping roots bind a susceptible victim in place.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle13 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle13 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_BELIAR_02(C_Item)
{	
	name 					=	"The Forbidden Spells";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FIFTH;

	visual 					=	"REV_ITWR_BELIAR_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_BELIAR_02;

	description				=	name;
	TEXT[1]					=	"Volume II";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_BELIAR_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "FORBIDDEN SPELLS");
	Doc_PrintLines(nDocID, 0, "THIRD CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Beliar rules the boundary between life and death. His forbidden arts draw upon the strength of living flesh, taking from one body to sustain another.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "That power may also be turned inward. The magician spends his own vitality to feed the force of his magic, exchanging health for mana.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Steal Energy");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Drains a victim's life to restore the caster's health.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Mana Recovery");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Sacrifices the caster's own health to replenish mana.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle14 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle14 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_BELIAR_03(C_Item)
{	
	name 					=	"The Forbidden Spells";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_SIXTH;

	visual 					=	"REV_ITWR_BELIAR_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_BELIAR_03;

	description				=	name;
	TEXT[1]					=	"Volume III";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_BELIAR_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "FORBIDDEN SPELLS");
	Doc_PrintLines(nDocID, 0, "FOURTH CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Beliar is associated with punishment");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "His curses give pain a lasting hold upon the body. Sickness, decay and destruction are forms of his power, wielded to break the strength of the living.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Explode");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Strikes the target with a sudden burst of destructive magic.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Plague");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Afflicts the victim with a curse of sickness and decay.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle15 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle15 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_BELIAR_04(C_Item)
{
	name 					=	"The Forbidden Spells";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	REV_VALUE_CIRCLE_FIFTH;

	visual 					=	"REV_ITWR_BELIAR_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	Use_BOOK_CIRCLE_BELIAR_04;

	description				=	name;
	TEXT[1]					=	"Volume IV";
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
};
FUNC VOID Use_BOOK_CIRCLE_BELIAR_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "FORBIDDEN SPELLS");
	Doc_PrintLines(nDocID, 0, "FIFTH CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The dead belong to Beliar. His realm lies beyond the warmth of the living, and those who study its secrets seek power over the boundary between body and spirit.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The greatest forbidden workings turn that power against life itself. Their force is purchased with the strength of the magician who calls it forth.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Beliar's Wrath");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Hurls a dark missile of destructive magic at a single target.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Cry of the Dead");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Releases a deadly skull at the target. Casting from the rune consumes all remaining mana.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle16 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle16 = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_CIRCLE_PSI_01(C_Item)
{
	name                    = "The Circles of Brotherhood";

	mainflag                = ITEM_KAT_DOCS;
	flags                   = 0;
	value                   = REV_VALUE_CIRCLE_FIRST;

	visual                  = "REV_ITWR_PSI_01.3ds";
	material                = MAT_LEATHER;
	scemeName               = "MAP";
	on_state[0]             = Use_BOOK_CIRCLE_PSI_01;

	description             = name;
	TEXT[1]					= "Volume I";
	TEXT[5]                 = NAME_Value;
	COUNT[5]                = value;
};
FUNC VOID Use_BOOK_CIRCLE_PSI_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FIRST PSIONIC CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The Sleeper is the object of the Brotherhood's worship and the power to which its gurus attribute their magic. His presence is sought in dreams, visions and the inward senses.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Psionic magic reaches into awareness itself, quieting the waking mind or altering what it remembers.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Sleep");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Lulls a susceptible human into a temporary magical sleep. Some minds resist its influence.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Charm");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Erases the victim's memory of the caster's offences. It does not remove hostility between opposing factions.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle17 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle17 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_PSI_02(C_Item)
{
	name                    = "The Circles of Brotherhood";

	mainflag                = ITEM_KAT_DOCS;
	flags                   = 0;
	value                   = REV_VALUE_CIRCLE_SECOND;

	visual                  = "REV_ITWR_PSI_01.3ds";
	material                = MAT_LEATHER;
	scemeName               = "MAP";
	on_state[0]             = Use_BOOK_CIRCLE_PSI_02;

	description             = name;
	TEXT[1]					= "Volume II";
	TEXT[5]                 = NAME_Value;
	COUNT[5]                = value;
};
FUNC VOID Use_BOOK_CIRCLE_PSI_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE SECOND PSIONIC CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The power attributed to the Sleeper reaches beyond thought into the physical world. The psionic directs it through concentration, extending his will beyond the limits of his body.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Objects may move without being touched, living forms may diminish, and the air itself may carry the force of his command.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Telekinesis");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Lifts and draws an object towards the caster while mana sustains the spell.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Shrink");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Reduces a living creature in size and strength. Humans and the undead cannot be shrunk.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Wind Fist");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "A forceful blast of wind strikes the target. Charging the spell strengthens the blow.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle18 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle18 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_PSI_03(C_Item)
{
	name                    = "The Circles of Brotherhood";

	mainflag                = ITEM_KAT_DOCS;
	flags                   = 0;
	value                   = REV_VALUE_CIRCLE_THIRD;

	visual                  = "REV_ITWR_PSI_01.3ds";
	material                = MAT_LEATHER;
	scemeName               = "MAP";
	on_state[0]             = Use_BOOK_CIRCLE_PSI_03;

	description             = name;
	TEXT[1]					= "Volume III";
	TEXT[5]                 = NAME_Value;
	COUNT[5]                = value;
};
FUNC VOID Use_BOOK_CIRCLE_PSI_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE THIRD PSIONIC CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "To the gurus, the Sleeper's power is felt as will made active. Its effects need no visible hand: force may gather in the air and bear down upon the body.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The psionic shapes this unseen pressure into currents and violent gusts, making the surrounding air an instrument of his intent.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Whirlwind");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Catches a susceptible victim in a swirling column of air, leaving it unable to act.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Storm Fist");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Unleashes a violent gust that throws nearby creatures back.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle19 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle19 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_PSI_04(C_Item)
{
	name                    = "The Circles of Brotherhood";

	mainflag                = ITEM_KAT_DOCS;
	flags                   = 0;
	value                   = REV_VALUE_CIRCLE_FOURTH;

	visual                  = "REV_ITWR_PSI_01.3ds";
	material                = MAT_LEATHER;
	scemeName               = "MAP";
	on_state[0]             = Use_BOOK_CIRCLE_PSI_04;

	description             = name;
	TEXT[1]					= "Volume IV";
	TEXT[5]                 = NAME_Value;
	COUNT[5]                = value;
};
FUNC VOID Use_BOOK_CIRCLE_PSI_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FOURTH PSIONIC CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The Psionic strives to awaken himself and thereby the sleeper and to awaken the sleeper and thereby himself; one through the other.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The workings attributed to the Sleeper invade another will, stirring terror or taking command of the body. The psionic reaches into the mind of his victim and imposes his own intent upon it.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Control");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Overcomes a susceptible victim's will and lets the caster take possession of its body.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Fear");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Drives susceptible creatures near the caster to flee in terror.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle20 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle20 = TRUE;
	};
};

INSTANCE ITWR_REVIVED_CIRCLE_PSI_05(C_Item)
{
	name                    = "The Circles of Brotherhood";

	mainflag                = ITEM_KAT_DOCS;
	flags                   = 0;
	value                   = REV_VALUE_CIRCLE_FIFTH;

	visual                  = "REV_ITWR_PSI_01.3ds";
	material                = MAT_LEATHER;
	scemeName               = "MAP";
	on_state[0]             = Use_BOOK_CIRCLE_PSI_05;

	description             = name;
	TEXT[1]					= "Volume V";
	TEXT[5]                 = NAME_Value;
	COUNT[5]                = value;
};
FUNC VOID Use_BOOK_CIRCLE_PSI_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetMargins(nDocID, 1, 30, 20, 275, 20, 1);
	Doc_SetFont(nDocID, 0, FONT_Book2);
	Doc_PrintLines(nDocID, 0, "THE FIFTH PSIONIC CIRCLE");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The Sleeper's power is felt in the mind as an overwhelming presence. When turned against another creature, it can strip away restraint and leave only blind fury.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "The same force can pass from thought into the world around the psionic, shaking the earth beneath his enemies. Mind and matter yield to a single act of will.");
	Doc_PrintLine(nDocID, 0, "");

	Doc_PrintLine(nDocID, 1, "Berserk");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Drives a susceptible victim into a frenzy, turning it against nearby creatures.");
	Doc_PrintLine(nDocID, 1, "");

	Doc_PrintLine(nDocID, 1, "Earthquake");
	Doc_PrintLine(nDocID, 1, "---------------");
	Doc_PrintLines(nDocID, 1, "Shakes the ground around the caster, striking nearby creatures with violent tremors.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);
	if (RevivedBookstandRead_MagicCircle21 == FALSE)
	{
		REV_ReadBook(BookType_MagicCircles);
		RevivedBookstandRead_MagicCircle21 = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_GIFTFROMTHEGODS(C_Item)
{	
	name 					=	"A Gift from the Gods";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				=	"A Gift from the Gods";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_BookstandRevived_MAGIC5_S1;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_SECRETSOFMAGIC(C_Item)
{	
	name 					=	"The Secrets of Magic";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				=	"The Secrets of Magic";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_BookstandRevived_MAGIC4_S1;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_POWERFULART (C_Item)
{	
	name 					=	"A Powerful Art";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"A Powerful Art";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_BookstandRevived_MAGIC7_S1;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_ELEMENTARYARCANUM (C_Item)
{	
	name 					=	"Elementary Arcanum";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"Elementary Arcanum";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_BookstandRevived_MAGIC2_S1;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_TRUEPOWER (C_Item)
{	
	name 					=	"True Power";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"True Power";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_BookstandRevived_MAGIC3_S1;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_MAGICORE (C_Item)
{	
	name 					=	"Magic Ore";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"Magic Ore";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_BookstandRevived_HISTORY1_S1;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_ASTRONOMY (C_ITEM)
{	
	name 					=	"Astronomy";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"Astronomy";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_BookstandRevived_ASTRONOMY1_S1;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_ARCANUMGOLUM_01 (C_Item)
{	
	name 					=	"Arcanum Golum - Volume I";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseGolemBook1;
};

INSTANCE ITWR_REVIVED_ARCANUMGOLUM_02(C_Item)
{	
	name 					=	"Arcanum Golum - Volume II";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseGolemBook2;
};

/******************************************************************************************/
INSTANCE ITWR_REVIVED_WORDSOFGODS_01 (C_ITEM)
{	
	name 					=	"Words of the Gods Volume 1";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "Words of the Gods";
	TEXT[0]					= "Volume 1";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseLehren_der_Goetter1;
};

INSTANCE ITWR_REVIVED_WORDSOFGODS_02 (C_ITEM)
{	
	name 					=	"Words of the Gods Volume 2";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "Words of the Gods";
	TEXT[0]					= "Volume 2";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseLehren_der_Goetter2;
};

INSTANCE ITWR_REVIVED_WORDSOFGODS_03 (C_ITEM)
{	
	name 					=	"Words of the Gods Volume 3";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"Words of the Gods";
	TEXT[0]					=	"Volume 3";

	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseLehren_der_Goetter3;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_VARANT_01 (C_Item)
{	
	name 					=	"The Battle of Varant";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "The Battle of Varant";
	TEXT[0]					= "Volume 1";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseSchlacht_um_Varant1;
};

INSTANCE ITWR_REVIVED_VARANT_02(C_Item)
{	
	name 					=	"The Battle of Varant";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "The Battle of Varant";
	TEXT[0]					= "Volume 2";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseSchlacht_um_Varant2;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_MYRTANAPOETRY (C_Item)
{	
	name 					=	"Myrtana's Poetry";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "Myrtana's Poetry";

	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseMyrtanas_Lyrik;
};

	FUNC VOID UseMyrtanas_Lyrik()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;	 
					Doc_SetPages	( nDocID,  2 );

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga" , 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 	0		);
					
					//1.Seite
 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 
					Doc_PrintLine	( nDocID,  0,""); 					
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"    The Song of");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"          Repentance");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
		
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"In the beginning was the power, pure and white,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Now only echoes of the vow sound through the night.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"They tell of days of unity, long since past,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"'Tis having and taking for which we now thirst.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"All unity was torn apart and burst.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Cursed the spirit which did not last.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Of desire doth now tell our song.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"For unity is forever gone.");				
					Doc_PrintLines	( nDocID,  1,"");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_HUNTANDPREY (C_ITEM)
{	
	name 					=	"Hunt and Prey";
	mainflag 				=	ITEM_KAT_DOCS;			
									
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"Hunt and Prey";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseJagd_und_Beute;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_BLOODFLIES (C_Item)
{	
	name 					=	"The Bloodflies";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description				=	name;
	
	TEXT[5]					=	NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseItWr_Bestiary_Bloodfly;
};

FUNC VOID UseItWr_Bestiary_Bloodfly()
{   
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetFont(nDocID, -1, FONT_Book2);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_PrintLine(nDocID, 0, "The Bloodflies");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "But in that place, where the soil is damp and the air is humid, the flies gather, attracted by the sweat of all kinds of beings. They use their stings to kill their victims and feast on their blood.");
	Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "To take such a sting is the art of many hunters in the swamp. Make a deep cut into the creature's abdomen, then cut in a zigzag line around the sting and remove it carefully, together with the tissue surrounding it. Let it bleed and scrape off the inedible meat.");
	Doc_Show(nDocID);

	if (RevivedBookstandRead_Hunting4 == FALSE)
	{
		REV_ReadBook(BookType_Hunting);
		RevivedBookstandRead_Hunting4 = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_BESTIARY_SWAMPSHARK (C_Item)
{
	name 					= 	"The Swampsharks";

	mainflag 				= 	ITEM_KAT_DOCS;
	flags 					= 	0;
	value 					= 	150;

	visual 					= 	"ItWr_Book_02_01.3ds";
	material 				= 	MAT_LEATHER;

	scemeName				= 	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;			COUNT[5]	= value;
	on_state[0]				= 	UseItWr_Bestiary_Swampshark;
};

FUNC VOID UseItWr_Bestiary_Swampshark()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetFont(nDocID, -1, FONT_Book2);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_PrintLine(nDocID, 0, "The Swampsharks");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLine(nDocID, 0, "");
	Doc_PrintLines(nDocID, 0, "Swampsharks live in warm marshes and muddy water. Their size makes them slow on dry ground, but in their own territory they are dangerous hunters.");
	Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "The jaws are the safest trophy to take first. Cut behind the gum and loosen each tooth from the base instead of striking the skull.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "The hide is thick and tears easily near the belly. Start behind the forelegs, keep the knife flat, and pull the skin away in one piece.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);

	if (RevivedBookstandRead_Hunting6 == FALSE)
	{
		REV_ReadBook(BookType_Hunting);
		RevivedBookstandRead_Hunting6 = TRUE;

		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampsharkTeeth] = TRUE;
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampsharkSkin] = TRUE;

		Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
		B_LogEntry (TOPIC_TalentAnimalTrophy, "Now I can:");
		B_LogEntry (TOPIC_TalentAnimalTrophy, "...remove swampshark teeth.");
		B_LogEntry (TOPIC_TalentAnimalTrophy, "...skin dead swampsharks.");
		PrintScreen (PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);
		Npc_SetTalentSkill (hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_BESTIARY_GOLEM (C_Item)
{
	name 					= 	"The Golems";

	mainflag 				= 	ITEM_KAT_DOCS;
	flags 					= 	0;
	value 					= 	150;

	visual 					= 	"ItWr_Book_02_01.3ds";
	material 				= 	MAT_LEATHER;

	scemeName				= 	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;			COUNT[5]	= value;
	on_state[0]				= 	UseItWr_Bestiary_Golem;
};

FUNC VOID UseItWr_Bestiary_Golem()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetFont(nDocID, -1, FONT_Book2);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_PrintLine(nDocID, 0, "The Golems");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLines(nDocID, 0, "A golem is not flesh, but animated matter bound around a core. Stone, fire, ice and swamp golems differ in body, but not in principle.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "Do not search for organs. Break open the chest cavity and remove the charged heart before the body collapses completely.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "The heart carries the nature of the golem. Keep it wrapped and away from water, flame or frost unless you know exactly what it is.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);

	if (RevivedBookstandRead_Hunting7 == FALSE)
	{
		REV_ReadBook(BookType_Hunting);
		RevivedBookstandRead_Hunting7 = TRUE;

		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MagicHeart] = TRUE;

		Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
		B_LogEntry (TOPIC_TalentAnimalTrophy, "Now I can:");
		B_LogEntry (TOPIC_TalentAnimalTrophy, "...remove hearts from dead golems.");
		PrintScreen (PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);
		Npc_SetTalentSkill (hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_BESTIARY_FIRELIZARD (C_Item)
{
	name 					= 	"The Fire Lizards";

	mainflag 				= 	ITEM_KAT_DOCS;
	flags 					= 	0;
	value 					= 	150;

	visual 					= 	"ItWr_Book_02_01.3ds";
	material 				= 	MAT_LEATHER;

	scemeName				= 	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;			COUNT[5]	= value;
	on_state[0]				= 	UseItWr_Bestiary_FireLizard;
};

FUNC VOID UseItWr_Bestiary_FireLizard()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetFont(nDocID, -1, FONT_Book2);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_PrintLine(nDocID, 0, "The Fire Lizards");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLines(nDocID, 0, "Fire lizards are warans changed by heat and magic. The glands in the throat feed their flame, and the tongue is hardened by it.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "Let the carcass cool before cutting. Hold the lower jaw open and sever the tongue at the root with one clean stroke.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "If the cut is shallow, the tongue tears and loses its value. A hunter should use a sharp knife and avoid the throat glands.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);

	if (RevivedBookstandRead_Hunting8 == FALSE)
	{
		REV_ReadBook(BookType_Hunting);
		RevivedBookstandRead_Hunting8 = TRUE;

		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;

		Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
		B_LogEntry (TOPIC_TalentAnimalTrophy, "Now I can:");
		B_LogEntry (TOPIC_TalentAnimalTrophy, "...remove tongues from dead fire lizards.");
		PrintScreen (PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);
		Npc_SetTalentSkill (hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_BESTIARY_BLACKTROLL (C_Item)
{
	name 					= 	"The Black Troll";

	mainflag 				= 	ITEM_KAT_DOCS;
	flags 					= 	0;
	value 					= 	150;

	visual 					= 	"ItWr_Book_02_01.3ds";
	material 				= 	MAT_LEATHER;

	scemeName				= 	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;			COUNT[5]	= value;
	on_state[0]				= 	UseItWr_Bestiary_BlackTroll;
};

FUNC VOID UseItWr_Bestiary_BlackTroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetFont(nDocID, -1, FONT_Book2);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_PrintLine(nDocID, 0, "The Black Troll");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLines(nDocID, 0, "The black troll is larger, older and tougher than common trolls. Its hide is heavy enough to turn a poor blade.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "Begin at the neck where the fur parts naturally. Work slowly along the spine and keep the hide stretched while cutting.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "The skin is prized because it is rare and dense. Torn pieces are almost worthless, so the first cut matters more than strength.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);

	if (RevivedBookstandRead_Hunting9 == FALSE)
	{
		REV_ReadBook(BookType_Hunting);
		RevivedBookstandRead_Hunting9 = TRUE;

		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollSkin] = TRUE;

		Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
		B_LogEntry (TOPIC_TalentAnimalTrophy, "Now I can:");
		B_LogEntry (TOPIC_TalentAnimalTrophy, "...skin dead black trolls.");
		PrintScreen (PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);
		Npc_SetTalentSkill (hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_BESTIARY_MANTIS (C_Item)
{
	name 					= 	"The Mantises";

	mainflag 				= 	ITEM_KAT_DOCS;
	flags 					= 	0;
	value 					= 	150;

	visual 					= 	"ItWr_Book_02_01.3ds";
	material 				= 	MAT_LEATHER;

	scemeName				= 	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;			COUNT[5]	= value;
	on_state[0]				= 	UseItWr_Bestiary_Mantis;
};

FUNC VOID UseItWr_Bestiary_Mantis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetFont(nDocID, -1, FONT_Book2);
	Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
	Doc_PrintLine(nDocID, 0, "The Mantises");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetFont(nDocID, -1, FONT_Book);
	Doc_PrintLines(nDocID, 0, "Mantises strike with their forelegs and protect the head with hard plates. The trophy is delicate despite the armor.");
	Doc_PrintLine(nDocID, 0, "");
	Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "Cut below the first neck plate and do not crush the mandibles. A cleanly separated head is the only part worth carrying.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_PrintLines(nDocID, 1, "Hunters should wrap the head at once. The chitin splits if it dries too quickly in the sun.");
	Doc_PrintLine(nDocID, 1, "");
	Doc_Show(nDocID);

	if (RevivedBookstandRead_Hunting10 == FALSE)
	{
		REV_ReadBook(BookType_Hunting);
		RevivedBookstandRead_Hunting10 = TRUE;

		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MantisHead] = TRUE;

		Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
		B_LogEntry (TOPIC_TalentAnimalTrophy, "Now I can:");
		B_LogEntry (TOPIC_TalentAnimalTrophy, "...remove heads from dead mantises.");
		PrintScreen (PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);
		Npc_SetTalentSkill (hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	};
};

/******************************************************************************************/
INSTANCE ITWR_REVIVED_ARTOFFIGHTING (C_ITEM)
{	
	name 					=	"The Art of Fighting";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"The Art of Fighting";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseKampfkunst;
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPES_01 (C_ITEM)
{	
	name 					=	"Recipes";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"Recipes";
	TEXT[0]					=	"Volume 1";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseRezepturen;
};

	FUNC VOID UseRezepturen()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;	 
					Doc_SetPages	( nDocID,  2 );

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		); 					
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 
 					Doc_PrintLine	( nDocID,  0,"");										
					Doc_PrintLines	( nDocID,  0,"The Balm of Vision:");
					Doc_PrintLine	( nDocID,  0,"----------------");
					Doc_PrintLine	( nDocID,  0,"");		
					Doc_PrintLines	( nDocID,  0,"Cover the patient's eyes with bile. This secretion has a bitter taste. Placing this bitterness on the eye forces the patient to regard it, which makes him wise. He learns to see! Bitterness and wisdom are mutually exclusive opposites. They are each other's counterparts!");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Tears, suffering and disappointment are bitter, but wisdom is the consoling influence of every kind of pain. Bitterness and wisdom are alternatives. Where there is bitterness, there is no room for wisdom, and where there is wisdom, there is no bitterness.");
					Doc_Show		( nDocID );
	};

INSTANCE ITWR_REVIVED_RECIPES_02 (C_ITEM)
{	
	name 					=	"Recipes";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	"Recipes";
	TEXT[0]					=	"Volume 2";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	UseRezepturen2;
};

	FUNC VOID UseRezepturen2()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;	 
					Doc_SetPages	( nDocID,  2 );

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		); 					
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 
 					Doc_PrintLine	( nDocID,  0,"");										
					Doc_PrintLines	( nDocID,  0,"The Wine of Oblivion");
					Doc_PrintLine	( nDocID,  0,"--------------------");
						Doc_PrintLine	( nDocID,  0,"");			
					Doc_PrintLines	( nDocID,  0,"The best grapes for this wine are found high up on the slopes of Archolos. The art of allowing this wine to ripen to perfection lies in not disturbing it through any kind of movement. The grapes are blended with the common syos herb in front of the wine cellars.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Observe and marvel as the master turns the clear water of the well to wine. The people pay tribute to him and feast on his gift. The master punishes his lazy disciples by locking them in bottles. A fire is kindled and black snakes arise.");
					Doc_Show		( nDocID );
	};

//****************************************************************************

INSTANCE ITWR_REVIVED_KALOMSRECIPE (C_Item)
{
	name 					=	"Kalom's Recipe";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	name;
	TEXT[0]					=	"The recipe for a healing potion.";
	TEXT[5]					= NAME_Value;			COUNT[5]	= value;
	on_state[0]				=	Use_KalomsRecipe;
};

func VOID Use_KalomsRecipe()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;	 
				Doc_SetPages	( nDocID,  2 );

				Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
				Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
				
				//1.Seite

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);
				Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 
				Doc_PrintLine	( nDocID,  0, ""									);
				Doc_PrintLine	( nDocID,  0,"Lifrun ak Gharak"); 		
				Doc_PrintLine	( nDocID,  0, ""									); 			
				Doc_PrintLines	( nDocID,  0,"Gharak Or Nach bin thu. Lifrun mar Orag chtah. Shrunk esp Horinth.");
				
				//2.Seite

				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1, ""					);					
				Doc_PrintLines	( nDocID,  1,"It seems to make sense if you read it backwards.");
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1,"          - Kalom");	
				
				
				
				
				Doc_Show		( nDocID );
};

//****************************************************************************
//			NOTES
//****************************************************************************



//****************************************************************************
//			RECIPES
//****************************************************************************
INSTANCE ITWR_REVIVED_RECIPE_TURNIPBOOZE		(C_Item)
{
	name 				=	"Recipe for Turnip Booze";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_TurnipBooze;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making Turnip Booze";
};
func void UseRecipe_TurnipBooze ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Turnip Booze"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Ingredients for brewing turnip based alcohol:");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Take a water bottle, two turnips and a decent portion of swampweed.");	
					Doc_PrintLines	( nDocID,  0, "Add the ground teeth of a swampshark."					);
					Doc_PrintLines	( nDocID,  0, "Put it all in the bottle and boil with a shot of beer."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_Show		( nDocID );

	if(KnowsRecipe_TurnipBooze == FALSE)
	{
		Log_CreateTopic (TOPIC_Booze, LOG_NOTE);
		B_LogEntry (TOPIC_Booze, LOGENTRY_RECIPE_TURNIPBOOZE);
		PrintScreen	(PRINT_LearnBooze, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_TurnipBooze = TRUE;
		PLAYER_TALENT_BOOZE[BOOZE_TurnipBooze] = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_VINOSPECIAL		(C_Item)
{
	name 				=	"Recipe for Vino's Special";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_VinoSpecial;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making Vino's Special";
};
func void UseRecipe_VinoSpecial ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Vino's Special" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLine	( nDocID,  0, "Ingredients for brewing Vino's Special:" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "Take two handfuls of berries and crush them well." );
					Doc_PrintLines	( nDocID,  0, "Add two apples and two pears to sweeten the mixture." );
					Doc_PrintLines	( nDocID,  0, "Stir in the dried wings of a bloodfly." );
					Doc_PrintLines	( nDocID,  0, "Let the mixture ferment in a sealed bottle." );

					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "" );

					Doc_Show		( nDocID );

	if(KnowsRecipe_VinoBooze == FALSE)
	{
		Log_CreateTopic (TOPIC_Booze, LOG_NOTE);
		B_LogEntry (TOPIC_Booze, LOGENTRY_RECIPE_VINOBOOZE);
		PrintScreen	(PRINT_LearnBooze, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_VinoBooze = TRUE;
		PLAYER_TALENT_BOOZE[BOOZE_VinoBooze] = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_MONSTERDRINK		(C_Item)
{
	name 				=	"Recipe for Monster Drink";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_MonsterDrink;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making Monster Drink";
};
func void UseRecipe_MonsterDrink ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Monster Drink" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLine	( nDocID,  0, "Ingredients for brewing Monster Drink:" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "Crush two King's Sorrel leaves into a paste." );
					Doc_PrintLines	( nDocID,  0, "Add ground troll tusk powder from two pieces." );
					Doc_PrintLines	( nDocID,  0, "Mix in four teeth and four claws from beasts." );
					Doc_PrintLines	( nDocID,  0, "Boil everything together until the drink thickens." );

					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "" );

					Doc_Show		( nDocID );

	if(KnowsRecipe_MonsterDrink == FALSE)
	{
		Log_CreateTopic (TOPIC_Booze, LOG_NOTE);
		B_LogEntry (TOPIC_Booze, LOGENTRY_RECIPE_MONSTERDRINK);
		PrintScreen	(PRINT_LearnBooze, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_MonsterDrink = TRUE;
		PLAYER_TALENT_BOOZE[BOOZE_MonsterDrink] = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_MAGEWINE		(C_Item)
{
	name 				=	"Recipe for Monastery's Wine";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_MageWine;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making Monastery's Wine";
};
func void UseRecipe_MageWine ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Monastery Wine" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLine	( nDocID,  0, "Ingredients for brewing Monastery Wine:" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "Press four ripe grapes into juice." );
					Doc_PrintLines	( nDocID,  0, "Add the stinger of a bloodfly to strengthen the flavor." );
					Doc_PrintLines	( nDocID,  0, "Seal the mixture in a bottle and let it age." );

					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "" );

					Doc_Show		( nDocID );

	if(KnowsRecipe_MageWine == FALSE)
	{
		Log_CreateTopic (TOPIC_Booze, LOG_NOTE);
		B_LogEntry (TOPIC_Booze, LOGENTRY_RECIPE_MAGEWINE);
		PrintScreen	(PRINT_LearnBooze, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_MageWine = TRUE;
		PLAYER_TALENT_BOOZE[BOOZE_MageWine] = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_RICESCHNAPPS		(C_Item)
{
	name 				=	"Recipe for Rice Schnapps";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_RiceBooze;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making Rice Schnapps";
};
func void UseRecipe_RiceBooze ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Rice Schnapps" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLine	( nDocID,  0, "Ingredients for brewing Rice Schnapps:" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "Take four rice plants and crush the grains." );
					Doc_PrintLines	( nDocID,  0, "Add finely chopped lurker claws." );
					Doc_PrintLines	( nDocID,  0, "Boil the mixture in a bottle and let it cool." );

					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "" );

					Doc_Show		( nDocID );

	if(KnowsRecipe_RiceSchnaps == FALSE)
	{
		Log_CreateTopic (TOPIC_Booze, LOG_NOTE);
		B_LogEntry (TOPIC_Booze, LOGENTRY_RECIPE_RICESCHNAPS);
		PrintScreen	(PRINT_LearnBooze, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_RiceSchnaps = TRUE;
		PLAYER_TALENT_BOOZE[BOOZE_RiceSchnaps] = TRUE;
	};
};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_MEAD		(C_Item)
{
	name 				=	"Recipe for Mead";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_Mead;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making Mead";
};
func void UseRecipe_Mead ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Mead" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLine	( nDocID,  0, "Ingredients for brewing Mead:" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "Take two honey combs and dissolve them in warm water." );
					Doc_PrintLines	( nDocID,  0, "Add the mandibles of a field raider." );
					Doc_PrintLines	( nDocID,  0, "Let the mixture ferment until the drink becomes strong." );

					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );

					Doc_PrintLines	( nDocID,  0, "" );

					Doc_Show		( nDocID );

	if(KnowsRecipe_Mead == FALSE)
	{
		Log_CreateTopic (TOPIC_Booze, LOG_NOTE);
		B_LogEntry (TOPIC_Booze, LOGENTRY_RECIPE_MEAD);
		PrintScreen	(PRINT_LearnBooze, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_Mead = TRUE;
		PLAYER_TALENT_BOOZE[BOOZE_Mead] = TRUE;
	};
};

/******************************************************************************************/
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_MEATSTEW		(C_Item)
{
	name 				=	"Recipe for Meat Stew";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_MeatStew;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a meat stew";
};
func void UseRecipe_MeatStew ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Meat Stew" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for cooking Meat Stew:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take two pieces of meat and two portions of clam meat." );
					Doc_PrintLines	( nDocID,  0, "Add one sausage and a strip of bacon." );
					Doc_PrintLines	( nDocID,  0, "Boil everything slowly until the stew thickens." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_MeatSoup == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_MEATSTEW);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_MeatSoup = TRUE;
		PLAYER_TALENT_COOKING[COOKING_MeatStew] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_FISHSOUP		(C_Item)
{
	name 				=	"Recipe for Fish Soup";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_FishSoup;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a fish soup";
};
func void UseRecipe_FishSoup ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Fish Soup" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for cooking Fish Soup:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take two fish and clean them well." );
					Doc_PrintLines	( nDocID,  0, "Put them into a pot with water." );
					Doc_PrintLines	( nDocID,  0, "Let the soup boil until the fish softens." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_FishSoup == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_FISHSOUP);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_FishSoup = TRUE;
		PLAYER_TALENT_COOKING[COOKING_FishSoup] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_BUGSOUP		(C_Item)
{
	name 				=	"Recipe for Meatbug Ragout";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_BugSoup;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a meat stew";
};
func void UseRecipe_BugSoup ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Meatbug Ragout" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for cooking Meatbug Ragout:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take five dark mushrooms and three portions of meatbug meat." );
					Doc_PrintLines	( nDocID,  0, "Add two rice plants to give the ragout some body." );
					Doc_PrintLines	( nDocID,  0, "Cook it slowly until the mushrooms dissolve into the sauce." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Don't get confused by the meatbugs ugly looks. Once cooked they are tasty." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_BugSoup == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_MEATBUGRAGOUT);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_BugSoup = TRUE;
		PLAYER_TALENT_COOKING[COOKING_MeatbugRagout] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_ROOTSOUP		(C_Item)
{
	name 				=	"Recipe for Root Soup";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_RootSoup;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a Root Soup";
};
func void UseRecipe_RootSoup ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Root Soup" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for cooking Root Soup:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take two meadow berries and two forest berries." );
					Doc_PrintLines	( nDocID,  0, "Add two portions of swamp weed." );
					Doc_PrintLines	( nDocID,  0, "Boil the mixture carefully into a strange but filling soup." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_RootSoup == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_ROOTSOUP);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_RootSoup = TRUE;
		PLAYER_TALENT_COOKING[COOKING_RootSoup] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_CRAWLERSOUP		(C_Item)
{
	name 				=	"Recipe for Minecrawler Soup";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_CrawlerSoup;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a Minecrawler Soup";
};
func void UseRecipe_CrawlerSoup ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Minecrawler Soup" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for cooking Minecrawler Soup:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take two minecrawler mandibles and crush them." );
					Doc_PrintLines	( nDocID,  0, "Mix in four portions of swamp weed." );
					Doc_PrintLines	( nDocID,  0, "Boil the brew until the broth turns dark and bitter." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_CrawlerSoup == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_MINECRAWLERSOUP);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_CrawlerSoup = TRUE;
		PLAYER_TALENT_COOKING[COOKING_MinecrawlerSoup] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_RICEBOWL		(C_Item)
{
	name 				=	"Recipe for Rice bowl";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_RiceBowl;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a bowl of rice";
};
func void UseRecipe_RiceBowl ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Rice bowl" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for preparing Rice bowl:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take three rice plants and separate the grains." );
					Doc_PrintLines	( nDocID,  0, "Cook them in a small pot until soft." );
					Doc_PrintLines	( nDocID,  0, "Serve while still warm." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_Rice == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_RICEBOWL);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_Rice = TRUE;
		PLAYER_TALENT_COOKING[COOKING_RiceBowl] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_MARMALADE		(C_Item)
{
	name 				=	"Recipe for Berry Marmalade";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_Marmalade;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a berry marmalade";
};
func void UseRecipe_Marmalade ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Berry Marmalade" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for preparing Berry Marmalade:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take two grapes, two berries, two meadow berries and two forest berries." );
					Doc_PrintLines	( nDocID,  0, "Crush all fruit into a thick mash." );
					Doc_PrintLines	( nDocID,  0, "Boil it down until it becomes a sweet marmalade." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_Marmalade == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_BERRYMARMALADE);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_Marmalade = TRUE;
		PLAYER_TALENT_COOKING[COOKING_Marmalade] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_FRUITSALAD		(C_Item)
{
	name 				=	"Recipe for Fruit Salad";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_FruitSalad;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a fruit salad";
};
func void UseRecipe_FruitSalad ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Fruit salad" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for preparing Fruit salad:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take one apple, one pear, one berry and one grape." );
					Doc_PrintLines	( nDocID,  0, "Cut the fruit into pieces without crushing them." );
					Doc_PrintLines	( nDocID,  0, "Place everything in a bowl and pour a bottle of milk over it." );
					Doc_PrintLines	( nDocID,  0, "Serve the dish fresh." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_FruitSalad == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_FRUITSALAD);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_FruitSalad = TRUE;
		PLAYER_TALENT_COOKING[COOKING_FruitSalad] = TRUE;
	};
};
/******************************************************************************************/

INSTANCE ITWR_REVIVED_RECIPE_OLDSTEW		(C_Item)
{
	name 				=	"Recipe for Convict's Stew";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;
	value 				=	REV_VALUE_RECIPE;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRecipe_OldStew;
	scemeName			=	"MAP";

	description			= 	name;
	text[0]				= 	"Recipe for making a Convict's Stew";
};
func void UseRecipe_OldStew ()
{
		var int nDocID;

		nDocID = 	Doc_Create		();
					Doc_SetPages	( nDocID,  1 );
					Doc_SetPage 	( nDocID,  0, "letters.TGA", 0 );
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline );
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1 );

					Doc_PrintLine	( nDocID,  0, "Convict's Stew" );
					Doc_SetFont 	( nDocID,  0, FONT_Book );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "Ingredients for cooking Convict's Stew:" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "Take one hard bread and break it into pieces." );
					Doc_PrintLines	( nDocID,  0, "Add one stinky cheese, one old beer and one stale water." );
					Doc_PrintLines	( nDocID,  0, "Cook the miserable mixture until even a paladin can stomach it." );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLine	( nDocID,  0, "" );
					Doc_PrintLines	( nDocID,  0, "" );
					Doc_Show		( nDocID );

	if(KnowsRecipe_OldStew == FALSE)
	{
		Log_CreateTopic (TOPIC_Cooking, LOG_NOTE);
		B_LogEntry (TOPIC_Cooking, LOGENTRY_RECIPE_CONVICTSTEW);
		PrintScreen	(PRINT_LearnCooking, -1, -1, "FONT_OLD_20_WHITE.TGA", 2);

		KnowsRecipe_OldStew = TRUE;
		PLAYER_TALENT_COOKING[COOKING_ConvictStew] = TRUE;
	};
};


//****************************************************************************
//			MAPS
//****************************************************************************

INSTANCE ITWR_REVIVED_MAP_VALLEY (C_Item)
{
	name 		= "Map of the Valley of Mines (supplemented)";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 350;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ITWR_REVIVED_MAP_VALLEY;

	description	= name;
	TEXT[0]		= "Ur-Shak, the Orc shaman, has sketched in";
	TEXT[1]		= "the Orc territory!";
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

	func void Use_ITWR_REVIVED_MAP_VALLEY()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ITWR_REVIVED_MAP_VALLEY);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "REV_MAP_VALLEYOFMINES.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "VALLEYOFMINES\OLDWORLD.zen");
					Doc_SetLevelCoords	(Document, -75642, 55012, 74528, -54472);
					Doc_Show			(Document);
	};
INSTANCE ITWR_REVIVED_MAP_VALLEY_NOORC (C_Item)
{
	name 		= "Map of the Valley of Mines";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 350;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ITWR_REVIVED_MAP_VALLEY_NOORC;

	description	= name;
	TEXT[0]		= "Unfortunately, a big territory in the";
	TEXT[1]		= "southwest is missing.";
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

	func void Use_ITWR_REVIVED_MAP_VALLEY_NOORC()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ITWR_REVIVED_MAP_VALLEY_NOORC);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "REV_MAP_VALLEYOFMINES_NOORC.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "VALLEYOFMINES\OLDWORLD.zen");
					Doc_SetLevelCoords	(Document, -75642, 55012, 74528, -54472);
					Doc_Show			(Document);
	};

INSTANCE ITWR_REVIVED_MAP_VALLEY_GAROND (C_Item)
{
	name 		= "Garond's Mine Map";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 150;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ITWR_REVIVED_MAP_VALLEY_GAROND;

	description	= name;
	TEXT[0]		= "It's only part of the full map";
	TEXT[1]		= "";
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

	func void Use_ITWR_REVIVED_MAP_VALLEY_GAROND()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ITWR_REVIVED_MAP_VALLEY_GAROND);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "REV_MAP_VALLEYOFMINES_GAROND.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "VALLEYOFMINES\OLDWORLD.zen");
					Doc_SetLevelCoords	(Document, -75642, 55012, 74528, -54472);
					Doc_Show			(Document);
	};

INSTANCE ITWR_REVIVED_MAP_VALLEY_DRAGONS (C_Item)
{
	name 		= "Dragon locations in the Valley";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 350;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ITWR_REVIVED_MAP_VALLEY_DRAGONS;

	description	= name;
	TEXT[0]		= "The placement of the orc symbols";
	TEXT[1]		= "are oddly familiar";
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

	func void Use_ITWR_REVIVED_MAP_VALLEY_DRAGONS()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ITWR_REVIVED_MAP_VALLEY_DRAGONS);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "REV_MAP_VALLEYOFMINES_DRAGONS.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "VALLEYOFMINES\OLDWORLD.zen");
					Doc_SetLevelCoords	(Document, -75642, 55012, 74528, -54472);
					Doc_Show			(Document);
	};

INSTANCE ITWR_REVIVED_MAP_VALLEY_CAVES (C_Item)
{
	name 		= "Caves of the Valley of Mines";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 350;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ITWR_REVIVED_MAP_VALLEY_CAVES;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

	func void Use_ITWR_REVIVED_MAP_VALLEY_CAVES()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ITWR_REVIVED_MAP_VALLEY_CAVES);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "REV_MAP_VALLEYOFMINES_CAVES.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "VALLEYOFMINES\OLDWORLD.zen");
					Doc_SetLevelCoords	(Document, -75642, 55012, 74528, -54472);
					Doc_Show			(Document);
	};

/******************************************************************************************/

INSTANCE ITWR_REVIVED_MAP_FOCUS (C_Item)
{	
	name 					=	"Saturas' Focus Map";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	15;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseFocimap;

	description				= name;
	TEXT[0]					= "The tips of the pentagram";
	TEXT[1]					= "reveal the locations of all five";
	TEXT[2]					= "focus stones which were used to create";
	TEXT[3]					= "the Magic Barrier. The map is old";
	TEXT[4]					= "and doesn't show how the Valley";
	TEXT[5]					= "looks today.";
};

FUNC VOID UseFocimap()
{
	var int nDocID;
	
	nDocID = 	Doc_CreateMap	()			  ; 
				Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
				Doc_SetPages	( nDocID, 1 );                         
				Doc_SetPage 	( nDocID, 0, "Map_World_Foki.tga", 	1	);  //  1 -> DO NOT SCALE 

				Doc_Show		( nDocID 	);
};

//****************************************************************************
//			SPECIAL
//****************************************************************************

INSTANCE ITWR_REVIVED_ALMANAC (C_Item)
{	
	name 					=	"Almanac";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	UseItWrFokusbuch;
	description				=	name;
	TEXT[0]					=	"This ancient magic book contains some";
	TEXT[1]					=	"magic formulas which all refer to the use";
	TEXT[2]					=	"of so-called focus stones.";
};

//****************************************************************************

INSTANCE ITWR_REVIVED_CRYPT (C_ITEM)
{	
	name 				=	"The Crypt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	100;

	visual 				=	"ItWr_Book_02_03.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			= 	UseItWrCryptbuch;
	description			= "The Crypt";
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

//****************************************************************************
//****************************************************************************

INSTANCE ITWR_REVIVED_CERTIFICATE (C_Item)
{	
	name 			=	"Certificate";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	0;

	value 			=	4;

	visual 			=	"ItWr_Scroll_01.3DS";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseUrkunde;
	description		=	"Title Deed";
	TEXT[0]			=	"Entitles the holder to claim the";
	TEXT[1]			=	"territory of the mountain fort.";
	TEXT[5]			=	"Value                                      400 pounds of gold";
};

FUNC VOID UseUrkunde()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, FONT_Book2);
				Doc_PrintLine	(nDocID,  0,"Certificate");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"I, Bergmar, Burgrave of the Western Field and presiding judge over the lands of my Lord of Tymorisin, the region surrounding Khorinis, ... hereby declare ... that I ... surrender and sell ... to the holder of this document ... and to the house of Innos the fief of the mountain fort (along with further tenths of my revenue and the mines contained therein) for 400 units of gold.");
				Doc_Show		(nDocID );
};
