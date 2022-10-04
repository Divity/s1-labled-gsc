/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_prone.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 15
 * Decompile Time: 566 ms
 * Timestamp: 4/20/2022 8:20:21 PM
*******************************************************************/

//Function Number: 1
func_4C7C()
{
	var_00 = [];
	var_00["straight_level"] = %prone_aim_5;
	var_00["legs_up"] = %prone_aim_feet_45up;
	var_00["legs_down"] = %prone_aim_feet_45down;
	var_00["fire"] = %prone_fire_1;
	var_00["semi2"] = %prone_fire_burst;
	var_00["semi3"] = %prone_fire_burst;
	var_00["semi4"] = %prone_fire_burst;
	var_00["semi5"] = %prone_fire_burst;
	var_00["single"] = [%prone_fire_1];
	var_00["burst2"] = %prone_fire_burst;
	var_00["burst3"] = %prone_fire_burst;
	var_00["burst4"] = %prone_fire_burst;
	var_00["burst5"] = %prone_fire_burst;
	var_00["burst6"] = %prone_fire_burst;
	var_00["reload"] = %prone_reload;
	var_00["look"] = [%prone_twitch_look,%prone_twitch_lookfast,%prone_twitch_lookup];
	var_00["grenade_safe"] = [%prone_grenade_a,%prone_grenade_a];
	var_00["grenade_exposed"] = [%prone_grenade_a,%prone_grenade_a];
	var_00["exposed_idle"] = [%prone_idle];
	var_00["twitch"] = [%prone_twitch_ammocheck,%prone_twitch_look,%prone_twitch_scan,%prone_twitch_lookfast,%prone_twitch_lookup];
	var_00["hide_to_look"] = %coverstand_look_moveup;
	var_00["look_idle"] = %coverstand_look_idle;
	var_00["look_to_hide"] = %coverstand_look_movedown;
	var_00["look_to_hide_fast"] = %coverstand_look_movedown_fast;
	var_00["stand_2_prone"] = %stand_2_prone_nodelta;
	var_00["crouch_2_prone"] = %crouch_2_prone;
	var_00["prone_2_stand"] = %prone_2_stand_nodelta;
	var_00["prone_2_crouch"] = %prone_2_crouch;
	var_00["stand_2_prone_firing"] = %stand_2_prone_firing;
	var_00["crouch_2_prone_firing"] = %crouch_2_prone_firing;
	var_00["prone_2_stand_firing"] = %prone_2_stand_firing;
	var_00["prone_2_crouch_firing"] = %prone_2_crouch_firing;
	level.var_CCA["soldier"]["cover_prone"] = var_00;
}

//Function Number: 2
main()
{
	self endon("killanimscript");
	animscripts\utility::func_4DD4("cover_prone");
	if(weaponclass(self.weapon) == "rocketlauncher")
	{
		animscripts\combat::main();
		return;
	}

	if(isdefined(self.var_7.var_D29) && self.var_7.var_D29 == "prone_saw")
	{
		animscripts\cover_wall::func_9C0A("saw_bipod_prone","weapon_saw_MG_Setup");
	}
	else if(isdefined(self.node.turret))
	{
		animscripts\cover_wall::func_9C0D();
	}

	if(isdefined(self.enemy) && lengthsquared(self.var_2E6 - self.enemy.var_2E6) < squared(512))
	{
		thread animscripts\combat::main();
		return;
	}

	func_809D();
	self.var_22BA = self.node;
	self method_818F("face angle",self.var_22BA.var_41[1]);
	self.var_7.var_4258 = 1;
	self method_81FA(-45,45,%prone_legs_down,%exposed_modern,%prone_legs_up);
	if(self.var_7.var_6E57 != "prone")
	{
		func_701C("prone");
	}
	else
	{
		animscripts\utility::func_3307(0);
	}

	thread animscripts\combat_utility::func_979();
	func_832D(0.2);
	self method_814B(%prone_aim_5,1,0.1);
	self method_818F("face angle",self.var_22BA.var_41[1]);
	self method_818E("zonly_physics");
	func_701F();
	self notify("stop_deciding_how_to_shoot");
}

//Function Number: 3
end_script()
{
	self.var_7.var_4258 = undefined;
}

//Function Number: 4
func_4B84()
{
	self endon("killanimscript");
	self endon("kill_idle_thread");
	for(;;)
	{
		var_00 = animscripts\utility::func_C51("prone_idle");
		self method_8112("idle",var_00);
		self waittillmatch("end","idle");
		self method_8142(var_00,0.2);
	}
}

//Function Number: 5
func_9B48(param_00)
{
	self method_81FB(animscripts\utility::func_5860("cover_prone","legs_up"),animscripts\utility::func_5860("cover_prone","legs_down"),1,param_00,1);
	self method_814B(%exposed_aiming,1,0.2);
}

//Function Number: 6
func_701F()
{
	self endon("killanimscript");
	thread animscripts\track::func_950B();
	thread animscripts\shoot_behavior::func_2742("normal");
	var_00 = gettime() > 2500;
	for(;;)
	{
		animscripts\utility::func_9B23();
		func_9B48(0.05);
		if(!var_00)
		{
			wait(0.05 + randomfloat(1.5));
			var_00 = 1;
			continue;
		}

		if(!isdefined(self.var_8409))
		{
			if(func_2152())
			{
				continue;
			}

			wait(0.05);
			continue;
		}

		var_01 = lengthsquared(self.var_2E6 - self.var_8409);
		if(self.var_7.var_6E57 != "crouch" && self method_81CB("crouch") && var_01 < squared(400))
		{
			if(var_01 < squared(285))
			{
				func_701C("crouch");
				thread animscripts\combat::main();
				return;
			}
		}

		if(func_2152())
		{
			continue;
		}

		if(func_7023(0))
		{
			continue;
		}

		if(animscripts\combat_utility::func_976())
		{
			animscripts\combat_utility::func_8411();
			self method_8142(%add_fire,0.2);
			continue;
		}

		wait(0.05);
	}
}

//Function Number: 7
func_7023(param_00)
{
	return animscripts\combat_utility::func_365(param_00,animscripts\utility::func_C4E("reload"));
}

//Function Number: 8
func_809D()
{
	self method_8173(self.node);
	self.var_7.var_CD8 = animscripts\utility::func_5861("cover_prone");
}

//Function Number: 9
func_989D(param_00,param_01)
{
	var_02 = undefined;
	if(isdefined(param_01) && param_01)
	{
		var_02 = animscripts\utility::func_C51("grenade_safe");
	}
	else
	{
		var_02 = animscripts\utility::func_C51("grenade_exposed");
	}

	self method_818E("zonly_physics");
	self.var_234 = 1;
	var_03 = (32,20,64);
	var_04 = animscripts\combat_utility::func_9895(param_00,var_02);
	self.var_234 = 0;
	return var_04;
}

//Function Number: 10
func_2152()
{
	if(isdefined(level.var_9334) && isalive(level.var_31D))
	{
		if(func_989D(level.var_31D,200))
		{
			return 1;
		}
	}

	if(isdefined(self.enemy))
	{
		return func_989D(self.enemy,850);
	}

	return 0;
}

//Function Number: 11
func_8493()
{
	if(!isdefined(self.weapon) || !weaponisauto(self.weapon))
	{
		return 0;
	}

	if(isdefined(self.node) && distancesquared(self.var_2E6,self.node.var_2E6) < 256)
	{
		return 0;
	}

	if(isdefined(self.enemy) && self method_81BE(self.enemy) && !isdefined(self.grenade) && animscripts\shared::func_3EE2() < 20)
	{
		return animscripts\move::func_5A5E();
	}

	return 0;
}

//Function Number: 12
func_701C(param_00)
{
	if(param_00 == self.var_7.var_6E57)
	{
		return;
	}

	self method_8142(%animscript_root,0.3);
	animscripts\combat_utility::func_315D();
	if(func_8493())
	{
		var_01 = animscripts\utility::func_C4E(self.var_7.var_6E57 + "_2_" + param_00 + "_firing");
	}
	else
	{
		var_01 = animscripts\utility::func_C4E(self.var_7.var_6E57 + "_2_" + var_01);
	}

	if(param_00 == "prone")
	{
	}

	self method_8110("trans",var_01,%body,1,0.2,1);
	animscripts\shared::func_2D05("trans");
	self method_8149(animscripts\utility::func_C4E("straight_level"),%body,1,0.25);
	func_832D(0.25);
}

//Function Number: 13
func_3797(param_00)
{
	self endon("killanimscript");
	animscripts\shared::func_2D05(param_00);
}

//Function Number: 14
func_832D(param_00)
{
	self method_8147(%prone_aim_5,%body,1,param_00);
	self method_814C(%prone_aim_2_add,1,param_00);
	self method_814C(%prone_aim_4_add,1,param_00);
	self method_814C(%prone_aim_6_add,1,param_00);
	self method_814C(%prone_aim_8_add,1,param_00);
}

//Function Number: 15
func_7028(param_00,param_01)
{
	self method_8142(%animscript_root,0.3);
	var_02 = undefined;
	if(func_8493())
	{
		if(param_00 == "crouch")
		{
			var_02 = %prone_2_crouch_firing;
		}
		else if(param_00 == "stand")
		{
			var_02 = %prone_2_stand_firing;
		}
	}
	else if(param_00 == "crouch")
	{
		var_02 = %prone_2_crouch;
	}
	else if(param_00 == "stand")
	{
		var_02 = %prone_2_stand_nodelta;
	}

	if(isdefined(self.var_7019))
	{
		var_02 = self.var_7019;
	}

	if(isdefined(self.var_701B))
	{
		param_01 = self.var_701B;
	}

	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	animscripts\utility::func_3449(function_0063(var_02) / 2);
	self method_8110("trans",var_02,%body,1,0.2,param_01);
	animscripts\shared::func_2D05("trans");
	self method_8142(var_02,0.1);
}