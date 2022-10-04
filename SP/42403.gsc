/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42403.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:27 PM
*******************************************************************/

//Function Number: 1
lib_A5A3::func_7E95(param_00)
{
	level.var_6BE8 = param_00;
}

//Function Number: 2
lib_A5A3::func_8933()
{
	var_00 = undefined;
	if(isdefined(level.var_6BE8))
	{
		var_00 = [[ level.var_6BE8 ]]();
		var_00.animname = "_vehicle_player_rig";
	}
	else
	{
		var_00 = spawn("script_model",(0,0,0));
		var_00.animname = "_vehicle_player_rig";
		var_00 method_8115(#animtree);
		var_00 setmodel("viewbody_generic_s1");
	}

	return var_00;
}

//Function Number: 3
lib_A5A3::func_07B8(param_00,param_01,param_02)
{
	if(!isdefined(level.var_9C83))
	{
		level.var_9C83 = [];
	}

	if(!isdefined(level.var_9C83[param_00]))
	{
		level.var_9C83[param_00] = [];
	}

	level.var_9C83[param_00][param_01] = param_02;
}

//Function Number: 4
lib_A5A3::func_07B9(param_00,param_01,param_02)
{
	level.var_78A9["_vehicle_player_rig"][param_01] = param_02;
}

//Function Number: 5
lib_A5A3::func_3EB3(param_00)
{
	return level.var_9C83[self.classname][param_00];
}

//Function Number: 6
lib_A5A3::func_3EB6(param_00)
{
	return level.var_78A9["_vehicle_player_rig"][param_00];
}

//Function Number: 7
lib_A5A3::func_9FCC()
{
	self endon("guy_entered");
	self waittill("vehicle_mount",var_00);
	self.var_6ADE = var_00;
}

//Function Number: 8
lib_A5A3::func_9FCB()
{
	self waittill("vehicle_dismount",var_00);
	if(isdefined(var_00))
	{
		var_00.var_2E17 = undefined;
	}

	self.var_6ADE = undefined;
}