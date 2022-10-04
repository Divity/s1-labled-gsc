/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42824.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 23
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:24:10 PM
*******************************************************************/

//Function Number: 1
lib_A748::init()
{
	if(!isdefined(level.sunenable))
	{
		level.sunenable = getdvarint("sm_sunenable",1);
	}

	if(!isdefined(level.sunshadowscale))
	{
		level.sunshadowscale = getdvarfloat("sm_sunshadowscale",1);
	}

	if(!isdefined(level.spotlimit))
	{
		level.spotlimit = getdvarint("sm_spotlimit",4);
	}

	if(!isdefined(level.sunsamplesizenear))
	{
		level.sunsamplesizenear = getdvarfloat("sm_sunsamplesizenear",0.25);
	}

	if(!isdefined(level.qualityspotshadow))
	{
		level.qualityspotshadow = getdvarfloat("sm_qualityspotshadow",1);
	}

	thread lib_A748::monitorplayerspawns();
	if(!isdefined(level._light))
	{
		level._light = spawnstruct();
		lib_A748::light_setup_common_flickerlight_presets();
		lib_A748::light_message_init();
	}

	var_00 = getentarray("trigger_multiple_light_sunshadow","classname");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		level thread lib_A748::sun_shadow_trigger(var_00[var_01]);
	}
}

//Function Number: 2
lib_A748::set_smdvars(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_00))
	{
		level.sunenable = param_00;
	}

	if(isdefined(param_01))
	{
		level.sunshadowscale = param_01;
	}

	if(isdefined(param_02))
	{
		level.spotlimit = param_02;
	}

	if(isdefined(param_03))
	{
		level.sunsamplesizenear = param_03;
	}

	if(isdefined(param_04))
	{
		level.qualityspotshadow = param_04;
	}
}

//Function Number: 3
lib_A748::monitorplayerspawns()
{
	if(isdefined(level.var_328))
	{
		foreach(var_01 in level.var_328)
		{
			var_01 lib_A748::initplayer();
		}
	}

	for(;;)
	{
		level waittill("connected",var_01);
		var_01 lib_A748::initplayer();
		var_01 thread lib_A748::monitordeath();
	}
}

//Function Number: 4
lib_A748::initplayer()
{
	self.sunenable = level.sunenable;
	self.sunshadowscale = level.sunshadowscale;
	self.spotlimit = level.spotlimit;
	self.sunsamplesizenear = level.sunsamplesizenear;
	self.qualityspotshadow = level.qualityspotshadow;
	self setclientdvars("sm_sunenable",self.sunenable,"sm_sunshadowscale",self.sunshadowscale,"sm_spotlimit",self.spotlimit,"sm_qualityspotshadow",self.qualityspotshadow,"sm_sunSampleSizeNear",self.sunsamplesizenear);
}

//Function Number: 5
lib_A748::monitordeath()
{
	self waittill("spawned");
	lib_A748::initplayer();
}

//Function Number: 6
lib_A748::sun_shadow_trigger(param_00)
{
	var_01 = 1;
	if(isdefined(param_00.script_duration))
	{
		var_01 = param_00.script_duration;
	}

	for(;;)
	{
		param_00 waittill("trigger",var_02);
		param_00 lib_A748::set_sun_shadow_params(var_01,var_02);
	}
}

//Function Number: 7
lib_A748::set_sun_shadow_params(param_00,param_01)
{
	var_02 = param_01.sunenable;
	var_03 = param_01.sunshadowscale;
	var_04 = param_01.spotlimit;
	var_05 = param_01.sunsamplesizenear;
	var_06 = param_01.qualityspotshadow;
	if(isdefined(self.script_sunenable))
	{
		var_02 = self.script_sunenable;
	}

	if(isdefined(self.script_sunshadowscale))
	{
		var_03 = self.script_sunshadowscale;
	}

	if(isdefined(self.script_spotlimit))
	{
		var_04 = self.script_spotlimit;
	}

	if(isdefined(self.script_sunsamplesizenear))
	{
		var_05 = self.script_sunsamplesizenear;
	}

	var_05 = min(max(0.016,var_05),32);
	if(isdefined(self.script_qualityspotshadow))
	{
		var_06 = self.script_qualityspotshadow;
	}

	param_01 setclientdvars("sm_sunenable",var_02,"sm_sunshadowscale",var_03,"sm_spotlimit",var_04,"sm_qualityspotshadow",var_06);
	param_01.sunenable = var_02;
	param_01.sunshadowscale = var_03;
	param_01.spotlimit = var_04;
	var_07 = param_01.sunsamplesizenear;
	param_01.sunsamplesizenear = var_05;
	param_01.qualityspotshadow = var_06;
	thread lib_A748::lerp_sunsamplesizenear_overtime(var_05,var_07,param_00,param_01);
}

//Function Number: 8
lib_A748::lerp_sunsamplesizenear_overtime(param_00,param_01,param_02,param_03)
{
	level notify("changing_sunsamplesizenear" + param_03.name);
	level endon("changing_sunsamplesizenear" + param_03.name);
	if(param_00 == param_01)
	{
		return;
	}

	var_04 = param_00 - param_01;
	var_05 = 0.1;
	var_06 = param_02 / var_05;
	if(var_06 > 0)
	{
		var_07 = var_04 / var_06;
		var_08 = param_01;
		for(var_09 = 0;var_09 < var_06;var_09++)
		{
			var_08 = var_08 + var_07;
			param_03 setclientdvar("sm_sunSampleSizeNear",var_08);
			param_03.sunsamplesizenear = var_08;
			wait(var_05);
		}
	}

	param_03 setclientdvar("sm_sunSampleSizeNear",param_00);
	param_03.sunsamplesizenear = param_00;
}

//Function Number: 9
lib_A748::light_setup_common_flickerlight_presets()
{
	lib_A748::create_flickerlight_preset("fire",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,8);
	lib_A748::create_flickerlight_preset("blue_fire",(0.445098,0.62451,0.972549),(0.05,0.150451,0.3078432),0.005,0.2,8);
	lib_A748::create_flickerlight_preset("white_fire",(0.972549,0.972549,0.972549),(0.2,0.2,0.2),0.005,0.2,8);
	lib_A748::create_flickerlight_preset("pulse",(0,0,0),(255,107,107),0.2,1,8);
	lib_A748::create_flickerlight_preset("lightbulb",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,6);
	lib_A748::create_flickerlight_preset("fluorescent",(0.972549,0.62451,0.345098),(0.2,0.1462746,0.0878432),0.005,0.2,7);
	lib_A748::create_flickerlight_preset("static_screen",(0.63,0.72,0.92),(0.4,0.43,0.48),0.005,0.2,7);
}

//Function Number: 10
lib_A748::create_flickerlight_preset(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(level._light.flicker_presets))
	{
		level._light.flicker_presets = [];
	}

	var_06 = spawnstruct();
	var_06.color0 = param_01;
	var_06.color1 = param_02;
	var_06.mindelay = param_03;
	var_06.maxdelay = param_04;
	var_06.intensity = param_05;
	level._light.flicker_presets[param_00] = var_06;
}

//Function Number: 11
lib_A748::get_flickerlight_preset(param_00)
{
	if(isdefined(level._light.flicker_presets) && isdefined(level._light.flicker_presets[param_00]))
	{
		return level._light.flicker_presets[param_00];
	}

	return undefined;
}

//Function Number: 12
lib_A748::play_flickerlight_preset(param_00,param_01,param_02)
{
	var_03 = getent(param_01,"targetname");
	if(!isdefined(var_03))
	{
		return;
	}

	var_04 = lib_A748::get_flickerlight_preset(param_00);
	if(!isdefined(var_04))
	{
		return;
	}

	if(isdefined(param_02))
	{
		if(param_02 < 0)
		{
			param_02 = 0;
		}

		var_04.intensity = param_02;
	}

	var_03 setlightintensity(var_04.intensity);
	var_03.islightflickering = 1;
	var_03.islightflickerpaused = 0;
	var_03 thread lib_A748::dyn_flickerlight(var_04.color0,var_04.color1,var_04.mindelay,var_04.maxdelay);
	return var_03;
}

//Function Number: 13
lib_A748::stop_flickerlight(param_00,param_01,param_02)
{
	var_03 = getent(param_01,"targetname");
	if(!isdefined(var_03))
	{
		return;
	}

	if(!isdefined(var_03.islightflickering))
	{
		return;
	}

	if(isdefined(param_02))
	{
		if(param_02 < 0)
		{
			param_02 = 0;
		}
	}

	var_03 setlightintensity(param_02);
	var_03 notify("kill_flicker");
	var_03.islightflickering = undefined;
}

//Function Number: 14
lib_A748::pause_flickerlight(param_00,param_01)
{
	var_02 = getent(param_01,"targetname");
	if(!isdefined(var_02))
	{
		return;
	}

	if(!isdefined(var_02.islightflickering))
	{
		return;
	}

	var_02.islightflickerpaused = 1;
}

//Function Number: 15
lib_A748::unpause_flickerlight(param_00,param_01)
{
	var_02 = getent(param_01,"targetname");
	if(!isdefined(var_02))
	{
		return;
	}

	if(!isdefined(var_02.islightflickering))
	{
		return;
	}

	var_02.islightflickerpaused = 0;
}

//Function Number: 16
lib_A748::dyn_flickerlight(param_00,param_01,param_02,param_03)
{
	self endon("kill_flicker");
	var_04 = param_00;
	var_05 = 0;
	for(;;)
	{
		if(self.islightflickerpaused)
		{
			wait(0.05);
			continue;
		}

		var_06 = var_04;
		var_04 = param_00 + param_01 - param_00 * randomfloat(1);
		if(param_02 != param_03)
		{
			var_05 = var_05 + randomfloatrange(param_02,param_03);
		}
		else
		{
			var_05 = var_05 + param_02;
		}

		if(var_05 == 0)
		{
			var_05 = var_05 + 1E-07;
		}

		var_07 = var_06 - var_04 * 1 / var_05;
		while(var_05 > 0 && !self.islightflickerpaused)
		{
			self method_8044(var_04 + var_07 * var_05);
			wait(0.05);
			var_05 = var_05 - 0.05;
		}
	}
}

//Function Number: 17
lib_A748::model_flicker_preset(param_00,param_01,param_02,param_03)
{
	var_04 = getentarray(param_00,"script_noteworthy");
	if(!isdefined(var_04))
	{
		return;
	}

	self endon("death");
	var_05 = 0;
	var_06 = randomfloatrange(0.1,0.25);
	if(isdefined(param_02))
	{
		lib_A748::exploder(param_02);
	}

	while(var_05 < param_01)
	{
		if(isdefined(param_03))
		{
			lib_A748::exploder(param_03);
		}

		foreach(var_08 in var_04)
		{
			var_08 show();
		}

		wait(var_06);
		if(isdefined(param_03))
		{
			lib_A748::stop_exploder(param_03);
		}

		foreach(var_08 in var_04)
		{
			var_08 hide();
		}

		var_05++;
		wait(var_06);
	}
}

//Function Number: 18
lib_A748::light_message_init()
{
	level._light.messages = [];
}

//Function Number: 19
lib_A748::light_debug_dvar_init()
{
}

//Function Number: 20
lib_A748::light_register_message(param_00,param_01)
{
	level._light.messages[param_00] = param_01;
}

//Function Number: 21
lib_A748::light_message(param_00,param_01,param_02,param_03)
{
	if(isdefined(level._light.messages[param_00]))
	{
		if(isdefined(param_03))
		{
			thread [[ level._light.messages[param_00] ]](param_01,param_02,param_03);
			return;
		}

		if(isdefined(param_02))
		{
			thread [[ level._light.messages[param_00] ]](param_01,param_02);
			return;
		}

		if(isdefined(param_01))
		{
			thread [[ level._light.messages[param_00] ]](param_01);
			return;
		}

		thread [[ level._light.messages[param_00] ]]();
		return;
	}
}

//Function Number: 22
lib_A748::stop_exploder(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.createfxexploders))
	{
		var_01 = level.createfxexploders[param_00];
		if(isdefined(var_01))
		{
			foreach(var_03 in var_01)
			{
				if(!isdefined(var_03.looper))
				{
					continue;
				}

				var_03.looper delete();
			}

			return;
		}

		return;
	}

	var_05 = 0;
	while(var_03 < level.createfxent.size)
	{
		var_05 = level.createfxent[var_03];
		if(!isdefined(var_05))
		{
			continue;
		}

		if(var_05.v["type"] != "exploder")
		{
			continue;
		}

		if(!isdefined(var_05.v["exploder"]))
		{
			continue;
		}

		if(var_05.v["exploder"] + "" != var_02)
		{
			continue;
		}

		if(!isdefined(var_05.looper))
		{
			continue;
		}

		var_05.looper delete();
		var_03++;
	}
}

//Function Number: 23
lib_A748::exploder(param_00)
{
	[[ level.exploderfunction ]](param_00);
}