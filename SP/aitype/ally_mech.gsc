/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ally_mech.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 155 ms
 * Timestamp: 4/20/2022 8:19:13 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_C8E = "";
	self.var_7ED = "mech.csv";
	self.inliveplayerkillstreak = "allies";
	self.type = "mech";
	self.var_8F77 = "mech";
	self.var_A = 0.2;
	self.health = 3600;
	self.var_1D6 = "fraggrenade";
	self.var_1D3 = 0;
	self.secondaryweapon = "iw5_titan45_sp";
	self.var_8557 = "iw5_titan45_sp";
	if(isai(self))
	{
		self method_816C(0,0);
		self method_816D(256,1024);
	}

	self.weapon = "exo_minigun";
	lib_A4B0::main();
}

//Function Number: 2
spawner()
{
	self method_8040("allies");
}

//Function Number: 3
precache()
{
	lib_A4B0::precache();
	precacheitem("exo_minigun");
	precacheitem("iw5_titan45_sp");
	precacheitem("iw5_titan45_sp");
	precacheitem("fraggrenade");
	lib_A54A::main();
}