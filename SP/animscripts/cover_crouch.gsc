/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_crouch.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 71 ms
 * Timestamp: 4/20/2022 8:20:20 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("killanimscript");
	animscripts\utility::func_4DD4("cover_crouch");
	animscripts\cover_wall::func_229A("crouch");
}

//Function Number: 2
end_script()
{
	self.var_22A0 = undefined;
	animscripts\cover_behavior::end_script("crouch");
}