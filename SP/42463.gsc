/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42463.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 138
 * Decompile Time: 79 ms
 * Timestamp: 4/20/2022 8:23:44 PM
*******************************************************************/

//Function Number: 1
lib_A5DF::func_86BE()
{
	lib_A5DF::func_72D8();
	lib_A5DF::func_23A6();
	lib_A5DF::func_72E3();
	level.var_6012 = 0;
	level._snd.var_2162 = [["mute",0],["slomo",0],["deathsdoor",0],["underwater",0],["diveboat",0],["bullet_metal_vehicle",0],["bullet_whizby_glass",0],["finale_handgun",0]];
}

//Function Number: 2
lib_A5DF::func_72E3()
{
	level.var_78B6["squelches"]["plt"]["on"] = "squelch_on_plt";
	level.var_78B6["squelches"]["plt"]["off"] = "squelch_off_plt";
	level.var_78B6["squelches"]["hqr"]["on"] = "squelch_on_hqr";
	level.var_78B6["squelches"]["hqr"]["off"] = "squelch_off_hqr";
	level.var_78B6["squelches"]["prophet"]["on"] = "squelch_on_prophet";
	level.var_78B6["squelches"]["prophet"]["off"] = "squelch_off_hqr";
	level.var_78B6["squelches"]["battle_commander"]["on"] = "squelch_on_plt";
	level.var_78B6["squelches"]["battle_commander"]["off"] = "squelch_off_hqr";
	level.var_78B6["squelches"]["cormack_sfa"]["on"] = "squelch_on_plt";
	level.var_78B6["squelches"]["cormack_sfa"]["off"] = "squelch_off_hqr";
}

//Function Number: 3
lib_A5DF::func_23A6()
{
	level._snd.var_3336["explo_shake_over_distance"] = [[0,1],[0.25,0.65],[0.35,0.5],[0.75,0.2],[1,0.1]];
	level._snd.var_3336["veh_crash_intensity_to_pitch"] = [[0,0.7],[0.1,0.7],[0.5,0.8],[0.9,1],[1,1.1]];
	level._snd.var_3336["veh_crash_vel_to_lfe_vol"] = [[0,0],[200,0.05],[500,0.25],[850,0.35],[1000,0.6]];
	level._snd.var_3336["aud_mute_device_falloff"] = [[0,1],[0.1,0.9],[0.2,0.88],[0.3,0.85],[0.4,0.82],[0.5,0.8],[0.6,0.65],[0.7,0.5],[0.8,0.35],[0.9,0.15],[1,0]];
}

//Function Number: 4
lib_A5DF::func_4C70()
{
	if(level.currentgen)
	{
		level._snd.var_B52["exp_generic_explo_shot"] = [["exp_generic_explo_shot_04",0.17],["exp_generic_explo_shot_07",0.11],["exp_generic_explo_shot_10",0.22],["exp_generic_explo_shot_12",0.15],["exp_generic_explo_shot_13",0.08],["exp_generic_explo_shot_20",0.15],["exp_generic_explo_shot_22",0.25]];
		return;
	}

	level._snd.var_B52["exp_generic_explo_shot"] = [["exp_generic_explo_shot_01",0.13],["exp_generic_explo_shot_02",0.25],["exp_generic_explo_shot_03",0.12],["exp_generic_explo_shot_04",0.17],["exp_generic_explo_shot_05",0.16],["exp_generic_explo_shot_06",0.14],["exp_generic_explo_shot_07",0.11],["exp_generic_explo_shot_08",0.21],["exp_generic_explo_shot_09",0.16],["exp_generic_explo_shot_10",0.22],["exp_generic_explo_shot_11",0.13],["exp_generic_explo_shot_12",0.15],["exp_generic_explo_shot_13",0.08],["exp_generic_explo_shot_14",0.16],["exp_generic_explo_shot_16",0.2],["exp_generic_explo_shot_17",0.1],["exp_generic_explo_shot_18",0.08],["exp_generic_explo_shot_19",0.12],["exp_generic_explo_shot_20",0.15],["exp_generic_explo_shot_21",0.15],["exp_generic_explo_shot_22",0.25]];
}

//Function Number: 5
lib_A5DF::func_4CFC()
{
	level._snd.var_4EF.var_8FEC = ["vehicle","wood","metal"];
}

//Function Number: 6
lib_A5DF::func_4CB9()
{
	level._snd.var_1572.var_8FEC = ["ice","asphalt","concrete","metal","metal_solid"];
}

//Function Number: 7
lib_A5DF::func_72D8()
{
	lib_A5DE::snd_register_message("player_death",::lib_A5DF::func_6AC3);
	lib_A5DE::snd_register_message("wpn_deam160_init",::lib_A5DF::func_A350);
	lib_A5DE::snd_register_message("wpn_deam160_charge",::lib_A5DF::func_A34D);
	lib_A5DE::snd_register_message("wpn_deam160_charge_dots_increase",::lib_A5DF::func_A34E);
	lib_A5DE::snd_register_message("wpn_deam160_full_charge",::lib_A5DF::func_A34F);
	lib_A5DE::snd_register_message("wpn_deam160_shot",::lib_A5DF::func_A353);
	lib_A5DE::snd_register_message("variable_grenade_type_switch",::lib_A5DF::func_9C58);
	lib_A5DE::snd_register_message("paint_grenade_detonate",::lib_A5DF::func_6659);
	lib_A5DE::snd_register_message("emp_grenade_detonate",::lib_A5DF::func_306B);
	lib_A5DE::snd_register_message("smart_grenade_detonate",::lib_A5DF::func_865A);
	lib_A5DE::snd_register_message("foam_grenade",::lib_A5DF::func_3938);
	lib_A5DE::snd_register_message("aud_sonar_vision_on",::lib_A5DF::func_1097);
	lib_A5DE::snd_register_message("aud_sonar_vision_off",::lib_A5DF::func_1096);
	lib_A5DE::snd_register_message("explo_ambientExp_dirt",::lib_A5DF::func_351B);
	lib_A5DE::snd_register_message("explo_ambientExp_fireball",::lib_A5DF::func_351C);
	lib_A5DE::snd_register_message("play_vehicle_collision",::lib_A5DF::func_8741);
	lib_A5DE::snd_register_message("boost_jump_enable",::lib_A5DF::func_1575);
	lib_A5DE::snd_register_message("boost_jump_disable",::lib_A5DF::func_1573);
	lib_A5DE::snd_register_message("boost_jump_disable_npc",::lib_A5DF::func_1574);
	lib_A5DE::snd_register_message("boost_jump_player",::lib_A5DF::func_1579);
	lib_A5DE::snd_register_message("boost_land_player",::lib_A5DF::func_1589);
	lib_A5DE::snd_register_message("boost_jump_npc",::lib_A5DF::func_1578);
	lib_A5DE::snd_register_message("boost_land_npc",::lib_A5DF::func_1585);
	lib_A5DE::snd_register_message("pdrone_death_explode",::lib_A5DF::func_6773);
	lib_A5DE::snd_register_message("pdrone_emp_death",::lib_A5DF::func_6777);
	lib_A5DE::snd_register_message("pdrone_crash_land",::lib_A5DF::func_676F);
	lib_A5DE::snd_register_message("doorshield_ripoff",::lib_A5DF::func_2D6A);
	lib_A5DE::snd_register_message("doorshield_throw",::lib_A5DF::func_2D6B);
	lib_A5DE::snd_register_message("exo_raise_shield",::lib_A5DF::func_34D2);
	lib_A5DE::snd_register_message("exo_lower_shield",::lib_A5DF::func_34A5);
	lib_A5DE::snd_register_message("snd_cloak_init",::lib_A5DF::func_86BD);
	lib_A5DE::snd_register_message("exo_cloak_button_press",::lib_A5DF::func_3470);
	lib_A5DE::snd_register_message("exo_cloak_enable",::lib_A5DF::func_3472);
	lib_A5DE::snd_register_message("exo_cloak_disable",::lib_A5DF::func_3471);
	lib_A5DE::snd_register_message("exo_cloak_battery_low",::lib_A5DF::func_346E);
	lib_A5DE::snd_register_message("exo_cloak_battery_dead",::lib_A5DF::func_346D);
	lib_A5DE::snd_register_message("exo_cloak_battery_recharge",::lib_A5DF::func_346F);
	lib_A5DE::snd_register_message("npc_cloak_buttons",::lib_A5DF::func_6243);
	lib_A5DE::snd_register_message("npc_cloak_enable",::lib_A5DF::func_6244);
	lib_A5DE::snd_register_message("npc_cloak_disable",::lib_A5DF::func_6244);
	lib_A5DE::snd_register_message("overdrive_on",::lib_A5DF::func_65E6);
	lib_A5DE::snd_register_message("overdrive_off",::lib_A5DF::func_65E5);
	lib_A5DE::snd_register_message("sonic_blast",::lib_A5DF::func_887B);
	lib_A5DE::snd_register_message("sonic_blast_aftershock",::lib_A5DF::func_887C);
	lib_A5DE::snd_register_message("sonic_blast_done",::lib_A5DF::func_887D);
	lib_A5DE::snd_register_message("exo_stim_on",::lib_A5DF::func_34ED);
	lib_A5DE::snd_register_message("boost_dodge_activate_plr",::lib_A5DF::func_156E);
	lib_A5DE::snd_register_message("boost_land_hud_enable",::lib_A5DF::func_1582);
	lib_A5DE::snd_register_message("boost_land_hud_disable",::lib_A5DF::func_1581);
	lib_A5DE::snd_register_message("boost_land_out_of_fuel",::lib_A5DF::func_1587);
	lib_A5DE::snd_register_message("boost_land_use_fuel",::lib_A5DF::func_158D);
	lib_A5DE::snd_register_message("boost_land_assist_npc",::lib_A5DF::func_157E);
	lib_A5DE::snd_register_message("boost_land_assist_npc_ground",::lib_A5DF::func_157F);
	lib_A5DE::snd_register_message("tracking_grenade_hover",::lib_A5DF::func_94C4);
	lib_A5DE::snd_register_message("tracking_grenade_jump",::lib_A5DF::func_94C5);
	lib_A5DE::snd_register_message("tracking_grenade_strike",::lib_A5DF::func_94C8);
	lib_A5DE::snd_register_message("tracking_grenade_dud",::lib_A5DF::func_94C0);
	lib_A5DE::snd_register_message("tracking_grenade_beep",::lib_A5DF::func_94BE);
	lib_A5DE::snd_register_message("anml_doberman",::lib_A5DF::func_0C90);
	lib_A5DE::snd_register_message("finish_mission_fade",::lib_A5DF::func_3790);
}

//Function Number: 8
lib_A5DF::func_6AC3()
{
	level.var_31D notify("kill_deaths_door_audio");
	lib_A5D4::func_5CF3("deaths_door");
	lib_A5D4::func_5CEF("player_dead");
	lib_A5F1::func_8725("bullet_large_fatal");
}

//Function Number: 9
lib_A5DF::func_A350()
{
	level.var_A34C = 0;
}

//Function Number: 10
lib_A5DF::func_A353(param_00)
{
	var_01 = param_00;
	level.var_A34C = 0;
	switch(var_01)
	{
		case "large":
			break;

		case "medium":
			break;

		case "small":
			break;
	}
}

//Function Number: 11
lib_A5DF::func_A34D(param_00)
{
	var_01 = lib_A5D2::func_289D("wpn_deam160_charge_hi",level.var_31D,"oneshot");
	thread lib_A5DF::func_A352();
	level.var_31D thread lib_A5DF::func_A354();
	level.var_31D thread lib_A5DF::func_A351();
	level waittill("aud_deam160_charge_break");
	if(isdefined(var_01))
	{
		var_01 scalevolume(0,0.05);
	}
}

//Function Number: 12
lib_A5DF::func_A354()
{
	level endon("aud_deam160_charge_break");
	for(;;)
	{
		if(self method_812C() || self isreloading() || self ismeleeing() || self ismantling())
		{
			level notify("aud_deam160_charge_break");
			break;
		}

		wait(0.05);
	}
}

//Function Number: 13
lib_A5DF::func_A351()
{
	level endon("aud_deam160_charge_break");
	for(;;)
	{
		var_00 = function_023C(self getcurrentweapon());
		if(!var_00)
		{
			level notify("aud_deam160_charge_break");
			break;
		}

		wait(0.05);
	}
}

//Function Number: 14
lib_A5DF::func_A352()
{
	level endon("aud_deam160_charge_break");
	var_00 = lib_A5D2::func_289D("wpn_deam160_charge_hi_lp",level.var_31D,"loop","aud_deam160_charge_break");
	var_00 scalevolume(0,0.05);
	wait(2);
	if(isdefined(var_00))
	{
		var_00 scalevolume(1,0.4);
	}
}

//Function Number: 15
lib_A5DF::func_A34E(param_00)
{
	level.var_A34C++;
}

//Function Number: 16
lib_A5DF::func_A34F()
{
	var_00 = lib_A5D2::func_289D("wpn_deam160_full_charge_beep_lp",level.var_31D,"loop","aud_deam160_charge_break");
	level waittill("aud_deam160_charge_break");
}

//Function Number: 17
lib_A5DF::func_9C58(param_00)
{
	level.var_10D3 = param_00;
	lib_A5F1::func_8725("var_grenade_change_type");
}

//Function Number: 18
lib_A5DF::func_6659()
{
	var_00 = self;
	lib_A5F1::func_8728("wpn_paint_grenade_exp",var_00.var_2E6);
}

//Function Number: 19
lib_A5DF::func_306B()
{
	var_00 = self;
	lib_A5F1::func_8728("wpn_emp_grenade_exp",var_00.var_2E6);
}

//Function Number: 20
lib_A5DF::func_865A()
{
	level notify("kill_tracking_loop");
	var_00 = self;
	lib_A5F1::func_8728("wpn_smart_grenade_exp",var_00.var_2E6);
}

//Function Number: 21
lib_A5DF::func_3938(param_00)
{
	lib_A5D4::func_5CEF("foam_grenade_mix",0.5);
	var_01 = self.var_2E6;
	wait(2.1);
	lib_A5D2::func_289D("foam_bomb_equip",param_00);
	wait(1.1);
	lib_A5D2::func_289D("foam_bomb_pin_pull",param_00);
	wait(1.3);
	lib_A5D2::func_289E("foam_bomb_wall_stick",var_01);
	level waittill("vfx_foam_corridor_explode_start");
	lib_A5D2::func_289E("foam_bomb_corridor_exp",var_01);
	wait(2);
	lib_A5D4::func_5CF3("foam_grenade_mix",0.5);
}

//Function Number: 22
lib_A5DF::func_0FD1()
{
	var_00 = self.var_2E6;
	thread lib_A5F1::func_8728("wpn_mw_grenade_exp",var_00);
	var_01 = thread lib_A5F1::func_873A("wpn_mw_grenade_pulse_sweeps_lp",var_00,"mw_nade_death",0.2,0.45);
	var_02 = thread lib_A5F1::func_873A("wpn_mw_grenade_pulse_big_lp",var_00,"mw_nade_death",0.2,0.45);
	self waittill("death");
	thread lib_A5F1::func_8728("wpn_mw_grenade_die",var_00);
	if(isdefined(var_02))
	{
		var_02 scalevolume(0,0.3);
	}

	if(isdefined(var_01))
	{
		var_01 scalevolume(0,0.3);
	}

	wait(0.3);
	if(isdefined(var_02))
	{
		var_02 stopsounds();
	}

	if(isdefined(var_01))
	{
		var_01 stopsounds();
	}
}

//Function Number: 23
lib_A5DF::func_0FD3(param_00)
{
	if(isdefined(param_00))
	{
		thread lib_A5F1::func_8728("wpn_mw_grenade_elect",param_00);
	}
}

//Function Number: 24
lib_A5DF::func_0FD2(param_00)
{
	if(isdefined(param_00))
	{
		param_00 thread lib_A5F1::snd_play_linked("wpn_mw_grenade_elect");
	}
}

//Function Number: 25
lib_A5DF::func_8711(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self endon("death");
	thread lib_A5DF::func_8796();
	thread lib_A5DF::func_8797();
	if(!isdefined(self.var_E57))
	{
		self.var_E57 = spawnstruct();
	}

	self.var_E57.var_6017 = 1;
	self.var_E57.var_6016 = 1;
	if(isdefined(param_02))
	{
		var_06 = param_02;
	}
	else
	{
		var_06 = param_02 + 250;
	}

	level.var_6012 = 1;
	if(isdefined(param_04))
	{
		self.var_E57.var_6015 = 1;
		thread lib_A5ED::func_86D5(param_04,0.5);
	}

	var_07 = 0;
	thread lib_A5DF::func_879C(param_00,param_03,var_07);
	while(isdefined(self.var_E57.var_6017))
	{
		var_08 = distance(self.var_2E6,level.var_31D.var_2E6);
		if(var_08 < param_01)
		{
			if(!isdefined(self.var_E57.var_6019))
			{
				self notify("mute_device_bubble_enter");
				lib_A5D4::func_5CEF(param_00,0.05);
				self.var_E57.var_5869 = lib_A5F1::func_8739("mute_device_active_lp","stop_mute_device_lp",5,3,1);
				self.var_E57.var_6019 = 1;
			}

			lib_A5D4::func_5CF0(param_00,1);
			if(!isdefined(self.var_E57.var_6015) && isdefined(param_04))
			{
				self.var_E57.var_6015 = 1;
				thread lib_A5ED::func_86D5(param_04,0.5);
				if(!isdefined(self.var_E57.var_6013))
				{
					self notify("mute_device_bubble_enter");
					lib_A5F1::func_8729("mute_device_active_enter",0.05);
					self.var_E57.var_6016 = 1;
					thread lib_A5DF::func_879D(self.var_E57.var_6013);
					self.var_E57.var_5869 scalevolume(1,2);
				}
			}

			continue;
		}

		if(var_08 < var_06 && self.var_E57.var_6019 == 1)
		{
			var_09 = var_08 - param_01 / var_06 - param_01;
			clamp(var_09,0,1);
			var_0A = lib_A5DE::func_8702(var_09,level._snd.var_3336["aud_mute_device_falloff"]);
			lib_A5D4::func_5CF0(param_00,var_0A);
			if(isdefined(self.var_E57.var_6015))
			{
				self.var_E57.var_6015 = undefined;
				thread lib_A5ED::func_86D6(1);
				if(!isdefined(self.var_E57.var_6014))
				{
					thread lib_A5DF::func_8799("mute_device_bubble_exit",0.5);
					lib_A5F1::func_8729("mute_device_active_exit",0.05);
					self.var_E57.var_6016 = 0;
					thread lib_A5DF::func_879D(self.var_E57.var_6014);
					self.var_E57.var_5869 scalevolume(0,2);
				}
			}

			continue;
		}

		if(self.var_E57.var_6019 == 1)
		{
			lib_A5D4::func_5CF0(param_00,0);
			if(isdefined(self.var_E57.var_6015))
			{
				wait(0.05);
				self.var_E57.var_6015 = undefined;
				thread lib_A5ED::func_86D6(1);
				self.var_E57.var_5869 scalevolume(0,2);
			}
		}

		wait(0.05);
	}

	level.var_6012 = 0;
}

//Function Number: 26
lib_A5DF::func_8799(param_00,param_01)
{
	var_02 = 0;
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	wait(var_02);
	self notify(param_00);
}

//Function Number: 27
lib_A5DF::func_879C(param_00,param_01,param_02)
{
	self endon("death");
	self endon("turn_off");
	thread lib_A5DF::func_879A(param_00,"death");
	thread lib_A5DF::func_879A(param_00,"turn_off");
	var_03 = 30;
	if(isdefined(param_01))
	{
		var_03 = param_01;
	}

	wait(var_03);
	self notify("complete");
	thread lib_A5DF::func_879B(param_00);
}

//Function Number: 28
lib_A5DF::func_879B(param_00)
{
	if(isdefined(self.var_E57.var_5869))
	{
		level notify("stop_mute_device_lp");
	}

	if(self.var_E57.var_6016)
	{
		thread lib_A5DF::func_8799("mute_device_bubble_exit",0.5);
		thread lib_A5DF::func_8799("mute_device_bubble_off",1);
		if(!isdefined(self.var_E57.var_6014))
		{
			lib_A5F1::func_8729("mute_device_active_exit",0.05);
		}
	}

	self.var_E57.var_6017 = undefined;
	lib_A5D4::func_5CF3(param_00,3);
	self.var_E57.var_6015 = undefined;
	lib_A5ED::func_86D6(3);
}

//Function Number: 29
lib_A5DF::func_879A(param_00,param_01)
{
	self endon("complete");
	var_02 = "death";
	if(isdefined(param_01))
	{
		var_02 = param_01;
	}

	self waittill(var_02);
	thread lib_A5DF::func_879B(param_00);
	self notify("complete");
}

//Function Number: 30
lib_A5DF::func_879D(param_00)
{
	param_00 = 1;
	wait(2);
	param_00 = undefined;
}

//Function Number: 31
lib_A5DF::func_8798(param_00)
{
	self endon("death");
	var_01 = param_00;
}

//Function Number: 32
lib_A5DF::func_8796()
{
	self endon("mute_device_bubble_off");
	while(isdefined(self))
	{
		self waittill("mute_device_bubble_enter");
		lib_A5DF::func_6DA3("mute_breach_distort_vm_enter");
		self waittill("mute_device_bubble_exit");
		lib_A5DF::func_5367("mute_breach_distort_vm_enter");
		lib_A5DF::func_6DA3("mute_breach_distort_vm_exit");
		wait(0.05);
	}
}

//Function Number: 33
lib_A5DF::func_8797()
{
	while(isdefined(self))
	{
		self waittill("mute_device_bubble_off");
		wait(0.05);
	}
}

//Function Number: 34
lib_A5DF::func_6DA3(param_00)
{
	if(isdefined(self) && isdefined(level._effect[param_00]))
	{
		playfxontag(common_scripts\utility::getfx(param_00),self,"tag_origin");
	}
}

//Function Number: 35
lib_A5DF::func_5367(param_00)
{
	if(isdefined(self) && isdefined(level._effect[param_00]))
	{
		killfxontag(common_scripts\utility::getfx(param_00),self,"tag_origin");
	}
}

//Function Number: 36
lib_A5DF::func_1097()
{
	lib_A5D4::func_5CEF("sonar_vision",0.05);
	lib_A5D2::func_289B("sonar_vision_on");
}

//Function Number: 37
lib_A5DF::func_1096()
{
	lib_A5D2::func_289B("sonar_vision_off");
	lib_A5D4::func_5CF3("sonar_vision",1);
}

//Function Number: 38
lib_A5DF::func_6773()
{
	var_00 = self;
	var_01 = var_00.var_2E6;
	while(isdefined(var_00))
	{
		var_01 = var_00.var_2E6;
		wait(0.05);
	}

	lib_A5F1::func_8728("pdrone_exp",var_01);
}

//Function Number: 39
lib_A5DF::func_6777(param_00)
{
	param_00 lib_A5F1::snd_play_linked("pdrone_emp_death");
	param_00 lib_A5F1::snd_play_linked("pdrone_deathspin","kill_drone_deathspin");
}

//Function Number: 40
lib_A5DF::func_676F(param_00)
{
	lib_A5F1::func_8728("pdrone_exp",param_00);
	level notify("kill_drone_deathspin");
}

//Function Number: 41
lib_A5DF::func_2D6A()
{
	lib_A5DF::func_86CD("bullet_metal_vehicle");
	lib_A5D4::func_5CEF("doorshield_rip_player");
	lib_A5F1::func_8729("doorshield_foley_plr",0.15);
	lib_A5F1::func_8729("doorshield_grabs_plr",0.2);
	lib_A5F1::func_8729("doorshield_tension_plr",0.85);
	lib_A5F1::func_8729("doorshield_rip_plr",1.1);
	lib_A5F1::func_8729("doorshield_debris_plr",1.15);
	wait(3);
	lib_A5D4::func_5CF3("doorshield_rip_player");
}

//Function Number: 42
lib_A5DF::func_2D6B()
{
	lib_A5F1::func_8725("exo_throw_start");
	lib_A5DF::func_86C7("bullet_metal_vehicle");
}

//Function Number: 43
lib_A5DF::func_34D2()
{
	lib_A5F1::func_8729("exo_shield_open",0.5);
	lib_A5DF::func_86CD("bullet_metal_vehicle");
}

//Function Number: 44
lib_A5DF::func_34A5()
{
	lib_A5F1::func_8729("exo_shield_close",0.05);
	lib_A5DF::func_86C7("bullet_metal_vehicle");
}

//Function Number: 45
lib_A5DF::func_1575()
{
}

//Function Number: 46
lib_A5DF::func_1573()
{
}

//Function Number: 47
lib_A5DF::func_1574(param_00)
{
	var_01 = param_00;
	lib_A5D2::func_289D("tac_npc_boost_power_dwn",var_01);
}

//Function Number: 48
lib_A5DF::func_1579()
{
	if(!isdefined(level._snd.var_1572))
	{
		level._snd.var_1572 = spawnstruct();
		level._snd.var_1572.var_5041 = 0;
		thread lib_A5DF::func_4CB9();
	}

	var_00 = self;
	if(var_00 == level.var_31D)
	{
		level._snd.var_1572.var_5041 = 1;
	}
}

//Function Number: 49
lib_A5DF::func_1589(param_00)
{
	var_01 = 40;
	var_02 = 10;
	if(!isdefined(level._snd.var_1572))
	{
		level._snd.var_1572 = spawnstruct();
		level._snd.var_1572.var_5041 = 0;
		thread lib_A5DF::func_4CB9();
	}

	var_03 = self;
	if(var_03 == level.var_31D)
	{
		if(level._snd.var_1572.var_5041 == 1)
		{
			var_04 = lib_A5DF::func_878D(param_00,var_01,var_02);
			var_05 = lib_A5DF::func_878C(param_00,var_01,var_02);
			var_06 = "pc_boost_land_" + var_05;
			level._snd.var_1572.var_5041 = 0;
			if(isdefined(level._snd.var_1572.var_52B8))
			{
				lib_A5D2::func_F1C(level._snd.var_1572.var_52B8,0.5);
			}

			if(param_00 < var_02)
			{
				return;
			}

			var_07 = function_0238(var_03.var_2E6 + (0,0,16),var_03.var_2E6 + (0,0,-16),var_03)["surfacetype"];
			var_08 = lib_A5DF::func_86FD(var_07,level._snd.var_1572.var_8FEC);
			if(var_08)
			{
				var_09 = "boost_land_surface_" + var_05 + "_" + var_07;
				return;
			}
		}
	}
}

//Function Number: 50
lib_A5DF::func_878D(param_00,param_01,param_02)
{
	param_00 = clamp(param_00,param_02,param_01);
	var_03 = param_00 / param_01;
	return var_03;
}

//Function Number: 51
lib_A5DF::func_878C(param_00,param_01,param_02)
{
	if(param_00 <= param_02)
	{
		var_03 = "lt";
	}
	else if(param_01 <= param_02)
	{
		var_03 = "med";
	}
	else
	{
		var_03 = "hvy";
	}

	return var_03;
}

//Function Number: 52
lib_A5DF::func_1578()
{
	var_00 = self;
	if(level.script == "recovery")
	{
		lib_A5D2::func_289D("npc_boost_jump_rec",var_00);
		return;
	}

	lib_A5D2::func_289D("npc_boost_jump",var_00);
}

//Function Number: 53
lib_A5DF::func_1585()
{
	var_00 = self;
	if(level.script == "recovery")
	{
		lib_A5D2::func_289D("npc_boost_land_med_rec",var_00);
		return;
	}

	lib_A5D2::func_289D("npc_boost_land_med",var_00);
}

//Function Number: 54
lib_A5DF::func_156E()
{
	level._snd.var_1572.var_5041 = 0;
	if(isdefined(level._snd.var_1572.var_52B8))
	{
		lib_A5D2::func_F1C(level._snd.var_1572.var_52B8,0.5);
	}
}

//Function Number: 55
lib_A5DF::func_1582()
{
	lib_A5F1::func_8725("tac_pc_boost_land_assist_pwrup");
}

//Function Number: 56
lib_A5DF::func_1581()
{
	lib_A5F1::func_8725("tac_pc_boost_land_assist_pwrdown");
}

//Function Number: 57
lib_A5DF::func_158D(param_00)
{
	var_01 = 0.5;
	if(!isdefined(level.var_E57.var_1586))
	{
		level.var_E57.var_1586 = 1;
		thread lib_A5DF::func_1588();
		level.var_31D lib_A5F1::func_873C("tac_pc_boost_land_assist_jet_lp",param_00,0.1,0.2);
		level waittill(param_00);
		var_02 = function_00FD();
		if(!isdefined(level.var_E57.var_158C))
		{
			level.var_E57.var_158C = var_02;
			lib_A5F1::func_8725("tac_pc_boost_land_assist_release");
		}
		else if(var_02 - level.var_E57.var_158C >= var_01 / 0.05)
		{
			level.var_E57.var_158C = var_02;
			lib_A5F1::func_8725("tac_pc_boost_land_assist_release");
		}

		level.var_E57.var_1586 = undefined;
	}
}

//Function Number: 58
lib_A5DF::func_158E()
{
	for(;;)
	{
		var_00 = length(level.var_31D getvelocity());
		iprintlnbold(var_00);
		wait(0.05);
	}
}

//Function Number: 59
lib_A5DF::func_1588()
{
	var_00 = 1000;
	var_01 = 7500;
	var_02 = 500;
	if(!isdefined(level.var_E57.var_1580))
	{
		level.var_E57.var_1580 = 1;
	}

	if(!isdefined(level.var_E57.var_1583))
	{
		level.var_E57.var_1583 = 0;
	}

	var_03 = length(level.var_31D getvelocity());
	if(var_03 >= var_00 || level.var_E57.var_1580 == 1)
	{
		if(level.var_E57.var_1583 == 0)
		{
			thread lib_A5DF::func_1584();
			lib_A5F1::func_8725("tac_pc_boost_land_assist_shot_max");
			level.var_E57.var_1580 = 0;
			return;
		}

		if(level.var_E57.var_1583 == 1)
		{
			lib_A5F1::func_8725("tac_pc_boost_land_assist_shot_sml");
			return;
		}

		return;
	}

	if(var_03 < var_00 && var_03 >= var_02)
	{
		lib_A5F1::func_8725("tac_pc_boost_land_assist_shot_med");
		return;
	}

	if(var_03 < var_01)
	{
		lib_A5F1::func_8725("tac_pc_boost_land_assist_shot_sml");
		return;
	}
}

//Function Number: 60
lib_A5DF::func_1584()
{
	var_00 = 4;
	if(!isdefined(level.var_E57.var_1584))
	{
		level.var_E57.var_1584 = 0;
	}

	for(;;)
	{
		level.var_E57.var_1584 = level.var_E57.var_1584 + 0.1;
		level.var_E57.var_1583 = 1;
		wait(0.1);
		if(level.var_E57.var_1584 > var_00)
		{
			level.var_E57.var_1584 = 0;
			level.var_E57.var_1583 = 0;
			break;
		}
	}
}

//Function Number: 61
lib_A5DF::func_158B()
{
	var_00 = 0.1;
	if(!isdefined(level.var_E57.var_158B))
	{
		level.var_E57.var_158B = 0;
	}

	for(;;)
	{
		level.var_E57.var_158B = level.var_E57.var_158B + 0.1;
		level.var_E57.var_158A = 1;
		wait(0.1);
		if(level.var_E57.var_158B > var_00)
		{
			level.var_E57.var_158B = 0;
			level.var_E57.var_158A = 0;
			break;
		}
	}
}

//Function Number: 62
lib_A5DF::func_157E()
{
	lib_A5F1::snd_play_linked("boost_land_assist_npc");
}

//Function Number: 63
lib_A5DF::func_157F()
{
	lib_A5F1::snd_play_linked("boost_land_assist_npc_ground");
}

//Function Number: 64
lib_A5DF::func_1587()
{
}

//Function Number: 65
lib_A5DF::func_94C4(param_00)
{
	param_00 lib_A5F1::snd_play_linked("track_grenade_hover","kill_tracking_loop");
	param_00 lib_A5F1::func_873C("track_grenade_loop","kill_tracking_loop",undefined,1.2);
	param_00 waittill("death");
	level notify("kill_tracking_loop");
}

//Function Number: 66
lib_A5DF::func_94C5(param_00)
{
	param_00 lib_A5F1::snd_play_linked("track_grenade_jump");
}

//Function Number: 67
lib_A5DF::func_94C8(param_00)
{
	param_00 lib_A5F1::snd_play_linked("track_grenade_strike");
	param_00 notify("kill_tracking_loop");
}

//Function Number: 68
lib_A5DF::func_94C0(param_00)
{
	param_00 lib_A5F1::snd_play_linked("track_grenade_dud");
	level notify("kill_tracking_loop");
}

//Function Number: 69
lib_A5DF::func_94BE(param_00)
{
	param_00 lib_A5F1::snd_play_linked("track_grenade_beep");
}

//Function Number: 70
lib_A5DF::func_0C90(param_00)
{
	var_01 = "anml_doberman_" + param_00;
	if(isdefined(self.var_86EB))
	{
		level notify(self.var_86EB);
	}

	self.var_86EB = "anml_doberman_" + lib_A5DE::func_8712();
	if(param_00 == "death")
	{
		lib_A5F1::func_8728(var_01,self.var_2E6,self.var_86EB,0,0.1);
		return;
	}

	lib_A5F1::snd_play_linked(var_01,self.var_86EB,0,0.15);
}

//Function Number: 71
lib_A5DF::func_3790(param_00)
{
	lib_A5D4::func_5CEF("mute_all",param_00);
}

//Function Number: 72
lib_A5DF::func_86BD()
{
	common_scripts\utility::flag_init("snd_cloak_is_enabled");
}

//Function Number: 73
lib_A5DF::func_3470()
{
	lib_A5D2::func_289B("exo_cloak_buttons");
}

//Function Number: 74
lib_A5DF::func_3472()
{
	if(!common_scripts\utility::flag("snd_cloak_is_enabled"))
	{
		common_scripts\utility::flag_set("snd_cloak_is_enabled");
		lib_A5D2::func_289D("exo_cloak_enable_click",level.var_31D);
		lib_A5D2::func_289D("exo_cloak_enable",level.var_31D);
		lib_A5D2::func_2891("exo_cloak_enable_wide",0.4);
	}

	thread lib_A5DF::func_346E();
}

//Function Number: 75
lib_A5DF::func_3471()
{
	common_scripts\utility::flag_clear("snd_cloak_is_enabled");
	lib_A5D2::func_289D("exo_cloak_enable_click",level.var_31D);
	lib_A5D2::func_289D("exo_cloak_disable",level.var_31D);
	lib_A5D2::func_2891("exo_cloak_disable_wide",0.2);
	wait(1);
	thread lib_A5DF::func_346F();
}

//Function Number: 76
lib_A5DF::func_346E()
{
	level notify("kill_exo_cloak_battery_low");
	level endon("kill_exo_cloak_battery_low");
	var_00 = level.var_571.var_1F9D;
	var_01 = undefined;
	while(common_scripts\utility::flag("snd_cloak_is_enabled"))
	{
		var_02 = level.var_571.var_1F9D;
		if(var_02 <= 0.26 && var_00 > 0.26)
		{
			var_01 = lib_A5D2::func_289D("exo_cloak_battery_low",level.var_31D,"loop","notify_stop_exo_cloak_battery_low");
		}
		else if(var_02 >= 0.26 && var_00 < 0.26)
		{
			level notify("notify_stop_exo_cloak_battery_low");
		}

		var_00 = var_02;
		wait(0.05);
	}

	if(isdefined(var_01))
	{
		var_01 scalevolume(0,0.25);
		wait(0.25);
		level notify("notify_stop_exo_cloak_battery_low");
	}
}

//Function Number: 77
lib_A5DF::func_346D()
{
	common_scripts\utility::flag_clear("snd_cloak_is_enabled");
	lib_A5D2::func_289D("exo_cloak_disable",level.var_31D);
	lib_A5D2::func_2891("exo_cloak_battery_dead",0.25);
	wait(3);
	thread lib_A5DF::func_346F();
}

//Function Number: 78
lib_A5DF::func_346F()
{
	var_00 = lib_A5D2::func_289B("exo_cloak_battery_recharge");
	while(level.var_571.var_1F9D < 1 && !common_scripts\utility::flag("snd_cloak_is_enabled"))
	{
		wait(0.1);
	}

	if(isdefined(var_00))
	{
		var_00 scalevolume(0,0.25);
	}
}

//Function Number: 79
lib_A5DF::func_6243(param_00)
{
	var_01 = self;
	if(param_00 == "cornercrouch_right_cloak_toggle")
	{
		lib_A5D2::func_2893("exo_cloak_npc_buttons",var_01,1);
		lib_A5D2::func_2893("exo_cloak_npc_buttons",var_01,6.5);
		return;
	}

	if(param_00 == "cornercrouch_left_cloak_toggle")
	{
		lib_A5D2::func_2893("exo_cloak_npc_buttons",var_01,1);
		lib_A5D2::func_2893("exo_cloak_npc_buttons",var_01,6.75);
		return;
	}

	lib_A5D2::func_2893("exo_cloak_npc_buttons",var_01,1.2);
	lib_A5D2::func_2893("exo_cloak_npc_buttons",var_01,6.4);
}

//Function Number: 80
lib_A5DF::func_6244()
{
	var_00 = self;
	var_01 = gettime();
	if(var_01 > 1000)
	{
	}
}

//Function Number: 81
lib_A5DF::func_65E6()
{
	level.var_31D method_8518();
	lib_A5DF::func_86CD("slomo");
	lib_A5DD::func_1233(1);
	level.var_31D method_832E("snd_enveffectsprio_level","sewer",1,0.7,1);
	lib_A5DD::func_122C(1);
	lib_A5ED::func_86D5("overdrive",1);
	lib_A5D4::func_5CEF("overdrive",1);
	lib_A5F2::func_8754("overdrive_timescale");
	lib_A5F1::func_8725("overdrive_start",undefined,undefined,0.25);
	lib_A5F1::func_8739("overdrive_loop","kill_overdrive_loop",1,2);
	level.var_31D waittill("death");
	lib_A5D4::func_5CF3("overdrive",2.5);
	level notify("kill_overdrive_loop");
}

//Function Number: 82
lib_A5DF::func_65E5()
{
	lib_A5F1::func_8725("overdrive_stop");
	level notify("kill_overdrive_loop");
	lib_A5D4::func_5CF3("overdrive",2);
	lib_A5F2::func_8754("default");
	level.var_31D method_832F("snd_enveffectsprio_level",1);
	lib_A5DD::func_1233(0);
	lib_A5ED::func_86D6(2);
	lib_A5DD::func_122C(0);
	lib_A5DF::func_86C7("slomo");
	level.var_31D method_8519();
}

//Function Number: 83
lib_A5DF::func_887B()
{
	level.var_E57.var_887E = 1;
	lib_A5D4::func_5CEF("sonic_attack");
	lib_A5F1::func_8725("sonic_attack_shoot");
	lib_A5ED::func_86D5("sonic_attack",0.25);
	wait(1.5);
	lib_A5ED::func_86D6(3);
}

//Function Number: 84
lib_A5DF::func_887C()
{
	if(isdefined(level.var_E57.var_887E) && level.var_E57.var_887E == 1)
	{
		level.var_E57.var_887E = 0;
		return;
	}

	lib_A5F1::func_8725("sonic_attack_aftershock");
}

//Function Number: 85
lib_A5DF::func_887D()
{
	lib_A5D4::func_5CF3("sonic_attack");
}

//Function Number: 86
lib_A5DF::func_34ED()
{
	lib_A5F1::func_8725("stim_activate");
}

//Function Number: 87
lib_A5DF::func_351B(param_00,param_01)
{
	var_02 = spawnstruct();
	var_02.pos = param_00;
	var_02.var_3531 = param_01;
	var_02.var_4C27 = "exp_generic_incoming";
	var_02.var_8A4E = 1;
	var_02.var_2FB0 = "exp_generic_explo_sub_kick";
	var_02.var_2FB2 = 1000;
	var_02.var_351E = 60;
	var_02.var_83A7 = 2000;
	var_02.var_351D = "exp_debris_dirt_chunks";
	var_02.var_4412 = "exp_grnd_zero_stone";
	var_02.var_4413 = 500;
	lib_A5DF::func_86BB(var_02);
}

//Function Number: 88
lib_A5DF::func_351C(param_00)
{
	var_01 = spawnstruct();
	var_01.pos = param_00;
	var_01.var_8A4E = 1;
	var_01.var_2FB0 = "exp_generic_explo_sub_kick";
	var_01.var_2FB2 = 1000;
	var_01.var_351E = 60;
	var_01.var_83A7 = 2000;
	var_01.var_351D = "exp_debris_dirt_chunks";
	var_01.var_4412 = "exp_grnd_zero_stone";
	var_01.var_4413 = 500;
	lib_A5DF::func_86BB(var_01);
}

//Function Number: 89
lib_A5DF::func_86BA(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 0;
	if(isdefined(param_02))
	{
		var_05 = param_02;
	}

	var_06 = 0;
	if(isdefined(param_03))
	{
		var_06 = param_03;
	}

	while(isdefined(self))
	{
		if(var_06)
		{
			var_07 = distance(self.var_2E6,level.var_31D.var_2E6);
		}
		else
		{
			var_07 = distance2d(self.var_2E6,level.var_31D.var_2E6);
		}

		if(var_07 < param_01)
		{
			var_08 = spawn("script_origin",self.var_2E6);
			var_08 linkto(self);
			var_08 playsoundasmaster(param_00,"sounddone");
			var_08 thread lib_A5DF::func_8788(self,param_04);
			var_08 thread lib_A5DF::func_8789();
			var_08 waittill("flyby_ent",var_09);
			if(var_09 == "deathspin")
			{
				var_08 scalevolume(0,0.3);
				wait(0.4);
				var_08 stopsounds();
				var_08 delete();
				return;
			}
			else if(var_09 == "sounddone")
			{
				wait(0.1);
				var_08 delete();
				return;
			}

			continue;
		}

		wait(0.05);
	}
}

//Function Number: 90
lib_A5DF::func_8788(param_00,param_01)
{
	self endon("flyby_ent");
	param_00 waittill("deathspin");
	self notify("flyby_ent","deathspin");
	if(isdefined(param_01))
	{
		var_02 = spawn("script_origin",self.var_2E6);
		var_02 linkto(self);
		var_02 playsoundasmaster(param_01,"sounddone");
		var_02 waittill("sounddone");
		var_02 delete();
	}
}

//Function Number: 91
lib_A5DF::func_8789()
{
	self endon("flyby_ent");
	self waittill("sounddone");
	self notify("flyby_ent","sounddone");
}

//Function Number: 92
lib_A5DF::func_86B9(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B)
{
	self endon("death");
	self endon("deathspin");
	self veh_turnengineoff();
	if(!isdefined(self.audio))
	{
		self.audio = spawnstruct();
	}

	self.audio.var_6F36 = lib_A5DF::func_8784(param_04);
	self.audio.var_392D = 0;
	self.audio.var_392C = 0;
	self.audio.var_264A = 0;
	self.audio.var_CB8 = 1;
	self.audio.var_26A8 = param_0A;
	if(isdefined(param_05))
	{
		thread lib_A5DF::func_8782(param_05,param_0A);
	}

	if(isdefined(param_06))
	{
		var_0C = spawn("script_origin",self.var_2E6);
		var_0C linkto(self);
		thread lib_A5DF::func_8783(var_0C,param_06,param_0A);
	}

	self.audio.var_5C27 = 5;
	if(isdefined(param_07))
	{
		self.audio.var_5C27 = param_07;
	}

	self.audio.var_5C26 = 3;
	if(isdefined(param_08))
	{
		self.audio.var_5C26 = param_08;
	}

	var_0D = 0.05;
	if(isdefined(param_09))
	{
		var_0D = param_09;
	}

	if(isarray(param_01))
	{
		foreach(var_10, var_0F in param_01)
		{
			thread lib_A5DF::func_8787(var_10,var_0F,param_0A);
		}
	}

	if(isarray(param_02))
	{
		while(isdefined(self))
		{
			var_11 = lib_A5DF::func_8784(param_04);
			for(var_12 = 0;var_12 < param_02.size;var_12++)
			{
				if(var_11 < param_02[var_12])
				{
					if(var_12 == 0)
					{
						if(self.audio.var_CB8 && self.audio.var_392D == 0 && self.audio.var_264A == 0)
						{
							var_13 = lib_A5DF::func_8781(param_00,var_12,param_03,param_0A);
							if(isdefined(var_13))
							{
								thread lib_A5DF::func_8785(var_13,var_12);
							}
						}
						else if(var_11 < self.audio.var_6F36)
						{
							self.audio.var_CB8 = 1;
						}
						else
						{
							self.audio.var_CB8 = 0;
						}
					}
					else if(var_11 > self.audio.var_6F36)
					{
						if(self.audio.var_CB8 && self.audio.var_392D == 0 && self.audio.var_392C == 0 && self.audio.var_264A == 0)
						{
							self.audio.var_CB8 = 0;
							var_13 = lib_A5DF::func_8781(param_00,var_12,param_03,param_0A);
							if(isdefined(var_13))
							{
								thread lib_A5DF::func_8785(var_13,var_12);
							}
						}
					}
					else
					{
						self.audio.var_CB8 = 1;
					}

					break;
				}
			}

			self.audio.var_6F36 = var_11;
			wait(var_0D);
		}
	}
}

//Function Number: 93
lib_A5DF::func_8787(param_00,param_01,param_02)
{
	self endon("death");
	self endon("deathspin");
	wait(param_01);
	thread lib_A5DF::func_8785(param_00);
}

//Function Number: 94
lib_A5DF::func_8784(param_00)
{
	var_01 = 0;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	if(var_01)
	{
		var_02 = distance(self.var_2E6,level.var_31D.var_2E6);
	}
	else
	{
		var_02 = distance2d(self.var_2E6,level.var_31D.var_2E6);
	}

	return var_02;
}

//Function Number: 95
lib_A5DF::func_8781(param_00,param_01,param_02,param_03)
{
	var_04 = 0;
	var_05 = self veh_getvelocity();
	var_06 = length(var_05) * 0.05681818;
	if(var_06 > 5)
	{
		if(isarray(param_02))
		{
			var_07 = level.var_31D getvelocity();
			var_08 = var_05 - var_07;
			var_09 = length(var_08) * 0.05681818;
			for(var_0A = 0;var_0A < param_02.size;var_0A++)
			{
				var_04 = var_0A + 1;
				if(var_09 > param_02[var_0A])
				{
					var_04 = var_0A;
					break;
				}
			}
		}

		if(var_04 == 0)
		{
			var_0B = "fast";
		}
		else if(var_05 == 1)
		{
			var_0B = "med";
		}
		else
		{
			var_0B = "slow";
		}

		if(param_01 == 0)
		{
			var_0C = "close";
		}
		else if(param_02 == 1)
		{
			var_0C = "mid";
		}
		else if(param_02 == 2)
		{
			var_0C = "far";
		}
		else
		{
			return undefined;
		}

		var_0D = param_00 + "_" + var_0B + "_" + var_0C;
		if(param_01 == 0)
		{
			self.audio.var_392D = 1;
		}
		else
		{
			self.audio.var_392C = 1;
		}

		return var_0D;
	}

	return undefined;
}

//Function Number: 96
lib_A5DF::func_8785(param_00,param_01)
{
	thread lib_A5DF::func_8786(param_01);
	var_02 = lib_A5D2::func_289D(param_00,self);
	thread lib_A5DF::func_8780(var_02,"deathspin");
}

//Function Number: 97
lib_A5DF::func_8782(param_00,param_01)
{
	self endon("crash_done");
	self waittill("deathspin");
	var_02 = lib_A5D2::func_289D(param_00,self);
	thread lib_A5DF::func_8780(var_02,"crash_done");
}

//Function Number: 98
lib_A5DF::func_8783(param_00,param_01,param_02)
{
	self waittill("crash_done");
	var_03 = spawn("script_origin",param_00.var_2E6);
	var_03 lib_A5F1::func_8724(param_01,"sounddone");
	var_03 waittill("sounddone");
	var_03 delete();
}

//Function Number: 99
lib_A5DF::func_8786(param_00)
{
	if(isdefined(param_00))
	{
		if(param_00 == 0)
		{
			wait(self.audio.var_5C27);
			if(isdefined(self))
			{
				self.audio.var_392D = 0;
				return;
			}

			return;
		}

		wait(self.audio.var_5C26);
		if(isdefined(self))
		{
			self.audio.var_392C = 0;
			return;
		}
	}
}

//Function Number: 100
lib_A5DF::func_8780(param_00,param_01,param_02)
{
	self waittill(param_01);
	if(isdefined(param_00))
	{
		var_03 = 0.3;
		if(isdefined(param_02))
		{
			var_03 = param_02;
		}

		param_00 scalevolume(0,var_03);
		wait(var_03);
		if(isdefined(param_00))
		{
			param_00 stopsounds();
			wait(0.1);
			if(isdefined(param_00))
			{
				param_00 delete();
				return;
			}
		}
	}
}

//Function Number: 101
lib_A5DF::func_86BB(param_00)
{
	var_01 = lib_A5DF::func_878A(param_00);
	thread lib_A5DF::func_878B(var_01);
}

//Function Number: 102
lib_A5DF::func_878A(param_00)
{
	if(!isdefined(level._snd.var_B52))
	{
		lib_A5DF::func_4C70();
	}

	if(!isdefined(param_00.var_351F))
	{
		param_00.var_351F = level._snd.var_B52["exp_generic_explo_shot"];
		if(!isdefined(param_00.var_3520))
		{
			param_00.var_3520 = "exp_generic_explo_tail";
		}
	}

	if(isdefined(param_00.var_2FB0))
	{
		if(isdefined(param_00.var_2FB2))
		{
			param_00.var_2FB2 = max(param_00.var_2FB2,0);
		}
		else
		{
			param_00.var_2FB2 = 1000;
		}
	}

	if(isdefined(param_00.var_351E))
	{
		param_00.var_351E = max(param_00.var_351E,0);
	}
	else
	{
		param_00.var_351E = 50;
	}

	if(isdefined(param_00.var_83A7))
	{
		param_00.var_83A7 = max(param_00.var_83A7,0);
	}

	if(!isdefined(param_00.var_83AA))
	{
		param_00.var_83AA = level._snd.var_3336["explo_shake_over_distance"];
	}

	if(isdefined(param_00.var_83A9))
	{
		param_00.var_83A9 = max(param_00.var_83A9,0);
	}
	else
	{
		param_00.var_83A9 = 0.5;
	}

	if(isdefined(param_00.var_4412))
	{
		if(isdefined(param_00.var_4413))
		{
			param_00.var_4413 = max(param_00.var_4413,0);
		}
		else
		{
			param_00.var_4413 = 500;
		}
	}

	return param_00;
}

//Function Number: 103
lib_A5DF::func_878B(param_00)
{
	var_01 = param_00.pos;
	var_02 = param_00.var_3531;
	var_03 = param_00.var_4C27;
	var_04 = param_00.var_8A4E;
	var_05 = param_00.var_351F;
	var_06 = param_00.var_2FB0;
	var_07 = param_00.var_2FB2;
	var_08 = param_00.var_351E;
	var_09 = param_00.var_3520;
	var_0A = param_00.var_83A7;
	var_0B = param_00.var_83AA;
	var_0C = param_00.var_83A9;
	var_0D = param_00.var_351D;
	var_0E = param_00.var_4412;
	var_0F = param_00.var_4413;
	var_10 = distance(level.var_31D.var_2E6,var_01);
	if(isdefined(var_04) && var_04 == 1)
	{
		var_11 = var_10 * 8.333333E-05;
		wait(var_11);
	}

	if(isdefined(var_02))
	{
		if(isdefined(var_03))
		{
			common_scripts\utility::play_sound_in_space(var_03,var_01);
		}

		common_scripts\_exploder::exploder(var_02);
	}

	var_12 = randomint(var_05.size);
	var_13 = var_05[var_12];
	var_14 = var_13[0];
	thread common_scripts\utility::play_sound_in_space(var_14,var_01);
	if(isdefined(var_06))
	{
		if(var_10 < var_07)
		{
			thread common_scripts\utility::play_sound_in_space(var_06,var_01);
		}
	}

	var_15 = var_13[1];
	if(isdefined(var_15))
	{
		if(lib_A5D2::func_FE9(var_08))
		{
			wait(var_15);
		}
	}

	if(isdefined(var_09))
	{
		thread common_scripts\utility::play_sound_in_space(var_09,var_01);
	}

	if(isdefined(var_0A))
	{
		if(var_10 < var_0A)
		{
			var_16 = var_10 / var_0A;
			var_17 = lib_A5D2::func_289A(var_16,var_0B);
			earthquake(var_17,var_0C,level.var_31D.var_2E6,var_0A);
		}
	}

	if(isdefined(var_0D))
	{
		thread common_scripts\utility::play_sound_in_space(var_0D,var_01);
	}

	if(isdefined(var_0E) && var_10 < var_0F)
	{
		thread common_scripts\utility::play_sound_in_space(var_0E,var_01);
	}
}

//Function Number: 104
lib_A5DF::func_86ED(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = param_00 + "_" + param_01 + "_" + param_02;
	if(isdefined(param_04))
	{
		var_06 = lib_A5D2::func_289D(var_05,param_04,undefined,undefined,undefined,undefined,param_03);
	}
	else
	{
		var_06 = lib_A5D2::func_289E(var_06,param_04);
	}

	return var_06;
}

//Function Number: 105
lib_A5DF::func_8741(param_00,param_01,param_02)
{
	var_03 = param_00["vehicle"];
	var_04 = var_03 lib_A5DF::func_87B3(param_00,param_01,param_02);
	var_03 thread lib_A5DF::func_87B2(var_04);
}

//Function Number: 106
lib_A5DF::func_87B3(param_00,param_01,param_02)
{
	if(!isdefined(self.audio))
	{
		self.audio = spawnstruct();
	}

	if(!isarray(param_01))
	{
		param_01 = [];
	}

	self.audio.var_2673 = lib_A5D2::func_F30(0,param_01["Debug"]);
	self.audio.var_9D6C = lib_A5D2::func_F30("veh_impact",param_01["VehicleID"]);
	self.audio.var_706A = lib_A5D2::func_F30(25,param_01["PV_MinVelocityThreshold"]);
	self.audio.var_7069 = lib_A5D2::func_F30(1000,param_01["PV_MaxVelocity"]);
	self.audio.var_706B = lib_A5D2::func_F30(3,param_01["PV_NumVelocityRanges"]);
	self.audio.var_7068 = lib_A5D2::func_F30(100,param_01["PV_MaxSmlVelocity"]);
	self.audio.var_7067 = lib_A5D2::func_F30(600,param_01["PV_MaxMedVelocity"]);
	self.audio.var_7066 = lib_A5D2::func_F30(1000,param_01["PV_MaxLrgVelocity"]);
	self.audio.var_624A = lib_A5D2::func_F30(25,param_01["NPC_MinVelocityThreshold"]);
	self.audio.var_6249 = lib_A5D2::func_F30(800,param_01["NPC_MaxVelocity"]);
	self.audio.var_624B = lib_A5D2::func_F30(3,param_01["NPC_NumVelocityRanges"]);
	self.audio.var_6248 = lib_A5D2::func_F30(100,param_01["NPC_MaxSmlVelocity"]);
	self.audio.var_6247 = lib_A5D2::func_F30(400,param_01["NPC_MaxMedVelocity"]);
	self.audio.var_6246 = lib_A5D2::func_F30(800,param_01["NPC_MaxLrgVelocity"]);
	self.audio.var_5C7E = lib_A5D2::func_F30(0,param_01["MinLFEVolumeThreshold"]);
	self.audio.var_3667 = lib_A5D2::func_F30(2,param_01["FallVelMultiplier"]);
	self.audio.var_5C86 = lib_A5D2::func_F30(250,param_01["MinTimeThreshold"]);
	self.audio.var_937E = lib_A5D2::func_F30(35,param_01["TireSkidProbability"]);
	self.audio.var_5A2F = lib_A5D2::func_F30(6000,param_01["MaxDistanceThreshold"]);
	self.audio.var_5B2B = lib_A5D2::func_F30(0.1,param_01["MedVolMin"]);
	self.audio.var_58AC = lib_A5D2::func_F30(0.3,param_01["LrgVolMin"]);
	self.audio.var_6151 = lib_A5D2::func_F30(0,param_01["NonPlayerImpVolReduction"]);
	if(!isdefined(self.audio.var_6F3D))
	{
		self.audio.var_6F3D = 0;
	}

	if(!isdefined(level._snd.var_4EF))
	{
		level._snd.var_4EF = spawnstruct();
		lib_A5DF::func_4CFC();
		level._snd.var_4EF.var_5077 = 0;
		level._snd.var_4EF.var_7910 = lib_A5D2::func_F30(1,param_01["ScrapeEnabled"]);
		level._snd.var_4EF.var_7912 = lib_A5D2::func_F30(0.5,param_01["ScrapeSeperationTime"]);
		level._snd.var_4EF.var_7911 = lib_A5D2::func_F30(0.5,param_01["ScrapeFadeOutTime"]);
		level._snd.var_4EF.var_7913 = lib_A5D2::func_F30(0.05,param_01["ScrapeUpdateRate"]);
	}

	if(param_00["surface"] == "none")
	{
		param_00["surface"] = "vehicle";
	}

	var_03 = level._snd.var_4EF.var_8FEC;
	if(isdefined(param_02))
	{
		var_03 = param_02;
	}

	if(!lib_A5DF::func_86FD(param_00["surface"],var_03))
	{
		param_00["surface"] = "default";
	}

	return param_00;
}

//Function Number: 107
lib_A5DF::func_87B2(param_00)
{
	var_01 = self;
	var_02 = param_00["hit_entity"];
	var_03 = param_00["pos"];
	var_04 = param_00["impulse"];
	var_05 = param_00["relativeVel"];
	var_06 = param_00["surface"];
	var_07 = (var_05[0],var_05[1],0);
	var_08 = length(var_07);
	var_09 = abs(var_05[2]) * self.audio.var_3667;
	var_0A = distance(var_03,level.var_31D.var_2E6);
	var_0B = gettime();
	var_0C = var_0B - self.audio.var_6F3D;
	var_0D = undefined;
	var_0E = undefined;
	var_0F = 0;
	if(isdefined(level.var_31D.var_2E17))
	{
		var_0D = level.var_31D.var_2E17;
		if((isdefined(var_02) && var_02 == var_0D) || var_01 == var_0D)
		{
			var_0E = var_0D;
			var_0F = 1;
			if(level._snd.var_4EF.var_5077)
			{
				thread lib_A5DF::func_87BD();
			}
		}
	}

	if(var_0A < self.audio.var_5A2F && var_08 > self.audio.var_706A)
	{
		var_08 = clamp(var_08,0,self.audio.var_7069);
		var_09 = clamp(var_09,0,self.audio.var_7069);
		var_10 = var_08;
		if(var_09 > var_08)
		{
			var_10 = var_09;
		}

		if(var_0F)
		{
			var_11 = lib_A5DF::func_87B8(var_10,self.audio.var_7068,self.audio.var_7067);
			var_12 = lib_A5DF::func_87B9(var_10,self.audio.var_7068,self.audio.var_7067,self.audio.var_7066);
			var_13 = "PV-IMPACT";
		}
		else
		{
			var_11 = lib_A5DF::func_87B8(var_13,self.audio.var_6248,self.audio.var_6247);
			var_12 = lib_A5DF::func_87B9(var_12,self.audio.var_6248,self.audio.var_6247,self.audio.var_6246);
			var_13 = "NPC-IMPACT";
			if(var_11 == "sml")
			{
				return;
			}

			clamp(var_12,self.audio.var_6151,1);
			var_12 = var_12 - self.audio.var_6151;
		}

		if(var_0C < self.audio.var_5C86)
		{
			if(var_11 == "sml")
			{
				return;
			}

			if(!var_0F)
			{
				return;
			}
		}

		self.audio.var_6F3D = var_0B;
		if(var_0F)
		{
			if(level._snd.var_4EF.var_7910)
			{
				if(var_0C <= self.audio.var_5C86)
				{
					level._snd.var_4EF.var_790E = var_03;
					if(!level._snd.var_4EF.var_5077)
					{
						thread lib_A5DF::func_87BC(var_0D);
					}
					else
					{
						return;
					}
				}
				else if(level._snd.var_4EF.var_5077)
				{
					lib_A5DF::func_87BE();
				}
			}
		}

		if(isdefined(var_0D) && var_01 != var_0D)
		{
			if(randomint(100) < self.audio.var_937E)
			{
				lib_A5D2::func_289E("vehicle_tire_skid",var_03);
			}
		}

		var_14 = lib_A5D2::func_289A(var_12,level._snd.var_3336["veh_crash_intensity_to_pitch"]);
		var_15 = lib_A5DF::func_86ED(self.audio.var_9D6C,var_06,var_11,var_03,var_0E);
		var_15 scalevolume(var_12,0.1);
		var_15 scalepitch(var_14,0.1);
		if(var_0F && var_11 != "sml")
		{
			var_16 = lib_A5D2::func_289A(var_10,level._snd.var_3336["veh_crash_vel_to_lfe_vol"]);
			if(var_16 > self.audio.var_5C7E)
			{
				var_17 = lib_A5DF::func_86ED(self.audio.var_9D6C,var_06,"lfe",var_03);
				var_17 scalevolume(var_16,0.1);
				return;
			}
		}
	}
}

//Function Number: 108
lib_A5DF::func_87B8(param_00,param_01,param_02)
{
	if(param_00 <= param_01)
	{
		var_03 = "sml";
	}
	else if(param_01 <= var_03)
	{
		var_03 = "med";
	}
	else
	{
		var_03 = "lrg";
	}

	return var_03;
}

//Function Number: 109
lib_A5DF::func_87B9(param_00,param_01,param_02,param_03)
{
	if(param_00 <= param_01)
	{
		var_04 = param_00 / param_01;
	}
	else if(param_01 <= self.audio.var_7067)
	{
		var_04 = param_01 / param_03;
		if(var_04 < self.audio.var_5B2B)
		{
			var_04 = self.audio.var_5B2B;
		}
	}
	else
	{
		var_04 = param_01 / var_04;
		if(var_04 < self.audio.var_58AC)
		{
			var_04 = self.audio.var_58AC;
		}
	}

	return var_04;
}

//Function Number: 110
lib_A5DF::func_87BC(param_00)
{
	level._snd.var_4EF.var_5077 = 1;
	level endon("aud_stop_vehicle_scraping");
	while(level._snd.var_4EF.var_5077)
	{
		if(isdefined(param_00))
		{
			var_01 = param_00.var_2E6;
			if(isdefined(level._snd.var_4EF.var_790E))
			{
				var_01 = level._snd.var_4EF.var_790E;
			}

			var_02 = param_00.audio.var_9D6C + "_scrape";
			var_03 = lib_A5D2::func_289D(var_02,param_00,undefined,undefined,undefined,undefined,var_01);
			if(!isdefined(level._snd.var_4EF.var_790F))
			{
				level._snd.var_4EF.var_790F = [];
			}

			level._snd.var_4EF.var_790F[level._snd.var_4EF.var_790F.size] = var_03;
		}

		wait(0.05);
		wait(level._snd.var_4EF.var_7912);
	}
}

//Function Number: 111
lib_A5DF::func_87BD()
{
	level notify("aud_vehicle_collision_scrape_timer_reset");
	level endon("aud_vehicle_collision_scrape_timer_reset");
	wait(level._snd.var_4EF.var_7913);
	waittillframeend;
	lib_A5DF::func_87BE();
}

//Function Number: 112
lib_A5DF::func_87BE(param_00)
{
	var_01 = level._snd.var_4EF.var_7911;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	level notify("aud_stop_vehicle_scraping");
	level._snd.var_4EF.var_5077 = 0;
	if(isdefined(level._snd.var_4EF.var_790F))
	{
		for(var_02 = 0;var_02 < level._snd.var_4EF.var_790F.size;var_02++)
		{
			if(isdefined(level._snd.var_4EF.var_790F[var_02]))
			{
				var_03 = level._snd.var_4EF.var_790F[var_02];
				thread lib_A5D2::func_F1C(var_03,var_01);
			}
		}

		level._snd.var_4EF.var_790F = undefined;
	}
}

//Function Number: 113
lib_A5DF::func_87BB(param_00,param_01,param_02,param_03)
{
	if(self.audio.var_2673)
	{
		if(!isdefined(param_01))
		{
			param_01 = "-";
		}

		if(!isdefined(param_02))
		{
			param_02 = "-";
		}

		if(!isdefined(param_03))
		{
			param_03 = "-";
		}

		if(self.audio.var_65C6)
		{
			if(isdefined(param_00))
			{
				return;
			}

			return;
		}
	}
}

//Function Number: 114
lib_A5DF::func_87BA(param_00,param_01,param_02,param_03)
{
	if(self.audio.var_2673)
	{
		if(!isdefined(param_00))
		{
			param_00 = "-";
		}

		if(!isdefined(param_01))
		{
			param_01 = "-";
		}

		if(!isdefined(param_02))
		{
			param_02 = "-";
		}

		if(!isdefined(param_03))
		{
			param_03 = "-";
		}
	}
}

//Function Number: 115
lib_A5DF::func_87B7()
{
	lib_A5D4::func_5CEF("impact_system_solo");
}

//Function Number: 116
lib_A5DF::func_87B4()
{
	lib_A5D4::func_5CF3("impact_system_solo");
}

//Function Number: 117
lib_A5DF::func_87B5()
{
	if(isdefined(self.audio.var_4E7E))
	{
		self.audio.var_65C6 = 1;
	}
}

//Function Number: 118
lib_A5DF::func_87B6()
{
	if(isdefined(self.audio.var_4E7E))
	{
		self.audio.var_65C6 = 0;
	}
}

//Function Number: 119
lib_A5DF::func_86FD(param_00,param_01)
{
	var_02 = 0;
	for(var_03 = 0;var_03 < param_01.size;var_03++)
	{
		if(param_00 == param_01[var_03])
		{
			var_02 = 1;
			break;
		}
	}

	return var_02;
}

//Function Number: 120
lib_A5DF::func_86CB(param_00,param_01,param_02,param_03)
{
	level.var_31D notifyonplayercommand("dpad_action_01","+actionslot 1");
	level.var_31D notifyonplayercommand("dpad_action_02","+actionslot 2");
	level.var_31D notifyonplayercommand("dpad_action_03","+actionslot 3");
	level.var_31D notifyonplayercommand("dpad_action_04","+actionslot 4");
	thread lib_A5DF::func_8791("dpad_action_01",param_00);
	thread lib_A5DF::func_8791("dpad_action_02",param_01);
	thread lib_A5DF::func_8791("dpad_action_03",param_02);
	thread lib_A5DF::func_8791("dpad_action_04",param_03);
}

//Function Number: 121
lib_A5DF::func_8791(param_00,param_01)
{
	if(isdefined(param_00))
	{
		for(;;)
		{
			level.var_31D waittill(param_00);
			if(isdefined(param_01))
			{
				thread [[ param_01 ]]();
			}

			wait(0.05);
		}
	}
}

//Function Number: 122
lib_A5DF::func_877C(param_00,param_01,param_02)
{
	var_03 = 0;
	param_01 = lib_A5D2::func_F30(1,param_01);
	param_02 = lib_A5D2::func_F30(0.1,param_02);
	while(isdefined(self) && !var_03)
	{
		if(param_01)
		{
			if(distance(self.var_2E6,level.var_31D.var_2E6) < param_00)
			{
				var_03 = 1;
			}

			continue;
		}

		if(distance2d(self.var_2E6,level.var_31D.var_2E6) < param_00)
		{
			var_03 = 1;
		}

		wait(param_02);
	}

	return var_03;
}

//Function Number: 123
lib_A5DF::func_8713(param_00,param_01,param_02,param_03)
{
	thread lib_A5DF::func_879E(param_00,param_01,param_02);
}

//Function Number: 124
lib_A5DF::func_879E(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A5DF::func_877C(param_01,param_02,param_03);
	level notify(param_00,var_04);
}

//Function Number: 125
lib_A5DF::func_86C2(param_00,param_01,param_02)
{
}

//Function Number: 126
lib_A5DF::func_86C4(param_00,param_01)
{
}

//Function Number: 127
lib_A5DF::func_86C3(param_00)
{
}

//Function Number: 128
lib_A5DF::func_878E(param_00,param_01,param_02,param_03)
{
}

//Function Number: 129
lib_A5DF::func_8790(param_00,param_01)
{
}

//Function Number: 130
lib_A5DF::func_878F(param_00)
{
}

//Function Number: 131
lib_A5DF::func_86C1(param_00,param_01)
{
}

//Function Number: 132
lib_A5DF::func_877A(param_00)
{
	for(;;)
	{
		var_01 = function_00D6("axis");
		foreach(var_03 in var_01)
		{
			if(var_03 method_8410())
			{
				if(isstring(param_00))
				{
					level notify(param_00);
				}

				return;
			}
		}

		wait(0.2);
	}
}

//Function Number: 133
lib_A5DF::func_877B(param_00)
{
	for(;;)
	{
		var_01 = function_00D6("axis");
		foreach(var_03 in var_01)
		{
			if(var_03 method_81BE(level.var_31D))
			{
				if(isstring(param_00))
				{
					level notify(param_00);
				}

				return;
			}
		}

		wait(0.2);
	}
}

//Function Number: 134
lib_A5DF::func_86D1()
{
	var_00 = 0;
	var_01 = function_00D6("axis");
	foreach(var_03 in var_01)
	{
		if(var_03 method_81BE(level.var_31D))
		{
			var_00 = 1;
			break;
		}
	}

	return var_00;
}

//Function Number: 135
lib_A5DF::func_86E3()
{
	var_00 = 0;
	var_01 = function_00D6("axis");
	foreach(var_03 in var_01)
	{
		if(var_03 method_8410())
		{
			var_00 = var_00 + 1;
		}
	}

	return var_00;
}

//Function Number: 136
lib_A5DF::func_065E()
{
	foreach(var_01 in level._snd.var_2162)
	{
		if(var_01[1])
		{
			function_0289(var_01[0]);
			return;
		}
	}

	function_028A();
}

//Function Number: 137
lib_A5DF::func_86CD(param_00)
{
	foreach(var_03, var_02 in level._snd.var_2162)
	{
		if(var_02[0] == param_00)
		{
			level._snd.var_2162[var_03][1] = 1;
			lib_A5DF::func_065E();
			return;
		}
	}

	lib_A5D2::func_102B("Trying to enable override sound context that was not configured: " + param_00);
}

//Function Number: 138
lib_A5DF::func_86C7(param_00)
{
	foreach(var_03, var_02 in level._snd.var_2162)
	{
		if(var_02[0] == param_00)
		{
			level._snd.var_2162[var_03][1] = 0;
			lib_A5DF::func_065E();
			return;
		}
	}

	lib_A5D2::func_102B("Trying to disable override sound context that was not configured: " + param_00);
}