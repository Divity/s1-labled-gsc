/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ally_us_marine_shotgun_seo_lowlod.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 102 ms
 * Timestamp: 4/20/2022 8:19:15 PM
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

	switch(codescripts\character::get_random_weapon(4))
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
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
	lib_A4DE::precache();
	precacheitem("iw5_uts19_sp");
	precacheitem("iw5_uts19_sp_opticstargetenhancer");
	precacheitem("iw5_uts19_sp");
	precacheitem("iw5_uts19_sp_opticsreddot");
	precacheitem("iw5_titan45_sp");
	precacheitem("fraggrenade");
}