/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42262.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 20
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:22:03 PM
*******************************************************************/

//Function Number: 1
lib_A516::main()
{
	common_scripts\utility::flag_init("coop_game");
	if(!lib_A59A::func_5009())
	{
		return;
	}

	common_scripts\utility::flag_set("coop_game");
	common_scripts\utility::flag_init("coop_show_constant_icon");
	setdvarifuninitialized("coop_show_constant_icon",1);
	if(getdvarint("coop_show_constant_icon") == 1)
	{
		common_scripts\utility::flag_set("coop_show_constant_icon");
	}

	precacheshader("hint_health");
	precacheshader("coop_player_location");
	precacheshader("coop_player_location_fire");
	level.var_21BB = 7;
	level.var_21BA = 0.375;
	level.var_21C5 = 20;
	foreach(var_01 in level.var_328)
	{
		var_01.var_2047 = var_01 getplayerprofiledata("colorBlind");
		var_01 thread lib_A516::func_4DD6(var_01.var_2047);
		var_01 thread lib_A516::func_3A63();
	}
}

//Function Number: 2
lib_A516::func_4DD6(param_00)
{
	if(param_00)
	{
		var_01 = (0.35,1,1);
		var_02 = (1,0.65,0.2);
		var_03 = (1,1,1);
		self.var_21C0 = var_01;
		self.var_21BE = var_02;
		self.var_21C1 = var_01;
		self.var_21BD = var_03;
		self.var_21BF = var_02;
		self.var_21BC = var_03;
		return;
	}

	var_04 = (0.635,0.929,0.604);
	var_05 = (1,1,0.2);
	var_02 = (1,0.65,0.2);
	var_06 = (1,0.2,0.2);
	var_03 = (1,1,1);
	self.var_21C0 = var_04;
	self.var_21BE = var_05;
	self.var_21C1 = var_04;
	self.var_21BD = var_02;
	self.var_21BF = var_06;
	self.var_21BC = var_03;
}

//Function Number: 3
lib_A516::func_71EA(param_00,param_01,param_02)
{
	if(isdefined(self.var_6142))
	{
		return;
	}

	if(!isdefined(self.var_3AB3) || self.var_3AB3.var_59EF != param_01)
	{
		lib_A516::func_23B7(param_01);
	}

	self.var_3AB3.color = param_00;
	if(isdefined(param_02) && param_02)
	{
		self.var_3AB3 setwaypointedgestyle_rotatingicon();
	}
}

//Function Number: 4
lib_A516::func_23B7(param_00)
{
	if(isdefined(self.var_3AB3))
	{
		self.var_3AB3 destroy();
	}

	self.var_3AB3 = newclienthudelem(self);
	self.var_3AB3 setshader(param_00,1,1);
	self.var_3AB3 setwaypoint(1,1,0);
	self.var_3AB3 setwaypointiconoffscreenonly();
	self.var_3AB3 method_80CD(lib_A59A::func_3E05(self));
	self.var_3AB3.var_59EF = param_00;
	self.var_3AB3.hidewheninmenu = 1;
	if(common_scripts\utility::flag("coop_show_constant_icon"))
	{
		self.var_3AB3.alpha = 1;
		return;
	}

	self.var_3AB3.alpha = 0;
}

//Function Number: 5
lib_A516::func_3A61()
{
	self endon("death");
	for(;;)
	{
		self waittill("weapon_fired");
		var_00 = lib_A59A::func_3E05(self);
		var_00 thread lib_A516::func_3A62(var_00.var_21C1,"coop_player_location_fire",1);
	}
}

//Function Number: 6
lib_A516::func_3A60()
{
	self endon("death");
	for(;;)
	{
		self waittill("damage");
		var_00 = lib_A59A::func_3E05(self);
		var_00 thread lib_A516::func_3A62(var_00.var_21BD,"coop_player_location",1);
	}
}

//Function Number: 7
lib_A516::func_3A62(param_00,param_01,param_02)
{
	if(isdefined(self.var_6142))
	{
		return;
	}

	self endon("death");
	self notify("flash_color_thread");
	self endon("flash_color_thread");
	var_03 = lib_A59A::func_3E05(self);
	if(lib_A59A::func_505F(var_03))
	{
		return;
	}

	lib_A516::func_71EA(param_00,param_01,param_02);
	wait(0.5);
	param_01 = lib_A516::func_3AAA();
	var_04 = lib_A516::func_3AB0();
	lib_A516::func_71EA(self.var_21C0,param_01,var_04);
}

//Function Number: 8
lib_A516::func_3A63()
{
	level endon("special_op_terminated");
	lib_A516::func_3AAF();
	thread lib_A516::func_3A61();
	thread lib_A516::func_3A60();
	thread lib_A516::func_5D77();
	thread lib_A516::func_3A5F();
	if(isdefined(self.var_6142))
	{
		return;
	}

	self.var_3AB3.alpha = 0;
	for(;;)
	{
		common_scripts\utility::flag_wait("coop_show_constant_icon");
		self.var_3AB3.alpha = 1;
		common_scripts\utility::flag_waitopen("coop_show_constant_icon");
		self.var_3AB3.alpha = 0;
	}
}

//Function Number: 9
lib_A516::func_3A5F()
{
	level waittill("special_op_terminated");
	foreach(var_01 in level.var_328)
	{
		var_01 lib_A516::func_6B1F();
	}
}

//Function Number: 10
lib_A516::func_6B1F()
{
	if(isdefined(self.var_3AB3))
	{
		self.var_3AB3 destroy();
	}
}

//Function Number: 11
lib_A516::func_3AAE()
{
	common_scripts\utility::flag_clear("coop_show_constant_icon");
}

//Function Number: 12
lib_A516::func_3AB1()
{
	common_scripts\utility::flag_set("coop_show_constant_icon");
}

//Function Number: 13
lib_A516::func_3AAB()
{
	self.var_6142 = 1;
	lib_A516::func_6B1F();
}

//Function Number: 14
lib_A516::func_3AAD()
{
	self.var_6142 = undefined;
	if(!isdefined(self.var_3AB3))
	{
		lib_A516::func_3AAF();
	}
}

//Function Number: 15
lib_A516::func_3AAF()
{
	if(!common_scripts\utility::flag("coop_game"))
	{
		return;
	}

	self.var_21C2 = "ICON_STATE_NORMAL";
	var_00 = lib_A516::func_3AAA();
	var_01 = lib_A516::func_3AB0();
	lib_A516::func_71EA(self.var_21C0,var_00,var_01);
}

//Function Number: 16
lib_A516::func_3AAC()
{
	if(!common_scripts\utility::flag("coop_game"))
	{
		return;
	}

	self.var_21C2 = "ICON_STATE_DOWNED";
	var_00 = lib_A516::func_3AAA();
	var_01 = lib_A516::func_3AB0();
	lib_A516::func_71EA(self.var_21BE,var_00,var_01);
}

//Function Number: 17
lib_A516::func_3AB2(param_00)
{
	if(!common_scripts\utility::flag("coop_game"))
	{
		return;
	}

	var_01 = lib_A516::func_3AAA();
	var_02 = lib_A516::func_3AB0();
	lib_A516::func_71EA(param_00,var_01,var_02);
}

//Function Number: 18
lib_A516::func_3AAA()
{
	var_00 = "coop_player_location";
	switch(self.var_21C2)
	{
		case "ICON_STATE_NORMAL":
			break;

		case "ICON_STATE_DOWNED":
			break;

		default:
			break;
	}
}

//Function Number: 19
lib_A516::func_3AB0()
{
	var_00 = 0;
	switch(self.var_21C2)
	{
		case "ICON_STATE_NORMAL":
			break;

		case "ICON_STATE_DOWNED":
			break;

		default:
			break;
	}
}

//Function Number: 20
lib_A516::func_5D77()
{
	if(self getplayerprofiledata("colorBlind") != self.var_2047)
	{
		self.var_2047 = self getplayerprofiledata("colorBlind");
		lib_A516::func_4DD6(self.var_2047);
		switch(self.var_21C2)
		{
			case "ICON_STATE_NORMAL":
				break;

			case "ICON_STATE_DOWNED":
				break;
		}
	}
}