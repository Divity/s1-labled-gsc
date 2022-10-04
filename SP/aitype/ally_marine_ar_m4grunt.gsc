/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ally_marine_ar_m4grunt.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 102 ms
 * Timestamp: 4/20/2022 8:19:13 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_C8E = "";
	self.var_7ED = "";
	self.inliveplayerkillstreak = "allies";
	self.type = "human";
	self.var_8F77 = "regular";
	self.var_A = 0.2;
	self.health = 150;
	self.var_1D6 = "fraggrenade";
	self.var_1D3 = 0;
	self.secondaryweapon = "colt45";
	self.var_8557 = "colt45";
	if(isai(self))
	{
		self method_816C(256,0);
		self method_816D(768,1024);
	}

	self.weapon = "m4_grunt";
	switch(codescripts\character::get_random_character(7))
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		case 5:
			break;

		case 6:
			break;
	}
}

//Function Number: 2
spawner()
{
	self method_8040("allies");
}

//Function Number: 3
precache()
{
	lib_A4CD::precache();
	lib_A4CF::precache();
	lib_A4CC::precache();
	lib_A4CE::precache();
	lib_A4D0::precache();
	lib_A4D1::precache();
	lib_A4D2::precache();
	precacheitem("m4_grunt");
	precacheitem("colt45");
	precacheitem("colt45");
	precacheitem("fraggrenade");
}