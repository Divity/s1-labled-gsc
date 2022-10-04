/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_over_40_down_88.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 85 ms
 * Timestamp: 4/20/2022 8:19:37 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_4934();
}

//Function Number: 2
func_4934()
{
	var_00[0] = %hms_greece_traverse_upper_2_lower_floor_40_88;
	var_00[1] = %hms_greece_traverse_upper_2_lower_floor_40_88_b;
	var_01 = [];
	var_01["traverseAnim"] = var_00[randomint(var_00.size)];
	var_01["traverseHeight"] = 40;
	animscripts\traverse\shared::func_2D85(var_01);
}