/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42747.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:54 PM
*******************************************************************/

//Function Number: 1
lib_A6FB::main()
{
	level.var_99DA = 1;
	level.var_31D = getentarray("player","classname")[0];
	if(function_0235())
	{
		lib_A6FD::main();
		return;
	}

	lib_A6FC::main();
}