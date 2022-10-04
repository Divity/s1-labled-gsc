/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ally_hero_cormack_marine_damaged.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 97 ms
 * Timestamp: 4/20/2022 8:19:11 PM
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
	self.health = 100;
	self.var_1D6 = "fraggrenade";
	self.var_1D3 = 0;
	self.secondaryweapon = "";
	self.var_8557 = "iw5_pbw_sp";
	if(isai(self))
	{
		self method_816C(256,0);
		self method_816D(768,1024);
	}

	self.weapon = "iw5_hbra3_sp_variablereddot";
	lib_A480::main();
}

//Function Number: 2
spawner()
{
	self method_8040("allies");
}

//Function Number: 3
precache()
{
	lib_A480::precache();
	precacheitem("iw5_hbra3_sp_variablereddot");
	precacheitem("iw5_pbw_sp");
	precacheitem("fraggrenade");
}