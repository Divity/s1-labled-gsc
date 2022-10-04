/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42252.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 24
 * Decompile Time: 12 ms
 * Timestamp: 4/20/2022 8:22:03 PM
*******************************************************************/

//Function Number: 1
lib_A50C::main()
{
	level._effect["_breach_doorbreach_detpack"] = loadfx("fx/explosions/exp_pack_doorbreach");
	level._effect["_breach_doorbreach_kick"] = loadfx("fx/dust/door_kick");
	level.scr_sound["breach_wooden_door"] = "";
	level.scr_sound["breach_wood_door_kick"] = "wood_door_kick";
	common_scripts\utility::flag_init("begin_the_breach");
}

//Function Number: 2
lib_A50C::func_17AD(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("breach_abort");
	if(isdefined(param_05) && param_05 == 0)
	{
		level.var_37BD["scripted"] = ::lib_A50C::func_1783;
	}

	self.var_38C5 = 0;
	self.var_1FE1 = undefined;
	self.var_C6D = undefined;
	self.var_17B6 = 0;
	self.var_17BB = 0;
	self.var_17BC = 0;
	self.var_8589 = 0;
	self.var_71E0 = 0;
	self.var_941 = 0;
	self.var_6C3 = 0;
	self.var_1EE9 = 0;
	self.var_4727 = 1;
	self.var_472B = 0;
	self.var_4A32 = 0;
	var_06 = getentarray(self.targetname,"targetname");
	var_07 = self.targetname;
	self.var_7826 = "badplace_" + var_07;
	self.var_1261 = getent("badplace_" + var_07,"targetname");
	if(isdefined(self.var_1261))
	{
	}

	self.var_17C8 = getent("trigger_" + var_07,"targetname");
	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	if(isdefined(self.var_17C8))
	{
		switch(self.var_17C8.classname)
		{
			case "trigger_use":
				break;

			case "trigger_use_touch":
				break;

			case "trigger_radius":
				break;

			case "trigger_multiple":
				break;

			default:
				break;
		}
	}
}

//Function Number: 3
lib_A50C::func_1774()
{
	while(self.var_17C3 == 1)
	{
		self waittillmatch("fire","single anim");
		self.var_7.var_55D4 = gettime();
	}
}

//Function Number: 4
lib_A50C::func_17BA(param_00,param_01,param_02)
{
	self.var_17C3 = 1;
	self.var_17B5 = undefined;
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	self method_81A3(1);
	thread lib_A50C::func_41C4();
	param_00 endon("breach_abort");
	self.var_315A = "stop_idle_" + self getentitynumber();
	var_03 = undefined;
	var_04 = undefined;
	var_05 = undefined;
	var_06 = undefined;
	var_07 = undefined;
	if(self == param_00.var_1FE1)
	{
		var_03 = "01";
	}
	else
	{
		var_03 = "02";
	}

	if(param_00.var_8589 == 1 && param_01 == "explosive_breach_left")
	{
		var_03 = "02";
	}

	switch(param_01)
	{
		case "explosive_breach_left":
			break;

		case "shotgunhinges_breach_left":
			break;

		case "flash_breach_no_door_right":
			break;

		default:
			break;
	}
}

//Function Number: 5
lib_A50C::func_1783()
{
	if(isdefined(self.var_17B5))
	{
		return;
	}

	animscripts\notetracks::func_37C5();
}

//Function Number: 6
lib_A50C::func_2985(param_00)
{
	thread lib_A50C::func_8897(param_00);
	self waittillmatch("attach prop right","single anim");
	var_01 = "TAG_INHAND";
	self attach("weapon_detcord",var_01);
	self waittillmatch("detach prop right","single anim");
	var_02 = self gettagorigin(var_01);
	var_03 = self gettagangles(var_01);
	self detach("weapon_detcord",var_01);
	var_04 = spawn("script_model",var_02);
	var_04 setmodel("weapon_detcord");
	var_04.var_41 = var_03;
	param_00 waittill("detpack_detonated");
	radiusdamage(var_04.var_2E6,64,50,25);
	var_04 delete();
}

//Function Number: 7
lib_A50C::func_8897(param_00)
{
	self waittillmatch("sound effect","single anim");
	thread common_scripts\utility::play_sound_in_space("detpack_plant_arming",param_00.var_C6D.var_2E6);
}

//Function Number: 8
lib_A50C::func_1776(param_00)
{
	self endon("death");
	param_00 endon("breach_aborted");
	param_00 waittill("detpack_detonated");
	if(distance(self.var_2E6,param_00.var_C6D.var_2E6) <= level.var_29B7)
	{
		level.var_8F6F++;
		if(level.var_8F6F > 2)
		{
			level.var_8F6F = 1;
		}

		var_01 = "exposed_flashbang_v" + level.var_8F6F;
		self.var_31 = 1;
		lib_A506::func_BCA(self,"gravity",var_01);
		lib_A50C::func_17A3();
	}
}

//Function Number: 9
lib_A50C::func_17B1(param_00)
{
	param_00 endon("execute_the_breach");
	param_00 endon("breach_aborted");
	thread lib_A50C::func_17B0(param_00);
	self waittill("trigger");
	param_00 notify("execute_the_breach");
}

//Function Number: 10
lib_A50C::func_17B0(param_00)
{
	param_00 waittill("execute_the_breach");
	common_scripts\utility::trigger_off();
	if(isdefined(param_00.var_3011))
	{
		param_00.var_3011 delete();
	}
}

//Function Number: 11
lib_A50C::func_1767(param_00)
{
	self endon("breach_complete");
	self waittill("breach_abort");
	self.var_1EE9 = 1;
	thread lib_A50C::func_1770(param_00);
}

//Function Number: 12
lib_A50C::func_1770(param_00)
{
	while(!self.var_1EE9)
	{
		wait(0.05);
	}

	if(isdefined(self.var_1261))
	{
		badplace_delete(self.var_7826);
	}

	while(!self.var_1EE9)
	{
		wait(0.05);
	}

	common_scripts\utility::array_thread(param_00,::lib_A50C::func_1768,self);
}

//Function Number: 13
lib_A50C::func_1768(param_00)
{
	self endon("death");
	lib_A50C::func_17A3();
	lib_A50C::func_17A4();
	param_00.var_C6D notify(self.var_315A);
	self notify("stop_infinite_ammo");
	self method_81A3(0);
}

//Function Number: 14
lib_A50C::func_17A0(param_00,param_01)
{
	self endon("breach_aborted");
	self endon("breach_complete");
	switch(param_00)
	{
		case "explosive_breach_left":
			break;

		case "shotgunhinges_breach_left":
			break;

		case "flash_breach_no_door_right":
			break;

		default:
			break;
	}
}

//Function Number: 15
lib_A50C::func_89DD(param_00)
{
	var_01 = param_00 method_8093();
	lib_A59A::func_88EB(var_01);
	return var_01;
}

//Function Number: 16
lib_A50C::func_898E(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		var_03 = lib_A50C::func_89DD(param_00[var_02]);
		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 17
lib_A50C::func_41C4()
{
	self endon("death");
	self endon("stop_infinite_ammo");
	while(isdefined(self.weapon))
	{
		if(isdefined(self.weapon) && self.weapon == "none")
		{
			break;
		}

		self.var_18B0 = weaponclipsize(self.weapon);
		wait(0.5);
	}
}

//Function Number: 18
lib_A50C::func_2D4B(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(param_02 == 1)
	{
		self playsoundasmaster(level.scr_sound["breach_wood_door_kick"]);
	}

	switch(param_00)
	{
		case "explosive":
			break;

		case "shotgun":
			break;
	}
}

//Function Number: 19
lib_A50C::func_2D43()
{
	if(self.classname == "script_brushmodel")
	{
		self connectpaths();
		return;
	}

	var_00 = getent(self.target,"targetname");
	var_00 hide();
	var_00 notsolid();
	var_00 connectpaths();
}

//Function Number: 20
lib_A50C::func_2D44(param_00)
{
	var_01 = undefined;
	if(self.classname == "script_model")
	{
		var_01 = anglestoforward(self.var_41);
	}
	else if(self.classname == "script_brushmodel")
	{
		var_01 = self.var_9C67;
	}
	else
	{
	}

	var_02 = (var_01[0] * 20,var_01[1] * 20,var_01[2] * 20);
	self moveto(self.var_2E6 + var_02,0.5,0,0.5);
	var_03 = spawn("script_origin",(0,0,0));
	var_03.var_41 = param_00.var_41;
	var_03.var_2E6 = (self.var_2E6[0],self.var_2E6[1],param_00.var_2E6[2]);
	self linkto(var_03);
	var_03 rotatepitch(90,0.45,0.4);
	wait(0.45);
	var_03 rotatepitch(-4,0.2,0,0.2);
	wait(0.2);
	var_03 rotatepitch(4,0.15,0.15);
	wait(0.15);
	self unlink();
	var_03 delete();
}

//Function Number: 21
lib_A50C::func_17A7(param_00)
{
	if(!isdefined(self.var_63A0))
	{
		self.var_63A0 = self.var_1C7;
	}

	self.var_1C7 = param_00;
}

//Function Number: 22
lib_A50C::func_17A4()
{
	if(isdefined(self.var_63A0))
	{
		self.var_1C7 = self.var_63A0;
	}

	self.var_63A0 = undefined;
}

//Function Number: 23
lib_A50C::func_17A6(param_00)
{
	if(!isdefined(self.var_6392))
	{
		self.var_6392 = self.animname;
	}

	self.animname = param_00;
}

//Function Number: 24
lib_A50C::func_17A3()
{
	if(isdefined(self.var_6392))
	{
		self.animname = self.var_6392;
	}

	self.var_6392 = undefined;
}