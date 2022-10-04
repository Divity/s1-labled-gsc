/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42570.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 51
 * Decompile Time: 35 ms
 * Timestamp: 4/20/2022 8:23:51 PM
*******************************************************************/

//Function Number: 1
lib_A64A::func_5095()
{
	return !lib_A59A::is_gen4();
}

//Function Number: 2
lib_A64A::main(param_00,param_01,param_02)
{
	var_03 = 0;
	if(issubstr(param_02,"_stealth"))
	{
		var_03 = 1;
		if(issubstr(param_02,"_stealth_col"))
		{
			precachemodel("vehicle_xh9_warbird_cloaked_mp");
		}
	}

	if(issubstr(param_02,"_stealth_low"))
	{
		level.var_1FAF = 1;
		precachemodel("vehicle_xh9_warbird_low_cloak");
	}

	if(issubstr(param_02,"_atlas_desert"))
	{
		precachemodel("vehicle_xh9_warbird_desert");
	}

	var_04 = 0;
	var_05 = 0;
	var_06 = 0;
	var_07 = 0;
	var_08 = 0;
	var_09 = 0;
	var_0A = 0;
	var_0B = issubstr(param_02,"_no_treadfx");
	if(issubstr(param_02,"_no_turret"))
	{
		var_04 = 1;
	}
	else if(issubstr(param_02,"_heavy_turret"))
	{
		var_06 = 1;
		precacheturret("warbird_heavy_turret");
	}
	else if(issubstr(param_02,"_usarmy_turret"))
	{
		var_07 = 1;
		precacheturret("warbird_side_turret_usarmy_sp");
	}
	else if(issubstr(param_02,"_side_turret"))
	{
		var_08 = 1;
		precacheturret("warbird_side_turret_sp");
	}
	else if(issubstr(param_02,"_cheap"))
	{
		var_09 = 1;
		var_04 = 1;
	}

	if(issubstr(param_02,"_no_cloak"))
	{
		var_05 = 1;
	}

	if(issubstr(param_02,"_no_zipline"))
	{
		var_0A = 1;
	}

	if(!var_09)
	{
		if(!var_0A)
		{
			precachemodel("npc_zipline_gun_left");
			precachemodel("npc_zipline_rope_left");
			precachemodel("npc_zipline_gun_right");
			precachemodel("npc_zipline_rope_right");
			precachemodel("npc_optics_zipline_gun");
			precacheturret("zipline_gun");
			precacheturret("zipline_gun_rope");
		}

		lib_A59A::set_console_status();
		if(!var_05)
		{
			if(lib_A64A::func_5095())
			{
				precachemodel("vehicle_xh9_warbird_cloaked_transparent");
				precachemodel("vehicle_xh9_warbird_decloaking_masked");
			}
			else
			{
				precachemodel("vehicle_xh9_warbird_cloaked_in_out");
			}
		}

		if(var_03)
		{
			precachemodel("vehicle_xh9_warbird_turret_left_stealth");
			precachemodel("vehicle_xh9_warbird_turret_right_stealth");
		}
		else
		{
			precachemodel("vehicle_xh9_warbird_turret_left");
			precachemodel("vehicle_xh9_warbird_turret_right");
		}
	}

	lib_A59E::func_186C("xh9_warbird",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A64A::func_4D0D);
	if(!var_09)
	{
		lib_A59E::func_1845("vehicle_xh9_warbird");
	}

	if(!var_0B)
	{
		lib_A59E::func_186E();
	}

	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1839(::lib_A64A::func_7F1D,::lib_A64A::func_7EF4);
	lib_A59E::func_1873(::lib_A64A::func_9A35);
	lib_A59E::func_183C(1);
	if(!var_04)
	{
		if(var_03)
		{
			lib_A59E::func_1872("warbird_turret","tag_turret_left","vehicle_xh9_warbird_turret_left_stealth",undefined,"manual",undefined,0,0,undefined);
			lib_A59E::func_1872("warbird_turret","tag_turret_right","vehicle_xh9_warbird_turret_right_stealth",undefined,"manual",undefined,0,0,undefined);
		}
		else if(var_06)
		{
			lib_A59E::func_1872("warbird_heavy_turret","tag_turret_left","vehicle_xh9_warbird_turret_left",undefined,"manual",undefined,0,0,undefined);
			lib_A59E::func_1872("warbird_heavy_turret","tag_turret_right","vehicle_xh9_warbird_turret_right",undefined,"manual",undefined,0,0,undefined);
		}
		else if(var_07)
		{
			lib_A59E::func_1872("warbird_side_turret_usarmy_sp","tag_turret_zipline_fl","npc_zipline_gun_right",undefined,"manual",undefined,0,0,(12,0,-16));
		}
		else if(var_08)
		{
			lib_A59E::func_1872("warbird_side_turret_sp","tag_turret_zipline_fl","npc_zipline_gun_right",undefined,"manual",undefined,0,0,undefined);
		}
		else
		{
			lib_A59E::func_1872("warbird_turret","tag_turret_left","vehicle_xh9_warbird_turret_left",undefined,"manual",undefined,0,0,undefined);
			lib_A59E::func_1872("warbird_turret","tag_turret_right","vehicle_xh9_warbird_turret_right",undefined,"manual",undefined,0,0,undefined);
		}
	}

	var_0C = randomfloatrange(0,1);
	if(!var_09)
	{
		lib_A59E::func_1842("vfx/explosion/vehicle_warbird_explosion_midair","tag_origin","sfb_warbird_death_explo",undefined,undefined,undefined,-1,1);
	}

	if(!issubstr(param_02,"_stealth_col"))
	{
		lib_A59E::func_1857(param_02,"white_blink_tail","tag_light_tail","vfx/lights/light_wingtip_red_med_point","running",var_0C);
		lib_A59E::func_1857(param_02,"wingtip_red_body_r","TAG_light_body_R","vfx/lights/light_wingtip_red_med_point","running",var_0C);
		lib_A59E::func_1857(param_02,"wingtip_red_body_l","TAG_light_body_L","vfx/lights/light_wingtip_red_med_point","running",var_0C);
		lib_A59E::func_1857(param_02,"wingtip_red_body_r","TAG_light_R_wing","vfx/lights/light_wingtip_red_med_point","running",var_0C);
		lib_A59E::func_1857(param_02,"wingtip_red_body_l","TAG_light_L_wing","vfx/lights/light_wingtip_red_med_point","running",var_0C);
		lib_A59E::func_1857(param_02,"headlight_L","TAG_light_front_R","vfx/lights/headlight_gaz","headlights",0);
		lib_A59E::func_1857(param_02,"headlight_R","TAG_light_front_L","vfx/lights/headlight_gaz","headlights",0);
	}

	lib_A59E::func_1855();
	if(!var_09 && !var_0A)
	{
		lib_A64A::func_57CC();
	}
}

//Function Number: 3
lib_A64A::func_57CC()
{
	level.var_78AE["_zipline_gun_fl"] = #animtree;
	level.var_78B2["_zipline_gun_fl"] = "npc_zipline_gun_right";
	level.var_78A9["_zipline_gun_fl"]["folded_idle"] = %fastzip_launcher_folded_idle_right;
	level.var_78A9["_zipline_gun_fl"]["rest_idle"] = %fastzip_launcher_rest_idle_right;
	level.var_78A9["_zipline_gun_fl"]["readyup"] = %fastzip_launcher_readyup_right;
	level.var_78A9["_zipline_gun_fl"]["jumpout"] = %fastzip_launcher_jumpout_right;
	level.var_78A9["_zipline_gun_fl"]["fastzip_pullout"] = %fastzip_launcher_pullout;
	level.var_78A9["_zipline_gun_fl"]["fastzip_putaway"] = %fastzip_launcher_putaway;
	level.var_78A9["_zipline_gun_fl"]["fastzip_aim_idle"] = %fastzip_launcher_aim_level_right;
	level.var_78A9["_zipline_gun_fl"]["fastzip_fire"] = %fastzip_launcher_fire_right_npc;
	level.var_78A9["_zipline_gun_fl"]["fastzip_slide"] = %fastzip_launcher_slidedown_right_npc;
	level.var_78A9["_zipline_gun_fl"]["retract_rope"] = %fastzip_launcher_retract_right;
	level.var_78AE["_zipline_gun_fr"] = #animtree;
	level.var_78B2["_zipline_gun_fr"] = "npc_zipline_gun_left";
	level.var_78A9["_zipline_gun_fr"]["folded_idle"] = %fastzip_launcher_folded_idle_left;
	level.var_78A9["_zipline_gun_fr"]["rest_idle"] = %fastzip_launcher_rest_idle_left;
	level.var_78A9["_zipline_gun_fr"]["readyup"] = %fastzip_launcher_readyup_left;
	level.var_78A9["_zipline_gun_fr"]["jumpout"] = %fastzip_launcher_jumpout_left;
	level.var_78A9["_zipline_gun_fr"]["fastzip_pullout"] = %fastzip_launcher_pullout;
	level.var_78A9["_zipline_gun_fr"]["fastzip_putaway"] = %fastzip_launcher_putaway;
	level.var_78A9["_zipline_gun_fr"]["fastzip_aim_idle"] = %fastzip_launcher_aim_level_left;
	level.var_78A9["_zipline_gun_fr"]["fastzip_fire"] = %fastzip_launcher_fire_left_npc;
	level.var_78A9["_zipline_gun_fr"]["fastzip_slide"] = %fastzip_launcher_slidedown_left_npc;
	level.var_78A9["_zipline_gun_fr"]["retract_rope"] = %fastzip_launcher_retract_left;
	level.var_78AE["_zipline_gun_kl"] = #animtree;
	level.var_78B2["_zipline_gun_kl"] = "npc_zipline_gun_left";
	level.var_78A9["_zipline_gun_kl"]["folded_idle"] = %fastzip_launcher_folded_idle_left;
	level.var_78A9["_zipline_gun_kl"]["rest_idle"] = %fastzip_launcher_rest_idle_left;
	level.var_78A9["_zipline_gun_kl"]["readyup"] = %fastzip_launcher_readyup_left;
	level.var_78A9["_zipline_gun_kl"]["jumpout"] = %fastzip_launcher_jumpout_left;
	level.var_78A9["_zipline_gun_kl"]["fastzip_pullout"] = %fastzip_launcher_pullout;
	level.var_78A9["_zipline_gun_kl"]["fastzip_putaway"] = %fastzip_launcher_putaway;
	level.var_78A9["_zipline_gun_kl"]["fastzip_aim_idle"] = %fastzip_launcher_aim_level_left;
	level.var_78A9["_zipline_gun_kl"]["fastzip_fire"] = %fastzip_launcher_fire_left_npc;
	level.var_78A9["_zipline_gun_kl"]["fastzip_slide"] = %fastzip_launcher_slidedown_left_npc;
	level.var_78A9["_zipline_gun_kl"]["retract_rope"] = %fastzip_launcher_retract_left;
	level.var_78AE["_zipline_gun_kr"] = #animtree;
	level.var_78B2["_zipline_gun_kr"] = "npc_zipline_gun_right";
	level.var_78A9["_zipline_gun_kr"]["folded_idle"] = %fastzip_launcher_folded_idle_right;
	level.var_78A9["_zipline_gun_kr"]["rest_idle"] = %fastzip_launcher_rest_idle_right;
	level.var_78A9["_zipline_gun_kr"]["readyup"] = %fastzip_launcher_readyup_right;
	level.var_78A9["_zipline_gun_kr"]["jumpout"] = %fastzip_launcher_jumpout_right;
	level.var_78A9["_zipline_gun_kr"]["fastzip_pullout"] = %fastzip_launcher_pullout;
	level.var_78A9["_zipline_gun_kr"]["fastzip_putaway"] = %fastzip_launcher_putaway;
	level.var_78A9["_zipline_gun_kr"]["fastzip_aim_idle"] = %fastzip_launcher_aim_level_right;
	level.var_78A9["_zipline_gun_kr"]["fastzip_fire"] = %fastzip_launcher_fire_right_npc;
	level.var_78A9["_zipline_gun_kr"]["fastzip_slide"] = %fastzip_launcher_slidedown_right_npc;
	level.var_78A9["_zipline_gun_kr"]["retract_rope"] = %fastzip_launcher_retract_right;
}

//Function Number: 4
lib_A64A::func_4D0D()
{
	self.var_7953 = 0;
	lib_A59A::func_32DC("left_door_open");
	lib_A59A::func_32DC("right_door_open");
	waittillframeend;
	if(issubstr(self.classname,"_no_turret") && !issubstr(self.classname,"cheap"))
	{
		if(issubstr(self.classname,"_stealth"))
		{
			thread lib_A64A::func_896C("tag_turret_left","vehicle_xh9_warbird_turret_left_stealth");
			thread lib_A64A::func_896C("tag_turret_right","vehicle_xh9_warbird_turret_right_stealth");
		}
		else
		{
			thread lib_A64A::func_896C("tag_turret_left","vehicle_xh9_warbird_turret_left");
			thread lib_A64A::func_896C("tag_turret_right","vehicle_xh9_warbird_turret_right");
		}
	}

	thread lib_A64A::func_45FF();
	if(!issubstr(self.classname,"_no_zipline") && !issubstr(self.classname,"cheap"))
	{
		thread lib_A64A::func_8944("_zipline_gun_fl","tag_turret_zipline_fl","TAG_GUNNER_FL","npc_zipline_rope_right");
		thread lib_A64A::func_8944("_zipline_gun_fr","tag_turret_zipline_fr","TAG_GUNNER_FR","npc_zipline_rope_left");
		thread lib_A64A::func_8944("_zipline_gun_kl","tag_turret_zipline_kl","TAG_GUNNER_KL","npc_zipline_rope_left","npc_optics_zipline_gun");
		thread lib_A64A::func_8944("_zipline_gun_kr","tag_turret_zipline_kr","TAG_GUNNER_KR","npc_zipline_rope_right");
	}

	self.var_3068 = ::lib_A64A::func_A161;
	lib_A59A::func_749(::lib_A64A::func_A160);
}

//Function Number: 5
lib_A64A::func_896C(param_00,param_01)
{
	var_02 = spawn("script_model",(0,0,0));
	var_02 setmodel(param_01);
	var_02 linkto(self,param_00,(0,0,14),(-8,0,0));
	if(!isdefined(self.var_996A))
	{
		self.var_996A = [];
	}

	self.var_996A[param_00] = var_02;
	self waittill("death");
	var_02 delete();
}

//Function Number: 6
lib_A64A::func_84BC()
{
	self.var_14C7 = 1;
	self hidepart("TAG_STATIC_MAIN_ROTOR_L");
	self hidepart("TAG_STATIC_MAIN_ROTOR_R");
	self hidepart("TAG_STATIC_TAIL_ROTOR");
	self showpart("TAG_SPIN_MAIN_ROTOR_L");
	self showpart("TAG_SPIN_MAIN_ROTOR_R");
	self showpart("TAG_SPIN_TAIL_ROTOR");
}

//Function Number: 7
lib_A64A::func_45FF()
{
	self endon("death");
	self endon("stop_handle_rotors");
	lib_A64A::func_84BC();
	if(isdefined(self.var_60EC) && self.var_60EC)
	{
		return;
	}

	self method_814B(%warbird_rotors_spin,1,0.2,1);
	var_00 = 0;
	var_01 = 0;
	for(;;)
	{
		var_02 = self veh_getvelocity();
		var_03 = anglestoforward(self.var_41);
		var_04 = vectordot(var_02,var_03);
		if(var_04 > 0)
		{
			var_01 = var_04 / 3000;
			var_01 = min(var_01,1);
		}
		else if(var_04 < 0)
		{
			var_01 = var_04 / 1000;
			var_01 = max(var_01,-1);
		}
		else
		{
			var_01 = 0;
		}

		if(var_00 < var_01)
		{
			var_00 = var_00 + 0.1;
			var_00 = min(var_00,var_01);
		}
		else if(var_00 > var_01)
		{
			var_00 = var_00 - 0.1;
			var_00 = max(var_00,var_01);
		}

		if(var_00 > 0)
		{
			self method_8143(%warbird_rotors_forward,1,0.2,0);
			self method_8117(%warbird_rotors_forward,var_00);
			self method_814B(%rotors_tilt,1,0.2,1);
		}
		else if(var_00 < 0)
		{
			self method_8143(%warbird_rotors_backward,1,0.2,0);
			self method_8117(%warbird_rotors_backward,var_00 * -1);
			self method_814B(%rotors_tilt,1,0.2,1);
		}
		else
		{
			self method_8142(%rotors_tilt,0.2);
		}

		wait(0.1);
	}
}

//Function Number: 8
lib_A64A::func_6508(param_00)
{
	var_01 = self gettagangles(param_00);
	var_02 = anglestoforward(var_01);
	var_03 = anglestoright(self.var_41);
	var_04 = vectordot(var_03,var_02);
	if(var_04 > 0)
	{
		if(!lib_A59A::func_32D7("right_door_open"))
		{
			thread lib_A64A::func_6515();
			return;
		}

		return;
	}

	if(!lib_A59A::func_32D7("left_door_open"))
	{
		thread lib_A64A::func_6511();
	}
}

//Function Number: 9
lib_A64A::func_6515()
{
	if(!isdefined(self.var_751A) || self.var_751A != "opening")
	{
		self.var_751A = "opening";
		self method_814B(%warbird_doors,1,0.2,1);
		self method_814B(%warbird_door_r_open,1,0.2,1);
		var_00 = function_0063(%warbird_door_r_open);
		wait(var_00);
		lib_A59A::func_32DD("right_door_open");
	}
}

//Function Number: 10
lib_A64A::func_6511()
{
	if(!isdefined(self.var_5672) || self.var_5672 != "opening")
	{
		self.var_5672 = "opening";
		self method_814B(%warbird_doors,1,0.2,1);
		self method_814B(%warbird_door_l_open,1,0.2,1);
		var_00 = function_0063(%warbird_door_l_open);
		wait(var_00);
		lib_A59A::func_32DD("left_door_open");
	}
}

//Function Number: 11
lib_A64A::func_21D2(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	param_00 method_83BF(self);
}

//Function Number: 12
lib_A64A::func_21D1()
{
	lib_A64A::func_21D2(self.var_1FBD);
	lib_A64A::func_21D2(self.var_2751);
}

//Function Number: 13
lib_A64A::func_4538()
{
	self endon("death");
	self endon("stop_cloaked_models_animation");
	for(;;)
	{
		lib_A64A::func_21D1();
		wait(0.05);
	}
}

//Function Number: 14
lib_A64A::func_8944(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = lib_A59A::func_88CB(param_00);
	if(isdefined(param_03))
	{
		var_05 attach(param_03);
		var_05.var_75E1 = param_03;
	}

	if(isdefined(param_04))
	{
		var_06 = spawn("script_model",(0,0,0));
		var_06 setmodel("npc_optics_zipline_gun");
		var_06 linkto(var_05,"TAG_DE_TECH",(0,0,0),(0,0,0));
		var_05.var_50 = var_06;
	}

	var_05 linkto(self,param_01,(0,0,0),(0,0,0));
	var_05 method_814B(level.var_78A9[param_00]["folded_idle"],1,0,1);
	if(!isdefined(self.var_A3BC))
	{
		self.var_A3BC = [];
	}

	self.var_A3BC[param_01] = var_05;
	self.var_A3BD[param_01] = param_02;
	self waittill("death");
	if(isdefined(var_05.var_50))
	{
		var_05.var_50 delete();
	}

	var_05 delete();
}

//Function Number: 15
lib_A64A::func_7EF4(param_00)
{
	return param_00;
}

//Function Number: 16
lib_A64A::func_7F1D()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 6;var_01++)
	{
		var_00[var_01] = spawnstruct();
	}

	var_00[0].var_4B60 = %helicopter_pilot1_idle;
	var_00[1].var_4B60 = %helicopter_pilot1_idle;
	var_00[2].var_4B60 = %helicopter_pilot1_idle;
	var_00[3].var_4B60 = %helicopter_pilot1_idle;
	var_00[4].var_4B60 = %helicopter_pilot1_idle;
	var_00[5].var_4B60 = %helicopter_pilot1_idle;
	var_00[0].var_85A8 = "TAG_DRIVER";
	var_00[1].var_85A8 = "TAG_GUY0";
	var_00[2].var_85A8 = "TAG_GUY2";
	var_00[3].var_85A8 = "TAG_GUY3";
	var_00[4].var_85A8 = "TAG_GUY5";
	var_00[5].var_85A8 = "TAG_PASSENGER";
	var_00[1].var_14CB = 1;
	var_00[2].var_14CB = 1;
	var_00[3].var_14CB = 1;
	var_00[4].var_14CB = 1;
	var_00[1].var_7505 = ::lib_A64A::func_80F0;
	var_00[2].var_7505 = ::lib_A64A::func_80F0;
	var_00[3].var_7505 = ::lib_A64A::func_80F0;
	var_00[4].var_7505 = ::lib_A64A::func_80F0;
	var_00[1].var_2641 = (0,2500,0);
	var_00[2].var_2641 = (0,2500,0);
	var_00[3].var_2641 = (0,-2500,0);
	var_00[4].var_2641 = (0,-2500,0);
	var_00[5].var_2641 = (0,-2500,0);
	return var_00;
}

//Function Number: 17
lib_A64A::func_9A35()
{
	var_00 = [];
	var_00["default"] = [];
	var_00["default"][var_00["default"].size] = 1;
	var_00["default"][var_00["default"].size] = 2;
	var_00["default"][var_00["default"].size] = 3;
	var_00["default"][var_00["default"].size] = 4;
	return var_00;
}

//Function Number: 18
lib_A64A::func_84B8(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = spawn("script_model",self getorigin());
		param_00 setmodel(param_01);
		param_00 method_8115(#animtree);
	}

	param_00 linkto(self,"tag_origin",(0,0,0),(0,0,0));
	lib_A64A::func_21D1();
	param_00 show();
	return param_00;
}

//Function Number: 19
lib_A64A::func_84BF()
{
	self.var_1FBD = lib_A64A::func_84B8(self.var_1FBD,"vehicle_xh9_warbird_cloaked_transparent");
}

//Function Number: 20
lib_A64A::func_84C1()
{
	self.var_2751 = lib_A64A::func_84B8(self.var_2751,"vehicle_xh9_warbird_decloaking_masked");
}

//Function Number: 21
lib_A64A::func_1FB9()
{
	if(lib_A64A::func_5095())
	{
		self hide();
		lib_A64A::func_84BF();
		thread lib_A64A::func_4538();
	}
	else if(isdefined(level.var_1FAF) && level.var_1FAF)
	{
		self.var_99F7 = self.model;
		self setmodel("vehicle_xh9_warbird_low_cloak");
	}
	else
	{
		self.var_99F7 = self.model;
		self setmodel("vehicle_xh9_warbird_cloaked_in_out");
		if(issubstr(self.classname,"_stealth_col"))
		{
			wait(0.25);
			self setmodel("vehicle_xh9_warbird_cloaked_mp");
		}
	}

	if(isdefined(self.var_14C7) && self.var_14C7)
	{
		lib_A64A::func_84BC();
	}

	waittillframeend;
	waittillframeend;
	lib_A64A::func_7DE8(0,0);
	if(isdefined(self.var_A3BC))
	{
		foreach(var_01 in self.var_A3BC)
		{
			var_01 hide();
		}
	}

	if(isdefined(self.var_996A))
	{
		foreach(var_04 in self.var_996A)
		{
			var_04 hide();
		}
	}

	if(isdefined(self.mgturret))
	{
		foreach(var_07 in self.mgturret)
		{
			var_07 hide();
		}
	}
}

//Function Number: 22
lib_A64A::func_7DE8(param_00,param_01)
{
	if(isdefined(self.var_99F7))
	{
		self method_83A7(param_00,param_01);
	}

	if(isdefined(self.var_1FBD))
	{
		self.var_1FBD method_83A7(param_00,param_01);
	}

	if(isdefined(self.var_2751))
	{
		self.var_2751 method_83A7(param_00,param_01);
	}
}

//Function Number: 23
lib_A64A::func_7FA9(param_00)
{
	self endon("death");
	wait(param_00);
	if(lib_A64A::func_5095())
	{
		self show();
		if(isdefined(self.var_1FBD))
		{
			self.var_1FBD hide();
		}

		if(isdefined(self.var_2751))
		{
			self.var_2751 hide();
		}

		self notify("stop_cloaked_models_animation");
	}
	else if(isdefined(self.var_99F7))
	{
		self setmodel(self.var_99F7);
	}

	lib_A59E::func_9CFA("running");
	lib_A64A::func_84BC();
}

//Function Number: 24
lib_A64A::func_99F8(param_00)
{
	var_01 = 8.3;
	if(isdefined(param_00))
	{
		var_01 = param_00;
	}

	if(issubstr(self.classname,"_stealth_col") && !lib_A64A::func_5095())
	{
		self setmodel("vehicle_xh9_warbird_cloaked_in_out");
	}

	if(lib_A64A::func_5095())
	{
		lib_A64A::func_84C1();
		thread lib_A64A::func_7FA9(var_01);
	}
	else if(isdefined(self.var_99F7))
	{
		thread lib_A64A::func_7FA9(var_01);
	}

	lib_A64A::func_7DE8(1,var_01);
	wait(var_01);
	if(isdefined(self.var_14C7) && self.var_14C7)
	{
		lib_A64A::func_84BC();
	}

	if(isdefined(self.var_A3BC))
	{
		foreach(var_03 in self.var_A3BC)
		{
			var_03 show();
		}
	}

	if(isdefined(self.var_996A))
	{
		foreach(var_06 in self.var_996A)
		{
			var_06 show();
		}
	}

	if(isdefined(self.mgturret))
	{
		foreach(var_09 in self.mgturret)
		{
			var_09 show();
		}
	}
}

//Function Number: 25
lib_A64A::func_A160(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(param_04 == "MOD_ENERGY" && isdefined(self.var_3068))
	{
		if(!isdefined(self.var_306E) || self.var_306E < 1)
		{
			self.var_306E = 1;
			return;
		}

		self thread [[ self.var_3068 ]](param_01,param_04);
	}
}

//Function Number: 26
lib_A64A::func_A161(param_00,param_01)
{
	self endon("death");
	self endon("in_air_explosion");
	self notify("emp_death");
	lib_A5DE::snd_message("warbird_emp_death");
	lib_A59E::func_9CF9("all");
	self.var_3067 = 1;
	self.var_9D43 = 1;
	var_02 = self veh_getvelocity();
	var_03 = 250;
	if(isdefined(level.var_3EBF))
	{
		var_04 = [[ level.var_3EBF ]]();
	}
	else
	{
		var_05 = (self.var_2E6[0] + var_03[0] * 5,self.var_2E6[1] + var_03[1] * 5,self.var_2E6[2] - 2000);
		var_04 = physicstrace(self.var_2E6 + vectornormalize(var_05 - self.var_2E6) * 100,var_05);
	}

	self notify("newpath");
	self notify("deathspin");
	thread lib_A64A::func_A159();
	var_06 = 1000;
	self veh_setspeed(var_06,40,1000);
	self veh_neargoalnotifydist(var_03);
	self veh_setgoalpos(var_04,0);
	thread lib_A64A::func_A15F(var_04,var_03,var_06);
	common_scripts\utility::waittill_any("goal","near_goal");
	self notify("stop_crash_loop_sound");
	self notify("crash_done");
	lib_A5A0::func_9CE8(param_00,param_01);
	self notify("death_finished");
	wait(0.05);
	thread lib_A64A::func_52F7(param_00);
}

//Function Number: 27
lib_A64A::func_52F7(param_00)
{
	self method_8052(self.var_2E6,param_00);
	self delete();
}

//Function Number: 28
lib_A64A::func_A159()
{
	level.var_78AE["warbird_dummy"] = #animtree;
	level.var_78A9["warbird_dummy"]["roll_left"][0] = %rotate_x_l;
	level.var_78A9["warbird_dummy"]["roll_right"][0] = %rotate_x_r;
	var_00 = spawn("script_model",self.var_2E6);
	var_00.var_41 = self.var_41;
	var_00 linkto(self);
	if(isdefined(self.var_2644))
	{
		var_00 setmodel(self.var_2644);
	}
	else
	{
		var_00 setmodel(self.model);
	}

	var_00 endon("death");
	self hide();
	lib_A5DE::snd_message("warbird_emp_death");
	var_00.animname = "warbird_dummy";
	var_00 lib_A59A::func_D61();
	if(common_scripts\utility::cointoss())
	{
		var_01 = "roll_left";
	}
	else
	{
		var_01 = "roll_right";
	}

	var_00 thread lib_A506::func_BE1(var_00,var_01);
	thread common_scripts\utility::delete_on_death(var_00);
	var_02 = 0;
	var_03 = 0.4;
	var_04 = 0.01;
	var_05 = 0.05;
	while(var_02 < var_03)
	{
		var_00 method_83C7(level.var_78A9[var_00.animname][var_01][0],var_02);
		var_02 = var_02 + var_04;
		wait(0.05);
	}
}

//Function Number: 29
lib_A64A::func_A15F(param_00,param_01,param_02)
{
	self endon("crash_done");
	self veh_clearlookatent();
	self veh_setyawspeed(400,100,100);
	var_03 = 400;
	var_04 = 100;
	var_05 = undefined;
	var_06 = 90 * randomintrange(-2,3);
	for(;;)
	{
		if(self.var_2E6[2] < param_00[2] + param_01)
		{
			self notify("near_goal");
		}

		wait(0.05);
	}
}

//Function Number: 30
lib_A64A::func_80F0()
{
	self.var_2568 = ::lib_A64A::func_368F;
	self.var_750B thread lib_A59F::func_4498(self,self.var_9D13);
	thread lib_A64A::func_4485();
}

//Function Number: 31
lib_A64A::func_80EF(param_00)
{
	if(param_00 == "tag_turret_zipline_fl" || param_00 == "tag_turret_zipline_kr")
	{
		var_01 = "zipline_guy_right";
		self.var_A3BA = var_01;
		level.var_78A9[var_01]["rest_idle"] = %zipline_right_rest;
		level.var_78A9[var_01]["readyup"] = %zipline_right_readyup;
		level.var_78A9[var_01]["jumpout"] = %zipline_right_jumpedout;
		level.var_78A9[var_01]["fire"] = %zipline_right_fire;
		level.var_78A9[var_01]["slide_idle_a"][0] = %zipline_right_slidedown_guy_a;
		level.var_78A9[var_01]["slide_idle_b"][0] = %zipline_right_slidedown_guy_b;
		level.var_78A9[var_01]["zipline_right_land_guy_a"] = %zipline_right_land_guy_a;
		level.var_78A9[var_01]["zipline_right_land_guy_b"] = %zipline_right_land_guy_b;
		return;
	}

	var_01 = "zipline_guy_left";
	self.var_A3BA = var_01;
	level.var_78A9[var_01]["rest_idle"] = %zipline_left_rest;
	level.var_78A9[var_01]["readyup"] = %zipline_left_readyup;
	level.var_78A9[var_01]["jumpout"] = %zipline_left_jumpedout;
	level.var_78A9[var_01]["fire"] = %zipline_left_fire;
	level.var_78A9[var_01]["slide_idle_a"][0] = %zipline_left_slidedown_guy_a;
	level.var_78A9[var_01]["slide_idle_b"][0] = %zipline_left_slidedown_guy_b;
	level.var_78A9[var_01]["zipline_left_landing_guy_a"] = %zipline_left_landing_guy_a;
	level.var_78A9[var_01]["zipline_left_landing_guy_b"] = %zipline_left_landing_guy_b;
}

//Function Number: 32
lib_A64A::func_368F(param_00,param_01)
{
	var_02 = undefined;
	var_03 = undefined;
	foreach(var_07, var_05 in param_00.var_A3BC)
	{
		var_06 = distance2d(var_05.var_2E6,self.var_2E6);
		if(!isdefined(var_03) || var_06 < var_03)
		{
			if(!isdefined(var_05.turret))
			{
				var_03 = var_06;
				var_02 = var_07;
			}
		}
	}

	if(!isdefined(var_02))
	{
		return 0;
	}

	lib_A64A::func_80EF(var_02);
	var_08 = param_00.var_A3BD[var_02];
	if(!isdefined(var_08))
	{
		return 0;
	}

	var_09 = lib_A64A::func_3770(param_00,var_08);
	if(!isdefined(var_09))
	{
		return 0;
	}

	var_0A = lib_A64A::func_19D1(param_00,var_02,var_09);
	if(!lib_A64A::func_9C41(param_00,var_08,var_0A))
	{
		return 0;
	}

	var_0B = param_00.var_A3BC[var_02];
	var_0C = lib_A64A::func_82EF("zipline_gun",param_00,var_02,var_0B.model,var_0B.var_75E1,var_0B.animname);
	var_0D = lib_A64A::func_82EF("zipline_gun_rope",param_00,var_02,var_0B.var_75E1,undefined,var_0B.animname);
	var_0B.turret = var_0C;
	var_0E = common_scripts\utility::spawn_tag_origin();
	var_0E.var_2E6 = var_0A;
	var_0C thread common_scripts\utility::delete_on_death(var_0E);
	self.var_31 = 1;
	self.var_6156 = undefined;
	lib_A64A::func_3E4C(param_00,var_0B,var_08);
	if(!isdefined(self) || !isalive(self))
	{
		return 1;
	}

	var_0B hide();
	var_0C show();
	var_0C method_8067(1);
	self method_818A(var_0C);
	var_0C settargetentity(var_0E);
	var_0D settargetentity(var_0E);
	var_0C waittill("turret_on_target");
	if(!isdefined(self) || !isalive(self))
	{
		return 1;
	}

	self method_818B();
	self linkto(param_00,var_08);
	param_00 thread lib_A506::func_C24(self,"fire",var_08,undefined,self.var_A3BA);
	var_0F = var_0D lib_A64A::func_37C4(var_0C,var_0E.var_2E6,var_0B);
	var_0B show();
	var_0C hide();
	if(!isdefined(self) || !isalive(self))
	{
		return 1;
	}

	lib_A64A::func_696C(param_00,var_0B,var_08);
	self notify("fastzip_jumped_out");
	if(isdefined(self) && isalive(self))
	{
		var_10 = var_09.animation;
		var_11 = [];
		var_11["zipline_right_land_guy_a"] = "slide_idle_a";
		var_11["zipline_right_land_guy_b"] = "slide_idle_b";
		var_11["zipline_left_landing_guy_a"] = "slide_idle_a";
		var_11["zipline_left_landing_guy_b"] = "slide_idle_b";
		var_12 = var_11[var_10];
		if(!isdefined(var_12))
		{
			var_12 = "slide_idle_a";
		}

		lib_A64A::func_3687(var_0D,var_12);
		wait(0.1);
		lib_A64A::func_3684(var_0D,var_09.var_2E6,var_10);
		wait(1);
		var_0D lib_A64A::func_74BF(var_0F);
	}

	var_0E delete();
	var_0C delete();
	var_0D delete();
	var_0B.turret = undefined;
	return 1;
}

//Function Number: 33
lib_A64A::func_3E4C(param_00,param_01,param_02)
{
	self endon("death");
	thread lib_A64A::func_69A4(param_00,param_01,param_02);
	wait(0.05);
	param_00 thread lib_A64A::func_6508(param_02);
	lib_A64A::func_699B(param_00,param_01,param_02);
}

//Function Number: 34
lib_A64A::func_3770(param_00,param_01)
{
	var_02 = undefined;
	var_03 = undefined;
	var_04 = 1;
	if(param_01 == "TAG_GUNNER_FL" || param_01 == "TAG_GUNNER_KR")
	{
		var_04 = 0;
	}

	var_05 = param_00 gettagorigin(param_01);
	var_06 = param_00 gettagangles(param_01);
	var_07 = anglestoforward(var_06);
	var_08 = anglestoright(var_06);
	var_09 = common_scripts\utility::getstructarray(param_00.var_251D.target,"targetname");
	foreach(var_0B in var_09)
	{
		if(!isdefined(var_0B.var_7B03))
		{
			continue;
		}

		var_0C = var_0B.var_2E6 - var_05;
		var_0D = vectornormalize(var_0C);
		var_0E = (var_0C[0],var_0C[1],0);
		var_0F = vectornormalize(var_0E);
		var_10 = vectordot(var_07,var_0D);
		if(var_10 < 0)
		{
			continue;
		}

		var_11 = vectordot(var_08,var_0F);
		if(!var_04 && !isdefined(var_03) || var_11 > var_03)
		{
			var_02 = var_0B;
			var_03 = var_11;
			continue;
		}

		if(var_04 && !isdefined(var_03) || var_11 < var_03)
		{
			var_02 = var_0B;
			var_03 = var_11;
		}
	}

	if(!isdefined(var_02))
	{
		return undefined;
	}

	return var_02;
}

//Function Number: 35
lib_A64A::func_19D1(param_00,param_01,param_02)
{
	var_03 = param_00 gettagorigin(param_01);
	var_04 = param_02.var_2E6 - var_03;
	var_05 = vectortoangles(var_04);
	var_06 = param_00.var_A3BC[param_01];
	var_07 = spawn("script_model",param_02.var_2E6);
	var_07.animname = var_06.animname;
	var_07.var_41 = var_05;
	var_07 lib_A59A::func_D61();
	var_07 setmodel(var_06.var_75E1);
	var_07 hide();
	var_08 = var_07 lib_A59A::func_3EF3("fastzip_fire");
	var_07 method_8143(var_08,1,0,0);
	var_09 = var_07 lib_A64A::func_3CB1();
	var_0A = var_09[0];
	var_0B = var_09[1];
	var_0C = param_02.var_2E6 - var_0A;
	var_07.var_2E6 = var_07.var_2E6 + var_0C;
	wait(0.05);
	var_0D = var_07 gettagorigin("jnt_shuttleRoot");
	var_07 delete();
	return var_0D;
}

//Function Number: 36
lib_A64A::func_9C41(param_00,param_01,param_02)
{
	var_03 = param_00 gettagorigin(param_01);
	var_04 = param_00 gettagangles(param_01);
	var_05 = anglestoforward(var_04);
	var_06 = anglestoup(var_04) * -1;
	var_07 = param_02 - var_03;
	var_08 = vectornormalize(var_07);
	var_09 = vectordot(var_08,var_06);
	if(var_09 > cos(30))
	{
		return undefined;
	}

	var_0A = (var_07[0],var_07[1],0);
	var_0B = vectornormalize(var_0A);
	var_0C = vectordot(var_0B,var_05);
	if(var_0C < cos(45))
	{
		return undefined;
	}

	var_0D = length(var_07);
	if(var_0D > 2400)
	{
		return undefined;
	}

	return 1;
}

//Function Number: 37
lib_A64A::func_69A4(param_00,param_01,param_02)
{
	self notify("newanim");
	lib_A59A::func_C3D();
	self unlink();
	param_01 lib_A64A::func_1ED4(0);
	param_01 method_814B(param_01 lib_A59A::func_3EF3("rest_idle"),1,0,0);
	param_00 lib_A506::func_BC7(self,"rest_idle",param_02,self.var_A3BA);
	self linkto(param_00,param_02);
}

//Function Number: 38
lib_A64A::func_699B(param_00,param_01,param_02)
{
	self endon("death");
	param_00 endon("death");
	wait(randomfloatrange(0,0.25));
	param_00 thread lib_A506::func_C24(param_01,"readyup",param_02);
	param_00 lib_A506::func_C24(self,"readyup",param_02,undefined,self.var_A3BA);
}

//Function Number: 39
lib_A64A::func_696C(param_00,param_01,param_02)
{
	self endon("death");
	var_03 = [self,param_01];
	param_00 thread lib_A506::func_C24(param_01,"jumpout",param_02);
	param_00 lib_A506::func_C24(self,"jumpout",param_02,undefined,self.var_A3BA);
}

//Function Number: 40
lib_A64A::func_096C(param_00,param_01,param_02)
{
	var_03 = self gettagorigin("tag_aim");
	var_04 = self gettagangles("tag_aim");
	var_04 = (angleclamp180(var_04[0]),angleclamp180(var_04[1]),angleclamp180(var_04[2]));
	param_00.var_2E6 = var_03 + anglestoforward(var_04) * 100;
	while(var_04[0] > -5)
	{
		var_03 = self gettagorigin("tag_aim");
		var_04 = var_04 - (0.1,0,0);
		param_00.var_2E6 = var_03 + anglestoforward(var_04) * 100;
		wait(0.05);
	}

	wait(2);
	while(var_04[0] < 60)
	{
		var_03 = self gettagorigin("tag_aim");
		var_05 = self gettagangles("tag_aim");
		var_06 = self gettagorigin("tag_weapon");
		var_07 = self gettagangles("tag_weapon");
		var_08 = self gettagorigin("tag_flash");
		var_09 = self gettagangles("tag_flash");
		var_0A = param_01 gettagorigin(param_02);
		var_0B = param_01 gettagangles(param_02);
		var_04 = var_04 + (0.3,0,0);
		param_00.var_2E6 = var_03 + anglestoforward(var_04) * 100;
		wait(0.05);
	}

	wait(1);
	while(var_04[0] > 0)
	{
		var_03 = self gettagorigin("tag_aim");
		var_04 = var_04 - (0.3,0,0);
		param_00.var_2E6 = var_03 + anglestoforward(var_04) * 100;
		wait(0.05);
	}

	self notify("aim_test_done");
}

//Function Number: 41
lib_A64A::func_8983(param_00,param_01,param_02,param_03)
{
	var_04 = spawnturret("misc_turret",(0,0,0),param_00);
	var_04 linkto(self,param_01,(0,0,0),(0,0,0));
	var_04 setmodel(param_02);
	var_04.var_41 = self.var_41;
	var_04.var_7AE9 = self.var_7AE9;
	lib_A5A0::func_7EDD(var_04);
	var_04 setdefaultdroppitch(0);
	var_04 setmode("manual");
	var_04 makeunusable();
	var_04 method_8115(#animtree);
	var_04.animname = param_03;
	return var_04;
}

//Function Number: 42
lib_A64A::func_82EF(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = param_01 lib_A64A::func_8983(param_00,param_02,param_03,param_05);
	if(isdefined(param_04))
	{
		var_06 attach(param_04);
	}

	var_06 hide();
	var_06 setdefaultdroppitch(0);
	var_06 lib_A59A::func_C3D();
	var_06 lib_A64A::func_1ED4(0);
	var_06 method_814B(var_06 lib_A59A::func_3EF3("fastzip_aim_idle"),1,0,0);
	param_01 thread common_scripts\utility::delete_on_death(var_06);
	return var_06;
}

//Function Number: 43
lib_A64A::func_1ED4(param_00)
{
	self method_8142(%root,param_00);
}

//Function Number: 44
lib_A64A::func_37C4(param_00,param_01,param_02)
{
	var_03 = 210;
	var_04 = var_03 / 30;
	param_00 detach(param_02.var_75E1);
	param_02 detach(param_02.var_75E1);
	self show();
	var_05 = param_00 gettagorigin("tag_barrel");
	var_06 = param_01 - var_05;
	var_06 = vectornormalize(var_06);
	var_07 = param_01 + var_06 * 2400;
	var_08 = bullettrace(param_01,var_07,0);
	if(var_08["fraction"] < 1)
	{
		var_07 = var_08["position"];
	}

	var_09 = distance(var_05,var_07) / 12;
	var_0A = var_09 / 200;
	thread lib_A64A::func_87BF(var_07);
	var_0B = lib_A59A::func_3EF3("fastzip_fire");
	var_0C = function_0063(var_0B);
	var_0D = var_0C / var_04 * var_0A;
	self method_8143(var_0B,1,0.2,var_04);
	param_00 method_8143(var_0B,1,0.2,1);
	var_0D = var_0D - 0.05;
	if(var_0D > 0.05)
	{
		wait(var_0D);
	}

	self method_814B(var_0B,1,0,0);
	self method_8117(var_0B,var_0A);
	return var_09;
}

//Function Number: 45
lib_A64A::func_87BF(param_00)
{
	var_01 = self;
	var_02 = randomfloatrange(0.1,0.2);
	wait(var_02);
	var_01 lib_A5F1::func_8724("tac_fastzip_fire");
	wait(var_02);
	common_scripts\utility::play_sound_in_space("tac_fastzip_proj_impact",param_00);
}

//Function Number: 46
lib_A64A::func_3687(param_00,param_01)
{
	var_02 = param_00 lib_A59A::func_3EF3("fastzip_slide");
	param_00 method_814C(%add_slide,1,0,0);
	param_00 method_814C(var_02,1,0,0);
	thread lib_A506::func_BE1(self,param_01,"stop_loop",undefined,self.var_A3BA);
	var_03 = param_00 lib_A64A::func_3CB1();
	var_04 = var_03[0];
	var_05 = var_03[1];
	var_06 = common_scripts\utility::spawn_tag_origin();
	var_06.var_2E6 = self.var_2E6;
	var_06.var_41 = self.var_41;
	self linkto(var_06,"tag_origin",(0,0,0),(0,0,0));
	var_06 moveto(var_04,0.2,0.1,0);
	var_06 rotateto(var_05,0.2,0.1,0);
	var_06 waittill("movedone");
	self method_81C6(var_04,var_05);
	self linkto(param_00,"jnt_shuttleRoot",(0,0,0),(0,0,0));
	var_06 delete();
	param_00 method_814C(%add_slide,1,0,1.2);
	param_00 method_814C(var_02,1,0,1.2);
}

//Function Number: 47
lib_A64A::func_3684(param_00,param_01,param_02)
{
	var_03 = (0,0,0);
	var_04 = [];
	if(isdefined(self) && isalive(self))
	{
		var_05 = self.var_2E6;
		var_06 = self.var_2E6;
		var_07 = distance(self.var_2E6,param_01);
		for(;;)
		{
			wait(0.05);
			var_08 = param_00 lib_A64A::func_3CB1();
			var_09 = var_08[0];
			var_0A = var_08[1];
			var_0B = distance(var_06,var_09);
			var_0C = distance(var_09,param_01);
			var_0D = distance(var_09,var_05);
			if(var_0C < var_0B * 4)
			{
				break;
			}

			if(var_07 < var_0D + var_0B)
			{
				break;
			}

			var_06 = var_09;
		}

		if(isdefined(self))
		{
			var_0E = common_scripts\utility::spawn_tag_origin();
			var_0E.var_2E6 = self.var_2E6;
			var_0E.var_41 = self.var_41;
			self linkto(var_0E,"tag_origin",(0,0,0),(0,0,0));
			var_0F = (0,self.var_41[1],0);
			var_0E moveto(param_01,0.2,0.1,0);
			var_0E rotateto(var_0F,0.2,0.1,0);
			var_0E waittill("movedone");
			if(isalive(self))
			{
				self unlink();
				self notify("stop_loop");
				self method_81C6(param_01,var_0F);
				thread lib_A506::func_C24(self,param_02,undefined,undefined,self.var_A3BA);
			}

			var_0E delete();
		}
	}

	var_10 = param_00 lib_A59A::func_3EF3("fastzip_slide");
	param_00 method_814C(var_10,1,0,0);
	if(isdefined(self) && isalive(self))
	{
		self endon("death");
		self waittill(param_02);
		if(lib_A59F::func_44A8(self))
		{
			self method_81A6(self.var_2E6);
		}
	}
}

//Function Number: 48
lib_A64A::func_74BF(param_00)
{
	var_01 = param_00 / 200;
	var_01 = 1 - min(var_01,1);
	var_02 = 30;
	var_03 = 1;
	var_04 = lib_A59A::func_3EF3("retract_rope");
	self method_8143(var_04,1,0.2,var_03);
	self method_8117(var_04,var_01);
	var_05 = var_02 * 1 - var_01 / 30 * var_03;
	wait(var_05 + 0.05);
}

//Function Number: 49
lib_A64A::func_3CB1()
{
	var_00 = self gettagorigin("jnt_shuttleRoot");
	var_01 = self gettagangles("jnt_shuttleRoot");
	var_02 = angleclamp180(var_01[0]);
	var_02 = clamp(var_02,-20,20);
	var_03 = (var_02,var_01[1],var_01[2]);
	var_04 = anglestoup(var_03);
	var_00 = var_00 + var_04 * -70;
	return [var_00,var_03];
}

//Function Number: 50
lib_A64A::func_4485()
{
	self endon("fastzip_jumped_out");
	var_00 = self.var_750B;
	thread lib_A64A::func_532C();
	self waittill("death");
	if(isdefined(var_00))
	{
		if(!self isragdoll())
		{
			if((self.var_FF == "MOD_PROJECTILE_SPLASH" || self.var_FF == "MOD_EXPLOSIVE") && isdefined(self.var_2641))
			{
				var_01 = length(self.var_2641);
				var_02 = vectornormalize(var_00 localtoworldcoords(self.var_2641) - self.var_2E6);
				self method_8024("torso_lower",var_02 * var_01);
				return;
			}

			self linkto(var_00);
			self.var_6156 = 1;
			var_00 waittill("death");
			if(isdefined(self))
			{
				self delete();
				return;
			}

			return;
		}
	}
}

//Function Number: 51
lib_A64A::func_532C()
{
	self endon("death");
	self waittill("fastzip_jumped_out");
	self.var_6156 = undefined;
}