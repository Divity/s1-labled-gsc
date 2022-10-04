/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_over_36_down_128.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 87 ms
 * Timestamp: 4/20/2022 8:19:36 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_4930();
}

//Function Number: 2
func_4930()
{
	var_00[0] = %hms_greece_traverse_railing_drop_36_128;
	var_00[1] = %hms_greece_traverse_railing_drop_36_128_b;
	var_01 = [];
	var_01["traverseAnim"] = var_00[randomint(var_00.size)];
	var_01["traverseHeight"] = 36;
	animscripts\traverse\shared::func_2D85(var_01);
}