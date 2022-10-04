/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: first_frame.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 30 ms
 * Timestamp: 4/20/2022 8:20:29 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("death");
	self endon("stop_first_frame");
	self notify("killanimscript");
	self.var_34F = 0;
	self method_8142(self.var_75DC,0.3);
	self method_818F("face angle",self.var_41[1]);
	self method_814B(level.var_78A9[self.var_553][self.var_5AD],1,0,0);
	self.var_5AD = undefined;
	self waittill("killanimscript");
}