/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: boost.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 452 ms
 * Timestamp: 4/20/2022 8:19:24 PM
*******************************************************************/

//Function Number: 1
func_6EB0()
{
	level._effect["boost_dust_npc"] = loadfx("vfx/smoke/jetpack_exhaust_npc");
	level._effect["boost_dust_impact_ground"] = loadfx("vfx/smoke/jetpack_ground_impact_runner");
}

//Function Number: 2
func_756F(param_00,param_01,param_02)
{
	var_03 = [];
	var_03["traverseAnim"] = param_00;
	var_03["traverseNotetrackFunc"] = ::func_60AE;
	if(isdefined(param_02) && param_02 == "landassist")
	{
		var_03["traverseNotetrackFunc"] = ::func_60AF;
	}

	self.var_5094 = 1;
	animscripts\traverse\shared::func_2D85(var_03);
	if(isdefined(self) && isalive(self) && isdefined(param_01) && param_01)
	{
		lib_A5DE::snd_message("boost_land_npc");
		self method_8110("boostJumpLand",%boost_jump_land_2_run_b,%body,1,0.2,1);
		animscripts\shared::func_2D05("boostJumpLand",::func_60AE);
	}

	self.var_5094 = undefined;
}

//Function Number: 3
func_60AF(param_00)
{
	switch(param_00)
	{
		case "boost_begin":
			break;

		case "land_assist":
			break;

		case "assist_thrusters":
			break;

		case "boost_end":
			break;

		case "distort_begin":
			break;

		default:
			break;
	}
}

//Function Number: 4
func_60AE(param_00)
{
	switch(param_00)
	{
		case "boost_begin":
			break;

		case "boost_end":
			break;

		default:
			break;
	}
}

//Function Number: 5
func_60AB()
{
	lib_A5DE::snd_message("boost_jump_npc");
	if(!lib_A59A::func_32DB("boost_end"))
	{
		lib_A59A::func_32DC("boost_end");
	}

	thread func_60AD();
	playfxontag(common_scripts\utility::getfx("boost_dust_npc"),self,"J_SpineLower");
	lib_A59A::func_32DF("boost_end");
	stopfxontag(common_scripts\utility::getfx("boost_dust_npc"),self,"J_SpineLower");
	lib_A59A::func_32D9("boost_end");
}

//Function Number: 6
func_60AC()
{
	lib_A59A::func_32DD("boost_end");
}

//Function Number: 7
func_60AD()
{
	var_00 = self.var_2E6 + (0,0,64);
	var_01 = self.var_2E6 - (0,0,150);
	var_02 = bullettrace(var_00,var_01,0,undefined);
	var_03 = common_scripts\utility::getfx("boost_dust_impact_ground");
	var_00 = var_02["position"];
	var_04 = vectortoangles(var_02["normal"]);
	var_04 = var_04 + (90,0,0);
	var_05 = anglestoforward(var_04);
	var_06 = anglestoup(var_04);
	playfx(var_03,var_00,var_06,var_05);
}

//Function Number: 8
func_549B(param_00)
{
	playfxontag(common_scripts\utility::getfx("landass_exhaust_smk_lf_npc"),param_00,"J_MainRoot");
	playfxontag(common_scripts\utility::getfx("landass_exhaust_smk_rt_npc"),param_00,"J_MainRoot");
	param_00 lib_A5DE::snd_message("boost_land_assist_npc");
}

//Function Number: 9
func_549C(param_00)
{
	playfxontag(common_scripts\utility::getfx("landass_exhaust_smk_lf_npc"),param_00,"J_MainRoot");
	playfxontag(common_scripts\utility::getfx("landass_exhaust_smk_rt_npc"),param_00,"J_MainRoot");
	param_00 lib_A5DE::snd_message("boost_land_assist_npc");
	wait(0.05);
	var_01 = physicstrace(param_00.var_2E6,param_00.var_2E6 + (0,0,-5120));
	var_02 = anglestoforward(param_00.var_41);
	playfx(common_scripts\utility::getfx("landass_impact_smk_rnr"),var_01,var_02);
	wait(0.35);
	var_01 = physicstrace(param_00.var_2E6,param_00.var_2E6 + (0,0,-5120));
	playfx(common_scripts\utility::getfx("landass_impact_smk_rnr"),var_01,var_02);
	param_00 lib_A5DE::snd_message("boost_land_assist_npc_ground");
}

//Function Number: 10
func_4685(param_00)
{
	if(param_00 == "assist_thrusters")
	{
		func_549B(self);
		return;
	}

	if(param_00 == "assist_thrusters_2")
	{
		func_549B(self);
		return;
	}

	if(param_00 == "fx_start")
	{
		func_549B(self);
		return;
	}

	animscripts\traverse\shared::func_4683(param_00);
}