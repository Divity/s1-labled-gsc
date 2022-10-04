/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42385.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 42
 * Decompile Time: 18 ms
 * Timestamp: 4/20/2022 8:23:25 PM
*******************************************************************/

//Function Number: 1
lib_A591::main()
{
	level thread lib_A591::func_94CB();
}

//Function Number: 2
lib_A591::func_90F1(param_00,param_01)
{
	if(!isdefined(self.var_90E1))
	{
		lib_A591::func_90EC();
	}

	if(!isdefined(param_01))
	{
		param_01 = 4;
	}

	self.var_90E1["enabled"] = param_00;
	self.var_90E1["action_slot"] = param_01;
	lib_A591::func_90F5(param_00);
	if(!self.var_90E1["enabled"])
	{
		self notify("unsync");
		lib_A591::func_90E7(self);
	}
	else
	{
		lib_A591::func_90E6(self,-1);
	}

	thread lib_A591::func_90F0(self.var_90E1["enabled"]);
}

//Function Number: 3
lib_A591::func_90F0(param_00)
{
}

//Function Number: 4
lib_A591::func_90F5(param_00)
{
	if(!isdefined(self.var_90E1))
	{
		lib_A591::func_90EC();
	}

	self.var_90E1["marking_enabled"] = param_00;
	var_01 = lib_A591::func_90E5();
	if(!self.var_90E1["marking_enabled"])
	{
		foreach(var_03 in var_01)
		{
			var_03 lib_A591::func_90D3("none",self);
			var_03 notify("tagged_enemy_death_cleanup");
			var_03 lib_A591::func_90DE();
		}

		return;
	}

	foreach(var_03 in var_03)
	{
		if(isdefined(var_03.var_90DB) && isdefined(var_03.var_90DB[self getentitynumber()]))
		{
			var_03 lib_A591::func_90B5(self);
		}
	}
}

//Function Number: 5
lib_A591::func_90F2(param_00,param_01)
{
	if(!isdefined(self.var_90E1))
	{
		lib_A591::func_90EC();
	}

	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	self.var_90E1["forced_mode_fov"] = param_00;
	self.var_90E1["forced_mode_weap"] = param_01;
	self notify("tagging_mode");
}

//Function Number: 6
lib_A591::func_94CB()
{
	precacheshader("dpad_ar_visor");
	precacheshader("dpad_ar_visor_inactive");
	precacheshader("hud_ar_visor_arc");
	precacheshader("hud_ar_visor_large_focus_ring");
	precacheshader("hud_ar_visor_overlay");
	precacheshader("hud_ar_visor_sentinel_logo");
	precacheshader("hud_ar_visor_small_focus_ring");
	precacheshader("hud_ar_visor_spinner");
	precacheshader("hud_ar_visor_zoom_gauge");
	setdvarifuninitialized("tagging_ads_cone_range",3000);
	setdvarifuninitialized("tagging_ads_cone_angle",10);
	setdvarifuninitialized("tagging_normal_pulse_rate",50);
	setdvarifuninitialized("tagging_normal_prep_time",250);
	setdvarifuninitialized("tagging_normal_track_time",500);
	setdvarifuninitialized("tagging_slow_pulse_rate",100);
	setdvarifuninitialized("tagging_slow_prep_time",500);
	setdvarifuninitialized("tagging_slow_track_time",1000);
	setdvarifuninitialized("tagging_scan_fov_min",55);
	setdvarifuninitialized("tagging_scan_fov_max",25);
	setdvarifuninitialized("tagging_scan_range_min",1500);
	setdvarifuninitialized("tagging_scan_range_max",3000);
	setdvarifuninitialized("tagging_foliage",0);
	setdvarifuninitialized("tagging_vehicle_ride",0);
	lib_A591::func_90F4();
	foreach(var_01 in level.var_328)
	{
		var_01 lib_A591::func_90EC();
	}
}

//Function Number: 7
lib_A591::func_90F4()
{
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinewidth",1);
	function_00D3("r_hudoutlinealpha0",0.75);
	function_00D3("r_hudoutlinepostmode",2);
	function_00D3("r_hudoutlinewhen","after_colorize");
}

//Function Number: 8
lib_A591::func_90EC()
{
	self.var_90E1 = [];
	self.var_90E1["enabled"] = 1;
	self.var_90E1["marking_enabled"] = 1;
	self.var_90E1["outline_enabled"] = 1;
	self.var_90E1["tagging_mode"] = 0;
	self.var_90E1["hint"] = undefined;
	self.var_90E1["hintText"] = undefined;
	self.var_90E1["last_tag_start"] = 0;
	self.var_90E1["action_slot"] = 4;
	self.var_90E1["tagging_fade_min"] = 500;
	self.var_90E1["tagging_fade_max"] = 3000;
	thread lib_A591::func_90FA();
	thread lib_A591::func_90EF();
	lib_A591::func_90F1(1);
}

//Function Number: 9
lib_A591::func_90F6()
{
	self notify("tagging_shutdown");
	lib_A591::func_90F1(0);
	if(isdefined(self.var_90E1) && isdefined(self.var_90E1["camera"]))
	{
		self.var_90E1["camera"] delete();
	}

	self.var_90E1 = undefined;
}

//Function Number: 10
lib_A591::func_90F3(param_00)
{
	if(isdefined(self.var_90E1["hintText"]) && isdefined(param_00) && self.var_90E1["hintText"] == param_00)
	{
		return;
	}

	if(isdefined(self.var_90E1["hint"]))
	{
		self.var_90E1["hint"] lib_A59A::func_48C6();
		self.var_90E1["hint"] = undefined;
		self.var_90E1["hintText"] = undefined;
	}

	if(isdefined(param_00))
	{
		self.var_90E1["hint"] = lib_A59A::func_48C3(param_00);
		self.var_90E1["hintText"] = param_00;
		if(isdefined(self.var_90E1["hint"]))
		{
			self.var_90E1["hint"].var_305E.aligny = "bottom";
			self.var_90E1["hint"].var_305E.vertalign = "bottom";
			if(isdefined(self.var_90E1["hint"].var_141D))
			{
				self.var_90E1["hint"].var_141D.aligny = "bottom";
				self.var_90E1["hint"].var_141D.vertalign = "bottom";
			}
		}

		return self.var_90E1["hint"];
	}
}

//Function Number: 11
lib_A591::func_90E6(param_00,param_01)
{
	if(!isdefined(param_00.detection_highlight_hud_effect))
	{
		param_00.detection_highlight_hud_effect = newclienthudelem(param_00);
		param_00.detection_highlight_hud_effect.color = (0.012,0.0025,0);
		param_00.detection_highlight_hud_effect.alpha = 0.005;
	}

	param_00.detection_highlight_hud_effect method_83A4(param_01);
}

//Function Number: 12
lib_A591::func_90E7(param_00)
{
	if(isdefined(param_00.detection_highlight_hud_effect))
	{
		param_00.detection_highlight_hud_effect destroy();
		param_00.detection_highlight_hud_effect = undefined;
	}
}

//Function Number: 13
lib_A591::func_90E5()
{
	var_00 = function_00D6("axis","neutral");
	if(isdefined(level.var_716))
	{
		var_00 = common_scripts\utility::array_combine(var_00,level.var_716);
	}

	return var_00;
}

//Function Number: 14
lib_A591::func_90FA()
{
	self notify("tagging_think");
	self endon("tagging_think");
	for(;;)
	{
		lib_A591::func_90D4();
		wait(0.05);
	}
}

//Function Number: 15
lib_A591::func_90EF()
{
	self notify("tagging_mode_watcher");
	self endon("tagging_mode_watcher");
	for(;;)
	{
		self waittill("tagging_mode");
		if(isdefined(self.var_42FD) && isdefined(self.var_42FD["grappling"]) && self.var_42FD["grappling"])
		{
			continue;
		}

		if(isdefined(self.var_90E1["forced_mode_fov"]))
		{
			if(!self.var_90E1["tagging_mode"])
			{
				lib_A591::func_90ED();
			}

			lib_A591::func_90F3(undefined);
			continue;
		}

		if(self.var_90E1["tagging_mode"])
		{
			lib_A591::func_90EE();
			continue;
		}

		lib_A591::func_90ED();
	}
}

//Function Number: 16
lib_A591::func_90ED()
{
	self notify("tagging_on");
	self endon("tagging_off");
	self endon("tagging_on");
	self.var_90E1["tagging_mode"] = 1;
	self playsoundasmaster("drone_tag_start");
	if(!isdefined(self.var_90E1["forced_mode_weap"]) || !self.var_90E1["forced_mode_weap"])
	{
		common_scripts\utility::_disableoffhandweapons();
		common_scripts\utility::_disableweapon();
		common_scripts\utility::_disableweaponswitch();
	}

	self.var_90E1["forced_mode_weap"] = undefined;
	function_00D3("cg_drawMantleHint","0");
	wait(0.5);
	lib_A591::func_90E8();
	if(!isdefined(self.var_90E1["forced_mode_fov"]))
	{
		lib_A591::func_90F3(&"GRAPPLE_ZOOM_HINT");
	}

	thread lib_A591::func_90FB();
	thread lib_A591::func_90BB();
}

//Function Number: 17
lib_A591::func_90EE()
{
	self notify("tagging_off");
	self notify("zoom_monitor");
	self endon("tagging_off");
	self endon("tagging_on");
	self.var_90E1["tagging_mode"] = 0;
	if(isdefined(self.var_90E1["zoom"]))
	{
		self.var_90E1["zoom"] = 0;
	}

	self playsoundasmaster("drone_tag_stop");
	thread lib_A591::func_90EA();
	lib_A591::func_90F3(undefined);
	if(!isdefined(self.var_90E1["forced_mode_weap"]) || self.var_90E1["forced_mode_weap"])
	{
		common_scripts\utility::_enableoffhandweapons();
		common_scripts\utility::_enableweapon();
		common_scripts\utility::_enableweaponswitch();
	}

	self.var_90E1["forced_mode_weap"] = undefined;
	self method_8031(65,0.25);
	wait(0.5);
	function_00D3("cg_drawMantleHint","1");
	var_00 = lib_A591::func_90E5();
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02.var_90DB) && isdefined(var_02.var_90DB[self getentitynumber()]))
		{
			continue;
		}

		var_02 lib_A591::func_90D3("none",self);
	}
}

//Function Number: 18
lib_A591::func_90E3()
{
	if(!isdefined(self.var_90E1["hud"]))
	{
		self.var_90E1["hud"] = [];
		self.var_90E1["hud"]["overlay"] = lib_A53C::func_23A2("hud_ar_visor_overlay",1);
		self.var_90E1["hud"]["overlay"].hidewheninmenu = 1;
		self.var_90E1["hud"]["top_arc"] = lib_A53C::createicon("hud_ar_visor_arc",576,18);
		self.var_90E1["hud"]["top_arc"].hidewheninmenu = 1;
		self.var_90E1["hud"]["top_arc"].x = 0;
		self.var_90E1["hud"]["top_arc"].y = 13;
		self.var_90E1["hud"]["top_arc"].alignx = "center";
		self.var_90E1["hud"]["top_arc"].aligny = "top";
		self.var_90E1["hud"]["top_arc"].horzalign = "center";
		self.var_90E1["hud"]["top_arc"].vertalign = "top";
		self.var_90E1["hud"]["top_arc"].color = (1,1,1);
		self.var_90E1["hud"]["top_arc"].alpha = 1;
		self.var_90E1["hud"]["bottom_arc"] = lib_A53C::createicon("hud_ar_visor_arc",576,18);
		self.var_90E1["hud"]["bottom_arc"].hidewheninmenu = 1;
		self.var_90E1["hud"]["bottom_arc"].x = 0;
		self.var_90E1["hud"]["bottom_arc"].y = -23;
		self.var_90E1["hud"]["bottom_arc"].alignx = "center";
		self.var_90E1["hud"]["bottom_arc"].aligny = "bottom";
		self.var_90E1["hud"]["bottom_arc"].horzalign = "center";
		self.var_90E1["hud"]["bottom_arc"].vertalign = "bottom";
		self.var_90E1["hud"]["bottom_arc"].color = (1,1,1);
		self.var_90E1["hud"]["bottom_arc"].alpha = 1;
		self.var_90E1["hud"]["bottom_arc"].var_387 = 180;
		self.var_90E1["hud"]["small_ring"] = lib_A53C::createicon("hud_ar_visor_small_focus_ring",160,160);
		self.var_90E1["hud"]["small_ring"].hidewheninmenu = 1;
		self.var_90E1["hud"]["small_ring"].x = 0;
		self.var_90E1["hud"]["small_ring"].y = 0;
		self.var_90E1["hud"]["small_ring"].alignx = "center";
		self.var_90E1["hud"]["small_ring"].aligny = "middle";
		self.var_90E1["hud"]["small_ring"].horzalign = "center";
		self.var_90E1["hud"]["small_ring"].vertalign = "middle";
		self.var_90E1["hud"]["small_ring"].color = (1,1,1);
		self.var_90E1["hud"]["small_ring"].alpha = 1;
		self.var_90E1["hud"]["small_spinner"] = lib_A53C::createicon("hud_ar_visor_spinner",160,160);
		self.var_90E1["hud"]["small_spinner"].hidewheninmenu = 1;
		self.var_90E1["hud"]["small_spinner"].x = 0;
		self.var_90E1["hud"]["small_spinner"].y = 0;
		self.var_90E1["hud"]["small_spinner"].alignx = "center";
		self.var_90E1["hud"]["small_spinner"].aligny = "middle";
		self.var_90E1["hud"]["small_spinner"].horzalign = "center";
		self.var_90E1["hud"]["small_spinner"].vertalign = "middle";
		self.var_90E1["hud"]["small_spinner"].color = (1,1,1);
		self.var_90E1["hud"]["small_spinner"].alpha = 1;
		self.var_90E1["hud"]["small_spinner"].var_387 = 90;
		self.var_90E1["hud"]["large_ring"] = lib_A53C::createicon("hud_ar_visor_large_focus_ring",300,300);
		self.var_90E1["hud"]["large_ring"].hidewheninmenu = 1;
		self.var_90E1["hud"]["large_ring"].x = 0;
		self.var_90E1["hud"]["large_ring"].y = 0;
		self.var_90E1["hud"]["large_ring"].alignx = "center";
		self.var_90E1["hud"]["large_ring"].aligny = "middle";
		self.var_90E1["hud"]["large_ring"].horzalign = "center";
		self.var_90E1["hud"]["large_ring"].vertalign = "middle";
		self.var_90E1["hud"]["large_ring"].color = (1,1,1);
		self.var_90E1["hud"]["large_ring"].alpha = 1;
		self.var_90E1["hud"]["large_spinner"] = lib_A53C::createicon("hud_ar_visor_spinner",300,300);
		self.var_90E1["hud"]["large_spinner"].hidewheninmenu = 1;
		self.var_90E1["hud"]["large_spinner"].x = 0;
		self.var_90E1["hud"]["large_spinner"].y = 0;
		self.var_90E1["hud"]["large_spinner"].alignx = "center";
		self.var_90E1["hud"]["large_spinner"].aligny = "middle";
		self.var_90E1["hud"]["large_spinner"].horzalign = "center";
		self.var_90E1["hud"]["large_spinner"].vertalign = "middle";
		self.var_90E1["hud"]["large_spinner"].color = (1,1,1);
		self.var_90E1["hud"]["large_spinner"].alpha = 1;
		self.var_90E1["hud"]["large_spinner"] method_84E8(0.5);
		self.var_90E1["hud"]["large_spinner"].var_387 = -360;
		self.var_90E1["hud"]["logo"] = lib_A53C::createicon("hud_ar_visor_sentinel_logo",116,29);
		self.var_90E1["hud"]["logo"].hidewheninmenu = 1;
		self.var_90E1["hud"]["logo"].x = -20;
		self.var_90E1["hud"]["logo"].y = 35;
		self.var_90E1["hud"]["logo"].alignx = "right";
		self.var_90E1["hud"]["logo"].aligny = "top";
		self.var_90E1["hud"]["logo"].horzalign = "right";
		self.var_90E1["hud"]["logo"].vertalign = "top";
		self.var_90E1["hud"]["logo"].color = (1,1,1);
		self.var_90E1["hud"]["logo"].alpha = 1;
		self.var_90E1["hud"]["zoom_guage"] = lib_A53C::createicon("hud_ar_visor_zoom_gauge",112,448);
		self.var_90E1["hud"]["zoom_guage"].hidewheninmenu = 1;
		self.var_90E1["hud"]["zoom_guage"].x = -307;
		self.var_90E1["hud"]["zoom_guage"].y = 0;
		self.var_90E1["hud"]["zoom_guage"].alignx = "left";
		self.var_90E1["hud"]["zoom_guage"].aligny = "middle";
		self.var_90E1["hud"]["zoom_guage"].horzalign = "center";
		self.var_90E1["hud"]["zoom_guage"].vertalign = "middle";
		self.var_90E1["hud"]["zoom_guage"].color = (1,1,1);
		self.var_90E1["hud"]["zoom_guage"].alpha = 1;
		self.var_90E1["hud"]["zoom_guage_indicator"] = lib_A53C::createicon("white",4,4);
		self.var_90E1["hud"]["zoom_guage_indicator"].hidewheninmenu = 1;
		self.var_90E1["hud"]["zoom_guage_indicator"].x = -249;
		self.var_90E1["hud"]["zoom_guage_indicator"].y = 154;
		self.var_90E1["hud"]["zoom_guage_indicator"].alignx = "left";
		self.var_90E1["hud"]["zoom_guage_indicator"].aligny = "middle";
		self.var_90E1["hud"]["zoom_guage_indicator"].horzalign = "center";
		self.var_90E1["hud"]["zoom_guage_indicator"].vertalign = "middle";
		self.var_90E1["hud"]["zoom_guage_indicator"].color = (1,1,1);
		self.var_90E1["hud"]["zoom_guage_indicator"].alpha = 1;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_387 = -25;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_1750 = 154;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_4BC = -154;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_250 = -289;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_37E = -249;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_75E5 = -25;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_75E6 = 25;
		self.var_90E1["hud"]["zoom_guage_text"] = lib_A53C::createfontstring("default",0.75);
		self.var_90E1["hud"]["zoom_guage_text"].hidewheninmenu = 1;
		self.var_90E1["hud"]["zoom_guage_text"].x = -246;
		self.var_90E1["hud"]["zoom_guage_text"].y = 0;
		self.var_90E1["hud"]["zoom_guage_text"].alignx = "center";
		self.var_90E1["hud"]["zoom_guage_text"].aligny = "middle";
		self.var_90E1["hud"]["zoom_guage_text"].horzalign = "center";
		self.var_90E1["hud"]["zoom_guage_text"].vertalign = "middle";
		self.var_90E1["hud"]["zoom_guage_text"].color = (1,1,1);
		self.var_90E1["hud"]["zoom_guage_text"].alpha = 1;
	}
}

//Function Number: 19
lib_A591::func_90E8()
{
	lib_A591::func_90E3();
	self.var_90E1["hud"]["overlay"].alpha = 1;
	self.var_90E1["hud"]["large_ring"].alpha = 1;
	self.var_90E1["hud"]["small_ring"].alpha = 1;
	self.var_90E1["hud"]["large_spinner"].alpha = 1;
	self.var_90E1["hud"]["small_spinner"].alpha = 1;
	self.var_90E1["hud"]["zoom_guage"].alpha = 1;
	self.var_90E1["hud"]["zoom_guage_indicator"].alpha = 1;
	self.var_90E1["hud"]["zoom_guage_text"].alpha = 1;
	self.var_90E1["hud"]["top_arc"].alpha = 1;
	self.var_90E1["hud"]["bottom_arc"].alpha = 1;
	self.var_90E1["hud"]["logo"].alpha = 1;
}

//Function Number: 20
lib_A591::func_90E9()
{
	lib_A591::func_90E3();
	self.var_90E1["hud"]["overlay"].alpha = 0;
	self.var_90E1["hud"]["large_ring"].alpha = 0;
	self.var_90E1["hud"]["small_ring"].alpha = 0;
	self.var_90E1["hud"]["large_spinner"].alpha = 0;
	self.var_90E1["hud"]["small_spinner"].alpha = 0;
	self.var_90E1["hud"]["zoom_guage"].alpha = 0;
	self.var_90E1["hud"]["zoom_guage_indicator"].alpha = 0;
	self.var_90E1["hud"]["zoom_guage_text"].alpha = 0;
}

//Function Number: 21
lib_A591::func_90EA()
{
	lib_A591::func_90E9();
	self.var_90E1["hud"]["top_arc"].alpha = 0;
	self.var_90E1["hud"]["bottom_arc"].alpha = 0;
	self.var_90E1["hud"]["logo"].alpha = 0;
}

//Function Number: 22
lib_A591::func_90EB()
{
	if(!isdefined(self.var_90E1))
	{
		return;
	}

	if(!isdefined(self.var_90E1["hud"]))
	{
		return;
	}

	foreach(var_01 in self.var_90E1["hud"])
	{
		var_01 destroy();
	}

	self.var_90E1["hud"] = undefined;
}

//Function Number: 23
lib_A591::func_90E4()
{
	var_00 = newhudelem();
	var_00.x = 320;
	var_00.y = 240;
	var_00.fontscale = 997;
	var_00.alignx = "center";
	var_00.aligny = "middle";
	var_00 setshader("hud_ar_visor_arc",920,480);
	return var_00;
}

//Function Number: 24
lib_A591::func_90FB()
{
	self notify("zoom_monitor");
	self endon("death");
	self endon("zoom_monitor");
	var_00 = [getdvarint("tagging_scan_fov_min"),getdvarint("tagging_scan_fov_max")];
	var_01 = [getdvarint("tagging_scan_range_min"),getdvarint("tagging_scan_range_max")];
	if(!isdefined(self.var_90E1["zoom"]))
	{
		self.var_90E1["zoom"] = 0;
		self.var_90E1["fov"] = var_00[self.var_90E1["zoom"]];
		self.var_90E1["range"] = var_01[self.var_90E1["zoom"]];
	}

	if(isdefined(self.var_90E1["forced_mode_fov"]))
	{
		self.var_90E1["fov"] = self.var_90E1["forced_mode_fov"];
	}

	var_02 = 0;
	var_03 = 0.33;
	var_04 = 1;
	for(;;)
	{
		var_05 = self adsbuttonpressed() || isdefined(self.var_90E1["forced_mode_fov"]);
		var_06 = isdefined(self.var_90E1["forced_mode_fov"]) && self.var_90E1["forced_mode_fov"] != self.var_90E1["fov"];
		if(var_04 || var_02 != var_05 || var_06)
		{
			if(!isdefined(self.var_90E1["forced_mode_fov"]) && !var_04)
			{
				if(var_05)
				{
					self.var_90E1["zoom"] = 1;
				}
				else
				{
					self.var_90E1["zoom"] = 0;
				}
			}

			var_07 = var_00[self.var_90E1["zoom"]];
			var_08 = var_01[self.var_90E1["zoom"]];
			if(isdefined(self.var_90E1["forced_mode_fov"]))
			{
				var_07 = self.var_90E1["forced_mode_fov"];
			}

			self method_8031(var_07,var_03);
			thread lib_A591::func_90FD(self.var_90E1["fov"],self.var_90E1["range"],var_07,var_08,var_03);
			lib_A591::func_90FC(self.var_90E1["zoom"],var_03);
			var_02 = var_05;
			var_04 = 0;
		}

		wait(0.05);
	}
}

//Function Number: 25
lib_A591::func_90FC(param_00,param_01)
{
	common_scripts\utility::stop_loop_sound_on_entity("drone_tag_zoom_in_loop");
	common_scripts\utility::stop_loop_sound_on_entity("drone_tag_zoom_out_loop");
	self notify("zoom_sound");
	self endon("zoom_sound");
	if(param_01 <= 0)
	{
		return;
	}

	self playsoundasmaster("drone_tag_zoom_start");
	if(param_00)
	{
		var_02 = "drone_tag_zoom_in_loop";
	}
	else
	{
		var_02 = "drone_tag_zoom_out_loop";
	}

	thread common_scripts\utility::play_loop_sound_on_entity(var_02);
	wait(param_01);
	common_scripts\utility::stop_loop_sound_on_entity(var_02);
	self playsoundasmaster("drone_tag_zoom_stop");
}

//Function Number: 26
lib_A591::func_90FD(param_00,param_01,param_02,param_03,param_04)
{
	self notify("zoom_transition");
	self endon("zoom_transition");
	var_05 = param_04 * 1000;
	var_06 = var_05 + gettime();
	var_07 = 0;
	var_08 = 0;
	self.var_90E1["hud"]["small_spinner"] method_84E8(param_04);
	self.var_90E1["hud"]["large_spinner"] method_84E8(param_04);
	if(self.var_90E1["zoom"])
	{
		self.var_90E1["hud"]["small_spinner"].var_387 = self.var_90E1["hud"]["small_spinner"].var_387 + 90;
		self.var_90E1["hud"]["large_spinner"].var_387 = self.var_90E1["hud"]["large_spinner"].var_387 - 90;
	}
	else
	{
		self.var_90E1["hud"]["small_spinner"].var_387 = self.var_90E1["hud"]["small_spinner"].var_387 - 90;
		self.var_90E1["hud"]["large_spinner"].var_387 = self.var_90E1["hud"]["large_spinner"].var_387 + 90;
	}

	while(var_07 < 1 && isdefined(self.var_90E1))
	{
		var_07 = clamp(1 - var_06 - gettime() / var_05,0,1);
		self.var_90E1["fov"] = param_00 + param_02 - param_00 * var_07;
		self.var_90E1["range"] = param_01 + param_03 - param_01 * var_07;
		if(!self.var_90E1["zoom"])
		{
			var_08 = 1 - var_07;
		}
		else
		{
			var_08 = var_07;
		}

		self.var_90E1["hud"]["zoom_guage_text"] setvalue(20 * var_08);
		var_09 = 21.95;
		var_0A = 551;
		if(self.var_90E1["zoom"])
		{
			var_09 = var_09 * -1;
		}

		var_0B = rotatevector((0,0 - var_0A,0),(0,var_09 * var_07 * 2 - 1,0));
		self.var_90E1["hud"]["zoom_guage_indicator"].x = var_0B[1] + var_0A + self.var_90E1["hud"]["zoom_guage_indicator"].var_250;
		self.var_90E1["hud"]["zoom_guage_indicator"].y = var_0B[0] * 0.75;
		self.var_90E1["hud"]["zoom_guage_indicator"].var_387 = self.var_90E1["hud"]["zoom_guage_indicator"].var_75E5 + self.var_90E1["hud"]["zoom_guage_indicator"].var_75E6 - self.var_90E1["hud"]["zoom_guage_indicator"].var_75E5 * var_08;
		wait(0.05);
	}
}

//Function Number: 27
lib_A591::func_90D4()
{
	var_00 = lib_A59A::func_50A6() && self.var_90E1["enabled"] && self.var_90E1["outline_enabled"];
	if(var_00)
	{
		var_01 = lib_A591::func_90E5();
		var_02 = self geteye();
		var_03 = anglestoforward(self getplayerangles());
		var_04 = undefined;
		var_05 = max(0.01,getdvarfloat("tagging_ads_cone_range"));
		var_06 = cos(getdvarfloat("tagging_ads_cone_angle"));
		var_07 = [0,0.5,1];
		var_08 = bullettrace(var_02,var_02 + var_03 * 32000,1,self);
		var_04 = var_08["entity"];
		foreach(var_0A in var_01)
		{
			if(isdefined(var_0A.var_90DB) && isdefined(var_0A.var_90DB[self getentitynumber()]))
			{
				continue;
			}

			if(!getdvarint("tagging_vehicle_ride") && isdefined(var_0A.var_9D19) && var_0A.var_9D19.var_4F8 > 0)
			{
				continue;
			}

			var_0B = isdefined(var_04) && var_04 == var_0A;
			if(!var_0B)
			{
				var_0C = var_0A gettagorigin("tag_origin");
				if(isai(var_0A))
				{
					var_0C = var_0A geteye();
				}

				var_0D = distance(var_0C,var_02);
				if(var_0D <= var_05)
				{
					var_0E = min(1,var_06 + 1 - var_06 * var_0D / var_05);
					foreach(var_10 in var_07)
					{
						var_11 = vectorlerp(var_0A.var_2E6,var_0C,var_10);
						var_12 = var_11 - var_02;
						var_13 = vectornormalize(var_12);
						var_14 = vectordot(var_13,var_03);
						if(var_14 > var_0E)
						{
							if(lib_A591::func_3277(var_0A))
							{
								var_0B = 1;
								break;
							}
						}
					}
				}
			}

			if(var_0B)
			{
				var_0A lib_A591::func_90D3("tracking",self,1);
				continue;
			}

			var_0A lib_A591::func_90D3("none",self,1);
		}
	}
}

//Function Number: 28
lib_A591::func_90BB(param_00)
{
	self notify("tag_monitor");
	self endon("tag_monitor");
	self endon("tagging_off");
	self endon("unsync");
	self endon("death");
	for(;;)
	{
		lib_A591::func_90C5(self geteye(),self getplayerangles(),self.var_90E1["fov"],float(self.var_90E1["fov"]) * 0.28,self.var_90E1["range"]);
		wait(0.05);
	}
}

//Function Number: 29
lib_A591::func_3279()
{
	if(isdefined(self.var_90F9))
	{
		return;
	}

	if(!isdefined(self.var_90F7))
	{
		self.var_90F7 = 0;
	}

	if(!isdefined(level.var_90F8))
	{
		level.var_90F8 = [];
		level thread lib_A591::func_3278();
	}

	level.var_90F8 = common_scripts\utility::array_add(level.var_90F8,self);
	self.var_90F9 = 1;
}

//Function Number: 30
lib_A591::func_3278()
{
	self notify("enemy_sight_trace_process");
	self endon("enemy_sight_trace_process");
	var_00 = 3;
	for(;;)
	{
		level.var_90F8 = common_scripts\utility::array_removeundefined(level.var_90F8);
		for(var_01 = 0;var_01 < min(var_00,level.var_90F8.size);var_01++)
		{
			var_02 = level.var_90F8[0];
			level.var_90F8 = common_scripts\utility::array_remove(level.var_90F8,var_02);
			var_02.var_90F7 = lib_A591::func_3276(var_02);
			var_02.var_90F9 = undefined;
		}

		wait(0.05);
	}
}

//Function Number: 31
lib_A591::func_3277(param_00)
{
	param_00 lib_A591::func_3279();
	return param_00.var_90F7;
}

//Function Number: 32
lib_A591::func_3276(param_00)
{
	var_01 = 0;
	var_02 = level.var_31D geteye();
	if(isai(param_00))
	{
		if(!var_01 && sighttracepassed(var_02,param_00 gettagorigin("j_head"),0,param_00.var_855E,param_00,0))
		{
			var_01 = 1;
		}

		if(!var_01 && sighttracepassed(var_02,param_00 gettagorigin("j_spinelower"),0,param_00.var_855E,param_00,0))
		{
			var_01 = 1;
		}
	}

	if(!var_01 && sighttracepassed(var_02,param_00.var_2E6,0,param_00.var_855E,param_00,0))
	{
		var_01 = 1;
	}

	return var_01;
}

//Function Number: 33
lib_A591::func_90C5(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = lib_A591::func_90E5();
	var_06 = cos(float(param_03));
	var_07 = param_04 * param_04;
	foreach(var_09 in var_05)
	{
		var_0A = "tracking";
		var_0B = (0,0,0);
		if(isai(var_09))
		{
			var_0B = var_09 geteye();
		}
		else
		{
			var_0B = var_09 gettagorigin("tag_origin");
		}

		if(isdefined(var_09.var_90DB) && isdefined(var_09.var_90DB[self getentitynumber()]))
		{
			continue;
		}

		if(!getdvarint("tagging_vehicle_ride") && isdefined(var_09.var_9D19) && var_09.var_9D19.var_4F8 > 0)
		{
			continue;
		}

		if(!self.var_90E1["outline_enabled"] || !self.var_90E1["enabled"])
		{
			continue;
		}

		if(!common_scripts\utility::within_fov(param_00,param_01,var_0B,cos(float(param_02))))
		{
			var_09 lib_A591::func_90D3("none",self);
			continue;
		}

		if(!common_scripts\utility::within_fov(param_00,param_01,var_0B,var_06))
		{
			var_09 lib_A591::func_90D3("none",self);
			continue;
		}

		if(distancesquared(param_00,var_09.var_2E6) > var_07)
		{
			var_0A = "tracking_slow";
		}

		if(lib_A591::func_3277(var_09))
		{
			var_09 lib_A591::func_90D3(var_0A,self);
			continue;
		}

		var_09 lib_A591::func_90D3("obstructed",self);
	}
}

//Function Number: 34
lib_A591::func_90D3(param_00,param_01,param_02)
{
	var_03 = gettime();
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_04 = getdvarint("tagging_normal_pulse_rate");
	var_05 = getdvarint("tagging_normal_prep_time");
	var_06 = getdvarint("tagging_normal_track_time");
	var_07 = 0;
	if(!param_01.var_90E1["marking_enabled"])
	{
		param_00 = "range";
	}

	switch(param_00)
	{
		case "view":
			break;

		case "range":
			break;

		case "tracking_slow":
			break;

		case "tracking":
			break;

		case "obstructed":
		case "none":
		default:
			break;
	}
}

//Function Number: 35
lib_A591::func_90BE(param_00)
{
	if(param_00)
	{
		lib_A591::func_90DF();
		thread lib_A591::func_90DC();
		thread lib_A591::func_90DD();
	}
	else
	{
		lib_A591::func_90DE();
		self notify("tagged_enemy_update");
	}

	lib_A591::func_90CE(param_00);
}

//Function Number: 36
lib_A591::func_90DD()
{
	self endon("death");
	self notify("tagged_enemy_update");
	self endon("tagged_enemy_update");
	for(;;)
	{
		if(!getdvarint("tagging_vehicle_ride") && isdefined(self.var_9D19) && self.var_9D19.var_4F8 > 0)
		{
			lib_A591::func_90BE(0);
			self notify("tagged_enemy_death_cleanup");
			self.var_90DB = undefined;
			return;
		}

		var_00 = self gettagorigin("tag_origin");
		if(isai(self))
		{
			var_00 = self geteye();
		}

		var_01 = vectornormalize(var_00 - level.var_31D geteye());
		var_02 = anglestoforward(level.var_31D getplayerangles());
		if(vectordot(var_01,var_02) < cos(65))
		{
			lib_A591::func_90CE(0);
		}
		else if(lib_A591::func_3277(self))
		{
			lib_A591::func_90CE(0);
		}
		else
		{
			lib_A591::func_90CE(1);
		}

		wait(0.05);
	}
}

//Function Number: 37
lib_A591::func_90CE(param_00)
{
	self method_84ED("disable");
	if(param_00)
	{
		if(self.inliveplayerkillstreak == "axis")
		{
			self method_84ED("detected");
		}
	}
}

//Function Number: 38
lib_A591::func_90B5(param_00)
{
	if(!isdefined(self) || !isalive(self))
	{
		if(isdefined(self))
		{
			lib_A591::func_90BE(0);
		}

		return;
	}

	if(!isdefined(self.var_90DB) || !isdefined(self.var_90DB[param_00 getentitynumber()]) || !self.var_90DB[param_00 getentitynumber()])
	{
		lib_A5F1::func_8725("drone_tag_success");
	}

	self.var_90DB[param_00 getentitynumber()] = 1;
	lib_A591::func_90BE(1);
	self.var_90D1 = undefined;
	self.var_90CF = undefined;
	self.var_90D2 = undefined;
	self.var_90D0 = undefined;
	lib_A591::func_90DF();
}

//Function Number: 39
lib_A591::func_90DF()
{
	lib_A591::func_90DE();
	var_00 = 4;
	if(self.inliveplayerkillstreak != "axis" && self.inliveplayerkillstreak != "dead" && self.health > 0)
	{
		var_00 = 3;
	}

	if(isdefined(self.var_90E2) && self.var_90E2 == var_00)
	{
		return;
	}

	self hudoutlineenable(var_00,0);
	self.var_90E2 = var_00;
	thread lib_A591::func_90E0();
}

//Function Number: 40
lib_A591::func_90DE()
{
	self notify("tagged_status_update");
	if(isdefined(self.var_90E2))
	{
		self hudoutlinedisable();
		self.var_90E2 = undefined;
	}
}

//Function Number: 41
lib_A591::func_90E0()
{
	self notify("tagged_status_update");
	self endon("tagged_status_update");
	self endon("death");
	while(isdefined(self))
	{
		var_00 = level.var_31D.var_90E1["tagging_fade_max"];
		var_01 = var_00 * var_00;
		var_02 = lengthsquared(level.var_31D.var_2E6 - self.var_2E6);
		if(var_02 > var_01)
		{
			self hudoutlinedisable();
			continue;
		}

		self hudoutlineenable(self.var_90E2,0);
		wait(0.05);
	}
}

//Function Number: 42
lib_A591::func_90DC()
{
	if(isdefined(self.var_90DC))
	{
		return;
	}

	self notify("tagged_enemy_death_cleanup");
	self endon("tagged_enemy_death_cleanup");
	self.var_90DC = 1;
	common_scripts\utility::waittill_any("death","tagged_death");
	wait(0.1);
	if(isdefined(self) && distancesquared(self.var_2E6,level.var_31D.var_2E6) > 90000)
	{
		var_00 = gettime();
		var_01 = 1;
		while(isdefined(self) && gettime() - var_00 < 1000)
		{
			if(var_01 == 0 && randomint(100) < 30)
			{
				lib_A591::func_90BE(1);
				var_01 = 1;
				continue;
			}

			if(var_01 == 1)
			{
				lib_A591::func_90BE(0);
				var_01 = 0;
			}

			wait(0.05);
		}
	}

	if(isdefined(self))
	{
		lib_A591::func_90BE(0);
	}

	self.var_90DC = undefined;
}