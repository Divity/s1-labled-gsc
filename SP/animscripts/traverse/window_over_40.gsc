/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: window_over_40.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 167 ms
 * Timestamp: 4/20/2022 8:19:54 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CBC("window_40",40);
		return;
	}

	func_52BB();
}

//Function Number: 2
func_52BB()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_window_m_2_run;
	var_00["traverseToCoverAnim"] = %traverse_window_m_2_stop;
	var_00["coverType"] = "Cover Crouch";
	var_00["traverseHeight"] = 36;
	var_00["interruptDeathAnim"][0] = animscripts\utility::func_CD8(%traverse_window_death_start);
	var_00["interruptDeathAnim"][1] = animscripts\utility::func_CD8(%traverse_window_death_end);
	animscripts\traverse\shared::func_2D85(var_00);
}