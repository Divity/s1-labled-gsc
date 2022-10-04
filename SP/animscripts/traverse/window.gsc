/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: window.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 43 ms
 * Timestamp: 4/20/2022 8:19:53 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_28B3 = "crouch";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	self method_8110("diveanim",%windowclimb,%body,1,0.1,1);
	self waittillmatch("gravity on","diveanim");
	self method_818D("gravity");
	animscripts\shared::func_2D05("diveanim");
}