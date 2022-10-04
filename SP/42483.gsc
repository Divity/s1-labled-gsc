/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42483.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 14
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:45 PM
*******************************************************************/

//Function Number: 1
lib_A5F3::main(param_00)
{
	lib_A5D2::func_28A0(::lib_A5F3::func_8852);
	thread lib_A5F3::func_0F56(param_00);
	lib_A5D2::func_7EC2("mw3");
}

//Function Number: 2
lib_A5F3::func_0F56(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	switch(param_00)
	{
		case "so_nyse_ny_manhattan":
			break;
	}
}

//Function Number: 3
lib_A5F3::func_8852(param_00,param_01)
{
	var_02 = 1;
	switch(param_00)
	{
		case "so_berlin_intro_littlebird_spawn":
			break;

		case "so_ied_littlebird":
			break;

		case "so_ied_wave4_littlebird":
			break;

		case "so_ied_wave3_tank":
			break;

		case "so_nyse_littlebird_spawn":
			break;

		case "so_start_harbor_player_hind":
			break;

		case "so_harbor_ally_helis":
			break;

		case "so_harbor_kill_helis":
			break;

		case "so_start_harbor_exit_hind":
			break;

		case "so_harbor_enemy_chopper_flyover":
			break;

		case "so_sub_missile_launch":
			break;

		default:
			break;
	}
}

//Function Number: 4
lib_A5F3::func_10A1()
{
	lib_A5D3::func_25BF("fire_wood_med",(-945,-2847,262),"steff_01",1000,1);
	lib_A5D3::func_25BF("fire_wood_med",(-1181,-2926,55),"steff_02",1000,1);
	lib_A5D3::func_25BF("fire_wood_med_tight",(-1004,-2927,42),"steff_03",1000,1);
	lib_A5D3::func_25BF("fire_crackle_med_tight",(-902,-2716,66),"steff_04",1000,1);
	lib_A5D3::func_25BF("fire_wood_med_tight",(-909,-2636,36),"steff_05",1000,1);
	lib_A5D3::func_25BF("fire_wood_med",(-686,-2120,91),"steff_car",1000,1);
	common_scripts\utility::play_loopsound_in_space("road_flare_lp_tight",(-141,271,2));
	common_scripts\utility::play_loopsound_in_space("road_flare_lp_tight",(-259,579,2));
	common_scripts\utility::play_loopsound_in_space("road_flare_lp_tight",(-475,980,10));
	common_scripts\utility::play_loopsound_in_space("road_flare_lp_tight",(-704,311,-7));
	lib_A5D3::func_25BF("fire_crackle_med_tight",(-471,1856,-22),"pre_stock_01",1000,1);
}

//Function Number: 5
lib_A5F3::func_0F5A(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	wait(0.05);
	param_00 playsoundasmaster("russian_sub_missile_launch");
	wait(1.25);
	param_00 playsoundasmaster("russian_sub_missile_launch_boom");
}

//Function Number: 6
lib_A5F3::func_0F6C()
{
	level.var_E57.var_2360 = (0,0,0);
	self waittill("deathspin");
	thread lib_A5F3::func_0F69();
	thread common_scripts\utility::play_loop_sound_on_entity("so_littlebird_helicopter_dying_loop");
	common_scripts\utility::waittill_either("death","crash_done");
	thread common_scripts\utility::play_sound_in_space("so_littlebird_helicopter_crash",level.var_E57.var_2360);
}

//Function Number: 7
lib_A5F3::func_0F69()
{
	self endon("death");
	for(;;)
	{
		if(isdefined(self))
		{
			self.var_2E6 = level.var_E57.var_2360;
			wait(0.05);
		}
	}
}

//Function Number: 8
lib_A5F3::func_1047()
{
	lib_A5F3::func_0F4A("ied_tank_01","us_tank_treads_lp_02","us_tank_move_low_lp","us_tank_idle_lp");
	lib_A5F3::func_10B5();
}

//Function Number: 9
lib_A5F3::func_0F4A(param_00,param_01,param_02,param_03)
{
	if(isdefined(self))
	{
		level.var_E57.var_4E84 = spawn("script_origin",self.var_2E6);
		var_04 = spawn("script_origin",self.var_2E6);
		var_05 = spawn("script_origin",self.var_2E6);
		var_06 = spawn("script_origin",self.var_2E6);
		level.var_E57.var_4E84.var_35DA = 1;
		var_07 = level.var_E57.var_4E84;
		var_08 = level.var_E57.var_4E84.var_35DA;
		var_04 linkto(self);
		var_06 linkto(self);
		var_05 linkto(self);
		if(isdefined(var_04) || isdefined(param_01))
		{
			var_04 playloopsound(param_01);
		}

		if(isdefined(var_05) || isdefined(param_02))
		{
			var_05 playloopsound(param_02);
		}

		if(isdefined(var_06) || isdefined(param_03))
		{
			var_06 playloopsound(param_03);
		}

		var_04 scalevolume(0);
		var_05 scalevolume(0);
		var_06 scalevolume(0);
		wait(0.3);
		lib_A5F3::func_0F4B(var_07,var_04,var_05,var_06,1,5,var_08);
	}
}

//Function Number: 10
lib_A5F3::func_0F4B(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	param_04 = 1;
	param_05 = 5;
	thread lib_A5F3::func_0F49(param_00,param_01,param_02,param_03);
	thread lib_A5F3::func_0ED3();
	param_00 endon("instance_killed");
	var_07 = 0;
	for(;;)
	{
		if(isdefined(self))
		{
			var_08 = self veh_getspeed();
			var_08 = min(var_08,param_05);
			var_08 = lib_A5D2::func_1095(var_07,var_08,0.1);
			var_09 = lib_A5D2::func_2899(var_08,param_04,param_05,level.var_E57.var_3336["veh_drive_vol"]);
			var_0A = lib_A5D2::func_2899(var_08,param_04,param_05,level.var_E57.var_3336["veh_idle_vol"]);
			param_02 scalevolume(var_09,0.1);
			param_01 scalevolume(var_09,0.1);
			param_03 scalevolume(var_0A,0.1);
			var_07 = var_08;
			wait(0.1);
		}
	}
}

//Function Number: 11
lib_A5F3::func_0ED3()
{
	level.var_E57.var_3336["veh_drive_vol"] = [[0,0],[0.05,0.1],[0.1,0.1],[0.2,0.2],[0.3,0.3],[0.4,0.4],[0.5,0.5],[0.6,0.6],[0.8,0.8],[1,1]];
	level.var_E57.var_3336["veh_idle_vol"] = [[0,1],[0.05,0.85],[0.1,0.6],[0.2,0.5],[0.3,0.4],[0.4,0.1],[0.5,0],[0.6,0],[0.8,0],[1,0]];
}

//Function Number: 12
lib_A5F3::func_0F49(param_00,param_01,param_02,param_03)
{
	if(isdefined(self))
	{
		self waittill("death");
		param_00 notify("instance_killed");
		thread lib_A5F3::func_0F1A(param_01,5);
		thread lib_A5F3::func_0F1A(param_02,5);
		thread lib_A5F3::func_0F1A(param_03,5);
	}
}

//Function Number: 13
lib_A5F3::func_10B5()
{
	self endon("death");
	if(isdefined(self))
	{
		for(;;)
		{
			self waittill("weapon_fired");
			var_00 = randomfloatrange(0.2,0.4);
			thread common_scripts\utility::play_sound_in_space("us_tank_big_boom",self.var_2E6);
			thread common_scripts\utility::play_sound_in_space("us_tank_fire_dist",self.var_2E6);
			thread common_scripts\utility::play_sound_in_space("us_tank_fire_close",self.var_2E6);
			thread common_scripts\utility::play_sound_in_space("us_tank_fire_hi_ring",self.var_2E6);
			thread common_scripts\utility::play_sound_in_space("us_tank_fire_lfe",self.var_2E6);
			wait(0.2);
			thread common_scripts\utility::play_sound_in_space("us_tank_dist_verb",self.var_2E6);
			wait(var_00);
		}
	}
}

//Function Number: 14
lib_A5F3::func_0F1A(param_00,param_01)
{
	param_00 scalevolume(0,param_01);
	wait(param_01 + 0.05);
	param_00 stoploopsound();
	wait(0.05);
	param_00 delete();
}