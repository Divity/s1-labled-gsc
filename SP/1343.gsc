/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 1343.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:54 PM
*******************************************************************/

//Function Number: 1
lib_053F::func_00B8(param_00)
{
	if(isdefined(level.var_422F))
	{
		[[ level.var_422F ]](param_00);
		return;
	}

	iprintlnbold("no level handler for: " + param_00);
}