/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: jumpdown_130.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 125 ms
 * Timestamp: 4/20/2022 8:19:41 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CA7(7,0.7);
		return;
	}

	func_52C1();
}

//Function Number: 2
func_52C1()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_jumpdown_130;
	animscripts\traverse\shared::func_2D85(var_00);
}