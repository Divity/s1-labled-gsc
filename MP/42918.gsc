/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42918.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 4/20/2022 8:18:28 PM
*******************************************************************/

//Function Number: 1
lib_A7A6::init()
{
	level thread lib_A7A6::onplayerconnect();
}

//Function Number: 2
lib_A7A6::onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		if(!isai(var_00))
		{
		}
	}
}