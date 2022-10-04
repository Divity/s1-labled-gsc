/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: grenade_cower.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 108 ms
 * Timestamp: 4/20/2022 8:20:30 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("killanimscript");
	animscripts\utility::func_4DD4("grenadecower");
	if(isdefined(self.var_43F9))
	{
		self [[ self.var_43F9 ]]();
		return;
	}

	if(isdefined(self.inliveplayerkillstreak))
	{
		lib_A51B::func_2612("react_grenade",self.inliveplayerkillstreak == "allies");
	}

	if(self.var_7.var_6E57 == "prone")
	{
		animscripts\stop::main();
		return;
	}

	self method_818E("zonly_physics");
	self method_818F("face angle",self.var_41[1]);
	var_00 = 0;
	if(isdefined(self.grenade))
	{
		var_00 = angleclamp180(vectortoangles(self.grenade.var_2E6 - self.var_2E6)[1] - self.var_41[1]);
	}
	else
	{
		var_00 = self.var_41[1];
	}

	if(self.var_7.var_6E57 == "stand")
	{
		if(isdefined(self.grenade) && func_9890(var_00))
		{
			return;
		}

		self method_8110("cowerstart",animscripts\utility::func_5860("grenade","cower_squat"),%body,1,0.2);
		animscripts\shared::func_2D05("cowerstart");
	}

	self.var_7.var_6E57 = "crouch";
	self.var_7.var_5F58 = "stop";
	self method_8110("cower",animscripts\utility::func_5860("grenade","cower_squat_idle"),%body,1,0.2);
	animscripts\shared::func_2D05("cower");
	self waittill("never");
}

//Function Number: 2
end_script()
{
	self.var_38B = 1;
}

//Function Number: 3
func_9890(param_00)
{
	if(randomint(2) == 0)
	{
		return 0;
	}

	if(self.var_3F2 != "none")
	{
		return 0;
	}

	var_01 = undefined;
	if(abs(param_00) > 90)
	{
		var_01 = animscripts\utility::func_5860("grenade","cower_dive_back");
	}
	else
	{
		var_01 = animscripts\utility::func_5860("grenade","cower_dive_front");
	}

	var_02 = getmovedelta(var_01,0,0.5);
	var_03 = self localtoworldcoords(var_02);
	if(!self method_81C3(var_03))
	{
		return 0;
	}

	self.var_38B = 0;
	self method_8110("cowerstart",var_01,%body,1,0.2);
	animscripts\shared::func_2D05("cowerstart");
	self.var_38B = 1;
	return 1;
}