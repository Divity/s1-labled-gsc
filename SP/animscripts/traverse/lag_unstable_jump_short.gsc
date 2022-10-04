/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: lag_unstable_jump_short.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 46 ms
 * Timestamp: 4/20/2022 8:19:44 PM
*******************************************************************/

//Function Number: 1
main()
{
	var_00 = [];
	if(animscripts\traverse\shared::func_4039() == "Right")
	{
		var_00["traverseAnim"] = %lag_unstable_jump_a_short_l;
	}
	else
	{
		var_00["traverseAnim"] = %lag_unstable_jump_a_short_r;
	}

	var_00["traverseNotetrackFunc"] = ::animscripts\traverse\shared::func_4683;
	animscripts\traverse\shared::func_2D85(var_00);
	self method_8110("traverse_align",%lag_unstable_jumparrive_8,%body,1,0.2,1);
	animscripts\shared::func_2D05("traverse_align",::animscripts\traverse\shared::func_4683);
}