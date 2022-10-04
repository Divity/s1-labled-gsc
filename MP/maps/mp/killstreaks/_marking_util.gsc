/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _marking_util - 42949.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 44 ms
 * Timestamp: 4/20/2022 8:16:19 PM
*******************************************************************/

//Function Number: 1
playerprocesstaggedassist(param_00)
{
	if(level.teambased && isdefined(param_00))
	{
		thread maps\mp\_events::processassistevent(param_00);
	}
}