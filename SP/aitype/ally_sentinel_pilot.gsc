/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ally_sentinel_pilot.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 111 ms
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
	self.health = 100;
	self.var_1D6 = "fraggrenade";
	self.var_1D3 = 0;
	self.secondaryweapon = "";
	self.var_8557 = "iw5_titan45_sp";
	if(isai(self))
	{
		self method_816C(256,0);
		self method_816D(768,1024);
	}

	self.weapon = "iw5_hbra3_sp";
	lib_A47C::main();
}

//Function Number: 2
spawner()
{
	self method_8040("allies");
}

//Function Number: 3
precache()
{
	lib_A47C::precache();
	precacheitem("iw5_hbra3_sp");
	precacheitem("iw5_titan45_sp");
	precacheitem("fraggrenade");
}