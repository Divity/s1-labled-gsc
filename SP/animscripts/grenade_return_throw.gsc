/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: grenade_return_throw.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 142 ms
 * Timestamp: 4/20/2022 8:20:30 PM
*******************************************************************/

//Function Number: 1
main()
{
	self method_818F("face default");
	self endon("killanimscript");
	animscripts\utility::func_4DD4("grenade_return_throw");
	self method_818E("zonly_physics");
	var_00 = undefined;
	var_01 = 1000;
	if(isdefined(self.enemy))
	{
		var_01 = distance(self.var_2E6,self.enemy.var_2E6);
	}

	var_02 = [];
	if(var_01 < 600 && func_514B())
	{
		if(var_01 < 300)
		{
			if(animscripts\utility::func_9C33())
			{
				var_02 = animscripts\utility::func_5860("grenade","return_throw_short_smg");
			}
			else
			{
				var_02 = animscripts\utility::func_5860("grenade","return_throw_short");
			}
		}
		else if(animscripts\utility::func_9C33())
		{
			var_02 = animscripts\utility::func_5860("grenade","return_throw_long_smg");
		}
		else
		{
			var_02 = animscripts\utility::func_5860("grenade","return_throw_long");
		}
	}

	if(var_02.size == 0)
	{
		if(animscripts\utility::func_9C33())
		{
			var_02 = animscripts\utility::func_5860("grenade","return_throw_default_smg");
		}
		else
		{
			var_02 = animscripts\utility::func_5860("grenade","return_throw_default");
		}
	}

	var_00 = var_02[randomint(var_02.size)];
	self method_8110("throwanim",var_00,%body,1,0.3);
	var_04 = animhasnotetrack(var_00,"grenade_left") || animhasnotetrack(var_00,"grenade_right");
	if(var_04)
	{
		animscripts\shared::func_6866(self.weapon,"left");
		thread func_7065();
		thread func_6229("throwanim","grenade_left");
		thread func_6229("throwanim","grenade_right");
		self waittill("grenade_pickup");
		self method_8189();
		animscripts\battlechatter_ai::func_33AF("grenade");
		if(isdefined(self.inliveplayerkillstreak))
		{
			lib_A51B::func_2614(self.var_1D6,self.inliveplayerkillstreak == "allies",1);
		}

		self waittillmatch("grenade_throw","throwanim");
	}
	else
	{
		self waittillmatch("grenade_throw","throwanim");
		self method_8189();
		animscripts\battlechatter_ai::func_33AF("grenade");
		if(isdefined(self.inliveplayerkillstreak))
		{
			lib_A51B::func_2614(self.var_1D6,self.inliveplayerkillstreak == "allies",1);
		}
	}

	if(isdefined(self.grenade))
	{
		self method_81D3();
	}

	wait(1);
	if(var_04)
	{
		self notify("put_weapon_back_in_right_hand");
		animscripts\shared::func_6866(self.weapon,"right");
	}
}

//Function Number: 2
func_514B()
{
	var_00 = (self.var_2E6[0],self.var_2E6[1],self.var_2E6[2] + 20);
	var_01 = var_00 + anglestoforward(self.var_41) * 50;
	return sighttracepassed(var_00,var_01,0,undefined);
}

//Function Number: 3
func_7065()
{
	self endon("death");
	self endon("put_weapon_back_in_right_hand");
	self waittill("killanimscript");
	animscripts\shared::func_6866(self.weapon,"right");
}

//Function Number: 4
func_6229(param_00,param_01)
{
	self endon("killanimscript");
	self endon("grenade_pickup");
	self waittillmatch(param_01,param_00);
	self notify("grenade_pickup");
}