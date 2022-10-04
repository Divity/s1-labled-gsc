/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: common.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 37
 * Decompile Time: 1329 ms
 * Timestamp: 4/20/2022 8:19:21 PM
*******************************************************************/

//Function Number: 1
func_4B04(param_00,param_01)
{
	self endon("killanimscript");
	animscripts\utility::func_4DD4(param_01);
	self.var_60EB = 1;
	self.var_613C = 1;
	self.var_7.var_5F58 = "stop";
	self.var_7.var_8A14 = param_01;
	self.var_7.var_9C34 = param_00;
	self.ignoreme = 1;
	if(isdefined(self.var_5C6A))
	{
		self.ignoreme = self.var_5C6A;
	}

	self.var_50EB = 0;
	self method_8193(self.var_6F8B);
	self method_8145(self.var_6F8B,1,0.2,1);
	if(isdefined(self.weapon))
	{
		animscripts\shared::func_6866(self.weapon,"none");
	}

	self.var_405D = ::func_9943;
	self notify("guy_man_turret_stop");
	param_00 notify("stop_burst_fire_unmanned");
	param_00.var_99BA = "start";
	param_00.var_98B = self;
	param_00.firetime = 0;
	param_00 setmode("sentry");
	param_00 setsentryowner(self);
	param_00 setdefaultdroppitch(0);
	param_00 method_802F(0);
	func_4471();
	level thread func_4594(self,param_00);
	level thread func_4593(self,param_00);
	param_00 thread func_9994(self);
	param_00.var_2C7D = 0;
	thread func_37D2(param_00);
	wait(0.05);
	if(isalive(self))
	{
		thread func_4474(param_00);
	}
}

//Function Number: 2
func_4471()
{
	self.var_34 = 0;
	lib_A59A::func_7F6B(1);
	self.var_6385 = self.health;
	self.health = 200;
}

//Function Number: 3
func_4472()
{
	self.var_34 = 1;
	lib_A59A::func_7F6B(0);
	self.health = self.var_6385;
}

//Function Number: 4
func_4594(param_00,param_01)
{
	param_00 endon("death");
	param_01 endon("death");
	param_00 endon("dismount");
	param_00 endon("jumping_out");
	for(;;)
	{
		var_02 = "flashbang";
		var_03 = param_00 common_scripts\utility::waittill_any_return("damage",var_02);
		var_04 = common_scripts\utility::random(param_00.var_99B0);
		if(var_03 == var_02)
		{
			var_04 = param_00.var_99AA;
			param_00 animscripts\face::func_7821("flashbang");
		}

		param_00 func_2C22(param_01,var_04,0);
		param_01 notify("pain_done");
	}
}

//Function Number: 5
func_997A()
{
	func_993B();
	self waittill("pain_done");
	func_993A();
}

//Function Number: 6
func_4593(param_00,param_01)
{
	param_00 endon("dismount");
	param_01 endon("turret_cleanup");
	param_00.var_2651 = param_00.var_99A1;
	param_00.var_6149 = 1;
	param_00.var_6156 = 1;
	param_00 waittill("death");
	level thread func_9942(param_00,param_01);
}

//Function Number: 7
func_9943()
{
	var_00 = self.var_750B.mgturret[0];
	if(isalive(self))
	{
		self.var_60EB = undefined;
		self.var_613C = undefined;
		self.ignoreme = 0;
		self.var_7.var_8A14 = "none";
		self.var_7.var_9C34 = undefined;
		self.var_2651 = undefined;
		func_4472();
		self.var_50EB = undefined;
		self.var_99B8 = undefined;
		self.var_99B0 = undefined;
		self.var_405D = undefined;
		self method_818B();
		if(isdefined(self.weapon))
		{
			animscripts\shared::func_6866(self.weapon,"right");
		}
	}

	level thread func_9942(self,var_00);
}

//Function Number: 8
func_9942(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		return;
	}

	param_01 notify("kill_fireController");
	param_01 notify("turret_cleanup");
	param_01 setmode("manual");
	param_01 cleartargetentity();
	param_01 setdefaultdroppitch(param_01.var_277A);
	if(isdefined(param_00))
	{
		param_00 method_8142(param_00.var_7F8,0);
		param_00 method_8142(param_00.var_7F2,0);
		param_00 method_8142(param_00.var_99B9,0);
	}

	param_01.var_37D6 = undefined;
	param_01.var_1FDB = undefined;
	param_01.var_37D1 = undefined;
	param_01.var_99BA = "free";
	param_01.var_98B = undefined;
	param_01.firetime = undefined;
	if(isdefined(param_01.var_8A23))
	{
		level [[ param_01.var_8A23 ]](param_00,param_01);
	}
}

//Function Number: 9
func_9994(param_00)
{
	self endon("turret_cleanup");
	self endon("death");
	param_00 endon("death");
	param_00 endon("detach");
	var_01 = "tag_aim";
	var_02 = self gettagangles(var_01);
	func_9996("none");
	for(;;)
	{
		var_03 = self gettagangles(var_01);
		var_04 = anglestoright(var_02);
		var_05 = anglestoforward(var_03);
		var_06 = vectordot(var_04,var_05);
		if(var_06 == 0)
		{
			func_9996("none");
		}
		else if(var_06 > 0)
		{
			func_9996("right");
		}
		else
		{
			func_9996("left");
		}

		var_02 = self gettagangles(var_01);
		wait(0.05);
	}
}

//Function Number: 10
func_9996(param_00)
{
	if(!isdefined(self.var_75F7) || self.var_75F7 != param_00)
	{
		self.var_75F7 = param_00;
	}
}

//Function Number: 11
func_4474(param_00)
{
	self endon("death");
	param_00 endon("death");
	self endon("dismount");
	param_00 endon("turret_cleanup");
	var_01 = 0.3;
	var_02 = 0.3;
	for(;;)
	{
		param_00 waittill("new_fireTarget");
		wait(0.05);
		if(!isdefined(param_00.var_37E8) || self.var_50EB)
		{
			continue;
		}

		var_03 = undefined;
		if(!param_00 func_993C(param_00.var_37E8,param_00.var_1FDB))
		{
			if(param_00.var_75F7 == "right")
			{
				var_03 = self.var_7F7;
			}
			else if(param_00.var_75F7 == "left")
			{
				var_03 = self.var_7F6;
			}

			if(isdefined(var_03))
			{
				self method_814C(self.var_7F2,1,var_01,1);
				self method_8144(var_03,1,0,1);
				while(isdefined(param_00.var_37E8) && !param_00 func_993C(param_00.var_37E8,param_00.var_1FDB))
				{
					if(self.var_50EB)
					{
						break;
					}

					wait(0.05);
				}

				self method_8142(self.var_7F2,var_02);
			}
		}
	}
}

//Function Number: 12
func_9D0C(param_00,param_01,param_02,param_03)
{
	param_00.var_9BF5[self.var_9D13] = 0;
	lib_A59F::func_4483();
	func_4495(param_00,param_01,param_02,param_03);
}

//Function Number: 13
func_4496(param_00,param_01,param_02,param_03)
{
	func_4495(param_00,param_01,param_02,param_03);
}

//Function Number: 14
func_4495(param_00,param_01,param_02,param_03)
{
	self endon("death");
	param_02 endon("death");
	self method_8141();
	self notify("newanim");
	self.var_2E17 = undefined;
	self.var_60EB = 1;
	param_03 = %humvee_passenger_2_turret;
	if(!isdefined(param_03))
	{
		param_03 = self.var_66B0;
	}

	var_04 = lib_A59F::func_BE9(param_00,param_01);
	var_05 = param_00 gettagorigin(var_04.var_85A8);
	var_06 = param_00 gettagangles(var_04.var_85A8);
	param_02 setdefaultdroppitch(0);
	param_02 thread func_993D(param_02.var_66B4);
	self method_813E("passenger2turret",var_05,var_06,param_03);
	wait(function_0063(param_03));
	self method_8141();
	param_02 func_993A();
	self method_818A(param_02);
}

//Function Number: 15
func_993D(param_00)
{
	if(isdefined(self.var_4B76))
	{
		self method_8142(self.var_4B76,0);
		self.var_4B76 = undefined;
	}

	self method_810D("minigun_turret",param_00,1,0,1);
	self waittillmatch("end","minigun_turret");
	self method_8142(param_00,0);
}

//Function Number: 16
func_993E(param_00)
{
	self method_8145(param_00,1,0,0);
	self.var_4B76 = param_00;
}

//Function Number: 17
func_37D2(param_00)
{
	self endon("death");
	param_00 endon("death");
	self endon("dismount");
	param_00 endon("kill_fireController");
	param_00 thread func_998E(self);
	wait(0.05);
	self thread [[ param_00.var_37D1 ]](param_00);
	var_01 = undefined;
	for(;;)
	{
		var_01 = param_00.var_37E8;
		while(param_00 func_9195(var_01))
		{
			if(param_00 func_993C(var_01,param_00.var_1FDB))
			{
				break;
			}

			wait(0.05);
		}

		if(param_00 func_9195(var_01) && !self.ignoreall)
		{
			param_00.var_2C7D = 1;
		}

		while(param_00 func_9195(var_01) && !self.ignoreall && !self.var_50EB)
		{
			wait(0.05);
		}

		if(param_00.var_2C7D || self.ignoreall)
		{
			param_00.var_2C7D = 0;
		}

		wait(0.05);
	}
}

//Function Number: 18
func_9195(param_00)
{
	if(isdefined(self.var_2D38))
	{
		return 0;
	}

	if(!isdefined(self.var_37E8))
	{
		return 0;
	}

	if(!func_998F(param_00))
	{
		return 0;
	}

	if(param_00 != self.var_37E8)
	{
		return 0;
	}

	return 1;
}

//Function Number: 19
func_998E(param_00)
{
	param_00 endon("death");
	self endon("death");
	param_00 endon("dismount");
	self endon("kill_fireController");
	self.var_37E8 = undefined;
	var_01 = undefined;
	var_02 = undefined;
	for(;;)
	{
		var_01 = self getturrettarget(0);
		var_03 = 0;
		if(func_998F(var_01) || !isdefined(var_01))
		{
			if(!isdefined(var_01) && isdefined(var_02))
			{
				var_03 = 1;
			}
			else if(isdefined(var_01) && !isdefined(var_02))
			{
				var_03 = 1;
			}
			else if(isdefined(var_01) && var_01 != var_02)
			{
				var_03 = 1;
			}

			if(var_03)
			{
				self.var_37E8 = var_01;
				var_02 = var_01;
				self notify("new_fireTarget");
			}
		}

		wait(0.05);
	}
}

//Function Number: 20
func_998F(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(isdefined(param_00.ignoreme) && param_00.ignoreme)
	{
		return 0;
	}

	if(issubstr(param_00.code_classname,"actor") && !isalive(param_00))
	{
		return 0;
	}

	return 1;
}

//Function Number: 21
func_7E6A(param_00,param_01,param_02,param_03)
{
	self endon("turret_cleanup");
	var_04 = self getmode();
	if(var_04 != "manual")
	{
		self setmode("manual");
	}

	if(!isdefined(param_01) && !isdefined(param_02))
	{
		param_01 = 1.5;
		param_02 = 3;
	}

	func_2531();
	self settargetentity(param_00);
	self waittill("turret_on_target");
	if(isdefined(param_03))
	{
		self waittill(param_03);
	}
	else if(isdefined(param_02))
	{
		wait(randomfloatrange(param_01,param_02));
	}
	else
	{
		wait(param_01);
	}

	func_2531();
	self cleartargetentity(param_00);
	if(isdefined(var_04))
	{
		self setmode(var_04);
	}
}

//Function Number: 22
func_2D78(param_00)
{
	self notify("doshoot_starting");
	self method_814C(self.var_7F8,1,0.1);
	self method_8144(self.var_7F4,1,0.1);
	param_00.var_99BA = "fire";
	param_00 thread fire(self);
}

//Function Number: 23
fire(param_00)
{
	param_00 endon("death");
	self endon("death");
	param_00 endon("dismount");
	self endon("kill_fireController");
	self endon("stopfiring");
	self endon("custom_anim");
	for(;;)
	{
		self shootturret();
		wait(self.var_37D6);
	}
}

//Function Number: 24
func_2BE0(param_00)
{
	param_00.var_99BA = "aim";
	param_00 notify("stopfiring");
	thread func_2BE1(param_00);
}

//Function Number: 25
func_2BE1(param_00)
{
	self notify("doaim_idle_think");
	self endon("doaim_idle_think");
	self endon("custom_anim");
	self endon("doshoot_starting");
	self endon("death");
	param_00 endon("death");
	var_01 = param_00.var_6639;
	var_02 = -1;
	for(;;)
	{
		if(var_01 veh_getspeed() < 1 && var_02)
		{
			self method_814C(self.var_7F8,1,0.1);
			self method_8144(self.var_7F5,1,0.1);
			var_02 = 0;
		}
		else if(var_01 veh_getspeed() >= 1 && !var_02)
		{
			self method_814C(self.var_7F8,1,0.1);
			self method_8144(self.var_7F3,1,0.1);
			var_02 = 1;
		}

		wait(0.05);
	}
}

//Function Number: 26
func_9957(param_00,param_01,param_02)
{
	self endon("death");
	param_00 endon("death");
	self endon("dismount");
	self endon("jumping_out");
	var_03 = self.var_99B8[param_01];
	func_2531();
	var_04 = param_00 func_7310();
	func_2C22(param_00,var_03,param_02);
	if(var_04)
	{
		param_00 func_7311();
	}
}

//Function Number: 27
func_7310()
{
	var_00 = 0;
	if(!isdefined(self.var_2B25) || !self.var_2B25)
	{
		var_00 = 1;
		self.var_2B25 = 1;
	}

	return var_00;
}

//Function Number: 28
func_7311()
{
	self.var_2B25 = 0;
}

//Function Number: 29
func_2D75(param_00)
{
	if(isdefined(param_00.var_2B25))
	{
		return;
	}

	self endon("death");
	param_00 endon("death");
	self endon("dismount");
	self endon("jumping_out");
	if(animscripts\battlechatter::func_1357())
	{
		if(level.var_1CA5)
		{
			thread lib_A59A::func_2534("inform_reloading");
		}
	}
	else if(isdefined(self.inliveplayerkillstreak))
	{
		lib_A51B::func_2612("act_reload",self.inliveplayerkillstreak == "allies");
	}

	func_2C22(param_00,self.var_99B2,1);
}

//Function Number: 30
func_2C22(param_00,param_01,param_02)
{
	self notify("do_custom_anim");
	self endon("do_custom_anim");
	self.var_50EB = 1;
	self.var_2550 = param_01;
	param_00.var_99BA = "customanim";
	param_00 turretfiredisable();
	if(param_00 getbarrelspinrate() > 0)
	{
		param_00 stopbarrelspin();
	}

	param_00 notify("kill_fireController");
	self notify("custom_anim");
	if(isdefined(param_02) && param_02)
	{
		param_00 func_993B();
	}

	self method_8146(self.var_99B9,1,0.2);
	self method_810D("special_anim",param_01,1,0,1);
	for(;;)
	{
		self waittill("special_anim",var_03);
		if(var_03 == "end")
		{
			break;
		}
	}

	self method_8142(self.var_99B9,0.2);
	self method_814C(self.var_6F8B,1);
	self method_814C(self.var_7F8,1);
	if(isdefined(param_02) && param_02)
	{
		param_00 func_993A();
	}

	self.var_2550 = undefined;
	self.var_50EB = 0;
	param_00 turretfireenable();
	thread func_37D2(param_00);
}

//Function Number: 31
func_2531()
{
	self endon("death");
	if(!isdefined(self.var_50EB))
	{
		return;
	}

	while(self.var_50EB)
	{
		wait(0.05);
	}
}

//Function Number: 32
func_993B(param_00)
{
	if(self getmode() == "sentry")
	{
		return;
	}

	if(!isdefined(param_00))
	{
		var_01 = self gettagangles("tag_flash");
		param_00 = (0,var_01[1],var_01[2]);
	}

	self.var_63D6 = self getmode();
	self setmode("manual");
	var_02 = anglestoforward(param_00);
	var_03 = var_02 * 96;
	var_04 = self gettagorigin("tag_aim") + var_03;
	self.var_927A = spawn("script_origin",var_04);
	self.var_927A.ignoreme = 1;
	self.var_927A linkto(self.var_6639);
	self cleartargetentity();
	self settargetentity(self.var_927A);
	self waittill("turret_on_target");
}

//Function Number: 33
func_993A()
{
	self cleartargetentity();
	if(isdefined(self.var_927A))
	{
		self.var_927A unlink();
		self.var_927A delete();
	}

	if(isdefined(self.var_63D6))
	{
		self setmode(self.var_63D6);
		self.var_63D6 = undefined;
	}
}

//Function Number: 34
func_993C(param_00,param_01)
{
	var_02 = func_9956(param_00);
	if(var_02 <= param_01)
	{
		return 1;
	}

	return 0;
}

//Function Number: 35
func_9956(param_00)
{
	var_01 = vectortoyaw(param_00.var_2E6 - self.var_2E6);
	var_02 = self gettagangles("tag_flash")[1];
	var_03 = animscripts\utility::func_6C4(var_02 - var_01);
	return var_03;
}

//Function Number: 36
func_568F(param_00)
{
	var_01 = lib_A59A::func_239F(::func_149A,20,0);
	var_01.time = param_00;
}

//Function Number: 37
func_149A(param_00,param_01,param_02)
{
	var_03 = param_01 * 1 - param_00 + param_02 * param_00;
	self setdefaultdroppitch(var_03);
}