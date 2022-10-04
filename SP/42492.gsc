/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42492.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:46 PM
*******************************************************************/

//Function Number: 1
lib_A5FC::main(param_00,param_01,param_02)
{
	precachemodel(param_00);
	lib_A59A::set_console_status();
	lib_A59E::func_186C("attack_drone_individual",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A5FC::func_4D0D);
	lib_A59E::func_1846(0.4,0.8,1024);
	lib_A59E::func_1856(499);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1855();
}

//Function Number: 2
lib_A5FC::func_4D0D()
{
	self.var_796E = 1;
	self.var_7953 = 0;
	self.var_2D2F = 1;
	self.var_2161 = self setcontents(0);
	self.var_4B9E = 1;
	self.delete_on_death = 1;
}