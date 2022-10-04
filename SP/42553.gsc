/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42553.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:50 PM
*******************************************************************/

//Function Number: 1
lib_A639::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("shrike",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A639::func_4D0D);
	lib_A59E::func_1845("vehicle_airplane_shrike");
	level._effect["engineeffect"] = loadfx("vfx/trail/jet_thruster_far");
	level._effect["afterburner"] = loadfx("vfx/fire/jet_afterburner_ignite");
	level._effect["contrail"] = loadfx("vfx/trail/jet_contrail");
	lib_A59E::func_1842("vfx/explosion/vehicle_generic_ai_explo_lrg_runner",undefined,"explo_metal_rand",undefined,undefined,undefined,undefined,undefined,undefined,0);
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_1865("mig_rumble",0.1,0.2,11300,0.05,0.05);
	lib_A59E::func_186A("allies");
}

//Function Number: 2
lib_A639::func_4D0D()
{
	thread lib_A639::func_6A40();
	thread lib_A639::func_4541();
}

//Function Number: 3
lib_A639::func_6A40()
{
	self endon("death");
	self endon("stop_engineeffects");
	lib_A59A::func_32DC("engineeffects");
	lib_A59A::func_32DD("engineeffects");
	var_00 = common_scripts\utility::getfx("engineeffect");
	for(;;)
	{
		lib_A59A::func_32DF("engineeffects");
		playfxontag(var_00,self,"tag_engine_right");
		playfxontag(var_00,self,"tag_engine_left");
		lib_A59A::func_32E3("engineeffects");
		stopfxontag(var_00,self,"tag_engine_left");
		stopfxontag(var_00,self,"tag_engine_right");
	}
}

//Function Number: 4
lib_A639::func_6A1F()
{
	self endon("death");
	self endon("stop_afterburners");
	lib_A59A::func_32DC("afterburners");
	lib_A59A::func_32DD("afterburners");
	var_00 = common_scripts\utility::getfx("afterburner");
	for(;;)
	{
		lib_A59A::func_32DF("afterburners");
		playfxontag(var_00,self,"tag_engine_right");
		playfxontag(var_00,self,"tag_engine_left");
		lib_A59A::func_32E3("afterburners");
		stopfxontag(var_00,self,"tag_engine_left");
		stopfxontag(var_00,self,"tag_engine_right");
	}
}

//Function Number: 5
lib_A639::func_4541()
{
	self waittill("death");
	if(isdefined(self.var_90D6))
	{
		self.var_90D6 delete();
	}

	if(isdefined(self.var_90D7))
	{
		self.var_90D7 delete();
	}
}

//Function Number: 6
lib_A639::func_6A35()
{
	self.var_90D6 = lib_A639::func_0745("tag_engine_right",1);
	self.var_90D7 = lib_A639::func_0745("tag_engine_left",-1);
	var_00 = common_scripts\utility::getfx("contrail");
	self endon("death");
	self endon("stop_contrails");
	lib_A59A::func_32DC("contrails");
	lib_A59A::func_32DD("contrails");
	for(;;)
	{
		lib_A59A::func_32DF("contrails");
		playfxontag(var_00,self.var_90D6,"tag_origin");
		playfxontag(var_00,self.var_90D7,"tag_origin");
		lib_A59A::func_32E3("contrails");
		stopfxontag(var_00,self.var_90D6,"tag_origin");
		stopfxontag(var_00,self.var_90D7,"tag_origin");
	}
}

//Function Number: 7
lib_A639::func_0745(param_00,param_01)
{
	var_02 = common_scripts\utility::spawn_tag_origin();
	var_02.var_2E6 = self gettagorigin(param_00);
	var_02.var_41 = self gettagangles(param_00);
	var_03 = spawnstruct();
	var_03.entity = var_02;
	var_03.forward = -156;
	var_03.var_4DF = 0;
	var_03.var_37E = 224 * param_01;
	var_03.yaw = 0;
	var_03.pitch = 0;
	var_03 lib_A59A::func_971C();
	var_02 linkto(self,param_00);
	return var_02;
}

//Function Number: 8
lib_A639::func_6CCF(param_00)
{
	var_01 = lib_A639::func_6CD0(param_00);
	if(var_01)
	{
		var_02 = 1;
	}
	else
	{
		var_02 = -1;
	}

	var_03 = common_scripts\utility::flat_origin(param_00.var_2E6);
	var_04 = var_03 + anglestoforward(common_scripts\utility::flat_angle(param_00.var_41)) * var_02 * 100000;
	var_05 = pointonsegmentnearesttopoint(var_03,var_04,level.var_31D.var_2E6);
	var_06 = distance(var_03,var_05);
	if(var_06 < 3000)
	{
		return 1;
	}

	return 0;
}

//Function Number: 9
lib_A639::func_6CD0(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_01 = anglestoforward(common_scripts\utility::flat_angle(param_00.var_41));
	var_02 = vectornormalize(common_scripts\utility::flat_origin(level.var_31D.var_2E6) - param_00.var_2E6);
	var_03 = vectordot(var_01,var_02);
	if(var_03 > 0)
	{
		return 1;
	}

	return 0;
}

//Function Number: 10
lib_A639::func_6874()
{
	self waittill("trigger",var_00);
	var_00 endon("death");
	thread lib_A639::func_6874();
	var_00 thread common_scripts\utility::play_loop_sound_on_entity("veh_f15_dist_loop");
	while(lib_A639::func_6CD0(var_00))
	{
		wait(0.05);
	}

	wait(0.5);
	if(isdefined(var_00))
	{
		var_00 thread common_scripts\utility::play_sound_in_space("veh_f15_sonic_boom");
		var_00 waittill("reached_end_node");
		var_00 lib_A639::func_8EC3("veh_f15_dist_loop");
		var_00 delete();
	}
}

//Function Number: 11
lib_A639::func_8EC3(param_00)
{
	self notify("stop sound" + param_00);
}