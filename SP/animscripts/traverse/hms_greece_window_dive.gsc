/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: hms_greece_window_dive.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 131 ms
 * Timestamp: 4/20/2022 8:19:38 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_4935();
}

//Function Number: 2
func_4935()
{
	var_00 = [];
	var_00[0] = %hms_greece_alleys_trav_over_40_window_dive;
	var_01 = [];
	var_01["traverseAnim"] = var_00[randomint(var_00.size)];
	thread func_420F();
	animscripts\traverse\shared::func_2D85(var_01);
}

//Function Number: 3
func_420F()
{
	level waittill("glass_break");
	if(isdefined(self))
	{
		glassradiusdamage(self.var_2E6,48,1000,1000);
	}
}