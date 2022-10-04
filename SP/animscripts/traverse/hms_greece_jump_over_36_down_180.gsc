/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_over_36_down_180.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 89 ms
 * Timestamp: 4/20/2022 8:19:37 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_4932();
}

//Function Number: 2
func_4932()
{
	var_00[0] = %hms_greece_traverse_balcony_ledge_180;
	var_00[1] = %hms_greece_traverse_balcony_ledge_180_b;
	var_01 = [];
	var_01["traverseAnim"] = var_00[randomint(var_00.size)];
	var_01["traverseHeight"] = 36;
	animscripts\traverse\shared::func_2D85(var_01);
}