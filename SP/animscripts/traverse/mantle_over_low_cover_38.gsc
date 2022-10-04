/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: mantle_over_low_cover_38.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 112 ms
 * Timestamp: 4/20/2022 8:19:44 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CBC("window_38",38);
		return;
	}

	func_596B();
}

//Function Number: 2
func_596B()
{
	var_00 = [];
	var_00["traverseAnim"] = common_scripts\utility::random([%traverse_mantle_over_low_cover_38_var1,%traverse_mantle_over_low_cover_38_var2]);
	var_00["traverseHeight"] = 0;
	animscripts\traverse\shared::func_2D85(var_00);
}