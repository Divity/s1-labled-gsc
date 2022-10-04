/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42340.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 42
 * Decompile Time: 16 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A564::func_5498()
{
	common_scripts\utility::flag_init("boost_added");
	common_scripts\utility::flag_init("no_land_assist_hint");
	common_scripts\utility::flag_init("no_land_assist_force_hint");
	level.var_31D.var_5490["current_height"] = 0;
	level.var_31D.var_5490["player_vel"] = (0,0,0);
	level.var_31D.var_5490["stick_input"] = (0,0,0);
	level.var_31D.var_5490["boost_fuel"] = 1000;
	setdvar("landassist_step1_goal_velocity",20);
	setdvar("landassist_step1_duration",0.25);
	setdvar("landassist_step2_gravity",20);
	setdvar("landassist_step2_duration",0.25);
	setdvar("landassist_step3_gravity",level.var_31D method_84CA() * 0.15);
	setdvar("landassist_do_reduced_damage",1);
	setomnvar("ui_meterhud_enable",1);
	setomnvar("ui_meterhud_ar_and_2d",0);
	setomnvar("ui_meterhud_text",2);
	setomnvar("ui_meterhud_level",1);
	setomnvar("ui_meterhud_toggle",0);
	if(1)
	{
		setdvar("landassist_step1_goal_velocity",10);
		setdvar("landassist_step1_duration",1);
		setdvar("landassist_step2_duration",0.5);
		setdvar("landassist_step2_gravity",100);
	}

	level.var_31D.var_5491 = 0;
	level.var_31D.var_84D9 = 1;
	level.var_31D.var_5490["elevation"] = 0;
	level.var_31D thread lib_A564::func_6EC7();
	level.var_31D thread lib_A564::func_8275();
	lib_A59A::func_764("player_land_assist_hint",&"SEOUL_LANDASSIST_HINT",::lib_A564::func_5495);
	lib_A59A::func_764("player_land_assist_hint_force",&"SEOUL_LANDASSIST_HINT",::lib_A564::func_5496);
}

//Function Number: 2
lib_A564::func_399E()
{
	thread lib_A59A::func_2B49("player_land_assist_hint_force");
}

//Function Number: 3
lib_A564::func_5496()
{
	if(!level.var_31D.var_503A)
	{
		return 1;
	}

	if(level.var_31D.var_5491)
	{
		return 1;
	}

	return 0;
}

//Function Number: 4
lib_A564::func_8275()
{
	var_00 = getentarray("vol_land_assist_reminder","targetname");
	if(var_00.size <= 0)
	{
		return;
	}

	level endon("e3_presentation");
	for(;;)
	{
		foreach(var_02 in var_00)
		{
			if(level.var_31D istouching(var_02) & !level.var_31D.var_5491 & level.var_31D.var_84D9)
			{
				thread lib_A59A::func_2B49("player_land_assist_hint");
				level.var_5493 = var_02;
				while(!level.var_31D.var_5491 && level.var_31D istouching(var_02))
				{
					wait 0.05;
				}
			}

			if(level.var_31D istouching(var_02) && level.var_31D.var_5491 && level.var_31D.var_84D9)
			{
				level notify("land_assist_reminder",var_02);
			}

			wait 0.05;
		}
	}
}

//Function Number: 5
lib_A564::func_5495()
{
	if(!isdefined(level.var_5493))
	{
		return 0;
	}

	if(!level.var_31D.var_5491 && level.var_31D istouching(level.var_5493))
	{
		return 0;
	}

	return 1;
}

//Function Number: 6
lib_A564::func_1EC1()
{
	self waittill("clear_land_assist_process");
	self notify("end_jump_assist");
	level.var_31D method_84CC();
	self notify("kill_land_assist_process");
	self.var_5491 = 0;
	level.var_31D setcandamage(1);
	level.var_31D method_850C(1);
	lib_A564::func_2A81();
}

//Function Number: 7
lib_A564::func_5DB1()
{
	self notify("kill_land_assist_process");
	self endon("kill_land_assist_process");
	self endon("clear_land_assist_process");
	self endon("death");
	self.var_5491 = 1;
	self.var_5523 = 0;
	thread lib_A564::func_1EC1();
	thread lib_A564::func_459C();
	thread lib_A564::func_4586();
	thread lib_A564::func_4585();
	thread lib_A564::func_5DE2();
	thread lib_A564::func_5DD0();
	thread lib_A564::func_5DDA();
	thread lib_A564::func_94A9();
	thread lib_A564::func_94A7();
	thread lib_A564::func_94A8();
	for(;;)
	{
		lib_A564::func_A0A0();
		lib_A564::func_45AA();
		wait 0.05;
	}
}

//Function Number: 8
lib_A564::func_45AA()
{
	self endon("end_jump_assist");
	thread lib_A564::func_1E72();
	lib_A564::func_6C15();
}

//Function Number: 9
lib_A564::func_1E72()
{
}

//Function Number: 10
lib_A564::func_A08D()
{
}

//Function Number: 11
lib_A564::func_A0A0()
{
	level.var_31D endon("death");
	self.var_63BF = self.var_2E6[2];
	var_00 = undefined;
	var_01 = undefined;
	while(level.var_31D isonground())
	{
		var_00 = level.var_31D.var_2E6;
		wait 0.05;
	}

	while(level.var_31D getvelocity()[2] >= -26.6)
	{
		wait 0.05;
	}
}

//Function Number: 12
lib_A564::func_4CFF()
{
	self endon("death");
	self endon("end_jump_assist");
	if(isdefined(level.var_31D.var_549A))
	{
		level.var_31D.var_549A delete();
	}

	waittillframeend;
	if(isdefined(level.var_78A9["player_rig"]) && isdefined(level.var_78A9["player_rig"]["land_assist_legs"]))
	{
		level.var_31D.var_549A = lib_A59A::func_88CB("player_rig");
		level.var_31D.var_549A hide();
		level.var_31D.var_549A.var_41 = level.var_31D method_8036();
		level.var_31D.var_549A method_80A6(level.var_31D,"tag_origin",(32,0,0),(-90,0,0),1);
	}

	for(;;)
	{
		level.var_31D waittill("landassist_button");
		level.var_31D.var_549A show();
		level.var_31D lib_A506::func_C24(level.var_31D.var_549A,"land_assist_legs");
		level.var_31D.var_549A hide();
	}
}

//Function Number: 13
lib_A564::func_6C15()
{
	self endon("death");
	self endon("end_jump_assist");
	level.var_31D method_850C(0);
	var_00 = (0,0,0);
	level.var_31D playersetgroundreferenceent(undefined);
	if(!isdefined(self.var_5499))
	{
		self.var_5499 = common_scripts\utility::spawn_tag_origin();
	}

	var_01 = getdvarfloat("landassist_step3_gravity");
	level.var_31D.var_5492 = 0;
	thread lib_A564::func_6FEE();
	while(!level.var_31D isonground())
	{
		level.var_31D setcandamage(0);
		var_00 = level.var_31D getvelocity();
		var_02 = 0;
		if(level.var_31D.var_5492 == 0)
		{
			level.var_31D.var_5492 = gettime();
		}

		if(lib_A564::func_5042())
		{
			var_03 = 1;
			level.var_31D notify("landassist_button");
			if(var_03)
			{
				var_04 = getdvarfloat("landassist_step1_goal_velocity");
				var_05 = getdvarfloat("landassist_step1_duration");
				var_06 = getdvarfloat("landassist_step2_duration");
				var_07 = getdvarfloat("landassist_step2_gravity");
				var_08 = gettime() + var_05 * 1000;
				var_09 = gettime() + var_05 + var_06 * 1000;
				var_00 = level.var_31D getvelocity();
				var_04 = max(var_04,var_00[2] + 20);
				var_0A = var_04 - var_00[2] / var_05;
				level.var_31D method_84CB(-1 * int(var_0A));
				while(lib_A564::func_5042())
				{
					var_00 = level.var_31D getvelocity();
					if(gettime() > var_08)
					{
						level.var_31D method_84CB(int(var_07));
						if(gettime() > var_09)
						{
							break;
						}
					}

					lib_A564::func_2BD1();
					lib_A564::func_2BBD();
					level.var_31D notify("use_fuel");
					wait 0.05;
					var_02 = 1;
				}
			}

			if(level.var_31D isonground())
			{
				break;
			}

			level.var_31D method_84CB(int(var_01));
			while(lib_A564::func_5042())
			{
				var_00 = level.var_31D getvelocity();
				var_0B = function_00FE(0,gettime() * 0.001 * 0.5,2,2,0.5) * 75;
				var_0C = function_00FE(1,gettime() * 0.001 * 0.5,2,2,0.5) * 10;
				var_0D = function_00FE(2,gettime() * 0.001 * 0.5,2,2,0.5) * 10;
				var_0E = self getnormalizedmovement();
				if(length(var_0E) <= 0.01)
				{
					self setvelocity((var_00[0] * 0.3,var_00[1] * 0.3,var_00[2] + var_0B));
				}
				else
				{
					self setvelocity((var_00[0],var_00[1],var_00[2] + var_0B));
				}

				self.var_5499.var_2E6 = self.var_2E6;
				lib_A564::func_2BBD();
				level.var_31D notify("use_fuel");
				wait 0.05;
				var_02 = 1;
			}
		}

		if(!lib_A564::func_5042())
		{
			level.var_31D method_84CC();
			level notify("snd_boost_land_lp_stop_notify");
		}

		if(!var_02)
		{
			wait 0.05;
		}
	}

	level.var_31D setcandamage(1);
	level.var_31D method_850C(1);
	level.var_31D method_84CC();
	level.var_31D lib_A564::func_2BBA(var_00[2]);
	thread lib_A564::func_27D7(1);
	level notify("snd_boost_land_lp_stop_notify");
	self notify("end_jump_hud");
}

//Function Number: 14
lib_A564::func_749F()
{
	common_scripts\utility::waittill_either("end_jump_assist");
}

//Function Number: 15
lib_A564::func_2BBA(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	var_02 = 0;
	var_03 = lib_A564::func_3D65(param_00);
	if(var_03 > 0)
	{
		var_04 = level.var_31D.health;
		var_02 = level.var_31D dodamage(var_03,self.var_2E6,self,level.var_31D,"MOD_FALLING");
	}

	if(param_01)
	{
		return var_02;
	}

	return var_03;
}

//Function Number: 16
lib_A564::func_6FEE()
{
	self endon("death");
	self endon("end_jump_assist");
	self endon("end_jump_hud");
	var_00 = 1;
	var_01 = 1;
	while(!level.var_31D isonground())
	{
		if(lib_A564::func_5042())
		{
			function_0234(self.var_2E6,2,0.5,0.5,var_00,0.01,0.2,1000,5,3.175,3.125);
			wait(var_00);
			while(lib_A564::func_5042())
			{
				function_0234(self.var_2E6,0.5,0.25,0.25,var_01,0.01,0.2,1000,5,1.175,1.125);
				wait(var_01);
			}

			continue;
		}

		wait 0.05;
	}
}

//Function Number: 17
lib_A564::func_2BD1()
{
	level.var_31D playrumbleonentity("damage_light");
}

//Function Number: 18
lib_A564::func_2BBD()
{
	level.var_31D lib_A5DE::snd_message("boost_land_use_fuel","snd_boost_land_lp_stop_notify");
	if(!isdefined(level.var_31D.var_54A6))
	{
		level.var_31D.var_54A6 = 0;
	}

	level.var_31D.var_54A6++;
	var_00 = anglestoforward(level.var_31D getplayerangles());
	if(level.var_31D.var_54A6 % 5 == 0)
	{
		playfx(common_scripts\utility::getfx("landass_impact_smk_vm"),self.var_5490["ground_location"],var_00);
	}

	if(common_scripts\utility::cointoss())
	{
		var_01 = (self.var_2E6[0],self.var_2E6[1],self.var_2E6[2]);
		playfx(common_scripts\utility::getfx("landass_exhaust_smk_vm"),var_01,var_00);
	}
}

//Function Number: 19
lib_A564::func_5042()
{
	return self usebuttonpressed() && !level.var_31D isonground() && level.var_31D.var_5490["boost_fuel"] > 0 && level.var_31D getvelocity()[2] < -26.6 && gettime() - level.var_31D.var_5523 > 1500;
}

//Function Number: 20
lib_A564::func_27D7(param_00)
{
	level.var_E57.var_1580 = 1;
	self.var_5499 endon("cancel_delete");
	self.var_5499 delete();
}

//Function Number: 21
lib_A564::func_459C()
{
	thread lib_A564::func_30A6();
}

//Function Number: 22
lib_A564::func_3E1A(param_00,param_01,param_02)
{
	return (function_00FE(gettime() * 0.001 * 0.05,10,param_00,param_01,param_02),function_00FE(gettime() * 0.001 * 0.05,20,param_00,param_01,param_02),function_00FE(gettime() * 0.001 * 0.05,30,param_00,param_01,param_02));
}

//Function Number: 23
lib_A564::func_94A9()
{
	self endon("death");
	self endon("end_jump_assist");
	self endon("clear_land_assist_process");
	for(;;)
	{
		self.var_5490["player_vel"] = self getvelocity();
		wait 0.05;
	}
}

//Function Number: 24
lib_A564::func_94A7()
{
	self endon("death");
	self endon("end_jump_assist");
	self endon("clear_land_assist_process");
	for(;;)
	{
		var_00 = playerphysicstrace(self.var_2E6,self.var_2E6 - (0,0,10000),self);
		var_01 = var_00[2];
		self.var_5490["current_height"] = self.var_2E6[2] - var_01;
		self.var_5490["ground_location"] = var_00;
		function_023F(&"update_landassist_elevation",1,int(self.var_5490["current_height"]));
		wait 0.05;
	}
}

//Function Number: 25
lib_A564::func_5DD0()
{
	self endon("death");
	self endon("end_jump_assist");
	self endon("clear_land_assist_process");
	var_00 = 0;
	var_01 = 1;
	var_02 = 2;
	var_03 = 0;
	for(;;)
	{
		var_04 = var_03;
		if(self isonground())
		{
			var_03 = var_00;
			self notify("player_is_on_ground");
		}
		else if(bullettracepassed(self.var_2E6,self.var_2E6 - (0,0,39.56),0,self))
		{
			var_03 = var_02;
		}
		else if(var_04 == var_00)
		{
			var_03 = var_01;
		}

		if(var_04 != var_03)
		{
			if(var_03 == var_02)
			{
				self notify("full_fall");
			}
			else if(var_03 == var_00 && var_04 == var_02)
			{
				self notify("land_after_full_fall");
			}
		}

		wait 0.05;
	}
}

//Function Number: 26
lib_A564::func_5DDA()
{
	for(;;)
	{
		var_00 = level.var_31D common_scripts\utility::waittill_any_return("exo_slide","exo_dodge","ground_slam");
		self.var_5523 = gettime();
	}
}

//Function Number: 27
lib_A564::func_6EC7()
{
	precacheshader("white");
	precacherumble("heavy_1s");
	precacherumble("heavy_2s");
	precachestring(&"update_landassist_fuel_level");
	precachestring(&"update_landassist_elevation");
	lib_A564::func_6EB1();
	level.var_4ACC = spawnstruct();
}

//Function Number: 28
lib_A564::func_5DE2()
{
	level.var_31D notifyonplayercommand("dpad_down","+actionslot 2");
	level.var_31D notifyonplayercommand("dpad_left","+actionslot 3");
	level.var_31D notifyonplayercommand("dpad_right","+actionslot 4");
	level.var_31D notifyonplayercommand("dpad_up","+actionslot 1");
	level.var_31D notifyonplayercommand("a_pressed","+gostand");
	level.var_31D notifyonplayercommand("b_pressed","+stance");
	level.var_31D notifyonplayercommand("y_pressed","weapnext");
	level.var_31D notifyonplayercommand("x_pressed","+usereload");
	level.var_31D notifyonplayercommand("attack_pressed","+attack");
}

//Function Number: 29
lib_A564::func_30A6()
{
	var_00 = level.var_31D.var_5490["boost_fuel"] / 1000;
	level.var_31D setclientomnvar("ui_meterhud_toggle",1);
	level.var_31D setclientomnvar("ui_meterhud_level",var_00);
	level.var_31D lib_A5DE::snd_message("boost_land_hud_enable");
}

//Function Number: 30
lib_A564::func_2A81()
{
	level.var_31D setclientomnvar("ui_meterhud_toggle",0);
	level.var_31D lib_A5DE::snd_message("boost_land_hud_disable");
}

//Function Number: 31
lib_A564::func_3ADD()
{
	var_00 = level.var_31D.var_5490["boost_fuel"] / 1000;
	level.var_31D setclientomnvar("ui_meterhud_level",var_00);
}

//Function Number: 32
lib_A564::func_4E90(param_00,param_01,param_02)
{
	if(param_00 < param_01)
	{
		return param_01;
	}

	if(param_00 > param_02)
	{
		return param_02;
	}

	return param_00;
}

//Function Number: 33
lib_A564::func_4586()
{
	self endon("end_jump_assist");
	self endon("clear_land_assist_process");
	for(;;)
	{
		var_00 = level.var_31D common_scripts\utility::waittill_any_return("use_fuel","player_is_on_ground","death");
		if(!isdefined(var_00) || var_00 == "death")
		{
			return;
		}

		if(var_00 == "player_is_on_ground")
		{
			continue;
		}

		level.var_31D.var_5490["boost_fuel"] = lib_A564::func_4E90(level.var_31D.var_5490["boost_fuel"] - 5,0,1000);
		lib_A564::func_3ADD();
	}

	level.var_31D notify("out_of_boost");
}

//Function Number: 34
lib_A564::func_4585()
{
	level.var_31D endon("end_jump_assist");
	level.var_31D endon("clear_land_assist_process");
	level.var_31D waittill("use_fuel");
	for(;;)
	{
		thread lib_A564::func_3ADC();
		level.var_31D common_scripts\utility::waittill_any("fuel_refresh_time_done","use_fuel");
	}
}

//Function Number: 35
lib_A564::func_3ADC(param_00)
{
	level.var_31D endon("use_fuel");
	wait(5);
	while(level.var_31D.var_5490["boost_fuel"] < 1000)
	{
		level.var_31D.var_5490["boost_fuel"] = lib_A564::func_4E90(level.var_31D.var_5490["boost_fuel"] + 5,0,1000);
		lib_A564::func_3ADD();
		wait 0.05;
	}

	level.var_31D notify("fuel_refresh_time_done");
}

//Function Number: 36
lib_A564::func_6AA6()
{
	var_00 = playerphysicstrace(self.var_2E6,self.var_2E6 - (0,0,5000));
	return var_00[2];
}

//Function Number: 37
lib_A564::func_6AA5()
{
	var_00 = playerphysicstrace(self.var_2E6,self.var_2E6 + (0,0,5000));
	return var_00[2];
}

//Function Number: 38
lib_A564::func_6EB1()
{
	level._effect["landass_exhaust_smk_vm"] = loadfx("vfx/smoke/landass_exhaust_smk_vm");
	level._effect["landass_impact_smk_vm"] = loadfx("vfx/smoke/landass_impact_smk_vm");
}

//Function Number: 39
lib_A564::func_94A8()
{
	self endon("death");
	self endon("clear_land_assist_process");
	for(;;)
	{
		var_00 = self getnormalizedmovement();
		var_00 = (var_00[0],var_00[1] * -1,0);
		var_01 = self.var_41;
		var_02 = vectortoangles(var_00);
		var_03 = common_scripts\utility::flat_angle(combineangles(var_01,var_02));
		var_04 = anglestoforward(var_03) * length(var_00);
		self.var_5490["stick_input"] = var_04;
		wait(0.05);
	}
}

//Function Number: 40
lib_A564::func_26A7()
{
	level.var_52B6 = newhudelem();
	level.var_52B6.x = 300;
	level.var_52B6.y = 0;
	level.var_52B6.var_18C = 1;
	level.var_52B6.alignx = "left";
	level.var_52B6.aligny = "top";
	level.var_52B6.horzalign = "left";
	level.var_52B6.vertalign = "top";
	level.var_52B6.fontscale = 1;
	level.var_52B6 thread lib_A564::func_28C4();
	level.var_3655 = newhudelem();
	level.var_3655.x = 300;
	level.var_3655.y = 10;
	level.var_3655.var_18C = 1;
	level.var_3655.alignx = "left";
	level.var_3655.aligny = "top";
	level.var_3655.horzalign = "left";
	level.var_3655.vertalign = "top";
	level.var_3655.fontscale = 1;
	level.var_3655 thread lib_A564::func_28C4();
	level.var_24DE = newhudelem();
	level.var_24DE.x = 300;
	level.var_24DE.y = 20;
	level.var_24DE.var_18C = 1;
	level.var_24DE.alignx = "left";
	level.var_24DE.aligny = "top";
	level.var_24DE.horzalign = "left";
	level.var_24DE.vertalign = "top";
	level.var_24DE.fontscale = 1;
	level.var_24DE thread lib_A564::func_28C4();
	level.var_3027 = newhudelem();
	level.var_3027.x = 300;
	level.var_3027.y = 30;
	level.var_3027.var_18C = 1;
	level.var_3027.alignx = "left";
	level.var_3027.aligny = "top";
	level.var_3027.horzalign = "left";
	level.var_3027.vertalign = "top";
	level.var_3027.fontscale = 1;
	level.var_3027 thread lib_A564::func_28C4();
	level.var_479A = newhudelem();
	level.var_479A.x = 300;
	level.var_479A.y = 40;
	level.var_479A.var_18C = 1;
	level.var_479A.alignx = "left";
	level.var_479A.aligny = "top";
	level.var_479A.horzalign = "left";
	level.var_479A.vertalign = "top";
	level.var_479A.fontscale = 1;
	level.var_479A thread lib_A564::func_28C4();
}

//Function Number: 41
lib_A564::func_28C4()
{
	level.var_31D common_scripts\utility::waittill_any("death","end_jump_assist","clear_land_assist_process");
	self destroy();
}

//Function Number: 42
lib_A564::func_3D65(param_00,param_01)
{
	var_02 = param_00;
	var_03 = undefined;
	var_04 = param_00 * param_00 / 2 * getdvarfloat("g_gravity");
	var_05 = getdvarfloat("bg_fallDamageMinHeight");
	var_06 = getdvarfloat("bg_fallDamageMaxHeight");
	var_07 = 100;
	var_08 = var_04 - var_05 / var_06 - var_05;
	if(var_04 >= var_06)
	{
		var_03 = var_07;
	}
	else if(var_08 < 0)
	{
		var_03 = 0;
	}
	else
	{
		var_03 = var_08 * var_07;
	}

	if(getdvarint("landassist_do_reduced_damage"))
	{
		if(var_03 > level.var_31D.health - 1 && param_00 > -850)
		{
			var_03 = level.var_31D.health - 1;
		}
	}

	return var_03;
}