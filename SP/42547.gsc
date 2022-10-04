/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42547.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 6
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:49 PM
*******************************************************************/

//Function Number: 1
lib_A633::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("pitbull",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A633::func_4D0D);
	if(param_00 == "vehicle_pitbull")
	{
		lib_A59E::func_1845("vehicle_pitbull","vehicle_pitbull_dstrypv");
		var_03 = [];
		var_03["vehicle_pitbull"] = "vfx/explosion/vehicle_civ_ai_explo_med_runner";
		lib_A59E::func_1842(var_03[param_00],"tag_death_fx","car_explode");
		lib_A59E::func_1849(%humvee_50cal_driving_idle_forward,%humvee_50cal_driving_idle_backward,50);
		lib_A59E::func_1857(param_02,"brakelight_set","tag_origin","vfx/lights/veh_pitbull_stop_light","brakelights");
	}

	if(param_02 == "script_vehicle_mil_avt_ai")
	{
		lib_A59E::func_1849(%humvee_50cal_driving_idle_forward,%humvee_50cal_driving_idle_backward,50);
	}
	else if(param_02 == "script_vehicle_pitbull_physics_alt")
	{
		lib_A59E::func_1872("pitbull_turret_bullet","tag_turret","weapon_pitbull_turret",undefined,"manual",0.2,10,-14);
	}
	else
	{
		lib_A59E::func_1872("pitbull_turret","tag_turret","weapon_pitbull_turret",undefined,"manual",0.2,10,-14);
	}

	lib_A59E::func_1873(::lib_A633::func_9A35);
	lib_A59E::func_186E(param_02,"default","vfx/treadfx/tread_dust_default");
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1839(::lib_A633::func_7F1D,::lib_A633::func_7EF4);
}

//Function Number: 2
lib_A633::func_4D0D()
{
	if(issubstr(self.vehicletype,"physics"))
	{
		var_00 = [];
		var_00["idle"] = %humvee_antennas_idle_movement;
		var_00["rot_l"] = %humvee_antenna_l_rotate_360;
		var_00["rot_r"] = %humvee_antenna_r_rotate_360;
		thread lib_A5A0::func_4B01(var_00);
	}

	if(self.model == "vehicle_vm_pitbull")
	{
		self hidepart("TAG_WINDSHIELD1");
		self hidepart("TAG_WINDSHIELD2");
		self hidepart("TAG_WINDSHIELD3");
	}
}

//Function Number: 3
lib_A633::func_45D9()
{
	lib_A5DE::snd_message("snd_register_vehicle","pitbull",::lib_A634::func_8723);
	lib_A5DE::snd_message("snd_start_vehicle","pitbull");
}

//Function Number: 4
lib_A633::func_9A35()
{
	var_00 = [];
	return var_00;
}

//Function Number: 5
lib_A633::func_7EF4(param_00)
{
	param_00[0].var_9CCD = %uaz_driver_exit_into_run_door;
	param_00[1].var_9CCD = %uaz_rear_driver_exit_into_run_door;
	param_00[2].var_9CCD = %uaz_passenger_exit_into_run_door;
	param_00[3].var_9CCD = %uaz_passenger2_exit_into_run_door;
	param_00[0].var_9CC8 = %humvee_mount_frontl_door;
	param_00[1].var_9CC8 = %humvee_mount_frontr_door;
	param_00[2].var_9CC8 = %humvee_mount_backl_door;
	param_00[3].var_9CC8 = %humvee_mount_backr_door;
	param_00[0].var_9CCF = "hummer_door_open";
	param_00[1].var_9CCF = "hummer_door_open";
	param_00[2].var_9CCF = "hummer_door_open";
	param_00[3].var_9CCF = "hummer_door_open";
	param_00[0].var_9CCA = "hummer_door_close";
	param_00[1].var_9CCA = "hummer_door_close";
	param_00[2].var_9CCA = "hummer_door_close";
	param_00[3].var_9CCA = "hummer_door_close";
	return param_00;
}

//Function Number: 6
lib_A633::func_7F1D()
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
	var_00[0].var_4B60 = %humvee_idle_frontl;
	var_00[1].var_4B60 = %humvee_idle_frontr;
	var_00[2].var_4B60 = %humvee_idle_backl;
	var_00[3].var_4B60 = %humvee_idle_backr;
	var_00[0].var_4066 = %humvee_driver_climb_out;
	var_00[1].var_4066 = %humvee_passenger_out_r;
	var_00[2].var_4066 = %humvee_passenger_out_l;
	var_00[3].var_4066 = %humvee_passenger_out_r;
	var_00[0].var_3FD0 = %humvee_mount_frontl;
	var_00[1].var_3FD0 = %humvee_mount_frontr;
	var_00[2].var_3FD0 = %humvee_mount_backl;
	var_00[3].var_3FD0 = %humvee_mount_backr;
	return var_00;
}