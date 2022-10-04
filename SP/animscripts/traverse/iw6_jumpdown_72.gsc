/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: iw6_jumpdown_72.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 85 ms
 * Timestamp: 4/20/2022 8:19:39 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CA7(7,0.7);
		return;
	}

	func_4AFE();
}

//Function Number: 2
func_4AFE()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_jumpdown_72_iw6;
	animscripts\traverse\shared::func_2D85(var_00);
}