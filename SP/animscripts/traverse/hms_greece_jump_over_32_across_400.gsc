/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_over_32_across_400.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 90 ms
 * Timestamp: 4/20/2022 8:19:36 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_492E();
}

//Function Number: 2
func_492E()
{
	var_00 = [];
	var_00["traverseAnim"] = %hms_greece_traverse_balcony_custom_02;
	var_00["traverseHeight"] = 32;
	animscripts\traverse\shared::func_2D85(var_00);
}