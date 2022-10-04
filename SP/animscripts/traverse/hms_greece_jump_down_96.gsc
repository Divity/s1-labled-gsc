/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_jump_down_96.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 87 ms
 * Timestamp: 4/20/2022 8:19:35 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_492B();
}

//Function Number: 2
func_492B()
{
	var_00 = [];
	var_00[0] = %hms_greece_traverse_jumpdown96_01;
	var_00[1] = %hms_greece_traverse_jumpdown96_02;
	var_01 = [];
	var_01["traverseAnim"] = var_00[randomint(var_00.size)];
	animscripts\traverse\shared::func_2D85(var_01);
}