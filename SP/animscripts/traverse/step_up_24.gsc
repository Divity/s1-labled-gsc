/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: step_up_24.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 87 ms
 * Timestamp: 4/20/2022 8:19:51 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CA8(24,5);
		return;
	}

	func_4AFE();
}

//Function Number: 2
func_4AFE()
{
	var_00 = [];
	var_00["traverseAnim"] = %sw_traversal_suspension_on;
	var_00["traverseHeight"] = 24;
	animscripts\traverse\shared::func_2D85(var_00);
}