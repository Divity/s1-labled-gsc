/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: iw6_jumpup_72.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 237 ms
 * Timestamp: 4/20/2022 8:19:40 PM
*******************************************************************/

//Function Number: 1
main()
{
	if(self.type == "dog")
	{
		animscripts\traverse\shared::func_2CA8(72,5);
		return;
	}

	func_589A();
}

//Function Number: 2
func_589A()
{
	var_00 = [];
	var_00["traverseAnim"] = %traverse_72_up_run;
	var_00["traverseHeight"] = 72;
	func_2D86(var_00);
}

//Function Number: 3
func_2D86(param_00)
{
	self endon("killanimscript");
	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	var_01 = self getnegotiationstartnode();
	var_01.var_9723 = var_01.var_2E6[2] + var_01.var_9724;
	var_02 = self getnegotiationendnode();
	self method_818F("face angle",var_01.var_41[1]);
	self.var_9736 = param_00["traverseHeight"];
	self.var_9738 = var_01;
	var_03 = param_00["traverseAnim"];
	var_04 = param_00["traverseToCoverAnim"];
	self method_818D("gravity");
	self.var_9739 = self.var_2E6[2];
	if(!animhasnotetrack(var_03,"traverse_align"))
	{
		animscripts\traverse\shared::func_4680();
	}

	var_05 = 0;
	if(isdefined(var_04) && isdefined(self.node) && self.node.type == param_00["coverType"] && distancesquared(self.node.var_2E6,var_02.var_2E6) < 625)
	{
		if(animscripts\utility::func_6C4(self.node.var_41[1] - var_02.var_41[1]) > 160)
		{
			var_05 = 1;
			var_03 = var_04;
		}
	}

	if(var_05)
	{
		if(isdefined(param_00["traverseToCoverSound"]))
		{
			thread lib_A59A::play_sound_on_entity(param_00["traverseToCoverSound"]);
		}
	}
	else if(isdefined(param_00["traverseSound"]))
	{
		thread lib_A59A::play_sound_on_entity(param_00["traverseSound"]);
	}

	self.var_972E = var_03;
	self.var_972F = %body;
	self method_8110("traverseAnim",var_03,%body,1,0.2,1);
	self.var_9733 = 0;
	self.var_9732 = param_00["interruptDeathAnim"];
	animscripts\shared::func_2D05("traverseAnim",::func_4684);
	self method_818D("gravity");
	if(self.var_113)
	{
		return;
	}

	self.var_7.var_612B = 0;
	if(var_05 && isdefined(self.node) && distancesquared(self.var_2E6,self.node.var_2E6) < 256)
	{
		self.var_7.var_5F58 = "stop";
		self method_81C5(self.node.var_2E6);
	}
	else if(isdefined(param_00["traverseStopsAtEnd"]))
	{
		self.var_7.var_5F58 = "stop";
	}
	else
	{
		self.var_7.var_5F58 = "run";
		self method_8142(var_03,0.2);
	}

	self.var_972F = undefined;
	self.var_972E = undefined;
	self.var_2651 = undefined;
}

//Function Number: 4
func_4684(param_00)
{
	if(param_00 == "traverse_death")
	{
		return animscripts\traverse\shared::func_4681();
	}

	if(param_00 == "traverse_align")
	{
		self.var_9739 = self.var_2E6[2];
		return animscripts\traverse\shared::func_4680();
	}

	if(param_00 == "traverse_drop")
	{
		return animscripts\traverse\shared::func_4682();
	}
}