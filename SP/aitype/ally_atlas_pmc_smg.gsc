/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ally_atlas_pmc_smg.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 101 ms
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
	self.var_8557 = "iw5_titan45_sp";
	if(isai(self))
	{
		self method_816C(256,0);
		self method_816D(768,1024);
	}

	switch(codescripts\character::get_random_weapon(15))
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

		case 10:
			break;

		case 11:
			break;

		case 12:
			break;

		case 13:
			break;

		case 14:
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
	lib_A4BF::precache();
	lib_A4C0::precache();
	precacheitem("iw5_sn6_sp");
	precacheitem("iw5_sn6_sp_opticsacog2");
	precacheitem("iw5_sn6_sp_opticsreddot");
	precacheitem("iw5_sn6_sp_variablereddot");
	precacheitem("iw5_sn6_sp_opticstargetenhancer");
	precacheitem("iw5_asm1_sp");
	precacheitem("iw5_asm1_sp_opticsacog2");
	precacheitem("iw5_asm1_sp_opticsreddot");
	precacheitem("iw5_asm1_sp_variablereddot");
	precacheitem("iw5_asm1_sp_opticstargetenhancer");
	precacheitem("iw5_hmr9_sp");
	precacheitem("iw5_hmr9_sp_opticsacog2");
	precacheitem("iw5_hmr9_sp_opticsreddot");
	precacheitem("iw5_hmr9_sp_variablereddot");
	precacheitem("iw5_hmr9_sp_opticstargetenhancer");
	precacheitem("iw5_titan45_sp");
	precacheitem("fraggrenade");
}