/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42788.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 34
 * Decompile Time: 4 ms
 * Timestamp: 4/20/2022 8:18:16 PM
*******************************************************************/

//Function Number: 1
lib_A724::init_audio()
{
	if(!isdefined(level.audio))
	{
		level.audio = spawnstruct();
	}

	lib_A724::init_reverb();
	lib_A724::init_whizby();
	level.onplayerconnectaudioinit = ::lib_A724::onplayerconnectaudioinit;
}

//Function Number: 2
lib_A724::onplayerconnectaudioinit()
{
	lib_A724::apply_reverb("default");
}

//Function Number: 3
lib_A724::init_reverb()
{
	lib_A724::add_reverb("default","generic",0.15,0.9,2);
}

//Function Number: 4
lib_A724::add_reverb(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [];
	lib_A724::is_roomtype_valid(param_01);
	var_05["roomtype"] = param_01;
	var_05["wetlevel"] = param_02;
	var_05["drylevel"] = param_03;
	var_05["fadetime"] = param_04;
	level.audio.reverb_settings[param_00] = var_05;
}

//Function Number: 5
lib_A724::is_roomtype_valid(param_00)
{
}

//Function Number: 6
lib_A724::apply_reverb(param_00)
{
	if(!isdefined(level.audio.reverb_settings[param_00]))
	{
		var_01 = level.audio.reverb_settings["default"];
	}
	else
	{
		var_01 = level.audio.reverb_settings[var_01];
	}

	self method_832E("snd_enveffectsprio_level",var_01["roomtype"],var_01["drylevel"],var_01["wetlevel"],var_01["fadetime"]);
}

//Function Number: 7
lib_A724::init_whizby()
{
	level.audio.whizby_settings = [];
	lib_A724::set_whizby_radius(15,30,50);
	lib_A724::set_whizby_spread(150,250,350);
}

//Function Number: 8
lib_A724::set_whizby_radius(param_00,param_01,param_02)
{
	level.audio.whizby_settings["radius"] = [param_00,param_01,param_02];
}

//Function Number: 9
lib_A724::set_whizby_spread(param_00,param_01,param_02)
{
	level.audio.whizby_settings["spread"] = [param_00,param_01,param_02];
}

//Function Number: 10
lib_A724::apply_whizby()
{
	var_00 = level.audio.whizby_settings;
	var_01 = var_00["spread"];
	var_02 = var_00["radius"];
	self setwhizbyspreads(var_01[0],var_01[1],var_01[2]);
	self setwhizbyradii(var_02[0],var_02[1],var_02[2]);
}

//Function Number: 11
lib_A724::snd_play_team_splash(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = "null";
	}

	if(!isdefined(param_01))
	{
		param_01 = "null";
	}

	if(level.teambased)
	{
		foreach(var_03 in level.var_328)
		{
			if(isdefined(var_03) && issentient(var_03) && issentient(self) && var_03.inliveplayerkillstreak != self.inliveplayerkillstreak)
			{
				if(soundexists(param_01))
				{
					var_03 method_82F4(param_01);
				}

				continue;
			}

			if(isdefined(var_03) && issentient(var_03) && issentient(self) && var_03.inliveplayerkillstreak == self.inliveplayerkillstreak)
			{
				if(soundexists(param_00))
				{
					var_03 method_82F4(param_00);
				}
			}
		}
	}
}

//Function Number: 12
lib_A724::snd_play_on_notetrack_timer(param_00,param_01,param_02,param_03)
{
}

//Function Number: 13
lib_A724::snd_play_on_notetrack(param_00,param_01,param_02)
{
	self endon("stop_sequencing_notetracks");
	self endon("death");
	lib_A724::sndx_play_on_notetrack_internal(param_00,param_01,param_02);
}

//Function Number: 14
lib_A724::sndx_play_on_notetrack_internal(param_00,param_01,param_02)
{
	for(;;)
	{
		self waittill(param_01,var_03);
		if(isdefined(var_03) && var_03 != "end")
		{
			if(isarray(param_00))
			{
				var_04 = param_00[var_03];
				if(isdefined(var_04))
				{
					self playsoundasmaster(var_04);
				}

				continue;
			}

			if(param_01 == var_03)
			{
				self playsoundasmaster(param_00);
			}
		}
	}
}

//Function Number: 15
lib_A724::scriptmodelplayanimwithnotify(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(isdefined(param_04))
	{
		level endon(param_04);
	}

	param_00 scriptmodelplayanimdeltamotion(param_01,param_02);
	thread lib_A724::scriptmodelplayanimwithnotify_notetracks(param_00,param_02,param_03,param_04,param_05,param_06);
}

//Function Number: 16
lib_A724::scriptmodelplayanimwithnotify_notetracks(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(isdefined(param_03))
	{
		level endon(param_03);
	}

	if(isdefined(param_04))
	{
		param_00 endon(param_04);
	}

	if(isdefined(param_05))
	{
		param_00 endon(param_05);
	}

	param_00 endon("death");
	for(;;)
	{
		param_00 waittill(param_01,var_06);
		if(isdefined(var_06) && var_06 == param_01)
		{
			param_00 playsoundasmaster(param_02);
		}
	}
}

//Function Number: 17
scriptmodelplayanimwithnotify_uniquename(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(isdefined(param_05))
	{
		level endon(param_05);
	}

	param_00 scriptmodelplayanimdeltamotion(param_01,param_02);
	thread scriptmodelplayanimwithnotify_notetracks_uniquename(param_00,param_02,param_03,param_04,param_05,param_06,param_07);
}

//Function Number: 18
scriptmodelplayanimwithnotify_notetracks_uniquename(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(isdefined(param_04))
	{
		level endon(param_04);
	}

	if(isdefined(param_05))
	{
		param_00 endon(param_05);
	}

	if(isdefined(param_06))
	{
		param_00 endon(param_06);
	}

	param_00 endon("death");
	if(isarray(param_02))
	{
		var_07 = param_02.size;
		for(;;)
		{
			param_00 waittill(param_01,var_08);
			if(isdefined(var_08))
			{
				for(var_09 = 0;var_09 < var_07;var_09++)
				{
					if(var_08 == param_02[var_09])
					{
						param_00 playsoundasmaster(param_03[var_09]);
					}
				}
			}
		}

		return;
	}

	for(;;)
	{
		param_00 waittill(param_01,var_08);
		if(isdefined(var_08) && var_08 == param_02)
		{
			param_00 playsoundasmaster(param_03);
		}
	}
}

//Function Number: 19
lib_A724::snd_veh_play_loops(param_00,param_01,param_02)
{
	var_03 = self;
	var_04 = [param_00,param_01,param_02];
	var_05[0] = spawn("script_origin",var_03.var_2E6);
	var_05[0] method_8446(var_03);
	var_05[0] playloopsound(param_00);
	var_05[1] = spawn("script_origin",var_03.var_2E6);
	var_05[1] method_8446(var_03);
	var_05[1] playloopsound(param_01);
	var_05[2] = spawn("script_origin",var_03.var_2E6);
	var_05[2] method_8446(var_03);
	var_05[2] playloopsound(param_02);
	var_03 waittill("death");
	foreach(var_07 in var_05)
	{
		if(isdefined(var_07))
		{
			wait(0.06);
			var_07 delete();
		}
	}
}

//Function Number: 20
lib_A724::deprecated_aud_map(param_00,param_01)
{
	var_02 = 0;
	var_03 = param_01.size;
	var_04 = param_01[0];
	for(var_05 = 1;var_05 < param_01.size;var_05++)
	{
		var_06 = param_01[var_05];
		if(param_00 >= var_04[0] && param_00 <= var_06[0])
		{
			var_07 = var_04[0];
			var_08 = var_06[0];
			var_09 = var_04[1];
			var_0A = var_06[1];
			var_0B = param_00 - var_07 / var_08 - var_07;
			var_02 = var_09 + var_0B * var_0A - var_09;
			break;
		}
		else
		{
			var_04 = var_06;
		}
	}

	return var_02;
}

//Function Number: 21
lib_A724::snd_play_loop_in_space(param_00,param_01,param_02,param_03)
{
	var_04 = 0.2;
	if(isdefined(param_03))
	{
		var_04 = param_03;
	}

	var_05 = spawn("script_origin",param_01);
	var_05 playloopsound(param_00);
	thread lib_A724::sndx_play_loop_in_space_internal(var_05,param_02,var_04);
	return var_05;
}

//Function Number: 22
lib_A724::sndx_play_loop_in_space_internal(param_00,param_01,param_02)
{
	level waittill(param_01);
	if(isdefined(param_00))
	{
		param_00 scalevolume(0,param_02);
		wait(param_02 + 0.05);
		param_00 delete();
	}
}

//Function Number: 23
lib_A724::snd_script_timer(param_00)
{
	level.timer_number = 0;
	if(!isdefined(param_00))
	{
		param_00 = 0.1;
	}

	for(;;)
	{
		iprintln(level.timer_number);
		wait(param_00);
		level.timer_number = level.timer_number + param_00;
	}
}

//Function Number: 24
lib_A724::snd_play_in_space(param_00,param_01,param_02,param_03)
{
	var_04 = 9;
	var_05 = 0.75;
	var_06 = spawn("script_origin",param_01);
	var_06 playsoundasmaster(param_00);
	var_06 thread lib_A724::sndx_play_in_space_internal(var_04,var_05);
	return var_06;
}

//Function Number: 25
lib_A724::sndx_play_in_space_internal(param_00,param_01)
{
	var_02 = 9;
	var_03 = 0.05;
	var_04 = self;
	if(isdefined(param_00))
	{
		var_02 = param_00;
	}

	if(isdefined(param_01))
	{
		var_03 = param_01;
	}

	wait(var_02);
	if(isdefined(var_04))
	{
		var_04 scalevolume(0,var_03);
		wait(var_03 + 0.05);
		if(isdefined(var_04))
		{
			var_04 delete();
		}
	}
}

//Function Number: 26
lib_A724::snd_play_in_space_delayed(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 9;
	var_06 = 0.75;
	var_07 = spawn("script_origin",param_01);
	var_07 thread lib_A724::sndx_play_in_space_delayed_internal(param_00,param_02,param_03,param_04);
	return var_07;
}

//Function Number: 27
lib_A724::sndx_play_in_space_delayed_internal(param_00,param_01,param_02,param_03)
{
	wait(param_01);
	var_04 = 9;
	var_05 = 0.05;
	var_06 = self;
	var_06 playsoundasmaster(param_00);
	if(isdefined(param_02))
	{
		var_04 = param_02;
	}

	if(isdefined(param_03))
	{
		var_05 = param_03;
	}

	wait(var_04);
	if(isdefined(var_06))
	{
		var_06 scalevolume(0,var_05);
		wait(var_05 + 0.05);
		if(isdefined(var_06))
		{
			var_06 delete();
		}
	}
}

//Function Number: 28
lib_A724::snd_play_linked(param_00,param_01,param_02,param_03)
{
	var_04 = spawn("script_origin",param_01.var_2E6);
	var_04 linkto(param_01);
	var_04 thread lib_A724::sndx_play_linked_internal(param_00,param_01,param_02,param_03);
	return var_04;
}

//Function Number: 29
lib_A724::sndx_play_linked_internal(param_00,param_01,param_02,param_03)
{
	var_04 = 9;
	var_05 = 0.05;
	var_06 = self;
	var_06 playsoundasmaster(param_00);
	if(isdefined(param_02))
	{
		var_04 = param_02;
	}

	if(isdefined(param_03))
	{
		var_05 = param_03;
	}

	wait(var_04);
	if(isdefined(var_06))
	{
		var_06 scalevolume(0,var_05);
		wait(var_05 + 0.05);
		var_06 delete();
	}
}

//Function Number: 30
lib_A724::snd_play_linked_loop(param_00,param_01,param_02)
{
	var_03 = spawn("script_origin",param_01.var_2E6);
	var_03 linkto(param_01);
	var_03 thread lib_A724::sndx_play_linked_loop_internal(param_00,param_01,param_02);
	return var_03;
}

//Function Number: 31
lib_A724::sndx_play_linked_loop_internal(param_00,param_01,param_02)
{
	var_03 = 0.05;
	var_04 = self;
	var_04 playloopsound(param_00);
	if(isdefined(param_02))
	{
		var_03 = param_02;
	}

	param_01 waittill("death");
	if(isdefined(var_04))
	{
		var_04 scalevolume(0,var_03);
		wait(var_03 + 0.05);
		var_04 delete();
	}
}

//Function Number: 32
lib_A724::aud_print_3d_on_ent(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(self))
	{
		var_05 = (1,1,1);
		var_06 = (1,0,0);
		var_07 = (0,1,0);
		var_08 = (0,1,1);
		var_09 = 5;
		var_0A = var_05;
		if(isdefined(param_01))
		{
			var_09 = param_01;
		}

		if(isdefined(param_02))
		{
			var_0A = param_02;
			switch(var_0A)
			{
				case "red":
					break;

				case "white":
					break;

				case "blue":
					break;

				case "green":
					break;

				default:
					break;
			}
		}
	}
}

//Function Number: 33
lib_A724::audx_print_3d_timer(param_00)
{
	self endon("death");
	wait(param_00);
	if(isdefined(self))
	{
		self notify("aud_stop_3D_print");
	}
}

//Function Number: 34
lib_A724::snd_vehicle_mp()
{
}