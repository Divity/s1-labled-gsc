/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: iw6_traverse_over_40_b.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 85 ms
 * Timestamp: 4/20/2022 8:19:40 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CBC("window_40",40);
		return;
	}

	func_589A();
}

//Function Number: 2
func_589A()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_over_40_b_iw6;
	var_00["traverseToCoverAnim"] = %traverse40_2_cover;
	var_00["coverType"] = "Cover Crouch";
	var_00["traverseHeight"] = 40;
	var_00["interruptDeathAnim"][0] = animscripts\utility::func_CD8(%traverse40_death_start,%traverse40_death_start_2);
	var_00["interruptDeathAnim"][1] = animscripts\utility::func_CD8(%traverse40_death_end,%traverse40_death_end_2);
	animscripts\traverse\shared::func_2D85(var_00);
}