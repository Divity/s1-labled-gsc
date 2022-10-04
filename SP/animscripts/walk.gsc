/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: walk.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 169 ms
 * Timestamp: 4/20/2022 8:21:00 PM
*******************************************************************/

//Function Number: 1
func_5F99()
{
	var_00 = undefined;
	if(isdefined(self.var_2FD) && distancesquared(self.var_2E6,self.var_2FD) > 4096)
	{
		var_00 = "stand";
	}

	var_01 = [[ self.var_1D46 ]](var_00);
	switch(var_01)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 2
func_2D8E(param_00)
{
	self endon("movemode");
	self method_8142(%combatrun,0.6);
	self method_8147(%combatrun,%body,1,0.5,self.var_5F62);
	if(isarray(self.var_A0FF))
	{
		if(isdefined(self.var_A0FE))
		{
			var_01 = common_scripts\utility::choose_from_weighted_array(self.var_A0FF,self.var_A0FE);
		}
		else
		{
			var_01 = self.var_A0FF[randomint(self.var_A0FF.size)];
		}
	}
	else
	{
		var_01 = self.var_A0FF;
	}

	self method_8152("moveanim",var_01,1,0.2);
	animscripts\shared::func_2D05("moveanim");
}

//Function Number: 3
func_4158(param_00)
{
	if(self.var_3F2 == "up")
	{
		return animscripts\utility::func_402B("stairs_up");
	}
	else if(self.var_3F2 == "down")
	{
		return animscripts\utility::func_402B("stairs_down");
	}

	var_01 = animscripts\utility::func_402B(param_00);
	if(!animscripts\utility::func_5121() && !isdefined(self.var_6162) && self.var_6162 && !isdefined(self.var_7.var_135B) && self.var_7.var_135B)
	{
		var_02 = animscripts\utility::func_402B("straight_twitch");
		if(isdefined(self.var_51DB) && self.var_51DB)
		{
			var_03 = animscripts\traverse\shared::func_4039();
			if(var_03 == "Left")
			{
				var_02 = animscripts\utility::func_402B("straight_twitch_l");
			}
			else if(var_03 == "Right")
			{
				var_02 = animscripts\utility::func_402B("straight_twitch_r");
			}
		}

		if(isdefined(var_02) && var_02.size > 0)
		{
			var_04 = animscripts\utility::func_40A4(self.var_7.var_76D1,4);
			if(var_04 == 0)
			{
				var_04 = animscripts\utility::func_40A4(self.var_7.var_76D1,var_02.size);
				return var_02[var_04];
			}
		}
	}

	if(isarray(var_01))
	{
		var_01 = var_01[randomint(var_01.size)];
	}

	return var_01;
}

//Function Number: 4
func_2D8D(param_00)
{
	self endon("movemode");
	var_01 = self.var_5F62;
	if(self.var_3F2 != "none")
	{
		var_01 = var_01 * 0.6;
	}

	if(self.var_7.var_6E57 == "stand")
	{
		if(isdefined(self.enemy))
		{
			animscripts\cqb::func_22DF();
			self method_810F("walkanim",animscripts\cqb::func_29A5(),%walk_and_run_loops,1,1,var_01,1);
		}
		else
		{
			self method_810F("walkanim",param_00,%body,1,1,var_01,1);
		}

		animscripts\run::func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"));
		thread animscripts\run::func_7F38("walk");
	}
	else if(self.var_7.var_6E57 == "prone")
	{
		self method_8152("walkanim",animscripts\utility::func_402B("prone"),1,0.3,self.var_5F62);
	}
	else
	{
		self method_810F("walkanim",param_00,%body,1,1,var_01,1);
		animscripts\run::func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"));
		thread animscripts\run::func_7F38("walk");
	}

	animscripts\notetracks::func_2D0A(0.2,"walkanim");
	animscripts\run::func_8007(0);
}