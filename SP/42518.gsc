/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42518.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:46 PM
*******************************************************************/

//Function Number: 1
lib_A616::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("ft101_tank",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A616::func_4D0D);
	lib_A59E::func_1845("vehicle_ft101_tank","vehicle_ft101_tank_dstrypv");
	lib_A59E::func_1868("tankblast");
	lib_A59E::func_184B("vfx/distortion/tank_exhaust");
	lib_A59E::func_1847("vfx/dust/tank_deck_dust");
	lib_A59E::func_186E();
	lib_A59E::func_1842("vfx/explosion/vehicle_ft101_ai_explo_runner","TAG_DEATH_FX","exp_armor_vehicle",undefined,undefined,undefined,0);
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_1865("tank_rumble",0.15,4.5,900,1,1);
	lib_A59E::func_186A("allies");
	lib_A59E::func_185A();
	lib_A59E::func_1839(::lib_A616::func_7F1D,::lib_A616::func_7EF4);
	lib_A59E::func_184C(0.33);
	lib_A59E::func_1857(param_02,"headlight_TOP_L","TAG_LIGHT_RIGHT_TOP","vfx/lights/headlight_gaz_yellow","headlights",0);
	lib_A59E::func_1857(param_02,"headlight_TOP_R","TAG_LIGHT_LEFT_TOP","vfx/lights/headlight_gaz_yellow","headlights",0);
	lib_A59E::func_1857(param_02,"headlight_L","TAG_LIGHT_RIGHT","vfx/lights/headlight_gaz_yellow","headlights",0);
	lib_A59E::func_1857(param_02,"headlight_R","TAG_LIGHT_LEFT","vfx/lights/headlight_gaz_yellow","headlights",0);
}

//Function Number: 2
lib_A616::func_4D0D()
{
	thread lib_A616::func_4630();
	self.var_4703 = 1;
}

//Function Number: 3
lib_A616::func_7EF4(param_00)
{
	return param_00;
}

//Function Number: 4
lib_A616::func_7F1D()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 11;var_01++)
	{
		var_00[var_01] = spawnstruct();
	}

	var_00[0].var_4068 = 1;
	return var_00;
}

//Function Number: 5
lib_A616::func_4630()
{
	if(isdefined(self.var_8E5))
	{
		self thread [[ self.var_8E5 ]]();
		return;
	}

	thread lib_A641::func_9D5C(1.5);
	thread lib_A641::func_9D5B(3,5,3,5);
	thread lib_A641::func_9D56();
}