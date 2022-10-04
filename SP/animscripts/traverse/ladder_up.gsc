/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: ladder_up.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 43 ms
 * Timestamp: 4/20/2022 8:19:43 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(isdefined(self.type) && self.type == "dog")
	{
		return;
	}

	animscripts\traverse\shared::func_2D8C(undefined,%ladder_climbup,%ladder_climboff,"noclip","crouch","run");
}