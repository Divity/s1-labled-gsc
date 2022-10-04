/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42949.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:18:33 PM
*******************************************************************/

//Function Number: 1
lib_A7C5::playerprocesstaggedassist(param_00)
{
	if(level.teambased && isdefined(param_00))
	{
		thread maps\mp\_events::processassistevent(param_00);
	}
}