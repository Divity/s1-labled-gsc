/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: duck_under_56.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 44 ms
 * Timestamp: 4/20/2022 8:19:34 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	self method_8110("jumpanim",%gulag_pipe_traverse,%body,1,0.1,1);
	self waittillmatch("finish","jumpanim");
	self method_818D("gravity");
	animscripts\shared::func_2D05("jumpanim");
}