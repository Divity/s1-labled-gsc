/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: enemy_dprk_ar.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 111 ms
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

	switch(codescripts\character::get_random_weapon(10))
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

		case 7:
			break;

		case 8:
			break;

		case 9:
			break;
	}
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
	precacheitem("iw5_ak12_sp");
	precacheitem("iw5_ak12_sp_opticsacog2");
	precacheitem("iw5_ak12_sp_opticsreddot");
	precacheitem("iw5_ak12_sp_variablereddot");
	precacheitem("iw5_ak12_sp_opticstargetenhancer");
	precacheitem("iw5_arx160_sp");
	precacheitem("iw5_arx160_sp_opticsacog2");
	precacheitem("iw5_arx160_sp_opticsreddot");
	precacheitem("iw5_arx160_sp_variablereddot");
	precacheitem("iw5_arx160_sp_opticstargetenhancer");
	precacheitem("iw5_vbr_sp");
	precacheitem("fraggrenade");
}