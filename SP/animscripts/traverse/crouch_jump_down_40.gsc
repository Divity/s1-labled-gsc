/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: crouch_jump_down_40.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 47 ms
 * Timestamp: 4/20/2022 8:19:34 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_28B3 = "crouch";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self.var_7.var_5F58 = "walk";
	self method_818D("nogravity");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	self method_8110("stepanim",%jump_across_72,%body,1,0.1,1);
	wait(0.15);
	self method_818D("gravity");
	animscripts\shared::func_2D05("stepanim");
}