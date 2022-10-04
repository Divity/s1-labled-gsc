/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: mantle_over_low_cover_40.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 89 ms
 * Timestamp: 4/20/2022 8:19:44 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CBC("window_40",40);
		return;
	}

	func_596C();
}

//Function Number: 2
func_596C()
{
	var_00 = [];
	var_00["traverseAnim"] = common_scripts\utility::random([%traverse_mantle_over_low_cover_40_var1,%traverse_mantle_over_low_cover_40_var2]);
	var_00["traverseHeight"] = 0;
	animscripts\traverse\shared::func_2D85(var_00);
}