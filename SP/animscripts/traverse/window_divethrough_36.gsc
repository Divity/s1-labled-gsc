/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: window_divethrough_36.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 88 ms
 * Timestamp: 4/20/2022 8:19:54 PM
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
	var_00["traverseAnim"] = %traverse_window_m_2_dive;
	var_00["traverseStopsAtEnd"] = 1;
	var_00["traverseHeight"] = 36;
	animscripts\traverse\shared::func_2D85(var_00);
}