/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42350.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:22 PM
*******************************************************************/

//Function Number: 1
lib_A56E::func_2DC0(param_00,param_01,param_02,param_03)
{
}

//Function Number: 2
lib_A56E::draw_axis(param_00,param_01,param_02,param_03)
{
}

//Function Number: 3
lib_A56E::func_2DAD(param_00,param_01,param_02,param_03,param_04)
{
}

//Function Number: 4
lib_A56E::func_23A9(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = 2;
	if(isdefined(param_05))
	{
		var_06 = param_05;
	}

	var_07 = level.var_31D lib_A53C::func_23ED("default",var_06);
	var_07.x = param_01;
	var_07.y = param_02;
	var_07.fontscale = 1;
	var_07.horzalign = "fullscreen";
	var_07.vertalign = "fullscreen";
	var_07.alpha = 1;
	if(!isdefined(param_03))
	{
		param_03 = (1,1,1);
	}

	var_07.color = param_03;
	if(isdefined(param_04))
	{
		var_07.label = param_04;
	}

	level.var_2711[param_00] = var_07;
}

//Function Number: 5
lib_A56E::func_6F92(param_00,param_01)
{
	level.var_2711[param_00] setvalue(param_01);
}

//Function Number: 6
lib_A56E::func_6F93(param_00,param_01)
{
	level.var_2711[param_00] settext(param_01);
}

//Function Number: 7
lib_A56E::func_1C6B(param_00,param_01)
{
	level.var_2711[param_00].color = param_01;
}

//Function Number: 8
lib_A56E::func_2807(param_00)
{
	level.var_2711[param_00] destroy();
	level.var_2711[param_00] = undefined;
}