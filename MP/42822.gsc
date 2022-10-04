/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42822.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 18
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:18:21 PM
*******************************************************************/

//Function Number: 1
lib_A746::func_5DBB()
{
	level._effect["mdl_sticky_explosion"] = loadfx("vfx/explosion/frag_grenade_default");
	level._effect["mdl_sticky_blinking"] = loadfx("vfx/lights/light_semtex_blinking");
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	for(;;)
	{
		self waittill("missile_fire",var_00,var_01);
		if(issubstr(var_01,"iw5_microdronelauncher_mp"))
		{
			var_00 method_8383(self);
		}
	}
}

//Function Number: 2
lib_A746::func_29A3(param_00)
{
	self endon("death");
	for(;;)
	{
		if(!isdefined(self.var_6F57))
		{
			self.var_6F57 = self.var_2E6;
		}

		wait(0.05);
		self.var_6F57 = self.var_2E6;
	}
}

//Function Number: 3
lib_A746::determine_sticky_position(param_00)
{
	param_00 endon("spawned_player");
	if(!isdefined(self.var_6F57))
	{
		return;
	}

	if(!isdefined(self))
	{
		return;
	}

	var_01 = self.var_2E6 - self.var_6F57;
	var_02 = vectortoangles(var_01);
	var_03 = anglestoforward(var_02) * 8000;
	var_04 = self.var_2E6 + var_03;
	var_05 = bullettrace(self.var_6F57,var_04,1,param_00,1,1);
	if(var_05["fraction"] < 1 && isdefined(var_05["position"]))
	{
		var_06 = spawn("script_model",var_05["position"]);
		var_06 setmodel("projectile_semtex_grenade");
		if(isdefined(var_05["entity"]))
		{
			if(isplayer(var_05["entity"]))
			{
				param_00 thread lib_A746::func_84EB();
				var_05["entity"] thread lib_A746::func_84EB();
			}

			var_06 linkto(var_05["entity"]);
		}

		var_06 thread lib_A746::sticky_timer(param_00);
		var_06 thread lib_A746::sticky_fx(param_00);
		var_06 thread lib_A746::func_737E(param_00);
	}
}

//Function Number: 4
lib_A746::func_5BFD()
{
	common_scripts\utility::waittill_any("death","disconnect","faux_spawn");
	if(isdefined(self.var_4AE9))
	{
		foreach(var_01 in self.var_4AE9)
		{
			var_01 destroy();
		}

		self.var_4AE9 = undefined;
	}
}

//Function Number: 5
lib_A746::func_84EB()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	if(!isdefined(self.var_4AE9))
	{
		self.var_4AE9 = [];
	}

	if(isdefined(self.var_4AE9) && !isdefined(self.var_4AE9["mdlStuckText"]))
	{
		self.var_4AE9["mdlStuckText"] = newclienthudelem(self);
		self.var_4AE9["mdlStuckText"].x = 0;
		self.var_4AE9["mdlStuckText"].y = -170;
		self.var_4AE9["mdlStuckText"].alignx = "center";
		self.var_4AE9["mdlStuckText"].aligny = "middle";
		self.var_4AE9["mdlStuckText"].horzalign = "center";
		self.var_4AE9["mdlStuckText"].vertalign = "middle";
		self.var_4AE9["mdlStuckText"].var_18C = 3;
		self.var_4AE9["mdlStuckText"].alpha = 0;
		self.var_4AE9["mdlStuckText"] settext("STUCK!");
		thread lib_A746::func_5BFD();
	}

	if(isdefined(self.var_4AE9["mdlStuckText"]))
	{
		self.var_4AE9["mdlStuckText"].alpha = 1;
		wait(2);
		self.var_4AE9["mdlStuckText"].alpha = 0;
	}
}

//Function Number: 6
lib_A746::sticky_timer(param_00)
{
	param_00 endon("spawned_player");
	wait(3);
	playfx(common_scripts\utility::getfx("mdl_sticky_explosion"),self.var_2E6);
	physicsexplosionsphere(self.var_2E6,256,32,1);
	radiusdamage(self.var_2E6,256,130,15,param_00,"MOD_EXPLOSIVE","iw5_microdronelauncher_mp");
	self notify("exploded");
}

//Function Number: 7
lib_A746::sticky_fx(param_00)
{
	param_00 endon("spawned_player");
	self endon("exploded");
	self.var_3B75 = common_scripts\utility::spawn_tag_origin();
	self.var_3B75.var_2E6 = self.var_2E6;
	self.var_3B75 show();
	wait(0.1);
	playfxontag(common_scripts\utility::getfx("mdl_sticky_blinking"),self.var_3B75,"tag_origin");
}

//Function Number: 8
lib_A746::func_737E(param_00)
{
	thread lib_A746::remove_sticky_on_explosion(param_00);
	thread lib_A746::func_7380(param_00);
}

//Function Number: 9
lib_A746::remove_sticky_on_explosion(param_00)
{
	param_00 endon("spawned_player");
	self waittill("exploded");
	if(isdefined(self))
	{
		lib_A746::cleanup_sticky();
	}
}

//Function Number: 10
lib_A746::func_7380(param_00)
{
	self endon("exploded");
	param_00 waittill("spawned_player");
	if(isdefined(self))
	{
		lib_A746::cleanup_sticky();
	}
}

//Function Number: 11
lib_A746::cleanup_sticky()
{
	stopfxontag(common_scripts\utility::getfx("mdl_sticky_blinking"),self.var_3B75,"tag_origin");
	self delete();
}

//Function Number: 12
lib_A746::func_5BFC(param_00)
{
	self endon("death");
	param_00 endon("death");
	param_00 endon("disconnect");
	param_00 endon("faux_spawn");
	var_01 = self.var_2E6;
	lib_A746::func_3D3C();
	wait(0.05);
	lib_A746::func_3D3C();
	wait(0.05);
	var_02 = 0.1;
	var_03 = lib_A746::func_3D3C();
	for(;;)
	{
		var_04 = lib_A746::func_3D3C();
		var_05 = 0;
		if(var_02 >= 0.35)
		{
			var_06 = lib_A746::func_5BF9(var_01,vectornormalize(var_03),var_04,param_00);
			if(isdefined(var_06))
			{
				self missilesettargetent(var_06,lib_A746::func_5BFA(var_06));
				var_05 = 1;
				var_03 = var_04;
			}
		}
		else
		{
		}

		if(!var_05)
		{
			var_07 = vectornormalize(var_03 + (0,0,-400 * squared(var_02)));
			self missilesettargetpos(self.var_2E6 + var_07 * 10000);
		}

		wait(0.05);
		var_02 = var_02 + 0.05;
	}
}

//Function Number: 13
lib_A746::func_5BF9(param_00,param_01,param_02,param_03)
{
	var_04 = cos(15);
	var_05 = undefined;
	var_06 = cos(15);
	foreach(var_08 in level.var_328)
	{
		if(var_08 == param_03)
		{
			continue;
		}

		if(var_08.inliveplayerkillstreak == param_03.inliveplayerkillstreak)
		{
			continue;
		}

		var_09 = lib_A746::func_5BFB(var_08);
		var_0A = vectordot(vectornormalize(param_02),vectornormalize(var_09 - self.var_2E6));
		if(var_0A > var_06)
		{
			if(bullettracepassed(self.var_2E6,var_09,0,var_08))
			{
				var_05 = var_08;
				var_06 = var_0A;
				continue;
			}
		}
	}

	return var_05;
}

//Function Number: 14
lib_A746::func_501C(param_00,param_01)
{
	var_02 = undefined;
	if(isai(param_00))
	{
		var_02 = param_00.inliveplayerkillstreak;
	}
	else if(isdefined(param_00.var_7AE9))
	{
		var_02 = param_00.var_7AE9;
	}

	return isenemyteam(var_02,param_01.inliveplayerkillstreak);
}

//Function Number: 15
lib_A746::func_5BFB(param_00)
{
	return param_00 getpointinbounds(0,0,0);
}

//Function Number: 16
lib_A746::func_5BFA(param_00)
{
	return lib_A746::func_5BFB(param_00) - param_00.var_2E6;
}

//Function Number: 17
lib_A746::func_3D3C()
{
	lib_A746::func_2A55();
	return self.var_2A5D;
}

//Function Number: 18
lib_A746::func_2A55()
{
	var_00 = gettime() * 0.001;
	if(!isdefined(self.var_2A5A))
	{
		self.var_2A5A = var_00;
		self.var_2A59 = self.var_2E6;
		self.var_2A5B = (0,0,0);
		self.var_2A58 = (0,0,0);
		self.var_2A57 = (0,0,0);
		self.var_2A56 = (0,0,0);
		self.var_2A5D = (0,0,0);
		self.var_2A5C = 0;
		return;
	}

	if(self.var_2A5A != var_00)
	{
		var_01 = var_00 - self.var_2A5A;
		self.var_2A5A = var_00;
		self.var_2A57 = self.var_2A56 - self.var_2A58 / var_01;
		self.var_2A58 = self.var_2A56;
		self.var_2A56 = self.var_2A5D - self.var_2A5B / var_01;
		self.var_2A5B = self.var_2A5D;
		self.var_2A5D = self.var_2E6 - self.var_2A59 / var_01;
		self.var_2A59 = self.var_2E6;
		self.var_2A5C = length(self.var_2A5D);
	}
}