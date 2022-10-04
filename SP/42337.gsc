/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42337.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 124
 * Decompile Time: 29 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A561::main(param_00,param_01,param_02)
{
	if(isdefined(param_00))
	{
		param_00 = tolower(param_00);
		if(param_00 != "assault" && param_00 != "specialist")
		{
			param_00 = undefined;
		}
	}

	lib_A561::func_6B01(param_00,param_01);
	level thread lib_A598::init();
	if(!isdefined(param_02) || param_02 == 1)
	{
		lib_A561::func_6AF5();
	}
}

//Function Number: 2
lib_A561::func_6B01(param_00,param_01)
{
	precacheshader("objective_onscreen");
	precacheshader("ui_circle");
	precacheshader("dpad_icon_overdrive");
	precacheshader("dpad_icon_overdrive_off");
	level._effect["grenade_indicator_danger"] = loadfx("vfx/ui/grenade_indicator_danger");
	precacheshader("dpad_icon_stim");
	precacheshader("dpad_icon_stim_off");
	level._effect["exo_stim"] = loadfx("vfx/ui/ui_exo_health_overlay_sp");
	precacheshellshock("wb_player_boost");
	precacheshader("ugv_vignette_overlay");
	precachestring(&"update_overdrive");
	level.var_31D lib_A59A::func_6C5C(0);
	thread lib_A561::func_4641();
	lib_A575::func_4E20();
	function_00D3("high_jump_double_tap","1");
	thread lib_A563::main();
	if(!isdefined(level.var_31D.exo))
	{
		level.var_31D.exo = [];
	}

	if(!isdefined(level.var_31D.var_34AC))
	{
		level.var_31D.var_34AC = [];
	}

	level.var_350E = [];
	level.var_3513 = [];
	level.var_31D.exo["show_grenades"] = 0;
	level.var_350E["show_grenades"] = ::lib_A561::func_8008;
	level.var_3513["show_grenades"] = ::lib_A561::func_9A84;
	level.var_31D.exo["friendly_detection"] = 1;
	level.var_350E["friendly_detection"] = ::lib_A561::func_7F72;
	level.var_3513["friendly_detection"] = ::lib_A561::func_9A6C;
	level.var_31D.exo["enemy_detection"] = 0;
	level.var_350E["enemy_detection"] = ::lib_A561::func_7F5D;
	level.var_3513["enemy_detection"] = ::lib_A561::func_9A64;
	level.var_31D.exo["move_speed_increase"] = 0;
	level.var_350E["move_speed_increase"] = ::lib_A561::func_7FB2;
	level.var_3513["move_speed_increase"] = ::lib_A561::func_9A78;
	level.var_31D.exo["jump_increase"] = 0;
	level.var_350E["jump_increase"] = ::lib_A561::func_7F92;
	level.var_3513["jump_increase"] = ::lib_A561::func_9A73;
	level.var_31D.exo["boost_dash"] = 1;
	level.var_350E["boost_dash"] = ::lib_A561::func_7F2B;
	level.var_3513["boost_dash"] = ::lib_A561::func_9A5D;
	level.var_31D.exo["overdrive"] = 0;
	lib_A561::func_65E1();
	level.var_350E["overdrive"] = ::lib_A561::func_7FD0;
	level.var_3513["overdrive"] = ::lib_A561::func_9A7A;
	level.var_31D.exo["intel_mode"] = 1;
	level.var_350E["intel_mode"] = ::lib_A561::func_7F8F;
	level.var_3513["intel_mode"] = ::lib_A561::func_9A6F;
	level.var_31D.exo["exo_melee"] = 1;
	level.var_350E["exo_melee"] = ::lib_A561::func_7F61;
	level.var_3513["exo_melee"] = ::lib_A561::func_9A65;
	level.var_31D.exo["exo_slide"] = 1;
	level.var_350E["exo_slide"] = ::lib_A561::func_7F63;
	level.var_3513["exo_slide"] = ::lib_A561::func_9A67;
	level.var_31D.exo["exo_slam"] = 0;
	lib_A561::func_4CF4();
	level.var_350E["exo_slam"] = ::lib_A561::func_7F62;
	level.var_3513["exo_slam"] = ::lib_A561::func_9A66;
	level.var_31D.exo["sonic_blast"] = 0;
	level.var_350E["sonic_blast"] = ::lib_A561::func_800D;
	level.var_3513["sonic_blast"] = ::lib_A561::func_9A86;
	level.var_31D.exo["high_jump"] = 0;
	level.var_350E["high_jump"] = ::lib_A561::func_7F84;
	level.var_3513["high_jump"] = ::lib_A561::func_9A6E;
	level.var_31D.exo["exo_stim"] = 0;
	level.var_350E["exo_stim"] = ::lib_A561::func_8018;
	level.var_3513["exo_stim"] = ::lib_A561::func_9A89;
	level.var_31D.exo["shield"] = 0;
	lib_A529::init();
	level.var_350E["shield"] = ::lib_A561::func_8002;
	level.var_3513["shield"] = ::lib_A561::func_9A83;
	level.var_31D.var_34FC = ["overdrive","sonic_blast"];
	level.var_31D.var_3510 = [];
	lib_A561::func_1320();
	level.var_31D.var_344E = 0;
	level.var_31D.var_34FB = [];
	if(isdefined(param_00))
	{
		if(param_00 == "assault")
		{
			level.var_31D.exo["high_jump"] = 1;
			level.var_31D.exo["exo_slam"] = 1;
			level.var_31D.exo["sonic_blast"] = 1;
		}
		else if(param_00 == "specialist")
		{
			level.var_31D.exo["overdrive"] = 1;
			level.var_31D.exo["shield"] = 1;
		}
	}

	if(isdefined(param_01) && param_01)
	{
		level.var_31D.exo["exo_stim"] = 1;
	}
}

//Function Number: 3
lib_A561::func_6AF6(param_00)
{
	if(!isdefined(level.var_31D.var_34FB[param_00]) && isdefined(level.var_350E[param_00]))
	{
		if(common_scripts\utility::array_contains(level.var_31D.var_34FC,param_00))
		{
			lib_A561::func_1321(param_00,1);
		}

		level.var_31D thread [[ level.var_350E[param_00] ]]();
		level.var_31D.var_34FB[param_00] = 1;
	}
}

//Function Number: 4
lib_A561::func_6AFC(param_00)
{
	if(isdefined(level.var_31D.var_34FB[param_00]) && isdefined(level.var_350E[param_00]))
	{
		if(common_scripts\utility::array_contains(level.var_31D.var_34FC,param_00))
		{
			lib_A561::func_1321(param_00,0);
		}

		level.var_31D thread [[ level.var_3513[param_00] ]]();
		level.var_31D.var_34FB[param_00] = undefined;
	}
}

//Function Number: 5
lib_A561::func_6B03(param_00)
{
	return level.var_31D.exo[param_00] == 1;
}

//Function Number: 6
lib_A561::func_6B04(param_00)
{
	return isdefined(level.var_31D.var_34FB[param_00]);
}

//Function Number: 7
lib_A561::func_6B02()
{
	return level.var_31D.var_344E;
}

//Function Number: 8
lib_A561::func_6AF5()
{
	level.var_31D.var_344E = 1;
	var_00 = getarraykeys(level.var_31D.exo);
	foreach(var_02 in var_00)
	{
		if(level.var_31D.exo[var_02])
		{
			lib_A561::func_6AF6(var_02);
		}
	}
}

//Function Number: 9
lib_A561::func_6AFB()
{
	level.var_31D.var_344E = 0;
	var_00 = getarraykeys(level.var_31D.exo);
	foreach(var_02 in var_00)
	{
		lib_A561::func_6AFC(var_02);
	}
}

//Function Number: 10
lib_A561::func_6AF8(param_00)
{
	level.var_31D.exo[param_00] = 1;
	if(level.var_31D.var_344E)
	{
		lib_A561::func_6AF6(param_00);
	}
}

//Function Number: 11
lib_A561::func_6B0B(param_00)
{
	if(lib_A561::func_6B03(param_00))
	{
		level.var_31D.exo[param_00] = 0;
		lib_A561::func_6AFC(param_00);
	}
}

//Function Number: 12
lib_A561::func_6AFF(param_00)
{
	var_01 = getarraykeys(level.var_31D.exo);
	var_02 = [];
	foreach(var_04 in var_01)
	{
		if(level.var_31D.exo[var_04] && !isdefined(param_00) || common_scripts\utility::array_contains(param_00,var_04))
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 13
lib_A561::func_6B00(param_00)
{
	var_01 = getarraykeys(level.var_31D.exo);
	var_02 = [];
	foreach(var_04 in var_01)
	{
		if(!level.var_31D.exo[var_04] && !isdefined(param_00) || common_scripts\utility::array_contains(param_00,var_04))
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 14
lib_A561::func_6B0C(param_00)
{
	var_01 = getarraykeys(level.var_31D.exo);
	foreach(var_03 in var_01)
	{
		if(common_scripts\utility::array_contains(param_00,var_03))
		{
			lib_A561::func_6AF8(var_03);
			continue;
		}

		lib_A561::func_6B0B(var_03);
	}
}

//Function Number: 15
lib_A561::func_6AF7(param_00)
{
	foreach(var_02 in param_00)
	{
		lib_A561::func_6AF8(var_02);
	}
}

//Function Number: 16
lib_A561::func_6B0A(param_00)
{
	foreach(var_02 in param_00)
	{
		lib_A561::func_6B0B(var_02);
	}
}

//Function Number: 17
lib_A561::func_8008()
{
	lib_A59A::func_761("axis",::lib_A561::func_5DAA);
	common_scripts\utility::array_thread(function_00D6("axis"),::lib_A561::func_5DAA);
	lib_A59A::func_761("allies",::lib_A561::func_5DAA);
	common_scripts\utility::array_thread(function_00D6("allies"),::lib_A561::func_5DAA);
	foreach(var_01 in level.var_328)
	{
		var_01 thread lib_A561::func_5DAA();
	}
}

//Function Number: 18
lib_A561::func_9A84()
{
	level notify("stop_monitoring_grenades");
	lib_A59A::func_7358("axis",::lib_A561::func_5DAA);
	lib_A59A::func_7358("allies",::lib_A561::func_5DAA);
}

//Function Number: 19
lib_A561::func_5DAA()
{
	self endon("death");
	level endon("stop_monitoring_grenades");
	for(;;)
	{
		var_00 = undefined;
		var_01 = 0;
		if(isplayer(self))
		{
			self waittill("grenade_pullback",var_02);
			if(var_02 == "fraggrenade")
			{
				var_01 = gettime();
			}
			else
			{
				var_01 = undefined;
			}

			self waittill("grenade_fire",var_00,var_02);
			if(!isdefined(var_01))
			{
				var_01 = gettime();
			}

			var_00.var_8964 = var_01;
			var_00 thread lib_A561::func_43F2(1,var_02);
			continue;
		}

		self waittill("grenade_fire",var_00,var_02);
		var_00.var_8964 = gettime();
		var_00 thread lib_A561::func_43F2(0,var_02);
	}
}

//Function Number: 20
lib_A561::func_43F2(param_00,param_01)
{
	thread lib_A561::func_43E5(param_00,param_01);
}

//Function Number: 21
lib_A561::func_43E5(param_00,param_01)
{
	self endon("death");
	level endon("stop_monitoring_grenades");
	thread lib_A561::func_43E8();
}

//Function Number: 22
lib_A561::func_43E8()
{
	level endon("stop_monitoring_grenades");
	wait(0.5);
	if(!isdefined(self))
	{
		return;
	}

	var_00 = common_scripts\utility::spawn_tag_origin();
	var_00.var_2E6 = self.var_2E6;
	var_00.var_41 = (-90,0,0);
	playfxontag(common_scripts\utility::getfx("grenade_indicator_danger"),var_00,"tag_origin");
	while(isdefined(self))
	{
		var_01 = bullettrace(self.var_2E6,self.var_2E6 - (0,0,1000),0,self,0,0);
		var_00.var_2E6 = var_01["position"] + (0,0,2);
		wait(0.05);
	}

	killfxontag(common_scripts\utility::getfx("grenade_indicator_danger"),var_00,"tag_origin");
	wait(0.05);
	var_00 delete();
}

//Function Number: 23
lib_A561::func_7F46()
{
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinewidth",1);
	function_00D3("r_hudoutlinepostmode",2);
	function_00D3("r_hudoutlinehalolumscale",1.5);
	function_00D3("r_hudoutlinehaloblurradius",0.35);
}

//Function Number: 24
lib_A561::func_7F7E()
{
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinecurvywidth",1);
	function_00D3("r_hudoutlinecurvywhen",1);
	function_00D3("r_hudoutlinepostmode",3);
	function_00D3("r_hudoutlinecurvylumscale",2);
	function_00D3("r_hudoutlinecurvydarkenscale",0.25);
	function_00D3("r_hudoutlinecurvyblurradius",0.5);
	function_00D3("r_hudoutlinecurvydepth",0.8);
}

//Function Number: 25
lib_A561::func_7F72()
{
	var_00 = 3;
	common_scripts\utility::array_thread(function_00D6("allies"),::lib_A561::func_08D8,var_00);
	lib_A59A::func_761("allies",::lib_A561::func_08D8,var_00);
	lib_A561::func_7F46();
	thread lib_A561::func_5D5E();
}

//Function Number: 26
lib_A561::func_9A6C()
{
	level notify("stop_ai_detection");
	lib_A59A::func_7358("allies",::lib_A561::func_08D8);
}

//Function Number: 27
lib_A561::func_7F5D()
{
	var_00 = 1;
	common_scripts\utility::array_thread(function_00D6("axis"),::lib_A561::func_08D8,var_00);
	lib_A59A::func_761("axis",::lib_A561::func_08D8,var_00);
	lib_A561::func_7F46();
	thread lib_A561::func_5D5E();
}

//Function Number: 28
lib_A561::func_9A64()
{
	level notify("stop_ai_detection");
	lib_A59A::func_7358("axis",::lib_A561::func_08D8);
}

//Function Number: 29
lib_A561::func_08D8(param_00)
{
	level endon("stop_ai_detection");
	self endon("death");
	self.var_4890 = 0;
	var_01 = 0;
	thread lib_A561::func_1E93();
	for(;;)
	{
		if((!isdefined(self.var_1F9A) || self.var_1F9A == "off") && !isdefined(self.var_8F77) || self.var_8F77 != "mech")
		{
			if(!isdefined(level.var_31D.var_8876) || !level.var_31D.var_8876)
			{
				if(self.var_4890 != var_01)
				{
					if(self.var_4890)
					{
						self hudoutlineenable(param_00,1);
					}
					else
					{
						self hudoutlinedisable();
					}

					var_01 = self.var_4890;
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 30
lib_A561::func_1E93()
{
	common_scripts\utility::waittill_any_ents(self,"death",level,"stop_ai_detection");
	if(isdefined(self))
	{
		if((!isdefined(self.var_1F9A) || self.var_1F9A == "off") && !isdefined(self.var_8F77) || self.var_8F77 != "mech")
		{
			self.var_4890 = 0;
			self hudoutlinedisable();
		}
	}
}

//Function Number: 31
lib_A561::func_5D5E()
{
	level endon("stop_ai_detection");
	var_00 = 1024;
	for(;;)
	{
		if(self playerads() > 0.1)
		{
			var_01 = bullettrace(self geteye(),self geteye() + anglestoforward(self method_8036()) * var_00,1,self);
			var_02 = var_01["entity"];
			if(isdefined(var_02) && isai(var_02))
			{
				var_02.var_4890 = 1;
				var_02 thread lib_A561::func_08D9();
			}
		}

		wait(0.05);
	}
}

//Function Number: 32
lib_A561::func_08D9()
{
	self notify("new_highlight");
	self endon("new_highlight");
	self endon("death");
	wait(0.1);
	self.var_4890 = 0;
}

//Function Number: 33
lib_A561::func_7FB2()
{
	level.var_31D.var_3510["move_speed_increase"] = 1.25;
	lib_A561::func_34A7();
}

//Function Number: 34
lib_A561::func_9A78()
{
	level.var_31D.var_3510["move_speed_increase"] = undefined;
	lib_A561::func_34A7();
}

//Function Number: 35
lib_A561::func_7F92()
{
	self.var_34AC["jump_height"] = getdvarint("jump_height");
	function_00D3("jump_height","60");
}

//Function Number: 36
lib_A561::func_9A73()
{
	function_00D3("jump_height",self.var_34AC["jump_height"]);
}

//Function Number: 37
lib_A561::func_7F2B()
{
	level.var_31D method_848D(1);
}

//Function Number: 38
lib_A561::func_9A5D()
{
	level.var_31D method_848D(0);
}

//Function Number: 39
lib_A561::func_156C()
{
	self endon("death");
	self endon("disable_boost_dash");
	if(!isdefined(self.var_1567["stick_input"]))
	{
		self.var_1567["stick_input"] = (0,0,0);
	}

	if(!isdefined(self.var_1567["stick_global"]))
	{
		self.var_1567["stick_global"] = (0,0,0);
	}

	for(;;)
	{
		var_00 = self getnormalizedmovement();
		var_00 = (var_00[0],var_00[1] * -1,0);
		var_01 = self.var_41;
		var_02 = vectortoangles(var_00);
		var_03 = common_scripts\utility::flat_angle(combineangles(var_01,var_02));
		var_04 = anglestoforward(var_03) * length(var_00);
		self.var_1567["stick_input"] = var_02;
		self.var_1567["stick_global"] = var_04;
		wait(0.05);
	}
}

//Function Number: 40
lib_A561::func_156D()
{
	self endon("death");
	self endon("disable_boost_dash");
	if(!isdefined(self.var_1567["player_vel"]))
	{
		self.var_1567["player_vel"] = (0,0,0);
	}

	for(;;)
	{
		self.var_1567["player_vel"] = self getvelocity();
		wait(0.05);
	}
}

//Function Number: 41
lib_A561::func_156B()
{
	self endon("death");
	self endon("disable_boost_dash");
	var_00 = 400;
	var_01 = (0,0,250);
	var_02 = 10;
	var_03 = 500;
	var_04 = 1;
	for(;;)
	{
		lib_A561::func_A073();
		var_05 = 0;
		if(self isonground() && !self adsbuttonpressed() && level.var_31D getstance() != "prone")
		{
			if(self.var_1567["stick_input"][0] > 0)
			{
			}
			else if(self.var_1567["stick_input"][1] > 315 || self.var_1567["stick_input"][1] < 45)
			{
			}
			else
			{
				thread lib_A561::func_156A(var_00,var_01,var_02,var_04,var_03);
				var_05 = 1;
			}
		}

		lib_A561::func_A074(var_05);
	}
}

//Function Number: 42
lib_A561::func_30A4()
{
	self endon("mode_switch");
	self endon("death");
	var_00 = 300;
	var_01 = 1000;
	var_02 = (0,0,350);
	var_03 = 0.5;
	var_04 = 1;
	var_05 = 1;
	for(;;)
	{
		if(self method_83BB() && self meleebuttonpressed())
		{
			if(self.var_1567["stick_input"][1] > 315 || self.var_1567["stick_input"][1] < 45)
			{
				lib_A561::func_1568(var_00,var_02,var_03,var_04,var_01);
				wait(1);
			}
		}

		wait(0.05);
	}
}

//Function Number: 43
lib_A561::func_156A(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("mode_switch");
	self endon("death");
	level.var_31D lib_A5DE::snd_message("boost_dodge_activate_plr");
	self.var_1567["inboost"] = 1;
	var_06 = self.var_1567["stick_global"];
	var_07 = self.var_1567["player_vel"] * param_02;
	if(var_07[2] > 0)
	{
		var_07 = (var_07[0],var_07[1],0);
	}

	var_08 = var_07 + var_06 * param_00 + param_01;
	if(isdefined(param_03) && param_03)
	{
		if(!isdefined(param_04))
		{
			var_09 = param_01[2];
		}

		var_0A = var_08;
		var_08 = vectornormalize(var_08) * param_04;
		var_08 = (var_08[0],var_08[1],var_0A[2]);
		if(var_06[2] == 0)
		{
			var_0B = 0.7;
			var_08 = (var_08[0],var_08[1],var_08[2] * var_0B);
		}
	}

	var_0C = 2;
	if(isdefined(param_05) && param_05)
	{
		var_0D = 0;
		var_0E = self.var_1567["player_vel"];
		var_0F = var_08;
		var_10 = var_0F - var_0E;
		var_11 = var_10 / var_0C;
		while(var_0D <= var_0C)
		{
			self setvelocity(var_0E + var_11);
			wait(0.05);
			var_0D++;
		}
	}

	self setvelocity(var_08);
}

//Function Number: 44
lib_A561::func_1568(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("mode_switch");
	self endon("death");
	thread lib_A561::func_1569();
	self.var_1567["inboost"] = 1;
	var_06 = self.var_1567["stick_global"];
	var_07 = self.var_1567["player_vel"] * param_02;
	if(var_07[2] > 0)
	{
		var_07 = (var_07[0],var_07[1],0);
	}

	var_08 = var_07 + var_06 * param_00 + param_01;
	if(isdefined(param_03) && param_03)
	{
		if(!isdefined(param_04))
		{
			var_09 = param_01[2];
		}

		var_0A = var_08;
		var_08 = vectornormalize(var_08) * param_04;
		var_08 = (var_08[0],var_08[1],var_0A[2]);
		if(var_06[2] == 0)
		{
			var_0B = 0.7;
			var_08 = (var_08[0],var_08[1],var_08[2] * var_0B);
		}
	}

	var_0C = 2;
	if(isdefined(param_05) && param_05)
	{
		var_0D = 0;
		var_0E = self.var_1567["player_vel"];
		var_0F = var_08;
		var_10 = var_0F - var_0E;
		var_11 = var_10 / var_0C;
		while(var_0D <= var_0C)
		{
			self setvelocity(var_0E + var_11);
			wait(0.05);
			var_0D++;
		}
	}

	self setvelocity(var_08);
}

//Function Number: 45
lib_A561::func_1569()
{
	while(self isonground())
	{
		wait(0.05);
	}

	while(!self isonground())
	{
		var_00 = function_00D6("axis");
		foreach(var_02 in var_00)
		{
			if(isalive(var_02))
			{
				if(distance2d(self.var_2E6,var_02.var_2E6) < 40)
				{
					var_02 dodamage(var_02.health + 1,self.var_2E6,self,self,"MOD_MELEE");
				}
			}
		}

		wait(0.05);
	}
}

//Function Number: 46
lib_A561::func_A073()
{
	self endon("death");
	while(!self method_83BB())
	{
		wait(0.05);
	}

	return 1;
}

//Function Number: 47
lib_A561::func_A074(param_00)
{
	var_01 = gettime();
	self endon("death");
	while(self method_83BB())
	{
		wait(0.05);
	}

	if(isdefined(param_00))
	{
		if(gettime() - var_01 < param_00 * 1000)
		{
			wait(param_00 - gettime() - var_01 / 1000);
		}
	}

	return 1;
}

//Function Number: 48
lib_A561::func_3F4F()
{
	return 1.2;
}

//Function Number: 49
lib_A561::func_7FD0()
{
	lib_A561::func_9AC7();
	childthread lib_A561::func_65E9();
	setomnvar("ui_overdrive_effects",1);
}

//Function Number: 50
lib_A561::func_9A7A()
{
	lib_A561::func_65D8();
	level.var_31D setweaponhudiconoverride("actionslot1","dpad_icon_overdrive_off");
	setomnvar("ui_overdrive_effects",0);
}

//Function Number: 51
lib_A561::func_65EA(param_00)
{
	setomnvar("ui_overdrive_value",int(param_00 * 100));
}

//Function Number: 52
lib_A561::func_65E1()
{
	if(!isdefined(level.var_31D.var_3507))
	{
		level.var_31D.var_3507 = [];
	}

	if(!isdefined(level.var_31D.var_3507["overdrive"]))
	{
		level.var_31D.var_3507["overdrive"] = spawnstruct();
	}

	var_00 = level.var_31D.var_3507["overdrive"];
	var_00.duration = 5;
	var_00.var_52E6 = 0.5;
	var_00.var_52EA = 1;
	var_00.var_35FB = 0.5;
	var_00.var_21B2 = 1;
	var_00.var_8A4F = 1.2;
	var_00.var_6EB = 1;
	var_00.var_131C = 1;
	var_00.var_21B3 = spawnstruct();
	var_00.var_21B3.var_2528 = 1;
	var_00.var_21B3.var_93FC = 1;
	var_00.var_21B3.state = "none";
}

//Function Number: 53
lib_A561::func_65E9()
{
	var_00 = self.var_3507["overdrive"];
	self endon("death");
	self endon("overdrive_disabled");
	var_00 = level.var_31D.var_3507["overdrive"];
	if(!lib_A59A::func_32DB("overdrive_enabled"))
	{
		lib_A59A::func_32DC("overdrive_enabled");
	}

	if(!lib_A59A::func_32DB("overdrive_hot"))
	{
		lib_A59A::func_32DC("overdrive_hot");
	}

	if(!lib_A59A::func_32DB("overdrive_on"))
	{
		lib_A59A::func_32DC("overdrive_on");
	}

	lib_A561::func_65DB();
	lib_A561::func_65EA(1);
	for(;;)
	{
		self waittill("overdrive_button_pressed");
		if(lib_A59A::func_32D7("overdrive_enabled"))
		{
			if(lib_A59A::func_32D7("overdrive_hot"))
			{
			}
			else if(lib_A59A::func_32D7("overdrive_on"))
			{
				childthread lib_A561::func_65DE(0.1);
				wait(var_00.var_52EA);
			}
			else if(lib_A561::func_1323(var_00.var_131C))
			{
				childthread lib_A561::func_65E8();
				wait(var_00.var_52E6);
			}
			else
			{
				wait(var_00.var_35FB);
			}

			continue;
		}
	}
}

//Function Number: 54
lib_A561::func_65DB()
{
	var_00 = self.var_3507["overdrive"];
	if(!lib_A59A::func_32D7("overdrive_enabled"))
	{
		lib_A59A::func_32DD("overdrive_enabled");
		self notifyonplayercommand("overdrive_button_pressed","+actionslot " + var_00.var_6EB);
	}
}

//Function Number: 55
lib_A561::func_65D8()
{
	var_00 = self.var_3507["overdrive"];
	if(lib_A59A::func_32DB("overdrive_enabled") && lib_A59A::func_32D7("overdrive_enabled"))
	{
		self notify("overdrive_disabled");
		if(lib_A561::func_65E3())
		{
			thread lib_A561::func_65DA();
		}

		lib_A59A::func_32D9("overdrive_on");
		lib_A59A::func_32D9("overdrive_hot");
		lib_A59A::func_32D9("overdrive_enabled");
		if(!isdefined(self.var_3503))
		{
			self.var_3503 = [];
		}
		else
		{
			self.var_3503 = common_scripts\utility::array_removeundefined(self.var_3503);
		}

		lib_A59A::func_2762(self.var_3503,::lib_A53C::destroyelem);
		self method_849C("overdrive_button_pressed","+actionslot " + var_00.var_6EB);
	}
}

//Function Number: 56
lib_A561::func_65E2()
{
	return lib_A59A::func_32D7("overdrive_enabled");
}

//Function Number: 57
lib_A561::func_65E3()
{
	return lib_A59A::func_32D7("overdrive_on");
}

//Function Number: 58
lib_A561::func_65DD()
{
	self notify("overdrive_button_pressed");
}

//Function Number: 59
lib_A561::func_65E8()
{
	self endon("death");
	if(lib_A59A::func_32D7("overdrive_on"))
	{
		return;
	}

	lib_A59A::func_32DD("overdrive_on");
	childthread lib_A561::func_65D9();
	lib_A561::func_65DF();
	childthread lib_A561::func_65DA();
	lib_A59A::func_32D9("overdrive_on");
	lib_A561::func_65D6();
}

//Function Number: 60
lib_A561::func_65E4(param_00,param_01)
{
	level.var_31D method_8032(param_01,param_00);
	level.var_31D notifyonplayercommand("ads_start","+speed_throw");
	level.var_31D notifyonplayercommand("ads_stop","-speed_throw");
	var_02 = 0.2;
	for(;;)
	{
		if(!level.var_31D playerads() > 0.2)
		{
			level.var_31D waittill("ads_start");
		}

		level.var_31D method_8032(1,var_02);
		level.var_31D waittill("ads_stop");
		level.var_31D method_8032(param_01,var_02);
	}
}

//Function Number: 61
lib_A561::func_65D9()
{
	self endon("overdrive_effects_stop");
	var_00 = self.var_3507["overdrive"];
	level.var_31D.var_3510["overdrive"] = var_00.var_8A4F;
	lib_A561::func_34A7();
	lib_A561::func_6BD9(4);
	level.var_9E54 = getdvar("vision_set_current");
	level.var_8A47 = getdvarfloat("r_specularcolorscale");
	function_02D0("wb_player_boost",var_00.var_52E6);
	lib_A5DE::snd_message("overdrive_on");
	lib_A59A::func_5699("r_specularcolorscale",4.5,var_00.var_52E6);
	childthread lib_A561::func_65E4(var_00.var_52E6,1.15);
	setomnvar("ui_overdrive_effects_time",var_00.var_52E6);
	setomnvar("ui_overdrive_effects_toggle",1);
	function_0008(0.5);
	childthread lib_A561::func_6B4C();
	self playerrecoilscaleon(60);
	function_00D3("player_sprintUnlimited",1);
	self setviewkickscale(0.5);
}

//Function Number: 62
lib_A561::func_65DA()
{
	var_00 = self.var_3507["overdrive"];
	self notify("overdrive_effects_stop");
	level.var_31D.var_3510["overdrive"] = undefined;
	lib_A561::func_34A7();
	lib_A561::func_6BD8();
	function_02D0("",1);
	lib_A5DE::snd_message("overdrive_off");
	level.var_31D method_8032(1,var_00.var_52EA);
	setomnvar("ui_overdrive_effects_time",var_00.var_52EA);
	setomnvar("ui_overdrive_effects_toggle",0);
	function_0008(1);
	self playerrecoilscaleoff();
	function_00D3("player_sprintUnlimited",0);
	self setviewkickscale(1);
	lib_A59A::func_5699("r_specularcolorscale",level.var_8A47,2.5);
}

//Function Number: 63
lib_A561::func_65DC(param_00)
{
	var_01 = self.var_3507["overdrive"];
	var_02 = var_01.var_21B3;
	if(var_02.state == "cooling" && var_02.var_93FC - var_02.var_2528 > param_00)
	{
		var_02.var_2528 = var_02.var_93FC - param_00;
	}
}

//Function Number: 64
lib_A561::func_65DE(param_00)
{
	var_01 = self.var_3507["overdrive"];
	var_02 = var_01.var_21B3;
	if(var_02.state == "heating" && var_02.var_93FC - var_02.var_2528 > param_00)
	{
		var_02.var_2528 = var_02.var_93FC - param_00;
	}
}

//Function Number: 65
lib_A561::func_65D6()
{
	var_00 = self.var_3507["overdrive"];
	lib_A561::func_65D7(var_00.var_21B2);
	lib_A59A::func_32D9("overdrive_hot");
}

//Function Number: 66
lib_A561::func_65DF()
{
	var_00 = self.var_3507["overdrive"];
	var_01 = var_00.duration + var_00.var_52E6 + var_00.var_52EA;
	lib_A561::func_65E0(var_01);
	lib_A59A::func_32DD("overdrive_hot");
}

//Function Number: 67
lib_A561::func_65E0(param_00)
{
	var_01 = self.var_3507["overdrive"];
	var_02 = var_01.var_21B3;
	var_02.state = "heating";
	var_02.var_2528 = 0;
	var_02.var_93FC = param_00;
	var_03 = 0.05;
	while(var_02.var_2528 < var_02.var_93FC)
	{
		var_04 = 1 - var_02.var_2528 / var_02.var_93FC;
		lib_A561::func_65EA(var_04);
		var_02.var_2528 = var_02.var_2528 + var_03;
		wait(var_03);
	}

	lib_A561::func_65EA(0);
}

//Function Number: 68
lib_A561::func_65D7(param_00)
{
	var_01 = self.var_3507["overdrive"];
	var_02 = var_01.var_21B3;
	var_02.state = "cooling";
	var_02.var_2528 = 0;
	var_02.var_93FC = param_00;
	var_03 = 0.05;
	while(var_02.var_2528 < var_02.var_93FC)
	{
		var_04 = var_02.var_2528 / var_02.var_93FC;
		lib_A561::func_65EA(var_04);
		var_02.var_2528 = var_02.var_2528 + var_03;
		wait(var_03);
	}

	lib_A561::func_65EA(1);
}

//Function Number: 69
lib_A561::func_6B4C()
{
	var_00 = 0.8;
	var_01 = 0.1;
	var_02 = 8;
	self endon("death");
	wait(0.25);
	var_03 = gettime();
	while(lib_A59A::func_32D7("overdrive_on"))
	{
		wait(0.05);
		self playrumbleonentity("damage_light");
		wait(lib_A571::func_576A(gettime() - var_03 * 0.001,0,var_02,var_00,var_01));
		wait(0 + randomfloat(0.1));
	}
}

//Function Number: 70
lib_A561::func_6BD9(param_00)
{
	self.var_63A4 = self.var_443E.playerhealth_regularregendelay;
	self.var_63A3 = self.var_443E.var_584C;
	self.var_443E.playerhealth_regularregendelay = self.var_443E.playerhealth_regularregendelay / param_00;
	self.var_443E.var_584C = self.var_443E.var_584C / param_00;
}

//Function Number: 71
lib_A561::func_6BD8()
{
	self.var_443E.playerhealth_regularregendelay = self.var_63A4;
	self.var_443E.var_584C = self.var_63A3;
	self.var_63A4 = undefined;
	self.var_63A3 = undefined;
}

//Function Number: 72
lib_A561::func_8018()
{
	self endon("stim_disabled");
	self endon("death");
	if(isdefined(self.var_34EE))
	{
		return;
	}

	self notifyonplayercommand("stim_button_pressed","+actionslot 4");
	self setweaponhudiconoverride("actionslot4","dpad_icon_stim");
	self waittill("stim_button_pressed");
	self.var_34EE = 1;
	self.health = self.var_275;
	thread lib_A561::func_34EB();
	self setweaponhudiconoverride("actionslot4","dpad_icon_stim_off");
}

//Function Number: 73
lib_A561::func_9A89()
{
	self notify("stim_disabled");
	self method_849C("stim_button_pressed","+actionslot 4");
	self setweaponhudiconoverride("actionslot4","dpad_icon_stim_off");
}

//Function Number: 74
lib_A561::func_34EB()
{
	var_00 = common_scripts\utility::spawn_tag_origin();
	var_00.var_2E6 = self geteye();
	var_00 linkto(level.var_31D);
	playfxontag(common_scripts\utility::getfx("exo_stim"),var_00,"tag_origin");
	lib_A5DE::snd_message("exo_stim_on");
	self.var_34EC = 1;
	wait(0.1);
	self.var_34EC = undefined;
}

//Function Number: 75
lib_A561::func_7F8F()
{
	thread lib_A561::func_6B66();
}

//Function Number: 76
lib_A561::func_9A6F()
{
	lib_A561::func_6B65();
}

//Function Number: 77
lib_A561::func_6B66()
{
	self endon("death");
	self endon("player_intel_mode_disabled");
	var_00 = 2;
	for(;;)
	{
		var_01 = level.var_31D getweaponslistoffhands();
		var_02 = 0;
		foreach(var_04 in var_01)
		{
			if(issubstr(var_04,"_grenade_var"))
			{
				var_02 = 1;
				break;
			}
		}

		var_06 = 0;
		if(var_02)
		{
			var_06 = var_06 + level.var_31D getweaponammostock("flash_grenade_var");
			var_06 = var_06 + level.var_31D getweaponammostock("emp_grenade_var");
			var_06 = var_06 + level.var_31D getweaponammostock("paint_grenade_var");
			var_06 = var_06 / 3;
		}

		if(var_06 != 4)
		{
			thread lib_A561::func_6B63(getentarray("weapon_flash_grenade_var","classname"),var_00,"player_exo_intel_mode_flash_stop");
		}
		else
		{
			level notify("player_exo_intel_mode_flash_stop");
		}

		var_07 = 0;
		if(var_02)
		{
			var_07 = var_07 + level.var_31D getweaponammostock("frag_grenade_var");
			var_07 = var_07 + level.var_31D getweaponammostock("contact_grenade_var");
			var_07 = var_07 + level.var_31D getweaponammostock("tracking_grenade_var");
			var_07 = var_07 / 3;
		}

		if(var_07 != 4)
		{
			thread lib_A561::func_6B63(getentarray("weapon_frag_grenade_var","classname"),var_00,"player_exo_intel_mode_frag_stop");
		}
		else
		{
			level notify("player_exo_intel_mode_frag_stop");
		}

		wait(1);
	}
}

//Function Number: 78
lib_A561::func_6B65()
{
	self notify("player_intel_mode_disabled");
}

//Function Number: 79
lib_A561::func_6B64()
{
	self endon("death");
	self endon("player_intel_mode_disabled");
	self endon("player_intel_mode_deactivated");
	var_00 = 2;
	var_01 = 1;
	var_02 = getentarray("script_model","classname");
	var_03 = [];
	foreach(var_05 in var_02)
	{
		if(isdefined(var_05.destructible_type) && var_05.destructible_type == "explodable_barrel")
		{
			var_03[var_03.size] = var_05;
		}
	}

	var_03 = common_scripts\utility::array_removeundefined(var_03);
	thread lib_A561::func_6B63(var_03,var_01,"player_exo_intel_mode_barrel_stop");
	for(;;)
	{
		var_07 = getweaponarray();
		thread lib_A561::func_6B63(var_07,var_00,"player_exo_intel_mode_barrel_stop");
		wait(0.05);
	}
}

//Function Number: 80
lib_A561::func_6B63(param_00,param_01,param_02)
{
	var_03 = 1024;
	var_04 = var_03 * var_03;
	foreach(var_06 in param_00)
	{
		if(!isdefined(var_06.var_4890))
		{
			if(distancesquared(var_06.var_2E6,self.var_2E6) < var_04)
			{
				var_06 thread lib_A561::func_6B62(param_01,param_02);
			}
		}
	}
}

//Function Number: 81
lib_A561::func_6B62(param_00,param_01)
{
	if(!common_scripts\utility::isdestructible())
	{
		self endon("death");
	}

	self.var_4890 = 1;
	self hudoutlineenable(param_00,1);
	common_scripts\utility::waittill_any_ents(level,param_01,self,"stop_highlight",self,"exploded");
	if(isdefined(self))
	{
		self.var_4890 = undefined;
		self hudoutlinedisable();
	}
}

//Function Number: 82
lib_A561::func_7F61()
{
	level.var_31D lib_A59A::func_6C5C(1);
}

//Function Number: 83
lib_A561::func_9A65()
{
	level.var_31D lib_A59A::func_6C5C(0);
}

//Function Number: 84
lib_A561::func_7F63()
{
	level.var_31D method_8485(1);
}

//Function Number: 85
lib_A561::func_9A67()
{
	level.var_31D method_8485(0);
}

//Function Number: 86
lib_A561::func_7F62()
{
	level.var_31D method_8486(1);
	level.var_31D thread lib_A561::monitorgroundslam();
	level.var_31D thread lib_A561::monitorgroundslamhitplayer();
}

//Function Number: 87
lib_A561::func_9A66()
{
	level.var_31D method_8486(0);
	level.var_31D notify("disallow_ground_slam");
}

//Function Number: 88
lib_A561::getgroundslamminheight()
{
	return 120;
}

//Function Number: 89
lib_A561::getgroundslammaxheight()
{
	return 380;
}

//Function Number: 90
lib_A561::getgroundslammindamage()
{
	return 200;
}

//Function Number: 91
lib_A561::getgroundslammaxdamage()
{
	return 300;
}

//Function Number: 92
lib_A561::getgroundslamminradius()
{
	return 75;
}

//Function Number: 93
lib_A561::getgroundslammaxradius()
{
	return 150;
}

//Function Number: 94
lib_A561::func_3FB3()
{
	return 0.1;
}

//Function Number: 95
lib_A561::func_3FB4()
{
	return 1;
}

//Function Number: 96
lib_A561::func_3FB2()
{
	return 250;
}

//Function Number: 97
lib_A561::func_3FBB()
{
	return 0;
}

//Function Number: 98
lib_A561::func_4CF4()
{
	level._effect["exo_slam_kneeslide_fx"] = loadfx("vfx/code/slam_jetpack_kneeslide");
	precacheitem("boost_slam_sp");
}

//Function Number: 99
lib_A561::monitorgroundslamhitplayer()
{
	self endon("death");
	self endon("disallow_ground_slam");
	for(;;)
	{
		self waittill("ground_slam_hit_player",var_00,var_01);
		if(var_00 lib_A561::func_405E(var_01))
		{
			continue;
		}

		var_02 = lib_A571::func_3D3C();
		var_03 = getdvarfloat("high_jump_drop_lateral_v_impart",lib_A561::func_3FB3());
		var_04 = getdvarfloat("high_jump_drop_vertical_v_impart",lib_A561::func_3FB4());
		var_05 = getdvarint("high_jump_drop_crush_damage",lib_A561::func_3FB2());
		var_06 = isalive(var_00);
		var_00.var_8603 = (var_02[0] * var_03,var_02[1] * var_03,var_02[2] * var_04);
		var_00 dodamage(var_05,self.var_2E6,self,self,"MOD_CRUSH","boost_slam_sp","none");
		if(var_06 && !isalive(var_00) && var_00 method_84FC())
		{
			var_00.var_265F = ::lib_A561::func_4415;
		}

		var_00 lib_A561::func_7FC8(var_01);
	}
}

//Function Number: 100
lib_A561::func_7FC8(param_00)
{
	if(!isdefined(self.var_1594))
	{
		self.var_1594 = [];
	}

	self.var_1594[self.var_1594.size] = param_00;
}

//Function Number: 101
lib_A561::func_405E(param_00)
{
	if(!isdefined(self.var_1594))
	{
		return 0;
	}

	foreach(var_02 in self.var_1594)
	{
		if(param_00 == var_02)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 102
lib_A561::func_4415()
{
	self.var_70DA = self.var_8603;
	self.var_70D9 = 1;
	self.var_70D6 = getdvarfloat("high_jump_drop_ragdoll_dir_scale",lib_A561::func_3FBB());
	self notify("end_ground_slam_death_function");
	return 0;
}

//Function Number: 103
lib_A561::monitorgroundslam()
{
	self endon("death");
	self endon("disallow_ground_slam");
	var_00 = 10;
	var_01 = 4;
	var_02 = (1,0,0);
	var_03 = (0,1,0);
	var_04 = (0,0,1);
	var_05 = 16;
	for(;;)
	{
		self waittill("ground_slam",var_06,var_07);
		var_08 = getdvarfloat("high_jump_drop_min_height",lib_A561::getgroundslamminheight());
		var_09 = getdvarfloat("high_jump_drop_max_height",lib_A561::getgroundslammaxheight());
		var_0A = getdvarfloat("high_jump_drop_min_damage",lib_A561::getgroundslammindamage());
		var_0B = getdvarfloat("high_jump_drop_max_damage",lib_A561::getgroundslammaxdamage());
		var_0C = getdvarfloat("high_jump_drop_min_radius",lib_A561::getgroundslamminradius());
		var_0D = getdvarfloat("high_jump_drop_max_radius",lib_A561::getgroundslammaxradius());
		if(var_06 < var_08)
		{
			continue;
		}

		var_0E = var_06 - var_08 / var_09 - var_08;
		var_0E = clamp(var_0E,0,1);
		var_0F = var_0D - var_0C * var_0E + var_0C;
		self entityradiusdamage(self.var_2E6,var_0F,var_0B,var_0A,self,"MOD_PROJECTILE_SPLASH","boost_slam_sp");
		lib_A576::func_72D6();
		physicsexplosionsphere(self.var_2E6,var_0F,20,0.9);
	}
}

//Function Number: 104
lib_A561::func_800D()
{
	thread lib_A575::func_3118();
}

//Function Number: 105
lib_A561::func_9A86()
{
	thread lib_A575::func_2B26();
}

//Function Number: 106
lib_A561::func_7F84()
{
	level.var_31D lib_A563::func_30C9();
}

//Function Number: 107
lib_A561::func_9A6E()
{
	level.var_31D lib_A563::func_2AAB();
}

//Function Number: 108
lib_A561::func_8002()
{
	level.var_31D lib_A529::func_30EE();
}

//Function Number: 109
lib_A561::func_9A83()
{
	level.var_31D lib_A529::func_2ACD();
}

//Function Number: 110
lib_A561::func_34E8()
{
	return lib_A59A::func_32D7("exo_shield_on");
}

//Function Number: 111
lib_A561::func_1320(param_00)
{
	var_01 = 3;
	if(isdefined(param_00))
	{
		var_01 = 3 + param_00;
	}

	level.var_31D.var_34FE = var_01;
	level.var_31D.var_34FD = level.var_31D.var_34FE;
	lib_A561::func_1324();
}

//Function Number: 112
lib_A561::func_1322(param_00)
{
	level.var_31D.var_34FD = int(clamp(param_00,0,level.var_31D.var_34FE));
	lib_A561::func_1324();
}

//Function Number: 113
lib_A561::func_131F()
{
	level.var_31D.var_34FD = level.var_31D.var_34FE;
	lib_A561::func_1324();
}

//Function Number: 114
lib_A561::func_1324()
{
	var_00 = int(level.var_31D.var_34FD / level.var_31D.var_34FE * 100);
	setomnvar("ui_exobattery_value",var_00);
	level.var_31D notify("exo_battery_update");
	lib_A561::func_9A98(var_00);
}

//Function Number: 115
lib_A561::func_1321(param_00,param_01)
{
	if(!isdefined(level.var_31D.var_344F))
	{
		level.var_31D.var_344F = [];
	}

	level.var_31D.var_344F[param_00] = param_01;
	foreach(var_03 in level.var_31D.var_344F)
	{
		if(isdefined(var_03) && var_03)
		{
			setomnvar("ui_exobattery",1);
			lib_A561::func_1324();
			return;
		}
	}

	setomnvar("ui_exobattery",0);
}

//Function Number: 116
lib_A561::func_1323(param_00)
{
	var_01 = level.var_31D.var_34FD;
	if(param_00 > var_01)
	{
		lib_A561::func_3502();
		return 0;
	}

	lib_A561::func_1322(var_01 - param_00);
	return 1;
}

//Function Number: 117
lib_A561::func_3D59()
{
	return int(level.var_31D.var_34FD / level.var_31D.var_34FE * 100);
}

//Function Number: 118
lib_A561::func_3502()
{
	var_00 = level.var_31D geteye();
	level.var_31D playsoundasmaster("exo_power_not_ready");
}

//Function Number: 119
lib_A561::func_A0C2()
{
	level.var_31D endon("begin_firing");
	level.var_31D endon("reload");
	level.var_31D endon("x_pressed");
	level.var_31D endon("offhand_end");
	level.var_31D endon("weaponchange");
	level.var_31D endon("dpad_up");
	level.var_31D endon("dpad_down");
	level.var_31D endon("dpad_left");
	level.var_31D endon("dpad_right");
	level.var_31D endon("exo_battery_update");
	level.var_31D waittill("weapon_switch_started");
}

//Function Number: 120
lib_A561::func_84F4()
{
	level.var_31D notify("show_weaponhud_stop");
	level.var_31D endon("show_weaponhud_stop");
	setomnvar("ui_exobattery",1);
	function_00D3("actionSlotsHide",0);
	wait(3);
	setomnvar("ui_exobattery",0);
	function_00D3("actionSlotsHide",1);
}

//Function Number: 121
lib_A561::func_4641()
{
	level.var_31D endon("death");
	level.var_31D notifyonplayercommand("dpad_down","+actionslot 2");
	level.var_31D notifyonplayercommand("dpad_left","+actionslot 3");
	level.var_31D notifyonplayercommand("dpad_right","+actionslot 4");
	level.var_31D notifyonplayercommand("dpad_up","+actionslot 1");
	level.var_31D notifyonplayercommand("x_pressed","+usereload");
	level.var_31D notifyonplayercommand("x_pressed","+reload");
	for(;;)
	{
		thread lib_A561::func_84F4();
		wait 0.05;
		lib_A561::func_A0C2();
	}
}

//Function Number: 122
lib_A561::func_34A7()
{
	var_00 = 1;
	foreach(var_02 in level.var_31D.var_3510)
	{
		if(isdefined(var_02))
		{
			var_00 = var_00 * var_02;
		}
	}

	lib_A59A::func_6C1D(int(100 * var_00));
}

//Function Number: 123
lib_A561::func_9A98(param_00)
{
	var_01 = [];
	var_01[var_01.size] = "overdrive";
	var_01[var_01.size] = "sonic_blast";
	var_01[var_01.size] = "shield";
	var_02 = var_01;
	var_04 = getfirstarraykey(var_02);
	if(isdefined(var_04))
	{
		var_03 = var_02[var_04];
		if(!isdefined(level.var_31D.exo[var_03]))
		{
			continue;
		}

		if(lib_A561::func_6B03(var_03))
		{
			switch(var_03)
			{
				case "overdrive":
					break;

				case "sonic_blast":
					break;

				case "shield":
					break;

				default:
					break;
			}
		}
	}
}

//Function Number: 124
lib_A561::func_9AC7(param_00)
{
	if(isdefined(param_00) && !param_00)
	{
		level.var_31D setweaponhudiconoverride("actionslot1","none");
		return;
	}

	if(!lib_A561::func_6B02())
	{
		level.var_31D setweaponhudiconoverride("actionslot1","none");
		return;
	}

	if(lib_A561::func_3D59() > 0)
	{
		level.var_31D setweaponhudiconoverride("actionslot1","dpad_icon_overdrive");
		return;
	}

	level.var_31D setweaponhudiconoverride("actionslot1","dpad_icon_overdrive_off");
}