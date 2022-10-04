/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: wall_hop.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 87 ms
 * Timestamp: 4/20/2022 8:19:53 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CBC("wallhop",40);
		return;
	}

	func_A13F();
}

//Function Number: 2
func_A13F()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_window_quick;
	var_00["traverseHeight"] = 40;
	if(randomint(100) < 30)
	{
		var_00["traverseAnim"] = %traverse_wallhop_3;
	}
	else
	{
		var_00["traverseAnim"] = %traverse_wallhop;
	}

	animscripts\traverse\shared::func_2D85(var_00);
}