/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42531.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:23:47 PM
*******************************************************************/

//Function Number: 1
lib_A623::func_4D0A()
{
	if(isdefined(level.var_57A7))
	{
		return;
	}

	level.var_57A7 = 1;
	thread lib_A623::func_4D0B();
}

//Function Number: 2
lib_A623::func_4D0B()
{
	waittillframeend;
	common_scripts\utility::array_thread(common_scripts\utility::getstructarray("gag_stage_littlebird_unload","script_noteworthy"),::lib_A623::func_811B);
	common_scripts\utility::array_thread(common_scripts\utility::getstructarray("gag_stage_littlebird_load","script_noteworthy"),::lib_A623::func_811A);
}

//Function Number: 3
lib_A623::func_57AE()
{
	self endon("death");
	lib_A59A::func_32DC("prep_unload");
	lib_A59A::func_32DF("prep_unload");
	lib_A5A0::func_9924();
	var_00 = lib_A623::func_3DAD();
	var_00 lib_A623::func_57AF(self);
	lib_A59E::func_9D0F(var_00);
}

//Function Number: 4
lib_A623::func_8AE3(param_00,param_01,param_02,param_03)
{
	var_04 = "stage_littlebird_" + param_01;
	var_05 = [];
	var_05[0] = param_00;
	param_03 lib_A506::func_BD0(var_05[0],var_04,"tag_detach_" + param_01);
	param_03 lib_A506::func_BC9(var_05[0],var_04,"tag_detach_" + param_01);
	lib_A59A::func_32DD("staged_guy_" + param_01);
	param_00 method_81A6(common_scripts\utility::drop_to_ground(param_00.var_2E6));
	param_00.var_1C7 = 16;
	lib_A59A::func_32DF("guy2_in_" + param_01);
	thread lib_A59F::func_57BC([param_00],undefined,param_01);
}

//Function Number: 5
lib_A623::func_811B()
{
	for(;;)
	{
		self waittill("trigger",var_00);
		lib_A623::func_57AF(var_00);
	}
}

//Function Number: 6
lib_A623::func_811A()
{
	for(;;)
	{
		self waittill("trigger",var_00);
		var_00 veh_setdeceleration(6);
		var_00 veh_setacceleration(4);
		var_00 veh_settargetyaw(self.var_41[1]);
		var_00 veh_setspeed(20,7,7);
		while(distance(common_scripts\utility::flat_origin(var_00.var_2E6),common_scripts\utility::flat_origin(self.var_2E6)) > 256)
		{
			wait(0.05);
		}

		var_00 endon("death");
		var_00 thread lib_A623::func_9CEE(220,self);
		var_00 waittill("near_goal");
		var_00 veh_setspeed(20,22,7);
		var_00 thread lib_A623::func_9CEE(16,self);
		var_00 waittill("near_goal");
		var_00 lib_A5A0::func_A0AF();
		var_00 notify("touch_down",self);
		var_00 veh_setspeed(20,8,7);
	}
}

//Function Number: 7
lib_A623::func_57AF(param_00)
{
	param_00 veh_setdeceleration(6);
	param_00 veh_setacceleration(4);
	param_00 veh_settargetyaw(self.var_41[1]);
	param_00 veh_setspeed(20,7,7);
	while(distance(common_scripts\utility::flat_origin(param_00.var_2E6),common_scripts\utility::flat_origin(self.var_2E6)) > 512)
	{
		wait(0.05);
	}

	param_00 endon("death");
	var_01 = "landing" + randomint(99999);
	badplace_cylinder(var_01,30,self.var_2E6,200,300,"axis","allies","neutral","team3");
	param_00 thread lib_A623::func_9CEE(424,self);
	param_00 waittill("near_goal");
	badplace_delete(var_01);
	badplace_cylinder(var_01,30,self.var_2E6,200,300,"axis","allies","neutral","team3");
	param_00 notify("groupedanimevent","pre_unload");
	param_00 thread lib_A59F::func_C57("pre_unload");
	param_00 veh_setspeed(20,22,7);
	param_00 notify("nearing_landing");
	if(isdefined(param_00.var_2549))
	{
		switch(param_00.var_2549)
		{
			case "hover_then_land":
				break;

			default:
				break;
		}
	}
}

//Function Number: 8
lib_A623::func_7EB9(param_00,param_01,param_02)
{
	if(!lib_A59A::func_32DB("staged_guy_" + param_02))
	{
		lib_A59A::func_32DC("staged_guy_" + param_02);
	}
	else
	{
		lib_A59A::func_32D9("staged_guy_" + param_02);
	}

	if(!lib_A59A::func_32DB("guy2_in_" + param_02))
	{
		lib_A59A::func_32DC("guy2_in_" + param_02);
	}
	else
	{
		lib_A59A::func_32D9("guy2_in_" + param_02);
	}

	var_03 = lib_A623::func_3E6C(param_00,param_02);
	var_04 = common_scripts\utility::getstruct(param_00.target,"targetname");
	var_05 = spawn("script_model",(0,0,0));
	var_05 setmodel(self.model);
	if(isdefined(self.var_60A5))
	{
		var_05.var_2E6 = self.var_2E6;
	}
	else
	{
		var_05.var_2E6 = common_scripts\utility::drop_to_ground(var_04.var_2E6) + (0,0,self.var_65A4);
	}

	var_05.var_41 = var_04.var_41;
	var_05 hide();
	var_06 = undefined;
	var_07 = undefined;
	var_08 = undefined;
	foreach(var_0A in var_03)
	{
		var_0B = undefined;
		foreach(var_0D in param_01)
		{
			if(isdefined(var_0D.var_7AD6) && var_0D.var_7AD6 == var_0A.var_7AD6)
			{
				var_0B = var_0D;
				break;
			}
		}

		if(!isdefined(var_0B))
		{
			var_0B = common_scripts\utility::getclosest(var_0A.var_2E6,param_01);
		}

		var_0B.var_7AD6 = var_0A.var_7AD6;
		if(var_0B.var_7AD6 == 2 || var_0B.var_7AD6 == 5)
		{
			var_06 = var_0B;
			var_0B lib_A577::func_4241(var_0A);
		}
		else if(var_0B.var_7AD6 == 3 || var_0B.var_7AD6 == 6)
		{
			var_08 = var_0B;
		}
		else if(var_0B.var_7AD6 == 4 || var_0B.var_7AD6 == 7)
		{
			var_07 = var_0B;
			var_0B lib_A577::func_4241(var_0A);
		}

		param_01 = common_scripts\utility::array_remove(param_01,var_0B);
	}

	thread lib_A623::func_8AE3(var_08,param_02,var_07,var_05);
	thread common_scripts\utility::delete_on_death(var_05);
}

//Function Number: 9
lib_A623::func_3E6C(param_00,param_01)
{
	var_02 = getnodearray(param_00.target,"targetname");
	var_03 = [];
	foreach(var_05 in var_02)
	{
		if(var_05.var_39B == "stage_" + param_01)
		{
			var_03[var_03.size] = var_05;
		}
	}

	return var_03;
}

//Function Number: 10
lib_A623::func_3DAD()
{
	var_00 = self.var_251D;
	for(;;)
	{
		var_01 = lib_A59A::func_3F80(var_00.target,"targetname");
		if(isdefined(var_01.var_7B00))
		{
			return var_01;
		}

		var_00 = var_01;
	}
}

//Function Number: 11
lib_A623::func_57CE(param_00,param_01)
{
	var_02 = undefined;
	var_03 = undefined;
	var_04 = undefined;
	foreach(var_06 in param_01)
	{
		if(var_06.var_7AD6 == 2 || var_06.var_7AD6 == 5)
		{
			var_02 = var_06;
			continue;
		}

		if(var_06.var_7AD6 == 3 || var_06.var_7AD6 == 6)
		{
			var_04 = var_06;
			continue;
		}

		if(var_06.var_7AD6 == 4 || var_06.var_7AD6 == 7)
		{
			var_03 = var_06;
		}
	}

	lib_A59A::func_32DF("staged_guy_" + param_00);
	thread lib_A59E::func_9CFE(var_02,undefined,param_00);
	var_02 waittill("boarding_vehicle");
	thread lib_A59E::func_9CFE(var_03,undefined,param_00);
	var_03 waittill("boarding_vehicle");
	lib_A59A::func_32DD("guy2_in_" + param_00);
}

//Function Number: 12
lib_A623::func_9CEE(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	self notify("newpath");
	if(!isdefined(param_00))
	{
		param_00 = 2;
	}

	self veh_neargoalnotifydist(param_00);
	self veh_sethoverparams(0,0,0);
	self veh_cleargoalyaw();
	self veh_settargetyaw(common_scripts\utility::flat_angle(param_01.var_41)[1]);
	lib_A5A0::func_646(lib_A59A::func_4414(param_01.var_2E6) + (0,0,param_02),1);
	self waittill("goal");
}