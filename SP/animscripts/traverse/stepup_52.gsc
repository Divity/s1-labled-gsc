/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: stepup_52.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 88 ms
 * Timestamp: 4/20/2022 8:19:52 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CA8(52,5);
		return;
	}

	func_589A();
}

//Function Number: 2
func_589A()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_stepup_52;
	var_00["traverseHeight"] = 52;
	animscripts\traverse\shared::func_2D85(var_00);
}