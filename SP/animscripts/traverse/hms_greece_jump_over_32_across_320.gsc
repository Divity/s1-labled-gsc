/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_over_32_across_320.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 88 ms
 * Timestamp: 4/20/2022 8:19:35 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_492C();
}

//Function Number: 2
func_492C()
{
	var_00 = [];
	var_00["traverseAnim"] = %hms_greece_traverse_balcony_custom_01;
	var_00["traverseHeight"] = 32;
	animscripts\traverse\shared::func_2D85(var_00);
}