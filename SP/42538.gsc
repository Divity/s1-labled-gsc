/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42538.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:48 PM
*******************************************************************/

//Function Number: 1
lib_A62A::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("mil_cargo_truck",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A62A::func_4D0D);
	lib_A59E::func_1849(%mil_cargo_driving_idle_forward,%mil_cargo_driving_idle_backward,10);
	lib_A59E::func_186E(param_02,"default","vfx/treadfx/tread_dust_default");
	lib_A59E::func_1871(param_02,"default","vfx/treadfx/tread_dust_van_bright");
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1839(::lib_A62A::func_7F1D,::lib_A62A::func_7EF4);
	lib_A59E::func_1857(param_02,"headlight_left","tag_headlight_left","vfx/lights/veh_default_front_signal_light_l","headlights");
	lib_A59E::func_1857(param_02,"headlight_right","tag_headlight_right","vfx/lights/veh_default_front_signal_light_r","headlights");
	lib_A59E::func_1857(param_02,"taillight_right","tag_brakelight_right","vfx/lights/veh_default_tail_light_r","taillights");
	lib_A59E::func_1857(param_02,"taillight_left","tag_brakelight_left","vfx/lights/veh_default_tail_light_l","taillights");
	lib_A59E::func_1842("vfx/explosion/vehicle_generic_ai_explo_lrg_runner","TAG_DEATH_FX",undefined,undefined,undefined,undefined,0);
}

//Function Number: 2
lib_A62A::func_4D0D()
{
	lib_A5DE::snd_message("atlas_van_explode");
}

//Function Number: 3
lib_A62A::func_7EF4(param_00)
{
	return param_00;
}

//Function Number: 4
lib_A62A::func_7F1D()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 2;var_01++)
	{
		var_00[var_01] = spawnstruct();
	}

	var_00[0].var_85A8 = "tag_driver";
	var_00[1].var_85A8 = "tag_passenger";
	var_00[0].var_4B60 = %civ_domestic_truck_driver_idle;
	var_00[1].var_4B60 = %civ_domestic_truck_passenger_idle;
	return var_00;
}