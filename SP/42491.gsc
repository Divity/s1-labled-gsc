/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42491.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 54
 * Decompile Time: 17 ms
 * Timestamp: 4/20/2022 8:23:45 PM
*******************************************************************/

//Function Number: 1
lib_A5FB::func_2185()
{
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinewidth",20);
	function_00D3("r_hudoutlinecloakblurradius",0.35);
	if(!isdefined(level.var_1523))
	{
		level.var_1523 = [];
	}

	level.var_1523["controllable_swarm"] = spawnstruct();
	level.var_1523["controllable_swarm"].var_608C = 78;
	level.var_1523["controllable_swarm"].var_7D96 = 3000;
	level.var_1523["controllable_swarm"].var_9DB = 0.02;
	level.var_1523["controllable_swarm"].var_2002 = 0.0001;
	level.var_1523["controllable_swarm"].var_708E = 10;
	level.var_1523["controllable_swarm"].var_708A = 64;
	level.var_1523["controllable_swarm"].var_7111 = 50;
	level.var_1523["controllable_swarm"].var_59F4 = 2400;
	level.var_1523["controllable_swarm"].var_5C34 = 52.8;
	level.var_1523["controllable_swarm"].var_5A15 = 396;
	level.var_1523["controllable_swarm"].var_2C27 = 0;
	level.var_1523["controllable_swarm"].var_3071 = 0;
	level.var_1523["controllable_swarm"].var_7090 = 1;
	level.var_1523["controllable_swarm"].var_7086 = 5;
	level.var_1523["controllable_swarm"].var_7087 = 5;
	level.var_1523["controllable_swarm"].var_7088 = 15;
	level.var_1523["controllable_swarm"].var_7089 = 75;
	level.var_3AE1 = 0;
	level.var_901C = 0;
	level.var_2183 = "drone_hud_controllable_overlay_2";
	level.var_2181 = "drone_hud_controllable_overlay_1";
	level.var_2189 = "jet_hud_hex_blue";
	level.var_2186 = [];
	if(!common_scripts\utility::flag_exist("cloud_in_formation"))
	{
		common_scripts\utility::flag_init("cloud_in_formation");
	}

	lib_A59A::func_32DC("controllable_drones_go");
	common_scripts\utility::flag_init("controllable_swarm_activated");
	common_scripts\utility::flag_init("player_attack_think_running");
	common_scripts\utility::flag_init("controlling_drones");
	common_scripts\utility::flag_init("controlling_drones_first_time");
	level.var_2187 = [];
	level.var_3519 = level.var_E1E * level.var_E1D;
	precacheitem("iw5_attackdronemagicbullet");
	precacheshader(level.var_2183);
	precacheshader(level.var_2181);
	precacheshader(level.var_2189);
	precacheshader("sat_hud_xray_blue");
	precacheshader("jet_hud_hex_orange");
	precacheshader("jet_hud_missile_circle");
	precacheitem("remote_missile_drone");
	lib_A5FB::func_6EBD();
	lib_A5FA::func_2E53();
	level.var_78AE["drone_control_view_model"] = #animtree;
	level.var_78B2["drone_control_view_model"] = "viewhands_s1_pmc";
	level.var_78A9["drone_control_view_model"]["drone_control_on"] = %vm_turn_on_cloak;
}

//Function Number: 2
lib_A5FB::func_6EBD()
{
	precacheshader("drone_hud_locking_on_1");
	precacheshader("drone_hud_locking_on_2");
	precacheshader("drone_hud_locking_on_3");
	precacheshader("drone_hud_locking_on_4");
	precacheshader("drone_hud_locking_on_5");
	precacheshader("drone_hud_locking_on_6");
	precacheshader("drone_hud_locking_on_7");
	precacheshader("drone_hud_locking_on_8");
	precacheshader("drone_hud_locking_on_9");
	precacheshader("drone_hud_locking_on_10");
	precacheshader("drone_hud_locking_on_11");
	precacheshader("drone_hud_locking_on_12");
	precacheshader("drone_hud_locking_on_13");
	precacheshader("drone_hud_locking_on_14");
	precacheshader("drone_hud_locking_on_15");
	precacheshader("drone_hud_locking_on_16");
	precacheshader("drone_hud_npc_lockon");
	precacheshader("drone_hud_veh_lockon");
	level.var_2E85 = ["drone_hud_locking_on_2","drone_hud_locking_on_4","drone_hud_locking_on_6","drone_hud_locking_on_8","drone_hud_locking_on_10","drone_hud_locking_on_12","drone_hud_locking_on_14","drone_hud_locking_on_16"];
}

//Function Number: 3
lib_A5FB::func_52FE()
{
	level.var_2180 notify("end_drone_swarm");
	level notify("delete_drone_cloud");
	common_scripts\utility::array_thread(level.var_2187,::lib_A56F::func_2800);
	common_scripts\utility::array_thread(level.var_2ED3,::lib_A56F::func_2800);
	common_scripts\utility::array_removeundefined(level.var_2187);
	common_scripts\utility::array_removeundefined(level.var_2ED3);
}

//Function Number: 4
lib_A5FB::func_072D(param_00,param_01,param_02)
{
	var_03 = self gettagangles(param_01);
	var_04 = self gettagorigin(param_01);
	if(param_00 == "up")
	{
		return var_04 + anglestoup(var_03) * param_02;
	}

	if(param_00 == "down")
	{
		return var_04 + anglestoup(var_03) * param_02 * -1;
	}

	if(param_00 == "right")
	{
		return var_04 + anglestoright(var_03) * param_02;
	}

	if(param_00 == "left")
	{
		return var_04 + anglestoright(var_03) * param_02 * -1;
	}

	if(param_00 == "forward")
	{
		return var_04 + anglestoforward(var_03) * param_02;
	}

	if(param_00 == "backward")
	{
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "backwardright")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02;
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "backwardleft")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * -1;
		return var_04 + anglestoforward(var_03) * param_02 * -1;
	}

	if(param_00 == "forwardright")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * 1;
		return var_04 + anglestoforward(var_03) * param_02;
	}

	if(param_00 == "forwardleft")
	{
		var_04 = var_04 + anglestoright(var_03) * param_02 * -1;
		return var_04 + anglestoforward(var_03) * param_02;
	}
}

//Function Number: 5
lib_A5FB::func_80D8()
{
	level.var_2184 = getentarray("drone_crate_spawner","targetname");
	var_00 = getentarray("vol_drone_crate_reinforcements","targetname");
	foreach(var_02 in level.var_2184)
	{
		var_02 lib_A5FB::func_5915(level.var_2184);
	}

	foreach(var_05 in var_00)
	{
		var_05 lib_A5FB::func_5916(level.var_2184);
		var_05 thread lib_A5FB::func_A072();
	}

	level notify("queen_drone_selected",self);
	level.var_31D lib_A5FB::func_9012(level.var_2181);
}

//Function Number: 6
lib_A5FB::func_5916(param_00)
{
	self.var_2EC2 = [];
	self.path = undefined;
	foreach(var_02 in param_00)
	{
		if(var_02 istouching(self))
		{
			self.var_2EC2[self.var_2EC2.size] = var_02;
		}
	}

	var_04 = common_scripts\utility::getstructarray("struct_drone_crate_reinforcements","targetname");
	var_05 = common_scripts\utility::spawn_tag_origin();
	foreach(var_07 in var_04)
	{
		var_05.var_2E6 = var_07.var_2E6;
		if(var_05 istouching(self))
		{
			self.path = var_07;
		}
	}
}

//Function Number: 7
lib_A5FB::func_5915(param_00)
{
	var_01 = getentarray("drone_crate_trigger","targetname");
	self.trigger = lib_A5FB::func_3F34(self.var_2E6,var_01,500);
	self.var_9F32 = getentarray("drone_crate_volume","targetname");
	var_02 = getentarray("drone_crate_drone","targetname");
	self.var_4C25 = getent("vol_include_drones","targetname");
	self.var_6032 = lib_A5FB::func_3F34(self.var_2E6,self.var_9F32,500);
	self.var_6031 = lib_A5FB::func_4137(var_02,self.var_6032);
	self.nodes = lib_A56F::func_4121("drone_crate_path","targetname");
	self.node = lib_A5FB::func_3F34(self.var_6032.var_2E6,self.nodes,500);
}

//Function Number: 8
lib_A5FB::func_A072()
{
	while(!level.var_31D istouching(self))
	{
		wait 0.05;
	}

	lib_A5FB::func_2E2F();
}

//Function Number: 9
lib_A5FB::func_453D()
{
	level.var_2180 endon("death");
	var_00 = common_scripts\utility::getstructarray("struct_drone_crate_masterpath1","targetname");
	var_01 = level.var_31D common_scripts\utility::spawn_tag_origin();
	for(;;)
	{
		if(!level.var_2180.var_505E)
		{
			var_01.var_2E6 = level.var_31D.var_2E6;
			var_01.var_41 = level.var_31D method_8036();
			var_02 = var_01 lib_A56F::func_6379("forward","tag_origin",300);
			var_03 = lib_A56F::func_3F33(var_02,var_00,1000);
			if(isdefined(var_03))
			{
				thread lib_A5FB::func_7083(var_03,20);
			}
		}

		wait(2);
	}
}

//Function Number: 10
lib_A5FB::func_2E2F()
{
	var_00 = lib_A5FB::func_88D9();
	if(!isdefined(level.var_2180))
	{
		level.var_2180 = var_00[0];
		level.var_2180.var_505E = 0;
		level.var_2180 show();
		thread lib_A5FB::func_453D();
	}

	if(!isdefined(level.var_2ED3))
	{
		level.var_2ED3 = var_00;
	}
	else
	{
		level.var_2ED3 = common_scripts\utility::array_combine(level.var_2ED3,var_00);
	}

	foreach(var_02 in var_00)
	{
		while(!isdefined(var_02.var_1520))
		{
			wait 0.05;
		}
	}

	wait(4);
	common_scripts\utility::array_thread(var_00,::lib_A5FB::func_2188,level.var_2180,level.var_1523["controllable_swarm"].var_7089);
	level.var_2180.var_2F19 = level.var_2187;
	level.var_31D thread lib_A5FB::func_6A5E();
	level notify("drone_swarm_spawned");
	level.var_901C = 1;
}

//Function Number: 11
lib_A5FB::func_7083(param_00,param_01)
{
	if(isdefined(level.var_2180))
	{
		if(!isdefined(param_01))
		{
			param_01 = 25;
		}

		level.var_2180 notify("end_queen_think");
		level.var_2180.var_DF6 = undefined;
		var_02 = level.var_31D method_8036()[1];
		level.var_2180 veh_helisetgoal(param_00.var_2E6,param_01,param_01 / 2,param_01 * 2,0,1,var_02,0,0,1,0,0,1);
	}
}

//Function Number: 12
lib_A5FB::func_3F6C(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	var_04 = (function_00FE(gettime() * 0.001 * 0.05,10,param_00,param_01,param_02) * param_03,function_00FE(gettime() * 0.001 * 0.05,20,param_00,param_01,param_02) * param_03,function_00FE(gettime() * 0.001 * 0.05,30,param_00,param_01,param_02) * param_03);
	return var_04;
}

//Function Number: 13
lib_A5FB::func_88D9()
{
	var_00 = self.var_2EC2;
	var_01 = self.var_2EC2.size;
	var_02 = [];
	for(var_03 = 0;var_03 < var_01;var_03++)
	{
		var_00[var_03].count = 1;
		var_04 = var_00[var_03] lib_A59A::func_896F();
		var_04.location = int(120 / var_01 * var_03);
		var_04.var_627E = var_01;
		var_04 thread lib_A5FB::func_5912(var_00[var_03].var_6031);
		var_04 thread lib_A5FA::func_592C();
		var_04.var_1A46 = 1;
		var_04.var_7AE9 = "allies";
		var_02[var_02.size] = var_04;
		var_04 hide();
		wait(0.1);
	}

	return var_02;
}

//Function Number: 14
lib_A5FB::func_4137(param_00,param_01,param_02)
{
	var_03 = undefined;
	if(isdefined(param_02) && param_02)
	{
		var_03 = common_scripts\utility::spawn_tag_origin();
	}

	var_04 = [];
	foreach(var_06 in param_00)
	{
		if(isdefined(var_03))
		{
			var_03.var_2E6 = var_06.var_2E6;
			var_07 = var_03;
		}
		else
		{
			var_07 = var_06;
		}

		if(var_07 istouching(param_01))
		{
			var_04[var_04.size] = var_06;
		}
	}

	if(isdefined(var_03))
	{
		var_03 delete();
	}

	return var_04;
}

//Function Number: 15
lib_A5FB::func_6B8B(param_00)
{
	if(level.var_31D.var_5016)
	{
		level.var_31D lib_A59A::func_6ACE();
		level.var_31D.var_5016 = 0;
	}

	level.var_31D lib_A571::func_825E();
	level.var_31D playerlinktoabsolute(param_00,"tag_origin");
}

//Function Number: 16
lib_A5FB::func_6C3D()
{
	level.var_31D unlink();
	level.var_31D lib_A571::func_825D();
}

//Function Number: 17
lib_A5FB::func_6F0E()
{
	self disableweapons();
	self.ignoreme = 1;
	self method_80EF();
	var_00 = function_00D6("axis");
}

//Function Number: 18
lib_A5FB::func_7387()
{
	self enableweapons();
	self.ignoreme = 0;
	self method_80F0();
}

//Function Number: 19
lib_A5FB::func_5D89(param_00)
{
	param_00 endon("death");
	while(param_00.var_2F19.size <= 0)
	{
		wait 0.05;
	}

	while(param_00.var_2F19.size > 0)
	{
		param_00.var_2F19 = common_scripts\utility::array_removeundefined(param_00.var_2F19);
		wait 0.05;
	}

	param_00 notify("end_drone_swarm");
}

//Function Number: 20
lib_A5FB::func_9012(param_00)
{
	var_01 = 50000;
	var_02 = 60;
	self.var_2F03["overlay1"] = newclienthudelem(self);
	self.var_2F03["overlay1"] setshader(param_00,640,480);
	self.var_2F03["overlay1"].alignx = "left";
	self.var_2F03["overlay1"].aligny = "top";
	self.var_2F03["overlay1"].x = 0;
	self.var_2F03["overlay1"].y = 0;
	self.var_2F03["overlay1"].horzalign = "fullscreen";
	self.var_2F03["overlay1"].vertalign = "fullscreen";
	self.var_2F03["overlay1"].alpha = 0.5;
	self.var_2F03["num_drones"] = newclienthudelem(self);
	self.var_2F03["num_drones"].alignx = "left";
	self.var_2F03["num_drones"].aligny = "top";
	self.var_2F03["num_drones"].x = 10;
	self.var_2F03["num_drones"].y = 110;
	self.var_2F03["num_drones"].var_18C = 2;
	thread lib_A5FB::func_5DCC();
}

//Function Number: 21
lib_A5FB::func_5DCC()
{
	for(;;)
	{
		self.var_2F03["num_drones"] settext("Drones:  " + level.var_2187.size);
		wait 0.05;
	}
}

//Function Number: 22
lib_A5FB::func_9010(param_00)
{
	self.var_2F03["overlay1"] setshader(param_00,640,480);
}

//Function Number: 23
lib_A5FB::func_9011(param_00)
{
	common_scripts\utility::array_call(self.var_2F03,::destroy);
}

//Function Number: 24
lib_A5FB::func_3D46(param_00,param_01,param_02,param_03,param_04)
{
	wait(randomfloat(param_01 / 2));
	param_00 = self.var_2E6 + (randomintrange(-20,20),randomintrange(-20,20),20 + param_01 * 12);
	lib_A5FA::func_2E80((self.var_2E6[0],self.var_2E6[1],param_00[2]),50);
	self rotateto(param_02.var_41,1,0.1,0.5);
	wait(1);
	lib_A5FA::func_2E80(param_00,50);
	param_03 lib_A5FA::func_7AB(self);
}

//Function Number: 25
lib_A5FB::func_0E22()
{
	for(;;)
	{
		common_scripts\utility::flag_waitopen("controlling_drones");
		common_scripts\utility::flag_wait("controlling_drones");
		lib_A59A::func_48AD("Press ^3[{+attack}]^7 to launch a drone at each locked on target");
		level.var_31D common_scripts\utility::waittill_any("attack_pressed","dpad_down");
		lib_A59A::func_48C8();
	}
}

//Function Number: 26
lib_A5FB::func_2E44()
{
	level.var_31D disableweapons();
	level.var_31D waittill("weapon_change");
	var_00 = lib_A59A::func_88CB("drone_control_view_model");
	var_00 method_80A6(level.var_31D,"tag_origin",(0,0,0),(0,0,0),1);
	level.var_31D lib_A506::func_C24(var_00,"drone_control_on");
	level.var_31D enableweapons();
	var_00 unlink();
	var_00 delete();
}

//Function Number: 27
lib_A5FB::func_80D6()
{
	foreach(var_01 in level.var_2187)
	{
		if(isdefined(var_01))
		{
			var_01 lib_A59E::func_4256();
			var_01 method_8029();
		}
	}

	foreach(var_04 in level.var_2186)
	{
		if(isdefined(var_04))
		{
			var_04 method_8029();
		}
	}

	wait 0.05;
	level.var_31D method_80B6();
	level.var_31D lib_A5FB::func_9010(level.var_2183);
}

//Function Number: 28
lib_A5FB::func_7340()
{
	var_00 = level.var_31D.var_2E84;
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02) && function_00A3(var_02))
		{
			function_009B(var_02);
		}
	}

	level.var_31D.var_2E84 = [];
	level.var_31D method_80B7();
	level.var_31D lib_A5FB::func_9010(level.var_2181);
}

//Function Number: 29
lib_A5FB::func_455E()
{
	var_00 = function_00D6("axis");
	level.var_2186 = lib_A59A::func_CFD(level.var_2186);
	var_01 = common_scripts\utility::array_combine(level.var_2186,var_00);
	var_01 = common_scripts\utility::array_removeundefined(var_01);
	var_01 = common_scripts\utility::array_remove_duplicates(var_01);
	level.var_31D.var_2E84 = [];
	foreach(var_03 in var_01)
	{
		if(isdefined(var_03.var_750B))
		{
			var_01 = common_scripts\utility::array_remove(var_01,var_03);
		}
	}

	lib_A5FB::func_455F(var_01);
	foreach(var_03 in var_01)
	{
		if(isdefined(var_03) && function_00A3(var_03))
		{
			function_009B(var_03);
		}
	}

	if(common_scripts\utility::flag("drone_swarm_launched"))
	{
		level waittill("drone_swarm_launch_seq_complete");
	}
}

//Function Number: 30
lib_A5FB::func_455F(param_00)
{
	level.var_31D endon("dpad_down");
	level endon("drone_swarm_launched");
	level.var_31D endon("drone_killed_by_death");
	var_01 = common_scripts\utility::spawn_tag_origin();
	function_009A(var_01);
	function_00A6(var_01,level.var_31D);
	foreach(var_03 in param_00)
	{
		var_03.var_57FE = 0;
	}

	for(;;)
	{
		foreach(var_03 in param_00)
		{
			if(!isdefined(var_03) || var_03.var_57FE == level.var_2E85.size)
			{
				continue;
			}

			var_01.var_2E6 = var_03.var_2E6;
			var_06 = level.var_2180 lib_A62D::func_6798();
			var_07 = 60;
			var_08 = function_009F(var_01,level.var_31D,var_06,var_07);
			var_08 = var_08 && level.var_31D.var_2E84.size < level.var_2187.size;
			if(var_08)
			{
				if(var_03.var_57FE == 0)
				{
					function_009A(var_03,(0,0,32));
				}

				var_03.var_57FE++;
				if(var_03.var_57FE == level.var_2E85.size)
				{
					if(var_03 lib_A59E::func_51FA())
					{
						function_009C(var_03,"drone_hud_veh_lockon");
					}
					else
					{
						function_009C(var_03,"drone_hud_npc_lockon");
					}

					level.var_31D.var_2E84[level.var_31D.var_2E84.size] = var_03;
					level.var_31D notify("drone_target_aquired");
				}
				else
				{
					function_009C(var_03,level.var_2E85[var_03.var_57FE]);
				}

				continue;
			}

			if(function_00A3(var_03))
			{
				var_03.var_57FE = 0;
				function_009B(var_03);
			}
		}

		wait 0.05;
	}
}

//Function Number: 31
lib_A5FB::func_A06E()
{
	common_scripts\utility::flag_clear("drone_swarm_launched");
	level.var_31D waittill("attack_pressed");
	level.var_31D.var_2E84 = common_scripts\utility::array_removeundefined(level.var_31D.var_2E84);
	level.var_31D.var_2E82 = undefined;
	foreach(var_01 in level.var_31D.var_2E84)
	{
		if(var_01 lib_A59E::func_51FA() && var_01 lib_A59E::func_5115())
		{
			level.var_31D.var_2E82 = var_01;
			level.var_31D.var_2E84 = common_scripts\utility::array_remove(level.var_31D.var_2E84,var_01);
			break;
		}
	}

	if(level.var_31D.var_2E84.size > 0)
	{
		common_scripts\utility::flag_set("drone_swarm_launched");
		var_03 = level.var_31D.var_2E84.size - 1;
		level.var_31D.var_2E83 = level.var_31D.var_2E84[var_03];
		level.var_31D.var_2E83.health = 1000;
		level.var_31D.var_2E84 = lib_A59A::func_CFA(level.var_31D.var_2E84,var_03);
		if(level.var_31D.var_2E84.size > 0)
		{
			lib_A5FB::func_560F(level.var_31D.var_2E84);
		}

		level.var_31D.var_2E83.health = 50;
		lib_A5FB::func_560E(level.var_31D.var_2E83);
	}

	level notify("drone_swarm_launch_seq_complete");
	if(isdefined(level.var_31D.var_2E82))
	{
		level.var_31D.var_2E82 thread lib_A5FB::func_4808(level.var_2180.var_2E6);
	}
}

//Function Number: 32
lib_A5FB::func_6A5E()
{
	level.var_31D endon("death");
	if(common_scripts\utility::flag("player_attack_think_running"))
	{
		return;
	}

	common_scripts\utility::flag_set("player_attack_think_running");
	var_00 = 1000;
	thread lib_A5FB::func_0E22();
	for(;;)
	{
		level.var_31D waittill("dpad_down");
		if(level.var_2187.size == 0)
		{
			continue;
		}

		lib_A5FB::func_2E44();
		if(level.var_2187.size > 0)
		{
			common_scripts\utility::flag_set("controlling_drones");
			common_scripts\utility::flag_set("controlling_drones_first_time");
			var_01 = level.var_2180;
			var_01.var_505E = 1;
			lib_A5FB::func_80D6();
			lib_A62D::func_679D(var_01,undefined,0,undefined,undefined,"LT","ui_sniperdrone");
			thread lib_A541::func_4F8F("black",0.5,0.5);
			var_01 lib_A62D::func_6795();
			var_01 method_80C6();
			thread lib_A5FB::func_A06E();
			if(isdefined(level.var_2182))
			{
			}

			var_01 thread lib_A62D::func_679B();
			lib_A5FB::func_455E();
			var_01 lib_A62D::func_6796();
			var_01.var_505E = 0;
			thread lib_A541::func_4F8F("black",0.5,0.5);
			lib_A5FB::func_7340();
			common_scripts\utility::flag_clear("controlling_drones");
		}

		wait 0.05;
	}
}

//Function Number: 33
lib_A5FB::func_2E90(param_00,param_01)
{
	var_02 = spawn("script_model",param_00);
	var_02 setmodel("vehicle_sentinel_survey_drone");
	var_02 lib_A5FB::func_2E8E(param_00,param_01);
	return var_02;
}

//Function Number: 34
lib_A5FB::func_2E8E(param_00,param_01)
{
	self.var_561A = param_00;
	self.var_91AB = param_01;
	self.var_2A6C = self.var_91AB - self.var_561A;
	var_02 = 500;
	self.var_93EE = length(self.var_91AB - self.var_561A) / var_02;
	self.var_9C62 = (-1,-1,-150);
	self.var_9C63 = 2 * self.var_91AB - self.var_561A - self.var_9C62 * self.var_93EE * self.var_93EE / 2 * self.var_93EE;
}

//Function Number: 35
lib_A5FB::func_2E8F()
{
	self.var_934E = 0;
	while(self.var_934E <= self.var_93EE)
	{
		var_00 = self.var_2E6;
		self.var_2E6 = self.var_561A + self.var_934E * self.var_9C63 + 0.5 * self.var_9C62 * self.var_934E * self.var_934E;
		self.var_41 = vectortoangles(self.var_91AB - self.var_2E6);
		self.var_934E = self.var_934E + 0.05;
		wait(0.05);
	}

	function_0071("fraggrenade",self.var_2E6,(0,0,0),0.05,level.var_31D);
	self delete();
	level notify("drone_missile_loop_complete",self);
}

//Function Number: 36
lib_A5FB::func_560E(param_00)
{
	level.var_2187 = common_scripts\utility::array_removeundefined(level.var_2187);
	var_01 = level.var_2187[0];
	level.var_2187 = common_scripts\utility::array_remove(level.var_2187,var_01);
	var_01 delete();
	var_02 = lib_A5FB::func_2E90(level.var_31D.var_2E6,param_00.var_2E6);
	lib_A5FB::func_6B8B(var_02);
	var_02 lib_A5FB::func_2E8F();
	lib_A5FB::func_6C3D();
}

//Function Number: 37
lib_A5FB::func_560F(param_00)
{
	var_01 = level.var_31D.var_2E6;
	foreach(var_03 in param_00)
	{
		if(isdefined(var_03))
		{
			var_01 = var_03.var_2E6;
			break;
		}
	}

	level.var_2187 = common_scripts\utility::array_removeundefined(level.var_2187);
	var_05 = level.var_2187;
	var_05 = sortbydistance(var_05,var_01);
	var_06 = [];
	foreach(var_08 in param_00)
	{
		if(isdefined(var_08))
		{
			var_06[var_06.size] = var_08;
			if(function_00A3(var_08))
			{
				function_009B(var_08);
			}
		}
	}

	var_0A = 0;
	foreach(var_14, var_0C in param_00)
	{
		if(!isdefined(var_0C))
		{
			continue;
		}

		var_0D = var_05[var_14];
		if(!isdefined(var_0D))
		{
			foreach(var_03 in param_00)
			{
				if(isdefined(var_03))
				{
					var_0C = var_03;
				}
			}
		}

		if(!isdefined(var_0D))
		{
			return;
		}

		var_0D notify("im_attacking");
		var_0D.var_7350 = 1;
		var_10 = var_0D.var_2E6;
		var_10 = level.var_31D geteye();
		var_11 = level.var_31D getplayerangles();
		var_0D delete();
		level.var_2187 = common_scripts\utility::array_removeundefined(level.var_2187);
		var_12 = (randomintrange(-100,100),randomintrange(-100,100),0);
		var_13 = lib_A5FB::func_2E90(var_10,var_0C.var_2E6);
		var_0A++;
		var_13 method_8029();
		var_13 thread lib_A5FB::func_2E8F();
	}

	while(var_0A > 0)
	{
		level waittill("drone_missile_loop_complete",var_15);
		var_0A--;
	}
}

//Function Number: 38
lib_A5FB::func_1E75(param_00,param_01)
{
	while(isdefined(param_00))
	{
		wait(0.05);
	}

	param_01 delete();
}

//Function Number: 39
lib_A5FB::func_2E86(param_00,param_01)
{
	wait(randomfloatrange(0.1,0.35));
	var_02 = common_scripts\utility::spawn_tag_origin();
	if(issentient("target"))
	{
		var_02.var_2E6 = param_01 geteye();
	}
	else
	{
		var_02.var_2E6 = param_01.var_2E6;
	}

	var_02 linkto(param_01);
	function_009A(var_02);
	function_00A6(var_02,level.var_31D);
	if(issentient("target"))
	{
		var_03 = magicbullet("remote_missile_drone_light",param_00,param_01 geteye() + (0,0,200),level.var_31D);
	}
	else
	{
		var_03 = magicbullet("remote_missile_drone_light",param_01,var_02.var_2E6 + (0,0,200),level.var_31D);
	}

	var_03 missilesettargetent(var_02);
	var_03 missilesetflightmodetop();
	thread lib_A5FB::func_1E75(var_03,var_02);
	return var_03;
}

//Function Number: 40
lib_A5FB::func_3F34(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 500000;
	}

	if(!isdefined(param_01))
	{
		return;
	}

	var_03 = undefined;
	foreach(var_05 in param_01)
	{
		if(!isdefined(var_05))
		{
			continue;
		}

		var_06 = distance(var_05.var_2E6,param_00);
		if(var_06 >= param_02)
		{
			continue;
		}

		param_02 = var_06;
		var_03 = var_05;
	}

	return var_03;
}

//Function Number: 41
lib_A5FB::func_5D8B()
{
	while(isdefined(self))
	{
		wait 0.05;
	}

	level.var_31D notify("drone_missile_impact");
}

//Function Number: 42
lib_A5FB::func_4808(param_00)
{
	if(isdefined(level.var_2ED3[1]))
	{
		var_01 = level.var_2ED3[1];
	}
	else
	{
		var_01 = level.var_2ED3[2];
	}

	var_02 = var_01.var_2E6;
	foreach(var_04 in var_01.var_1525)
	{
		if(isdefined(var_04))
		{
			var_04 delete();
		}
	}

	var_01 delete();
	var_06 = undefined;
	var_07 = undefined;
	if(level.nextgen)
	{
		var_06 = 12;
		var_07 = 24;
	}
	else
	{
		var_06 = 6;
		var_07 = 12;
	}

	var_08 = lib_A5FA::func_894A("queen_drone_cloud_2",undefined,var_06,var_07,var_02);
	level notify("drone_attacked_chopper");
	var_08 lib_A5FA::func_8699(self);
}

//Function Number: 43
lib_A5FB::func_7C7D(param_00)
{
	while(isdefined(param_00) && isdefined(self))
	{
		self veh_setgoalpos(param_00.var_2E6,1);
		wait(0.05);
	}
}

//Function Number: 44
lib_A5FB::func_23AD(param_00)
{
	var_01 = common_scripts\utility::spawn_tag_origin();
	var_01.var_41 = self.var_41;
	var_01.var_2E6 = var_01 lib_A5FA::func_6378("forward","tag_origin",50);
	var_02[0] = var_01 lib_A5FA::func_6378("right","tag_origin",60);
	var_02[1] = var_01 lib_A5FA::func_6378("left","tag_origin",70);
	var_02[2] = var_01 lib_A5FA::func_6378("up","tag_origin",40);
	var_02[3] = var_01 lib_A5FA::func_6378("down","tag_origin",40);
	foreach(var_04 in var_02)
	{
		var_05 = spawn("script_model",var_04);
		var_05 setmodel("vehicle_sentinel_survey_drone");
		var_05.var_41 = var_01.var_41;
		var_05 thread lib_A5FA::func_5685(param_00.var_2E6,randomintrange(600,700));
		var_05 thread lib_A5FB::func_857F();
	}
}

//Function Number: 45
lib_A5FB::func_1EB1()
{
}

//Function Number: 46
lib_A5FB::func_5D87()
{
	common_scripts\utility::waittill_any("im_dying","explode","death","im_attacking");
	level.var_2187 = common_scripts\utility::array_remove(level.var_2187,self);
}

//Function Number: 47
lib_A5FB::func_2188(param_00,param_01)
{
	if(self != level.var_2180)
	{
		thread lib_A5FB::func_708B(param_00,param_01);
	}
}

//Function Number: 48
lib_A5FB::func_708B(param_00,param_01)
{
	level endon("delete_drone_cloud");
	self endon("death");
	self endon("end_queen_think");
	level.var_2180 endon("end_drone_swarm");
	self.var_70B6 = param_01;
	self.accel = level.var_1523["controllable_swarm"].var_7086;
	self.var_273C = level.var_1523["controllable_swarm"].var_7087;
	self.var_28B5 = level.var_1523["controllable_swarm"].var_7088;
	var_02 = (0,0,0);
	self notify("queen_set_fly_logic");
	for(;;)
	{
		var_03 = lib_A5FB::func_6E5C(param_00.var_2E6,self.var_70B6);
		var_02 = var_03;
		var_04 = param_00 veh_getspeed() * 1.75;
		if(var_04 <= 0)
		{
			var_04 = 1;
		}

		self veh_setspeed(var_04,var_04,var_04 * 1.5);
		self veh_setgoalpos(var_03);
		if(!common_scripts\utility::flag("cloud_in_formation"))
		{
			if(self.location + 1 <= 120)
			{
				self.location++;
			}
			else
			{
				self.location = 0;
			}

			wait 0.05;
			continue;
		}

		wait(0.25);
	}
}

//Function Number: 49
lib_A5FB::func_6E5C(param_00,param_01)
{
	var_02 = param_01;
	var_03 = 1;
	var_04 = 120;
	var_05 = 3;
	var_06 = [];
	var_07 = [];
	for(var_08 = 0;var_08 < var_04;var_08++)
	{
		var_03 = var_05 * var_08;
		var_09 = 0;
		var_06[var_06.size] = param_00 + anglestoforward((var_09,var_03,0)) * var_02;
	}

	if(isdefined(var_06[self.location]))
	{
		return var_06[self.location];
	}

	return var_06[0];
}

//Function Number: 50
lib_A5FB::func_5912(param_00,param_01)
{
	var_02 = spawnstruct();
	var_02.var_1525 = [];
	var_02.var_7082 = self;
	var_02.var_7082.var_38E4 = var_02;
	if(isdefined(param_01))
	{
		var_02.var_1522 = param_01;
	}
	else
	{
		var_02.var_1522 = spawnstruct();
	}

	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_04 = spawn("script_model",param_00[var_03].var_2E6);
		var_04 setmodel("vehicle_mil_attack_drone_static");
		var_04.var_41 = param_00[var_03].var_41;
		var_04 thread lib_A5FB::func_3D46(param_00[var_03],var_03,var_02.var_7082,var_02);
		param_00[var_03] hide();
		var_04 thread lib_A5FB::func_5D78();
		thread lib_A5FB::func_5D87();
		level.var_2187[level.var_2187.size] = var_04;
		wait 0.05;
	}

	self.var_1525 = var_02.var_1525;
	var_02.var_7082.var_1520 = 1;
	var_02 thread lib_A5FA::func_1521();
	return var_02;
}

//Function Number: 51
lib_A5FB::func_A315(param_00)
{
	var_01 = 150;
	if(!isdefined(level.var_2180.var_1A23))
	{
		return 0;
	}

	if(distance(param_00,level.var_2180.var_1A23.var_2E6) < var_01)
	{
		return 1;
	}

	return 0;
}

//Function Number: 52
lib_A5FB::func_857F()
{
	self setcandamage(1);
	self.var_1A46 = 1;
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04);
		if(lib_A5FA::func_5005(var_04))
		{
			thread lib_A5FA::func_3635();
		}
	}
}

//Function Number: 53
lib_A5FB::func_5D78(param_00)
{
	self notify("kill_drone_cloud_health_process");
	self endon("kill_drone_cloud_health_process");
	if(isdefined(self))
	{
		self.var_1A46 = 0;
	}

	if(!isdefined(self))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	if(!param_00 && randomint(100) > 25)
	{
		return;
	}

	if(!param_00)
	{
		wait(randomfloat(1));
	}

	self setcandamage(1);
	self.var_1A46 = 1;
	var_01 = 0;
	for(;;)
	{
		self waittill("damage",var_02,var_03,var_04,var_05,var_06);
		if(lib_A5FA::func_5005(var_06))
		{
			var_01++;
		}

		if(var_01 >= 2)
		{
			thread lib_A5FA::func_3635();
			level notify("drone_killed_by_death");
			break;
		}
	}
}

//Function Number: 54
lib_A5FB::func_151E(param_00,param_01)
{
	param_00 notify("stop_friendlyfire_shield");
	level endon("end_drone_cloud");
	param_00 endon("death");
	if(!isdefined(param_01))
	{
		param_01 = 300;
	}

	while(!level.var_901C)
	{
		wait 0.05;
	}

	while(distance(param_00.var_2E6,level.var_1FE3.var_2E6) > param_01)
	{
		var_02 = distance(param_00.var_2E6,level.var_1FE3.var_2E6);
		wait 0.05;
	}

	while(lib_A5FA::func_50F4(param_00))
	{
		var_03 = sortbydistance(level.var_2187,param_00.var_2E6);
		for(var_04 = 0;var_04 < 5;var_04++)
		{
			var_03[var_04] thread lib_A5FA::func_1524(param_00,param_01);
			wait(0.1);
		}

		wait(2);
	}
}