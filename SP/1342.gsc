/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 1342.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:21:53 PM
*******************************************************************/

//Function Number: 1
lib_053E::initstructs()
{
	level.struct = [];
}

//Function Number: 2
lib_053E::createstruct()
{
	var_00 = spawnstruct();
	level.struct[level.struct.size] = var_00;
	return var_00;
}