/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: _playercards - 42918.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 176 ms
 * Timestamp: 4/20/2022 8:14:31 PM
*******************************************************************/

//Function Number: 1
init()
{
	level thread onplayerconnect();
}

//Function Number: 2
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		if(!isai(var_00))
		{
		}
	}
}