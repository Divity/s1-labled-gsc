/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42263.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:22:03 PM
*******************************************************************/

//Function Number: 1
lib_A517::createfx()
{
	level.func_position_player = ::lib_A517::func_position_player;
	level.func_position_player_get = ::lib_A517::func_position_player_get;
	level.func_loopfxthread = ::common_scripts\_fx::loopfxthread;
	level.func_oneshotfxthread = ::common_scripts\_fx::oneshotfxthread;
	level.func_create_loopsound = ::common_scripts\_fx::create_loopsound;
	level.func_updatefx = ::common_scripts\_createfx::restart_fx_looper;
	level.func_process_fx_rotater = ::common_scripts\_createfx::process_fx_rotater;
	level.func_player_speed = ::lib_A517::func_player_speed;
	level.mp_createfx = 0;
	common_scripts\utility::array_call(function_00D6(),::delete);
	common_scripts\utility::array_call(function_00D8(),::delete);
	var_00 = function_00D6();
	common_scripts\utility::array_call(var_00,::delete);
	common_scripts\_createfx::createfx_common();
	thread common_scripts\_createfx::createfxlogic();
	thread common_scripts\_createfx::func_get_level_fx();
	level.var_31D method_8119(0);
	level.var_31D method_811A(0);
	lib_A517::func_2412();
	level waittill("eternity");
}

//Function Number: 2
lib_A517::func_2412()
{
	var_00 = [];
	var_00["trigger_createart_transient"] = ::lib_A594::func_9762;
	foreach(var_04, var_02 in var_00)
	{
		var_03 = getentarray(var_04,"classname");
		common_scripts\utility::array_levelthread(var_03,var_02);
	}
}

//Function Number: 3
lib_A517::func_position_player_get(param_00)
{
	if(distancesquared(param_00,level.var_31D.var_2E6) > 4096)
	{
		setdvar("createfx_playerpos_x",level.var_31D.var_2E6[0]);
		setdvar("createfx_playerpos_y",level.var_31D.var_2E6[1]);
		setdvar("createfx_playerpos_z",level.var_31D.var_2E6[2]);
	}

	return level.var_31D.var_2E6;
}

//Function Number: 4
lib_A517::func_position_player()
{
	var_00 = [];
	var_00[0] = getdvarint("createfx_playerpos_x");
	var_00[1] = getdvarint("createfx_playerpos_y");
	var_00[2] = getdvarint("createfx_playerpos_z");
	level.var_31D setorigin((var_00[0],var_00[1],var_00[2]));
}

//Function Number: 5
lib_A517::func_player_speed()
{
	function_00D3("g_speed",level._createfx.player_speed);
}