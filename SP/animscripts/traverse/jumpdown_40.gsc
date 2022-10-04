/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: jumpdown_40.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 89 ms
 * Timestamp: 4/20/2022 8:19:42 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CA7(3,1);
		return;
	}

	func_589A();
}

//Function Number: 2
func_589A()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_jumpdown_40;
	var_00["traverseHeight"] = 0;
	animscripts\traverse\shared::func_2D85(var_00);
}