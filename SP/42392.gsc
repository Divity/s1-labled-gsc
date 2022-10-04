/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42392.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:23:26 PM
*******************************************************************/

//Function Number: 1
lib_A598::init()
{
	lib_A596::init();
	lib_A597::init();
}

//Function Number: 2
lib_A598::func_9BB1(param_00)
{
	var_01 = self getplayerprofiledata("sp_upgradePurchased",param_00) == "1";
	return var_01;
}