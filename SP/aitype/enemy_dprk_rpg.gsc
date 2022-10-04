/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: enemy_dprk_rpg.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 99 ms
 * Timestamp: 4/20/2022 8:19:16 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_C8E = "";
	self.var_7ED = "";
	self.inliveplayerkillstreak = "axis";
	self.type = "human";
	self.var_8F77 = "regular";
	self.var_A = 0.2;
	self.health = 200;
	self.var_1D6 = "fraggrenade";
	self.var_1D3 = 0;
	self.secondaryweapon = "";
	self.var_8557 = "iw5_vbr_sp";
	if(isai(self))
	{
		self method_816C(256,0);
		self method_816D(768,1024);
	}

	self.weapon = "iw5_mahem_sp";
	lib_A475::main();
}

//Function Number: 2
spawner()
{
	self method_8040("axis");
}

//Function Number: 3
precache()
{
	lib_A475::precache();
	precacheitem("iw5_mahem_sp");
	precacheitem("iw5_vbr_sp");
	precacheitem("fraggrenade");
}