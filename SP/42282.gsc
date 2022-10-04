/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42282.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 5 ms
 * Timestamp: 4/20/2022 8:22:06 PM
*******************************************************************/

//Function Number: 1
lib_A52A::func_1CA9()
{
	precachemodel("com_flashlight_on_physics");
	lib_A52A::func_38B6();
}

//Function Number: 2
lib_A52A::func_0740(param_00,param_01,param_02)
{
	var_03 = self;
	var_04 = "tag_flash";
	if(isdefined(param_00) && param_00 == "flashlight")
	{
		var_05 = self gettagorigin("tag_inhand");
		var_06 = self gettagangles("tag_inhand");
		self.var_38B5 = spawn("script_model",var_05);
		self.var_38B5 setmodel("com_flashlight_on_physics");
		self.var_38B5.var_41 = var_06;
		self.var_38B5 linkto(self,"tag_inhand");
		var_03 = self.var_38B5;
		var_04 = "tag_light";
	}

	if(isdefined(param_02))
	{
		playfxontag(common_scripts\utility::getfx(param_02),var_03,var_04);
	}
	else
	{
		playfxontag(common_scripts\utility::getfx("flashlight0"),var_03,var_04);
	}

	thread lib_A52A::func_364A(var_04,param_01,var_04,param_02);
	thread lib_A52A::func_7349();
}

//Function Number: 3
lib_A52A::func_7334(param_00,param_01,param_02)
{
	var_03 = self;
	var_04 = "tag_flash";
	if(isdefined(param_00) && param_00 == "flashlight")
	{
		self.var_38B5 notify("kill_fx_before_death");
	}
}

//Function Number: 4
lib_A52A::func_7349()
{
	self endon("death");
	self.var_38B5 endon("death");
	self waittill("enemy");
	if(self.var_33A != "scripted")
	{
		lib_A52A::func_1CA8(self);
	}
}

//Function Number: 5
lib_A52A::func_364A(param_00,param_01,param_02,param_03)
{
	self endon("death");
	self.var_38B5 endon("death");
	if(isdefined(self.var_38B5))
	{
		var_04 = self.var_38B5;
	}
	else
	{
		var_04 = self;
	}

	if(!isdefined(param_01))
	{
		param_01 = 400;
	}

	thread lib_A52A::func_5DA3(param_00,var_04,param_02,param_03);
	thread lib_A52A::func_5DA4(param_00,var_04,param_02,param_03);
	lib_A59A::func_2AB0();
	var_04.var_5710 = common_scripts\utility::spawn_tag_origin();
	playfxontag(common_scripts\utility::getfx("point_amber"),var_04.var_5710,"tag_origin");
	for(;;)
	{
		var_05 = var_04 gettagorigin(param_00);
		var_06 = var_04 gettagangles(param_00);
		var_07 = anglestoforward(var_06);
		var_08 = bullettrace(var_05 + var_07 * 7,var_05 + var_07 * param_01,1,var_04,0);
		var_09 = bullettrace(var_08["position"],var_08["position"] + var_07 * -20,1,var_04,0);
		var_04.var_5710.var_2E6 = var_09["position"];
		wait 0.05;
	}
}

//Function Number: 6
lib_A52A::func_5308(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_01.var_5710))
	{
		killfxontag(common_scripts\utility::getfx("point_amber"),param_01.var_5710,"tag_origin");
	}

	if(isdefined(param_01) && isdefined(param_02))
	{
		if(isdefined(param_03))
		{
			killfxontag(common_scripts\utility::getfx(param_03),param_01,param_02);
			return;
		}

		killfxontag(common_scripts\utility::getfx("flashlight0"),param_01,param_02);
	}
}

//Function Number: 7
lib_A52A::func_5DA4(param_00,param_01,param_02,param_03)
{
	self.var_38B5 endon("death");
	self waittill("death");
	lib_A52A::func_5308(param_00,param_01,param_02,param_03);
}

//Function Number: 8
lib_A52A::func_5DA3(param_00,param_01,param_02,param_03)
{
	self endon("death");
	self.var_38B5 waittill("kill_fx_before_death");
	lib_A52A::func_5308(param_00,param_01,param_02,param_03);
	self.var_38B5 hide();
	wait 0.05;
	self.var_38B5 delete();
}

//Function Number: 9
lib_A52A::func_38B6()
{
	level._effect["point_amber"] = loadfx("vfx/lights/lab/point_flashlight_lab");
	level._effect["flashlight0"] = loadfx("vfx/lights/lab/flashlight_lab");
}

//Function Number: 10
lib_A52A::func_1CA8(param_00)
{
	if(isdefined(param_00.var_38B5))
	{
		param_00.var_55CF = gettime();
		param_00 lib_A52A::func_7334("flashlight");
	}
}

//Function Number: 11
lib_A52A::func_1CAB(param_00)
{
	if(!isdefined(param_00.var_38B5))
	{
		param_00 lib_A52A::func_0740("flashlight");
	}
}