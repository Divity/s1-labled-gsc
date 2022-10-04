/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: jumpdown_96.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 123 ms
 * Timestamp: 4/20/2022 8:19:42 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CA7(7,0.8);
		return;
	}

	func_589A();
}

//Function Number: 2
func_589A()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_jumpdown_96;
	animscripts\traverse\shared::func_2D85(var_00);
}