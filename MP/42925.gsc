/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42925.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:18:29 PM
*******************************************************************/

//Function Number: 1
lib_A7AD::init()
{
}

//Function Number: 2
lib_A7AD::shellshockondamage(param_00,param_01)
{
	if(maps\mp\_flashgrenades::isflashbanged())
	{
		return;
	}

	if(maps\mp\_utility::isusingremote() || maps\mp\_utility::isinremotetransition())
	{
		return;
	}

	if(param_00 == "MOD_EXPLOSIVE" || param_00 == "MOD_GRENADE" || param_00 == "MOD_GRENADE_SPLASH" || param_00 == "MOD_PROJECTILE" || param_00 == "MOD_PROJECTILE_SPLASH")
	{
		if(param_01 > 10)
		{
			if(!maps\mp\_utility::_hasperk("specialty_hard_shell"))
			{
				self shellshock("frag_grenade_mp",0.5);
				return;
			}
		}
	}
}

//Function Number: 3
lib_A7AD::endondeath()
{
	self waittill("death");
	waittillframeend;
	self notify("end_explode");
}

//Function Number: 4
lib_A7AD::grenade_earthquake()
{
	thread lib_A7AD::endondeath();
	self endon("end_explode");
	self waittill("explode",var_00);
	playrumbleonposition("grenade_rumble",var_00);
	earthquake(0.5,0.75,var_00,800);
	foreach(var_02 in level.var_328)
	{
		if(var_02 maps\mp\_utility::isusingremote() || var_02 maps\mp\_utility::isinremotetransition())
		{
			continue;
		}

		if(distancesquared(var_00,var_02.var_2E6) > 360000)
		{
			continue;
		}

		if(var_02 damageconetrace(var_00))
		{
			var_02 thread lib_A7AD::dirteffect(var_00);
		}

		var_02 setclientomnvar("ui_hud_shake",1);
	}
}

//Function Number: 5
lib_A7AD::dirteffect(param_00)
{
	self notify("dirtEffect");
	self endon("dirtEffect");
	self endon("disconnect");
	if(!maps\mp\_utility::isreallyalive(self))
	{
		return;
	}

	var_01 = vectornormalize(anglestoforward(self.var_41));
	var_02 = vectornormalize(anglestoright(self.var_41));
	var_03 = vectornormalize(param_00 - self.var_2E6);
	var_04 = vectordot(var_03,var_01);
	var_05 = vectordot(var_03,var_02);
	var_06 = ["death","damage"];
	if(var_04 > 0 && var_04 > 0.5 && self getcurrentweapon() != "iw6_riotshield_mp")
	{
		common_scripts\utility::waittill_any_in_array_or_timeout(var_06,2);
		return;
	}

	if(abs(var_04) < 0.866)
	{
		if(var_05 > 0)
		{
			common_scripts\utility::waittill_any_in_array_or_timeout(var_06,2);
			return;
		}

		common_scripts\utility::waittill_any_in_array_or_timeout(var_06,2);
		return;
	}
}

//Function Number: 6
lib_A7AD::bloodeffect(param_00)
{
	self notify("bloodEffect");
	self endon("bloodEffect");
	self endon("disconnect");
	if(!maps\mp\_utility::isreallyalive(self))
	{
		return;
	}

	var_01 = vectornormalize(anglestoforward(self.var_41));
	var_02 = vectornormalize(anglestoright(self.var_41));
	var_03 = vectornormalize(param_00 - self.var_2E6);
	var_04 = vectordot(var_03,var_01);
	var_05 = vectordot(var_03,var_02);
	var_06 = ["death","damage"];
	if(var_04 > 0 && var_04 > 0.5)
	{
		common_scripts\utility::waittill_any_in_array_or_timeout(var_06,7);
		return;
	}

	if(abs(var_04) < 0.866)
	{
		if(var_05 > 0)
		{
			common_scripts\utility::waittill_any_in_array_or_timeout(var_06,7);
			return;
		}

		common_scripts\utility::waittill_any_in_array_or_timeout(var_06,7);
		return;
	}
}

//Function Number: 7
lib_A7AD::bloodmeleeeffect()
{
	self endon("disconnect");
	wait(0.5);
	if(isalive(self))
	{
		common_scripts\utility::waittill_notify_or_timeout("death",1.5);
	}
}

//Function Number: 8
lib_A7AD::c4_earthquake()
{
	thread lib_A7AD::endondeath();
	self endon("end_explode");
	self waittill("explode",var_00);
	playrumbleonposition("grenade_rumble",var_00);
	earthquake(0.4,0.75,var_00,512);
	foreach(var_02 in level.var_328)
	{
		if(var_02 maps\mp\_utility::isusingremote() || var_02 maps\mp\_utility::isinremotetransition())
		{
			continue;
		}

		if(distance(var_00,var_02.var_2E6) > 512)
		{
			continue;
		}

		if(var_02 damageconetrace(var_00))
		{
			var_02 thread lib_A7AD::dirteffect(var_00);
		}

		var_02 setclientomnvar("ui_hud_shake",1);
	}
}

//Function Number: 9
lib_A7AD::barrel_earthquake()
{
	var_00 = self.var_2E6;
	playrumbleonposition("grenade_rumble",var_00);
	earthquake(0.4,0.5,var_00,512);
	foreach(var_02 in level.var_328)
	{
		if(var_02 maps\mp\_utility::isusingremote() || var_02 maps\mp\_utility::isinremotetransition())
		{
			continue;
		}

		if(distance(var_00,var_02.var_2E6) > 512)
		{
			continue;
		}

		if(var_02 damageconetrace(var_00))
		{
			var_02 thread lib_A7AD::dirteffect(var_00);
		}

		var_02 setclientomnvar("ui_hud_shake",1);
	}
}

//Function Number: 10
lib_A7AD::artillery_earthquake()
{
	var_00 = self.var_2E6;
	playrumbleonposition("artillery_rumble",self.var_2E6);
	earthquake(0.7,0.5,self.var_2E6,800);
	foreach(var_02 in level.var_328)
	{
		if(var_02 maps\mp\_utility::isusingremote() || var_02 maps\mp\_utility::isinremotetransition())
		{
			continue;
		}

		if(distance(var_00,var_02.var_2E6) > 600)
		{
			continue;
		}

		if(var_02 damageconetrace(var_00))
		{
			var_02 thread lib_A7AD::dirteffect(var_00);
		}

		var_02 setclientomnvar("ui_hud_shake",1);
	}
}

//Function Number: 11
lib_A7AD::stealthairstrike_earthquake(param_00)
{
	playrumbleonposition("grenade_rumble",param_00);
	earthquake(0.6,0.6,param_00,2000);
	foreach(var_02 in level.var_328)
	{
		if(var_02 maps\mp\_utility::isusingremote() || var_02 maps\mp\_utility::isinremotetransition())
		{
			continue;
		}

		if(distance(param_00,var_02.var_2E6) > 1000)
		{
			continue;
		}

		if(var_02 damageconetrace(param_00))
		{
			var_02 thread lib_A7AD::dirteffect(param_00);
		}

		var_02 setclientomnvar("ui_hud_shake",1);
	}
}

//Function Number: 12
lib_A7AD::airstrike_earthquake(param_00)
{
	playrumbleonposition("artillery_rumble",param_00);
	earthquake(0.7,0.75,param_00,1000);
	foreach(var_02 in level.var_328)
	{
		if(var_02 maps\mp\_utility::isusingremote() || var_02 maps\mp\_utility::isinremotetransition())
		{
			continue;
		}

		if(distance(param_00,var_02.var_2E6) > 900)
		{
			continue;
		}

		if(var_02 damageconetrace(param_00))
		{
			var_02 thread lib_A7AD::dirteffect(param_00);
		}

		var_02 setclientomnvar("ui_hud_shake",1);
	}
}