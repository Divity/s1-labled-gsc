/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: scripted.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 69 ms
 * Timestamp: 4/20/2022 8:20:44 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("death");
	self notify("killanimscript");
	self notify("clearSuppressionAttack");
	self.var_7.var_8FE2 = 0;
	self.var_2001["root"] = %body;
	self endon("end_sequence");
	self method_8241(self.var_2001["notifyName"],self.var_2001["origin"],self.var_2001["angles"],self.var_2001["anim"],self.var_2001["animMode"],self.var_2001["root"],self.var_2001["goalTime"]);
	self.var_2001 = undefined;
	if(isdefined(self.var_7B2F) || isdefined(self.var_35C0))
	{
		animscripts\face::func_7825(self.var_35C0,self.var_7B2F,0.9,"scripted_anim_facedone");
		self.var_35C0 = undefined;
		self.var_7B2F = undefined;
	}

	if(isdefined(self.var_266F))
	{
		self.var_266E = self.var_266F;
	}

	self waittill("killanimscript");
}

//Function Number: 2
init(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self.var_2001["notifyName"] = param_00;
	self.var_2001["origin"] = param_01;
	self.var_2001["angles"] = param_02;
	self.var_2001["anim"] = param_03;
	if(isdefined(param_04))
	{
		self.var_2001["animMode"] = param_04;
	}
	else
	{
		self.var_2001["animMode"] = "normal";
	}

	if(isdefined(param_05))
	{
		self.var_2001["root"] = param_05;
	}
	else
	{
		self.var_2001["root"] = %body;
	}

	self.var_2001["goalTime"] = param_06;
}