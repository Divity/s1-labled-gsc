/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_drop_pod_qte.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 102 ms
 * Timestamp: 4/20/2022 8:21:41 PM
*******************************************************************/

//Function Number: 1
func_0C19(param_00,param_01,param_02)
{
	thread lib_A506::func_C18(param_00,param_02);
	var_03 = function_0063(param_01 lib_A59A::func_3EF3(param_02));
	var_04 = 9.3;
	var_05 = 14.6666;
	wait(var_04);
	level.var_31D notify("start_droppod_qte");
	thread func_6FDE(param_01);
	wait(var_05 - var_04);
	level.var_31D notify("end_process_buttonmash");
	param_01 method_814C(%seo_pod_phase3_vm_root,0,0.5,1);
	if(param_01.var_1961 >= 1)
	{
		wait(var_03 - var_05);
		level.var_31D notify("end_droppod_qte");
		return 1;
	}

	return 0;
}

//Function Number: 2
func_6FDE(param_00)
{
	level.var_31D endon("end_process_buttonmash");
	param_00.var_195D = 0.025;
	param_00.var_1961 = 0;
	param_00.var_195B = 0.15;
	param_00.var_195F = 1.2;
	level.var_31D notifyonplayercommand("x_pressed","+usereload");
	level.var_31D notifyonplayercommand("x_pressed","+activate");
	param_00 method_814C(%seo_pod_phase3_vm_root,0.01,0,1);
	param_00 method_814C(%seo_pod_phase3_vm_add,1);
	param_00 method_8117(%seo_pod_phase3_vm_add,1);
	if(level.var_31D common_scripts\utility::is_player_gamepad_enabled())
	{
		level.var_31D thread lib_A571::func_1950(&"SEOUL_TAP_X_TO_PULL_LEVER","+usereload","end_process_buttonmash","+activate");
	}
	else
	{
		level.var_31D thread lib_A571::func_1950(&"SEOUL_TAP_X_TO_PULL_LEVER","+reload","end_process_buttonmash","+activate");
	}

	thread func_0C67(param_00,"x_pressed","b_pressed","a_pressed");
	for(;;)
	{
		level.var_31D common_scripts\utility::waittill_any("x_pressed","b_pressed","a_pressed");
		param_00.var_1961 = param_00.var_1961 + param_00.var_195B;
		if(param_00.var_1961 > param_00.var_195F)
		{
			param_00.var_1961 = param_00.var_195F;
		}
	}
}

//Function Number: 3
func_0C67(param_00,param_01,param_02,param_03)
{
	level.var_31D endon("end_process_buttonmash");
	level.var_31D endon(param_01);
	level.var_31D endon(param_02);
	level.var_31D endon(param_03);
	var_04 = 0.05;
	var_05 = param_00.var_1961;
	if(param_00.var_1961 > 0.95)
	{
		var_05 = 1;
	}

	param_00 method_814C(%seo_pod_phase3_vm_root,var_05,var_04,1);
	wait(var_04);
	for(;;)
	{
		param_00.var_1961 = param_00.var_1961 - param_00.var_195D;
		if(param_00.var_1961 < 0)
		{
			param_00.var_1961 = 0;
		}

		var_05 = param_00.var_1961;
		if(param_00.var_1961 <= 0)
		{
			var_05 = 0.01;
		}

		param_00 method_814C(%seo_pod_phase3_vm_root,var_05,var_04,1);
		wait(var_04);
	}
}