/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: step_up_12.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 44 ms
 * Timestamp: 4/20/2022 8:19:50 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("killanimscript");
	var_00 = self getnegotiationstartnode();
	self method_818F("face angle",var_00.var_41[1]);
	var_01 = var_00.var_9723 - var_00.var_2E6[2];
	var_02 = var_01;
	var_03 = 6;
	var_04 = (0,0,var_02 / var_03);
	self method_818D("noclip");
	for(var_05 = 0;var_05 < var_03;var_05++)
	{
		self method_81C5(self.var_2E6 + var_04);
		wait(0.05);
	}

	self method_818D("gravity");
}