/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42519.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 9
 * Decompile Time: 5 ms
 * Timestamp: 4/20/2022 8:23:47 PM
*******************************************************************/

//Function Number: 1
lib_A617::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("gaz_tigr_harbor",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A617::func_4D0D);
	lib_A59E::func_1873(::lib_A617::func_9A35);
	lib_A59E::func_1849(%humvee_50cal_driving_idle_forward,%humvee_50cal_driving_idle_backward,10);
	lib_A59E::func_186E();
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("axis");
	if(issubstr(param_02,"turret"))
	{
		lib_A59E::func_1839(::lib_A617::func_7F22,::lib_A617::func_7EF6);
		if(issubstr(param_02,"_paris") || issubstr(param_02,"_hijack"))
		{
			lib_A59E::func_1872("dshk_gaz_damage_player","tag_turret","weapon_dshk_turret",undefined,"auto_ai",0.2,-20,-14);
		}
		else if(issubstr(param_02,"_recovery"))
		{
			lib_A59E::func_1872("dshk_gaz_recovery","tag_turret","weapon_dshk_turret",undefined,"auto_ai",0.2,-20,-14);
		}
		else if(issubstr(param_02,"_factory"))
		{
			lib_A59E::func_1872("dshk_gaz_factory","tag_turret","weapon_dshk_turret",undefined,"auto_ai",0.2,-20,-14);
		}
		else
		{
			lib_A59E::func_1872("dshk_gaz","tag_turret","weapon_dshk_turret",undefined,"auto_ai",0.2,-20,-14);
		}
	}
	else
	{
		lib_A59E::func_1839(::lib_A617::func_7F1D,::lib_A617::func_7EF4);
	}

	if(param_02 == "script_vehicle_gaz_tigr_turret_physics_paris")
	{
	}
	else
	{
		lib_A617::func_184E(param_02);
	}

	lib_A59E::func_1857(param_02,"running_headlight_L","TAG_HEADLIGHT_LEFT","vfx/lights/headlight_gaz","running",0);
	lib_A59E::func_1857(param_02,"running_headlight_R","TAG_HEADLIGHT_RIGHT","vfx/lights/headlight_gaz","running",0);
	lib_A59E::func_1857(param_02,"running_brakelight_L","TAG_BRAKELIGHT_LEFT","vfx/lights/taillight_gaz","running",0);
	lib_A59E::func_1857(param_02,"running_brakelight_R","TAG_BRAKELIGHT_RIGHT","vfx/lights/taillight_gaz","running",0);
	lib_A59E::func_1857(param_02,"headlights_headlight_L","TAG_HEADLIGHT_LEFT","vfx/lights/headlight_gaz","headlights",0);
	lib_A59E::func_1857(param_02,"headlights_headlight_R","TAG_HEADLIGHT_RIGHT","vfx/lights/headlight_gaz","headlights",0);
	lib_A59E::func_1857(param_02,"headlights_brakelight_L","TAG_BRAKELIGHT_LEFT","vfx/lights/taillight_gaz","headlights",0);
	lib_A59E::func_1857(param_02,"headlights_brakelight_R","TAG_BRAKELIGHT_RIGHT","vfx/lights/taillight_gaz","headlights",0);
	lib_A59E::func_1857(param_02,"headlights_cheap_headlight_L_cheap","TAG_HEADLIGHT_LEFT","vfx/lights/headlight_gaz_cheap","headlights_cheap",0);
	lib_A59E::func_1857(param_02,"headlights_cheap_headlight_R_cheap","TAG_HEADLIGHT_RIGHT","vfx/lights/headlight_gaz_cheap","headlights_cheap",0);
	lib_A59E::func_1857(param_02,"headlights_cheap_brakelight_L_cheap","TAG_BRAKELIGHT_LEFT","vfx/lights/taillight_gaz_cheap","headlights_cheap",0);
	lib_A59E::func_1857(param_02,"headlights_cheap_brakelight_R_cheap","TAG_BRAKELIGHT_RIGHT","vfx/lights/taillight_gaz_cheap","headlights_cheap",0);
	lib_A59E::func_1857(param_02,"taillights_cheap_headlight_L_cheap","TAG_HEADLIGHT_LEFT","vfx/lights/headlight_gaz","taillights_cheap",0);
	lib_A59E::func_1857(param_02,"taillights_cheap_headlight_R_cheap","TAG_HEADLIGHT_RIGHT","vfx/lights/headlight_gaz","taillights_cheap",0);
	lib_A59E::func_1857(param_02,"taillights_cheap_brakelight_L_cheap","TAG_BRAKELIGHT_LEFT","vfx/lights/taillight_gaz_cheap","taillights_cheap",0);
	lib_A59E::func_1857(param_02,"taillights_cheap_brakelight_R_cheap","TAG_BRAKELIGHT_RIGHT","vfx/lights/taillight_gaz_cheap","taillights_cheap",0);
}

//Function Number: 2
lib_A617::func_4D0D()
{
}

//Function Number: 3
lib_A617::func_9A35()
{
	var_00 = [];
	var_01 = "passengers";
	var_00[var_01] = [];
	var_00[var_01][var_00[var_01].size] = 1;
	var_00[var_01][var_00[var_01].size] = 2;
	var_00[var_01][var_00[var_01].size] = 3;
	var_01 = "all_but_gunner";
	var_00[var_01] = [];
	var_00[var_01][var_00[var_01].size] = 0;
	var_00[var_01][var_00[var_01].size] = 1;
	var_00[var_01][var_00[var_01].size] = 2;
	var_01 = "rear_driver_side";
	var_00[var_01] = [];
	var_00[var_01][var_00[var_01].size] = 2;
	var_01 = "all";
	var_00[var_01] = [];
	var_00[var_01][var_00[var_01].size] = 0;
	var_00[var_01][var_00[var_01].size] = 1;
	var_00[var_01][var_00[var_01].size] = 2;
	var_00[var_01][var_00[var_01].size] = 3;
	var_00["default"] = var_00["all"];
	return var_00;
}

//Function Number: 4
lib_A617::func_184E(param_00)
{
	level._effect["gazfire"] = loadfx("vfx/fire/fire_lp_s_no_light");
	level._effect["gazexplode"] = loadfx("vfx/explosion/vehicle_civ_ai_explo_lrg_runner");
	level._effect["gazsmfire"] = loadfx("vfx/fire/fire_lp_xs_no_light");
	lib_A59E::func_1845("vehicle_gaz_tigr_harbor","vehicle_gaz_tigr_harbor_destroyed");
	lib_A59E::func_1845("vehicle_gaz_tigr_base","vehicle_gaz_tigr_harbor_destroyed");
	lib_A59E::func_1845("vehicle_mil_gaz_ai","vehicle_mil_gaz_dstrypv");
	lib_A59E::func_1845("vehicle_mil_humvee_north_korean_01_ai","vehicle_gaz_tigr_harbor_destroyed");
	if(param_00 != "script_vehicle_gaz_tigr_cleanup" && param_00 != "script_vehicle_gaz_tigr_cleanup_phys")
	{
		lib_A59E::func_1842("vfx/explosion/vehicle_civ_ai_explo_lrg_runner","tag_death_fx","veh_gaz_expl_3d");
		lib_A59E::func_1842("vfx/fire/fire_lp_s_no_light","tag_cab_fx",undefined,undefined,undefined,1,0);
		lib_A59E::func_1842("vfx/fire/firelp_small","tag_trunk_fx",undefined,undefined,undefined,1,3);
	}

	lib_A59E::func_1846(1,1.6,500);
	if(param_00 != "script_vehicle_gaz_tigr_turret_physics_factory")
	{
		lib_A59E::func_1862((0,0,32),300,200,0,0);
	}
}

//Function Number: 5
lib_A617::func_7EF4(param_00)
{
	param_00[0].var_9CCD = %gaz_dismount_frontl_door;
	param_00[1].var_9CCD = %gaz_dismount_frontr_door;
	param_00[2].var_9CCD = %gaz_dismount_backl_door;
	param_00[3].var_9CCD = %gaz_dismount_backr_door;
	param_00[0].var_9CC8 = %gaz_mount_frontl_door;
	param_00[1].var_9CC8 = %gaz_mount_frontr_door;
	param_00[2].var_9CC8 = %gaz_enter_back_door;
	param_00[3].var_9CC8 = %gaz_enter_back_door;
	param_00[0].var_9CCF = "gaz_door_open";
	param_00[1].var_9CCF = "gaz_door_open";
	param_00[2].var_9CCF = "gaz_door_open";
	param_00[3].var_9CCF = "gaz_door_open";
	param_00[0].var_9CCA = "gaz_door_close";
	param_00[1].var_9CCA = "gaz_door_close";
	param_00[2].var_9CCA = "gaz_door_close";
	param_00[3].var_9CCA = "gaz_door_close";
	return param_00;
}

//Function Number: 6
lib_A617::func_7EF6(param_00)
{
	param_00 = lib_A617::func_7EF4(param_00);
	param_00[3].var_9CCD = %gaz_turret_getout_gaz;
	return param_00;
}

//Function Number: 7
lib_A617::func_7F1D()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 4;var_01++)
	{
		var_00[var_01] = spawnstruct();
	}

	var_00[0].var_85A8 = "tag_driver";
	var_00[1].var_85A8 = "tag_passenger";
	var_00[2].var_85A8 = "tag_guy0";
	var_00[3].var_85A8 = "tag_guy1";
	var_00[0].var_1433 = 0;
	var_00[0].var_109 = %gaz_dismount_frontl;
	var_00[0].var_263F = 3;
	var_00[0].var_4B60 = %gaz_idle_frontl;
	var_00[1].var_4B60 = %gaz_idle_frontr;
	var_00[2].var_4B60 = %gaz_idle_backl;
	var_00[3].var_4B60 = %gaz_idle_backr;
	var_00[0].var_4066 = %gaz_dismount_frontl;
	var_00[1].var_4066 = %gaz_dismount_frontr;
	var_00[2].var_4066 = %gaz_dismount_backl;
	var_00[3].var_4066 = %gaz_dismount_backr;
	var_00[0].var_3FD0 = %gaz_mount_frontl;
	var_00[1].var_3FD0 = %gaz_mount_frontr;
	var_00[2].var_3FD0 = %gaz_enter_backr;
	var_00[3].var_3FD0 = %gaz_enter_backl;
	var_00[0].var_2641 = (0,2500,0);
	var_00[1].var_2641 = (0,-2500,0);
	var_00[2].var_2641 = (0,2500,0);
	var_00[3].var_2641 = (0,-2500,0);
	var_00[0].var_5C38 = undefined;
	var_00[1].var_5C38 = undefined;
	var_00[2].var_5C38 = 0.6;
	var_00[3].var_5C38 = 0.45;
	return var_00;
}

//Function Number: 8
lib_A617::func_7F22()
{
	var_00 = lib_A617::func_7F1D();
	var_01 = 0;
	foreach(var_03 in var_00)
	{
		if(isdefined(var_03.var_4066))
		{
			var_04 = function_0063(var_03.var_4066);
			if(var_04 > var_01)
			{
				var_01 = var_04;
			}
		}
	}

	var_00[3].mgturret = 0;
	var_00[3].var_66B1 = ::lib_A617::func_3C78;
	var_00[3].var_85A8 = "tag_guy_turret";
	var_00[3].var_4066 = %gaz_turret_getout_guy1;
	var_00[3].delay = var_01;
	return var_00;
}

//Function Number: 9
lib_A617::func_3C78(param_00,param_01,param_02,param_03)
{
}