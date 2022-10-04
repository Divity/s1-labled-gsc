/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: notetracks.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 67
 * Decompile Time: 2512 ms
 * Timestamp: 4/20/2022 8:20:39 PM
*******************************************************************/

//Function Number: 1
func_619A(param_00)
{
	if(isdefined(self) && soundexists(param_00))
	{
		self playsoundasmaster(param_00);
	}
}

//Function Number: 2
func_4655(param_00)
{
	switch(param_00)
	{
		case "fs_bk_r_lg":
		case "fs_bk_l_lg":
		case "fs_fr_r_lg":
		case "fs_fr_l_lg":
		case "fs_bk_r_sm":
		case "fs_bk_l_sm":
		case "fs_fr_r_sm":
		case "fs_fr_l_sm":
		case "footstep_back_right_large":
		case "footstep_back_left_large":
		case "footstep_front_right_large":
		case "footstep_front_left_large":
		case "footstep_back_right_small":
		case "footstep_back_left_small":
		case "footstep_front_right_small":
		case "footstep_front_left_small":
			break;
	}
}

//Function Number: 3
func_4656(param_00)
{
	if(func_4655(param_00))
	{
		return 1;
	}

	if(param_00 == "sound_dogstep_run_default")
	{
		func_619A("dogstep_run_default");
		return 1;
	}

	var_01 = getsubstr(param_00,0,5);
	if(var_01 != "sound")
	{
		return 0;
	}

	var_02 = "anml" + getsubstr(param_00,5);
	if(soundexists(var_02))
	{
		if(isalive(self))
		{
			thread lib_A59A::func_69C3(var_02,"tag_eye");
		}
		else
		{
			thread common_scripts\utility::play_sound_in_space(var_02,self geteye());
		}
	}

	return 1;
}

//Function Number: 4
func_443D()
{
	return isdefined(self.var_7A06);
}

//Function Number: 5
func_72F0()
{
	level.var_61E2["anim_pose = \"stand\"] = ::func_61DE;
	level.var_61E2["anim_pose = \"crouch\"] = ::func_61DC;
	level.var_61E2["anim_pose = \"prone\"] = ::func_61DD;
	level.var_61E2["anim_pose = \"crawl\"] = ::func_61DB;
	level.var_61E2["anim_pose = \"back\"] = ::func_61DA;
	level.var_61E2["anim_movement = \"stop\"] = ::func_61D4;
	level.var_61E2["anim_movement = \"walk\"] = ::func_61D5;
	level.var_61E2["anim_movement = \"run\"] = ::func_61D3;
	level.var_61E2["anim_aiming = 1"] = ::func_61BB;
	level.var_61E2["anim_aiming = 0"] = ::func_61BC;
	level.var_61E2["anim_alertness = causal"] = ::func_61BD;
	level.var_61E2["anim_alertness = alert"] = ::func_61BC;
	level.var_61E2["anim_alertness = aiming"] = ::func_61BB;
	level.var_61E2["gunhand = (gunhand)_left"] = ::func_61CB;
	level.var_61E2["anim_gunhand = \"left\"] = ::func_61CB;
	level.var_61E2["gunhand = (gunhand)_right"] = ::func_61CB;
	level.var_61E2["anim_gunhand = \"right\"] = ::func_61CB;
	level.var_61E2["anim_gunhand = \"none\"] = ::func_61CB;
	level.var_61E2["gun drop"] = ::func_61CA;
	level.var_61E2["dropgun"] = ::func_61CA;
	level.var_61E2["gun_2_chest"] = ::func_61CD;
	level.var_61E2["gun_2_back"] = ::func_61CC;
	level.var_61E2["pistol_pickup"] = ::func_61D7;
	level.var_61E2["pistol_putaway"] = ::func_61D8;
	level.var_61E2["drop clip"] = ::func_61C2;
	level.var_61E2["refill clip"] = ::func_61DF;
	level.var_61E2["reload done"] = ::func_61DF;
	level.var_61E2["load_shell"] = ::func_61D1;
	level.var_61E2["pistol_rechamber"] = ::func_61D9;
	level.var_61E2["gravity on"] = ::func_61C9;
	level.var_61E2["gravity off"] = ::func_61C9;
	level.var_61E2["footstep_right_large"] = ::func_61C7;
	level.var_61E2["footstep_right_small"] = ::func_61C7;
	level.var_61E2["footstep_left_large"] = ::func_61C7;
	level.var_61E2["footstep_left_small"] = ::func_61C7;
	level.var_61E2["footscrape"] = ::func_61C6;
	level.var_61E2["land"] = ::func_61CF;
	level.var_61E2["bodyfall large"] = ::func_61BE;
	level.var_61E2["bodyfall small"] = ::func_61BE;
	level.var_61E2["pain_small"] = ::func_61D6;
	level.var_61E2["pain_large"] = ::func_61D6;
	level.var_61E2["meleeattack_eft"] = ::func_61D2;
	level.var_61E2["code_move"] = ::func_61BF;
	level.var_61E2["face_enemy"] = ::func_61C3;
	level.var_61E2["laser_on"] = ::func_61D0;
	level.var_61E2["laser_off"] = ::func_61D0;
	level.var_61E2["start_ragdoll"] = ::func_61F3;
	level.var_61E2["fire"] = ::func_61C4;
	level.var_61E2["fire_spray"] = ::func_61C5;
	level.var_61E2["bloodpool"] = ::animscripts\death::func_689E;
	level.var_61E2["space_jet_top"] = ::func_61F1;
	level.var_61E2["space_jet_top_1"] = ::func_61F1;
	level.var_61E2["space_jet_top_2"] = ::func_61F1;
	level.var_61E2["space_jet_bottom"] = ::func_61F1;
	level.var_61E2["space_jet_bottom_1"] = ::func_61F1;
	level.var_61E2["space_jet_bottom_2"] = ::func_61F1;
	level.var_61E2["space_jet_left"] = ::func_61F1;
	level.var_61E2["space_jet_left_1"] = ::func_61F1;
	level.var_61E2["space_jet_left_2"] = ::func_61F1;
	level.var_61E2["space_jet_right"] = ::func_61F1;
	level.var_61E2["space_jet_right_1"] = ::func_61F1;
	level.var_61E2["space_jet_right_2"] = ::func_61F1;
	level.var_61E2["space_jet_front"] = ::func_61F1;
	level.var_61E2["space_jet_front_1"] = ::func_61F1;
	level.var_61E2["space_jet_front_2"] = ::func_61F1;
	level.var_61E2["space_jet_back"] = ::func_61F1;
	level.var_61E2["space_jet_back_1"] = ::func_61F1;
	level.var_61E2["space_jet_back_2"] = ::func_61F1;
	level.var_61E2["space_jet_back_3"] = ::func_61F1;
	level.var_61E2["space_jet_back_4"] = ::func_61F1;
	level.var_61E2["space_jet_random"] = ::func_61F1;
	if(isdefined(level.var_601))
	{
		var_00 = getarraykeys(level.var_601);
		foreach(var_02 in var_00)
		{
			level.var_61E2[var_02] = ::func_2565;
		}
	}
}

//Function Number: 6
func_61C4(param_00,param_01)
{
	if(isdefined(level.var_37BD[self.script]))
	{
		thread [[ level.var_37BD[self.script] ]]();
		return;
	}

	thread [[ ::func_8407 ]]();
}

//Function Number: 7
func_61D0(param_00,param_01)
{
	if(issubstr(param_00,"on"))
	{
		self.var_7.var_54F8 = 1;
	}
	else
	{
		self.var_7.var_54F8 = 0;
	}

	animscripts\shared::func_9B25();
}

//Function Number: 8
func_61F4(param_00,param_01)
{
}

//Function Number: 9
func_9A2D()
{
	wait(0.1);
	if(isdefined(self))
	{
		self unlink();
	}
}

//Function Number: 10
func_61F3(param_00,param_01)
{
	if(isdefined(self.var_6156))
	{
		return;
	}

	if(isdefined(self.var_70DD))
	{
		return;
	}

	if(!isdefined(self.var_2D28))
	{
		thread func_9A2D();
	}

	self startragdoll();
}

//Function Number: 11
func_61D4(param_00,param_01)
{
	self.var_7.var_5F58 = "stop";
}

//Function Number: 12
func_61D5(param_00,param_01)
{
	self.var_7.var_5F58 = "walk";
}

//Function Number: 13
func_61D3(param_00,param_01)
{
	self.var_7.var_5F58 = "run";
}

//Function Number: 14
func_61BB(param_00,param_01)
{
}

//Function Number: 15
func_61BD(param_00,param_01)
{
}

//Function Number: 16
func_61BC(param_00,param_01)
{
}

//Function Number: 17
func_8EF7()
{
	animscripts\utility::func_3449(1);
	self.var_7.var_644E = undefined;
}

//Function Number: 18
func_7FEA(param_00)
{
	self.var_7.var_6E57 = param_00;
	if(isdefined(self.var_7.var_644E))
	{
		func_8EF7();
	}

	self notify("entered_pose" + param_00);
}

//Function Number: 19
func_61DE(param_00,param_01)
{
	if(self.var_7.var_6E57 == "prone")
	{
		self method_818F("face default");
		animscripts\utility::func_3449(1);
	}

	func_7FEA("stand");
}

//Function Number: 20
func_61DC(param_00,param_01)
{
	if(self.var_7.var_6E57 == "prone")
	{
		self method_818F("face default");
		animscripts\utility::func_3449(1);
	}

	func_7FEA("crouch");
}

//Function Number: 21
func_61DD(param_00,param_01)
{
	if(!issentient(self))
	{
		return;
	}

	self method_81FA(-45,45,%prone_legs_down,%exposed_aiming,%prone_legs_up);
	animscripts\utility::func_3307(1);
	func_7FEA("prone");
	if(isdefined(self.var_7.var_4258))
	{
		self.var_7.var_701E = 1;
		return;
	}

	self.var_7.var_701E = undefined;
}

//Function Number: 22
func_61DB(param_00,param_01)
{
	if(!issentient(self))
	{
		return;
	}

	self method_81FA(-45,45,%prone_legs_down,%exposed_aiming,%prone_legs_up);
	animscripts\utility::func_3307(1);
	func_7FEA("prone");
	self.var_7.var_701E = undefined;
}

//Function Number: 23
func_61DA(param_00,param_01)
{
	if(!issentient(self))
	{
		return;
	}

	func_7FEA("crouch");
	self.var_7.var_644E = 1;
	self.var_7.var_5F58 = "stop";
	self method_81FA(-90,90,%prone_legs_down,%exposed_aiming,%prone_legs_up);
	animscripts\utility::func_3307(1);
}

//Function Number: 24
func_61CB(param_00,param_01)
{
	if(issubstr(param_00,"left"))
	{
		animscripts\shared::func_6866(self.weapon,"left");
		self notify("weapon_switch_done");
		return;
	}

	if(issubstr(param_00,"right"))
	{
		animscripts\shared::func_6866(self.weapon,"right");
		self notify("weapon_switch_done");
		return;
	}

	if(issubstr(param_00,"none"))
	{
		animscripts\shared::func_6866(self.weapon,"none");
		return;
	}
}

//Function Number: 25
func_61CA(param_00,param_01)
{
	animscripts\shared::func_2F6A();
	self.var_560C = self.weapon;
}

//Function Number: 26
func_61CD(param_00,param_01)
{
	animscripts\shared::func_6866(self.weapon,"chest");
}

//Function Number: 27
func_61CC(param_00,param_01)
{
	animscripts\shared::func_6866(self.weapon,"back");
	self.weapon = animscripts\utility::func_4098();
	self.var_18B0 = weaponclipsize(self.weapon);
}

//Function Number: 28
func_61D7(param_00,param_01)
{
	animscripts\shared::func_6866(self.var_8557,"right");
	self.var_18B0 = weaponclipsize(self.weapon);
	self notify("weapon_switch_done");
}

//Function Number: 29
func_61D8(param_00,param_01)
{
	animscripts\shared::func_6866(self.weapon,"none");
	self.weapon = animscripts\utility::func_4098();
	self.var_18B0 = weaponclipsize(self.weapon);
}

//Function Number: 30
func_61C2(param_00,param_01)
{
	thread animscripts\shared::func_4658(param_01);
}

//Function Number: 31
func_61DF(param_00,param_01)
{
	animscripts\weaponlist::func_72AE();
	self.var_7.var_6081 = 0;
}

//Function Number: 32
func_61D1(param_00,param_01)
{
	func_619A("weap_reload_shotgun_loop_npc");
}

//Function Number: 33
func_61D9(param_00,param_01)
{
	func_619A("weap_reload_pistol_chamber_npc");
}

//Function Number: 34
func_61C9(param_00,param_01)
{
	if(issubstr(param_00,"on"))
	{
		self method_818E("gravity");
		return;
	}

	if(issubstr(param_00,"off"))
	{
		self method_818E("nogravity");
	}
}

//Function Number: 35
func_61C7(param_00,param_01)
{
	var_02 = issubstr(param_00,"left");
	var_03 = issubstr(param_00,"large");
	func_6D9C(var_02,var_03);
}

//Function Number: 36
func_3DF0()
{
	var_00 = "run";
	if(isdefined(self.var_8AA2))
	{
		var_00 = "sprint";
	}

	if(isdefined(self.var_7))
	{
		if(isdefined(self.var_7.var_5F58))
		{
			if(self.var_7.var_5F58 == "walk")
			{
				var_00 = "walk";
			}
		}

		if(isdefined(self.var_7.var_6E57))
		{
			if(self.var_7.var_6E57 == "prone")
			{
				var_00 = "prone";
			}
		}
	}

	return var_00;
}

//Function Number: 37
func_61F1(param_00,param_01)
{
	thread func_61F2(param_00,param_01);
}

//Function Number: 38
func_61F2(param_00,param_01)
{
	self endon("death");
	var_02 = [];
	var_03 = undefined;
	switch(param_00)
	{
		case "space_jet_bottom":
			break;

		case "space_jet_bottom_1":
			break;

		case "space_jet_bottom_2":
			break;

		case "space_jet_top":
			break;

		case "space_jet_top_1":
			break;

		case "space_jet_top_2":
			break;

		case "space_jet_left":
			break;

		case "space_jet_left_1":
			break;

		case "space_jet_left_2":
			break;

		case "space_jet_right":
			break;

		case "space_jet_right_1":
			break;

		case "space_jet_right_2":
			break;

		case "space_jet_front":
			break;

		case "space_jet_front_1":
			break;

		case "space_jet_front_2":
			break;

		case "space_jet_back":
			break;

		case "space_jet_back_1":
			break;

		case "space_jet_back_2":
			break;

		case "space_jet_back_3":
			break;

		case "space_jet_back_4":
			break;

		case "space_jet_random":
			break;
	}
}

//Function Number: 39
func_2565(param_00,param_01)
{
	if(isdefined(self.var_1DA))
	{
		var_02 = self.var_1DA;
	}
	else
	{
		var_02 = "dirt";
	}

	var_03 = undefined;
	if(isdefined(level.var_601[param_00][var_02]))
	{
		var_03 = level.var_601[param_00][var_02];
	}
	else if(isdefined(level.var_601[param_00]["all"]))
	{
		var_03 = level.var_601[param_00]["all"];
	}

	if(!isdefined(var_03))
	{
		return;
	}

	if(isai(self) && isdefined(var_03.fx))
	{
		playfxontag(var_03.fx,self,var_03.tag);
	}

	if(!isdefined(var_03.var_889E) && !isdefined(var_03.var_88A0))
	{
		return;
	}

	var_04 = "" + var_03.var_889E + var_02 + var_03.var_88A0;
	if(!soundexists(var_04))
	{
		var_04 = "" + var_03.var_889E + "default" + var_03.var_88A0;
	}

	func_619A(var_04);
}

//Function Number: 40
func_61C6(param_00,param_01)
{
	if(isdefined(self.var_1DA))
	{
		var_02 = self.var_1DA;
	}
	else
	{
		var_02 = "default";
	}

	self method_807A("scrape",var_02);
}

//Function Number: 41
func_61CF(param_00,param_01)
{
	if(isdefined(self.var_1DA))
	{
		var_02 = self.var_1DA;
	}
	else
	{
		var_02 = "default";
	}

	self method_807A("land",var_02);
}

//Function Number: 42
func_61BF(param_00,param_01)
{
	return "code_move";
}

//Function Number: 43
func_61C3(param_00,param_01)
{
	if(self.script != "reactions")
	{
		self method_818F("face enemy");
		return;
	}

	if(isdefined(self.enemy) && distancesquared(self.enemy.var_2E6,self.var_35C) < 4096)
	{
		self method_818F("face enemy");
		return;
	}

	self method_818F("face point",self.var_35C);
}

//Function Number: 44
func_61BE(param_00,param_01)
{
	var_02 = "_small";
	if(issubstr(param_00,"large"))
	{
		var_02 = "_large";
	}

	if(isdefined(self.var_1DA))
	{
		var_03 = self.var_1DA;
	}
	else
	{
		var_03 = "default";
	}

	var_04 = "bodyfall_" + var_03 + var_02;
	if(!soundexists(var_04))
	{
		var_04 = "bodyfall_default" + var_02;
	}

	func_619A(var_04);
}

//Function Number: 45
func_61D6(param_00,param_01)
{
	var_02 = "_small";
	if(issubstr(param_00,"large"))
	{
		var_02 = "";
	}

	animscripts\face::func_7821("pain" + var_02);
}

//Function Number: 46
func_61D2(param_00,param_01)
{
	animscripts\face::func_7821("meleeattack");
}

//Function Number: 47
func_4677()
{
	self endon("detached");
	self waittill("death");
	if(isdefined(self.var_758D))
	{
		self.var_758D delete();
	}
}

//Function Number: 48
func_61E0()
{
	self.var_758D = spawn("script_model",self.var_2E6);
	if(issubstr(tolower(self.weapon),"panzerfaust"))
	{
		self.var_758D setmodel("weapon_panzerfaust3_missle");
	}
	else
	{
		self.var_758D setmodel("projectile_rpg7");
	}

	self.var_758D linkto(self,"tag_inhand",(0,0,0),(0,0,0));
	thread func_4677();
}

//Function Number: 49
func_61E1()
{
	self notify("detached");
	if(isdefined(self.var_758D))
	{
		self.var_758D delete();
	}

	self.var_7.var_7594 = 1;
	if(isai(self) && !isalive(self))
	{
		return;
	}

	if(lib_A59A::hastag(getweaponmodel(self.weapon),"tag_rocket"))
	{
		self showpart("tag_rocket");
	}
}

//Function Number: 50
func_4669(param_00,param_01,param_02,param_03)
{
	if(isai(self) && self.type == "dog")
	{
		if(func_4656(param_00))
		{
			return;
		}
	}

	var_04 = level.var_61E2[param_00];
	if(isdefined(var_04))
	{
		return [[ var_04 ]](param_00,param_01);
	}

	if(!isdefined(param_03) || !param_03)
	{
		var_05 = getsubstr(param_00,0,3);
		if(var_05 == "ps_")
		{
			var_06 = getsubstr(param_00,3);
			func_619A(var_06);
		}
	}

	switch(param_00)
	{
		case "undefined":
		case "end":
		case "finish":
			break;

		case "finish early":
			break;

		case "swish small":
			break;

		case "swish large":
			break;

		case "torso_mvmnt":
			break;

		case "rechamber":
			break;

		case "no death":
			break;

		case "no pain":
			break;

		case "allow pain":
			break;

		case "anim_melee = \"right\":
		case "anim_melee = right":
			break;

		case "anim_melee = \"left\":
		case "anim_melee = left":
			break;

		case "swap taghelmet to tagleft":
			break;

		case "stop anim":
			break;

		case "break glass":
			break;

		case "break_glass":
			break;

		case "attach clip left":
			break;

		case "detach clip left":
			break;

		default:
			break;
	}
}

//Function Number: 51
func_2D0F(param_00,param_01,param_02)
{
	for(;;)
	{
		self waittill(param_00,var_03);
		if(!isdefined(var_03))
		{
			var_03 = "undefined";
		}

		var_04 = [[ param_01 ]](var_03);
		if(isdefined(var_04) && var_04)
		{
			continue;
		}

		var_05 = func_4669(var_03,param_00);
		if(isdefined(var_05))
		{
			return var_05;
		}
	}
}

//Function Number: 52
func_2D10(param_00,param_01)
{
	for(;;)
	{
		self waittill(param_00,var_02);
		if(!isdefined(var_02))
		{
			var_02 = "undefined";
		}

		var_03 = func_4669(var_02,param_00);
		[[ param_01 ]](var_02);
		if(isdefined(var_03))
		{
			return var_03;
		}
	}
}

//Function Number: 53
func_2D0D(param_00,param_01,param_02,param_03)
{
	animscripts\shared::func_2D05(param_00,param_02,param_03);
}

//Function Number: 54
func_2D06(param_00,param_01,param_02,param_03)
{
	func_2D08(::animscripts\shared::func_2D05,param_00,param_01,param_02,param_03);
}

//Function Number: 55
func_2D07(param_00,param_01,param_02,param_03)
{
	func_2D08(::func_2D0F,param_00,param_01,param_02,param_03);
}

//Function Number: 56
func_2D08(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	self endon("killanimscript");
	if(!isdefined(param_04))
	{
		param_04 = "undefined";
	}

	for(;;)
	{
		var_05 = gettime();
		var_06 = [[ param_00 ]](param_01,param_03,param_04);
		var_07 = gettime() - var_05;
		if(var_07 < 0.05)
		{
			var_05 = gettime();
			var_06 = [[ param_00 ]](param_01,param_03,param_04);
			var_07 = gettime() - var_05;
			if(var_07 < 0.05)
			{
				wait(0.05 - var_07);
			}
		}
	}
}

//Function Number: 57
func_2D13(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04 thread func_2D0B(param_01);
	func_2D0E(::func_2D0D,param_00,param_02,param_03,var_04);
}

//Function Number: 58
func_2D0A(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04 thread func_2D0B(param_00);
	func_2D0E(::func_2D06,param_01,param_02,param_03,var_04);
}

//Function Number: 59
func_2D0C(param_00,param_01,param_02,param_03)
{
	var_04 = spawnstruct();
	var_04 thread func_2D0B(param_00);
	func_2D0E(::func_2D07,param_01,param_02,param_03,var_04);
}

//Function Number: 60
func_2D0E(param_00,param_01,param_02,param_03,param_04)
{
	param_04 endon("stop_notetracks");
	[[ param_00 ]](param_01,undefined,param_02,param_03);
}

//Function Number: 61
func_2D0B(param_00)
{
	wait(param_00);
	self notify("stop_notetracks");
}

//Function Number: 62
func_6D9C(param_00,param_01)
{
	if(isdefined(self.var_6D9F))
	{
		self thread [[ self.var_6D9F ]](param_00,param_01);
		return;
	}

	if(!isai(self))
	{
		func_619A("step_run_default");
		return;
	}

	var_02 = func_3DF0();
	var_03 = undefined;
	if(!isdefined(self.var_1DA))
	{
		if(!isdefined(self.var_55A4))
		{
			self method_807A(var_02,"default");
			return;
		}

		var_03 = self.var_55A4;
	}
	else
	{
		var_03 = self.var_1DA;
		self.var_55A4 = self.var_1DA;
	}

	var_04 = "J_Ball_RI";
	if(param_00)
	{
		var_04 = "J_Ball_LE";
	}

	var_05 = self gettagorigin(var_04);
	var_06 = bullettrace(var_05 + (0,0,16),var_05 + (0,0,-4),0);
	if(var_06["fraction"] < 1 && var_06["fraction"] > 0 && var_06["surfacetype"] != "none")
	{
		var_03 = var_06["surfacetype"];
		var_05 = var_06["position"];
	}

	self method_807A(var_02,var_03);
	if(param_01)
	{
		if(![[ level.var_6545 ]](var_04,var_03,var_05))
		{
			func_6D9E(var_04,var_03,var_05);
			return;
		}

		return;
	}

	if(![[ level.var_6547 ]](var_04,var_03,var_05))
	{
		func_6D9D(var_04,var_03,var_05);
	}
}

//Function Number: 63
func_6D9D(param_00,param_01,param_02)
{
	if(!isdefined(level.var_6546[param_01]))
	{
		return 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = self gettagorigin(param_00);
	}

	var_03 = self.var_41;
	var_04 = anglestoforward(var_03);
	var_05 = var_04 * -1;
	var_06 = anglestoup(var_03);
	playfx(level._effect["step_" + param_01],param_02,var_06,var_05);
	return 1;
}

//Function Number: 64
func_6D9E(param_00,param_01,param_02)
{
	if(!isdefined(level.var_6548[param_01]))
	{
		return 0;
	}

	if(!isdefined(param_02))
	{
		param_02 = self gettagorigin(param_00);
	}

	var_03 = self.var_41;
	var_04 = anglestoforward(var_03);
	var_05 = var_04 * -1;
	var_06 = anglestoup(var_03);
	playfx(level._effect["step_small_" + param_01],param_02,var_06,var_05);
	return 1;
}

//Function Number: 65
func_8407()
{
	waittillframeend;
	if(isdefined(self) && gettime() > self.var_7.var_55D4)
	{
		animscripts\utility::func_83EC();
		animscripts\combat_utility::func_275E();
		if(weaponclass(self.weapon) == "rocketlauncher")
		{
			self.var_7.rockets--;
		}
	}
}

//Function Number: 66
func_37C5()
{
	if(self.var_7.var_A2D9["right"] == "none")
	{
		return;
	}

	if(isdefined(self.var_2D39))
	{
		func_8407();
		return;
	}

	var_00 = self gettagorigin("tag_weapon");
	var_01 = anglestoforward(self method_81B9());
	var_02 = var_00 + var_01 * 1000;
	self method_81E7(1,var_02);
	animscripts\combat_utility::func_275E();
}

//Function Number: 67
func_61C5(param_00,param_01)
{
	if(!isalive(self) && self method_813D())
	{
		if(isdefined(self.var_1C7F))
		{
			return;
		}

		self.var_1C7F = 1;
		var_02["axis"] = "team3";
		var_02["team3"] = "axis";
		self.inliveplayerkillstreak = var_02[self.inliveplayerkillstreak];
	}

	if(!issentient(self))
	{
		self notify("fire");
		return;
	}

	if(self.var_7.var_A2D9["right"] == "none")
	{
		return;
	}

	var_03 = self method_81B8();
	var_04 = anglestoforward(self method_81B9());
	var_05 = 10;
	if(isdefined(self.var_5184))
	{
		var_05 = 20;
	}

	var_06 = 0;
	if(isalive(self.enemy) && issentient(self.enemy) && self method_81BD())
	{
		var_07 = vectornormalize(self.enemy geteye() - var_03);
		if(vectordot(var_04,var_07) > cos(var_05))
		{
			var_06 = 1;
		}
	}

	if(var_06)
	{
		animscripts\utility::func_83EC();
	}
	else
	{
		var_04 = var_04 + (randomfloat(2) - 1 * 0.1,randomfloat(2) - 1 * 0.1,randomfloat(2) - 1 * 0.1);
		var_08 = var_03 + var_04 * 1000;
		self [[ level.var_840D ]](var_08);
	}

	animscripts\combat_utility::func_275E();
}