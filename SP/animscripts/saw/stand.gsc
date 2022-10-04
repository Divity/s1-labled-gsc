/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: stand.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 122 ms
 * Timestamp: 4/20/2022 8:19:23 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	self.var_7.var_5F58 = "stop";
	var_00 = self method_8194();
	var_00 thread func_99AC(self);
	self.var_6F8B = %standsawgunner_aim;
	self.var_7F5 = %saw_gunner_idle;
	self.var_7F4 = %saw_gunner_firing_add;
	thread animscripts\saw\common::main(var_00);
}

//Function Number: 2
func_99AC(param_00)
{
	self method_8115(#animtree);
	self.var_7F5 = %saw_gunner_idle_mg;
	self.var_7F4 = %saw_gunner_firing_mg_add;
	self endon("death");
	param_00 waittill("killanimscript");
	self method_8116();
}