/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: pain.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 53
 * Decompile Time: 1911 ms
 * Timestamp: 4/20/2022 8:20:41 PM
*******************************************************************/

//Function Number: 1
func_4C9C()
{
	var_00 = [];
	var_00["damage_shield_crouch"] = %exposed_crouch_extendedpaina;
	var_00["damage_shield_pain_array"] = [%stand_exposed_extendedpain_chest,%stand_exposed_extendedpain_head_2_crouch,%stand_exposed_extendedpain_hip_2_crouch];
	var_00["back"] = %back_pain;
	var_00["run_long"] = [%run_pain_leg,%run_pain_shoulder,%run_pain_stomach_stumble,%run_pain_head,%run_pain_fallonknee_02,%run_pain_stomach,%run_pain_stumble,%run_pain_stomach_fast,%run_pain_leg_fast,%run_pain_fall];
	var_00["run_medium"] = [%run_pain_fallonknee_02,%run_pain_stomach,%run_pain_stumble,%run_pain_stomach_fast,%run_pain_leg_fast,%run_pain_fall];
	var_00["run_short"] = [%run_pain_fallonknee,%run_pain_fallonknee_03];
	var_00["pistol_torso_upper"] = [%pistol_stand_pain_chest,%pistol_stand_pain_rightshoulder,%pistol_stand_pain_leftshoulder];
	var_00["pistol_torso_lower"] = [%pistol_stand_pain_chest,%pistol_stand_pain_groin];
	var_00["pistol_neck"] = [%pistol_stand_pain_chest,%pistol_stand_pain_head];
	var_00["pistol_head"] = [%pistol_stand_pain_head];
	var_00["pistol_leg"] = [%pistol_stand_pain_groin];
	var_00["pistol_left_arm_upper"] = [%pistol_stand_pain_chest,%pistol_stand_pain_leftshoulder];
	var_00["pistol_right_arm_upper"] = [%pistol_stand_pain_chest,%pistol_stand_pain_rightshoulder];
	var_00["pistol_left_arm_lower"] = [%pistol_stand_pain_leftshoulder];
	var_00["pistol_right_arm_lower"] = [%pistol_stand_pain_rightshoulder];
	var_00["pistol_default1"] = [%pistol_stand_pain_chest];
	var_00["pistol_default2"] = [%pistol_stand_pain_groin];
	var_00["torso_pistol"] = %pistol_stand_pain_chest;
	var_00["torso_upper"] = [%exposed_pain_face,%stand_exposed_extendedpain_neck];
	var_00["torso_upper_extended"] = [%stand_exposed_extendedpain_gut,%stand_exposed_extendedpain_stomach,%stand_exposed_extendedpain_head_2_crouch];
	var_00["torso_lower"] = [%exposed_pain_groin,%stand_exposed_extendedpain_hip];
	var_00["torso_lower_extended"] = [%stand_exposed_extendedpain_gut,%stand_exposed_extendedpain_stomach,%stand_exposed_extendedpain_hip_2_crouch,%stand_exposed_extendedpain_feet_2_crouch,%stand_exposed_extendedpain_stomach];
	var_00["head"] = [%exposed_pain_face,%stand_exposed_extendedpain_neck];
	var_00["head_extended"] = [%stand_exposed_extendedpain_head_2_crouch];
	var_00["right_arm"] = [%exposed_pain_right_arm];
	var_00["right_arm_extended"] = [];
	var_00["left_arm"] = [%stand_exposed_extendedpain_shoulderswing];
	var_00["left_arm_extended"] = [%stand_exposed_extendedpain_shoulder_2_crouch];
	var_00["leg"] = [%exposed_pain_groin,%stand_exposed_extendedpain_hip];
	var_00["leg_extended"] = [%stand_exposed_extendedpain_hip_2_crouch,%stand_exposed_extendedpain_feet_2_crouch,%stand_exposed_extendedpain_stomach];
	var_00["foot"] = [%stand_exposed_extendedpain_thigh];
	var_00["foot_extended"] = [%stand_exposed_extendedpain_feet_2_crouch];
	var_00["default_long"] = [%exposed_pain_2_crouch,%stand_extendedpainb];
	var_00["default_short"] = [%exposed_pain_right_arm,%exposed_pain_face,%exposed_pain_groin];
	var_00["default_extended"] = [%stand_extendedpainc,%stand_exposed_extendedpain_chest];
	var_00["crouch_longdeath"] = [%exposed_crouch_extendedpaina];
	var_00["crouch_default"] = [%exposed_crouch_pain_chest,%exposed_crouch_pain_headsnap,%exposed_crouch_pain_flinch];
	var_00["crouch_left_arm"] = [%exposed_crouch_pain_left_arm];
	var_00["crouch_right_arm"] = [%exposed_crouch_pain_right_arm];
	var_00["prone"] = [%prone_reaction_a,%prone_reaction_b];
	var_00["cover_left_stand"] = [%corner_standl_painb,%corner_standl_painc,%corner_standl_paind,%corner_standl_paine];
	var_00["cover_left_crouch"] = [%cornercrl_painb];
	var_00["cover_right_stand"] = [%corner_standr_pain,%corner_standr_painb,%corner_standr_painc];
	var_00["cover_right_crouch"] = [%cornercrr_alert_paina,%cornercrr_alert_painc];
	var_00["cover_right_stand_B"] = %corner_standr_pain_b_2_alert;
	var_00["cover_left_stand_A"] = %corner_standl_pain_a_2_alert;
	var_00["cover_left_stand_B"] = %corner_standl_pain_b_2_alert;
	var_00["cover_crouch"] = [%covercrouch_pain_right,%covercrouch_pain_front,%covercrouch_pain_left_3];
	var_00["cover_stand"] = [%coverstand_pain_groin,%coverstand_pain_leg];
	var_00["cover_stand_aim"] = [%coverstand_pain_aim_2_hide_01,%coverstand_pain_aim_2_hide_02];
	var_00["smg_cover_stand_aim"] = [%smg_coverstand_pain_aim_2_hide_01,%smg_coverstand_pain_aim_2_hide_02];
	var_00["cover_crouch_aim"] = [%covercrouch_pain_aim_2_hide_01];
	var_00["saw_stand"] = %saw_gunner_pain;
	var_00["saw_crouch"] = %saw_gunner_lowwall_pain_02;
	var_00["saw_prone"] = %saw_gunner_prone_pain;
	level.var_CCA["soldier"]["pain"] = var_00;
	var_00 = [];
	var_00["prone_transition"] = [%dying_crawl_2_back];
	var_00["stand_transition"] = [%dying_stand_2_back_v1,%dying_stand_2_back_v2];
	var_00["crouch_transition"] = [%dying_crouch_2_back];
	var_00["default_transition"] = %dying_crawl_2_back;
	var_00["stand_2_crawl"] = [%dying_stand_2_crawl_v1,%dying_stand_2_crawl_v2,%dying_stand_2_crawl_v3];
	var_00["crouch_2_crawl"] = [%dying_crouch_2_crawl];
	var_00["crawl"] = %dying_crawl;
	var_00["death"] = [%dying_crawl_death_v1,%dying_crawl_death_v2];
	var_00["back_idle"] = %dying_back_idle;
	var_00["back_idle_twitch"] = [%dying_back_twitch_a,%dying_back_twitch_b];
	var_00["back_crawl"] = %dying_crawl_back;
	var_00["back_fire"] = %dying_back_fire;
	var_00["back_death"] = [%dying_back_death_v1,%dying_back_death_v2,%dying_back_death_v3];
	var_00["aim_4"] = %dying_back_aim_4;
	var_00["aim_6"] = %dying_back_aim_6;
	var_00["longdeath"] = [];
	var_00["longdeath"]["gut_b"] = [[%stand_2_longdeath_wander_gut,%longdeath_wander_gut,%longdeath_wander_gut_collapse,%longdeath_wander_gut_death],[%stand_2_longdeath_gut_wounded_b,%longdeath_gut_wounded_b_walk,%longdeath_gut_wounded_b_collapse],[%stand_2_longdeath_gut_b,%longdeath_gut_b_walk,%longdeath_gut_b_impact]];
	var_00["longdeath"]["gut_l"] = [[%stand_2_longdeath_gut_l,%longdeath_gut_l_walk,%longdeath_gut_l_impact]];
	var_00["longdeath"]["gut_r"] = [[%stand_2_longdeath_gut_r,%longdeath_gut_r_walk,%longdeath_gut_r_impact]];
	var_00["longdeath"]["leg_b"] = [[%stand_2_longdeath_wander_leg_1,%longdeath_wander_leg_1,%longdeath_wander_leg_collapse_1,%longdeath_wander_leg_death],[%stand_2_longdeath_wander_leg_2,%longdeath_wander_leg_2,%longdeath_wander_leg_collapse_2,%longdeath_wander_leg_death],[%stand_2_longdeath_leg_wounded_b_1,%longdeath_leg_wounded_b_walk_1,%longdeath_leg_wounded_b_collapse_1],[%stand_2_longdeath_leg_wounded_b_2,%longdeath_leg_wounded_b_walk_2,%longdeath_leg_wounded_b_collapse_2]];
	level.var_CCA["soldier"]["crawl_death"] = var_00;
	var_00 = [];
	var_00["pain"] = %corner_standr_death_grenade_hit;
	var_00["idle"] = %corner_standr_death_grenade_idle;
	var_00["release"] = %corner_standr_death_grenade_slump;
	var_00["premature_death"] = [%dying_back_death_v1,%dying_back_death_v2,%dying_back_death_v3,%dying_back_death_v4];
	level.var_CCA["soldier"]["corner_grenade_death"] = var_00;
	var_00 = [];
	var_00["default"] = [%pain_add_standing_belly,%pain_add_standing_left_arm,%pain_add_standing_right_arm];
	var_00["left_arm"] = %pain_add_standing_left_arm;
	var_00["right_arm"] = %pain_add_standing_right_arm;
	var_00["left_leg"] = %pain_add_standing_left_leg;
	var_00["right_leg"] = %pain_add_standing_right_leg;
	level.var_CCA["soldier"]["additive_pain"] = var_00;
}

//Function Number: 2
main()
{
	if(isdefined(self.var_584B))
	{
		self waittill("killanimscript");
		return;
	}

	if([[ level.var_664C ]]())
	{
		return;
	}

	if(self.var_7.var_2B1F)
	{
		return;
	}

	self notify("kill_long_death");
	self.var_35C3 = undefined;
	if(isdefined(self.var_7.var_665C))
	{
		self.var_7.var_55C4 = self.var_7.var_665C;
	}
	else
	{
		self.var_7.var_55C4 = 0;
	}

	self.var_7.var_665C = gettime();
	if(self.var_3F2 != "none")
	{
		self.var_7.var_6657 = 1;
	}
	else
	{
		self.var_7.var_6657 = undefined;
	}

	if(self.var_7.var_60DA)
	{
		self.health = 1;
	}

	self notify("anim entered pain");
	self endon("killanimscript");
	animscripts\utility::func_4DD4("pain");
	self method_818E("gravity");
	if(!isdefined(self.var_6104))
	{
		animscripts\face::func_7821("pain");
	}

	if(self.var_FE == "helmet")
	{
		animscripts\death::func_481D();
	}
	else if(func_A1BB() && randomint(2) == 0)
	{
		animscripts\death::func_481D();
	}

	if(isdefined(self.var_6655))
	{
		self [[ self.var_6655 ]]();
		return;
	}

	if(func_238E())
	{
		return;
	}

	if(func_8A2D(self.var_7.var_8A14))
	{
		return;
	}

	var_00 = func_4077();
	if(isdefined(var_00))
	{
		self.var_7.var_664E = function_0063(var_00);
	}

	func_6DCB(var_00);
}

//Function Number: 3
func_4DF4()
{
	level._effect["crawling_death_blood_smear"] = loadfx("vfx/blood/blood_smear_decal");
}

//Function Number: 4
end_script()
{
	if(isdefined(self.var_25AF))
	{
		self.var_25AE = undefined;
		self.var_25AF = undefined;
		self.var_34 = 1;
		if(!isdefined(self.var_6EE7))
		{
			self.ignoreme = 0;
		}

		self.var_6EE7 = undefined;
	}

	if(isdefined(self.var_14B4))
	{
		self.var_14B4 = undefined;
		self.var_34 = 1;
	}

	self method_8142(%head,0.2);
	self.var_35C3 = undefined;
}

//Function Number: 5
func_A1BB()
{
	if(isexplosivedamagemod(self.var_FF))
	{
		return 1;
	}

	if(gettime() - level.lastcarexplosiontime <= 50)
	{
		var_00 = level.lastcarexplosionrange * level.lastcarexplosionrange * 1.2 * 1.2;
		if(distancesquared(self.var_2E6,level.lastcarexplosiondamagelocation) < var_00)
		{
			var_01 = var_00 * 0.5 * 0.5;
			self.var_5A5A = distancesquared(self.var_2E6,level.lastcarexplosionlocation) < var_01;
			return 1;
		}
	}

	return 0;
}

//Function Number: 6
func_3F49()
{
	if(self.var_7.var_6E57 == "prone")
	{
		return;
	}

	if(isdefined(self.lastattacker) && isdefined(self.lastattacker.inliveplayerkillstreak) && self.lastattacker.inliveplayerkillstreak == self.inliveplayerkillstreak)
	{
		return;
	}

	if(!isdefined(self.var_25AE) || gettime() - self.var_7.var_55C4 > 1500)
	{
		self.var_25AE = randomintrange(2,3);
	}

	if(isdefined(self.lastattacker) && distancesquared(self.var_2E6,self.lastattacker.var_2E6) < squared(512))
	{
		self.var_25AE = 0;
	}

	if(self.var_25AE > 0)
	{
		self.var_25AE--;
		return;
	}

	self.var_25AF = 1;
	self.var_34 = 0;
	if(self.ignoreme)
	{
		self.var_6EE7 = 1;
	}
	else
	{
		self.ignoreme = 1;
	}

	if(animscripts\utility::func_9C32())
	{
		animscripts\shared::func_6866(self.alias,"right");
	}

	if(self.var_7.var_6E57 == "crouch")
	{
		return animscripts\utility::func_5860("pain","damage_shield_crouch");
	}

	var_00 = animscripts\utility::func_5860("pain","damage_shield_pain_array");
	return var_00[randomint(var_00.size)];
}

//Function Number: 7
func_4077()
{
	if(self.var_101 && !isdefined(self.var_2B02))
	{
		var_00 = func_3F49();
		if(isdefined(var_00))
		{
			return var_00;
		}
	}

	if(isdefined(self.var_7.var_644E))
	{
		if(self.var_7.var_6E57 == "crouch")
		{
			return animscripts\utility::func_5860("pain","back");
		}
		else
		{
			animscripts\notetracks::func_8EF7();
		}
	}

	if(self.var_7.var_6E57 == "stand")
	{
		var_01 = isdefined(self.node) && distancesquared(self.var_2E6,self.node.var_2E6) < 4096;
		if(!var_01 && self.var_7.var_5F58 == "run" && abs(self method_8190()) < 60)
		{
			return func_40BD();
		}

		self.var_7.var_5F58 = "stop";
		return func_40E7();
	}

	if(self.var_7.var_6E57 == "crouch")
	{
		self.var_7.var_5F58 = "stop";
		return func_3F40();
	}

	if(self.var_7.var_6E57 == "prone")
	{
		self.var_7.var_5F58 = "stop";
		return func_409B();
	}
}

//Function Number: 8
func_40BD()
{
	var_00 = [];
	var_01 = 0;
	var_02 = 0;
	var_03 = 0;
	if(self method_81C3(self localtoworldcoords((300,0,0))))
	{
		var_02 = 1;
		var_01 = 1;
	}
	else if(self method_81C3(self localtoworldcoords((200,0,0))))
	{
		var_01 = 1;
	}

	if(isdefined(self.var_7.var_2B19))
	{
		var_02 = 0;
		var_01 = 0;
	}

	if(var_02)
	{
		var_00 = animscripts\utility::func_5860("pain","run_long");
	}
	else if(var_01)
	{
		var_00 = animscripts\utility::func_5860("pain","run_medium");
	}
	else if(self method_81C3(self localtoworldcoords((120,0,0))))
	{
		var_00 = animscripts\utility::func_5860("pain","run_short");
	}

	if(!var_00.size)
	{
		self.var_7.var_5F58 = "stop";
		return func_40E7();
	}

	return var_00[randomint(var_00.size)];
}

//Function Number: 9
func_40E9()
{
	var_00 = [];
	if(animscripts\utility::func_25A5("torso_upper"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_torso_upper");
	}
	else if(animscripts\utility::func_25A5("torso_lower"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_torso_lower");
	}
	else if(animscripts\utility::func_25A5("neck"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_neck");
	}
	else if(animscripts\utility::func_25A5("head"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_head");
	}
	else if(animscripts\utility::func_25A5("left_leg_upper","right_leg_upper"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_leg");
	}
	else if(animscripts\utility::func_25A5("left_arm_upper"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_left_arm_upper");
	}
	else if(animscripts\utility::func_25A5("left_arm_lower"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_left_arm_lower");
	}
	else if(animscripts\utility::func_25A5("right_arm_upper"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_right_arm_upper");
	}
	else if(animscripts\utility::func_25A5("right_arm_lower"))
	{
		var_00 = animscripts\utility::func_5860("pain","pistol_right_arm_lower");
	}

	if(var_00.size < 2)
	{
		var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("pain","pistol_default1"));
	}

	if(var_00.size < 2)
	{
		var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("pain","pistol_default2"));
	}

	return var_00[randomint(var_00.size)];
}

//Function Number: 10
func_40E7()
{
	if(animscripts\utility::func_9C32())
	{
		return func_40E9();
	}

	var_00 = [];
	var_01 = [];
	if(animscripts\utility::func_25A5("torso_upper"))
	{
		var_00 = animscripts\utility::func_5860("pain","torso_upper");
		var_01 = animscripts\utility::func_5860("pain","torso_upper_extended");
	}
	else if(animscripts\utility::func_25A5("torso_lower"))
	{
		var_00 = animscripts\utility::func_5860("pain","torso_lower");
		var_01 = animscripts\utility::func_5860("pain","torso_lower_extended");
	}
	else if(animscripts\utility::func_25A5("head","helmet","neck"))
	{
		var_00 = animscripts\utility::func_5860("pain","head");
		var_01 = animscripts\utility::func_5860("pain","head_extended");
	}
	else if(animscripts\utility::func_25A5("right_arm_upper","right_arm_lower"))
	{
		var_00 = animscripts\utility::func_5860("pain","right_arm");
		var_01 = animscripts\utility::func_5860("pain","right_arm_extended");
	}
	else if(animscripts\utility::func_25A5("left_arm_upper","left_arm_lower"))
	{
		var_00 = animscripts\utility::func_5860("pain","left_arm");
		var_01 = animscripts\utility::func_5860("pain","left_arm_extended");
	}
	else if(animscripts\utility::func_25A5("left_leg_upper","right_leg_upper"))
	{
		var_00 = animscripts\utility::func_5860("pain","leg");
		var_01 = animscripts\utility::func_5860("pain","leg_extended");
	}
	else if(animscripts\utility::func_25A5("left_foot","right_foot","left_leg_lower","right_leg_lower"))
	{
		var_00 = animscripts\utility::func_5860("pain","foot");
		var_01 = animscripts\utility::func_5860("pain","foot_extended");
	}

	if(var_00.size < 2)
	{
		if(!self.var_7.var_2B17)
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("pain","default_long"));
		}
		else
		{
			var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("pain","default_short"));
		}
	}

	if(var_01.size < 2)
	{
		var_01 = common_scripts\utility::array_combine(var_01,animscripts\utility::func_5860("pain","default_extended"));
	}

	if(!self.var_101 && !self.var_7.var_2B17)
	{
		var_02 = randomint(var_00.size + var_01.size);
		if(var_02 < var_00.size)
		{
			return var_00[var_02];
		}
		else
		{
			return var_01[var_02 - var_00.size];
		}
	}

	return var_00[randomint(var_00.size)];
}

//Function Number: 11
func_3F40()
{
	var_00 = [];
	if(!self.var_101 && !self.var_7.var_2B17)
	{
		var_00 = animscripts\utility::func_5860("pain","crouch_longdeath");
	}

	var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("pain","crouch_default"));
	if(animscripts\utility::func_25A5("left_hand","left_arm_lower","left_arm_upper"))
	{
		var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("pain","crouch_left_arm"));
	}

	if(animscripts\utility::func_25A5("right_hand","right_arm_lower","right_arm_upper"))
	{
		var_00 = common_scripts\utility::array_combine(var_00,animscripts\utility::func_5860("pain","crouch_right_arm"));
	}

	return var_00[randomint(var_00.size)];
}

//Function Number: 12
func_409B()
{
	var_00 = animscripts\utility::func_5860("pain","prone");
	return var_00[randomint(var_00.size)];
}

//Function Number: 13
func_6DCB(param_00)
{
	var_01 = 1;
	func_664A("painanim",param_00,%body,1,0.1,var_01);
	if(self.var_7.var_6E57 == "prone")
	{
		self method_81FB(%prone_legs_up,%prone_legs_down,1,0.1,1);
	}

	if(animhasnotetrack(param_00,"start_aim"))
	{
		thread func_6232("painanim");
		self endon("start_aim");
	}

	if(animhasnotetrack(param_00,"code_move"))
	{
		animscripts\shared::func_2D05("painanim");
	}

	animscripts\shared::func_2D05("painanim");
}

//Function Number: 14
func_6232(param_00)
{
	self endon("killanimscript");
	self waittillmatch("start_aim",param_00);
	self notify("start_aim");
}

//Function Number: 15
func_8A2E()
{
	self endon("killanimscript");
	self.var_14B4 = 1;
	self.var_34 = 0;
	wait(0.5);
	self.var_14B4 = undefined;
	self.var_34 = 1;
}

//Function Number: 16
func_8A2D(param_00)
{
	if(param_00 == "none")
	{
		return 0;
	}

	self.var_7.var_8A14 = "none";
	thread func_8A2E();
	switch(param_00)
	{
		case "cover_left":
			break;

		case "cover_right":
			break;

		case "cover_right_stand_A":
			break;

		case "cover_right_stand_B":
			break;

		case "cover_left_stand_A":
			break;

		case "cover_left_stand_B":
			break;

		case "cover_crouch":
			break;

		case "cover_stand":
			break;

		case "cover_stand_aim":
			break;

		case "smg_cover_stand_aim":
			break;

		case "cover_crouch_aim":
			break;

		case "saw":
			break;

		case "mg42":
			break;

		case "minigun":
			break;

		case "corner_right_martyrdom":
			break;

		case "rambo_right":
		case "rambo_left":
		case "dying_crawl":
		case "rambo":
			break;

		default:
			break;
	}
}

//Function Number: 17
func_6654()
{
	self endon("death");
	wait(0.05);
	self notify("pain_death");
}

//Function Number: 18
func_2D6E(param_00)
{
	var_01 = param_00[randomint(param_00.size)];
	func_6649("painanim",var_01,1,0.3,1);
	animscripts\shared::func_2D05("painanim");
}

//Function Number: 19
func_2D6D(param_00)
{
	func_6649("painanim",param_00,1,0.3,1);
	animscripts\shared::func_2D05("painanim");
}

//Function Number: 20
func_5BCC(param_00)
{
	func_6649("painanim",level.var_5BBC["pain_" + param_00],1,0.1,1);
	animscripts\shared::func_2D05("painanim");
}

//Function Number: 21
func_A050(param_00,param_01)
{
	self endon("killanimscript");
	self endon("death");
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	wait(param_00);
	self.var_7.var_5F58 = "stop";
}

//Function Number: 22
func_238E()
{
	if(self.var_7.var_2B17 || self.var_120 || self.var_101)
	{
		return 0;
	}

	if(self.var_3F2 != "none")
	{
		return 0;
	}

	if(isdefined(self.var_7.var_644E))
	{
		return 0;
	}

	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		return 0;
	}

	var_00 = animscripts\utility::func_25A5("left_leg_upper","left_leg_lower","right_leg_upper","right_leg_lower","left_foot","right_foot");
	if(isdefined(self.var_39C0))
	{
		func_7F3C(var_00);
		self.health = 10;
		thread func_2391();
		self waittill("killanimscript");
		return 1;
	}

	if(self.health > 100)
	{
		return 0;
	}

	if(var_00 && self.health < self.var_275 * 0.4)
	{
		if(gettime() < level.var_60C5)
		{
			return 0;
		}
	}
	else
	{
		if(level.var_6297 > 0)
		{
			return 0;
		}

		if(gettime() < level.var_60C4)
		{
			return 0;
		}
	}

	if(isdefined(self.var_265F))
	{
		return 0;
	}

	foreach(var_02 in level.var_328)
	{
		if(distancesquared(self.var_2E6,var_02.var_2E6) < 30625)
		{
			return 0;
		}
	}

	if(animscripts\utility::func_25A5("head","helmet","gun","right_hand","left_hand"))
	{
		return 0;
	}

	if(animscripts\utility::func_9C32())
	{
		return 0;
	}

	func_7F3C(var_00);
	if(!isdefined(self.var_7.var_8F6A) && !func_50E9(self.var_7.var_2390))
	{
		return 0;
	}

	anim.var_60C4 = gettime() + 3000;
	anim.var_60C5 = gettime() + 3000;
	thread func_2391();
	self waittill("killanimscript");
	return 1;
}

//Function Number: 23
func_7F3C(param_00)
{
	var_01 = [];
	var_02 = undefined;
	if(self.var_7.var_6E57 == "stand")
	{
		var_02 = func_847E(param_00);
		if(isdefined(var_02))
		{
			var_01 = [var_02[0]];
		}
		else
		{
			var_01 = animscripts\utility::func_5860("crawl_death","stand_transition");
		}
	}
	else if(self.var_7.var_6E57 == "crouch")
	{
		var_01 = animscripts\utility::func_5860("crawl_death","crouch_transition");
	}
	else
	{
		var_01 = animscripts\utility::func_5860("crawl_death","prone_transition");
	}

	self.var_7.var_2390 = var_01[randomint(var_01.size)];
	self.var_7.var_8F6A = var_02;
}

//Function Number: 24
func_50E9(param_00)
{
	if(isdefined(self.var_7.var_399B))
	{
		return 1;
	}

	var_01 = getmovedelta(param_00,0,1);
	var_02 = self localtoworldcoords(var_01);
	return self method_81C3(var_02);
}

//Function Number: 25
func_2391()
{
	self endon("kill_long_death");
	self endon("death");
	thread func_6F4F("crawling");
	self.var_7.var_8A14 = "none";
	self.var_8A26 = undefined;
	self method_81FF();
	thread func_6654();
	level notify("ai_crawling",self);
	self method_8147(%dying,%body,1,0.1,1);
	if(isdefined(self.var_7.var_8F6A))
	{
		func_8F69();
		self.var_7.var_8F6A = undefined;
		return;
	}

	if(!func_2FD2())
	{
		return;
	}

	func_6649("transition",self.var_7.var_2390,1,0.5,1);
	animscripts\notetracks::func_2D0F("transition",::func_4649);
	self.var_7.var_8A14 = "dying_crawl";
	thread func_2FD4();
	if(isdefined(self.enemy))
	{
		self method_81FF(self.enemy);
	}

	func_273F();
	while(func_8497())
	{
		var_00 = animscripts\utility::func_5860("crawl_death","back_crawl");
		if(!func_50E9(var_00))
		{
			break;
		}

		func_664B("back_crawl",var_00,1,0.1,1);
		animscripts\notetracks::func_2D0F("back_crawl",::func_4649);
	}

	self.var_28B6 = gettime() + randomintrange(4000,20000);
	while(func_84AD())
	{
		if(animscripts\utility::func_1AE1() && func_0977())
		{
			var_01 = animscripts\utility::func_5860("crawl_death","back_fire");
			func_664B("back_idle_or_fire",var_01,1,0.2,1);
			animscripts\shared::func_2D05("back_idle_or_fire");
			continue;
		}

		var_01 = animscripts\utility::func_5860("crawl_death","back_idle");
		if(randomfloat(1) < 0.4)
		{
			var_02 = animscripts\utility::func_5860("crawl_death","back_idle_twitch");
			var_01 = var_02[randomint(var_02.size)];
		}

		func_664B("back_idle_or_fire",var_01,1,0.1,1);
		var_03 = function_0063(var_01);
		while(var_03 > 0)
		{
			if(animscripts\utility::func_1AE1() && func_0977())
			{
				break;
			}

			var_04 = 0.5;
			if(var_04 > var_03)
			{
				var_04 = var_03;
				var_03 = 0;
				continue;
			}

			var_03 = var_03 - var_04;
			animscripts\notetracks::func_2D0A(var_04,"back_idle_or_fire");
		}
	}

	self notify("end_dying_crawl_back_aim");
	self method_8142(%dying_back_aim_4_wrapper,0.3);
	self method_8142(%dying_back_aim_6_wrapper,0.3);
	var_05 = animscripts\utility::func_5860("crawl_death","back_death");
	self.var_2651 = var_05[randomint(var_05.size)];
	func_53B4();
	self.var_7.var_8A14 = "none";
	self.var_8A26 = undefined;
}

//Function Number: 26
func_847E(param_00)
{
	if(self.var_7.var_6E57 != "stand")
	{
		return;
	}

	var_01 = 2;
	if(randomint(10) > var_01)
	{
		return;
	}

	var_02 = 0;
	if(!param_00)
	{
		var_02 = animscripts\utility::func_25A5("torso_upper","torso_lower");
		if(!var_02)
		{
			return;
		}
	}

	var_03 = 0;
	var_04 = "leg";
	var_05 = "b";
	if(param_00)
	{
		var_03 = 200;
	}
	else
	{
		var_04 = "gut";
		var_03 = 128;
		if(45 < self.var_104 && self.var_104 < 135)
		{
			var_05 = "l";
		}
		else if(-135 < self.var_104 && self.var_104 < -45)
		{
			var_05 = "r";
		}
		else if(-45 < self.var_104 && self.var_104 < 45)
		{
			return;
		}
	}

	switch(var_05)
	{
		case "b":
			break;

		case "l":
			break;

		case "r":
			break;

		default:
			break;
	}
}

//Function Number: 27
func_8F69()
{
	func_664B("stumblingPainInto",self.var_7.var_8F6A[0]);
	animscripts\shared::func_2D05("stumblingPainInto");
	self.var_7.var_8A14 = "stumbling_pain";
	var_00 = getmovedelta(self.var_7.var_8F6A[2]);
	var_01 = function_0063(self.var_7.var_8F6A[2]) * 1000;
	for(var_02 = randomint(2) + 1;var_02 > 0;var_02--)
	{
		var_03 = anglestoforward(self.var_41);
		var_04 = self.var_2E6 + var_03 * var_00;
		if(!self method_81C3(var_04))
		{
			break;
		}

		func_664B("stumblingPain",self.var_7.var_8F6A[1]);
		animscripts\shared::func_2D05("stumblingPain");
	}

	self.var_7.var_612B = 1;
	self.var_7.var_8A14 = "none";
	func_664B("stumblingPainCollapse",self.var_7.var_8F6A[2],1,0.75);
	animscripts\notetracks::func_2D0F("stumblingPainCollapse",::func_8F6B);
	animscripts\shared::func_2D05("stumblingPainCollapse");
	func_53B4();
}

//Function Number: 28
func_8F6B(param_00)
{
	if(param_00 == "start_ragdoll")
	{
		animscripts\notetracks::func_4669(param_00,"stumblingPainCollapse");
		return 1;
	}
}

//Function Number: 29
func_84AD()
{
	if(!func_32B0(anglestoforward(self.var_41)))
	{
		return 0;
	}

	return gettime() < self.var_28B6;
}

//Function Number: 30
func_2FD2()
{
	if(!isdefined(self.var_39C0))
	{
		if(self.var_7.var_6E57 == "prone")
		{
			return 1;
		}

		if(self.var_7.var_5F58 == "stop")
		{
			if(randomfloat(1) < 0.4)
			{
				if(randomfloat(1) < 0.5)
				{
					return 1;
				}
			}
			else if(abs(self.var_104) > 90)
			{
				return 1;
			}
		}
		else if(abs(self method_8190()) > 90)
		{
			return 1;
		}
	}

	if(self.var_7.var_6E57 != "prone")
	{
		var_00 = animscripts\utility::func_5860("crawl_death",self.var_7.var_6E57 + "_2_crawl");
		var_01 = var_00[randomint(var_00.size)];
		if(!func_50E9(var_01))
		{
			return 1;
		}

		thread func_2FD5();
		func_6649("falling",var_01,1,0.5,1);
		animscripts\shared::func_2D05("falling");
	}
	else
	{
		thread func_2FD5();
	}

	self.var_7.var_2390 = animscripts\utility::func_5860("crawl_death","default_transition");
	self.var_7.var_8A14 = "dying_crawl";
	func_273F();
	var_02 = animscripts\utility::func_5860("crawl_death","crawl");
	while(func_8497())
	{
		if(!func_50E9(var_02))
		{
			return 1;
		}

		if(isdefined(self.var_253A))
		{
			self playsoundasmaster(self.var_253A);
		}

		func_664B("crawling",var_02,1,0.1,1);
		animscripts\shared::func_2D05("crawling");
	}

	self notify("done_crawling");
	if(!isdefined(self.var_39C0) && func_32B0(anglestoforward(self.var_41) * -1))
	{
		return 1;
	}

	var_03 = animscripts\utility::func_5860("crawl_death","death");
	var_04 = var_03[randomint(var_03.size)];
	if(var_04 != %dying_crawl_death_v2)
	{
		self.var_7.var_612B = 1;
	}

	animscripts\death::func_6A3A(var_04);
	func_53B4();
	self.var_7.var_8A14 = "none";
	self.var_8A26 = undefined;
	return 0;
}

//Function Number: 31
func_2FD5()
{
	self endon("death");
	if(self.var_7.var_6E57 != "prone")
	{
		for(;;)
		{
			self waittill("falling",var_00);
			if(issubstr(var_00,"bodyfall"))
			{
				break;
			}
		}
	}

	var_01 = "J_SpineLower";
	var_02 = "tag_origin";
	var_03 = 0.25;
	var_04 = level._effect["crawling_death_blood_smear"];
	if(isdefined(self.var_7.var_238A))
	{
		var_03 = self.var_7.var_238A;
	}

	if(isdefined(self.var_7.var_2389))
	{
		var_04 = level._effect[self.var_7.var_2389];
	}

	while(var_03)
	{
		var_05 = self gettagorigin(var_01);
		var_06 = self gettagangles(var_02);
		var_07 = anglestoright(var_06);
		var_08 = anglestoforward((270,0,0));
		playfx(var_04,var_05,var_08,var_07);
		wait(var_03);
	}
}

//Function Number: 32
func_2FD4()
{
	self endon("kill_long_death");
	self endon("death");
	self endon("end_dying_crawl_back_aim");
	if(isdefined(self.var_2FD3))
	{
		return;
	}

	self.var_2FD3 = 1;
	self method_814C(animscripts\utility::func_5860("crawl_death","aim_4"),1,0);
	self method_814C(animscripts\utility::func_5860("crawl_death","aim_6"),1,0);
	var_00 = 0;
	for(;;)
	{
		var_01 = animscripts\utility::func_4172();
		var_02 = angleclamp180(var_01 - var_00);
		if(abs(var_02) > 3)
		{
			var_02 = common_scripts\utility::sign(var_02) * 3;
		}

		var_01 = angleclamp180(var_00 + var_02);
		if(var_01 < 0)
		{
			if(var_01 < -45)
			{
				var_01 = -45;
			}

			var_03 = var_01 / -45;
			self method_814B(%dying_back_aim_4_wrapper,var_03,0.05);
			self method_814B(%dying_back_aim_6_wrapper,0,0.05);
		}
		else
		{
			if(var_01 > 45)
			{
				var_01 = 45;
			}

			var_03 = var_01 / 45;
			self method_814B(%dying_back_aim_6_wrapper,var_03,0.05);
			self method_814B(%dying_back_aim_4_wrapper,0,0.05);
		}

		var_00 = var_01;
		wait(0.05);
	}
}

//Function Number: 33
func_8D08()
{
	self endon("kill_long_death");
	self endon("death");
	wait(0.5);
	thread func_2FD4();
}

//Function Number: 34
func_4649(param_00)
{
	if(param_00 == "fire_spray")
	{
		if(!animscripts\utility::func_1AE1())
		{
			return 1;
		}

		if(!func_0977())
		{
			return 1;
		}

		animscripts\utility::func_83EC();
		return 1;
	}
	else if(param_00 == "pistol_pickup")
	{
		thread func_8D08();
		return 0;
	}

	return 0;
}

//Function Number: 35
func_0977()
{
	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		var_00 = animscripts\combat_utility::func_3DB0(self.enemy);
	}
	else
	{
		var_00 = self.enemy method_8097();
	}

	var_01 = self method_81B9();
	var_02 = vectortoangles(var_00 - self method_81B8());
	var_03 = animscripts\utility::func_6C4(var_01[1] - var_02[1]);
	if(var_03 > level.var_6660)
	{
		if(distancesquared(self geteye(),var_00) > level.var_665E || var_03 > level.var_665F)
		{
			return 0;
		}
	}

	return animscripts\utility::func_6C4(var_01[0] - var_02[0]) <= level.var_6658;
}

//Function Number: 36
func_32B0(param_00)
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		var_01 = animscripts\combat_utility::func_3DB0(self.enemy);
	}
	else
	{
		var_01 = self.enemy method_8097();
	}

	var_02 = vectornormalize(var_01 - self geteye());
	return vectordot(var_02,param_00) > 0.5;
}

//Function Number: 37
func_6F4F(param_00)
{
	self endon("kill_long_death");
	self endon("death");
	self.var_38A6 = 1;
	self.var_584B = 1;
	self.var_7.var_2CE6 = 1;
	self notify("long_death");
	self.health = 10000;
	self.var_4B2 = self.var_4B2 - 2000;
	wait(0.75);
	if(self.health > 1)
	{
		self.health = 1;
	}

	wait(0.05);
	self.var_584B = undefined;
	self.var_7.var_5A5C = 1;
	if(param_00 == "crawling")
	{
		wait(1);
		if(isdefined(level.var_31D) && distancesquared(self.var_2E6,level.var_31D.var_2E6) < 1048576)
		{
			anim.var_6297 = randomintrange(10,30);
			anim.var_60C4 = gettime() + randomintrange(15000,60000);
		}
		else
		{
			anim.var_6297 = randomintrange(5,12);
			anim.var_60C4 = gettime() + randomintrange(5000,25000);
		}

		anim.var_60C5 = gettime() + randomintrange(7000,13000);
		return;
	}

	if(param_00 == "corner_grenade")
	{
		wait(1);
		if(isdefined(level.var_31D) && distancesquared(self.var_2E6,level.var_31D.var_2E6) < 490000)
		{
			anim.var_6296 = randomintrange(10,30);
			anim.var_60C3 = gettime() + randomintrange(15000,60000);
			return;
		}

		anim.var_6296 = randomintrange(5,12);
		anim.var_60C3 = gettime() + randomintrange(5000,25000);
		return;
	}
}

//Function Number: 38
func_273F()
{
	if(isdefined(self.var_7.var_399B))
	{
		self.var_7.var_6294 = self.var_7.var_399B;
		return;
	}

	self.var_7.var_6294 = randomintrange(1,5);
}

//Function Number: 39
func_8497()
{
	if(!self.var_7.var_6294)
	{
		self.var_7.var_6294 = undefined;
		return 0;
	}

	self.var_7.var_6294--;
	return 1;
}

//Function Number: 40
func_988F()
{
	if(level.var_6296 > 0)
	{
		return 0;
	}

	if(gettime() < level.var_60C3)
	{
		return 0;
	}

	if(self.var_7.var_2B17 || self.var_120 || self.var_101)
	{
		return 0;
	}

	if(isdefined(self.var_265F))
	{
		return 0;
	}

	if(distance(self.var_2E6,level.var_31D.var_2E6) < 175)
	{
		return 0;
	}

	anim.var_60C3 = gettime() + 3000;
	thread func_2229();
	self waittill("killanimscript");
	return 1;
}

//Function Number: 41
func_2229()
{
	self endon("kill_long_death");
	self endon("death");
	thread func_6654();
	thread func_6F4F("corner_grenade");
	thread lib_A59A::func_7DD9(0);
	self.var_4B2 = -1000;
	func_664A("corner_grenade_pain",animscripts\utility::func_5860("corner_grenade_death","pain"),%body,1,0.1);
	self waittillmatch("dropgun","corner_grenade_pain");
	animscripts\shared::func_2F6B();
	self waittillmatch("anim_pose = \"back\","corner_grenade_pain");
	animscripts\notetracks::func_61DA();
	self waittillmatch("grenade_left","corner_grenade_pain");
	var_00 = getweaponmodel("fraggrenade");
	self attach(var_00,"tag_inhand");
	self.var_265F = ::func_6F08;
	self waittillmatch("end","corner_grenade_pain");
	var_01 = gettime() + randomintrange(25000,60000);
	func_664A("corner_grenade_idle",animscripts\utility::func_5860("corner_grenade_death","pain"),%body,1,0.2);
	thread func_A20C();
	while(!func_32AE())
	{
		if(gettime() >= var_01)
		{
			break;
		}

		animscripts\notetracks::func_2D0A(0.1,"corner_grenade_idle");
	}

	var_02 = animscripts\utility::func_5860("corner_grenade_death","release");
	func_664A("corner_grenade_release",var_02,%body,1,0.2);
	var_03 = getnotetracktimes(var_02,"grenade_drop");
	var_04 = var_03[0] * function_0063(var_02);
	wait(var_04 - 1);
	animscripts\death::playdeathsound();
	wait(0.7);
	self.var_265F = ::func_A0D3;
	var_05 = (0,0,30) - anglestoright(self.var_41) * 70;
	func_2224(var_05,randomfloatrange(2,3));
	wait(0.05);
	self detach(var_00,"tag_inhand");
	thread func_5376();
}

//Function Number: 42
func_2224(param_00,param_01)
{
	var_02 = self gettagorigin("tag_inhand");
	var_03 = var_02 + (0,0,20);
	var_04 = var_02 - (0,0,20);
	var_05 = bullettrace(var_03,var_04,0,undefined);
	if(var_05["fraction"] < 0.5)
	{
		var_02 = var_05["position"];
	}

	var_06 = "default";
	if(var_05["surfacetype"] != "none")
	{
		var_06 = var_05["surfacetype"];
	}

	thread func_6DD8("grenade_bounce_" + var_06,var_02);
	self.var_1D6 = "fraggrenade";
	self method_8038(var_02,param_00,param_01);
}

//Function Number: 43
func_6DD8(param_00,param_01)
{
	var_02 = spawn("script_origin",param_01);
	var_02 playsoundasmaster(param_00,"sounddone");
	var_02 waittill("sounddone");
	var_02 delete();
}

//Function Number: 44
func_5376()
{
	self.var_7.var_612B = 1;
	func_53B4();
	self startragdoll();
	wait(0.1);
	self notify("grenade_drop_done");
}

//Function Number: 45
func_53B4()
{
	if(isdefined(self.var_5517))
	{
		self method_8052(self.var_2E6,self.var_5517);
		return;
	}

	self method_8052();
}

//Function Number: 46
func_32AE()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(distancesquared(self.var_2E6,self.enemy.var_2E6) > 147456)
	{
		return 0;
	}

	if(distancesquared(self.var_2E6,self.enemy.var_2E6) < 16384)
	{
		return 1;
	}

	var_00 = self.enemy.var_2E6 + self.var_32CB * 3;
	var_01 = self.enemy.var_2E6;
	if(self.enemy.var_2E6 != var_00)
	{
		var_01 = pointonsegmentnearesttopoint(self.enemy.var_2E6,var_00,self.var_2E6);
	}

	if(distancesquared(self.var_2E6,var_01) < 16384)
	{
		return 1;
	}

	return 0;
}

//Function Number: 47
func_6F08()
{
	var_00 = animscripts\utility::func_5860("corner_grenade_death","premature_death");
	var_01 = var_00[randomint(var_00.size)];
	animscripts\death::playdeathsound();
	func_664A("corner_grenade_die",var_01,%body,1,0.2);
	var_02 = animscripts\combat_utility::func_3FAB();
	func_2224(var_02,3);
	var_03 = getweaponmodel("fraggrenade");
	self detach(var_03,"tag_inhand");
	wait(0.05);
	self startragdoll();
	self waittillmatch("end","corner_grenade_die");
}

//Function Number: 48
func_A0D3()
{
	self waittill("grenade_drop_done");
}

//Function Number: 49
func_A20C()
{
	self endon("kill_long_death");
	self endon("death");
	self.var_32CB = (0,0,0);
	var_00 = undefined;
	var_01 = self.var_2E6;
	var_02 = 0.15;
	for(;;)
	{
		if(isdefined(self.enemy) && isdefined(var_00) && self.enemy == var_00)
		{
			var_03 = self.enemy.var_2E6;
			self.var_32CB = var_03 - var_01 * 1 / var_02;
			var_01 = var_03;
		}
		else
		{
			if(isdefined(self.enemy))
			{
				var_01 = self.enemy.var_2E6;
			}
			else
			{
				var_01 = self.var_2E6;
			}

			var_00 = self.enemy;
			self.var_83F1 = (0,0,0);
		}

		wait(var_02);
	}
}

//Function Number: 50
func_07F0(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self endon("death");
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(self.var_2CE4))
	{
		return;
	}

	if(!isdefined(self.var_5A77) || isdefined(self.var_5A77) && !self.var_5A77)
	{
		if(param_00 < self.var_285)
		{
			return;
		}
	}
	else if(param_00 < self.var_285 / 3)
	{
		return;
	}

	self.var_2CE4 = 1;
	var_07 = undefined;
	if(animscripts\utility::func_25A5("left_arm_lower","left_arm_upper","left_hand"))
	{
		var_07 = animscripts\utility::func_5860("additive_pain","left_arm");
	}

	if(animscripts\utility::func_25A5("right_arm_lower","right_arm_upper","right_hand"))
	{
		var_07 = animscripts\utility::func_5860("additive_pain","right_arm");
	}
	else if(animscripts\utility::func_25A5("left_leg_upper","left_leg_lower","left_foot"))
	{
		var_07 = animscripts\utility::func_5860("additive_pain","left_leg");
	}
	else if(animscripts\utility::func_25A5("right_leg_upper","right_leg_lower","right_foot"))
	{
		var_07 = animscripts\utility::func_5860("additive_pain","right_leg");
	}
	else
	{
		var_08 = animscripts\utility::func_5860("additive_pain","default");
		var_07 = var_08[randomint(var_08.size)];
	}

	self method_814C(%add_pain,1,0.1,1);
	self method_814C(var_07,1,0,1);
	wait(0.4);
	self method_8142(var_07,0.2);
	self method_8142(%add_pain,0.2);
	self.var_2CE4 = undefined;
}

//Function Number: 51
func_6649(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0.2;
	}

	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	self method_8152(param_00,param_01,param_02,param_03,param_04);
	self.var_35C3 = animscripts\face::func_6D98(param_01,"pain",self.var_35C3);
}

//Function Number: 52
func_664B(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_03))
	{
		param_03 = 0.2;
	}

	if(!isdefined(param_04))
	{
		param_04 = 1;
	}

	self method_810D(param_00,param_01,param_02,param_03,param_04);
	self.var_35C3 = animscripts\face::func_6D98(param_01,"pain",self.var_35C3);
}

//Function Number: 53
func_664A(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	if(!isdefined(param_04))
	{
		param_04 = 0.2;
	}

	if(!isdefined(param_05))
	{
		param_05 = 1;
	}

	self method_8110(param_00,param_01,param_02,param_03,param_04,param_05);
	self.var_35C3 = animscripts\face::func_6D98(param_01,"pain",self.var_35C3);
}