CONST INT WEAR_ARMS = 64;
CONST INT WEAR_LEGS = 128;
CONST INT WEAR_HOOD = 256;
CONST INT WEAR_SHOULDER = 512;
CONST INT WEAR_CLOAK = 1024;

//****************************************************************************

PROTOTYPE REVIVED_HELMET (C_Item)
{
	name					=	"Helmet";
	
	mainflag				=	ITEM_KAT_ARMOR;
	flags					=	0;
	
	protection [PROT_EDGE]	=	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value					=	0;

	wear					=	WEAR_Head;

	visual					=	"REV_ITHE_01.3ds";
	material				=	MAT_METAL;

	description				=	"PROTOTYPE";
};

//****************************************************************************
//			REVIVED HELMETS
//****************************************************************************

INSTANCE ITHE_REVIVED_01 (REVIVED_HELMET)
{
	name					=	"Old Helmet";

	protection [PROT_EDGE]	=	2;
	protection [PROT_BLUNT] = 	2;
	protection [PROT_POINT] = 	2;

	value					=	10;

	visual					=	"REV_ITHE_01.3ds";

	description				=	name;
	TEXT[0]					=	NAME_Prot_Edge;			COUNT[0]				= 	protection	[PROT_EDGE];
	TEXT[1]					=	NAME_Prot_Blunt;		COUNT[1]				= 	protection	[PROT_BLUNT];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]				= 	protection	[PROT_POINT];
	TEXT[5]					=	NAME_Value;				COUNT[5]				= 	value;
};
