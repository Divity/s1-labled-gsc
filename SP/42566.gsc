/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42566.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 71
 * Decompile Time: 50 ms
 * Timestamp: 4/20/2022 8:23:51 PM
*******************************************************************/

//Function Number: 1
lib_A646::main(param_00,param_01,param_02)
{
	precachemodel("vehicle_vm_x4walkerSplit_wheels");
	precachemodel("vehicle_vm_x4walkerSplit_turret");
	precachemodel("projectile_rpg7");
	precacheshader("bls_ui_turret_targetlock");
	precacheshader("bls_ui_turret_targetlock_white");
	precacheshader("bls_ui_turret_targetacquired");
	precacheitem("mobile_turret_missile");
	precacherumble("heavy_1s");
	precacheshader("bls_ui_turret_overlay_sm");
	precacheshader("bls_ui_turret_overlay_vignette");
	precacheshader("bls_ui_turret_missle");
	precacheshader("bls_ui_turret_chevron");
	precacheshader("bls_ui_turret_chevron_right");
	precacheshader("bls_ui_turret_reticle_tl");
	precacheshader("bls_ui_turret_reticle_tr");
	precacheshader("bls_ui_turret_reticle_bl");
	precacheshader("bls_ui_turret_reticle_br");
	precacheshader("bls_ui_turret_reticule_hpip");
	precacheshader("bls_ui_turret_reticule_vpip");
	precacheshader("bls_ui_turret_warning");
	precachestring(&"_X4WALKER_WHEELS_ENTER");
	lib_A59A::set_console_status();
	lib_A59E::func_186C("x4walker_wheels_turret",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A646::func_57EC);
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1868("mobile_turret_shoot");
	lib_A59E::func_1839(::lib_A646::func_7DAD);
	lib_A646::func_1875(param_02);
	if(issubstr(param_02,"explosive"))
	{
		lib_A59E::func_1872("x4walker_turret_explosive","tag_turret","vehicle_npc_x4walkerSplit_turret",undefined,"manual",0.2,0);
	}
	else
	{
		lib_A59E::func_1872("x4walker_turret","tag_turret","vehicle_npc_x4walkerSplit_turret",undefined,"manual",0.2,0);
	}

	lib_A646::func_72E9(param_02);
	lib_A646::func_72E1();
	lib_A646::func_72DB();
	level.var_A361 = 0;
	level.var_A360 = 0;
	level.var_A35E = 1;
}

//Function Number: 2
lib_A646::func_1875(param_00)
{
	level._effect["walkerexplode"] = loadfx("vfx/explosion/vehicle_x4walker_explosion");
	lib_A59E::func_1845("vehicle_x4walker_wheels","vehicle_x4walker_wheels_destroyed");
	lib_A59E::func_1842("vfx/explosion/vehicle_x4walker_explosion","TAG_ORIGIN");
	lib_A59E::func_1846(1,1.6,500);
	lib_A59E::func_1862((0,0,32),300,200,0,0);
}

//Function Number: 3
lib_A646::func_72E9(param_00)
{
	lib_A5A3::func_7B8(param_00,"idle",%x4walker_wheels_turret_idle);
	lib_A5A3::func_7B8(param_00,"cockpit_idle",%x4walker_wheels_turret_cockpit_idle);
}

//Function Number: 4
lib_A646::func_72DB()
{
	level._effect["x4walker_wheels_rpg_fv"] = loadfx("vfx/muzzleflash/x4walker_wheels_rpg_fv");
}

//Function Number: 5
lib_A646::func_57EC()
{
	self method_8115(#animtree);
	thread lib_A646::func_5958();
	thread lib_A646::func_5E15();
	thread lib_A646::func_0C68();
	thread lib_A646::func_5E1D();
	thread lib_A646::func_1E58();
	lib_A59A::func_32DC("player_in_transition");
	common_scripts\utility::flag_init("player_in_x4walker");
	waittillframeend;
	self.mgturret[0] maketurretsolid();
	self.mgturret[0] method_8115(#animtree);
	self notify("stop_vehicle_shoot_shock");
	lib_A647::func_86F6();
}

//Function Number: 6
lib_A646::func_7DAD()
{
	var_00 = [];
	var_00[0] = spawnstruct();
	var_00[0].var_85A8 = "tag_guy";
	return var_00;
}

//Function Number: 7
lib_A646::func_72E1()
{
	level.var_78A9["_vehicle_player_rig"]["enter_left_turret"] = %x4walker_turret_cockpit_in_l_vm;
	level.var_78A9["_vehicle_player_rig"]["enter_right_turret"] = %x4walker_turret_cockpit_in_r_vm;
	level.var_78A9["_vehicle_player_rig"]["enter_back_turret"] = %x4walker_turret_cockpit_in_b_vm;
	level.var_78A9["_vehicle_player_rig"]["exit_left_turret"] = %x4walker_turret_cockpit_out_l_vm;
	level.var_78A9["_vehicle_player_rig"]["exit_right_turret"] = %x4walker_turret_cockpit_out_r_vm;
	level.var_78A9["_vehicle_player_rig"]["exit_back_turret"] = %x4walker_turret_cockpit_out_b_vm;
	lib_A506::func_807("_vehicle_player_rig","cockpit_swap",::lib_A646::func_9000,"enter_left_turret");
	lib_A506::func_807("_vehicle_player_rig","cockpit_swap",::lib_A646::func_9000,"enter_right_turret");
	lib_A506::func_807("_vehicle_player_rig","cockpit_swap",::lib_A646::func_9000,"enter_back_turret");
	lib_A506::func_807("_vehicle_player_rig","cockpit_swap",::lib_A646::func_9008,"exit_left_turret");
	lib_A506::func_807("_vehicle_player_rig","cockpit_swap",::lib_A646::func_9008,"exit_right_turret");
	lib_A506::func_807("_vehicle_player_rig","cockpit_swap",::lib_A646::func_9008,"exit_back_turret");
}

//Function Number: 8
lib_A646::func_5958()
{
	self endon("death");
	self endon("disable_mobile_turret");
	thread lib_A646::func_4632();
	self.var_32FF = [];
	for(var_00 = 0;var_00 < 3;var_00++)
	{
		var_01 = spawn("script_model",(0,0,0));
		var_01 setmodel("tag_origin");
		var_01 hide();
		self.var_32FF[var_00] = var_01;
	}

	var_02 = self gettagorigin("tag_body");
	var_03 = self gettagorigin("tag_wheel_front_left");
	var_04 = self gettagorigin("tag_wheel_front_right");
	var_05 = self gettagorigin("tag_wheel_back_left");
	var_06 = self gettagorigin("tag_wheel_back_right");
	self.var_32FF[0].var_2E6 = (var_03[0] + var_05[0] * 0.5,var_03[1] + var_05[1] * 0.5,var_02[2]);
	self.var_32FF[1].var_2E6 = (var_04[0] + var_06[0] * 0.5,var_04[1] + var_06[1] * 0.5,var_02[2]);
	self.var_32FF[2].var_2E6 = (var_05[0] + var_06[0] * 0.5,var_05[1] + var_06[1] * 0.5,var_02[2]);
	if(!isdefined(level.var_5FDA))
	{
		level.var_5FDA = [];
	}

	foreach(var_01 in self.var_32FF)
	{
		var_01 linkto(self);
		var_01 sethintstring(&"_X4WALKER_WHEELS_ENTER");
		var_01 makeusable();
		level.var_5FDA[level.var_5FDA.size] = var_01;
	}

	waittillframeend;
	self.var_90BF = common_scripts\utility::spawn_tag_origin();
	self.var_90BF linkto(self.mgturret[0],"tag_barrel",(-38.9526,6.01624,-46.3999),(0,0,0));
	self.var_48B8 = [];
	self.var_48B8[self.var_48B8.size] = common_scripts\utility::spawn_tag_origin();
	self.var_48B8[self.var_48B8.size - 1].var_2E6 = self.mgturret[0].var_2E6 + anglestoright(self.mgturret[0].var_41) * 60 + (0,0,10);
	self.var_48B8[self.var_48B8.size] = common_scripts\utility::spawn_tag_origin();
	self.var_48B8[self.var_48B8.size - 1].var_2E6 = self.mgturret[0].var_2E6 - anglestoright(self.mgturret[0].var_41) * 60 + (0,0,10);
	self.var_48B8[self.var_48B8.size] = common_scripts\utility::spawn_tag_origin();
	self.var_48B8[self.var_48B8.size - 1].var_2E6 = self.mgturret[0].var_2E6 - anglestoforward(self.mgturret[0].var_41) * 75 + (0,0,10);
	self.var_48C0 = [];
	foreach(var_0A in self.var_48B8)
	{
		var_0A dontinterpolate();
		var_0A linkto(self.mgturret[0]);
		self.var_48C0[self.var_48C0.size] = var_0A lib_A571::func_48B5("x","tag_origin",50,150);
	}

	for(;;)
	{
		self makeunusable();
		lib_A646::func_9F81(self.var_32FF);
		if(isdefined(level.var_31D.var_578E))
		{
			continue;
		}

		lib_A59A::func_32DD("player_in_transition");
		lib_A5DE::snd_message("player_enter_walker_anim");
		var_0C = lib_A646::func_6AE8();
		lib_A59A::func_32D9("player_in_transition");
		thread lib_A646::func_5E12();
		level.var_31D notify("player_in_x4walker");
		common_scripts\utility::flag_set("player_in_x4walker");
		lib_A646::func_2AD0();
		function_00D3("ammoCounterHide",1);
		var_0D = undefined;
		if(common_scripts\utility::flag_exist("seoul_player_can_exit_x4walker"))
		{
			common_scripts\utility::flag_wait("seoul_player_can_exit_x4walker");
		}
		else
		{
			var_0D = level.var_31D thread lib_A646::func_2B46();
		}

		var_0E = undefined;
		while(!isdefined(var_0E))
		{
			lib_A646::func_9F8C();
			if(!isalive(level.var_31D) || !isdefined(level.var_31D.var_2E18))
			{
				break;
			}

			var_0E = lib_A646::func_3753(var_0C);
			if(isdefined(level.template_script) && level.template_script == "seoul")
			{
				var_0E = "exit_back_turret";
			}

			if(!isdefined(var_0E))
			{
			}
		}

		if(isdefined(var_0D))
		{
			var_0D destroy();
		}

		lib_A59A::func_32DD("player_in_transition");
		level.var_31D method_80FF();
		self.mgturret[0] maketurretsolid();
		thread lib_A59A::func_5686(2,65);
		if(isdefined(level.var_31D.var_2E18) && isalive(level.var_31D))
		{
			lib_A5DE::snd_message("player_exit_walker_anim");
			lib_A646::func_6AF1(var_0E);
		}

		lib_A59A::func_32D9("player_in_transition");
		common_scripts\utility::flag_clear("player_in_x4walker");
		lib_A646::func_30EF();
		if(common_scripts\utility::flag_exist("seoul_player_can_exit_x4walker") && common_scripts\utility::flag("seoul_player_can_exit_x4walker"))
		{
			return;
		}
	}
}

//Function Number: 9
lib_A646::func_2AD0()
{
	thread lib_A575::func_2B26();
}

//Function Number: 10
lib_A646::func_30EF()
{
	thread lib_A575::func_3118();
}

//Function Number: 11
lib_A646::func_75F0(param_00)
{
	var_01 = level.var_31D common_scripts\utility::spawn_tag_origin();
	level.var_31D playerlinktoabsolute(var_01,"tag_origin");
	var_01 rotateto(param_00.var_41,1);
	wait(1);
	level.var_31D unlink();
	var_01 delete();
}

//Function Number: 12
lib_A646::func_2B46()
{
	var_00 = lib_A53C::func_23ED("default",1.5);
	var_00.alpha = 0.7;
	var_00.alignx = "center";
	var_00.aligny = "middle";
	var_00.y = 100;
	var_00.horzalign = "center";
	var_00.vertalign = "middle";
	var_00.foreground = 0;
	var_00.var_1EC = 1;
	var_00.hidewheninmenu = 1;
	var_00 settext(&"_X4WALKER_WHEELS_EXIT");
	return var_00;
}

//Function Number: 13
lib_A646::func_3F3A(param_00)
{
	var_01 = getnorthyaw();
	param_00 = param_00 - var_01;
	if(param_00 < 0)
	{
		param_00 = param_00 + 360;
	}
	else if(param_00 > 360)
	{
		param_00 = param_00 - 360;
	}

	if(param_00 < 45 || param_00 > 315)
	{
		var_02 = "N";
	}
	else if(var_01 < 135)
	{
		var_02 = "E";
	}
	else if(var_01 < 225)
	{
		var_02 = "S";
	}
	else if(var_01 < 315)
	{
		var_02 = "W";
	}
	else
	{
		var_02 = "";
	}

	return var_02;
}

//Function Number: 14
lib_A646::func_A1A9()
{
	self endon("death");
	self waittill("play_damage_warning");
	self notify("destroy_compass_text");
	self.var_20CE settext(&"FUSION_X4_WARNING");
	self.var_4AD8.alpha = 1;
	self.var_20CE thread lib_A646::func_704B();
}

//Function Number: 15
lib_A646::func_9ABB()
{
	self endon("death");
	self endon("player_exited_mobile_turret");
	self endon("destroy_hud_text");
	for(;;)
	{
		self.var_4AD5[0] settext(lib_A59A::func_760F(self veh_getsteering(),1,0));
		self.var_4AD5[1] settext(lib_A59A::func_760F(self veh_getspeed(),1,0));
		wait 0.05;
	}
}

//Function Number: 16
lib_A646::func_704B()
{
	self endon("death");
	self endon("player_exited_mobile_turret");
	self endon("destroy_hud_text");
	var_00 = -0.1;
	for(;;)
	{
		self.alpha = self.alpha + var_00;
		if(self.alpha <= 0 || self.alpha >= 1)
		{
			var_00 = var_00 * -1;
		}

		wait 0.05;
	}
}

//Function Number: 17
lib_A646::func_20CF()
{
	self endon("destroy_hud_text");
	self endon("destroy_compass_text");
	for(;;)
	{
		var_00 = level.var_31D getplayerangles();
		var_01 = lib_A646::func_3F3A(var_00[1]);
		self.var_20CE settext(var_01);
		wait 0.05;
	}
}

//Function Number: 18
lib_A646::func_9963(param_00)
{
	self.alignx = "center";
	self.aligny = "middle";
	self.var_1EC = 1;
	self.hidewheninmenu = 1;
	if(!level.var_A361)
	{
		self.var_32F = 1;
		self.var_364 = 1;
		self method_80CD(param_00,"tag_aim_animated");
	}
}

//Function Number: 19
lib_A646::func_9962(param_00)
{
	self fadeovertime(0.5);
	self.alpha = 1;
	lib_A646::func_9963(param_00);
}

//Function Number: 20
lib_A646::func_9961()
{
	self fadeovertime(0.1);
	self.alpha = 0;
}

//Function Number: 21
lib_A646::func_4AF5(param_00)
{
	var_01 = self;
	var_02 = 1;
	if(issubstr(var_01.classname,"script_vehicle_cover_drone"))
	{
		return;
	}

	if((isdefined(var_01.inliveplayerkillstreak) && var_01.inliveplayerkillstreak == "allies") || isdefined(var_01.var_7AE9) && var_01.var_7AE9 != "axis")
	{
		var_02 = 3;
	}

	if(param_00)
	{
		var_01 hudoutlineenable(var_02,1);
		return;
	}

	var_01 hudoutlinedisable();
}

//Function Number: 22
lib_A646::func_4AF4(param_00)
{
	var_01 = [];
	var_01 = common_scripts\utility::array_combine(var_01,function_00D6("axis","allies"));
	var_01 = common_scripts\utility::array_combine(var_01,veh_getarray());
	foreach(var_03 in var_01)
	{
		var_03 lib_A646::func_4AF5(param_00);
	}
}

//Function Number: 23
lib_A646::func_4AF2()
{
	level endon("x4walker_hudoutline_think_stop");
	for(;;)
	{
		self waittill("spawned",var_00);
		var_00 lib_A646::func_4AF5(1);
	}
}

//Function Number: 24
lib_A646::func_4AF1()
{
	var_00 = [];
	var_00 = common_scripts\utility::array_combine(var_00,function_00D8());
	var_00 = common_scripts\utility::array_combine(var_00,veh_getspawnerarray());
	foreach(var_02 in var_00)
	{
		var_02 thread lib_A646::func_4AF2();
	}
}

//Function Number: 25
lib_A646::func_4AF0()
{
	if(!isdefined(level.var_4AF7))
	{
		level.var_4AF7 = [];
	}

	level.var_4AF7["r_hudoutlineenable"] = getdvar("r_hudoutlineenable",0);
	level.var_4AF7["r_hudoutlinepostmode"] = getdvar("r_hudoutlinepostmode",0);
	level.var_4AF7["r_hudoutlinehalolumscale"] = getdvar("r_hudoutlinehalolumscale",0);
	level.var_4AF7["r_hudoutlinehaloblurradius"] = getdvar("r_hudoutlinehaloblurradius",0);
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinepostmode",2);
	function_00D3("r_hudoutlinehalolumscale",2);
	function_00D3("r_hudoutlinehaloblurradius",0.7);
}

//Function Number: 26
lib_A646::func_4AEF()
{
	if(!isdefined(level.var_4AF7))
	{
		return;
	}

	foreach(var_01 in getarraykeys(level.var_4AF7))
	{
		function_00D3(var_01,level.var_4AF7[var_01]);
	}
}

//Function Number: 27
lib_A646::func_4AF3()
{
	common_scripts\utility::flag_wait("player_in_x4walker");
	lib_A646::func_4AF0();
	lib_A646::func_4AF4(1);
	lib_A646::func_4AF1();
	common_scripts\utility::flag_waitopen("player_in_x4walker");
	level notify("x4walker_hudoutline_think_stop");
	lib_A646::func_4AEF();
	lib_A646::func_4AF4(0);
}

//Function Number: 28
lib_A646::func_6C12()
{
	var_00 = 100000;
	var_01 = 60;
	var_02 = -30000;
	var_03 = 25000;
	var_04 = 5000;
	var_05 = -23000;
	var_06 = 40000;
	var_07 = -40000;
	var_08 = -14500;
	var_09 = 28000;
	var_0A = 21500;
	var_0B = -22500;
	level.var_31D endon("death");
	var_0C = getdvar("hud_fade_ammodisplay");
	function_00D3("hud_fade_ammodisplay",0.05);
	self.missiles = [];
	for(var_0D = 0;var_0D < 4;var_0D++)
	{
		if(var_0D > 1)
		{
			var_02 = var_03;
		}

		self.missiles[var_0D] = newhudelem();
		self.missiles[var_0D] setshader("bls_ui_turret_missle",48,48);
		self.missiles[var_0D] lib_A646::func_9962(self.mgturret[0]);
		self.missiles[var_0D].x = var_00;
		self.missiles[var_0D].y = var_02 + var_0D % 2 * var_04;
		self.missiles[var_0D].z = var_01 + var_05;
	}

	var_0E = newhudelem();
	var_0E setshader("bls_ui_turret_overlay_sm",1024,512);
	var_0E lib_A646::func_9962(self.mgturret[0]);
	var_0E.fontscale = 2;
	var_0E.x = var_00;
	var_0E.z = var_01;
	var_0F = undefined;
	if(level.var_A361)
	{
		var_0F = newhudelem();
		var_0F setshader("bls_ui_turret_overlay_vignette",640,480);
		var_0F.horzalign = "fullscreen";
		var_0F.vertalign = "fullscreen";
	}

	self.var_1D3A = newhudelem();
	self.var_1D3A setshader("bls_ui_turret_chevron",32,32);
	self.var_1D3A lib_A646::func_9962(self.mgturret[0]);
	self.var_1D3A.x = var_00;
	self.var_1D3A.y = var_06;
	self.var_1D3A.z = var_01;
	self.var_1D3B = newhudelem();
	self.var_1D3B setshader("bls_ui_turret_chevron_right",32,32);
	self.var_1D3B lib_A646::func_9962(self.mgturret[0]);
	self.var_1D3B.x = var_00;
	self.var_1D3B.y = var_07;
	self.var_1D3B.z = var_01;
	self.var_20CE = lib_A53C::createfontstring("small",1);
	self.var_20CE lib_A646::func_9962(self.mgturret[0]);
	self.var_20CE.x = var_00;
	self.var_20CE.y = 0;
	self.var_20CE.z = var_01 + var_0A;
	self.var_4AD8 = newhudelem();
	self.var_4AD8 setshader("bls_ui_turret_warning",90,24);
	self.var_4AD8 lib_A646::func_9963(self.mgturret[0]);
	self.var_4AD8.alpha = 0;
	self.var_4AD8.x = var_00;
	self.var_4AD8.y = 0;
	self.var_4AD8.z = var_01 + var_0A;
	self.var_4AD5 = [];
	for(var_0D = 0;var_0D < 2;var_0D++)
	{
		self.var_4AD5[var_0D] = lib_A53C::createfontstring("hudsmall",0.75);
		self.var_4AD5[var_0D] lib_A646::func_9962(self.mgturret[0]);
		self.var_4AD5[var_0D].x = var_00;
		self.var_4AD5[var_0D].y = var_08 + var_0D * var_09;
		self.var_4AD5[var_0D].z = var_01 + var_0B;
	}

	thread lib_A646::func_9ABB();
	thread lib_A646::func_20CF();
	thread lib_A646::func_A1A9();
	thread lib_A646::func_6C11();
	if(isdefined(level.var_A360) && level.var_A360)
	{
		thread lib_A646::func_4AF3();
	}

	common_scripts\utility::waittill_any("dismount_vehicle_and_turret","death");
	var_0E lib_A646::func_9961();
	self.var_1D3A lib_A646::func_9961();
	self.var_1D3B lib_A646::func_9961();
	self.var_4AD8 lib_A646::func_9961();
	self.var_20CE lib_A646::func_9961();
	foreach(var_11 in self.missiles)
	{
		var_11 lib_A646::func_9961();
	}

	foreach(var_11 in self.var_4AD5)
	{
		var_11 lib_A646::func_9961();
	}

	common_scripts\utility::waittill_any("player_exited_mobile_turret","death");
	function_00D3("hud_fade_ammodisplay",var_0C);
	var_0E destroy();
	if(isdefined(var_0F))
	{
		var_0F destroy();
	}

	self.var_1D3A destroy();
	self.var_1D3B destroy();
	self.var_4AD8 destroy();
	self notify("destroy_hud_text");
	self.var_20CE destroy();
	foreach(var_11 in self.missiles)
	{
		var_11 destroy();
	}

	foreach(var_11 in self.var_4AD5)
	{
		var_11 destroy();
	}
}

//Function Number: 29
lib_A646::func_74BE()
{
	var_00 = 32;
	var_01 = 32;
	foreach(var_03 in self)
	{
		var_03 moveovertime(0.1);
		var_03.alpha = 1;
	}

	self["tl"].x = 0 - var_00;
	self["tl"].y = 0 - var_01;
	self["tr"].x = var_00;
	self["tr"].y = 0 - var_01;
	self["br"].x = var_00;
	self["br"].y = var_01;
	self["bl"].x = 0 - var_00;
	self["bl"].y = var_01;
	self["cross_l"].x = 0 - var_00;
	self["cross_l"].y = 0;
	self["cross_r"].x = var_00;
	self["cross_r"].y = 0;
	self["cross_b"].x = 0;
	self["cross_b"].y = 0 - var_01;
	self["cross_t"].x = 0;
	self["cross_t"].y = var_01;
}

//Function Number: 30
lib_A646::func_74BC()
{
	var_00 = 16;
	var_01 = 16;
	foreach(var_03 in self)
	{
		var_03.alpha = 0;
	}

	self["tl"].x = 0 - var_00;
	self["tl"].y = 0 - var_01;
	self["tr"].x = var_00;
	self["tr"].y = 0 - var_01;
	self["br"].x = var_00;
	self["br"].y = var_01;
	self["bl"].x = 0 - var_00;
	self["bl"].y = var_01;
	self["cross_l"].x = 0 - var_00;
	self["cross_l"].y = 0;
	self["cross_r"].x = var_00;
	self["cross_r"].y = 0;
	self["cross_b"].x = 0;
	self["cross_b"].y = 0 - var_01;
	self["cross_t"].x = 0;
	self["cross_t"].y = var_01;
}

//Function Number: 31
lib_A646::func_6C11()
{
	self.var_6ADE endon("death");
	var_00 = 16;
	var_01 = 16;
	self.var_37A = [];
	self.var_37A["tl"] = newhudelem();
	self.var_37A["tr"] = newhudelem();
	self.var_37A["br"] = newhudelem();
	self.var_37A["bl"] = newhudelem();
	self.var_37A["cross_l"] = newhudelem();
	self.var_37A["cross_r"] = newhudelem();
	self.var_37A["cross_b"] = newhudelem();
	self.var_37A["cross_t"] = newhudelem();
	foreach(var_03 in self.var_37A)
	{
		var_03.elemtype = "icon";
		var_03.width = 32;
		var_03.height = 32;
		var_03.foreground = 1;
		var_03.children = [];
		var_03 lib_A53C::setparent(level.uiparent);
		var_03.alignx = "center";
		var_03.aligny = "middle";
		var_03.horzalign = "center";
		var_03.vertalign = "middle";
		var_03.alpha = 0;
		var_03.var_1EC = 1;
	}

	self.var_37A["tl"].x = 0 - var_00;
	self.var_37A["tl"].y = 0 - var_01;
	self.var_37A["tl"] setshader("bls_ui_turret_reticle_tl",32,32);
	self.var_37A["tr"].x = var_00;
	self.var_37A["tr"].y = 0 - var_01;
	self.var_37A["tr"] setshader("bls_ui_turret_reticle_tr",32,32);
	self.var_37A["br"].x = var_00;
	self.var_37A["br"].y = var_01;
	self.var_37A["br"] setshader("bls_ui_turret_reticle_br",32,32);
	self.var_37A["bl"].x = 0 - var_00;
	self.var_37A["bl"].y = var_01;
	self.var_37A["bl"] setshader("bls_ui_turret_reticle_bl",32,32);
	self.var_37A["cross_l"].x = 0 - var_00;
	self.var_37A["cross_l"].y = 0;
	self.var_37A["cross_l"] setshader("bls_ui_turret_reticule_hpip",16,16);
	self.var_37A["cross_r"].x = var_00;
	self.var_37A["cross_r"].y = 0;
	self.var_37A["cross_r"] setshader("bls_ui_turret_reticule_hpip",16,16);
	self.var_37A["cross_b"].x = 0;
	self.var_37A["cross_b"].y = 0 - var_01;
	self.var_37A["cross_b"] setshader("bls_ui_turret_reticule_vpip",16,16);
	self.var_37A["cross_t"].x = 0;
	self.var_37A["cross_t"].y = var_01;
	self.var_37A["cross_t"] setshader("bls_ui_turret_reticule_vpip",16,16);
	self waittill("dismount_vehicle_and_turret");
	foreach(var_03 in self.var_37A)
	{
		var_03 lib_A646::func_9961();
	}

	self waittill("player_exited_mobile_turret");
	foreach(var_03 in self.var_37A)
	{
		var_03 destroy();
	}
}

//Function Number: 32
lib_A646::func_6AE8()
{
	level.var_31D endon("death");
	self endon("disable_mobile_turret");
	if(!isalive(level.var_31D))
	{
		return;
	}

	level.var_31D method_80EC(1);
	foreach(var_01 in self.var_32FF)
	{
		var_01 makeunusable();
	}

	foreach(var_04 in self.var_48C0)
	{
		if(isdefined(var_04))
		{
			var_04 lib_A571::func_48B3();
		}
	}

	level.var_31D lib_A571::func_825E(1);
	lib_A561::func_6AFB();
	var_06 = lib_A5A3::func_8933();
	var_06 hide();
	var_07 = distancesquared(level.var_31D.var_2E6,self.var_32FF[0].var_2E6);
	var_08 = distancesquared(level.var_31D.var_2E6,self.var_32FF[1].var_2E6);
	var_09 = distancesquared(level.var_31D.var_2E6,self.var_32FF[2].var_2E6);
	var_0A = var_07;
	var_0B = "enter_left_turret";
	if(var_08 < var_0A)
	{
		var_0A = var_08;
		var_0B = "enter_right_turret";
	}

	if(var_09 < var_0A)
	{
		var_0A = var_09;
		var_0B = "enter_back_turret";
	}

	level.var_31D notify("player_starts_entering_mobile_turret");
	lib_A506::func_BC7(var_06,var_0B,"tag_body");
	level.var_31D playerlinktoblend(var_06,"tag_player",0.2,0.1,0.1);
	wait(0.2);
	thread lib_A59A::func_5686(2,55);
	var_06 show();
	var_06 method_808E();
	var_06.var_9D51 = self;
	lib_A506::func_C24(var_06,var_0B,"tag_body");
	level.var_31D unlink();
	var_06 delete();
	level.var_31D lib_A571::func_825D();
	if(level.var_A361)
	{
	}
	else
	{
		level.var_31D drivevehicleandcontrolturret(self);
	}

	self.mgturret[0] setcontents(0);
	self.mgturret[0] useby(level.var_31D);
	self.mgturret[0] makeunusable();
	level.var_31D method_80F4();
	if(level.var_A361)
	{
		level.var_31D playerlinkto(self.mgturret[0],"tag_guy",0,180,180,90,2,0);
	}
	else
	{
		level.var_31D playerlinkto(self.mgturret[0],"tag_guy",0,180,180,11,13,0);
	}

	level.var_31D.var_2E18 = self;
	level.var_31D method_8233();
	if(level.var_A361)
	{
		level.var_31D method_80FE(0.65,0.65);
	}
	else
	{
		level.var_31D method_80FE(0.5,0.35);
	}

	self.var_6ADE = level.var_31D;
	thread lib_A646::func_1A20();
	self.var_6ADE playrumbleonentity("damage_light");
	thread lib_A646::func_7125();
	self notify("driving_vehicle_and_turret");
	self.var_6ADE notify("player_enters_mobile_turret");
	thread lib_A647::func_876D("plr");
	thread lib_A646::func_6C12();
	if(level.var_A35E)
	{
		level.var_31D method_80EC(0);
		level.var_31D method_80EF();
	}

	return var_0B;
}

//Function Number: 33
lib_A646::func_1A20()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	level.var_31D endon("death");
	var_00 = 7;
	var_01 = 512;
	var_02 = 0.5;
	var_03 = 1;
	for(;;)
	{
		if(self veh_getspeed() == 0)
		{
			var_04 = 0.08;
		}
		else
		{
			var_04 = 0.12;
		}

		earthquake(var_04,var_00,level.var_31D.var_2E6,var_01);
		wait(var_03 + randomfloat(var_02));
	}
}

//Function Number: 34
lib_A646::func_7125()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	level.var_31D endon("death");
	for(;;)
	{
		var_00 = randomfloatrange(0.2,1);
		self.mgturret[0] setplayerspread(var_00);
		wait(0.05);
	}
}

//Function Number: 35
lib_A646::func_3753(param_00)
{
	var_01 = ["exit_left_turret","exit_right_turret","exit_back_turret"];
	var_02 = [0,1,2];
	if(isdefined(param_00))
	{
		if(param_00 == "enter_right_turret")
		{
			var_02 = [1,0,2];
		}
	}

	var_03 = lib_A5A3::func_8933();
	var_03 hide();
	for(var_04 = 0;var_04 < var_01.size;var_04++)
	{
		var_05 = var_02[var_04];
		var_06 = var_01[var_05];
		var_07 = var_03 lib_A59A::func_3EF3(var_06);
		lib_A506::func_BC7(var_03,var_06,"tag_body");
		var_08 = getmovedelta(var_07,0,1);
		var_09 = var_03 localtoworldcoords(var_08);
		var_0A = var_09 + (0,0,15);
		var_0B = playerphysicstrace(var_0A,var_09);
		var_0C = var_0B[2] - var_09[2];
		if(var_0C < 1)
		{
			var_03 delete();
			return var_06;
		}
	}

	var_03 delete();
	return undefined;
}

//Function Number: 36
lib_A646::func_6AF1(param_00)
{
	level.var_31D endon("death");
	self endon("disable_mobile_turret");
	if(!isalive(level.var_31D))
	{
		return;
	}

	level.var_31D method_80F0();
	level.var_31D method_80EC(1);
	self.mgturret[0] method_8001(self.var_90BF.var_2E6);
	self.mgturret[0] useby(level.var_31D);
	level.var_31D playerlinktodelta(self.var_90BF,"tag_origin",1);
	level.var_31D lib_A571::func_825E();
	lib_A646::func_9FCA();
	level.var_31D unlink();
	var_01 = lib_A5A3::func_8933();
	var_01 hide();
	lib_A506::func_BC7(var_01,param_00,"tag_body");
	level.var_31D playerlinktoblend(var_01,"tag_player",0.2,0.1,0.1);
	wait(0.2);
	var_01 show();
	var_01 method_808E();
	var_01.var_9D51 = self;
	level.var_31D.var_2E18 = undefined;
	self.var_6ADE = undefined;
	if(!isdefined(self.var_1927))
	{
		if(!level.var_A361)
		{
			level.var_31D drivevehicleandcontrolturretoff(self);
		}
	}
	else if(isdefined(self.var_257E))
	{
		foreach(var_03 in self.var_257E)
		{
			stopfxontag(common_scripts\utility::getfx(var_03.name),self.mgturret[0],var_03.tag);
		}
	}

	self notify("dismount_vehicle_and_turret");
	level.var_31D playerlinktodelta(var_01,"tag_player",1,0,0,0,0,1);
	thread lib_A647::func_876D("npc");
	lib_A506::func_C24(var_01,param_00,"tag_body");
	level.var_31D playrumbleonentity("damage_light");
	level.var_31D unlink();
	var_01 delete();
	level.var_31D lib_A571::func_825D();
	lib_A561::func_6AF5();
	foreach(var_06 in self.var_32FF)
	{
		var_06 makeusable();
	}

	self.var_48C0 = [];
	foreach(var_09 in self.var_48B8)
	{
		self.var_48C0[self.var_48C0.size] = var_09 lib_A571::func_48B5("x","tag_origin",50,150);
	}

	level.var_31D method_80EC(0);
	self notify("player_exited_mobile_turret");
	level.var_31D notify("player_exited_mobile_turret");
}

//Function Number: 37
lib_A646::func_9FCA()
{
	var_00 = 0;
	while(!var_00)
	{
		wait(0.05);
		var_01 = self.mgturret[0] gettagangles("tag_barrel");
		var_02 = anglestoforward(self.var_41);
		var_03 = anglestoforward(var_01);
		var_04 = vectordot(var_02,var_03);
		var_00 = var_04 > 0.95;
	}
}

//Function Number: 38
lib_A646::func_4632()
{
	self endon("death");
	for(;;)
	{
		self waittill("enter_vehicle_dof");
		lib_A509::func_2C4A(10,70,4,9500,10000,0,0.5);
		self waittill("exit_vehicle_dof");
		lib_A509::func_2C46(0.5);
	}
}

//Function Number: 39
lib_A646::func_9F8C()
{
	self endon("dismount_vehicle_and_turret");
	var_00 = 0;
	while(var_00 < 1)
	{
		var_00 = 0;
		while(level.var_31D usebuttonpressed() && var_00 < 1)
		{
			var_00 = var_00 + 0.1;
			wait 0.05;
		}

		wait 0.05;
	}
}

//Function Number: 40
lib_A646::func_9F81(param_00)
{
	if(param_00.size > 1)
	{
		for(var_01 = 1;var_01 < param_00.size;var_01++)
		{
			param_00[var_01] endon("trigger");
		}
	}

	if(param_00.size > 0)
	{
		param_00[0] waittill("trigger");
	}
}

//Function Number: 41
lib_A646::func_5928()
{
	self makeunusable();
	if(isdefined(self.var_32FF))
	{
		foreach(var_01 in self.var_32FF)
		{
			var_01 makeusable();
		}
	}

	if(isdefined(self.var_48B8))
	{
		self.var_48C0 = [];
		foreach(var_04 in self.var_48B8)
		{
			self.var_48C0[self.var_48C0.size] = var_04 lib_A571::func_48B5("x","tag_origin",50,150);
		}
	}
}

//Function Number: 42
lib_A646::func_5927()
{
	self makeunusable();
	if(isdefined(self.var_32FF))
	{
		foreach(var_01 in self.var_32FF)
		{
			var_01 makeunusable();
		}
	}

	if(isdefined(self.var_48C0))
	{
		foreach(var_04 in self.var_48C0)
		{
			var_04 lib_A571::func_48B3();
		}

		self.var_48C0 = [];
	}
}

//Function Number: 43
lib_A646::func_5E15()
{
	self endon("death");
	self method_814B(lib_A5A3::func_3EB3("idle"));
	for(;;)
	{
		self waittill("driving_vehicle_and_turret");
		if(!isdefined(self.var_6ADE))
		{
			thread lib_A646::func_4630();
			lib_A646::func_5927();
		}
		else
		{
			thread lib_A646::func_5E13();
			thread lib_A646::func_1A21();
			thread lib_A646::func_7587();
		}

		lib_A646::func_9F8C();
	}
}

//Function Number: 44
lib_A646::func_0C68()
{
	self endon("death");
	for(;;)
	{
		self waittill("play_anim",var_00);
		lib_A646::clear_anims();
		self method_814B(lib_A5A3::func_3EB3(var_00),1,0.2,1);
	}
}

//Function Number: 45
lib_A646::clear_anims()
{
	self method_8142(%walker_wheels_turret,0.2);
}

//Function Number: 46
lib_A646::func_5E13()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	for(;;)
	{
		self.mgturret[0] waittill("turret_fire");
		self.mgturret[0] method_814D(%x4walker_wheels_turret_cockpit_fire,1,0,1);
	}
}

//Function Number: 47
lib_A646::func_1A21()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	for(;;)
	{
		self.mgturret[0] waittill("turret_fire");
		earthquake(0.2,0.1,self.var_6ADE.var_2E6,128);
		self.var_6ADE playrumbleonentity("heavy_1s");
	}
}

//Function Number: 48
lib_A646::func_7587()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	self endon("end_rocket_think");
	thread lib_A646::func_5DC2();
	for(;;)
	{
		self waittill("target_missile_system");
		thread lib_A646::func_7585();
		self waittill("fire_missile_system");
		thread lib_A646::func_37C3();
		if(isdefined(self.var_7586) && self.var_7586.size > 0)
		{
			self notify("disable_missile_input");
			wait(2);
			self.mgturret[0] method_8143(%x4walkersplit_cockpit_rockets_down,1,0.2,1);
			wait(0.5);
			self.mgturret[0] method_8143(%x4walkersplit_cockpit_rockets_up,1,0.2,1);
			thread lib_A646::func_5DC2();
		}
	}
}

//Function Number: 49
lib_A646::func_7585()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	self endon("fire_missile_system");
	if(!isdefined(self.var_7586))
	{
		self.var_7586 = [];
	}

	var_00 = 4;
	for(;;)
	{
		if(self.var_7586.size < var_00)
		{
			lib_A646::func_07A1();
		}

		wait(0.05);
	}
}

//Function Number: 50
lib_A646::func_06E3(param_00)
{
	self endon("death");
	param_00 endon("dismount_vehicle_and_turret");
	wait(0.3);
	function_009C(self,"bls_ui_turret_targetlock_white");
}

//Function Number: 51
lib_A646::func_07A2()
{
	var_00 = anglestoforward(self.var_6ADE getplayerangles());
	var_00 = vectornormalize(var_00);
	var_01 = self.var_6ADE geteye();
	var_02 = bullettrace(var_01,var_01 + var_00 * 2048,1,self);
	var_03 = var_02["entity"];
	if(isdefined(var_03) && isai(var_03) && isalive(var_03) && !lib_A5A0::func_E29(var_03) && !lib_A5A0::func_E2A(var_03))
	{
		if(!isdefined(var_03.var_91A7) || !var_03.var_91A7)
		{
			var_03.var_91A7 = 1;
			function_009A(var_03,(0,0,20));
			function_009C(var_03,"bls_ui_turret_targetacquired");
			var_03 thread lib_A646::func_06E3(self);
			lib_A5DE::snd_message("x4_walker_hud_target_aquired",var_03);
			thread lib_A646::func_7381(var_03);
			self.var_7586[self.var_7586.size] = var_03;
		}
	}
}

//Function Number: 52
lib_A646::func_9AC0()
{
	if(isdefined(self.missiles) && isdefined(self.var_7586))
	{
		for(var_00 = 0;var_00 < self.var_7586.size;var_00++)
		{
			self.missiles[var_00] fadeovertime(0.1);
			self.missiles[var_00].alpha = 0.1;
		}

		while(var_00 < self.missiles.size)
		{
			self.missiles[var_00] fadeovertime(0.1);
			self.missiles[var_00].alpha = 1;
			var_00++;
		}
	}
}

//Function Number: 53
lib_A646::func_07A1()
{
	var_00 = anglestoforward(self.var_6ADE getplayerangles());
	var_00 = vectornormalize(var_00);
	var_01 = self.var_6ADE geteye();
	var_02 = (0,0,32);
	var_03 = lib_A646::func_3CBF();
	foreach(var_05 in var_03)
	{
		if(isdefined(var_05.var_91A7) && var_05.var_91A7)
		{
			continue;
		}

		if(isdefined(var_05.var_750B))
		{
			if(!isdefined(var_05.var_713F) || !var_05.var_713F)
			{
				continue;
			}
		}

		var_06 = var_05.var_2E6;
		if(isai(var_05))
		{
			var_06 = var_05 geteye();
		}

		var_07 = var_06 - var_01;
		var_08 = length(var_07);
		if(var_08 > 2648)
		{
			var_09 = bullettrace(var_01,var_06 + lib_A646::func_3DDA(var_05),1,self);
			if(!isdefined(var_09["entity"]) || !var_09["entity"] == var_05)
			{
				continue;
			}
		}

		var_07 = vectornormalize(var_07);
		var_0A = vectordot(var_00,var_07);
		var_0B = abs(acos(var_0A));
		if(var_0B > 4)
		{
			continue;
		}

		var_05.var_91A7 = 1;
		function_009A(var_05,(0,0,20));
		function_009C(var_05,"bls_ui_turret_targetacquired");
		var_05 thread lib_A646::func_06E3(self);
		lib_A5DE::snd_message("x4_walker_hud_target_aquired",var_05);
		thread lib_A646::func_7381(var_05);
		self.var_7586[self.var_7586.size] = var_05;
		return;
	}
}

//Function Number: 54
lib_A646::func_3DDA(param_00)
{
	if(isai(param_00))
	{
		return (0,0,0);
	}

	if(isdefined(param_00.vehicletype))
	{
		if(param_00 lib_A59E::func_5115())
		{
			return (0,0,-80);
		}

		return (0,0,48);
	}

	if(isdefined(param_00.destructibleinfo))
	{
		return (0,0,48);
	}

	return (0,0,0);
}

//Function Number: 55
lib_A646::func_3CBF()
{
	var_00 = function_00D6("axis");
	var_01 = getentarray("script_vehicle","code_classname");
	var_02 = [];
	foreach(var_04 in var_00)
	{
		if(!isalive(var_04))
		{
			continue;
		}

		var_02[var_02.size] = var_04;
	}

	foreach(var_07 in var_01)
	{
		if(isspawner(var_07))
		{
			continue;
		}

		if(!isalive(var_07))
		{
			continue;
		}

		if(isdefined(var_07.var_7AE9) && var_07.var_7AE9 != "axis")
		{
			continue;
		}

		if(isdefined(var_07.var_5D2F) && !var_07.var_5D2F)
		{
			continue;
		}

		var_02[var_02.size] = var_07;
	}

	return var_02;
}

//Function Number: 56
lib_A646::func_7381(param_00)
{
	lib_A646::func_9FEC(param_00);
	if(isdefined(param_00))
	{
		param_00.var_91A7 = undefined;
		function_009B(param_00);
	}

	if(isdefined(self) && isdefined(self.var_7586))
	{
		var_01 = [];
		foreach(var_03 in self.var_7586)
		{
			if(isdefined(var_03))
			{
				if(isdefined(param_00) && var_03 == param_00)
				{
					continue;
				}

				var_01[var_01.size] = var_03;
			}
		}

		self.var_7586 = var_01;
	}
}

//Function Number: 57
lib_A646::func_9FEC(param_00)
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	self endon("force_clear_all_turret_locks");
	param_00 endon("death");
	param_00 waittill("remove_target");
}

//Function Number: 58
lib_A646::func_5DC2()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	self endon("disable_missile_input");
	var_00 = 0;
	for(;;)
	{
		wait(0.05);
		var_01 = self.var_6ADE fragbuttonpressed();
		if(var_01 && !var_00)
		{
			var_00 = 1;
			function_00D3("cg_drawCrosshair",0);
			self.var_37A lib_A646::func_74BE();
			self notify("target_missile_system");
		}
		else if(!var_01 && var_00)
		{
			var_00 = 0;
			function_00D3("cg_drawCrosshair",1);
			self.var_37A lib_A646::func_74BC();
			self notify("fire_missile_system");
		}

		lib_A646::func_9AC0();
	}

	function_00D3("cg_drawCrosshair",1);
}

//Function Number: 59
lib_A646::func_37C3()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	var_00 = [];
	foreach(var_02 in self.var_7586)
	{
		var_00[var_00.size] = var_02;
	}

	var_04 = 0;
	foreach(var_02 in var_00)
	{
		if(!isdefined(var_02) || !isalive(var_02))
		{
			continue;
		}

		if(!isdefined(var_02.var_91A7))
		{
			continue;
		}

		self.var_6ADE playrumbleonentity("heavy_1s");
		earthquake(0.3,1,self.var_6ADE.var_2E6,256);
		function_009C(var_02,"bls_ui_turret_targetlock");
		lib_A5DE::snd_message("x4_walker_hud_missile_launched",var_02);
		thread lib_A646::func_37C2(var_02,var_04);
		var_04++;
		wait(0.35);
	}
}

//Function Number: 60
lib_A646::func_37C2(param_00,param_01)
{
	if(!isdefined(self.var_5624))
	{
		self.var_5624 = 0;
	}
	else
	{
		self.var_5624++;
		self.var_5624 = self.var_5624 % 4;
	}

	var_02 = param_00.var_2E6;
	param_01 = self.var_5624 + 1;
	var_03 = "TAG_LAUNCHER" + param_01;
	var_04 = undefined;
	switch(param_01)
	{
		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;
	}
}

//Function Number: 61
lib_A646::func_1CBB()
{
	if(getdvar("mapname") == "fusion")
	{
		if(!isdefined(level.var_379C))
		{
			level.var_379C = 0;
		}

		level.var_379C++;
		if(level.var_379C >= 10 && level.var_379C < 20)
		{
			lib_A59A::func_41DA("LEVEL_4A");
		}
	}
}

//Function Number: 62
lib_A646::func_4630()
{
	if(isdefined(self.var_8E5))
	{
		self thread [[ self.var_8E5 ]]();
		return;
	}

	thread lib_A641::func_9D56();
}

//Function Number: 63
lib_A646::func_9000(param_00)
{
	if(isdefined(param_00) && isdefined(param_00.var_9D51))
	{
		param_00.var_9D51 notify("enter_vehicle_dof");
		param_00.var_9D51 setmodel("vehicle_vm_x4walkerSplit_wheels");
		param_00.var_9D51.mgturret[0] setmodel("vehicle_vm_x4walkerSplit_turret");
		param_00.var_9D51 veh_teleport(param_00.var_9D51.var_2E6,param_00.var_9D51.var_41);
		param_00.var_9D51 notify("play_anim","cockpit_idle");
		level notify("swapped_x4walker",param_00.var_9D51);
	}
}

//Function Number: 64
lib_A646::func_9008(param_00)
{
	if(isdefined(param_00) && isdefined(param_00.var_9D51))
	{
		param_00.var_9D51 notify("exit_vehicle_dof");
		param_00.var_9D51 setmodel("vehicle_npc_x4walkerSplit_wheels");
		param_00.var_9D51.mgturret[0] setmodel("vehicle_npc_x4walkerSplit_turret");
		param_00.var_9D51 veh_teleport(param_00.var_9D51.var_2E6,param_00.var_9D51.var_41);
		param_00.var_9D51 notify("play_anim","idle");
	}
}

//Function Number: 65
lib_A646::func_1E58()
{
	self waittill("death");
	if(isdefined(self))
	{
		if(isdefined(self.var_32FF))
		{
			foreach(var_01 in self.var_32FF)
			{
				var_01 delete();
			}
		}

		if(isdefined(self.var_48C0))
		{
			foreach(var_04 in self.var_48C0)
			{
				var_04 lib_A571::func_48B3();
			}

			self.var_48C0 = [];
		}

		if(isdefined(self.var_90BF))
		{
			self.var_90BF delete();
		}
	}
}

//Function Number: 66
lib_A646::func_1E5A()
{
	if(isdefined(self))
	{
		if(isdefined(self.var_32FF))
		{
			foreach(var_01 in self.var_32FF)
			{
				var_01 delete();
			}
		}

		if(isdefined(self.var_90BF))
		{
			self.var_90BF delete();
		}
	}
}

//Function Number: 67
lib_A646::func_5E1D()
{
	self endon("death");
	level endon("kill_wheel_watcher");
	var_00 = ["tag_wheel_back_left","tag_wheel_back_right","tag_wheel_front_left","tag_wheel_front_right"];
	self.var_556A = [];
	self.var_2505 = [];
	var_01 = 0.05;
	if(level.currentgen)
	{
		var_01 = 0.5;
	}

	for(;;)
	{
		foreach(var_03 in var_00)
		{
			self.var_2505[var_03] = self gettagorigin(var_03);
		}

		wait(var_01);
		foreach(var_03 in var_00)
		{
			self.var_556A[var_03] = self.var_2505[var_03];
		}
	}
}

//Function Number: 68
lib_A646::func_5E12()
{
	self endon("death");
	self endon("dismount_vehicle_and_turret");
	self.var_4462 = spawnstruct();
	self.var_4462.var_25F6 = 0;
	self.var_4462.var_5A0C = 3;
	self.var_4462.var_25F5 = [];
	for(var_00 = 0;var_00 < self.var_4462.var_5A0C;var_00++)
	{
		self.var_4462.var_25F5[var_00] = spawnstruct();
		var_01 = self.var_6ADE getplayerangles();
		self.var_4462.var_25F5[self.var_4462.var_25F6].yaw = var_01[1];
		self.var_4462.var_25F5[self.var_4462.var_25F6].pitch = var_01[0];
		self.var_4462.var_25F5[self.var_4462.var_25F6].time = gettime();
		self.var_4462.var_25F6 = self.var_4462.var_25F6 + 1 % self.var_4462.var_5A0C;
	}

	for(;;)
	{
		if(isdefined(self.var_6ADE) && isdefined(self.mgturret[0]))
		{
			var_01 = self.var_6ADE getplayerangles();
			self.var_4462.var_25F5[self.var_4462.var_25F6].yaw = var_01[1];
			self.var_4462.var_25F5[self.var_4462.var_25F6].pitch = var_01[0];
			self.var_4462.var_25F5[self.var_4462.var_25F6].time = gettime();
			self.var_4462.var_25F6 = self.var_4462.var_25F6 + 1 % self.var_4462.var_5A0C;
			var_02 = angleclamp180(var_01[0]);
			var_03 = lib_A571::func_576A(var_02,-11,13,-6400,25000);
			self.var_1D3A.z = var_03;
			var_02 = angleclamp360(var_01[1]);
			var_03 = lib_A571::func_576A(var_02,0,360,-6400,25000);
			self.var_1D3B.z = var_03;
		}

		wait(0.05);
	}
}

//Function Number: 69
lib_A646::func_3EC7(param_00)
{
	if(isdefined(self.var_2505[param_00]) && isdefined(self.var_556A[param_00]))
	{
		var_01 = self.var_2505[param_00] - self.var_556A[param_00];
		return var_01 * 20;
	}

	return (0,0,0);
}

//Function Number: 70
lib_A646::func_3D8A()
{
	if(!isdefined(self.var_4462))
	{
		return 0;
	}

	var_00 = self.var_4462.var_25F6;
	var_01 = self.var_4462.var_25F6 + 1 % self.var_4462.var_5A0C;
	var_02 = self.var_4462.var_25F6 + self.var_4462.var_5A0C - 1 % self.var_4462.var_5A0C;
	var_03 = self.var_4462.var_25F5[var_00].pitch + self.var_4462.var_25F5[var_01].pitch / 2;
	var_04 = self.var_4462.var_25F5[var_01].pitch + self.var_4462.var_25F5[var_02].pitch / 2;
	var_05 = angleclamp180(var_04 - var_03);
	var_06 = self.var_4462.var_25F5[var_02].time - self.var_4462.var_25F5[var_00].time;
	return var_05 * 1000 / var_06;
}

//Function Number: 71
lib_A646::func_3D8B()
{
	if(!isdefined(self.var_4462))
	{
		return 0;
	}

	var_00 = self.var_4462.var_25F6;
	var_01 = self.var_4462.var_25F6 + 1 % self.var_4462.var_5A0C;
	var_02 = self.var_4462.var_25F6 + self.var_4462.var_5A0C - 1 % self.var_4462.var_5A0C;
	var_03 = self.var_4462.var_25F5[var_00].yaw + self.var_4462.var_25F5[var_01].yaw / 2;
	var_04 = self.var_4462.var_25F5[var_01].yaw + self.var_4462.var_25F5[var_02].yaw / 2;
	var_05 = angleclamp180(self.var_4462.var_25F5[var_02].yaw - self.var_4462.var_25F5[var_00].yaw);
	var_06 = self.var_4462.var_25F5[var_02].time - self.var_4462.var_25F5[var_00].time;
	return var_05 * 1000 / var_06;
}