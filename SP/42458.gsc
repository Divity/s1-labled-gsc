/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42458.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 174
 * Decompile Time: 42 ms
 * Timestamp: 4/20/2022 8:23:43 PM
*******************************************************************/

//Function Number: 1
lib_A5DA::func_1181(param_00,param_01)
{
}

//Function Number: 2
lib_A5DA::func_11A2()
{
	if(isdefined(level.var_55B.var_9EAA))
	{
		return;
	}

	if(!isdefined(level.var_55B.var_9EAA))
	{
		level.var_55B.var_9EAA = spawnstruct();
	}

	var_00 = lib_A5DA::func_11B1();
	var_00.var_4D67 = gettime();
	var_00.var_1A04 = [];
	var_00.var_6F1D = [];
	var_00.var_6F1F = [];
	var_00.var_76DA = 0;
	var_00.var_2767 = "alias";
	var_00.var_2770 = 0;
	var_00.var_2768 = 1;
	var_00.var_2769 = 1;
	var_00.var_2776 = 0;
	var_00.var_2775 = (0,0,0);
	var_00.var_2774 = 1;
	var_00.var_2773 = 1;
	var_00.var_276C = "distance";
	var_00.var_276E = "volume";
	var_00.var_276F = 1;
	var_00.var_2771 = 50;
	lib_A5DE::snd_register_message("snd_register_vehicle",::lib_A5DA::func_8748);
	lib_A5DE::snd_register_message("snd_start_vehicle",::lib_A5DA::func_876B);
	lib_A5DE::snd_register_message("snd_stop_vehicle",::lib_A5DA::func_8773);
	lib_A5DA::func_11A3("distance2d",::lib_A5DA::func_4E45);
	lib_A5DA::func_11A3("distance",::lib_A5DA::func_4E44);
	lib_A5DA::func_11A3("throttle",::lib_A5DA::func_4E54);
	lib_A5DA::func_11A3("speed",::lib_A5DA::func_4E52);
	lib_A5DA::func_11A3("relative_speed",::lib_A5DA::func_4E51);
	lib_A5DA::func_11A3("doppler",::lib_A5DA::func_4E46);
	lib_A5DA::func_11A3("doppler_exaggerated",::lib_A5DA::func_4E47);
	lib_A5DA::func_11A3("doppler_subtle",::lib_A5DA::func_4E48);
	lib_A5DA::func_11A3("speed_mph",::lib_A5DA::func_4E53);
	lib_A5DA::func_11A3("acceleration_g",::lib_A5DA::func_4E42);
	lib_A5DA::func_11A3("jerk_gps",::lib_A5DA::func_4E49);
	lib_A5DA::func_11A3("pitch",::lib_A5DA::func_4E4E);
	lib_A5DA::func_11A3("yaw",::lib_A5DA::func_4E55);
	lib_A5DA::func_11A3("pitch_roll_max",::lib_A5DA::func_4E4F);
	lib_A5DA::func_11A3("degrees_from_upright",::lib_A5DA::func_4E43);
	lib_A5DA::func_11A3("jetbike_thrust",::lib_A5DA::func_4E4C);
	lib_A5DA::func_11A3("jetbike_drag",::lib_A5DA::func_4E4B);
	lib_A5DA::func_11A3("jetbike_anti_slip",::lib_A5DA::func_4E4A);
	lib_A5DA::func_11A3("jetbike_total_repulsor",::lib_A5DA::func_4E4D);
	lib_A5DA::func_11A3("jetbike_height",::lib_A5DA::func_4E50);
	lib_A5DA::func_11A3("hovertank_anti_slip_magnitude",::lib_A5DA::func_4E68);
	lib_A5DA::func_11A3("hovertank_anti_slip_direction",::lib_A5DA::func_4E67);
	lib_A5DA::func_11A3("hovertank_auto_yaw_magnitude",::lib_A5DA::func_4E6B);
	lib_A5DA::func_11A3("hovertank_auto_yaw_direction",::lib_A5DA::func_4E6A);
	lib_A5DA::func_11A3("hovertank_repulsor_front_left",::lib_A5DA::func_4E6E);
	lib_A5DA::func_11A3("hovertank_repulsor_front_right",::lib_A5DA::func_4E6F);
	lib_A5DA::func_11A3("hovertank_repulsor_back_left",::lib_A5DA::func_4E6C);
	lib_A5DA::func_11A3("hovertank_repulsor_back_right",::lib_A5DA::func_4E6D);
	lib_A5DA::func_11A3("hovertank_throttle_magnitude",::lib_A5DA::func_4E73);
	lib_A5DA::func_11A3("hovertank_throttle_direction",::lib_A5DA::func_4E72);
	lib_A5DA::func_11A3("hovertank_uprighting",::lib_A5DA::func_4E76);
	lib_A5DA::func_11A3("hovertank_turret_yaw",::lib_A5DA::func_4E75);
	lib_A5DA::func_11A3("hovertank_turret_pitch",::lib_A5DA::func_4E74);
	lib_A5DA::func_11A3("diveboat_throttle",::lib_A5DA::func_4E63);
	lib_A5DA::func_11A3("diveboat_drag",::lib_A5DA::func_4E61);
	lib_A5DA::func_11A3("diveboat_drag_with_mph",::lib_A5DA::func_4E62);
	lib_A5DA::func_11A3("player_pdrone_look",::lib_A5DA::func_4E79);
}

//Function Number: 3
lib_A5DA::func_8748(param_00,param_01)
{
	var_02 = lib_A5DA::func_11B1();
	var_02.var_6F1D[param_00] = param_01;
}

//Function Number: 4
lib_A5DA::func_876B(param_00)
{
	var_01 = lib_A5DA::func_11B1();
	if(isstring(param_00))
	{
		var_02 = param_00;
		param_00 = spawnstruct();
		param_00.var_6F1E = var_02;
	}

	var_02 = param_00.var_6F1E;
	var_03 = lib_A5D2::func_F30(var_01.var_2770,param_00.var_6B9E);
	var_04 = lib_A5D2::func_F30(var_01.var_2768,param_00.var_35EE);
	var_05 = lib_A5D2::func_F30(var_01.var_2769,param_00.var_35F3);
	var_06 = lib_A5D2::func_F30(var_01.var_2775,param_00.var_6376);
	var_07 = lib_A5D2::func_F30(undefined,param_00.var_4DD1);
	self.var_86F8 = thread lib_A5DA::func_11E1(var_02,var_03,var_04,var_05,var_06,var_07);
}

//Function Number: 5
lib_A5DA::func_8773(param_00,param_01)
{
	var_02 = self;
	var_03 = lib_A5DA::func_11B1();
	var_04 = var_02.var_86F8;
	var_02.var_86F8 = undefined;
	var_05 = var_04 lib_A5DA::func_11BC();
	var_06 = lib_A5D2::func_F30(var_04.var_35F3,var_05.var_4774.var_35F3);
	var_04.var_35F3 = lib_A5D2::func_F30(var_06,param_00);
	param_01 = lib_A5D2::func_F30(0,param_01);
	var_04 lib_A59A::delaythread(param_01,::lib_A5DA::func_11EA,var_04.var_35F3);
}

//Function Number: 6
lib_A5DA::func_1194()
{
	var_00 = common_scripts\utility::spawn_tag_origin();
	var_00.var_9EBA = 1;
	return var_00;
}

//Function Number: 7
lib_A5DA::func_11CD()
{
	return isdefined(self.var_9EBA) && self.var_9EBA == 1;
}

//Function Number: 8
lib_A5DA::func_118C(param_00,param_01)
{
	var_02 = lib_A5DA::func_11B1();
	lib_A5DA::func_11E0(param_00);
	lib_A5DA::func_11DA(param_01);
	var_02.var_9D5E = self;
}

//Function Number: 9
lib_A5DA::func_1187(param_00,param_01,param_02)
{
	var_03 = lib_A5DA::func_11B1();
	self.var_5867 = spawnstruct();
	self.var_5867.var_588C = [];
	self.var_5867.defaults = spawnstruct();
	self.var_5867.defaults.var_35F3 = lib_A5D2::func_F30(var_03.var_2769,param_00);
	self.var_5867.defaults.var_868B = lib_A5D2::func_F30(var_03.var_2774,param_01);
	self.var_5867.defaults.var_8686 = lib_A5D2::func_F30(var_03.var_2773,param_02);
}

//Function Number: 10
lib_A5DA::func_1188(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(isarray(param_00))
	{
		var_06 = param_00;
	}
	else
	{
		var_06 = [param_01];
	}

	param_01 = lib_A5D2::func_F30(self.var_5867.defaults.var_35F3,param_01);
	param_02 = lib_A5D2::func_F30(self.var_5867.defaults.var_868B,param_02);
	param_03 = lib_A5D2::func_F30(self.var_5867.defaults.var_8686,param_03);
	param_04 = lib_A5D2::func_F30(param_00,param_04);
	param_05 = lib_A5D2::func_F30("alias",param_05);
	var_0A = spawnstruct();
	var_0A.name = param_04;
	var_0A.var_35F3 = param_01;
	var_0A.var_D5F = param_05;
	var_0A.var_D5E = var_06;
	var_0A.var_6F1E = lib_A5DA::func_11C5();
	var_0A.var_667E = [];
	var_0A lib_A5DA::func_11D6(param_02,param_03);
	self.var_5867.var_588C[var_0A.name] = var_0A;
	self.var_5867.var_5875 = var_0A;
}

//Function Number: 11
lib_A5DA::func_11D5(param_00)
{
	var_01 = undefined;
	if(isdefined(self.var_5867) && isdefined(self.var_5867.var_5875))
	{
		var_01 = self.var_5867.var_5875;
		if(isdefined(self.var_13A3))
		{
		}
	}
	else if(isdefined(self.var_6494) && isdefined(self.var_6494.var_649A))
	{
		var_01 = self.var_6494.var_649A;
	}
	else if(isdefined(self.var_13A3) && isdefined(self.var_13A3.var_13A5))
	{
		var_01 = self.var_13A3.var_13A5;
	}

	return var_01;
}

//Function Number: 12
lib_A5DA::func_11D4(param_00)
{
	var_01 = undefined;
	var_02 = lib_A5DA::func_11D5(param_00);
	if(isdefined(var_02))
	{
		var_01 = var_02.var_6DFD;
	}

	return var_01;
}

//Function Number: 13
lib_A5DA::func_11D6(param_00,param_01)
{
	var_02 = lib_A5DA::func_11B1();
	self.var_667D = spawnstruct();
	var_03 = lib_A5D2::func_F30(var_02.var_2774,self.var_667D.var_868B);
	var_04 = lib_A5D2::func_F30(var_02.var_2773,self.var_667D.var_8686);
	self.var_667D.var_868B = lib_A5D2::func_F30(var_03,param_00);
	self.var_667D.var_8686 = lib_A5D2::func_F30(var_04,param_01);
	self.var_667D.var_4E78 = var_02.var_276C;
	self.var_667D.var_65C4 = var_02.var_276E;
	self.var_667D.var_4E77 = [];
}

//Function Number: 14
lib_A5DA::func_118B(param_00,param_01,param_02)
{
	param_00 = tolower(param_00);
	var_03 = param_00;
	if(!isstring(var_03))
	{
		var_03 = "";
	}

	var_04 = lib_A5DA::func_11D5(var_03);
	var_03 = param_00;
	var_06 = spawnstruct();
	var_06.var_3336 = [];
	var_06.var_4E78 = param_00;
	var_06.var_868B = lib_A5D2::func_F30(var_04.var_667D.var_868B,param_01);
	var_06.var_8686 = lib_A5D2::func_F30(var_04.var_667D.var_8686,lib_A5D2::func_F30(param_01,param_02));
	var_06.var_276E = var_04.var_667D.var_65C4;
	var_06.var_868B = lib_A5DA::func_1190(var_06.var_868B,0.1,0.1);
	var_06.var_8686 = lib_A5DA::func_1190(var_06.var_8686,0.1,0.1);
	var_04.var_667E[var_03] = var_06;
	var_04.var_6DFD = var_06;
}

//Function Number: 15
lib_A5DA::func_1193(param_00,param_01)
{
	return param_01 * 1 - param_00 / param_00;
}

//Function Number: 16
lib_A5DA::func_1191(param_00,param_01)
{
	return param_01 / param_00 + param_01;
}

//Function Number: 17
lib_A5DA::func_1190(param_00,param_01,param_02)
{
	var_03 = lib_A5DA::func_1193(param_00,param_01);
	var_04 = lib_A5DA::func_1191(var_03,param_02);
	return var_04;
}

//Function Number: 18
lib_A5DA::func_11A6(param_00,param_01,param_02)
{
	foreach(var_04 in param_00)
	{
		lib_A5DA::func_118B(var_04,param_01,param_02);
		lib_A5DA::func_119B();
	}
}

//Function Number: 19
lib_A5DA::func_1183(param_00,param_01,param_02)
{
	if(isstring(param_01))
	{
		param_02 = lib_A5D2::func_F30(param_01,param_02);
	}

	var_03 = lib_A5DA::func_11D4(param_02);
	var_04 = param_01;
	if(!isstring(var_04))
	{
		var_04 = "???";
	}

	var_05 = spawnstruct();
	var_05.var_D5D = param_01;
	var_05.var_65C4 = param_00;
	var_03.var_3336[param_02] = var_05;
}

//Function Number: 20
lib_A5DA::func_119B()
{
	var_00 = lib_A5DA::func_11D5("UNKNOWN param_map being terminated by AVM_end_param_map()");
	if(isdefined(var_00))
	{
		var_00.var_6DFD = undefined;
	}
}

//Function Number: 21
lib_A5DA::func_1198()
{
	self.var_5867.var_5875 = undefined;
}

//Function Number: 22
lib_A5DA::func_1197()
{
}

//Function Number: 23
lib_A5DA::func_1189(param_00)
{
	var_01 = lib_A5DA::func_11B1();
	self.var_6494 = spawnstruct();
	self.var_6494.var_649F = [];
	self.var_6494.defaults = spawnstruct();
	self.var_6494.defaults.var_35F3 = lib_A5D2::func_F30(var_01.var_2769,param_00);
}

//Function Number: 24
lib_A5DA::func_118A(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A5DA::func_11B1();
	param_01 = lib_A5D2::func_F30(undefined,param_01);
	param_02 = lib_A5D2::func_F30(self.var_6494.defaults.var_35F3,param_02);
	param_03 = lib_A5D2::func_F30(1,param_03);
	param_04 = lib_A5D2::func_F30(param_00,param_04);
	param_05 = lib_A5D2::func_F30(var_06.var_2767,param_05);
	var_07 = param_04;
	if(isstring(param_04))
	{
		var_07 = [param_04];
	}

	var_0B = spawnstruct();
	var_0B.name = param_00;
	var_0B.var_D5E = var_07;
	var_0B.var_D5F = param_05;
	var_0B.var_2FB3 = param_01;
	var_0B.var_35F3 = param_02;
	var_0B.var_6499 = param_03;
	var_0B.var_667E = [];
	var_0B.var_86D3 = [];
	var_0B lib_A5DA::func_11D6();
	self.var_6494.var_649F[var_0B.name] = var_0B;
	self.var_6494.var_649A = var_0B;
}

//Function Number: 25
lib_A5DA::func_11DF(param_00)
{
	var_01 = self.var_6494.var_649A;
	var_01.var_649B = param_00;
}

//Function Number: 26
lib_A5DA::func_119A()
{
	self.var_6494.var_649A = undefined;
}

//Function Number: 27
lib_A5DA::func_1199()
{
}

//Function Number: 28
lib_A5DA::func_1185(param_00,param_01)
{
	self.var_13A3 = spawnstruct();
	self.var_13A3.var_13A6 = [];
	self.var_13A3.defaults = spawnstruct();
	self.var_13A3.defaults.var_868B = param_00;
	self.var_13A3.defaults.var_8686 = param_01;
}

//Function Number: 29
lib_A5DA::func_1186(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = lib_A5DA::func_11B1();
	var_06 = spawnstruct();
	var_06.var_649F = [];
	var_06.var_588C = [];
	var_06.var_6F1E = lib_A5DA::func_11C5();
	var_06.var_667E = [];
	var_06.name = param_00;
	var_06.var_20E0 = param_01;
	param_03 = lib_A5D2::func_F30(self.var_13A3.defaults.var_868B,param_03);
	param_04 = lib_A5D2::func_F30(self.var_13A3.defaults.var_8686,param_04);
	var_06 lib_A5DA::func_11D6(param_03,param_04);
	self.var_13A3.var_13A6[var_06.name] = var_06;
	self.var_13A3.var_13A5 = var_06;
	if(isarray(param_02))
	{
		lib_A5DA::func_11A6(param_02,self.var_13A3.defaults.var_868B,self.var_13A3.defaults.var_8686);
	}
}

//Function Number: 30
lib_A5DA::func_117F(param_00)
{
	self.var_13A3.var_13A5.var_4D5D = param_00;
}

//Function Number: 31
lib_A5DA::func_117E(param_00)
{
	self.var_13A3.var_13A5.var_4C0B = param_00;
}

//Function Number: 32
lib_A5DA::func_1182(param_00)
{
	if(isstring(param_00))
	{
		param_00 = [param_00];
	}

	foreach(var_02 in param_00)
	{
		var_03 = self.var_13A3.var_13A5;
		var_03.var_649F[var_02] = var_02;
	}
}

//Function Number: 33
lib_A5DA::func_1180(param_00)
{
	var_01 = self.var_13A3.var_13A5;
	if(!isdefined(param_00) || param_00.size == 0)
	{
		param_00 = "none";
	}

	if(isstring(param_00))
	{
		if(tolower(param_00) == "all")
		{
			var_01.var_588C[0] = "all";
			return;
		}

		if(tolower(param_00) == "none")
		{
			var_01.var_588C[0] = "none";
			return;
		}

		var_01.var_588C[param_00] = param_00;
		return;
	}

	var_01.var_588C[0] = undefined;
	foreach(var_03 in param_00)
	{
		if(var_03 != "all" && var_03 != "none")
		{
		}

		var_01.var_588C[var_03] = var_03;
	}
}

//Function Number: 34
lib_A5DA::func_1196()
{
	self.var_13A3.var_13A5 = undefined;
}

//Function Number: 35
lib_A5DA::func_1195()
{
}

//Function Number: 36
lib_A5DA::func_118D(param_00,param_01)
{
	if(isdefined(param_00))
	{
		param_00 = param_00 * 1000;
	}

	var_02 = lib_A5DA::func_11B1();
	self.var_8D53 = spawnstruct();
	self.var_8D53.var_8D55 = [];
	self.var_8D53.defaults = spawnstruct();
	self.var_8D53.defaults.priority = lib_A5D2::func_F30(var_02.var_2771,param_01);
	self.var_8D53.defaults.var_5C31 = lib_A5D2::func_F30(var_02.var_2776,param_00);
}

//Function Number: 37
lib_A5DA::func_118F(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_04))
	{
		param_04 = param_04 * 1000;
	}

	var_05 = spawnstruct();
	var_05.name = param_00;
	var_05.var_4DD0 = [param_01,param_02];
	var_05.priority = lib_A5D2::func_F30(self.var_8D53.defaults.priority,param_03);
	var_05.var_5C31 = lib_A5D2::func_F30(self.var_8D53.defaults.var_5C31,param_04);
	var_05.states = [];
	self.var_8D53.var_8D55[param_00] = var_05;
	self.var_8D53.var_4434 = var_05;
}

//Function Number: 38
lib_A5DA::func_118E(param_00,param_01,param_02)
{
	if(isdefined(param_01))
	{
		param_01 = param_01 * 1000;
	}

	var_03 = self.var_8D53.var_4434;
	var_04 = var_03.name;
	var_05 = spawnstruct();
	var_05.name = param_00;
	var_05.var_9712 = [];
	var_05.priority = lib_A5D2::func_F30(var_03.priority,param_02);
	var_05.var_5C31 = lib_A5D2::func_F30(var_03.var_5C31,param_01);
	var_05.var_6F1E = lib_A5DA::func_11C5();
	var_03.states[param_00] = var_05;
	self.var_8D53.var_4434.var_8D5E = var_05;
}

//Function Number: 39
lib_A5DA::func_1184(param_00,param_01)
{
	var_03 = self.var_8D53.var_4434.var_8D5E;
	var_03.var_9712[var_03.var_9712.size] = [param_00,param_01];
}

//Function Number: 40
lib_A5DA::func_119E()
{
	self.var_8D53.var_4434.var_8D5E = undefined;
}

//Function Number: 41
lib_A5DA::func_119F()
{
	self.var_8D53.var_4434 = undefined;
}

//Function Number: 42
lib_A5DA::func_119D()
{
}

//Function Number: 43
lib_A5DA::func_117D(param_00,param_01)
{
	if(isstring(param_00))
	{
		param_00 = tolower(param_00);
	}

	var_04 = lib_A5DA::func_11B1();
	if(!isdefined(self.var_3332))
	{
		self.var_3332 = [];
	}

	var_05 = spawnstruct();
	if(isarray(param_01))
	{
		var_05.var_3331 = [];
		foreach(var_07 in param_01)
		{
			var_05.var_3331[var_05.var_3331.size] = (var_07[0],var_07[1],0);
		}
	}
	else
	{
		var_05.var_3334 = param_01;
	}

	self.var_3332[param_00] = var_05;
}

//Function Number: 44
lib_A5DA::func_119C()
{
	var_00 = lib_A5DA::func_11B1();
	self.var_2156 = [];
	foreach(var_08, var_02 in self.var_5867.var_588C)
	{
		var_03 = var_08;
		var_04 = var_02;
		foreach(var_07, var_06 in var_04.var_667E)
		{
			self.var_2156[var_07] = lib_A5DA::func_11B5(var_07);
		}
	}

	foreach(var_08, var_02 in self.var_6494.var_649F)
	{
		var_0A = var_08;
		var_0B = var_02;
		foreach(var_07, var_06 in var_0B.var_667E)
		{
			self.var_2156[var_07] = lib_A5DA::func_11B5(var_07);
		}
	}

	foreach(var_08, var_02 in self.var_13A3.var_13A6)
	{
		var_0E = var_08;
		var_0F = var_02;
		foreach(var_07, var_06 in var_0F.var_667E)
		{
			self.var_2156[var_07] = lib_A5DA::func_11B5(var_07);
		}
	}

	var_00.var_9D5E = undefined;
}

//Function Number: 45
lib_A5DA::func_11C1()
{
	return self.var_59D6;
}

//Function Number: 46
lib_A5DA::func_9ED0()
{
	return self.var_86F8;
}

//Function Number: 47
lib_A5DA::func_9ECE()
{
	return lib_A5DA::func_11BB();
}

//Function Number: 48
lib_A5DA::func_11A4(param_00,param_01)
{
	thread lib_A5DA::func_11DB(param_00,param_01);
}

//Function Number: 49
lib_A5DA::func_11DB(param_00,param_01)
{
	var_02 = self;
	var_03 = var_02 lib_A5DA::func_11BB();
	var_04 = var_02 lib_A5DA::func_11CA();
	param_00 = clamp(param_00,0,1);
	param_01 = clamp(lib_A5D2::func_F30(1,param_01),0,60);
	var_05 = var_03;
	var_02 notify(var_05);
	var_02 endon(var_05);
	level endon("msg_snd_vehicle_stop");
	level endon("msg_snd_vehicle_stop_" + var_02 lib_A5DA::func_11BB());
	var_04 endon("death");
	var_06 = lib_A5DA::func_11A1();
	var_07 = param_00 - var_02.var_59D6;
	var_08 = max(1,param_01 / var_06);
	var_09 = var_07 / var_08;
	for(;;)
	{
		if(var_09 < 0)
		{
			if(var_02.var_59D6 > param_00)
			{
				var_02.var_59D6 = max(0,var_02.var_59D6 + var_09);
			}
			else
			{
				break;
			}
		}
		else if(var_09 > 0)
		{
			if(var_02.var_59D6 < param_00)
			{
				var_02.var_59D6 = min(1,var_02.var_59D6 + var_09);
			}
			else
			{
				break;
			}
		}

		wait(var_06);
	}
}

//Function Number: 50
lib_A5DA::func_11A0(param_00)
{
	return lib_A5DA::func_11B1().var_76DA;
}

//Function Number: 51
lib_A5DA::func_11A1()
{
	return 0.1;
}

//Function Number: 52
lib_A5DA::func_9ECF(param_00)
{
	var_01 = 0;
	var_02 = lib_A5DA::func_11B1();
	if(isstring(param_00))
	{
		var_03 = var_02.var_6F1F[param_00];
		if(isdefined(var_03) & isarray(var_03.var_4E85))
		{
			var_01 = var_03.var_4E85.size;
		}
	}
	else
	{
		foreach(var_03 in var_03.var_6F1F)
		{
			if(isarray(var_03.var_4E85))
			{
				var_01 = var_01 + var_03.var_4E85.size;
			}
		}
	}

	return var_01;
}

//Function Number: 53
lib_A5DA::func_11AE(param_00)
{
	var_01 = lib_A5DA::func_11B1();
	var_02 = var_01.var_6F1D[param_00];
	var_03 = spawnstruct();
	var_03.var_4224 = spawnstruct();
	var_03.var_9C07 = spawnstruct();
	var_03.var_4774 = spawnstruct();
	var_03.var_4E85 = [];
	var_03.var_4774.var_6F1E = lib_A5D2::func_F30(undefined,param_00);
	var_03.var_4774.var_35EE = var_01.var_2768;
	var_03.var_4774.var_35F3 = var_01.var_2769;
	var_03.var_4774.var_889B = var_01.var_2775;
	var_03 [[ var_02 ]]();
	var_03 lib_A5DA::func_11A9();
	return var_03;
}

//Function Number: 54
lib_A5DA::func_11A9()
{
	var_00 = lib_A5DA::func_11B1();
	var_00.var_6F1F[self.var_4774.var_6F1E] = self;
}

//Function Number: 55
lib_A5DA::func_9ED5()
{
	var_00 = lib_A5DA::func_11B1();
	var_00.var_6F1F[self.var_4774.var_6F1E] = undefined;
}

//Function Number: 56
lib_A5DA::func_11A7()
{
	var_00 = lib_A5DA::func_11B1();
	var_00.var_6F1F[self.var_6F1E].var_4E85[self.var_4E84] = self;
	var_00.var_76DA++;
}

//Function Number: 57
lib_A5DA::func_11D7()
{
	var_00 = lib_A5DA::func_11B1();
	var_00.var_6F1F[self.var_6F1E].var_4E85[self.var_4E84] = undefined;
}

//Function Number: 58
lib_A5DA::func_11B0(param_00)
{
	var_01 = self.var_4774.var_6F1E + "_" + lib_A5DA::func_11A0();
	if(isdefined(param_00) && param_00 == 1)
	{
		var_01 = var_01 + "_player";
	}

	return var_01;
}

//Function Number: 59
lib_A5DA::func_11A3(param_00,param_01,param_02)
{
	lib_A5DA::func_11B1().var_1A04[param_00] = [param_01,param_02];
}

//Function Number: 60
lib_A5DA::func_11C0(param_00)
{
	var_01 = self;
	var_02 = undefined;
	foreach(var_04 in var_01.var_8D54)
	{
		var_02 = var_04[param_00];
		if(isdefined(var_02))
		{
			break;
		}
	}

	return var_02;
}

//Function Number: 61
lib_A5DA::func_11B2(param_00)
{
	var_01 = self;
	return var_01.var_13A4[param_00];
}

//Function Number: 62
lib_A5DA::func_11C9(param_00)
{
	var_01 = self;
	var_02 = undefined;
	foreach(var_04 in var_01.var_8D53.var_8D55)
	{
		var_02 = var_04.states[param_00];
		if(isdefined(var_02))
		{
			break;
		}
	}

	return var_02;
}

//Function Number: 63
lib_A5DA::func_11B3(param_00)
{
	var_01 = self;
	return var_01.var_13A3.var_13A6[param_00];
}

//Function Number: 64
lib_A5DA::func_11AC(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = self;
	var_06 = spawnstruct();
	var_06.var_9C07 = spawnstruct();
	var_06.var_6F1E = var_05 lib_A5DA::func_11C5();
	var_06.var_4E84 = var_05 lib_A5DA::func_11B0(param_04);
	var_06.var_9C70 = param_00;
	var_06.var_35EE = param_01;
	var_06.var_35F3 = param_02;
	var_06.var_889B = param_03;
	var_06.var_6B9E = param_04;
	var_06.var_5868 = 1;
	var_06.var_6495 = [];
	var_06.var_59D6 = 1;
	var_06.var_5873 = [];
	foreach(var_08 in var_05.var_5867.var_588C)
	{
		var_09 = spawnstruct();
		var_09.var_7047 = var_08;
		var_09.var_697C = 0;
		var_09.var_24CF = var_06 lib_A5DA::func_11AD(var_08);
		var_09.var_86D3 = [];
		var_09.var_9F33 = 1;
		var_06.var_5873[var_08.name] = var_09;
	}

	var_06.var_6497 = [];
	foreach(var_08 in var_05.var_6494.var_649F)
	{
		var_09 = spawnstruct();
		var_09.var_7047 = var_08;
		var_09.var_24CF = var_06 lib_A5DA::func_11AD(var_08);
		var_09.var_86D3 = [];
		var_06.var_6497[var_08.name] = var_09;
	}

	var_06.var_13A4 = [];
	foreach(var_08 in var_05.var_13A3.var_13A6)
	{
		var_09 = spawnstruct();
		var_09.var_7047 = var_08;
		var_09.var_24CF = var_06 lib_A5DA::func_11AD(var_08);
		var_06.var_13A4[var_08.name] = var_09;
	}

	var_06.var_8D54 = [];
	foreach(var_15, var_10 in var_05.var_8D53.var_8D55)
	{
		var_06.var_8D54[var_15] = [];
		foreach(var_14, var_12 in var_10.states)
		{
			var_13 = spawnstruct();
			var_13.var_7047 = var_12;
			var_13.var_8CBF = 0;
			var_06.var_8D54[var_15][var_14] = var_13;
		}
	}

	if(isdefined(var_05.var_4224.var_4E83))
	{
		var_06 [[ var_05.var_4224.var_4E83 ]](var_06.var_9C07);
	}

	return var_06;
}

//Function Number: 65
lib_A5DA::func_11E1(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = self;
	if(var_06 lib_A5DA::func_11CD() == 0)
	{
		var_06 veh_turnengineoff();
	}

	var_07 = lib_A5DA::func_11C4(param_00);
	if(!isdefined(var_07))
	{
		var_07 = lib_A5DA::func_11AE(param_00);
	}

	var_08 = var_07 lib_A5DA::func_11AC(var_06,param_02,param_03,param_04,param_01);
	var_08 lib_A5DA::func_11A7();
	var_08 thread lib_A5DA::func_11EF();
	var_08 thread lib_A5DA::func_11CE(param_05);
	var_06 thread lib_A5DA::func_11D1(var_08);
	return var_08;
}

//Function Number: 66
lib_A5DA::func_11EA(param_00)
{
	if(!isdefined(self.var_5082))
	{
		self.var_5082 = 1;
		var_01 = self;
		var_02 = var_01 lib_A5DA::func_11BC();
		var_03 = var_01 lib_A5DA::func_11BB();
		param_00 = max(0.01,lib_A5D2::func_F30(var_01.var_35F3,param_00));
		level notify("msg_snd_vehicle_stop_" + var_03);
		foreach(var_05 in var_01.var_5873)
		{
			var_06 = lib_A5D2::func_F30(var_05.var_7047.var_35F3,param_00);
			var_05 thread lib_A5DA::func_11AF(var_06);
		}

		foreach(var_09 in var_01.var_6497)
		{
			var_06 = lib_A5D2::func_F30(var_09.var_7047.var_35F3,param_00);
			var_09 thread lib_A5DA::func_11AF(var_06);
		}

		wait(param_00 + 0.05);
		var_01 lib_A5DA::func_11D7();
	}
}

//Function Number: 67
lib_A5DA::func_11D1(param_00)
{
	var_01 = param_00 lib_A5DA::func_11BB();
	level endon("msg_snd_vehicle_stop_" + var_01);
	self waittill("death");
	param_00 thread lib_A5DA::func_11EA();
}

//Function Number: 68
lib_A5DA::func_11AD(param_00)
{
	var_01 = self;
	var_02 = spawnstruct();
	var_02.var_868F = [];
	var_02.var_67F4 = [];
	foreach(var_04 in param_00.var_667E)
	{
		var_02.var_868F[var_04.var_4E78] = 0;
		foreach(var_06 in var_04.var_3336)
		{
			if(!isdefined(var_02.var_67F4[var_06.var_65C4]))
			{
				var_02.var_67F4[var_06.var_65C4] = 1;
			}
		}
	}

	if(!isdefined(var_02.var_67F4["volume"]))
	{
		var_02.var_67F4["volume"] = 1;
	}

	if(!isdefined(var_02.var_67F4["pitch"]))
	{
		var_02.var_67F4["pitch"] = 1;
	}

	return var_02;
}

//Function Number: 69
lib_A5DA::func_9ED4(param_00)
{
	var_01 = self;
	foreach(var_04, var_03 in param_00.var_868F)
	{
		param_00.var_868F[var_04] = 0;
	}

	foreach(var_04, var_03 in param_00.var_67F4)
	{
		param_00.var_67F4[var_04] = 1;
	}
}

//Function Number: 70
lib_A5DA::func_11B6()
{
	return self.var_24CF.var_868F;
}

//Function Number: 71
lib_A5DA::func_11BE()
{
	return self.var_24CF.var_67F4;
}

//Function Number: 72
lib_A5DA::func_11BF()
{
	var_00 = lib_A5DA::func_11BE();
	var_01 = var_00["volume"];
	if(!isdefined(var_01))
	{
		var_01 = 1;
	}

	return var_01;
}

//Function Number: 73
lib_A5DA::func_11EF()
{
	var_00 = self;
	var_01 = lib_A5DA::func_11BC();
	var_02 = lib_A5DA::func_11CA();
	level endon("msg_snd_vehicle_stop");
	level endon("msg_snd_vehicle_stop_" + lib_A5DA::func_11BB());
	var_02 endon("death");
	var_03 = undefined;
	for(;;)
	{
		var_00 lib_A5DA::func_11EE();
		foreach(var_05 in var_00.var_5873)
		{
			if(var_05.var_697C == 1)
			{
				var_06 = var_05.var_7047.name;
				var_00 lib_A5DA::func_11D0(var_05,var_03);
				var_00 lib_A5DA::func_11ED(var_05);
			}
		}

		var_03 = gettime();
		var_08 = distance2d(var_00.var_9C70.var_2E6,level.var_31D.var_2E6);
		if(var_08 < 400)
		{
			var_09 = 1;
		}
		else if(var_08 > 1500)
		{
			var_09 = 10;
		}
		else
		{
			var_09 = 1 + 9 * var_08 - 400 / 1100;
		}

		wait(0.1 * var_09);
	}
}

//Function Number: 74
lib_A5DA::func_11DC(param_00,param_01)
{
	var_02 = self;
	switch(param_00.var_7047.var_D5F)
	{
		case "alias":
			break;

		case "soundevent":
			break;

		case "damb":
			break;

		default:
			break;
	}
}

//Function Number: 75
lib_A5DA::func_11D0(param_00,param_01)
{
	if(param_00.var_7047.var_667E.size == 0)
	{
		return;
	}

	var_02 = self;
	var_03 = lib_A5DA::func_11BC();
	var_04 = param_00.var_7047;
	var_05 = param_00.var_24CF;
	var_06 = gettime();
	param_01 = lib_A5D2::func_F30(var_06 - 100,param_01);
	var_05.var_67F4 = [];
	var_07 = [];
	foreach(var_0A, var_09 in var_03.var_2156)
	{
		var_07[var_0A] = var_02 [[ var_09 ]]();
	}

	foreach(var_0C in var_04.var_667E)
	{
		var_0D = var_0C.var_4E78;
		var_0E = var_07[var_0D];
		var_0F = var_05.var_868F[var_0D];
		if(var_0E > var_0F)
		{
			var_10 = var_0C.var_868B;
		}
		else
		{
			var_10 = var_0C.var_8686;
		}

		var_11 = var_06 - param_01 / 100;
		var_10 = 1 - pow(1 - var_10,var_11);
		var_12 = var_0F + var_10 * var_0E - var_0F;
		foreach(var_17, var_14 in var_0C.var_3336)
		{
			var_15 = var_03.var_3332[var_17];
			var_16 = function_0246(var_12,var_15.var_3331);
			if(isdefined(var_05.var_67F4[var_14.var_65C4]))
			{
				var_05.var_67F4[var_14.var_65C4] = var_05.var_67F4[var_14.var_65C4] * var_16;
				continue;
			}

			var_05.var_67F4[var_14.var_65C4] = var_16;
		}

		var_05.var_868F[var_0D] = var_12;
	}
}

//Function Number: 76
lib_A5DA::func_11EE()
{
	self.var_5868 = 1;
	foreach(var_01 in self.var_6495)
	{
		self.var_5868 = self.var_5868 * var_01;
	}
}

//Function Number: 77
lib_A5DA::func_11ED(param_00)
{
	var_01 = self;
	foreach(var_07, var_03 in param_00.var_24CF.var_67F4)
	{
		if(var_07 == "volume")
		{
			var_03 = var_03 * var_01.var_5868 * param_00.var_9F33;
			if(isdefined(param_00.var_35DE))
			{
				param_00.var_35DE = min(param_00.var_35DE + param_00.var_35DC,1);
				var_03 = var_03 * param_00.var_35DE;
				if(param_00.var_35DE >= 1)
				{
					param_00.var_35DE = undefined;
				}
			}
		}

		foreach(var_05 in param_00.var_86D3)
		{
			var_05 lib_A5DA::func_11F1(var_07,var_03);
		}
	}
}

//Function Number: 78
lib_A5DA::func_11A5(param_00,param_01,param_02)
{
	var_03 = self;
	var_04 = var_03.var_5873[param_00];
	var_05 = 1;
	if(param_01 == 1)
	{
		var_05 = 0;
	}

	param_02 = lib_A5D2::func_F30(0.05,param_02);
	var_06 = var_05 - var_04.var_9F33;
	var_07 = max(1,param_02 / lib_A5DA::func_11A1());
	var_08 = var_06 / var_07;
	var_03 thread lib_A5DA::func_11DD(var_04,var_05,var_08,lib_A5DA::func_11A1());
}

//Function Number: 79
lib_A5DA::func_11DD(param_00,param_01,param_02,param_03)
{
	var_04 = self;
	var_05 = var_04 lib_A5DA::func_11CA();
	var_06 = param_00.var_7047.name;
	var_04 notify(var_06);
	var_04 endon(var_06);
	level endon("msg_snd_vehicle_stop");
	level endon("msg_snd_vehicle_stop_" + var_04 lib_A5DA::func_11BB());
	var_05 endon("death");
	for(;;)
	{
		if(param_02 < 0)
		{
			if(param_00.var_9F33 > param_01)
			{
				param_00.var_9F33 = max(0,param_00.var_9F33 + param_02);
			}
			else
			{
				break;
			}
		}
		else if(param_02 > 0)
		{
			if(param_00.var_9F33 < param_01)
			{
				param_00.var_9F33 = min(1,param_00.var_9F33 + param_02);
			}
			else
			{
				break;
			}
		}

		wait(param_03);
	}
}

//Function Number: 80
lib_A5DA::func_11CE(param_00)
{
	var_01 = self;
	var_02 = lib_A5DA::func_11BC();
	foreach(var_0A, var_04 in var_02.var_8D53.var_8D55)
	{
		var_05 = var_04.var_4DD0;
		if(isarray(param_00))
		{
			var_05 = param_00[var_0A];
		}

		var_06 = var_05[0];
		var_07 = var_05[1];
		var_08 = var_01.var_8D54[var_0A][var_06];
		var_09 = var_01.var_13A4[var_07];
		var_01 lib_A5DA::func_11D0(var_09);
		var_01 thread lib_A5DA::func_11E5(var_08,var_09);
	}
}

//Function Number: 81
lib_A5DA::func_11E5(param_00,param_01)
{
	var_02 = self;
	var_03 = var_02 lib_A5DA::func_11BC();
	var_04 = param_00.var_7047;
	var_05 = var_02 lib_A5DA::func_11CA();
	level endon("msg_snd_vehicle_stop");
	level endon("msg_snd_vehicle_stop_" + lib_A5DA::func_11BB());
	var_05 endon("death");
	param_00.var_8CBF = gettime();
	var_02 lib_A5DA::func_11E6(param_00,param_01);
	var_02 lib_A5DA::func_11E8(param_00,param_01);
	var_02 lib_A5DA::func_11E7(param_00,param_01);
	if(isdefined(param_01.var_7047.var_4D5D))
	{
		var_02 [[ param_01.var_7047.var_4D5D ]](var_02.var_9C07);
	}

	var_06 = undefined;
	var_07 = undefined;
	var_08 = undefined;
	var_09 = undefined;
	var_0A = undefined;
	for(;;)
	{
		if(isdefined(param_01.var_7047.var_4C0B))
		{
			var_02 lib_A5DA::func_11D0(param_01);
			var_02 [[ param_01.var_7047.var_4C0B ]](param_01.var_24CF.var_868F,var_02.var_9C07);
		}

		foreach(var_0C in var_04.var_9712)
		{
			var_0D = var_0C[0];
			var_0E = var_0C[1];
			var_0F = var_0C[2];
			var_10 = var_02 lib_A5DA::func_11C0(var_0D);
			var_11 = var_02 lib_A5DA::func_11B2(var_0E);
			var_12 = var_10.var_7047;
			var_13 = var_11.var_7047;
			if(gettime() - var_10.var_8CBF < var_12.var_5C31)
			{
				continue;
			}

			var_02 lib_A5DA::func_11D0(var_11,var_0A);
			var_14 = var_02 lib_A5DA::func_11E4(var_10,var_11);
			if(isarray(var_14))
			{
				var_09 = var_14;
				var_14 = 1;
			}

			if(var_14)
			{
				if(!isdefined(var_06) || var_12.priority > var_06.var_7047.priority)
				{
					var_06 = var_10;
					var_07 = var_11;
					var_08 = var_09;
					var_09 = undefined;
				}
			}
		}

		if(isdefined(var_06))
		{
			break;
		}

		var_0A = gettime();
		var_16 = distance2d(var_02.var_9C70.var_2E6,level.var_31D.var_2E6);
		if(var_16 < 400)
		{
			var_17 = 1;
		}
		else if(var_16 > 1500)
		{
			var_17 = 10;
		}
		else
		{
			var_17 = 1 + 9 * var_16 - 400 / 1100;
		}

		wait(0.1 * var_17);
	}

	var_02 lib_A5DA::func_11D9(var_07,var_08);
	var_18 = var_02 lib_A5DA::func_11B4(var_07);
	var_19 = var_18.size > 0;
	var_02 thread lib_A5DA::func_11E9(param_01,var_19);
	var_02 thread lib_A5DA::func_11E5(var_06,var_07);
}

//Function Number: 82
lib_A5DA::func_11E6(param_00,param_01)
{
	var_02 = self;
	var_03 = param_01.var_7047;
	if(isdefined(var_03.var_588C[0]))
	{
		if(var_03.var_588C[0] == "all")
		{
			foreach(var_05 in var_02.var_5873)
			{
				var_05.var_9F33 = 1;
			}

			return;
		}

		return;
	}

	foreach(var_07 in var_06.var_588C)
	{
		var_08 = var_04.var_5873[var_07];
		var_08.var_9F33 = 1;
	}
}

//Function Number: 83
lib_A5DA::func_11E9(param_00,param_01)
{
	var_02 = self;
	var_03 = param_00.var_7047.var_649F;
	foreach(var_05 in var_03)
	{
		var_06 = var_02.var_6497[var_05];
		var_07 = var_06.var_7047.var_6499;
		if(var_07 == 2 || var_07 == 1 && param_01)
		{
			var_08 = var_06.var_86D3;
			var_06.var_86D3 = [];
			var_09 = var_06.var_7047.var_35F3;
			foreach(var_0B in var_08)
			{
				var_0B thread lib_A5DA::func_11EC(var_09);
			}
		}
	}
}

//Function Number: 84
lib_A5DA::func_9ED2(param_00)
{
	var_01 = self;
	param_00 = max(0.01,lib_A5D2::func_F30(0.05,param_00));
	switch(var_01.var_7047.var_D5F)
	{
		case "alias":
			break;

		case "soundevent":
			break;

		case "damb":
			break;

		default:
			break;
	}
}

//Function Number: 85
lib_A5DA::func_11E4(param_00,param_01)
{
	var_02 = 0;
	var_03 = self;
	var_02 = var_03 [[ param_01.var_7047.var_20E0 ]](param_01.var_24CF.var_868F,var_03.var_9C07);
	return var_02;
}

//Function Number: 86
lib_A5DA::func_11E8(param_00,param_01)
{
	var_02 = self;
	var_03 = var_02 lib_A5DA::func_11BC();
	var_04 = param_00.var_7047;
	var_05 = param_01.var_7047;
	var_06 = param_01.var_6498;
	if(!isdefined(var_06))
	{
		var_06 = var_05.var_649F;
	}

	foreach(var_08 in var_06)
	{
		var_09 = var_02.var_6497[var_08];
		var_0A = var_09.var_7047;
		var_0B = var_02 lib_A5DA::func_11C2(var_08);
		var_0C = var_02 lib_A5DA::func_11C3(var_08);
		if(var_0A.var_D5F == "alias")
		{
			var_02 lib_A5DA::func_11D0(var_09);
			for(var_0D = 0;var_0D < var_0A.var_D5E.size;var_0D++)
			{
				var_0E = var_02 lib_A5DA::func_11E3(var_09,var_0D);
				foreach(var_11, var_10 in var_09.var_24CF.var_67F4)
				{
					var_0E lib_A5DA::func_11F1(var_11,var_10);
				}

				if(var_0C)
				{
					var_02 thread lib_A5DA::func_11AB(var_09,var_0E);
				}

				if(var_0B == 1 || var_0B == 2)
				{
					var_09.var_86D3[var_0D] = var_0E;
				}
			}

			var_02 thread lib_A5DA::func_11CB(var_09);
		}
	}
}

//Function Number: 87
lib_A5DA::func_11AB(param_00,param_01)
{
	var_02 = self;
	var_03 = var_02 lib_A5DA::func_11CA();
	var_04 = lib_A5DA::func_11A1();
	level endon("msg_snd_vehicle_stop");
	level endon("msg_snd_vehicle_stop_" + var_02 lib_A5DA::func_11BB());
	var_03 endon("death");
	wait(var_04);
	while(isdefined(param_01))
	{
		var_02 lib_A5DA::func_11D0(param_00);
		if(isdefined(param_01))
		{
			foreach(var_07, var_06 in param_00.var_24CF.var_67F4)
			{
				param_01 lib_A5DA::func_11F1(var_07,var_06);
			}
		}

		wait(var_04);
	}
}

//Function Number: 88
lib_A5DA::func_11E7(param_00,param_01)
{
	var_02 = self;
	var_03 = var_02 lib_A5DA::func_11BC();
	var_04 = param_00.var_7047;
	var_05 = param_01.var_7047;
	var_06 = var_05.var_588C;
	if(isdefined(var_06[0]))
	{
		if(var_06[0] == "all")
		{
			foreach(var_08 in var_02.var_5873)
			{
				lib_A5DA::func_11DC(var_08,1);
			}

			return;
		}

		if(var_06[0] == "none")
		{
			foreach(var_08 in var_02.var_5873)
			{
				lib_A5DA::func_11DC(var_08,0);
			}

			return;
		}

		return;
	}

	if(var_06.size > 0)
	{
		var_0B = [];
		var_0C = [];
		foreach(var_09, var_08 in var_02.var_5873)
		{
			if(isdefined(var_06[var_09]))
			{
				var_0B[var_09] = var_08;
				continue;
			}

			var_0C[var_09] = var_08;
		}

		foreach(var_08 in var_0B)
		{
			lib_A5DA::func_11DC(var_08,1);
		}

		foreach(var_08 in var_0C)
		{
			lib_A5DA::func_11DC(var_08,0);
		}
	}
}

//Function Number: 89
lib_A5DA::func_4E45()
{
	var_00 = lib_A5DA::func_11CA();
	return distance2d(var_00.var_2E6,level.var_31D.var_2E6);
}

//Function Number: 90
lib_A5DA::func_4E44()
{
	var_00 = lib_A5DA::func_11CA();
	return distance(var_00.var_2E6,level.var_31D.var_2E6);
}

//Function Number: 91
lib_A5DA::func_4E54()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 veh_getthrottle();
}

//Function Number: 92
lib_A5DA::func_4E52()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = length(var_00 veh_getvelocity() * 0.05681818);
	return var_01;
}

//Function Number: 93
lib_A5DA::func_4E51()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00 veh_getvelocity();
	var_02 = level.var_31D getvelocity();
	var_03 = var_01 - var_02;
	var_04 = length(var_03) * 0.05681818;
	return var_04;
}

//Function Number: 94
lib_A5DA::func_4E53()
{
	var_00 = lib_A5DA::func_11CA();
	if(isdefined(var_00.var_3651))
	{
		return var_00.var_3651;
	}

	return var_00 lib_A571::func_3D3B() * 0.05681818;
}

//Function Number: 95
lib_A5DA::func_4E42()
{
	var_00 = lib_A5DA::func_11CA();
	return length(var_00 lib_A571::func_3D39()) * 0.00125;
}

//Function Number: 96
lib_A5DA::func_4E49()
{
	var_00 = lib_A5DA::func_11CA();
	return length(var_00 lib_A571::func_3D3A()) * 0.00125;
}

//Function Number: 97
lib_A5DA::func_4E46()
{
	var_00 = lib_A5DA::func_11CA();
	return function_0245(var_00.var_2E6,var_00 veh_getvelocity(),level.var_31D.var_2E6,level.var_31D getvelocity());
}

//Function Number: 98
lib_A5DA::func_4E47()
{
	var_00 = lib_A5DA::func_11CA();
	return function_0245(var_00.var_2E6,var_00 veh_getvelocity(),level.var_31D.var_2E6,level.var_31D getvelocity(),2,5);
}

//Function Number: 99
lib_A5DA::func_4E48()
{
	var_00 = lib_A5DA::func_11CA();
	return function_0245(var_00.var_2E6,var_00 veh_getvelocity(),level.var_31D.var_2E6,level.var_31D getvelocity(),1,0.5);
}

//Function Number: 100
lib_A5DA::func_1192(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	if(!isdefined(param_05))
	{
		param_05 = 1;
	}

	if(!isdefined(param_06))
	{
		param_06 = 13397;
	}

	if(param_04 != 1)
	{
		var_07 = param_01 - param_03;
		var_08 = vectornormalize(var_07);
		var_09 = param_02 - param_00;
		var_0A = var_08 * vectordot(var_08,var_09);
		var_0B = var_09 - var_0A;
		param_02 = param_00 + var_0A + var_0B / param_04;
	}

	var_0C = vectornormalize(param_00 - param_02);
	var_0D = vectordot(param_01,var_0C);
	var_0E = vectordot(param_03,var_0C);
	var_0F = param_06 + var_0E / param_06 + var_0D;
	var_0F = pow(var_0F,param_05);
	var_0F = clamp(var_0F,0.1,1.99);
	return var_0F;
}

//Function Number: 101
lib_A5DA::func_4E4E()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00.var_41[0];
	return var_01;
}

//Function Number: 102
lib_A5DA::func_4E55()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00.var_41[1];
	return var_01;
}

//Function Number: 103
lib_A5DA::func_4E4F()
{
	var_00 = lib_A5DA::func_11CA();
	return max(abs(angleclamp180(var_00.var_41[0])),abs(angleclamp180(var_00.var_41[2])));
}

//Function Number: 104
lib_A5DA::func_4E43()
{
	var_00 = lib_A5DA::func_11CA();
	return acos(anglestoup(var_00.var_41)[2]);
}

//Function Number: 105
lib_A5DA::func_4E4C()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8450();
}

//Function Number: 106
lib_A5DA::func_4E4B()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8451();
}

//Function Number: 107
lib_A5DA::func_4E4A()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8452();
}

//Function Number: 108
lib_A5DA::func_4E4D()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8453();
}

//Function Number: 109
lib_A5DA::func_4E50()
{
	var_00 = 0;
	var_01 = lib_A5DA::func_11CA();
	var_02 = 0.1;
	if(lib_A5DA::func_11CC())
	{
		if(!isdefined(var_01.var_B91))
		{
			var_01.var_B91 = 0;
		}

		var_03 = gettime();
		if(var_03 > var_01.var_B91 + var_02)
		{
			var_01.var_B91 = var_03;
			var_04 = bullettrace(var_01.var_2E6,var_01.var_2E6 - (0,0,360),0);
			var_01.var_B92 = var_04["fraction"];
			if(!isdefined(var_01.var_B92))
			{
				var_01.var_B92 = 0;
			}
		}

		var_00 = clamp(var_01.var_B92,0,1);
	}

	return var_00;
}

//Function Number: 110
lib_A5DA::func_4E66()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8475();
}

//Function Number: 111
lib_A5DA::func_4E68()
{
	var_00 = lib_A5DA::func_4E66();
	return var_00[0];
}

//Function Number: 112
lib_A5DA::func_4E67()
{
	var_00 = lib_A5DA::func_4E66();
	return var_00[1];
}

//Function Number: 113
lib_A5DA::func_4E69()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8477();
}

//Function Number: 114
lib_A5DA::func_4E6B()
{
	var_00 = lib_A5DA::func_4E69();
	return var_00[0];
}

//Function Number: 115
lib_A5DA::func_4E6A()
{
	var_00 = lib_A5DA::func_4E69();
	return var_00[1];
}

//Function Number: 116
lib_A5DA::func_4E70()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8474();
}

//Function Number: 117
lib_A5DA::func_4E6E()
{
	var_00 = lib_A5DA::func_4E70();
	return var_00[0];
}

//Function Number: 118
lib_A5DA::func_4E6F()
{
	var_00 = lib_A5DA::func_4E70();
	return var_00[1];
}

//Function Number: 119
lib_A5DA::func_4E6C()
{
	var_00 = lib_A5DA::func_4E70();
	return var_00[2];
}

//Function Number: 120
lib_A5DA::func_4E6D()
{
	var_00 = lib_A5DA::func_4E70();
	return var_00[3];
}

//Function Number: 121
lib_A5DA::func_4E71()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8473();
}

//Function Number: 122
lib_A5DA::func_4E73()
{
	var_00 = lib_A5DA::func_4E71();
	return var_00[0];
}

//Function Number: 123
lib_A5DA::func_4E72()
{
	var_00 = lib_A5DA::func_4E71();
	return var_00[1];
}

//Function Number: 124
lib_A5DA::func_4E76()
{
	var_00 = lib_A5DA::func_11CA();
	return var_00 method_8476();
}

//Function Number: 125
lib_A5DA::func_4E74()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00.turret method_8479();
	var_01 = abs(var_01);
	var_01 = clamp(var_01,0,90);
	var_01 = lib_A5DA::func_11D3(var_01,0,90);
	var_02 = level.var_31D getnormalizedcameramovement();
	var_03 = abs(var_02[0]);
	return 0;
}

//Function Number: 126
lib_A5DA::func_4E75()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00.turret method_8478();
	var_01 = abs(var_01);
	var_02 = var_00.turret method_8479();
	var_02 = abs(var_02);
	var_03 = length2d((var_01,var_02,0));
	var_03 = clamp(var_03,0,135);
	var_04 = lib_A5DA::func_11D3(var_03,0,135);
	var_05 = level.var_31D getnormalizedcameramovement();
	var_06 = length2d(var_05);
	return var_04 * var_06;
}

//Function Number: 127
lib_A5DA::func_4E63()
{
	var_00 = lib_A5DA::func_11CA();
	if(isdefined(level.var_E57.var_2B90) && level.var_E57.var_2B90 == 1)
	{
		level.var_E57.var_2B92 = level.var_E57.var_2B92 * 0.94;
		return level.var_E57.var_2B92;
	}

	var_01 = var_00 method_851D();
	if(var_01 != 0)
	{
		level.var_E57.var_2B92 = var_01;
	}

	return var_01;
}

//Function Number: 128
lib_A5DA::func_4E61()
{
	var_00 = lib_A5DA::func_11CA();
	var_01 = var_00 method_851E();
	return var_01;
}

//Function Number: 129
lib_A5DA::func_4E62()
{
	var_00 = lib_A5DA::func_4E61();
	var_01 = lib_A5DA::func_4E53();
	var_02 = var_01 + abs(var_00) * 0.1;
	return var_01 + abs(var_00) * 0.1;
}

//Function Number: 130
lib_A5DA::func_4E79()
{
	var_00 = level.var_31D getnormalizedcameramovement();
	var_01 = abs(var_00[0]);
	var_02 = abs(var_00[1]);
	if(var_01 > var_02)
	{
		return var_01;
	}

	return var_02;
}

//Function Number: 131
lib_A5DA::func_11E3(param_00,param_01)
{
	var_02 = self;
	var_03 = param_00.var_7047;
	var_04 = undefined;
	var_05 = var_02 lib_A5DA::func_11C6(var_03,param_01);
	if(isstring(var_05))
	{
		var_06 = var_02 lib_A5DA::func_11CA();
		var_04 = spawn("script_origin",var_06.var_2E6);
		var_04 linkto(var_06,"tag_origin",var_02.var_889B,(0,0,0));
		var_04 scalevolume(0);
		var_04 lib_A5F1::func_8724(var_05,"sound_done");
		var_04 thread lib_A5DA::func_11D2("sound_done");
	}

	return var_04;
}

//Function Number: 132
lib_A5DA::func_11D2(param_00)
{
	self endon("death");
	self waittill(param_00);
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 133
lib_A5DA::func_11CC()
{
	return isdefined(self.var_6B9E) && self.var_6B9E;
}

//Function Number: 134
lib_A5DA::func_11C6(param_00,param_01)
{
	var_02 = self;
	var_03 = param_00.var_D5E[lib_A5D2::func_F30(0,param_01)];
	if(isdefined(var_03) && var_02 lib_A5DA::func_11CC())
	{
		var_03 = var_03 + "_plr";
	}

	return var_03;
}

//Function Number: 135
lib_A5DA::func_11C7(param_00)
{
	return param_00.var_D5E.size;
}

//Function Number: 136
lib_A5DA::func_11F1(param_00,param_01)
{
	switch(param_00)
	{
		case "volume":
			break;

		case "pitch":
			break;

		default:
			break;
	}
}

//Function Number: 137
lib_A5DA::func_11CB(param_00)
{
	var_01 = self;
	var_02 = param_00.var_7047;
	var_01 lib_A5DA::func_11A8(var_02.name);
	var_01 lib_A5DA::func_11F0(param_00);
	var_01 lib_A5DA::func_11D8(var_02.name);
}

//Function Number: 138
lib_A5DA::func_11F0(param_00)
{
	var_01 = self;
	var_02 = var_01 lib_A5DA::func_11BC();
	var_03 = param_00.var_7047;
	level endon("msg_snd_vehicle_stop");
	level endon("msg_snd_vehicle_stop_" + var_01 lib_A5DA::func_11BB());
	var_01 lib_A5DA::func_11CA() endon("death");
	if(isdefined(var_03.var_2FB3))
	{
		var_04 = var_02 lib_A5DA::func_11B7(var_03.var_2FB3);
		var_05 = lib_A5D2::func_F2E(var_04);
		var_06 = 0;
		var_07 = var_05[1];
		var_08 = var_03.name;
		while(lib_A5DA::func_11AA(param_00.var_86D3) && var_06 < var_07)
		{
			var_09 = param_00 lib_A5DA::func_11BF();
			var_0A = var_02 lib_A5DA::func_11CF(var_06,var_03.var_2FB3);
			var_0A = 1 - var_09 * 1 - var_0A;
			var_01 lib_A5DA::func_11DE(var_08,var_0A);
			wait(0.1);
			var_06 = var_06 + 0.1;
		}
	}
}

//Function Number: 139
lib_A5DA::func_11AA(param_00)
{
	var_01 = 1;
	foreach(var_03 in param_00)
	{
		if(!isdefined(var_03))
		{
			var_01 = 0;
			break;
		}
	}

	return var_01;
}

//Function Number: 140
lib_A5DA::func_11A8(param_00)
{
	self.var_6495[param_00] = 1;
}

//Function Number: 141
lib_A5DA::func_11D8(param_00)
{
	self.var_6495[param_00] = undefined;
}

//Function Number: 142
lib_A5DA::func_11DE(param_00,param_01)
{
	self.var_6495[param_00] = param_01;
}

//Function Number: 143
lib_A5DA::func_11D3(param_00,param_01,param_02)
{
	return param_00 - param_01 / param_02 - param_01;
}

//Function Number: 144
lib_A5DA::func_11B1()
{
	return level.var_55B.var_9EAA;
}

//Function Number: 145
lib_A5DA::func_11B5(param_00)
{
	return lib_A5DA::func_11B1().var_1A04[param_00][0];
}

//Function Number: 146
lib_A5DA::func_11C5()
{
	return self.var_4774.var_6F1E;
}

//Function Number: 147
lib_A5DA::func_11E0(param_00)
{
	self.var_4774.var_6F1E = param_00;
}

//Function Number: 148
lib_A5DA::func_11DA(param_00)
{
	self.var_4224.var_4E83 = param_00;
}

//Function Number: 149
lib_A5DA::func_11BB()
{
	return self.var_4E84;
}

//Function Number: 150
lib_A5DA::func_11BD()
{
	return self.var_6F1E;
}

//Function Number: 151
lib_A5DA::func_11BC()
{
	return lib_A5DA::func_11C4(self.var_6F1E);
}

//Function Number: 152
lib_A5DA::func_11C4(param_00)
{
	var_01 = lib_A5DA::func_11B1();
	return var_01.var_6F1F[param_00];
}

//Function Number: 153
lib_A5DA::func_11BA(param_00,param_01)
{
	var_02 = undefined;
	var_03 = lib_A5DA::func_11B1();
	if(isstring(param_01))
	{
		var_04 = lib_A5DA::func_11C4(param_01);
		if(isdefined(var_04))
		{
			var_02 = var_04.var_4E85[param_00];
		}
	}
	else
	{
		foreach(var_04 in var_04.var_6F1F)
		{
			foreach(var_07 in var_04.var_4E85)
			{
				if(var_07.var_4E84 == param_00)
				{
					var_02 = var_07;
					break;
				}
			}
		}
	}

	return var_02;
}

//Function Number: 154
lib_A5DA::func_11CA()
{
	return self.var_9C70;
}

//Function Number: 155
lib_A5DA::func_11C8()
{
	return self.var_86F8;
}

//Function Number: 156
lib_A5DA::func_11B8()
{
	return self.var_4774.var_35EE;
}

//Function Number: 157
lib_A5DA::func_11B9()
{
	return self.var_4774.var_35F3;
}

//Function Number: 158
lib_A5DA::func_11D9(param_00,param_01)
{
	param_00.var_6498 = param_01;
}

//Function Number: 159
lib_A5DA::func_11B4(param_00)
{
	var_01 = self;
	var_02 = [];
	var_03 = param_00.var_7047;
	var_04 = lib_A5DA::func_11C4(var_03.var_6F1E);
	var_05 = param_00.var_6498;
	if(!isdefined(var_05))
	{
		var_05 = var_03.var_649F;
	}

	foreach(var_07 in var_05)
	{
		if(var_01 lib_A5DA::func_11C2(var_07) == 1)
		{
			var_02[var_07] = var_07;
		}
	}

	return var_02;
}

//Function Number: 160
lib_A5DA::func_11C2(param_00)
{
	var_01 = self;
	var_02 = var_01.var_6497[param_00].var_7047;
	return var_02.var_6499;
}

//Function Number: 161
lib_A5DA::func_11C3(param_00)
{
	var_01 = self;
	var_02 = 0;
	if(isstring(param_00))
	{
		var_03 = var_01.var_6497[param_00].var_7047;
	}
	else
	{
		var_03 = var_01.var_7047;
	}

	var_02 = var_03.var_649B;
	if(!isdefined(var_02))
	{
		var_02 = 0;
	}

	return var_02;
}

//Function Number: 162
lib_A5DA::func_11B7(param_00)
{
	return self.var_3332[param_00];
}

//Function Number: 163
lib_A5DA::func_11CF(param_00,param_01)
{
	var_02 = self;
	var_03 = var_02 lib_A5DA::func_11B7(param_01);
	if(isdefined(var_03.var_3334))
	{
		var_04 = [[ var_03.var_3334 ]](param_00);
	}
	else
	{
		var_04 = function_0246(param_01,var_04.var_3331);
	}

	return var_04;
}

//Function Number: 164
lib_A5DA::func_11E2(param_00)
{
	var_01 = self;
	var_02 = var_01 lib_A5DA::func_11BC();
	var_03 = var_01 lib_A5DA::func_11CA();
	var_04 = param_00.var_7047;
	var_05 = var_02 lib_A5DA::func_11C7(var_04);
	var_06 = var_01.var_889B;
	var_07 = param_00.var_7047.var_35F3;
	var_08 = 1;
	param_00.var_35DC = 0.1 / var_07;
	param_00.var_35DE = 0;
	for(var_09 = 0;var_09 < var_05;var_09++)
	{
		var_0A = var_01 lib_A5DA::func_11C6(var_04,var_09);
		var_0B = spawn("script_origin",var_03.var_2E6);
		var_0B linkto(var_03,"tag_origin",var_06,(0,0,0));
		var_0B scalevolume(0);
		var_0B lib_A5F1::func_8738(var_0A);
		param_00.var_86D3[var_0A] = var_0B;
	}
}

//Function Number: 165
lib_A5DA::func_11EB(param_00)
{
	var_01 = self;
	var_02 = param_00.var_86D3;
	param_00.var_86D3 = [];
	foreach(var_04 in var_02)
	{
		var_04 thread lib_A5DA::func_11EC(param_00.var_7047.var_35F3);
	}
}

//Function Number: 166
lib_A5DA::func_11EC(param_00)
{
	var_01 = self;
	param_00 = max(0.05,lib_A5D2::func_F30(0.05,param_00));
	if(isdefined(var_01))
	{
		var_01 setvolume(0,param_00);
		wait(param_00);
		if(isdefined(var_01))
		{
			var_01 stopsounds();
		}

		wait(0.05);
		if(isdefined(var_01))
		{
			var_01 delete();
		}
	}
}

//Function Number: 167
lib_A5DA::func_9ED3(param_00)
{
	var_01 = self;
	foreach(var_03 in var_01.var_5873)
	{
		var_03 lib_A5DA::func_11AF(param_00);
	}

	foreach(var_06 in var_01.var_6497)
	{
		var_06 lib_A5DA::func_11AF(param_00);
	}
}

//Function Number: 168
lib_A5DA::func_11AF(param_00)
{
	var_01 = self;
	switch(var_01.var_7047.var_D5F)
	{
		case "alias":
			break;

		case "soundevent":
			break;

		case "damb":
			break;
	}
}

//Function Number: 169
lib_A5DA::func_9ED1()
{
	var_00 = self;
	var_01 = var_00.var_5873;
	var_03 = getfirstarraykey(var_01);
	if(isdefined(var_03))
	{
		var_02 = var_01[var_03];
		switch(var_02.var_7047.var_D5F)
		{
			case "alias":
				break;

			case "soundevent":
				break;

			case "damb":
				break;

			default:
				break;
		}
	}
}

//Function Number: 170
lib_A5DA::func_9A22(param_00)
{
	return param_00 * 0.02777778;
}

//Function Number: 171
lib_A5DA::func_A3AA(param_00)
{
	return param_00 * 36;
}

//Function Number: 172
lib_A5DA::func_2B70(param_00)
{
	return param_00 * 0.02777778;
}

//Function Number: 173
lib_A5DA::func_A3A9(param_00)
{
	return param_00 * 36;
}

//Function Number: 174
lib_A5DA::func_11F2()
{
	var_00 = 0;
	if(lib_A5DA::func_11CD() == 0)
	{
		var_00 = self veh_getspeed();
	}

	return var_00;
}