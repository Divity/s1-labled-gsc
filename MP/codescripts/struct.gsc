/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: struct - 1342.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 97 ms
 * Timestamp: 4/20/2022 8:12:05 PM
*******************************************************************/

//Function Number: 1
initstructs()
{
	level.struct = [];
}

//Function Number: 2
createstruct()
{
	var_00 = spawnstruct();
	level.struct[level.struct.size] = var_00;
	return var_00;
}