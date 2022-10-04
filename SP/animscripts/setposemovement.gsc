/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: setposemovement.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 55
 * Decompile Time: 1888 ms
 * Timestamp: 4/20/2022 8:20:46 PM
*******************************************************************/

//Function Number: 1
func_7FEB(param_00,param_01)
{
	if(param_00 == "")
	{
		if(self.var_7.var_6E57 == "prone" && param_01 == "walk" || param_01 == "run")
		{
			param_00 = "crouch";
		}
		else
		{
			param_00 = self.var_7.var_6E57;
		}
	}

	if(!isdefined(param_01) || param_01 == "")
	{
		param_01 = self.var_7.var_5F58;
	}

	[[ level.var_7FEC[param_00][param_01] ]]();
}

//Function Number: 2
func_4DFF()
{
	level.var_7FEC["stand"]["stop"] = ::func_8B11;
	level.var_7FEC["stand"]["walk"] = ::func_8B16;
	level.var_7FEC["stand"]["run"] = ::func_8B09;
	level.var_7FEC["crouch"]["stop"] = ::func_248E;
	level.var_7FEC["crouch"]["walk"] = ::func_2497;
	level.var_7FEC["crouch"]["run"] = ::func_2484;
	level.var_7FEC["prone"]["stop"] = ::func_7026;
	level.var_7FEC["prone"]["walk"] = ::func_7031;
	level.var_7FEC["prone"]["run"] = ::func_7024;
}

//Function Number: 3
func_8B11()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 4
func_8B16()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 5
func_8B09()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 6
func_248E()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		case "prone":
			break;

		default:
			break;
	}
}

//Function Number: 7
func_2497()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 8
func_2484()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 9
func_7026()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		case "prone":
			break;

		default:
			break;
	}
}

//Function Number: 10
func_7031()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 11
func_7024()
{
	switch(self.var_7.var_6E57)
	{
		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 12
func_6A2D(param_00,param_01,param_02,param_03)
{
	var_04 = gettime() + param_01 * 1000;
	if(isarray(param_00))
	{
		param_00 = param_00[randomint(param_00.size)];
	}

	self method_810F("blendTransition",param_00,%body,1,param_01,1);
	animscripts\notetracks::func_2D0A(param_01 / 2,"blendTransition");
	self.var_7.var_6E57 = param_02;
	self.var_7.var_5F58 = param_03;
	var_05 = var_04 - gettime() / 1000;
	if(var_05 < 0.05)
	{
		var_05 = 0.05;
	}

	animscripts\notetracks::func_2D0A(var_05,"blendTransition");
}

//Function Number: 13
func_6DE7(param_00,param_01)
{
	func_6DE4(param_00,"stand","walk",param_01);
}

//Function Number: 14
func_8B18()
{
	self.var_7.var_5F58 = "stop";
}

//Function Number: 15
func_8B17()
{
	func_8B18();
	func_8B12();
}

//Function Number: 16
func_8B10()
{
	self.var_7.var_5F58 = "stop";
}

//Function Number: 17
func_8B0F()
{
	self.var_7.var_5F58 = "stop";
	self.var_7.var_6E57 = "crouch";
}

//Function Number: 18
func_6A2E(param_00)
{
	var_01 = 0.3;
	if(self.var_7.var_5F58 != "stop")
	{
		self endon("movemode");
		var_01 = 1;
	}

	func_6A2D(param_00,var_01,"stand","run");
}

//Function Number: 19
func_14A4()
{
	if(!self.var_178)
	{
		self.var_7.var_5F58 = "run";
		self.var_7.var_6E57 = "stand";
		return 0;
	}

	if(isdefined(self.var_76AC))
	{
		func_6A2E(self.var_76AC);
		return 1;
	}

	var_00 = 0.1;
	if(self.var_7.var_5F58 != "stop" && self.var_3F2 == "none")
	{
		var_00 = 0.5;
	}

	if(isdefined(self.var_8AA2))
	{
		self method_8144(animscripts\utility::func_402B("sprint"),1,var_00,1);
	}
	else
	{
		self method_8144(animscripts\run::func_40BB(),1,var_00,1);
	}

	animscripts\run::func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"),self.var_8559);
	thread animscripts\run::func_7F38("run");
	wait(0.05);
	func_6A2E(%combatrun);
	return 1;
}

//Function Number: 20
func_14A5()
{
	if(self.var_7.var_5F58 != "stop")
	{
		self endon("movemode");
	}

	if(!isdefined(self.var_B0D) && self.var_7.var_6E57 != "prone")
	{
		animscripts\run::func_7FB1(animscripts\utility::func_402B("move_b"),animscripts\utility::func_402B("move_l"),animscripts\utility::func_402B("move_r"));
	}

	self.var_7.var_6E57 = "stand";
	self.var_7.var_5F58 = "walk";
}

//Function Number: 21
func_2494()
{
	var_00 = 1;
	if(isdefined(self.var_3680))
	{
		var_00 = 1.8;
		self.var_3680 = undefined;
	}

	if(animscripts\utility::func_9C32())
	{
		func_6DE4(%pistol_crouchaimstraight2stand,"stand","stop",undefined,var_00);
		return;
	}

	animscripts\utility::func_7126();
	func_6DE4(%crouch2stand,"stand","stop",undefined,var_00);
}

//Function Number: 22
func_2490()
{
	func_14A3();
}

//Function Number: 23
func_2496()
{
	func_2490();
	func_14A5();
}

//Function Number: 24
func_2498()
{
	self.var_7.var_5F58 = "stop";
}

//Function Number: 25
func_2499()
{
	func_2498();
	func_2494();
}

//Function Number: 26
func_2488()
{
	self.var_7.var_5F58 = "stop";
}

//Function Number: 27
func_248C()
{
	func_2488();
	func_2494();
}

//Function Number: 28
func_248F()
{
	func_14A2();
}

//Function Number: 29
func_2495()
{
	return func_14A4();
}

//Function Number: 30
func_14A2()
{
	if(isdefined(self.var_2485))
	{
		func_6A2D(self.var_2485,0.6,"crouch","run");
		return;
	}

	self method_8143(%crouchrun,1,0.4,self.var_5F62);
	if(animscripts\utility::func_9C33() && self.var_7.var_5F58 == "run" && !isdefined(self.var_2562) && isdefined(self.var_2562["run"]))
	{
		var_00 = "smg_crouch_run";
		thread animscripts\run::func_9B33("crouchrun",animscripts\utility::func_5860(var_00,"crouch"),animscripts\utility::func_5860(var_00,"crouch_b"),animscripts\utility::func_5860(var_00,"crouch_l"),animscripts\utility::func_5860(var_00,"crouch_r"));
	}
	else
	{
		thread animscripts\run::func_9B33("crouchrun",animscripts\utility::func_402B("crouch"),animscripts\utility::func_402B("crouch_b"),animscripts\utility::func_402B("crouch_l"),animscripts\utility::func_402B("crouch_r"));
	}

	wait(0.05);
	func_6A2D(%crouchrun,0.4,"crouch","run");
}

//Function Number: 31
func_702A()
{
	self method_818F("face current");
	animscripts\utility::func_3449(1);
	func_7022(0.2);
	animscripts\cover_prone::func_9B48(0.1);
	func_6DE4(%prone_2_crouch,"crouch","run",animscripts\run::func_3F41());
}

//Function Number: 32
func_702F()
{
	func_702A();
	func_14A4();
}

//Function Number: 33
func_702B()
{
	func_702A();
	func_14A3();
}

//Function Number: 34
func_14A3()
{
	if(isdefined(self.var_2485))
	{
		self method_8147(self.var_2485,%body,1,0.4);
		func_6A2D(self.var_2485,0.6,"crouch","walk");
		self notify("BlendIntoCrouchWalk");
		return;
	}

	self method_8143(%crouchrun,1,0.4,self.var_5F62);
	thread animscripts\run::func_9B33("crouchrun",animscripts\utility::func_402B("crouch"),animscripts\utility::func_402B("crouch_b"),animscripts\utility::func_402B("crouch_l"),animscripts\utility::func_402B("crouch_r"));
	wait(0.05);
	func_6A2D(%crouchrun,0.4,"crouch","run");
}

//Function Number: 35
func_8B12()
{
	animscripts\utility::func_7126();
	var_00 = 1;
	if(isdefined(self.var_3677))
	{
		var_00 = 1.8;
		self.var_3677 = undefined;
	}

	func_6DE4(%exposed_stand_2_crouch,"crouch","stop",undefined,var_00);
}

//Function Number: 36
func_7029()
{
	animscripts\utility::func_7126();
	self method_818F("face current");
	animscripts\utility::func_3449(1);
	func_7022(0.1);
	animscripts\cover_prone::func_9B48(0.1);
	func_6DE4(%prone_2_crouch,"crouch","stop");
}

//Function Number: 37
func_702E()
{
	self method_818F("face current");
	animscripts\utility::func_3449(1);
	func_7022(0.1);
	animscripts\cover_prone::func_9B48(0.1);
	func_6DE4(%prone_2_stand,"stand","stop");
}

//Function Number: 38
func_7030()
{
	func_7029();
	func_2490();
	func_14A5();
}

//Function Number: 39
func_702C(param_00)
{
	func_7022(0.1);
	func_6DE4(%prone_2_prone_crawl,"prone",param_00,%prone_crawl);
	animscripts\cover_prone::func_9B48(0.1);
}

//Function Number: 40
func_702D()
{
	func_702C("run");
}

//Function Number: 41
func_7021()
{
	func_7022(0.1);
	animscripts\cover_prone::func_9B48(0.1);
	func_6DE4(%prone_crawl_2_prone,"prone","stop");
}

//Function Number: 42
func_2491()
{
	self method_81FA(-45,45,%prone_legs_down,%exposed_aiming,%prone_legs_up);
	animscripts\utility::func_3307(1);
	func_7022(0.3);
	animscripts\cover_prone::func_9B48(0.1);
	func_6DE4(%crouch_2_prone,"prone","stop");
}

//Function Number: 43
func_2493()
{
	func_2491();
	func_702D();
}

//Function Number: 44
func_2492()
{
	func_2491();
	func_702D();
}

//Function Number: 45
func_8B13()
{
	self endon("entered_poseprone");
	var_00 = 0.5;
	thread func_6DE6(%stand_2_prone,"prone","stop",undefined,var_00);
	self waittillmatch("anim_pose = \"crouch\","transAnimDone2");
	waittillframeend;
	self method_81FA(-45,45,%prone_legs_down,%exposed_aiming,%prone_legs_up);
	animscripts\utility::func_3307(var_00);
	self.var_7.var_5F58 = "stop";
	animscripts\cover_prone::func_9B48(0.1);
	self waittillmatch("end","transAnimDone2");
	func_7022(0.2);
	self method_814B(%prone_aim_idle,1,0.1);
}

//Function Number: 46
func_8B15()
{
	func_8B13();
	func_702D();
}

//Function Number: 47
func_8B14()
{
	func_8B13();
	func_702D();
}

//Function Number: 48
func_2489()
{
	var_00 = 0.5;
	self method_81FA(-45,45,%prone_legs_down,%exposed_aiming,%prone_legs_up);
	animscripts\utility::func_3307(var_00);
	func_7022(0.2);
	animscripts\cover_prone::func_9B48(0.1);
	var_01 = animscripts\utility::func_409E(self method_8190());
	var_02 = %crouch_2_prone;
	var_03 = getmovedelta(var_02,0,1);
	var_04 = self localtoworldcoords(var_03);
	if(self method_81C3(var_04))
	{
		func_6DE4(var_02,"prone","stop",undefined,var_00);
		return;
	}

	func_6DE4(%crouch_2_prone_firing,"prone","stop",undefined,var_00);
}

//Function Number: 49
func_248B()
{
	func_2489();
	func_702D();
}

//Function Number: 50
func_248A()
{
	func_2489();
	func_702D();
}

//Function Number: 51
func_6DE6(param_00,param_01,param_02,param_03,param_04)
{
	self endon("killanimscript");
	self endon("entered_pose" + param_01);
	func_6DE5(param_00,param_01,param_02,param_03,param_04,0);
}

//Function Number: 52
func_6DE4(param_00,param_01,param_02,param_03,param_04)
{
	func_6DE5(param_00,param_01,param_02,param_03,param_04,1);
}

//Function Number: 53
func_6DE5(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	if(param_05)
	{
		thread func_A04E(function_0063(param_00) / 2,"killtimerscript",param_01);
	}

	self method_8110("transAnimDone2",param_00,%body,1,0.2,param_04);
	if(!isdefined(self.var_7.var_6E57))
	{
		self.var_6E57 = "undefined";
	}

	if(!isdefined(self.var_7.var_5F58))
	{
		self.var_5F58 = "undefined";
	}

	var_06 = "";
	animscripts\shared::func_2D05("transAnimDone2",undefined,var_06);
	self notify("killtimerscript");
	self.var_7.var_6E57 = param_01;
	self notify("entered_pose" + param_01);
	self.var_7.var_5F58 = param_02;
	if(isdefined(param_03))
	{
		self method_8147(param_03,%body,1,0.3,param_04);
	}
}

//Function Number: 54
func_A04E(param_00,param_01,param_02)
{
	self endon("killanimscript");
	self endon("death");
	self endon(param_01);
	var_03 = self.var_7.var_6E57;
	wait(param_00);
	if(var_03 != "prone" && param_02 == "prone")
	{
		animscripts\cover_prone::func_9B48(0.1);
		animscripts\utility::func_3307(1);
		return;
	}

	if(var_03 == "prone" && param_02 != "prone")
	{
		animscripts\utility::func_3449(1);
		self method_818F("face default");
	}
}

//Function Number: 55
func_7022(param_00)
{
	self method_8147(%prone_legsstraight,%body,1,param_00,1);
}