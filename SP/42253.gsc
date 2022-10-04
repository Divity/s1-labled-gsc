/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42253.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 47
 * Decompile Time: 13 ms
 * Timestamp: 4/20/2022 8:22:03 PM
*******************************************************************/

//Function Number: 1
lib_A50D::func_4CDE()
{
	lib_A50D::func_6ED8();
	precacheitem("weapon_suv_door_shield_fl");
	precacheitem("weapon_suv_door_shield_fr");
	precacheitem("weapon_boxtruck_door_shield_fl");
	precacheitem("weapon_boxtruck_door_shield_fr");
	if(!1)
	{
		precachemodel("npc_atlas_suv_door_fl");
	}

	precachemodel("vm_atlas_suv_door_fr");
	precachemodel("vm_atlas_suv_door_fl");
	precachemodel("vm_civ_boxtruck_door_fr");
	precachemodel("vm_civ_boxtruck_door_fl");
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinewidth",1);
	function_00D3("r_hudoutlinepostmode",4);
	function_00D3("r_hudoutlinecloaklumscale",3);
	function_00D3("r_hudoutlinecloakblurradius",0.35);
	lib_A59A::func_746("hint_door_throw",&"_CAR_DOOR_SHIELD_THROW_HINT",::lib_A50D::func_8451);
	if(!lib_A50D::func_6A58())
	{
		return;
	}

	common_scripts\utility::flag_init("player_has_cardoor");
	common_scripts\utility::flag_init("player_pulling_cardoor");
	var_00 = getentarray("trig_door_shield","targetname");
	var_01 = common_scripts\utility::getstructarray("struct_vb_anim_org","targetname");
	lib_A50D::func_2D69(var_00,var_01);
	thread lib_A50D::func_5DAC(var_00);
	thread lib_A50D::func_4531();
}

//Function Number: 2
lib_A50D::func_2D69(param_00,param_01)
{
	foreach(var_03 in param_00)
	{
		if(level.var_31D method_834E())
		{
			var_03 sethintstring(&"_CAR_DOOR_SHIELD_INTERACT");
		}
		else
		{
			var_03 sethintstring(&"_CAR_DOOR_SHIELD_INTERACT_PC");
		}

		var_03.var_9C5F = var_03 lib_A50D::func_3D02(param_01);
		var_03 thread lib_A50D::func_2D52();
	}
}

//Function Number: 3
lib_A50D::func_6ED8()
{
	level._effect["car_door_shield_ripoff"] = loadfx("vfx/sparks/car_door_ripoff_sparks");
	level._effect["large_glass_1"] = loadfx("vfx/weaponimpact/large_glass_1");
	level._effect["seo_suv_doorshield_hit"] = loadfx("vfx/map/seoul/seo_suv_doorshield_hit");
	level._effect["seo_suv_doorshield_hit_break"] = loadfx("vfx/map/seoul/seo_suv_doorshield_hit_break");
}

//Function Number: 4
lib_A50D::func_3D02(param_00)
{
	return common_scripts\utility::getclosest(self.var_2E6,param_00,160);
}

//Function Number: 5
lib_A50D::func_5DAC(param_00)
{
	for(;;)
	{
		common_scripts\utility::flag_wait("player_has_cardoor");
		common_scripts\utility::flag_clear("player_pulling_cardoor");
		param_00 = common_scripts\utility::array_removeundefined(param_00);
		foreach(var_02 in param_00)
		{
			var_02 common_scripts\utility::trigger_off();
			var_02 thread lib_A50D::func_194A();
		}

		common_scripts\utility::flag_waitopen("player_has_cardoor");
		param_00 = common_scripts\utility::array_removeundefined(param_00);
		foreach(var_02 in param_00)
		{
			var_02 common_scripts\utility::trigger_on();
			var_02 thread lib_A50D::func_194B();
		}

		wait 0.05;
	}
}

//Function Number: 6
lib_A50D::func_2D52()
{
	var_00 = getent(self.target,"targetname");
	var_01 = getent(var_00.target,"targetname");
	var_01.var_615A = 1;
	var_01 thread lib_A50D::func_8E1A();
	if(isdefined(level.template_script) && level.template_script != "seoul")
	{
		thread lib_A50D::func_194B();
	}
	else if(!isdefined(level.template_script))
	{
		thread lib_A50D::func_194B();
	}

	var_02 = lib_A50D::func_3D41(var_01.model);
	if(isdefined(self.var_9C5F))
	{
		var_03 = lib_A50D::func_8934("player_rig",self.var_9C5F.var_2E6);
		var_03 hide();
		self.var_9C5F lib_A506::func_BC7(var_03,var_02);
		var_01.var_2E6 = var_03 gettagorigin("tag_weapon_left");
		var_01.var_41 = var_03 gettagangles("tag_weapon_left");
		var_03 delete();
	}
	else
	{
		iprintlnbold("self.vb_anim_org  not defined, skipping door pull anims");
	}

	var_04 = lib_A50D::func_3CE1(var_01.model);
	for(var_05 = 1;var_05 < var_04.size;var_05++)
	{
		var_01 hidepart(var_04[var_05],var_01.model);
	}

	for(var_06 = 0;!var_06;var_06 = 1)
	{
		self waittill("trigger");
		if(isdefined(level.var_31D.var_42FD) && level.var_31D.var_42FD["quick_firing"] || level.var_31D.var_42FD["grappling"])
		{
			continue;
		}
	}

	self sethintstring("");
	self delete();
	level.var_31D notify("car_door_pulled");
	level.var_31D common_scripts\utility::flag_set("player_pulling_cardoor");
	lib_A50D::func_1CBE(var_01);
	var_00 common_scripts\utility::delaycall(0.9,::delete);
}

//Function Number: 7
lib_A50D::func_194B()
{
	self.var_1948 = lib_A571::func_48BF("x");
	self waittill("trigger");
	lib_A50D::func_194A();
}

//Function Number: 8
lib_A50D::func_194A()
{
	if(isdefined(self.var_1948))
	{
		self.var_1948 lib_A571::func_48B3();
	}
}

//Function Number: 9
lib_A50D::func_8E1A()
{
	self endon("death");
	self endon("end_hud_outline");
	self endon("door_weapon_removed");
	function_009A(self);
	function_00A6(self,level.var_31D);
	while(isdefined(self))
	{
		while(!self.var_615A)
		{
			wait 0.05;
		}

		var_00 = distance(level.var_31D.var_2E6,self.var_2E6);
		if(var_00 < 200 && function_009F(self,level.var_31D,65,150))
		{
			self hudoutlineenable(6,1);
			continue;
		}

		self hudoutlinedisable();
		wait(0.05);
	}
}

//Function Number: 10
lib_A50D::func_1CBE(param_00)
{
	var_01 = level.var_31D getweaponslistall();
	foreach(var_03 in var_01)
	{
		if(issubstr(var_03,"door"))
		{
			level.var_31D takeweapon(var_03);
			break;
		}
	}

	thread lib_A50D::func_333F(param_00,isdefined(self.var_9C5F));
	if(isdefined(self.var_9C5F))
	{
		level.var_31D lib_A50D::func_6A17(self.var_9C5F,param_00);
	}
}

//Function Number: 11
lib_A50D::func_6A17(param_00,param_01)
{
	var_02 = lib_A50D::func_3D41(param_01.model);
	var_03 = lib_A50D::func_8934("player_rig",param_00.var_2E6);
	var_03 hide();
	thread lib_A50D::func_1B6B(param_01);
	self freezecontrols(1);
	var_04 = 0.4;
	param_00 thread lib_A506::func_BC7(var_03,var_02);
	lib_A50D::func_3CE4(var_03,param_01);
	self playerlinktoblend(var_03,"tag_player",var_04);
	lib_A571::func_825E(1);
	thread lib_A50D::func_281F();
	var_03 show();
	level.var_31D method_80EF();
	lib_A5DE::snd_message("doorshield_ripoff");
	param_00 lib_A506::func_C24(var_03,var_02);
	level.var_31D method_80F0();
	self unlink();
	var_03 delete();
	lib_A571::func_825D();
	self freezecontrols(0);
	self notify("player_has_cardoor");
}

//Function Number: 12
lib_A50D::func_1B6B(param_00)
{
	if(issubstr(param_00.model,"fr"))
	{
		wait(1.6);
		var_01 = common_scripts\utility::spawn_tag_origin();
		var_01 linkto(param_00,"tag_flash",(0,35,0),(0,0,0));
		playfxontag(common_scripts\utility::getfx("car_door_shield_ripoff"),var_01,"tag_origin");
		wait(2);
		var_01 delete();
		return;
	}

	wait(1.6);
	var_02 = common_scripts\utility::spawn_tag_origin();
	var_02 linkto(param_00,"tag_flash",(0,-35,0),(0,0,0));
	playfxontag(common_scripts\utility::getfx("car_door_shield_ripoff"),var_02,"tag_origin");
	wait(2);
	var_02 delete();
}

//Function Number: 13
lib_A50D::func_3CE4(param_00,param_01)
{
	param_01 linkto(param_00,"tag_weapon_left",(0,0,0),(0,0,0));
}

//Function Number: 14
lib_A50D::func_8934(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		param_00 = "player_rig";
	}

	if(!isdefined(param_01))
	{
		param_01 = level.var_31D.var_2E6;
	}

	var_02 = lib_A59A::func_88CB(param_00);
	return var_02;
}

//Function Number: 15
lib_A50D::func_333F(param_00,param_01)
{
	var_02 = lib_A50D::func_3EC5(param_00.model);
	var_03 = lib_A50D::func_3D42(param_00.model);
	lib_A50D::func_41B8(param_00,var_02,var_03,param_01);
	level notify("player_owns_cardoor_shield");
	common_scripts\utility::flag_set("player_has_cardoor");
}

//Function Number: 16
lib_A50D::func_3D42(param_00)
{
	var_01 = undefined;
	switch(param_00)
	{
		case "atlas_suv_door_03_gj":
		case "vm_atlas_suv_door_fl":
			break;

		case "atlas_suv_door_04_gj":
		case "atlas_suv_door_02_gj":
		case "vm_atlas_suv_door_fr":
			break;

		case "npc_civ_boxtruck_door_fl":
			break;

		case "npc_civ_boxtruck_door_fr":
			break;
	}
}

//Function Number: 17
lib_A50D::func_3EC5(param_00)
{
	var_01 = undefined;
	switch(param_00)
	{
		case "atlas_suv_door_03_gj":
		case "vm_atlas_suv_door_fl":
			break;

		case "atlas_suv_door_04_gj":
		case "atlas_suv_door_02_gj":
		case "vm_atlas_suv_door_fr":
			break;

		case "npc_civ_boxtruck_door_fl":
			break;

		case "npc_civ_boxtruck_door_fr":
			break;
	}
}

//Function Number: 18
lib_A50D::func_3D41(param_00)
{
	var_01 = undefined;
	if(issubstr(param_00,"boxtruck"))
	{
		var_01 = "doorshield_bt_ripoff";
		if(issubstr(param_00,"fr"))
		{
			var_01 = "doorshield_bt_ripoff_r";
		}
	}
	else
	{
		var_01 = "doorshield_ripoff";
		if(issubstr(param_00,"fr"))
		{
			var_01 = "doorshield_ripoff_r";
		}
	}

	return var_01;
}

//Function Number: 19
lib_A50D::func_3ED1(param_00)
{
	if(param_00 == "vm_atlas_suv_door_fr" || param_00 == "vm_atlas_suv_door_fl" || param_00 == "vm_civ_boxtruck_door_fr" || param_00 == "vm_civ_boxtruck_door_fl")
	{
		return -90;
	}

	return 0;
}

//Function Number: 20
lib_A50D::func_41B8(param_00,param_01,param_02,param_03)
{
	param_00 notify("end_hud_outline");
	param_00 hudoutlinedisable();
	level.var_31D.var_1B85 = level.var_31D getcurrentweapon();
	level.var_31D.var_1B86 = param_01;
	level.var_31D giveweapon(param_01);
	level.var_31D switchtoweapon(param_01);
	if(isdefined(param_03) && param_03)
	{
		level.var_31D waittill("player_has_cardoor");
	}

	if(param_00.model != param_02)
	{
		param_00 setmodel(param_02);
	}

	param_00 method_80A6(level.var_31D,"TAG_WEAPON_LEFT",(0,0,0),(0,lib_A50D::func_3ED1(param_02),0),1);
	level.var_31D thread lib_A50D::func_2842(param_00,param_01);
	thread lib_A50D::func_A2C1(param_00);
	thread lib_A50D::func_5D85(param_00,level.var_31D);
	thread lib_A50D::func_5E0B(param_00);
	thread lib_A50D::func_5DAA(param_00);
	thread lib_A50D::func_5E1C(param_00);
	thread lib_A50D::func_5D81(param_00);
	thread lib_A50D::func_5E1B(param_00,param_01);
}

//Function Number: 21
lib_A50D::func_A2C1(param_00)
{
	level.var_31D lib_A59A::func_6C62(0,"door_shield");
	param_00 waittill("door_weapon_removed");
	level.var_31D lib_A59A::func_6C62(1,"door_shield");
}

//Function Number: 22
lib_A50D::func_45C1(param_00)
{
	var_01 = function_00D6("axis");
	foreach(var_03 in var_01)
	{
		var_03 thread lib_A50D::func_5327(param_00);
	}
}

//Function Number: 23
lib_A50D::func_5E0B(param_00)
{
	param_00 endon("door_weapon_removed");
	level.var_31D endon("kill_throw_monitor");
	var_01 = ["weapon_suv_door_shield_fr","weapon_suv_door_shield_fl","weapon_boxtruck_door_shield_fr","weapon_boxtruck_door_shield_fl"];
	for(;;)
	{
		while(!level.var_31D attackbuttonpressed() && !level.var_31D meleebuttonpressed())
		{
			wait 0.05;
		}

		var_02 = level.var_31D getcurrentweapon();
		foreach(var_04 in var_01)
		{
			if(var_02 == var_04)
			{
				thread lib_A50D::func_69C7(var_04,param_00,1);
				lib_A5DE::snd_message("doorshield_throw");
				level.var_31D notify("kill_throw_monitor");
				break;
			}
		}

		wait 0.05;
	}
}

//Function Number: 24
lib_A50D::func_69C7(param_00,param_01,param_02,param_03)
{
	wait(0.1);
	level.var_31D lib_A50D::func_3486(param_01,param_02);
	level.var_31D takeweapon(param_00);
	if(!isdefined(param_03) || param_03 == 1)
	{
		level.var_31D switchtoweapon(level.var_31D.var_1B85);
	}

	common_scripts\utility::flag_clear("player_has_cardoor");
}

//Function Number: 25
lib_A50D::func_3486(param_00,param_01)
{
	var_02 = undefined;
	if(!1)
	{
		var_03 = level.var_31D.var_2E6;
		var_02 = spawn("script_model",var_03 + (0,0,48));
		var_02 setmodel("npc_atlas_suv_door_FL");
		var_02.var_2E6 = param_00.var_2E6;
		var_02.var_41 = param_00.var_41;
		param_00 delete();
	}
	else
	{
		var_02 = param_00;
		param_00 method_80A7(level.var_31D);
		param_00 show();
	}

	var_02.var_659D = var_02.var_2E6;
	var_02.var_41 = (0,self.var_41[1],self.var_41[2]);
	thread lib_A50D::func_45C1(var_02);
	var_04 = common_scripts\utility::spawn_tag_origin();
	function_009A(var_04);
	function_00A6(var_04,level.var_31D);
	var_05 = undefined;
	if(param_01)
	{
		var_06 = function_00D6("axis");
		var_06 = sortbydistance(var_06,level.var_31D.var_2E6);
		var_07 = undefined;
		foreach(var_09 in var_06)
		{
			var_04.var_2E6 = var_09 geteye();
			if(function_009F(var_04,level.var_31D,65,100))
			{
				var_07 = var_09;
			}
		}

		if(isdefined(var_07))
		{
			var_05 = var_07;
		}
		else
		{
			var_05 = undefined;
		}
	}

	var_04 delete();
	var_02 lib_A5DE::snd_message("doorshield_throw");
	var_02 lib_A50D::func_37A8(var_05,param_01);
}

//Function Number: 26
lib_A50D::func_37A8(param_00,param_01)
{
	var_02 = undefined;
	var_03 = 0;
	var_04 = 0;
	var_05 = 100;
	if(isdefined(param_00) && issentient(param_00) && param_01)
	{
		var_02 = vectornormalize(param_00.var_2E6 - self.var_2E6) * var_05;
		var_06 = distance(self.var_2E6,param_00.var_2E6);
		var_03 = min(200,var_06);
		var_04 = min(250,var_06) + var_06 / 5;
	}
	else if(param_01)
	{
		var_07 = anglestoforward(level.var_31D method_8036());
		var_08 = self.var_2E6 + var_07 * var_05;
		var_02 = var_08 - self.var_2E6;
		var_03 = 200;
		var_04 = 250;
	}
	else
	{
		var_07 = anglestoforward(level.var_31D method_8036());
		var_08 = self.var_2E6 + var_08 * var_07;
		var_02 = var_08 - self.var_2E6;
		var_03 = 40;
		var_04 = 41;
	}

	self physicslaunchserver(self.var_2E6,var_02 * randomfloatrange(var_03,var_04),20000,1080);
	level.var_31D notify("car_door_thrown");
	self notify("door_weapon_removed");
}

//Function Number: 27
lib_A50D::func_5327(param_00)
{
	param_00 endon("physics_finished");
	self endon("death");
	while(distance(self.var_2E6,param_00.var_2E6) > 100)
	{
		wait 0.05;
	}

	thread lib_A59A::func_38A9(2);
	if(issubstr(self.classname,"mech"))
	{
		return;
	}

	while(distance(self.var_2E6,param_00.var_2E6) > 50)
	{
		wait 0.05;
	}

	var_01 = vectornormalize(self gettagorigin("tag_eye") - param_00.var_659D);
	var_01 = vectornormalize(var_01 + (0,0,0.2));
	self method_8024("torso_lower",var_01 * 3400);
	lib_A59A::func_41DA("CARMA");
	self method_8052();
}

//Function Number: 28
lib_A50D::func_6A58(param_00)
{
	var_01 = undefined;
	if(isdefined(level.var_78B2))
	{
		if(isdefined(level.var_78B2["player_rig"]))
		{
			var_01 = "player_rig";
		}
	}

	if(!isdefined(var_01))
	{
		return 0;
	}

	level.var_78A9[var_01]["doorshield_ripoff"] = %vm_doorshield_pullout_viewbody;
	level.var_78A9[var_01]["doorshield_ripoff_r"] = %vm_doorshield_passenger_pullout_viewbody;
	level.var_78A9[var_01]["doorshield_bt_ripoff"] = %vm_doorshield_truck_driver_pullout_viewbody;
	level.var_78A9[var_01]["doorshield_bt_ripoff_r"] = %vm_doorshield_truck_passenger_pullout_viewbody;
	return 1;
}

//Function Number: 29
lib_A50D::func_5DAA(param_00)
{
	param_00 endon("death");
	param_00 endon("door_weapon_removed");
	level.var_31D endon("car_door_thrown");
	var_01 = "none";
	for(;;)
	{
		if(level.var_31D method_812C())
		{
			var_01 = lib_A50D::func_3E25();
			wait(0.1);
			param_00 hide();
			for(;;)
			{
				lib_A50D::func_9FB9(param_00);
				if(var_01 == "frag_button" && level.var_31D secondaryoffhandbuttonpressed())
				{
					var_01 = "secondary_offhand_button";
					continue;
				}

				if(var_01 == "secondary_offhand_button" && level.var_31D fragbuttonpressed())
				{
					var_01 = "frag_button";
					continue;
				}

				break;
			}

			param_00 show();
			while(level.var_31D method_812C())
			{
				wait 0.05;
			}
		}
		else if(!lib_A50D::func_500D(level.var_31D getcurrentweapon()))
		{
			param_00 hide();
			while(!lib_A50D::func_500D(level.var_31D getcurrentweapon()))
			{
				wait 0.05;
			}

			param_00 show();
		}

		wait 0.05;
	}
}

//Function Number: 30
lib_A50D::func_5E1C(param_00)
{
	param_00 endon("door_weapon_removed");
	level.var_31D endon("car_door_thrown");
	for(;;)
	{
		level.var_31D waittill("weapon_switch_started",var_01);
		if(issubstr(level.var_31D getcurrentweapon(),"door"))
		{
			var_02 = 1;
			if(weaponinventorytype(var_01) != "offhand" && var_01 != "none")
			{
				var_02 = 0;
			}

			thread lib_A50D::func_69C7(level.var_31D getcurrentweapon(),param_00,0,var_02);
			return;
		}
	}
}

//Function Number: 31
lib_A50D::func_5D81(param_00)
{
	param_00 endon("door_weapon_removed");
	level.var_31D endon("car_door_thrown");
	for(;;)
	{
		level.var_31D waittill("car_door_broken");
		if(issubstr(level.var_31D getcurrentweapon(),"door"))
		{
			thread lib_A50D::func_69C7(level.var_31D getcurrentweapon(),param_00,0);
			return;
		}
	}
}

//Function Number: 32
lib_A50D::func_5E1B(param_00,param_01)
{
	param_00 endon("death");
	level.var_31D endon("car_door_thrown");
	for(;;)
	{
		if(!level.var_31D hasweapon(param_01))
		{
			param_00 notify("door_weapon_removed");
			wait 0.05;
			var_02 = getweaponarray();
			foreach(var_04 in var_02)
			{
				if(var_04.classname == "weapon_" + param_01)
				{
					thread lib_A50D::func_69C7(param_01,param_00,0);
					var_04 delete();
				}
			}

			if(level.var_31D getcurrentweapon() == "none")
			{
				level.var_31D switchtoweapon(level.var_31D.var_1B85);
			}
		}

		wait 0.05;
	}
}

//Function Number: 33
lib_A50D::func_3E25()
{
	var_00 = level.var_31D getcurrentoffhand();
	if(isdefined(level.var_31D.var_9C57))
	{
		foreach(var_02 in level.var_31D.var_9C57["normal"])
		{
			if(var_02 == var_00)
			{
				return "frag_button";
			}
		}

		foreach(var_02 in level.var_31D.var_9C57["special"])
		{
			if(var_02 == var_00)
			{
				return "secondary_offhand_button";
			}
		}
	}
	else if(var_00 == "frag_grenade_var" || var_00 == "frag_grenade")
	{
		return "frag_button";
	}
	else if(var_00 == "flash_grenade_var" || var_00 == "flash_grenade")
	{
		return "secondary_offhand_button";
	}

	if(level.var_31D fragbuttonpressed())
	{
		return "frag_button";
	}
	else if(level.var_31D secondaryoffhandbuttonpressed())
	{
		return "secondary_offhand_button";
	}

	return "none";
}

//Function Number: 34
lib_A50D::func_500D(param_00)
{
	return param_00 == "weapon_suv_door_shield_fr" || param_00 == "weapon_suv_door_shield_fl" || param_00 == "weapon_boxtruck_door_shield_fr" || param_00 == "weapon_boxtruck_door_shield_fl";
}

//Function Number: 35
lib_A50D::func_9FB9(param_00)
{
	param_00 endon("death");
	level.var_31D endon("car_door_thrown");
	param_00 endon("door_weapon_removed");
	level.var_31D endon("offhand_end");
	while(level.var_31D method_812C())
	{
		wait 0.05;
	}
}

//Function Number: 36
lib_A50D::func_3CE1(param_00)
{
	var_01 = [];
	var_02 = [];
	var_02[0] = "TAG_GLASS_LEFT_FRONT";
	var_02[1] = "TAG_GLASS_LEFT_FRONT_D1";
	var_02[2] = "TAG_GLASS_LEFT_FRONT_D2";
	var_02[3] = "TAG_GLASS_LEFT_FRONT_D3";
	var_02[4] = "TAG_GLASS_LEFT_FRONT_D4";
	foreach(var_04 in var_02)
	{
		if(lib_A59A::hastag(param_00,var_04))
		{
			var_01[var_01.size] = var_04;
		}
	}

	return var_01;
}

//Function Number: 37
lib_A50D::func_5D85(param_00,param_01)
{
	param_00 notify("kill_duplicate_threads");
	param_00 endon("kill_duplicate_threads");
	param_00 endon("death");
	param_00 endon("door_weapon_removed");
	param_01 endon("car_door_thrown");
	param_00.var_8D59 = 0;
	var_02 = undefined;
	var_03 = undefined;
	var_04 = lib_A50D::func_3CE1(param_00.model);
	for(var_05 = 1;var_05 < var_04.size;var_05++)
	{
		param_00 hidepart(var_04[var_05],param_00.model);
	}

	var_06 = [];
	var_06[0] = 125;
	var_06[1] = 125;
	var_06[2] = 125;
	var_06[3] = 125;
	param_00.var_2D53 = var_06[0];
	childthread lib_A50D::func_5DDB(param_01,param_00,var_04,var_06);
	childthread lib_A50D::func_5D6C(param_01,param_00,var_04,var_06);
}

//Function Number: 38
lib_A50D::func_5DDB(param_00,param_01,param_02,param_03)
{
	for(;;)
	{
		param_00 waittill("riotshield_hit",var_04,var_05);
		lib_A50D::func_4530(param_00,param_01,param_02,param_03,var_04,var_05.var_2E6,var_05.var_41);
		wait 0.05;
	}
}

//Function Number: 39
lib_A50D::func_5D6C(param_00,param_01,param_02,param_03)
{
	for(;;)
	{
		param_00 waittill("car_door_shield_damaged",var_04,var_05,var_06);
		lib_A50D::func_4530(param_00,param_01,param_02,param_03,var_04,var_05,var_06);
		wait 0.05;
	}
}

//Function Number: 40
lib_A50D::func_4530(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(lib_A50D::func_500D(param_00 getcurrentweapon()))
	{
		var_07 = param_01 lib_A50D::func_3CFB(param_05);
		var_08 = var_07[0];
		var_09 = var_07[1];
		var_0A = var_07[2];
		var_0B = 0;
		if(param_01.var_8D59 < param_02.size - 1)
		{
			param_01.var_2D53 = param_01.var_2D53 - param_04;
			if(param_01.var_2D53 <= 0)
			{
				var_0B = 1;
				param_01.var_8D59++;
				if(param_01.var_8D59 != param_02.size - 1)
				{
					var_0C = 0.4 + randomfloat(100) * 0.01 * 0.25;
					var_0D = 0.2 + randomfloat(100) * 0.01 * 0.5;
					earthquake(var_0C,var_0D,param_00.var_2E6,100);
					playfx(common_scripts\utility::getfx("seo_suv_doorshield_hit"),var_08,var_09,var_0A);
					level.var_31D notify("doorshield_hit");
				}
				else
				{
					playfx(common_scripts\utility::getfx("seo_suv_doorshield_hit_break"),var_08,var_09,var_0A);
					earthquake(1.2,0.75,level.var_31D.var_2E6,100);
					level.var_31D notify("car_door_broken");
					lib_A5DE::snd_message("car_door_broken");
				}

				foreach(var_0F in param_02)
				{
					param_01 hidepart(var_0F,param_01.model);
				}

				param_01 showpart(param_02[param_01.var_8D59],param_01.model);
				param_01.var_2D53 = param_03[param_01.var_8D59];
				wait 0.05;
			}
		}

		if(!var_0B)
		{
			var_0C = 0.3 + randomfloat(100) * 0.01 * 0.25;
			var_0D = 0.2 + randomfloat(100) * 0.01 * 0.5;
			earthquake(var_0C,var_0D,param_00.var_2E6,100);
			playfx(common_scripts\utility::getfx("large_glass_1"),var_08,var_09,var_0A);
		}
	}
}

//Function Number: 41
lib_A50D::func_3CFB(param_00)
{
	var_01 = param_00;
	var_02 = level.var_31D getplayerangles();
	var_03 = anglestoforward(var_02);
	var_04 = level.var_31D geteye();
	var_04 = var_04 + var_03 * 15;
	var_05 = vectordot(var_03,var_01 - var_04);
	var_06 = var_01 - var_05 * var_03;
	return [var_06,var_03,anglestoup(var_02)];
}

//Function Number: 42
lib_A50D::func_3E03(param_00,param_01)
{
	var_02 = level.var_31D getplayerangles();
	var_03 = anglestoforward(var_02);
	var_04 = level.var_31D geteye();
	var_04 = var_04 + var_03 * 15;
	var_05 = var_04 - param_00;
	var_06 = anglestoforward(param_01);
	var_07 = vectordot(var_06,var_03);
	if(var_07 == 0)
	{
		return [param_00,var_03,anglestoup(var_02)];
	}

	var_08 = vectordot(var_05,var_03) / var_07;
	return [param_00 + var_06 * var_08,var_03,anglestoup(var_02)];
}

//Function Number: 43
lib_A50D::func_2842(param_00,param_01)
{
	self endon("death");
	param_00 endon("death");
	param_00 endon("door_weapon_removed");
	self waittill("remove_car_doors");
	if(self hasweapon(param_01))
	{
		self takeweapon(param_01);
	}

	self switchtoweapon(self.var_1B85);
	param_00 delete();
}

//Function Number: 44
lib_A50D::func_4531()
{
	level.var_31D endon("death");
	level.var_31D endon("kill_throw_monitor");
	level.var_31D endon("donot_show_throw_hint");
	level waittill("player_owns_cardoor_shield");
	lib_A59A::func_48F9("hint_door_throw",5);
}

//Function Number: 45
lib_A50D::func_8451()
{
	if(common_scripts\utility::flag("player_has_cardoor"))
	{
		return 0;
	}

	return 1;
}

//Function Number: 46
lib_A50D::func_281F()
{
	var_00 = getentarray("car_door_vehicle_clip","targetname");
	var_01 = common_scripts\utility::array_sort_by_handler(var_00,::lib_A50D::func_2B74);
	if(isdefined(var_01[0]))
	{
		var_01[0] delete();
	}
}

//Function Number: 47
lib_A50D::func_2B74()
{
	return distance(level.var_31D.var_2E6,self.var_2E6);
}