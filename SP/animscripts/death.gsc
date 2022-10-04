/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: death.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 47
 * Decompile Time: 1826 ms
 * Timestamp: 4/20/2022 8:20:27 PM
*******************************************************************/

//Function Number: 1
func_4C83()
{
	var_00 = [];
	var_00["directed_energy_stand_front_head"] = [%stand_death_head_front_a_dea];
	var_00["directed_energy_stand_front_legs"] = [%stand_death_legs_front_a_dea];
	var_00["directed_energy_stand_front_default"] = [%stand_death_torso_front_a_dea];
	var_00["directed_energy_stand_back_default"] = [%stand_death_torso_back_a_dea];
	var_00["strong_legs"] = [%death_shotgun_legs,%death_stand_sniper_leg];
	var_00["strong_torso_lower"] = [%death_shotgun_legs,%death_stand_sniper_leg,%death_shotgun_back_v1,%exposed_death_blowback,%death_stand_sniper_chest1,%death_stand_sniper_chest2,%death_stand_sniper_spin1];
	var_00["strong_default"] = [%death_shotgun_legs,%death_stand_sniper_leg,%death_shotgun_back_v1,%exposed_death_blowback,%death_stand_sniper_chest1,%death_stand_sniper_chest2,%death_stand_sniper_spin1];
	var_00["strong_right"] = [%death_shotgun_spinl,%death_stand_sniper_spin1,%death_stand_sniper_chest1,%death_stand_sniper_chest2];
	var_00["strong_left"] = [%death_shotgun_spinr,%death_stand_sniper_spin2,%death_stand_sniper_chest1,%death_stand_sniper_chest2];
	var_00["running_forward"] = [%run_death_facedown,%run_death_roll,%run_death_fallonback,%run_death_flop];
	var_00["running_forward_f"] = [%run_death_fallonback];
	var_00["stand_pistol_forward"] = [%pistol_death_2];
	var_00["stand_pistol_front"] = [%pistol_death_2];
	var_00["stand_pistol_groin"] = [%pistol_death_3,%pistol_death_3];
	var_00["stand_pistol_torso_upper"] = [%pistol_death_3];
	var_00["stand_pistol_upper_body"] = [%pistol_death_4];
	var_00["stand_pistol_default"] = [%pistol_death_1];
	var_00["stand_pistol_torso_upper"] = [%pistol_death_3,%pistol_death_1];
	var_00["stand_pistol_lower_body"] = [%pistol_death_2];
	var_00["cover_right_stand"] = [%corner_standr_deatha,%corner_standr_deathb];
	var_00["cover_right_crouch_head"] = [%cornercrr_alert_death_slideout];
	var_00["cover_right_crouch_default"] = [%cornercrr_alert_death_slideout,%cornercrr_alert_death_back];
	var_00["cover_left_stand"] = [%corner_standl_deatha,%corner_standl_deathb];
	var_00["cover_left_crouch"] = [%cornercrl_death_side,%cornercrl_death_back];
	var_00["cover_stand"] = [%coverstand_death_left,%coverstand_death_right];
	var_00["cover_crouch_head"] = %covercrouch_death_1;
	var_00["cover_crouch_back"] = %covercrouch_death_3;
	var_00["cover_crouch_default"] = %covercrouch_death_2;
	var_00["saw_stand"] = [%saw_gunner_death];
	var_00["saw_crouch"] = [%saw_gunner_lowwall_death];
	var_00["saw_prone"] = [%saw_gunner_prone_death];
	var_00["dying_crawl_crouch"] = [%dying_back_death_v2,%dying_back_death_v3,%dying_back_death_v4];
	var_00["dying_crawl_prone"] = [%dying_crawl_death_v1,%dying_crawl_death_v2];
	var_00["stand_lower_body"] = [%exposed_death_groin,%stand_death_leg];
	var_00["stand_lower_body_extended"] = [%stand_death_crotch,%stand_death_guts];
	var_00["stand_head"] = [%exposed_death_headshot,%exposed_death_flop];
	var_00["stand_neck"] = [%exposed_death_neckgrab];
	var_00["stand_left_shoulder"] = [%exposed_death_twist,%stand_death_shoulder_spin,%stand_death_shoulderback];
	var_00["stand_torso_upper"] = [%stand_death_tumbleforward,%stand_death_stumbleforward];
	var_00["stand_torso_upper_extended"] = [%stand_death_fallside];
	var_00["stand_front_head"] = [%stand_death_face,%stand_death_headshot_slowfall];
	var_00["stand_front_head_extended"] = [%stand_death_head_straight_back];
	var_00["stand_front_torso"] = [%stand_death_tumbleback];
	var_00["stand_front_torso_extended"] = [%stand_death_chest_stunned];
	var_00["stand_back"] = [%exposed_death_falltoknees,%exposed_death_falltoknees_02];
	var_00["stand_default"] = [%exposed_death_02,%exposed_death_nerve];
	var_00["stand_default_firing"] = [%exposed_death_firing_02,%exposed_death_firing];
	var_00["stand_backup_default"] = %exposed_death;
	var_00["crouch_head"] = [%exposed_crouch_death_fetal];
	var_00["crouch_torso"] = [%exposed_crouch_death_flip];
	var_00["crouch_default1"] = [%exposed_crouch_death_twist];
	var_00["crouch_default2"] = [%exposed_crouch_death_flip];
	var_00["melee_standing_front"] = [%melee_death_standing_front];
	var_00["melee_standing_back"] = [%melee_death_standing_back];
	var_00["melee_standing_left"] = [%melee_death_standing_left];
	var_00["melee_standing_right"] = [%melee_death_standing_right];
	var_00["melee_crouching_front"] = [%melee_death_crouching_front];
	var_00["melee_crouching_back"] = [%melee_death_crouching_back];
	var_00["melee_crouching_left"] = [%melee_death_crouching_left];
	var_00["melee_crouching_right"] = [%melee_death_crouching_right];
	var_00["melee_exo_front_stand_stand"] = [%npc_sp_exo_melee_stand_front];
	var_00["melee_exo_back_stand_stand"] = [%npc_sp_exo_melee_stand_back];
	var_00["melee_exo_right_stand_stand"] = [%npc_sp_exo_melee_stand_right];
	var_00["melee_exo_left_stand_stand"] = [%npc_sp_exo_melee_stand_left];
	var_00["melee_exo_front_stand_crouch"] = [%npc_sp_exo_melee_kneel_front];
	var_00["melee_exo_back_stand_crouch"] = [%npc_sp_exo_melee_kneel_back];
	var_00["melee_exo_left_stand_crouch"] = [%npc_sp_exo_melee_kneel_left];
	var_00["melee_exo_right_stand_crouch"] = [%npc_sp_exo_melee_kneel_right];
	var_00["melee_exo_front_stand_prone"] = [%npc_sp_exo_melee_prone_front];
	var_00["melee_exo_back_stand_prone"] = [%npc_sp_exo_melee_prone_back];
	var_00["melee_exo_left_stand_prone"] = [%npc_sp_exo_melee_prone_left];
	var_00["melee_exo_right_stand_prone"] = [%npc_sp_exo_melee_prone_right];
	var_00["melee_exo_front_crouch_stand"] = [%npc_sp_exo_melee_stand_front];
	var_00["melee_exo_back_crouch_stand"] = [%npc_sp_exo_melee_stand_back];
	var_00["melee_exo_left_crouch_stand"] = [%npc_sp_exo_melee_stand_left];
	var_00["melee_exo_right_crouch_stand"] = [%npc_sp_exo_melee_stand_right];
	var_00["melee_exo_front_crouch_crouch"] = [%npc_sp_exo_melee_kneel_front];
	var_00["melee_exo_back_crouch_crouch"] = [%npc_sp_exo_melee_kneel_back];
	var_00["melee_exo_left_crouch_crouch"] = [%npc_sp_exo_melee_kneel_left];
	var_00["melee_exo_right_crouch_crouch"] = [%npc_sp_exo_melee_kneel_right];
	var_00["melee_exo_front_crouch_prone"] = [%npc_sp_exo_melee_prone_front];
	var_00["melee_exo_back_crouch_prone"] = [%npc_sp_exo_melee_prone_back];
	var_00["melee_exo_left_crouch_prone"] = [%npc_sp_exo_melee_prone_left];
	var_00["melee_exo_right_crouch_prone"] = [%npc_sp_exo_melee_prone_right];
	var_00["melee_exo_front_prone_stand"] = [%npc_sp_exo_melee_stand_front];
	var_00["melee_exo_back_prone_stand"] = [%npc_sp_exo_melee_stand_back];
	var_00["melee_exo_left_prone_stand"] = [%npc_sp_exo_melee_stand_left];
	var_00["melee_exo_right_prone_stand"] = [%npc_sp_exo_melee_stand_right];
	var_00["melee_exo_front_prone_crouch"] = [%npc_sp_exo_melee_kneel_front];
	var_00["melee_exo_back_prone_crouch"] = [%npc_sp_exo_melee_kneel_back];
	var_00["melee_exo_left_prone_crouch"] = [%npc_sp_exo_melee_kneel_left];
	var_00["melee_exo_right_prone_crouch"] = [%npc_sp_exo_melee_kneel_right];
	var_00["melee_exo_front_prone_prone"] = [%npc_sp_exo_melee_prone_front];
	var_00["melee_exo_back_prone_prone"] = [%npc_sp_exo_melee_prone_back];
	var_00["melee_exo_left_prone_prone"] = [%npc_sp_exo_melee_prone_left];
	var_00["melee_exo_right_prone_prone"] = [%npc_sp_exo_melee_prone_right];
	var_00["melee_exo_stand_front_head"] = [%npc_sp_exo_melee_stand_front_head];
	var_00["melee_exo_stand_back_head"] = [%npc_sp_exo_melee_stand_back_head];
	var_00["melee_exo_stand_left_head"] = [%npc_sp_exo_melee_stand_left_head];
	var_00["melee_exo_stand_right_head"] = [%npc_sp_exo_melee_stand_right_head];
	var_00["melee_exo_crouch_front_head"] = [%npc_sp_exo_melee_kneel_front_head];
	var_00["melee_exo_crouch_back_head"] = [%npc_sp_exo_melee_kneel_back_head];
	var_00["melee_exo_crouch_left_head"] = [%npc_sp_exo_melee_kneel_left_head];
	var_00["melee_exo_crouch_right_head"] = [%npc_sp_exo_melee_kneel_right_head];
	var_00["melee_exo_prone_front_head"] = [%npc_sp_exo_melee_prone_front_head];
	var_00["melee_exo_prone_back_head"] = [%npc_sp_exo_melee_prone_back_head];
	var_00["melee_exo_prone_left_head"] = [%npc_sp_exo_melee_prone_left_head];
	var_00["melee_exo_prone_right_head"] = [%npc_sp_exo_melee_prone_right_head];
	var_00["melee_exo_front_lower"] = [%stand_death_crotch];
	level.var_CCA["soldier"]["death"] = var_00;
}

//Function Number: 2
main()
{
	self endon("killanimscript");
	self stopsounds();
	var_00 = 0.3;
	self method_8142(%scripted_talking,var_00);
	lib_A506::func_2B03(0);
	self hudoutlinedisable();
	if(self.var_7.var_612B == 1)
	{
		return;
	}

	if(isdefined(self.var_265F))
	{
		var_01 = self [[ self.var_265F ]]();
		if(!isdefined(var_01))
		{
			var_01 = 1;
		}

		if(var_01)
		{
			return;
		}
	}

	animscripts\utility::func_4DD4("death");
	func_73D5(self.var_2E6);
	level.var_6297--;
	level.var_6296--;
	if(isdefined(self.var_70D9) || self.var_197)
	{
		func_2CE3();
	}

	if(isdefined(self.var_2651))
	{
		func_6A3A(self.var_2651);
		if(isdefined(self.var_2652))
		{
			self [[ self.var_2652 ]]();
		}

		return;
	}

	var_02 = animscripts\pain::func_A1BB();
	if(self.var_FE == "helmet" || self.var_FE == "head")
	{
		func_481D();
	}
	else if(var_02 && randomint(3) == 0)
	{
		func_481D();
	}

	self method_8142(%animscript_root,0.3);
	if(!animscripts\utility::func_25A5("head","helmet") || (self.var_FF == "MOD_MELEE" || self.var_FF == "MOD_MELEE_ALT") && isdefined(self.attacker))
	{
		if(self.var_120)
		{
		}
		else
		{
			playdeathsound();
		}
	}

	if(var_02 && func_6D94())
	{
		return;
	}

	if(isdefined(self.var_8A26))
	{
		if([[ self.var_8A26 ]]())
		{
			return;
		}
	}

	if(func_8A25())
	{
		return;
	}

	var_03 = func_3F4B();
	func_6A3A(var_03);
}

//Function Number: 3
func_2CE3()
{
	animscripts\shared::func_2F6B();
	self.var_85B4 = 1;
	var_00 = 10;
	var_01 = common_scripts\_destructible::getdamagetype(self.var_FF);
	if(isdefined(self.attacker) && self.attacker == level.var_31D && var_01 == "melee")
	{
		var_00 = 5;
	}

	var_02 = self.damagetaken;
	if(var_01 == "bullet")
	{
		var_02 = max(var_02,300);
	}

	var_03 = var_00 * var_02;
	var_04 = max(0.3,self.var_FD[2]);
	var_05 = (self.var_FD[0],self.var_FD[1],var_04);
	if(isdefined(self.var_70D6))
	{
		var_05 = var_05 * self.var_70D6;
	}
	else
	{
		var_05 = var_05 * var_03;
	}

	if(self.var_197)
	{
		var_05 = var_05 + self.var_338 * 20 * 10;
	}

	if(isdefined(self.var_70DA))
	{
		var_05 = var_05 + self.var_70DA * 10;
	}

	self method_8024(self.var_FE,var_05);
	wait(0.05);
}

//Function Number: 4
cross2d(param_00,param_01)
{
	return param_00[0] * param_01[1] - param_01[0] * param_00[1];
}

//Function Number: 5
func_5B87(param_00,param_01)
{
	var_02 = vectordot(param_01,param_00);
	var_03 = cos(60);
	if(squared(var_02) < squared(var_03))
	{
		if(cross2d(param_00,param_01) > 0)
		{
			return 1;
		}

		return 3;
	}

	if(var_02 < 0)
	{
		return 0;
	}

	return 2;
}

//Function Number: 6
func_6586()
{
	if((self.var_FF == "MOD_MELEE" || self.var_FF == "MOD_MELEE_ALT") && isdefined(self.attacker))
	{
		if(isdefined(self.var_B04) && isdefined(self.var_B05))
		{
			var_00 = self.var_B05;
			self.var_B05 = undefined;
		}
		else
		{
			var_00 = func_4062();
		}

		self method_818F("face angle",var_00);
	}
}

//Function Number: 7
func_4062()
{
	var_00 = self.var_2E6 - self.attacker.var_2E6;
	var_01 = anglestoforward(self.var_41);
	var_02 = vectornormalize((var_00[0],var_00[1],0));
	var_03 = vectornormalize((var_01[0],var_01[1],0));
	var_04 = func_5B87(var_03,var_02);
	var_05 = var_04 * 90;
	var_06 = (-1 * var_02[0],-1 * var_02[1],0);
	var_07 = rotatevector(var_06,(0,var_05,0));
	var_08 = vectortoyaw(var_07);
	return var_08;
}

//Function Number: 8
func_594A()
{
	if(getdvar("mapname") != "sanfran_b")
	{
		return;
	}

	var_00 = getentarray("enemy_overboard_achievement_trigger","targetname");
	foreach(var_02 in var_00)
	{
		var_02 thread func_594B(self);
	}
}

//Function Number: 9
func_594B(param_00)
{
	while(isdefined(param_00))
	{
		if(self istouching(param_00) && isdefined(level.var_31D.var_594A))
		{
			lib_A59A::func_41DA("LEVEL_12A");
			break;
		}

		wait(0.05);
	}
}

//Function Number: 10
func_6A3A(param_00)
{
	if(self.var_FF == "MOD_MELEE_ALT" && getdvar("mapname","undefined") == "sanfran_b")
	{
		thread func_594A();
	}

	if(!animhasnotetrack(param_00,"dropgun") && !animhasnotetrack(param_00,"fire_spray"))
	{
		animscripts\shared::func_2F6B();
	}

	if(!isdefined(self.var_6149) || !self.var_6149)
	{
		func_6586();
	}

	self method_8110("deathanim",param_00,%body,1,0.1);
	animscripts\face::func_6D98(param_00,"death");
	if(isdefined(self.var_85B4))
	{
		if(!isdefined(self.var_6156))
		{
			self startragdoll();
		}

		wait(0.05);
		self method_818E("gravity");
	}
	else if(isdefined(self.var_70DD))
	{
		thread func_A023(self.var_70DD);
	}
	else if(!animhasnotetrack(param_00,"start_ragdoll"))
	{
		if(self.var_FF == "MOD_MELEE" || self.var_FF == "MOD_MELEE_ALT")
		{
			var_01 = 0.7;
		}
		else
		{
			var_01 = 0.35;
		}

		thread func_A023(function_0063(param_00) * var_01);
	}

	if(!isdefined(self.var_85B4))
	{
		thread playdeathfx();
	}

	self endon("forcedRagdoll");
	if(self.var_FF != "MOD_MELEE")
	{
		thread func_9AF8();
		thread func_1D00();
	}

	animscripts\shared::func_2D05("deathanim");
	animscripts\shared::func_2F6B();
	self notify("endPlayDeathAnim");
}

//Function Number: 11
func_9AF8()
{
	self endon("endPlayDeathAnim");
	self endon("forcedRagdoll");
	wait(0.25);
	while(isdefined(self))
	{
		self method_8025();
		wait(0.2);
	}
}

//Function Number: 12
func_1D00()
{
	self endon("endPlayDeathAnim");
	while(isdefined(self))
	{
		self waittill("ragdoll_early_result",var_00);
		if(!isdefined(self))
		{
			return;
		}

		if(var_00)
		{
			self startragdoll();
			animscripts\shared::func_2F6B();
			break;
		}

		self waittill("ragdoll_early_result",var_00);
	}

	self notify("forcedRagdoll");
}

//Function Number: 13
func_A023(param_00)
{
	wait(param_00);
	if(isdefined(self))
	{
		animscripts\shared::func_2F6B();
	}

	if(isdefined(self) && !isdefined(self.var_6156))
	{
		self startragdoll();
	}
}

//Function Number: 14
playdeathfx()
{
	self endon("killanimscript");
	if(self.var_3F2 != "none")
	{
		return;
	}

	wait(2);
	func_689E();
}

//Function Number: 15
func_689E(param_00,param_01)
{
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(self.var_85B3))
	{
		return;
	}

	var_02 = self gettagorigin("j_SpineUpper");
	var_03 = self gettagangles("j_SpineUpper");
	var_04 = anglestoforward(var_03);
	var_05 = anglestoup(var_03);
	var_06 = anglestoright(var_03);
	var_02 = var_02 + var_04 * -8.5 + var_05 * 5 + var_06 * 0;
	var_07 = bullettrace(var_02 + (0,0,30),var_02 - (0,0,100),0,undefined);
	if(var_07["normal"][2] > 0.9)
	{
		playfx(level._effect["deathfx_bloodpool_generic"],var_02);
	}
}

//Function Number: 16
func_8A25()
{
	if(self.var_7.var_8A14 == "none")
	{
		return 0;
	}

	if(self.var_FF == "MOD_MELEE" || self.var_FF == "MOD_MELEE_ALT")
	{
		return 0;
	}

	switch(self.var_7.var_8A14)
	{
		case "cover_right":
			break;

		case "cover_left":
			break;

		case "cover_stand":
			break;

		case "cover_crouch":
			break;

		case "saw":
			break;

		case "dying_crawl":
			break;

		case "stumbling_pain":
			break;
	}
}

//Function Number: 17
func_2C24(param_00)
{
	var_01 = param_00[randomint(param_00.size)];
	func_6A3A(var_01);
	if(isdefined(self.var_2652))
	{
		self [[ self.var_2652 ]]();
	}
}

//Function Number: 18
playdeathsound()
{
	if(!animscripts\utility::func_25A5("head","helmet"))
	{
		if(!self.var_120)
		{
			animscripts\face::func_7821("pain_small");
			if(isdefined(self.inliveplayerkillstreak))
			{
				lib_A51B::func_2615(self.inliveplayerkillstreak != "allies");
			}
		}
	}
	else if(isdefined(self.inliveplayerkillstreak))
	{
		lib_A51B::func_2615(self.inliveplayerkillstreak != "allies","headshot");
	}

	if((self.var_FF == "MOD_MELEE" || self.var_FF == "MOD_MELEE_ALT") && isdefined(self.attacker))
	{
		animscripts\face::func_7821("melee_death");
		return;
	}

	animscripts\face::func_7821("death");
}

//Function Number: 19
func_6FA1(param_00,param_01,param_02)
{
	var_03 = param_02 * 20;
	for(var_04 = 0;var_04 < var_03;var_04++)
	{
		wait(0.05);
	}
}

//Function Number: 20
func_481D()
{
	if(!isdefined(self))
	{
		return;
	}

	if(!isdefined(self.hatmodel))
	{
		return;
	}

	var_00 = getpartname(self.hatmodel,0);
	var_01 = spawn("script_model",self.var_2E6 + (0,0,64));
	var_01 setmodel(self.hatmodel);
	var_01.var_2E6 = self gettagorigin(var_00);
	var_01.var_41 = self gettagangles(var_00);
	var_01 thread func_481C(self.var_FD);
	var_02 = self.hatmodel;
	self.hatmodel = undefined;
	wait(0.05);
	if(!isdefined(self))
	{
		return;
	}

	self detach(var_02,"");
}

//Function Number: 21
func_481C(param_00)
{
	var_01 = param_00;
	var_01 = var_01 * randomfloatrange(2000,4000);
	var_02 = var_01[0];
	var_03 = var_01[1];
	var_04 = randomfloatrange(1500,3000);
	var_05 = self.var_2E6 + (randomfloatrange(-1,1),randomfloatrange(-1,1),randomfloatrange(-1,1)) * 5;
	self physicslaunchclient(var_05,(var_02,var_03,var_04));
	wait(60);
	for(;;)
	{
		if(!isdefined(self))
		{
			return;
		}

		if(distancesquared(self.var_2E6,level.var_31D.var_2E6) > 262144)
		{
			break;
		}

		wait(30);
	}

	self delete();
}

//Function Number: 22
func_73D5(param_00)
{
	for(var_01 = 0;var_01 < level.var_8AC8.size;var_01++)
	{
		level.var_8AC8[var_01] func_1F01(param_00);
	}
}

//Function Number: 23
func_1F01(param_00)
{
	if(!isdefined(self.var_8561))
	{
		return;
	}

	if(distance(param_00,self.var_8561) < 80)
	{
		self.var_8561 = undefined;
		self.var_8564 = gettime();
	}
}

//Function Number: 24
func_848A()
{
	if(self.var_7.var_5F58 != "run")
	{
		return 0;
	}

	if(self method_8190() > 60 || self method_8190() < -60)
	{
		return 0;
	}

	if(self.var_FF == "MOD_MELEE" || self.var_FF == "MOD_MELEE_ALT")
	{
		return 0;
	}

	return 1;
}

//Function Number: 25
func_8488(param_00,param_01,param_02,param_03)
{
	if(param_01 != "MOD_ENERGY")
	{
		return 0;
	}

	if(self.var_7.var_6E57 != "stand")
	{
		return 0;
	}

	if(isdefined(self.var_7.var_2CE6))
	{
		return 0;
	}

	return 1;
}

//Function Number: 26
func_509F(param_00)
{
	if(isdefined(param_00))
	{
		return issubstr(param_00,"onearm");
	}

	return 0;
}

//Function Number: 27
func_848E(param_00,param_01,param_02)
{
	if(isdefined(param_00))
	{
		if(param_00 == "MOD_MELEE_ALT")
		{
			if(func_509F(param_02))
			{
				return 0;
			}

			return 1;
		}
		else if(param_00 == "MOD_MELEE" && isdefined(param_01) && isdefined(param_01.var_39A9))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 28
func_848D(param_00,param_01,param_02,param_03)
{
	if(isdefined(self.var_7.var_2CE6))
	{
		return 0;
	}

	if(self.var_7.var_6E57 == "prone" || isdefined(self.var_7.var_644E))
	{
		return 0;
	}

	if(param_00 == "none")
	{
		return 0;
	}

	if(param_02 > 500)
	{
		return 1;
	}

	if(param_01 == "MOD_MELEE" || param_01 == "MOD_MELEE_ALT")
	{
		return 0;
	}

	if(self.var_7.var_5F58 == "run" && !func_50BF(param_03,275))
	{
		if(randomint(100) < 65)
		{
			return 0;
		}
	}

	if(animscripts\utility::func_51A9(param_00) && self.var_275 < param_02)
	{
		return 1;
	}

	if(animscripts\utility::func_51A0(param_00) && func_50BF(param_03,512))
	{
		return 1;
	}

	if(func_50EE(param_00) && func_50BF(param_03,425))
	{
		return 1;
	}

	return 0;
}

//Function Number: 29
func_50EE(param_00)
{
	if(param_00 == "deserteagle")
	{
		return 1;
	}

	return 0;
}

//Function Number: 30
func_50BF(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(distance(self.var_2E6,param_00.var_2E6) > param_01)
	{
		return 0;
	}

	return 1;
}

//Function Number: 31
func_3F4B()
{
	if(func_848E(self.var_FF,self.attacker,self.var_103))
	{
		self.var_B04 = 1;
		var_00 = func_3EEC();
		if(isdefined(var_00))
		{
			return var_00;
		}
	}

	if(func_8488(self.var_103,self.var_FF,self.damagetaken,self.attacker))
	{
		var_00 = func_3F57();
		if(isdefined(var_00))
		{
			return var_00;
		}
	}

	if(func_848D(self.var_103,self.var_FF,self.damagetaken,self.attacker))
	{
		var_00 = func_40F8();
		if(isdefined(var_00))
		{
			return var_00;
		}
	}

	if(isdefined(self.var_7.var_644E))
	{
		if(self.var_7.var_6E57 == "crouch")
		{
			return func_3F0D();
		}
		else
		{
			animscripts\notetracks::func_8EF7();
		}
	}

	if(self.var_7.var_6E57 == "stand")
	{
		if(func_848A())
		{
			return func_40BC();
		}

		return func_40E6();
	}

	if(self.var_7.var_6E57 == "crouch")
	{
		return func_3F3F();
	}

	if(self.var_7.var_6E57 == "prone")
	{
		return func_409A();
	}
}

//Function Number: 32
func_3EEC()
{
	self.var_B05 = func_4062();
	var_00 = self.var_B05 - self.var_41[1];
	var_01 = angleclamp180(self.var_104 - var_00);
	var_02 = self.var_7.var_6E57;
	if(!isdefined(self.attacker) || self.attacker != level.var_31D)
	{
		return;
	}

	var_03 = level.var_31D getstance();
	var_04 = [];
	if(var_01 < -135 || var_01 > 135)
	{
		var_04 = animscripts\utility::func_5860("death","melee_exo_front_" + var_03 + "_" + var_02);
		if(animscripts\utility::func_25A5("head","neck"))
		{
			var_04 = common_scripts\utility::array_combine(var_04,animscripts\utility::func_5860("death","melee_exo_" + var_02 + "_front_head"));
		}
	}
	else if(var_01 < 45 && var_01 > -45)
	{
		var_04 = animscripts\utility::func_5860("death","melee_exo_back_" + var_03 + "_" + var_02);
		if(animscripts\utility::func_25A5("head","neck"))
		{
			var_04 = common_scripts\utility::array_combine(var_04,animscripts\utility::func_5860("death","melee_exo_" + var_02 + "_back_head"));
		}
	}
	else if(var_01 < -45 && var_01 > -135)
	{
		var_04 = animscripts\utility::func_5860("death","melee_exo_left_" + var_03 + "_" + var_02);
		if(animscripts\utility::func_25A5("head","neck"))
		{
			var_04 = common_scripts\utility::array_combine(var_04,animscripts\utility::func_5860("death","melee_exo_" + var_02 + "_left_head"));
		}
	}
	else
	{
		var_04 = animscripts\utility::func_5860("death","melee_exo_right_" + var_03 + "_" + var_02);
		if(animscripts\utility::func_25A5("head","neck"))
		{
			var_04 = common_scripts\utility::array_combine(var_04,animscripts\utility::func_5860("death","melee_exo_" + var_02 + "_right_head"));
		}
	}

	return var_04[randomint(var_04.size)];
}

//Function Number: 33
func_40F8()
{
	var_00 = abs(self.var_104);
	if(var_00 < 45)
	{
		return;
	}

	if(var_00 > 150)
	{
		if(animscripts\utility::func_25A5("left_leg_upper","left_leg_lower","right_leg_upper","right_leg_lower","left_foot","right_foot"))
		{
			var_01 = animscripts\utility::func_5860("death","strong_legs");
		}
		else if(self.var_FE == "torso_lower")
		{
			var_01 = animscripts\utility::func_5860("death","strong_torso_lower");
		}
		else
		{
			var_01 = animscripts\utility::func_5860("death","strong_default");
		}
	}
	else if(self.var_104 < 0)
	{
		var_01 = animscripts\utility::func_5860("death","strong_right");
	}
	else
	{
		var_01 = animscripts\utility::func_5860("death","strong_left");
	}

	return var_01[randomint(var_01.size)];
}

//Function Number: 34
func_3F57()
{
	var_00 = abs(self.var_104);
	if(var_00 > 135)
	{
		var_01 = "directed_energy_stand_front_default";
		if(isdefined(self.var_5515))
		{
			if(self.var_5515[2] < self.var_2E6[2] + 20)
			{
				var_01 = "directed_energy_stand_front_legs";
			}
			else if(self.var_5515[2] > self.var_2E6[2] + 40)
			{
				var_01 = "directed_energy_stand_front_head";
			}
		}
	}
	else
	{
		var_01 = "directed_energy_stand_back_default";
	}

	var_02 = animscripts\utility::func_5860("death",var_01);
	var_03 = var_02[randomint(var_02.size)];
	return var_03;
}

//Function Number: 35
func_40BC()
{
	if(abs(self.var_104) < 45)
	{
		var_00 = animscripts\utility::func_5860("death","running_forward_f");
		var_01 = func_40A6(var_00);
		if(isdefined(var_01))
		{
			return var_01;
		}
	}

	var_00 = animscripts\utility::func_5860("death","running_forward");
	var_01 = func_40A6(var_00);
	if(isdefined(var_01))
	{
		return var_01;
	}

	return func_40E6();
}

//Function Number: 36
func_40A6(param_00)
{
	if(!isdefined(param_00))
	{
		return undefined;
	}

	var_01 = undefined;
	for(var_02 = param_00.size;var_02 > 0;var_02--)
	{
		var_03 = randomint(var_02);
		var_01 = param_00[var_03];
		if(!func_50B4(var_01))
		{
			return var_01;
		}

		param_00[var_03] = param_00[var_02 - 1];
		param_00[var_02 - 1] = undefined;
	}

	return undefined;
}

//Function Number: 37
func_73E4(param_00)
{
	var_01 = [];
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(!isdefined(param_00[var_02]))
		{
			continue;
		}

		var_01[var_01.size] = param_00[var_02];
	}

	return var_01;
}

//Function Number: 38
func_50B4(param_00)
{
	var_01 = 1;
	if(animhasnotetrack(param_00,"code_move"))
	{
		var_01 = getnotetracktimes(param_00,"code_move")[0];
	}

	var_02 = getmovedelta(param_00,0,var_01);
	var_03 = self localtoworldcoords(var_02);
	return !self method_81C3(var_03,1,1);
}

//Function Number: 39
func_40E8()
{
	var_00 = [];
	if(abs(self.var_104) < 50)
	{
		var_00 = animscripts\utility::func_5860("death","stand_pistol_forward");
	}
	else
	{
		if(abs(self.var_104) < 110)
		{
			var_00 = animscripts\utility::func_5860("death","stand_pistol_front");
		}

		if(self.var_FE == "torso_upper")
		{
			var_00 = common_scripts\utility::array_combine(animscripts\utility::func_5860("death","stand_pistol_torso_upper"),var_00);
		}
		else if(animscripts\utility::func_25A5("torso_lower","left_leg_upper","left_leg_lower","right_leg_upper","right_leg_lower"))
		{
			var_00 = common_scripts\utility::array_combine(animscripts\utility::func_5860("death","stand_pistol_torso_upper"),var_00);
		}

		if(!animscripts\utility::func_25A5("head","neck","helmet","left_foot","right_foot","left_hand","right_hand","gun") && randomint(2) == 0)
		{
			var_00 = common_scripts\utility::array_combine(animscripts\utility::func_5860("death","stand_pistol_upper_body"),var_00);
		}

		if(var_00.size == 0 || animscripts\utility::func_25A5("torso_lower","torso_upper","neck","head","helmet","right_arm_upper","left_arm_upper"))
		{
			var_00 = common_scripts\utility::array_combine(animscripts\utility::func_5860("death","stand_pistol_default"),var_00);
		}
	}

	return var_00;
}

//Function Number: 40
func_40E6()
{
	var_00 = [];
	var_01 = [];
	if(animscripts\utility::func_9C32())
	{
		var_00 = func_40E8();
	}
	else if(isdefined(self.var_3065) && self.var_3065)
	{
		var_00 = animscripts\utility::func_5860("death","emp");
	}
	else if(isdefined(self.attacker) && self method_8402(self.attacker))
	{
		if(self.var_104 <= 120 || self.var_104 > -120)
		{
			var_00 = animscripts\utility::func_5860("death","melee_standing_front");
		}
		else if(self.var_104 <= -60 && self.var_104 > 60)
		{
			var_00 = animscripts\utility::func_5860("death","melee_standing_back");
		}
		else if(self.var_104 < 0)
		{
			var_00 = animscripts\utility::func_5860("death","melee_standing_left");
		}
		else
		{
			var_00 = animscripts\utility::func_5860("death","melee_standing_right");
		}
	}
	else
	{
		if(animscripts\utility::func_25A5("torso_lower","left_leg_upper","left_leg_lower","right_leg_lower","right_leg_lower"))
		{
			var_00 = animscripts\utility::func_5860("death","stand_lower_body");
			var_01 = animscripts\utility::func_5860("death","stand_lower_body_extended");
		}
		else if(animscripts\utility::func_25A5("head","helmet"))
		{
			var_00 = animscripts\utility::func_5860("death","stand_head");
		}
		else if(animscripts\utility::func_25A5("neck"))
		{
			var_00 = animscripts\utility::func_5860("death","stand_neck");
		}
		else if(animscripts\utility::func_25A5("torso_upper","left_arm_upper"))
		{
			var_00 = animscripts\utility::func_5860("death","stand_left_shoulder");
		}

		if(animscripts\utility::func_25A5("torso_upper"))
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","stand_torso_upper"));
			var_01 = common_scripts\utility::array_combine(var_01,animscripts\utility::func_5860("death","stand_torso_upper_extended"));
		}

		if(self.var_104 > 135 || self.var_104 <= -135)
		{
			if(animscripts\utility::func_25A5("neck","head","helmet"))
			{
				var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","stand_front_torso"));
				var_01 = common_scripts\utility::array_combine(var_01,animscripts\utility::func_5860("death","stand_front_torso_extended"));
			}

			if(animscripts\utility::func_25A5("torso_upper"))
			{
				var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","stand_front_torso"));
				var_01 = common_scripts\utility::array_combine(var_01,animscripts\utility::func_5860("death","stand_front_torso_extended"));
			}
		}
		else if(self.var_104 > -45 && self.var_104 <= 45)
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","stand_back"));
		}

		var_02 = var_00.size > 0;
		if(!var_02 || randomint(100) < 15)
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","stand_default"));
		}

		if(randomint(100) < 10 && func_3801())
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","stand_default_firing"));
			var_00 = func_73E4(var_00);
		}
	}

	if(var_00.size == 0)
	{
		var_00[var_00.size] = animscripts\utility::func_5860("death","stand_backup_default");
	}

	if(!self.var_7.var_2B17 && self.var_3F2 == "none" && !isdefined(self.var_7.var_6657))
	{
		var_03 = randomint(var_00.size + var_01.size);
		if(var_03 < var_00.size)
		{
			return var_00[var_03];
		}
		else
		{
			return var_01[var_03 - var_00.size];
		}
	}

	return var_00[randomint(var_00.size)];
}

//Function Number: 41
func_3F3F()
{
	var_00 = [];
	if(isdefined(self.attacker) && self method_8402(self.attacker))
	{
		if(self.var_104 <= 120 || self.var_104 > -120)
		{
			var_00 = animscripts\utility::func_5860("death","melee_crouching_front");
		}
		else if(self.var_104 <= -60 && self.var_104 > 60)
		{
			var_00 = animscripts\utility::func_5860("death","melee_crouching_back");
		}
		else if(self.var_104 < 0)
		{
			var_00 = animscripts\utility::func_5860("death","melee_crouching_left");
		}
		else
		{
			var_00 = animscripts\utility::func_5860("death","melee_crouching_right");
		}
	}
	else
	{
		if(animscripts\utility::func_25A5("head","neck"))
		{
			var_00 = animscripts\utility::func_5860("death","crouch_head");
		}

		if(animscripts\utility::func_25A5("torso_upper","torso_lower","left_arm_upper","right_arm_upper","neck"))
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","crouch_torso"));
		}

		if(var_00.size < 2)
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","crouch_default1"));
		}

		if(var_00.size < 2)
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("death","crouch_default2"));
		}
	}

	return var_00[randomint(var_00.size)];
}

//Function Number: 42
func_409A()
{
	if(isdefined(self.var_7.var_701E))
	{
		return %prone_death_quickdeath;
	}

	return %dying_crawl_death_v1;
}

//Function Number: 43
func_3F0D()
{
	var_00 = animscripts\utility::func_CD8(%dying_back_death_v1,%dying_back_death_v2,%dying_back_death_v3,%dying_back_death_v4);
	return var_00[randomint(var_00.size)];
}

//Function Number: 44
func_3801()
{
	if(!isdefined(self.weapon) || !animscripts\utility::func_9C2D() || !weaponisauto(self.weapon) || self.var_120)
	{
		return 0;
	}

	if(self.var_7.var_A2D9["right"] == "none")
	{
		return 0;
	}

	return 1;
}

//Function Number: 45
func_988C(param_00)
{
	return param_00;
}

//Function Number: 46
func_988D(param_00)
{
	return param_00;
}

//Function Number: 47
func_6D94()
{
	if(isdefined(self.juggernaut) || isdefined(self.var_5A77))
	{
		return 0;
	}

	if(self.var_FE != "none")
	{
		return 0;
	}

	var_00 = [];
	if(self.var_7.var_5F58 != "run")
	{
		if(self.var_104 > 135 || self.var_104 <= -135)
		{
			var_00[var_00.size] = func_988C(%death_explosion_stand_b_v1);
			var_00[var_00.size] = func_988C(%death_explosion_stand_b_v2);
			var_00[var_00.size] = func_988C(%death_explosion_stand_b_v3);
			var_00[var_00.size] = func_988C(%death_explosion_stand_b_v4);
		}
		else if(self.var_104 > 45 && self.var_104 <= 135)
		{
			var_00[var_00.size] = func_988C(%death_explosion_stand_l_v1);
			var_00[var_00.size] = func_988C(%death_explosion_stand_l_v2);
			var_00[var_00.size] = func_988C(%death_explosion_stand_l_v3);
		}
		else if(self.var_104 > -45 && self.var_104 <= 45)
		{
			var_00[var_00.size] = func_988C(%death_explosion_stand_f_v1);
			var_00[var_00.size] = func_988C(%death_explosion_stand_f_v2);
			var_00[var_00.size] = func_988C(%death_explosion_stand_f_v3);
			var_00[var_00.size] = func_988C(%death_explosion_stand_f_v4);
		}
		else
		{
			var_00[var_00.size] = func_988C(%death_explosion_stand_r_v1);
			var_00[var_00.size] = func_988C(%death_explosion_stand_r_v2);
		}
	}
	else if(self.var_104 > 135 || self.var_104 <= -135)
	{
		var_00[var_00.size] = func_988C(%death_explosion_run_b_v1);
		var_00[var_00.size] = func_988C(%death_explosion_run_b_v2);
	}
	else if(self.var_104 > 45 && self.var_104 <= 135)
	{
		var_00[var_00.size] = func_988C(%death_explosion_run_l_v1);
		var_00[var_00.size] = func_988C(%death_explosion_run_l_v2);
	}
	else if(self.var_104 > -45 && self.var_104 <= 45)
	{
		var_00[var_00.size] = func_988C(%death_explosion_run_f_v1);
		var_00[var_00.size] = func_988C(%death_explosion_run_f_v2);
		var_00[var_00.size] = func_988C(%death_explosion_run_f_v3);
		var_00[var_00.size] = func_988C(%death_explosion_run_f_v4);
	}
	else
	{
		var_00[var_00.size] = func_988C(%death_explosion_run_r_v1);
		var_00[var_00.size] = func_988C(%death_explosion_run_r_v2);
	}

	var_01 = var_00[randomint(var_00.size)];
	if(getdvar("scr_expDeathMayMoveCheck","on") == "on")
	{
		var_02 = getmovedelta(var_01,0,1);
		var_03 = self localtoworldcoords(var_02);
		if(!self method_81C3(var_03,0))
		{
			return 0;
		}
	}

	self method_818E("nogravity");
	func_6A3A(var_01);
	return 1;
}