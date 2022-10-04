/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_over_32_across_352.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 85 ms
 * Timestamp: 4/20/2022 8:19:35 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_492D();
}

//Function Number: 2
func_492D()
{
	var_00 = [];
	var_00["traverseAnim"] = %hms_greece_traverse_balcony_custom_03;
	var_00["traverseHeight"] = 32;
	animscripts\traverse\shared::func_2D85(var_00);
}