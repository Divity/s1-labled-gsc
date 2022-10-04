/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42293.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 19
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:23:17 PM
*******************************************************************/

//Function Number: 1
lib_A535::func_4CF7()
{
	level.var_4809 = ::lib_A535::func_47BB;
	level.var_1D61 = ::lib_A535::func_1D5C;
	level.var_1D60 = ::lib_A535::func_1D5B;
}

//Function Number: 2
lib_A535::func_1D5B()
{
	self notify("mg_off");
}

//Function Number: 3
lib_A535::func_1D5C()
{
	self endon("death");
	self endon("mg_off");
	var_00 = cos(55);
	while(self.health > 0)
	{
		var_01 = lib_A535::func_3F7D(16000,var_00,1,1);
		if(isdefined(var_01))
		{
			thread lib_A535::func_83EA(var_01);
		}

		wait(2);
	}
}

//Function Number: 4
lib_A535::func_47BB(param_00)
{
	var_01 = getent(param_00.script_linkto,"script_linkname");
	var_02 = !isdefined(var_01);
	if(!isdefined(var_01))
	{
		var_01 = common_scripts\utility::getstruct(param_00.script_linkto,"script_linkname");
	}

	var_03 = param_00.var_79CA;
	if(var_02)
	{
		var_01 = var_01 common_scripts\utility::spawn_tag_origin();
	}

	switch(var_03)
	{
		case "zippy_burst":
			break;

		case "apache_zippy":
			break;

		case "hind_rpg":
			break;

		default:
			break;
	}
}

//Function Number: 5
lib_A535::func_4230()
{
	if(!isdefined(self.vehicletype))
	{
		return;
	}

	var_00 = 0;
	if(self.vehicletype == "hind" || self.vehicletype == "hind_blackice" || self.vehicletype == "ny_harbor_hind")
	{
		var_00 = 1;
	}

	if(self.vehicletype == "cobra" || self.vehicletype == "cobra_player")
	{
		thread lib_A535::func_0E07("chopperpilot_hellfire","cobra_Sidewinder");
		if(isdefined(self.var_3ADF))
		{
			self.var_3ADF thread lib_A535::func_0E07("chopperpilot_hellfire","cobra_Sidewinder");
		}

		var_00 = 1;
	}

	if(!var_00)
	{
		return;
	}

	level thread lib_A535::func_3899(self);
	level thread lib_A534::func_33BD(self);
	if(getdvar("cobrapilot_wingman_enabled") == "1")
	{
		if(isdefined(self.var_7B1F))
		{
			level.var_A336 = self;
			level thread lib_A534::func_A338(self);
		}
	}
}

//Function Number: 6
lib_A535::func_3899(param_00)
{
	param_00 endon("death");
	function_000E("flare_button","+frag");
	function_000E("flare_button","+usereload");
	function_000E("flare_button","+activate");
	while(param_00.health > 0)
	{
		if(isdefined(param_00.var_6C7B))
		{
			param_00.var_681D waittill("flare_button");
		}
		else
		{
			param_00 waittill("incomming_missile",var_01);
			if(!isdefined(var_01))
			{
				continue;
			}

			if(randomint(3) == 0)
			{
				continue;
			}

			wait(randomfloatrange(0.5,1));
		}

		thread lib_A535::func_3894(param_00);
		wait(3);
	}
}

//Function Number: 7
lib_A535::func_3895(param_00,param_01,param_02,param_03)
{
	var_04 = 1;
	for(var_05 = 0;var_05 < param_01;var_05++)
	{
		playfx(level.var_388F[param_00.vehicletype],param_00 gettagorigin("tag_flare"));
		if(isdefined(param_00.var_6C7B))
		{
			level.stats["flares_used"]++;
			param_00 notify("dropping_flares");
			if(var_04)
			{
				param_00 playsoundasmaster("cobra_flare_fire");
			}

			var_04 = !var_04;
		}

		if(var_05 <= param_02 - 1)
		{
			thread lib_A535::func_3898(param_00,param_03);
		}

		wait(0.1);
	}
}

//Function Number: 8
lib_A535::func_3894(param_00)
{
	param_00 endon("death");
	var_01 = 5;
	if(isdefined(param_00.var_388E))
	{
		var_01 = param_00.var_388E;
	}

	lib_A535::func_3895(param_00,8,1,var_01);
}

//Function Number: 9
lib_A535::func_23CD()
{
	if(isdefined(self.var_5CB1))
	{
		missiledeleteattractor(self.var_5CB1);
	}

	self.var_5CB1 = missilecreateattractorent(self.var_1C15,10000,10000);
}

//Function Number: 10
lib_A535::func_3898(param_00,param_01)
{
	param_00 notify("flares_out");
	param_00 endon("death");
	param_00 endon("flares_out");
	if(!isdefined(param_01))
	{
		param_01 = 5;
	}

	var_02 = lib_A535::func_3896(param_00);
	var_03 = spawn("script_origin",param_00 gettagorigin("tag_flare"));
	var_03 gravitymove(var_02,param_01);
	var_04 = undefined;
	if(isdefined(param_00.var_6C7B))
	{
		if(isdefined(param_00.var_5CB1))
		{
			missiledeleteattractor(param_00.var_5CB1);
		}

		var_04 = missilecreateattractorent(var_03,10000,10000);
	}

	if(isdefined(param_00.var_4C2A))
	{
		for(var_05 = 0;var_05 < param_00.var_4C2A.size;var_05++)
		{
			param_00.var_4C2A[var_05] missilesettargetent(var_03);
		}
	}

	wait(param_01);
	if(isdefined(param_00.var_6C7B))
	{
		if(isdefined(var_04))
		{
			missiledeleteattractor(var_04);
		}

		param_00 thread lib_A535::func_23CD();
	}

	if(!isdefined(param_00.var_7AE7))
	{
		param_00.var_7AE7 = 0;
	}

	var_06 = (0,0,param_00.var_7AE7);
	if(!isdefined(param_00.var_4C2A))
	{
		return;
	}

	for(var_05 = 0;var_05 < param_00.var_4C2A.size;var_05++)
	{
		param_00.var_4C2A[var_05] missilesettargetent(param_00,var_06);
	}
}

//Function Number: 11
lib_A535::func_3896(param_00)
{
	var_01 = param_00.var_2E6;
	wait(0.05);
	var_02 = param_00.var_2E6 - var_01;
	return var_02 * 20;
}

//Function Number: 12
lib_A535::func_5C8C(param_00,param_01)
{
	param_01 endon("death");
	param_00 waittill("death");
	if(!isdefined(param_01.var_4C2A))
	{
		return;
	}

	param_01.var_4C2A = common_scripts\utility::array_remove(param_01.var_4C2A,param_00);
}

//Function Number: 13
lib_A535::func_3F7D(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	if(!isdefined(param_05))
	{
		param_05 = 0;
	}

	var_07 = [];
	var_08 = undefined;
	var_09 = common_scripts\utility::get_enemy_team(self.var_7AE9);
	var_0A = [];
	if(param_04)
	{
		for(var_0B = 0;var_0B < level.var_9D72[var_09].size;var_0B++)
		{
			var_0A[var_0A.size] = level.var_9D72[var_09][var_0B];
		}
	}

	if(param_02)
	{
		var_0C = function_00D6(var_09);
		for(var_0B = 0;var_0B < var_0C.size;var_0B++)
		{
			if(isdefined(var_0C[var_0B].var_4BAF))
			{
				continue;
			}

			var_0A[var_0A.size] = var_0C[var_0B];
		}

		if(var_09 == "allies")
		{
			for(var_0B = 0;var_0B < level.var_328.size;var_0B++)
			{
				var_0A[var_0A.size] = level.var_328[var_0B];
			}
		}
	}

	if(isdefined(param_06))
	{
		var_0A = lib_A59A::func_CE7(var_0A,param_06);
	}

	if(param_05)
	{
		var_0A = common_scripts\utility::array_randomize(var_0A);
	}

	var_0D = anglestoforward(self.var_41);
	for(var_0B = 0;var_0B < var_0A.size;var_0B++)
	{
		if(issentient(var_0A[var_0B]) && issentient(self) && self sentient_getthreatbiasgroup() != "")
		{
			var_0E = getthreatbias(var_0A[var_0B] sentient_getthreatbiasgroup(),self sentient_getthreatbiasgroup());
			if(var_0E <= -1000000)
			{
				continue;
			}
		}

		if(isdefined(param_00) && param_00 > 0)
		{
			if(distance(self.var_2E6,var_0A[var_0B].var_2E6) > param_00)
			{
				continue;
			}
		}

		if(isdefined(param_01))
		{
			var_0F = vectornormalize(var_0A[var_0B].var_2E6 - self.var_2E6);
			var_10 = vectordot(var_0D,var_0F);
			if(var_10 <= param_01)
			{
				continue;
			}
		}

		if(param_03)
		{
			var_11 = 0;
			if(isai(var_0A[var_0B]))
			{
				var_12 = 48;
			}
			else
			{
				var_12 = 150;
			}

			var_11 = sighttracepassed(self.var_2E6,var_0A[var_0B].var_2E6 + (0,0,var_12),0,self);
			if(!var_11)
			{
				continue;
			}
		}

		var_07[var_07.size] = var_0A[var_0B];
	}

	if(var_07.size == 0)
	{
		self notify("gunner_new_target",var_08);
		return var_08;
	}

	if(var_07.size == 1)
	{
		self notify("gunner_new_target",var_07[0]);
		return var_07[0];
	}

	var_13 = common_scripts\utility::getclosest(self.var_2E6,var_07);
	self notify("gunner_new_target",var_13);
	return var_13;
}

//Function Number: 14
lib_A535::func_83EA(param_00)
{
	self endon("death");
	self endon("mg_off");
	param_00 endon("death");
	self endon("gunner_new_target");
	if(isdefined(self.var_6C7B))
	{
		self endon("gunner_stop_firing");
	}

	var_01 = (0,0,0);
	if(isdefined(param_00.var_7AE7))
	{
		var_01 = var_01 + (0,0,param_00.var_7AE7);
	}
	else if(issentient(param_00))
	{
		var_01 = (0,0,32);
	}

	self veh_setturrettargetent(param_00,var_01);
	while(self.health > 0)
	{
		var_02 = randomintrange(1,25);
		if(getdvar("cobrapilot_debug") == "1")
		{
			iprintln("randomShots = " + var_02);
		}

		for(var_03 = 0;var_03 < var_02;var_03++)
		{
			if(isdefined(self.var_6C7B))
			{
				if(isdefined(level.var_1FFF) && level.var_1FFF.size > 0)
				{
					self veh_setweapon(level.var_4475);
				}
			}

			thread lib_A535::func_83EB(self,"tag_turret",param_00,var_01,(1,1,0),0.05);
			self veh_fireweapon("tag_flash");
			if(isdefined(self.var_6C7B))
			{
				self veh_setweapon(level.var_1FFF[self.var_681D.currentweapon].v["weapon"]);
			}

			wait(0.05);
		}

		wait(randomfloatrange(0.25,2.5));
	}
}

//Function Number: 15
lib_A535::func_83EB(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(getdvar("cobrapilot_debug") != "1")
	{
		return;
	}

	if(!isdefined(param_04))
	{
		param_04 = (0,0,0);
	}

	param_02 endon("death");
	self endon("gunner_new_target");
	if(!isdefined(param_03))
	{
		param_03 = (0,0,0);
	}

	if(isdefined(param_05))
	{
		param_05 = gettime() + param_05 * 1000;
		while(gettime() < param_05)
		{
			wait(0.05);
		}

		return;
	}

	wait(0.05);
}

//Function Number: 16
lib_A535::func_0E07(param_00,param_01,param_02,param_03)
{
	self.var_4719 = 1;
	var_04 = [];
	var_04[0] = param_00;
	if(isdefined(param_01))
	{
		var_04[1] = param_01;
	}

	if(isdefined(param_02))
	{
		var_04[2] = param_02;
	}

	if(isdefined(param_03))
	{
		var_04[3] = param_03;
	}

	for(var_05 = 0;var_05 < var_04.size;var_05++)
	{
		for(var_06 = 0;var_06 < level.var_1FFD[var_04[var_05]].size;var_06++)
		{
			self attach(level.var_1FFC[var_04[var_05]],level.var_1FFD[var_04[var_05]][var_06]);
		}
	}
}

//Function Number: 17
lib_A535::func_37B8(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	var_05 = undefined;
	var_06 = undefined;
	var_07 = "cobra_20mm";
	var_08 = [];
	switch(param_00)
	{
		case "f15_missile":
			break;

		case "mi28_seeker":
			break;

		case "ffar":
			break;

		case "seeker":
			break;

		case "ffar_bog_a_lite":
			break;

		case "ffar_airlift":
			break;

		case "ffar_airlift_nofx":
			break;

		case "cobra_zippy":
			break;

		case "apache_zippy":
			break;

		case "apache_zippy_nd":
			break;

		case "mi28_zippy":
			break;

		case "mi28_zippy_cheap":
			break;

		case "cobra_turret":
			break;

		case "ffar_hind":
			break;

		case "hind_zippy":
			break;

		case "hind_rpg":
			break;

		case "hind_rpg_cheap":
			break;

		case "ffar_hind_nodamage":
			break;

		case "ffar_mi28_village_assault":
			break;

		case "ffar_co_rescue":
			break;

		default:
			break;
	}
}

//Function Number: 18
lib_A535::func_27D8(param_00,param_01,param_02,param_03,param_04)
{
	wait(param_00);
	earthquake(param_01,param_02,param_03,param_04);
}

//Function Number: 19
lib_A535::func_5CBB(param_00)
{
	self endon("death");
	wait(param_00);
	if(isdefined(self))
	{
		self missilecleartarget();
	}
}