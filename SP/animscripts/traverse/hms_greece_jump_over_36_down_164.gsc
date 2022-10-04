/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_over_36_down_164.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 88 ms
 * Timestamp: 4/20/2022 8:19:36 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_4931();
}

//Function Number: 2
func_4931()
{
	var_00[0] = %hms_greece_traverse_upper_2_lower_floor_36_164;
	var_00[1] = %hms_greece_traverse_upper_2_lower_floor_36_164_b;
	var_01 = [];
	var_01["traverseAnim"] = var_00[randomint(var_00.size)];
	var_01["traverseHeight"] = 36;
	animscripts\traverse\shared::func_2D85(var_01);
}