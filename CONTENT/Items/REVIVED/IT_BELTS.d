
const int	REV_Value_BELT_ARCHER					=	250;
const int	REV_Prot_BELT_ARCHER					=	10;
//******************************************************************//
const int	REV_Value_BELT_CRAWLER					=	250;
const int	REV_Prot_BELT_CRAWLER					=	7;
//******************************************************************//
const int	REV_Value_BELT_LEATHER					=	250;
const int	REV_Prot_BELT_LEATHER					=	5;
//******************************************************************//
const int	REV_Value_BELT_SFB						=	250;
const int	REV_Prot_BELT_SFB						=	10;
//******************************************************************//
const int	REV_Value_BELT_MIL						=	250;
const int	REV_Prot_BELT_MIL						=	7;
//******************************************************************//
const int	REV_Value_BELT_GRD						=	250;
const int	REV_Prot_BELT_GRD						=	10;
//******************************************************************//
const int	REV_Value_BELT_PAL						=	250;
const int	REV_Prot_BELT_PAL						=	15;
//******************************************************************//
const int	REV_Value_BELT_SLD						=	250;
const int	REV_Prot_BELT_SLD						=	10;
//******************************************************************//
const int	REV_Value_BELT_DJG						=	250;
const int	REV_Prot_BELT_DJG						=	15;
//******************************************************************//
const int	REV_Value_BELT_DHT						=	250;
const int	REV_Prot_BELT_DHT						=	15;
//******************************************************************//
const int	REV_Value_BELT_NOV						=	250;
const int	REV_Prot_BELT_NOV						=	7;
//******************************************************************//
const int	REV_Value_BELT_KDF						=	250;
const int	REV_Prot_BELT_KDF						=	10;
//******************************************************************//
const int	REV_Value_BELT_RANGER					=	250;
const int	REV_Prot_BELT_RANGER					=	7;
//******************************************************************//
const int	REV_Value_BELT_KDW						=	250;
const int	REV_Prot_BELT_KDW						=	10;

//****************************************************************************

PROTOTYPE REVIVED_BELT (C_Item)
{
	name			=	"Belt";
	
	mainflag		=	ITEM_KAT_MAGIC;
	flags			=	ITEM_BELT|ITEM_MULTI;

	value			=	0;

	visual			=	"REV_BELT_SFB.3ds";
	visual_skin 	=	0;
	material		=	MAT_LEATHER;

	description		=	"PROTOTYPE";

	INV_ZBIAS		=	INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx		=	INVCAM_ENTF_MISC2_STANDARD;
};

//****************************************************************************
//			GUILDLESS
//****************************************************************************
INSTANCE ITBE_REVIVED_ARCHER (REVIVED_BELT)
{
	name 			=	"Archer's belt";
	value 			=	REV_Value_BELT_ARCHER;

	visual 			=	"REV_BELT_ARCHER.3ds";

	on_equip		=	Equip_ARCHER_BELT;
	on_unequip		=	UnEquip_ARCHER_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_ARCHER;
	TEXT[4]			=	NAME_BeltBonus_Archer;	COUNT[4]		=	REV_Bonus_BELT_01;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_ARCHER_BELT()
{
	if Npc_IsPlayer (self)
	{
		ArcherBe_Equipped = TRUE;	

		self.protection[PROT_POINT] += REV_Prot_BELT_ARCHER;
	
		if (ArcherArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_01;
			self.protection[PROT_POINT] += REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_01;
		};
	};
};
FUNC VOID UnEquip_ARCHER_BELT()
{
	if Npc_IsPlayer (self)
	{
		ArcherBe_Equipped = FALSE;	

		self.protection[PROT_POINT] -= REV_Prot_BELT_ARCHER;
	
		if (ArcherArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_01;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_01;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_CRAWLER (REVIVED_BELT)
{
	name 			=	"Crawler Belt";
	value 			=	REV_Value_BELT_CRAWLER;

	visual 			=	"REV_BELT_CRAWLER.3ds";

	on_equip		=	Equip_CRAWLER_BELT;
	on_unequip		=	UnEquip_CRAWLER_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_CRAWLER;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_CRAWLER;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_CRAWLER;
	TEXT[4]			=	NAME_BeltBonus_Crawler;	COUNT[4]		=	REV_Bonus_BELT_01;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_CRAWLER_BELT()
{
	if Npc_IsPlayer (self)
	{
		CrawlerBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_CRAWLER;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_CRAWLER;
		self.protection[PROT_POINT] += REV_Prot_BELT_CRAWLER;
	
		if (CrawlerArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_01;
			self.protection[PROT_POINT] += REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_01;
		};
	};
};
FUNC VOID UnEquip_CRAWLER_BELT()
{
	if Npc_IsPlayer (self)
	{
		CrawlerBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_CRAWLER;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_CRAWLER;
		self.protection[PROT_POINT] -= REV_Prot_BELT_CRAWLER;
	
		if (CrawlerArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_01;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_01;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_LEATHER (REVIVED_BELT)
{
	name 			=	"Leather Belt";
	value 			=	REV_Value_BELT_LEATHER;

	visual 			=	"REV_BELT_LEATHER.3ds";

	on_equip		=	Equip_LEATHER_BELT;
	on_unequip		=	UnEquip_LEATHER_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_LEATHER;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_LEATHER;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_LEATHER;
	TEXT[4]			=	NAME_BeltBonus_Leather;	COUNT[4]		=	REV_Bonus_BELT_02;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_LEATHER_BELT()
{
	if Npc_IsPlayer (self)
	{
		LeatherBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_LEATHER;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_LEATHER;
		self.protection[PROT_POINT] += REV_Prot_BELT_LEATHER;
	
		if (LeatherArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_02;
			self.protection[PROT_POINT] += REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_02;
		};
	};
};
FUNC VOID UnEquip_LEATHER_BELT()
{
	if Npc_IsPlayer (self)
	{
		LeatherBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_LEATHER;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_LEATHER;
		self.protection[PROT_POINT] -= REV_Prot_BELT_LEATHER;
	
		if (LeatherArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_02;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_02;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_SFB (REVIVED_BELT)
{
	name 			=	"Miner's belt";
	value 			=	REV_Value_BELT_SFB;

	visual 			=	"REV_BELT_SFB.3ds";

	on_equip		=	Equip_SFB_BELT;
	on_unequip		=	UnEquip_SFB_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_SFB;
	TEXT[4]			=	NAME_BeltBonus_SFB;		COUNT[4]		=	REV_Bonus_BELT_01;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_SFB_BELT()
{
	if Npc_IsPlayer (self)
	{
		SFBBe_Equipped = TRUE;	

		self.protection[PROT_BLUNT] += REV_Prot_BELT_SFB;
	
		if (SFBArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_01;
			self.protection[PROT_POINT] += REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_01;
		};
	};
};
FUNC VOID UnEquip_SFB_BELT()
{
	if Npc_IsPlayer (self)
	{
		SFBBe_Equipped = FALSE;	

		self.protection[PROT_BLUNT] -= REV_Prot_BELT_SFB;
	
		if (SFBArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_01;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_01;
		};
	};
};

//****************************************************************************
//			MILITIA/PALADINS
//****************************************************************************
INSTANCE ITBE_REVIVED_MIL (REVIVED_BELT)
{
	name 			=	"Militia's belt";
	value 			=	REV_Value_BELT_GRD;

	visual 			=	"REV_BELT_MIL.3ds";

	on_equip		=	Equip_MIL_BELT;
	on_unequip		=	UnEquip_MIL_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_MIL;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_MIL;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_MIL;
	TEXT[4]			=	NAME_BeltBonus_MIL;		COUNT[4]		=	REV_Bonus_BELT_01;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_MIL_BELT()
{
	if Npc_IsPlayer (self)
	{
		MILBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_MIL;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_MIL;
		self.protection[PROT_POINT] += REV_Prot_BELT_MIL;
	
		if (MILArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_01;
			self.protection[PROT_POINT] += REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_01;
		};
	};
};
FUNC VOID UnEquip_MIL_BELT()
{
	if Npc_IsPlayer (self)
	{
		MILBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_MIL;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_MIL;
		self.protection[PROT_POINT] -= REV_Prot_BELT_MIL;
	
		if (MILArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_01;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_01;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_GRD (REVIVED_BELT)
{
	name 			=	"Guard's belt";
	value 			=	REV_Value_BELT_GRD;

	visual 			=	"REV_BELT_GRD.3ds";

	on_equip		=	Equip_GRD_BELT;
	on_unequip		=	UnEquip_GRD_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_GRD;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_GRD;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_GRD;
	TEXT[4]			=	NAME_BeltBonus_GRD;		COUNT[4]		=	REV_Bonus_BELT_02;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_GRD_BELT()
{
	if Npc_IsPlayer (self)
	{
		GRDBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_GRD;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_GRD;
		self.protection[PROT_POINT] += REV_Prot_BELT_GRD;
	
		if (GRDArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_02;
			self.protection[PROT_POINT] += REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_02;
		};
	};
};
FUNC VOID UnEquip_GRD_BELT()
{
	if Npc_IsPlayer (self)
	{
		GRDBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_GRD;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_GRD;
		self.protection[PROT_POINT] -= REV_Prot_BELT_GRD;
	
		if (GRDArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_02;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_02;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_PAL (REVIVED_BELT)
{
	name 			=	"Paladin's belt";
	value 			=	REV_Value_BELT_PAL;

	visual 			=	"REV_BELT_PAL.3ds";

	on_equip		=	Equip_PAL_BELT;
	on_unequip		=	UnEquip_PAL_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_PAL;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_PAL;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_PAL;
	TEXT[4]			=	NAME_BeltBonus_PAL;		COUNT[4]		=	REV_Bonus_BELT_03;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_PAL_BELT()
{
	if Npc_IsPlayer (self)
	{
		PALBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_PAL;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_PAL;
		self.protection[PROT_POINT] += REV_Prot_BELT_PAL;
	
		if (PALArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_03;
			self.protection[PROT_POINT] += REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_03;
		};
	};
};
FUNC VOID UnEquip_PAL_BELT()
{
	if Npc_IsPlayer (self)
	{
		PALBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_PAL;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_PAL;
		self.protection[PROT_POINT] -= REV_Prot_BELT_PAL;
	
		if (PALArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_03;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_03;
		};
	};
};


//****************************************************************************
//			MERCS/DRAGONHUNTERS
//****************************************************************************
INSTANCE ITBE_REVIVED_SLD (REVIVED_BELT)
{
	name 			=	"Mercenary's belt";
	value 			=	REV_Value_BELT_GRD;

	visual 			=	"REV_BELT_SLD.3ds";

	on_equip		=	Equip_SLD_BELT;
	on_unequip		=	UnEquip_SLD_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_SLD;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_SLD;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_SLD;
	TEXT[4]			=	NAME_BeltBonus_SLD;		COUNT[4]		=	REV_Bonus_BELT_01;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_SLD_BELT()
{
	if Npc_IsPlayer (self)
	{
		SLDBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_SLD;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_SLD;
		self.protection[PROT_POINT] += REV_Prot_BELT_SLD;
	
		if (SLDArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_01;
			self.protection[PROT_POINT] += REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_01;
		};
	};
};
FUNC VOID UnEquip_SLD_BELT()
{
	if Npc_IsPlayer (self)
	{
		SLDBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_SLD;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_SLD;
		self.protection[PROT_POINT] -= REV_Prot_BELT_SLD;
	
		if (SLDArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_01;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_01;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_01;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_01;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_01;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_DJG (REVIVED_BELT)
{
	name 			=	"Dragon Hunter's belt";
	value 			=	REV_Value_BELT_DJG;

	visual 			=	"REV_BELT_DJG.3ds";

	on_equip		=	Equip_DJG_BELT;
	on_unequip		=	UnEquip_DJG_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_DJG;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_DJG;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_DJG;
	TEXT[4]			=	NAME_BeltBonus_DJG;		COUNT[4]		=	REV_Bonus_BELT_02;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_DJG_BELT()
{
	if Npc_IsPlayer (self)
	{
		DJGBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_DJG;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_DJG;
		self.protection[PROT_POINT] += REV_Prot_BELT_DJG;
	
		if (DJGArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_02;
			self.protection[PROT_POINT] += REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_02;
		};
	};
};
FUNC VOID UnEquip_DJG_BELT()
{
	if Npc_IsPlayer (self)
	{
		DJGBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_DJG;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_DJG;
		self.protection[PROT_POINT] -= REV_Prot_BELT_DJG;
	
		if (DJGArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_02;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_02;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_DHT (REVIVED_BELT)
{
	name 			=	"Demon Hunter's belt";
	value 			=	REV_Value_BELT_DHT;

	visual 			=	"REV_BELT_DHT.3ds";

	on_equip		=	Equip_DHT_BELT;
	on_unequip		=	UnEquip_DHT_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Edge;			COUNT[0]		= 	REV_Prot_BELT_DHT;
	TEXT[1]			=	NAME_Prot_Blunt;		COUNT[1]		= 	REV_Prot_BELT_DHT;
	TEXT[2]			=	NAME_Prot_Point;		COUNT[2]		= 	REV_Prot_BELT_DHT;
	TEXT[4]			=	NAME_BeltBonus_DHT;		COUNT[4]		=	REV_Bonus_BELT_03;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_DHT_BELT()
{
	if Npc_IsPlayer (self)
	{
		DHTBe_Equipped = TRUE;	

		self.protection[PROT_EDGE]  += REV_Prot_BELT_DHT;
		self.protection[PROT_BLUNT] += REV_Prot_BELT_DHT;
		self.protection[PROT_POINT] += REV_Prot_BELT_DHT;
	
		if (DHTArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_03;
			self.protection[PROT_POINT] += REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_03;
		};
	};
};
FUNC VOID UnEquip_DHT_BELT()
{
	if Npc_IsPlayer (self)
	{
		DHTBe_Equipped = FALSE;	

		self.protection[PROT_EDGE]  -= REV_Prot_BELT_DHT;
		self.protection[PROT_BLUNT] -= REV_Prot_BELT_DHT;
		self.protection[PROT_POINT] -= REV_Prot_BELT_DHT;
	
		if (DHTArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_03;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_03;
		};
	};
};


//****************************************************************************
//			FIRE MAGES
//****************************************************************************
INSTANCE ITBE_REVIVED_NOV (REVIVED_BELT)
{
	name 			=	"Fire Novice's belt";
	value 			=	REV_Value_BELT_GRD;

	visual 			=	"REV_BELT_NOV.3ds";

	on_equip		=	Equip_NOV_BELT;
	on_unequip		=	UnEquip_NOV_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Magic;		COUNT[0]		= 	REV_Prot_BELT_NOV;
	TEXT[1]			=	NAME_Prot_Fire;			COUNT[1]		= 	REV_Prot_BELT_NOV;
	TEXT[4]			=	NAME_BeltBonus_NOV;		COUNT[4]		=	REV_Bonus_BELT_02;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_NOV_BELT()
{
	if Npc_IsPlayer (self)
	{
		NOVBe_Equipped = TRUE;	

		self.protection[PROT_MAGIC]  += REV_Prot_BELT_NOV;
		self.protection[PROT_FIRE] 	 += REV_Prot_BELT_NOV;
	
		if (NOVArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_02;
			self.protection[PROT_POINT] += REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_02;
		};
	};
};
FUNC VOID UnEquip_NOV_BELT()
{
	if Npc_IsPlayer (self)
	{
		NOVBe_Equipped = FALSE;	

		self.protection[PROT_MAGIC]  -= REV_Prot_BELT_NOV;
		self.protection[PROT_FIRE] 	 -= REV_Prot_BELT_NOV;
	
		if (NOVArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_02;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_02;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_KDF (REVIVED_BELT)
{
	name 			=	"Fire Mage's belt";
	value 			=	REV_Value_BELT_KDF;

	visual 			=	"REV_BELT_KDF.3ds";

	on_equip		=	Equip_KDF_BELT;
	on_unequip		=	UnEquip_KDF_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Magic;		COUNT[0]		= 	REV_Prot_BELT_KDF;
	TEXT[1]			=	NAME_Prot_Fire;			COUNT[1]		= 	REV_Prot_BELT_KDF;
	TEXT[4]			=	NAME_BeltBonus_KDF;		COUNT[4]		=	REV_Bonus_BELT_03;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_KDF_BELT()
{
	if Npc_IsPlayer (self)
	{
		KDFBe_Equipped = TRUE;	

		self.protection[PROT_MAGIC]  += REV_Prot_BELT_KDF;
		self.protection[PROT_FIRE] 	 += REV_Prot_BELT_KDF;
	
		if (KDFArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_03;
			self.protection[PROT_POINT] += REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_03;
		};
	};
};
FUNC VOID UnEquip_KDF_BELT()
{
	if Npc_IsPlayer (self)
	{
		KDFBe_Equipped = FALSE;	

		self.protection[PROT_MAGIC]  -= REV_Prot_BELT_KDF;
		self.protection[PROT_FIRE]   -= REV_Prot_BELT_KDF;
	
		if (KDFArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_03;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_03;
		};
	};
};


//****************************************************************************
//			WATER MAGES
//****************************************************************************
INSTANCE ITBE_REVIVED_RANGER (REVIVED_BELT)
{
	name 			=	"Water Circle belt";
	value 			=	REV_Value_BELT_GRD;

	visual 			=	"REV_BELT_RANGER.3ds";

	on_equip		=	Equip_RANGER_BELT;
	on_unequip		=	UnEquip_RANGER_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Magic;		COUNT[0]		= 	REV_Prot_BELT_RANGER;
	TEXT[1]			=	NAME_Prot_Fire;			COUNT[1]		= 	REV_Prot_BELT_RANGER;
	TEXT[4]			=	NAME_BeltBonus_RANGER;	COUNT[4]		=	REV_Bonus_BELT_02;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_RANGER_BELT()
{
	if Npc_IsPlayer (self)
	{
		RangerBe_Equipped = TRUE;	

		self.protection[PROT_MAGIC]  += REV_Prot_BELT_RANGER;
		self.protection[PROT_FIRE] 	 += REV_Prot_BELT_RANGER;
	
		if (RangerArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_02;
			self.protection[PROT_POINT] += REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_02;
		};
	};
};
FUNC VOID UnEquip_RANGER_BELT()
{
	if Npc_IsPlayer (self)
	{
		RangerBe_Equipped = FALSE;	

		self.protection[PROT_MAGIC]  -= REV_Prot_BELT_RANGER;
		self.protection[PROT_FIRE] 	 -= REV_Prot_BELT_RANGER;
	
		if (RangerArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_02;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_02;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_02;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_02;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_02;
		};
	};
};
/******************************************************************************************/
INSTANCE ITBE_REVIVED_KDW (REVIVED_BELT)
{
	name 			=	"Water Mage's belt";
	value 			=	REV_Value_BELT_KDW;

	visual 			=	"REV_BELT_KDW.3ds";

	on_equip		=	Equip_KDW_BELT;
	on_unequip		=	UnEquip_KDW_BELT;

	description		=	name;
	TEXT[0]			=	NAME_Prot_Magic;		COUNT[0]		= 	REV_Prot_BELT_KDW;
	TEXT[1]			=	NAME_Prot_Fire;			COUNT[1]		= 	REV_Prot_BELT_KDW;
	TEXT[4]			=	NAME_BeltBonus_KDW;		COUNT[4]		=	REV_Bonus_BELT_03;
	TEXT[5]			=	NAME_Value;				COUNT[5]		= 	value;
};

FUNC VOID Equip_KDW_BELT()
{
	if Npc_IsPlayer (self)
	{
		KDWBe_Equipped = TRUE;	

		self.protection[PROT_MAGIC]  += REV_Prot_BELT_KDW;
		self.protection[PROT_FIRE] 	 += REV_Prot_BELT_KDW;
	
		if (KDWArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] += REV_Bonus_BELT_03;
			self.protection[PROT_POINT] += REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] += REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	+= REV_Bonus_BELT_03;
		};
	};
};
FUNC VOID UnEquip_KDW_BELT()
{
	if Npc_IsPlayer (self)
	{
		KDWBe_Equipped = FALSE;	

		self.protection[PROT_MAGIC]  -= REV_Prot_BELT_KDW;
		self.protection[PROT_FIRE]   -= REV_Prot_BELT_KDW;
	
		if (KDWArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= REV_Bonus_BELT_03;
			self.protection[PROT_BLUNT] -= REV_Bonus_BELT_03;
			self.protection[PROT_POINT] -= REV_Bonus_BELT_03;
			self.protection[PROT_MAGIC] -= REV_Bonus_BELT_03;
			self.protection[PROT_FIRE] 	-= REV_Bonus_BELT_03;
		};
	};
};