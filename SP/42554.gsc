/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42554.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:50 PM
*******************************************************************/

//Function Number: 1
lib_A63A::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("sidewinder_scripted",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A63A::func_4D0D);
	lib_A59E::func_1845("vehicle_sidewinder_scripted");
	lib_A59E::func_186E();
	level._effect["engineeffect"] = loadfx("vfx/trail/jet_thruster_far");
	level._effect["afterburner"] = loadfx("vfx/fire/jet_afterburner_ignite");
	level._effect["contrail"] = loadfx("vfx/trail/jet_contrail");
	level._effect["smoketrail_rocket"] = loadfx("vfx/trail/smoketrail_rocket");
	lib_A59E::func_1842("vfx/explosion/vehicle_generic_ai_explo_lrg_runner",undefined,"explo_metal_rand");
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1854();
}

//Function Number: 2
lib_A63A::func_4D0D()
{
	self.var_796E = 1;
	thread lib_A63A::func_6DE1();
}

//Function Number: 3
lib_A63A::func_6DE1()
{
	self endon("death");
	self endon("stop_engineeffects");
	var_00 = common_scripts\utility::getfx("smoketrail_rocket");
	playfxontag(var_00,self,"lod0_comb");
}

//Function Number: 4
lib_A63A::func_8EC3(param_00)
{
	self notify("stop sound" + param_00);
}