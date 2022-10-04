/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ladder_down.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 44 ms
 * Timestamp: 4/20/2022 8:19:43 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(isdefined(self.type) && self.type == "dog")
	{
		return;
	}

	animscripts\traverse\shared::func_2D8C(%ladder_climbon,%ladder_climbdown,undefined,"noclip","stand","stop");
}