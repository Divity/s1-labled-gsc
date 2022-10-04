/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42541.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 69
 * Decompile Time: 21 ms
 * Timestamp: 4/20/2022 8:23:48 PM
*******************************************************************/

//Function Number: 1
lib_A62D::func_061A()
{
	precachemodel("vehicle_sniper_drone_outerparts");
	precachemodel("vehicle_vm_sniper_drone");
	precachemodel("vehicle_pdrone_player");
	precachemodel("dem_tablet_pc_01");
	precachemodel("worldhands_atlas_pmc_smp");
	precacheshader("overlay_static_digital");
	precacheshader("s1_pdrone_player_overlay");
	precacheshader("ugv_vignette_overlay");
}

//Function Number: 2
lib_A62D::func_0556()
{
	level.var_78B2["drone_deploy_player_arms"] = "worldhands_atlas_pmc_smp";
	level.var_78AE["drone_deploy_player_arms"] = #animtree;
	level.var_78A9["drone_deploy_player_arms"]["deploy"] = %assault_drone_deploy_vm;
	level.var_78A9["drone_deploy_player_arms"]["use"] = %rec_drone_deploy_vm;
	level.var_78A9["drone_deploy_player_arms"]["stop_use"] = %rec_drone_deploy_out_vm;
}

//Function Number: 3
lib_A62D::func_0555()
{
	level.var_78B2["drone_deploy_drone"] = "vehicle_pdrone_player";
	level.var_78AE["drone_deploy_drone"] = #animtree;
	level.var_78A9["drone_deploy_drone"]["deploy"] = %assault_drone_deploy;
}

//Function Number: 4
lib_A62D::func_0557()
{
	level.var_78AE["drone_player_proxy"] = #animtree;
	level.var_78A9["drone_player_proxy"]["loop"][0] = %pdrone_player_proxy_idle;
}

//Function Number: 5
lib_A62D::func_0554()
{
	lib_A62D::func_0556();
	lib_A62D::func_0555();
	lib_A62D::func_0557();
}

//Function Number: 6
lib_A62D::_fx()
{
	level._effect["pdrone_large_death_explosion"] = loadfx("vfx/explosion/vehicle_pdrone_large_explosion");
}

//Function Number: 7
lib_A62D::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("pdrone_player",param_00,param_01,param_02);
	lib_A59E::func_1859(::lib_A62D::func_4D0D);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1856(10000,0,10000);
	lib_A59E::func_1872("pdrone_player_turret_sp","tag_origin","vehicle_sniper_drone_turret_mp",undefined,"manual",0.2,0,0,(0,0,0));
	lib_A62D::func_061A();
	lib_A62D::func_0554();
	lib_A62D::_fx();
}

//Function Number: 8
lib_A62D::func_4D0D()
{
	thread lib_A62D::func_8C2D();
}

//Function Number: 9
lib_A62D::func_8C2D()
{
	var_00 = spawnstruct();
	var_00.var_6F1E = "pdrone_player";
	var_01 = ::lib_A62E::func_8720;
	lib_A5DE::snd_message("snd_register_vehicle",var_00.var_6F1E,var_01);
	lib_A5DE::snd_message("snd_start_vehicle",var_00);
}

//Function Number: 10
lib_A62D::func_6775(param_00,param_01,param_02)
{
	if(!isdefined(param_00))
	{
		param_00 = 125;
	}

	if(!isdefined(param_01))
	{
		param_01 = 10;
	}

	if(!isdefined(param_02))
	{
		param_02 = 45;
	}

	var_03 = level.var_31D geteye();
	var_04 = 1;
	var_05 = common_scripts\utility::flat_angle(level.var_31D method_8036());
	var_06 = 0;
	var_07 = 0;
	if(var_07 <= 5)
	{
		var_08 = (1,0,0);
		var_09 = var_05;
		switch(var_07)
		{
			case 1:
				break;

			case 2:
				break;

			case 3:
				break;

			case 4:
				break;

			case 5:
				break;
		}
	}
}

//Function Number: 11
lib_A62D::func_6774(param_00,param_01,param_02)
{
	var_03 = lib_A59A::func_88CB("drone_deploy_player_arms",level.var_31D.var_2E6);
	var_04 = lib_A59A::func_88CB("drone_deploy_drone",level.var_31D.var_2E6);
	var_05 = level.var_31D common_scripts\utility::spawn_tag_origin();
	level.var_31D method_80EF();
	level.var_31D lib_A571::func_825E();
	var_06 = common_scripts\utility::spawn_tag_origin();
	var_06 linkto(var_03,"tag_player",(0,0,0),(0,0,0));
	if(level.var_31D getstance() == "prone")
	{
		while(level.var_31D getstance() != "crouch")
		{
			level.var_31D setstance("crouch");
			wait 0.05;
		}

		var_07 = 49;
	}

	var_07 = 0;
	if(level.var_31D getstance() == "crouch")
	{
		var_07 = 20;
	}

	level.var_31D.var_2F04 = level.var_31D getstance();
	var_03.var_2E6 = level.var_31D.var_2E6 - (0,0,var_07);
	var_04.var_2E6 = level.var_31D.var_2E6 - (0,0,var_07);
	var_05.var_2E6 = level.var_31D.var_2E6 - (0,0,var_07);
	var_05 lib_A506::func_BC7(var_03,"deploy");
	lib_A5DE::snd_message("snd_player_drone_deploy",var_04);
	var_03 hide();
	var_08 = 0.5;
	level.var_31D playerlinktoblend(var_06,"tag_origin",var_08);
	wait(var_08);
	var_03 show();
	thread lib_A62D::func_4F8C();
	var_05 lib_A506::func_C18([var_03,var_04],"deploy");
	var_09 = param_00 lib_A59A::func_896F();
	var_09 setmodel("vehicle_pdrone_player");
	if(isdefined(param_02))
	{
		var_09 veh_teleport(param_02.var_2E6,param_02.var_41);
	}
	else
	{
		var_09 veh_teleport(var_04.var_2E6,var_04.var_41);
	}

	level.var_31D unlink();
	var_03 delete();
	var_04 delete();
	var_05 delete();
	level.var_31D lib_A571::func_825D();
	level.var_31D method_80F0();
	if(isdefined(param_01) && param_01)
	{
		var_09 thread lib_A62D::func_6788();
	}

	return var_09;
}

//Function Number: 12
lib_A62D::func_678A(param_00)
{
	if(!isdefined(param_00) || param_00.size == 0)
	{
		return;
	}

	var_01 = common_scripts\utility::getclosest(self.var_2E6,param_00,100000);
	if(isdefined(var_01) && isalive(var_01))
	{
		var_02 = var_01.var_2E6 - self.var_2E6;
		var_03 = vectortoangles(var_02);
		self veh_teleport(self.var_2E6,var_03);
	}
}

//Function Number: 13
lib_A62D::func_6788()
{
	lib_A62D::func_678A(function_00D6("axis"));
}

//Function Number: 14
lib_A62D::func_6789()
{
	var_00 = [];
	foreach(var_02 in getarraykeys(self.var_32E9))
	{
		var_00 = common_scripts\utility::array_combine(var_00,getentarray(self.var_32E9[var_02],var_02));
	}

	lib_A62D::func_678A(var_00);
}

//Function Number: 15
lib_A62D::func_4F8C()
{
	wait(4);
	thread lib_A541::func_4F8F("black",0.4,0.3,0.3);
}

//Function Number: 16
lib_A62D::func_060D()
{
	var_00 = lib_A59A::func_88CB("drone_deploy_player_arms",level.var_31D.var_2E6);
	var_01 = level.var_31D common_scripts\utility::spawn_tag_origin();
	level.var_31D playerlinktoabsolute(var_00,"tag_player");
	var_01 lib_A506::func_C24(var_00,"stop_use");
	level.var_31D unlink();
	var_02 = level.var_31D method_813C(level.var_31D.var_2E6 + (0,0,60));
	if(isdefined(var_02))
	{
		level.var_31D setorigin(var_02);
	}

	var_00 delete();
	var_01 delete();
}

//Function Number: 17
lib_A62D::func_05B4(param_00,param_01)
{
	if(isdefined(param_00))
	{
		return param_00;
	}

	return param_01;
}

//Function Number: 18
lib_A62D::func_060C(param_00)
{
	self endon("death");
	param_00 endon("death");
	for(;;)
	{
		param_00 waittill("damage",var_01,var_02);
		if(isplayer(var_02) && var_01 > 50)
		{
			break;
		}
	}

	self.var_6BC7 = 1;
	lib_A62D::func_6797();
}

//Function Number: 19
lib_A62D::func_060A(param_00)
{
	var_01 = getent("pdrone_player_proxy","targetname");
	var_02 = var_01 lib_A59A::func_88BD(1);
	var_02.animname = "drone_player_proxy";
	var_02.name = "Mitchell";
	var_02.var_60EB = 1;
	var_02 lib_A59A::func_445F();
	var_02.ignoreme = 1;
	var_02.ignoreall = 1;
	var_02.inliveplayerkillstreak = "axis";
	var_02.var_60F7 = 1;
	var_02 disableaimassist();
	var_02 thread lib_A59A::func_58D4(1);
	var_02 hudoutlineenable(3,1,1);
	var_02 attach("dem_tablet_pc_01","tag_weapon_left");
	var_03 = self.var_780D.var_74D5;
	if(isdefined(param_00))
	{
		var_03 = param_00;
	}

	self.var_6BC5 = var_02;
	self.var_6BC6 = var_03;
	childthread lib_A62D::func_060C(var_02);
	var_02 method_81C6(var_03.var_2E6,var_03.var_41);
	var_03 lib_A506::func_BE1(var_02,"loop","stop_loop");
}

//Function Number: 20
lib_A62D::func_060B()
{
	if(isdefined(self.var_6BC5))
	{
		self.var_6BC6 notify("stop_loop");
		if(isdefined(self.var_58D4) && self.var_58D4)
		{
			lib_A59A::func_8E9E();
		}

		self.var_6BC5 hide();
		self.var_6BC5 common_scripts\utility::delaycall(0.1,::delete);
	}
}

//Function Number: 21
lib_A62D::func_679D(param_00,param_01,param_02,param_03)
{
	param_00.var_780D = spawnstruct();
	param_00.var_25F5 = spawnstruct();
	param_00.var_25F5.var_9F38 = param_01;
	param_00.inliveplayerkillstreak = level.var_31D.inliveplayerkillstreak;
	param_00.time = param_02;
	param_00.var_505B = 1;
	param_00.turret = param_00.mgturret[0];
	param_00.turret hide();
	if(isdefined(param_03))
	{
		param_00.var_5895 = param_03;
	}
	else
	{
		param_00.var_5895 = 1.5;
	}

	param_00.var_25F5.var_6AB8 = "stance";
	if(!level.var_31D method_834E())
	{
		param_00.var_25F5.var_6AB8 = "activate";
	}
}

//Function Number: 22
lib_A62D::func_679C(param_00,param_01,param_02,param_03)
{
	var_04 = lib_A59E::func_8972(param_00);
	lib_A62D::func_679D(var_04,param_01,param_02,param_03);
	return var_04;
}

//Function Number: 23
lib_A62D::func_062D()
{
	self.var_780D.var_9C74 = getdvarint("vehHelicopterControlsAltitude",1);
	self.var_780D.var_9C75 = getdvarint("vehHelicopterControlSystem",1);
	self.var_780D.var_70A7 = getdvar("r_hudoutlineenable",0);
	self.var_780D.var_70AA = getdvar("r_hudoutlinepostmode",0);
	self.var_780D.var_70A9 = getdvar("r_hudoutlinehalolumscale",0);
	self.var_780D.var_70A8 = getdvar("r_hudoutlinehaloblurradius",0);
	self.var_780D.var_96D = getdvarint("aim_turnrate_pitch");
	self.var_780D.var_96F = getdvarint("aim_turnrate_yaw");
	self.var_780D.playerhealth_regularregendelay = level.var_31D.var_443E.playerhealth_regularregendelay;
	self.var_780D.var_584C = level.var_31D.var_443E.var_584C;
}

//Function Number: 24
lib_A62D::func_0627()
{
	function_00D3("vehHelicopterControlsAltitude",self.var_780D.var_9C74);
	function_00D3("vehHelicopterControlSystem",self.var_780D.var_9C75);
	function_00D3("r_hudoutlineenable",self.var_780D.var_70A7);
	function_00D3("r_hudoutlinepostmode",self.var_780D.var_70AA);
	function_00D3("r_hudoutlinehalolumscale",self.var_780D.var_70A9);
	function_00D3("r_hudoutlinehaloblurradius",self.var_780D.var_70A8);
	function_00D3("aim_turnrate_pitch",self.var_780D.var_96D);
	function_00D3("aim_turnrate_yaw",self.var_780D.var_96F);
	level.var_31D.var_443E.playerhealth_regularregendelay = self.var_780D.playerhealth_regularregendelay;
	level.var_31D.var_443E.var_584C = self.var_780D.playerhealth_regularregendelay;
}

//Function Number: 25
lib_A62D::func_0630()
{
	function_00D3("vehHelicopterControlsAltitude",1);
	function_00D3("vehHelicopterControlSystem",1);
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinepostmode",2);
	function_00D3("r_hudoutlinehalolumscale",1);
	function_00D3("r_hudoutlinehaloblurradius",0.7);
	function_00D3("aim_turnrate_pitch",100);
	function_00D3("aim_turnrate_yaw",130);
	level.var_31D.var_443E.playerhealth_regularregendelay = level.var_31D.var_443E.playerhealth_regularregendelay / 500;
	level.var_31D.var_443E.var_584C = level.var_31D.var_443E.var_584C / 500;
}

//Function Number: 26
lib_A62D::func_068F(param_00,param_01)
{
	self method_8115(#animtree);
	var_02 = function_0063(param_01);
	for(;;)
	{
		self method_8143(param_00);
		level.var_31D waittill("weapon_fired");
		if(1)
		{
			level.var_31D.var_7678.intensity = level.var_31D.var_7678.intensity + 0.1;
		}

		while(level.var_31D attackbuttonpressed())
		{
			self method_8145(param_01);
			wait(var_02 / 6);
		}

		if(1)
		{
			level.var_31D.var_7678.intensity = level.var_31D.var_7678.intensity - 0.1;
		}
	}
}

//Function Number: 27
lib_A62D::func_057A(param_00)
{
	return "( " + param_00[0] + " , " + param_00[1] + ", " + param_00[2] + " )";
}

//Function Number: 28
lib_A62D::func_0692()
{
	for(;;)
	{
		var_00 = self veh_getbodyvelocity();
		var_01 = length(var_00);
		if(1)
		{
			if(var_01 > 100)
			{
				if(!isdefined(self.var_5F5A))
				{
					level.var_31D.var_7678.intensity = level.var_31D.var_7678.intensity + 0.01;
					self.var_5F5A = 1;
				}
			}
			else if(isdefined(self.var_5F5A))
			{
				level.var_31D.var_7678.intensity = level.var_31D.var_7678.intensity - 0.01;
				self.var_5F5A = undefined;
			}
		}

		var_02 = 400;
		var_03 = 0;
		var_04 = 0;
		var_05 = 4;
		if(var_00[1] < 0)
		{
			var_06 = clamp(var_00[1] * -1,0,var_02);
			var_03 = var_06 / var_02;
		}
		else if(var_00[1] > 0)
		{
			var_07 = clamp(var_00[1],0,var_02);
			var_04 = var_07 / var_02;
		}

		var_08 = -1 * var_03 * var_05 + var_04 * var_05;
		var_09 = 0;
		var_0A = 0;
		var_0B = 1;
		if(var_00[0] < 0)
		{
			var_0C = clamp(var_00[0] * -1,0,var_02);
			var_09 = var_0C / var_02;
		}
		else if(var_00[0] > 0)
		{
			var_0D = clamp(var_00[0],0,var_02);
			var_0A = var_0D / var_02;
		}

		var_0E = -1 * var_09 * var_0B + var_0A * var_0B;
		self.var_9ED8 method_80A7(level.var_31D);
		self.var_9ED9 method_80A7(level.var_31D);
		self.var_9ED8 method_80A6(level.var_31D,"tag_origin",(-5,0,-1.75),(var_0E,0,var_08),1);
		self.var_9ED9 method_80A6(level.var_31D,"tag_origin",(6,0,-3),(var_0E,0,var_08),1);
		wait 0.05;
	}
}

//Function Number: 29
lib_A62D::func_0690()
{
	var_00 = spawn("script_model",self.var_2E6);
	var_00 setmodel("vehicle_sniper_drone_outerparts");
	var_00 method_80A6(level.var_31D,"tag_origin",(6,0,-3),(0,0,0),1);
	var_00 childthread lib_A62D::func_068F(%sniper_drone_outerparts_idle,%sniper_drone_outerparts_fire);
	self.var_9ED9 = var_00;
	var_01 = spawn("script_model",self.var_2E6);
	var_01 setmodel("vehicle_vm_sniper_drone");
	var_01 method_80A6(level.var_31D,"tag_origin",(-5,0,-1.75),(0,0,0),1);
	var_01 childthread lib_A62D::func_068F(%sniper_drone_vm_idle,%sniper_drone_vm_fire);
	self.var_9ED8 = var_01;
	childthread lib_A62D::func_0692();
}

//Function Number: 30
lib_A62D::func_0691()
{
	self.var_9ED9 method_80A7(level.var_31D);
	self.var_9ED9 delete();
	self.var_9ED8 method_80A7(level.var_31D);
	self.var_9ED8 delete();
}

//Function Number: 31
lib_A62D::func_05F9()
{
	for(;;)
	{
		setomnvar("ui_assaultdrone_threat_count",self.var_4AD4.size);
		self waittill("update_threat_count");
	}
}

//Function Number: 32
lib_A62D::func_0620(param_00)
{
	param_00 common_scripts\utility::waittill_either("death","fake_death");
	self.var_4AD4 = common_scripts\utility::array_remove(self.var_4AD4,param_00);
	self.var_4AD4 = lib_A59A::func_733C(self.var_4AD4);
	self notify("update_threat_count");
	if(self.var_4AD4.size == 0)
	{
		self notify("all_threats_eliminated");
	}
}

//Function Number: 33
lib_A62D::func_0637(param_00)
{
	param_00 hudoutlineenable(1,1,0);
	childthread lib_A62D::func_0620(param_00);
}

//Function Number: 34
lib_A62D::func_0638(param_00)
{
	for(;;)
	{
		param_00 waittill("spawned",var_01);
		self.var_4AD4 = common_scripts\utility::array_add(self.var_4AD4,var_01);
		lib_A62D::func_0637(var_01);
	}
}

//Function Number: 35
lib_A62D::func_05E8()
{
	var_00 = common_scripts\utility::array_combine(function_00D8(),veh_getspawnerarray());
	foreach(var_02 in var_00)
	{
		childthread lib_A62D::func_0638(var_02);
	}
}

//Function Number: 36
lib_A62D::func_0631()
{
	self.var_4AD4 = function_00D6("axis");
	self.var_4AB1 = function_00D6("allies");
	if(isdefined(self.var_9D4C))
	{
		var_00 = [];
		foreach(var_02 in getarraykeys(self.var_9D4C))
		{
			var_00 = common_scripts\utility::array_combine(var_00,getentarray(self.var_9D4C[var_02],var_02));
		}

		self.var_4AD4 = common_scripts\utility::array_combine(self.var_4AD4,var_00);
	}

	if(isdefined(self.var_32E9))
	{
		var_04 = [];
		foreach(var_02 in getarraykeys(self.var_32E9))
		{
			var_04 = common_scripts\utility::array_combine(var_04,getentarray(self.var_32E9[var_02],var_02));
		}

		self.var_4AD4 = common_scripts\utility::array_combine(self.var_4AD4,var_04);
	}

	foreach(var_08 in self.var_4AD4)
	{
		lib_A62D::func_0637(var_08);
	}

	childthread lib_A62D::func_05E8();
	childthread lib_A62D::func_05F9();
	foreach(var_0B in self.var_4AB1)
	{
		var_0B hudoutlineenable(6,1,0);
	}
}

//Function Number: 37
lib_A62D::func_0624()
{
	var_00 = common_scripts\utility::array_combine(self.var_4AD4,self.var_4AB1);
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02) && !function_0294(var_02))
		{
			var_02 hudoutlinedisable();
		}
	}
}

//Function Number: 38
lib_A62D::func_6795(param_00,param_01,param_02)
{
	level.var_31D endon("drone_exit");
	lib_A62D::func_062D();
	lib_A62D::func_0630();
	level.var_1ADC = 0;
	level.var_31D method_80EF();
	if(isdefined(param_00) && param_00)
	{
		childthread lib_A62D::func_060A(param_01);
	}

	if(!isdefined(param_01))
	{
		self.var_780D.var_74D5 = level.var_31D common_scripts\utility::spawn_tag_origin();
	}
	else
	{
		self.var_780D.var_74D5 = param_01;
	}

	self.var_610E = param_02;
	level.var_31D lib_A59A::func_9237(self);
	level.var_31D drivevehicleandcontrolturret(self,0);
	if(1)
	{
		level.var_31D.var_7678 = lib_A59A::func_3E56("steady_rumble");
		level.var_31D.var_7678.intensity = 0.088;
	}

	self.turret useby(level.var_31D);
	self.turret makeunusable();
	level.var_31D method_80F4();
	level.var_31D.var_5016 = 1;
	self hide();
	self sentient_makeentitysentient("allies");
	lib_A62D::func_0690();
	lib_A571::func_4860();
	lib_A62D::func_0643();
	lib_A62D::func_0642();
	thread lib_A62D::func_0623();
	lib_A62D::func_0631();
	childthread lib_A62D::func_05E2();
}

//Function Number: 39
lib_A62D::func_679A()
{
	return isdefined(level.var_31D.var_5016) && level.var_31D.var_5016;
}

//Function Number: 40
lib_A62D::func_0609()
{
	wait(0.2);
	level.var_31D lib_A571::func_825D();
	level.var_31D freezecontrols(0);
}

//Function Number: 41
lib_A62D::func_6794()
{
	wait(0.25);
	var_00 = self gettagorigin("tag_origin");
	radiusdamage(var_00,256,250,50,level.var_31D);
	playfx(common_scripts\utility::getfx("pdrone_large_death_explosion"),var_00);
	lib_A5DE::snd_message("pdrone_death_explode");
}

//Function Number: 42
lib_A62D::func_6796(param_00)
{
	lib_A62D::func_6797();
	lib_A62D::func_0621();
	level.var_1ADC = 1;
	lib_A571::func_84E3();
	level.var_31D freezecontrols(1);
	level.var_31D lib_A571::func_825E();
	if(isalive(level.var_31D))
	{
		thread lib_A541::func_4F8F("black",0.1,0.3,0.3);
		wait(0.35);
		lib_A62D::func_060B();
		lib_A62D::func_0622();
		lib_A62D::func_0625();
		lib_A62D::func_0627();
		if(1)
		{
			level.var_31D stoprumble("steady_rumble");
			if(isdefined(level.var_31D.var_7678))
			{
				level.var_31D.var_7678 delete();
			}
		}

		if(level.var_31D.var_5016)
		{
			level.var_31D drivevehicleandcontrolturretoff(self);
			level.var_31D.var_5016 = 0;
			self.turret delete();
		}

		level.var_31D method_80F0();
		lib_A62D::func_0691();
		lib_A62D::func_0624();
		if(isdefined(self.var_610E) && self.var_4AD4.size < 2)
		{
			self.var_780D.var_74D5 = self.var_610E;
		}

		if(isdefined(self.var_780D.var_74D5))
		{
			level.var_31D lib_A59A::func_9237(self.var_780D.var_74D5);
		}

		if(isdefined(self.var_6BC7) && self.var_6BC7)
		{
			var_01 = level.var_31D.health * 0.2 / level.var_31D.var_100;
			level.var_31D dodamage(var_01,self.var_2E6,level.var_31D);
		}

		if(self.var_255B <= 0 && distance(self.var_780D.var_74D5.var_2E6,self.var_2E6) > 150)
		{
			thread lib_A62D::func_6794();
		}

		if(isdefined(param_00) && param_00)
		{
			lib_A62D::func_060D();
		}

		thread lib_A62D::func_0609();
	}
}

//Function Number: 43
lib_A62D::func_05E6(param_00,param_01,param_02,param_03)
{
	var_04 = newclienthudelem(level.var_31D);
	var_04.x = 0;
	var_04.y = 0;
	if(param_02)
	{
		var_04.horzalign = "fullscreen";
		var_04.vertalign = "fullscreen";
	}
	else
	{
		var_04.horzalign = "center";
		var_04.vertalign = "middle";
	}

	var_04.fontscale = param_03;
	var_04 setshader(param_00,640,480);
	var_04.alpha = param_01;
	return var_04;
}

//Function Number: 44
lib_A62D::func_0643()
{
	self.var_65F6 = lib_A62D::func_05E6("overlay_static_digital",0,1,0);
}

//Function Number: 45
lib_A62D::func_0642()
{
	setomnvar("ui_assaultdrone_toggle",1);
}

//Function Number: 46
lib_A62D::func_0625()
{
	self.var_65F6 destroy();
}

//Function Number: 47
lib_A62D::func_0622()
{
	setomnvar("ui_assaultdrone_toggle",0);
}

//Function Number: 48
lib_A62D::func_0623()
{
	level waittill("missionfailed");
	if(isdefined(self) && lib_A62D::func_679A())
	{
		lib_A62D::func_0622();
	}
}

//Function Number: 49
lib_A62D::func_0632(param_00)
{
	self.var_65F6.alpha = param_00;
}

//Function Number: 50
lib_A62D::func_05E7(param_00)
{
	var_01 = param_00;
	var_02 = 0.05;
	while(var_01 >= 0)
	{
		setomnvar("ui_assaultdrone_countdown",param_00 - var_01);
		wait(var_02);
		var_01 = var_01 - var_02;
	}

	lib_A62D::func_6797();
}

//Function Number: 51
lib_A62D::func_058C(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	level.var_31D dodamage(1,param_00.var_2E6,param_00);
}

//Function Number: 52
lib_A62D::func_05FB()
{
	level.var_31D endon("drone_exit");
	var_00 = 1;
	var_01 = common_scripts\utility::spawn_tag_origin();
	for(;;)
	{
		var_01.var_2E6 = self.var_2E6;
		var_01.var_41 = self.var_41;
		var_02 = var_01 getistouchingentities(self.var_25F5.var_9F34);
		if(!isdefined(var_02) || !isarray(var_02) || var_02.size == 0)
		{
			var_03 = 50 * var_00;
			self notify("damage",var_03);
			var_00 = var_00 * self.var_5895;
			setomnvar("ui_assaultdrone_connection",0);
		}
		else
		{
			if(var_00 > 1)
			{
				var_00 = var_00 / self.var_5895;
				var_00 = max(1,var_00);
			}

			setomnvar("ui_assaultdrone_connection",1);
		}

		wait(0.25);
	}
}

//Function Number: 53
lib_A62D::func_05F5()
{
	for(;;)
	{
		self waittill("damage",var_00,var_01);
		thread lib_A62D::func_058C(var_01);
		self.var_558B = gettime();
		self.var_255B = self.var_255B - var_00;
		if(self.var_255B <= 0)
		{
			self notify("custom_death");
			break;
		}
	}
}

//Function Number: 54
lib_A62D::func_05F7()
{
	self.var_2B24 = 0;
	for(;;)
	{
		if(!self.var_2B24 && gettime() - self.var_558B > 1000)
		{
			self.var_255B = min(self.var_255B + 10,self.var_2561);
		}

		wait 0.05;
	}
}

//Function Number: 55
lib_A62D::func_05F8()
{
	self.var_359F = 0;
	for(;;)
	{
		var_00 = 1 - self.var_255B / self.var_2561;
		var_00 = var_00 * 0.3;
		var_00 = var_00 + self.var_359F;
		lib_A62D::func_0632(var_00);
		wait 0.05;
	}
}

//Function Number: 56
lib_A62D::func_05FA()
{
	for(;;)
	{
		self waittill("touch",var_00);
		if(isai(var_00))
		{
			self notify("damage",4000);
			if(isdefined(var_00.targetname) && issubstr(var_00.targetname,"pdrone_player_proxy"))
			{
				var_00 dodamage(100,self.var_2E6,level.var_31D);
			}
			else if(var_00.inliveplayerkillstreak != "allies")
			{
				var_00 method_8052();
			}
		}

		wait 0.05;
	}
}

//Function Number: 57
lib_A62D::func_0561()
{
	self.var_359F = 0.5;
	while(self.var_359F > 0)
	{
		wait(0.15);
		self.var_359F = self.var_359F - 0.05;
	}

	self.var_359F = 0;
}

//Function Number: 58
lib_A62D::func_05F6()
{
	self.var_2561 = 4000;
	self.var_255B = self.var_2561;
	self.var_558B = gettime();
	childthread lib_A62D::func_05F5();
	childthread lib_A62D::func_05F7();
	childthread lib_A62D::func_05F8();
	childthread lib_A62D::func_0561();
	childthread lib_A62D::func_05FA();
	if(isdefined(self.var_25F5.var_9F38))
	{
		self.var_25F5.var_9F34 = getentarray(self.var_25F5.var_9F38,"targetname");
		childthread lib_A62D::func_05FB();
	}

	self waittill("custom_death");
	var_00 = 0.3;
	while(var_00 <= 1)
	{
		var_00 = var_00 + 0.05;
		lib_A62D::func_0632(var_00);
		wait 0.05;
	}

	lib_A62D::func_6797();
}

//Function Number: 59
lib_A62D::func_05F4()
{
	self endon("monitor_controls_end");
	var_00 = spawnstruct();
	self.var_217F = var_00;
	var_00 lib_A59A::func_32DC("move_done");
	var_00 lib_A59A::func_32DC("steer_done");
	var_00 lib_A59A::func_32DC("attack_done");
	var_00 lib_A59A::func_32DC("ads_done");
	var_00 lib_A59A::func_32DC("up_done");
	var_00 lib_A59A::func_32DC("down_done");
	while(!var_00 lib_A59A::func_32D7("move_done") || !var_00 lib_A59A::func_32D7("steer_done") || !var_00 lib_A59A::func_32D7("attack_done") || !var_00 lib_A59A::func_32D7("ads_done") || !var_00 lib_A59A::func_32D7("up_done") || !var_00 lib_A59A::func_32D7("down_done"))
	{
		var_01 = level.var_31D getnormalizedmovement();
		if(length(var_01) > 0.1)
		{
			var_00 lib_A59A::func_32DD("move_done");
		}

		var_01 = level.var_31D getnormalizedcameramovement();
		if(length(var_01) > 0.1 || !level.var_31D method_834E())
		{
			var_00 lib_A59A::func_32DD("steer_done");
		}

		if(level.var_31D attackbuttonpressed())
		{
			var_00 lib_A59A::func_32DD("attack_done");
		}

		if(level.var_31D adsbuttonpressed())
		{
			var_00 lib_A59A::func_32DD("ads_done");
		}

		if(level.var_31D fragbuttonpressed())
		{
			var_00 lib_A59A::func_32DD("up_done");
		}

		if(level.var_31D secondaryoffhandbuttonpressed())
		{
			var_00 lib_A59A::func_32DD("down_done");
		}

		wait 0.05;
	}
}

//Function Number: 60
lib_A62D::func_064B()
{
	childthread lib_A62D::func_05F4();
	setomnvar("ui_assaultdrone_controls",0);
	setomnvar("ui_assaultdrone_controls_exit",0);
	wait(1);
	var_00 = self.var_217F;
	setomnvar("ui_assaultdrone_controls",1);
	var_00 lib_A59A::func_32DF("move_done");
	var_00 lib_A59A::func_32DF("steer_done");
	setomnvar("ui_assaultdrone_controls",0);
	wait(1);
	setomnvar("ui_assaultdrone_controls",2);
	var_00 lib_A59A::func_32DF("attack_done");
	var_00 lib_A59A::func_32DF("ads_done");
	setomnvar("ui_assaultdrone_controls",0);
	wait(1);
	setomnvar("ui_assaultdrone_controls_exit",1);
	setomnvar("ui_assaultdrone_controls",3);
	var_00 lib_A59A::func_32DF("up_done");
	var_00 lib_A59A::func_32DF("down_done");
	setomnvar("ui_assaultdrone_controls",0);
}

//Function Number: 61
lib_A62D::func_679B()
{
	level.var_31D endon("drone_exit");
	level.var_31D endon("death");
	childthread lib_A62D::func_05F6();
	childthread lib_A62D::func_064B();
	if(isdefined(self.time) && self.time > 0)
	{
		childthread lib_A62D::func_05E7(self.time);
	}

	for(;;)
	{
		self.var_275 = 500000;
		self.health = self.var_275;
		wait 0.05;
	}
}

//Function Number: 62
lib_A62D::func_6798()
{
	return self.var_25F5.var_24E7;
}

//Function Number: 63
lib_A62D::func_6797()
{
	if(!isdefined(self.var_505B))
	{
		return;
	}

	level.var_31D notify("drone_exit");
}

//Function Number: 64
lib_A62D::func_678D(param_00,param_01)
{
	if(!isdefined(self.var_9D4C))
	{
		self.var_9D4C = [];
	}

	self.var_9D4C[param_00] = param_01;
}

//Function Number: 65
lib_A62D::func_678C(param_00,param_01)
{
	if(!isdefined(self.var_32E9))
	{
		self.var_32E9 = [];
	}

	self.var_32E9[param_00] = param_01;
}

//Function Number: 66
lib_A62D::func_05E4(param_00)
{
	for(;;)
	{
		level.var_31D waittill("hold_to_exit_start");
		param_00 lib_A59A::func_32DD("exit_button_pressed");
		level.var_31D waittill("hold_to_exit_stop");
		param_00 lib_A59A::func_32D9("exit_button_pressed");
	}
}

//Function Number: 67
lib_A62D::func_05E3()
{
	var_00 = spawnstruct();
	var_00 lib_A59A::func_32DC("exit_button_pressed");
	childthread lib_A62D::func_05E4(var_00);
	for(;;)
	{
		var_00 lib_A59A::func_32DF("exit_button_pressed");
		var_01 = 0;
		while(var_00 lib_A59A::func_32D7("exit_button_pressed"))
		{
			if(var_01 >= 1 || !level.var_31D method_834E())
			{
				level.var_31D notify("drone_exit");
				break;
			}

			wait 0.05;
			var_01 = var_01 + 0.05;
		}
	}
}

//Function Number: 68
lib_A62D::func_05E2()
{
	level.var_31D notifyonplayercommand("weapon_fired","+attack");
	if(isdefined(self.var_25F5.var_6AB8))
	{
		wait(2);
		level.var_31D notifyonplayercommand("hold_to_exit_start","+" + self.var_25F5.var_6AB8);
		level.var_31D notifyonplayercommand("hold_to_exit_stop","-" + self.var_25F5.var_6AB8);
		childthread lib_A62D::func_05E3();
	}
}

//Function Number: 69
lib_A62D::func_0621()
{
	if(isdefined(self.var_25F5.var_6AB8))
	{
		function_028B("hold_to_exit_start","+" + self.var_25F5.var_6AB8);
		function_028B("hold_to_exit_stop","-" + self.var_25F5.var_6AB8);
	}
}