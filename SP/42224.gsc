/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42224.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 215
 * Decompile Time: 107 ms
 * Timestamp: 4/20/2022 8:22:01 PM
*******************************************************************/

//Function Number: 1
lib_A4F0::noself_func(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(level.func))
	{
		return;
	}

	if(!isdefined(level.func[param_00]))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		[[ level.func[param_00] ]]();
		return;
	}

	if(!isdefined(param_02))
	{
		[[ level.func[param_00] ]](param_01);
		return;
	}

	if(!isdefined(param_03))
	{
		[[ level.func[param_00] ]](param_01,param_02);
		return;
	}

	if(!isdefined(param_04))
	{
		[[ level.func[param_00] ]](param_01,param_02,param_03);
		return;
	}

	[[ level.func[param_00] ]](param_01,param_02,param_03,param_04);
}

//Function Number: 2
lib_A4F0::self_func(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(level.func[param_00]))
	{
		return;
	}

	if(!isdefined(param_01))
	{
		self [[ level.func[param_00] ]]();
		return;
	}

	if(!isdefined(param_02))
	{
		self [[ level.func[param_00] ]](param_01);
		return;
	}

	if(!isdefined(param_03))
	{
		self [[ level.func[param_00] ]](param_01,param_02);
		return;
	}

	if(!isdefined(param_04))
	{
		self [[ level.func[param_00] ]](param_01,param_02,param_03);
		return;
	}

	self [[ level.func[param_00] ]](param_01,param_02,param_03,param_04);
}

//Function Number: 3
lib_A4F0::randomvector(param_00)
{
	return (randomfloat(param_00) - param_00 * 0.5,randomfloat(param_00) - param_00 * 0.5,randomfloat(param_00) - param_00 * 0.5);
}

//Function Number: 4
lib_A4F0::randomvectorrange(param_00,param_01)
{
	var_02 = randomfloatrange(param_00,param_01);
	if(randomint(2) == 0)
	{
		var_02 = var_02 * -1;
	}

	var_03 = randomfloatrange(param_00,param_01);
	if(randomint(2) == 0)
	{
		var_03 = var_03 * -1;
	}

	var_04 = randomfloatrange(param_00,param_01);
	if(randomint(2) == 0)
	{
		var_04 = var_04 * -1;
	}

	return (var_02,var_03,var_04);
}

//Function Number: 5
lib_A4F0::randomvectorincone(param_00,param_01)
{
	var_02 = randomfloat(param_01);
	var_03 = randomfloat(360);
	var_04 = sin(var_02);
	var_05 = cos(var_02);
	var_06 = sin(var_03);
	var_07 = cos(var_03);
	var_08 = (var_05,var_07 * var_04,var_06 * var_04);
	return rotatevector(var_08,vectortoangles(param_00));
}

//Function Number: 6
lib_A4F0::sign(param_00)
{
	if(param_00 >= 0)
	{
		return 1;
	}

	return -1;
}

//Function Number: 7
lib_A4F0::mod(param_00,param_01)
{
	var_02 = int(param_00 / param_01);
	if(param_00 * param_01 < 0)
	{
		var_02 = var_02 - 1;
	}

	return param_00 - var_02 * param_01;
}

//Function Number: 8
lib_A4F0::tostring(param_00)
{
	return "" + param_00;
}

//Function Number: 9
lib_A4F0::track(param_00)
{
	if(isdefined(self.current_target))
	{
		if(param_00 == self.current_target)
		{
			return;
		}
	}

	self.current_target = param_00;
}

//Function Number: 10
lib_A4F0::get_enemy_team(param_00)
{
	var_01 = [];
	var_01["axis"] = "allies";
	var_01["allies"] = "axis";
	return var_01[param_00];
}

//Function Number: 11
lib_A4F0::clear_exception(param_00)
{
	self.exception[param_00] = level.defaultexception;
}

//Function Number: 12
lib_A4F0::set_exception(param_00,param_01)
{
	self.exception[param_00] = param_01;
}

//Function Number: 13
lib_A4F0::set_all_exceptions(param_00)
{
	var_01 = getarraykeys(self.exception);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		self.exception[var_01[var_02]] = param_00;
	}
}

//Function Number: 14
lib_A4F0::cointoss()
{
	return randomint(100) >= 50;
}

//Function Number: 15
lib_A4F0::choose_from_weighted_array(param_00,param_01)
{
	var_02 = randomint(param_01[param_01.size - 1] + 1);
	for(var_03 = 0;var_03 < param_01.size;var_03++)
	{
		if(var_02 <= param_01[var_03])
		{
			return param_00[var_03];
		}
	}
}

//Function Number: 16
lib_A4F0::get_cumulative_weights(param_00)
{
	var_01 = [];
	var_02 = 0;
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_02 = var_02 + param_00[var_03];
		var_01[var_03] = var_02;
	}

	return var_01;
}

//Function Number: 17
lib_A4F0::waittill_string(param_00,param_01)
{
	if(param_00 != "death")
	{
		self endon("death");
	}

	param_01 endon("die");
	self waittill(param_00);
	param_01 notify("returned",param_00);
}

//Function Number: 18
lib_A4F0::waittill_string_parms(param_00,param_01)
{
	if(param_00 != "death")
	{
		self endon("death");
	}

	param_01 endon("die");
	self waittill(param_00,var_02,var_03,var_04,var_05,var_06,var_07,var_08,var_09,var_0A,var_0B);
	var_0C = [];
	var_0C[0] = param_00;
	if(isdefined(var_02))
	{
		var_0C[1] = var_02;
	}

	if(isdefined(var_03))
	{
		var_0C[2] = var_03;
	}

	if(isdefined(var_04))
	{
		var_0C[3] = var_04;
	}

	if(isdefined(var_05))
	{
		var_0C[4] = var_05;
	}

	if(isdefined(var_06))
	{
		var_0C[5] = var_06;
	}

	if(isdefined(var_07))
	{
		var_0C[6] = var_07;
	}

	if(isdefined(var_08))
	{
		var_0C[7] = var_08;
	}

	if(isdefined(var_09))
	{
		var_0C[8] = var_09;
	}

	if(isdefined(var_0A))
	{
		var_0C[9] = var_0A;
	}

	if(isdefined(var_0B))
	{
		var_0C[10] = var_0B;
	}

	param_01 notify("returned",var_0C);
}

//Function Number: 19
lib_A4F0::waittill_string_no_endon_death(param_00,param_01)
{
	param_01 endon("die");
	self waittill(param_00);
	param_01 notify("returned",param_00);
}

//Function Number: 20
lib_A4F0::waittill_multiple(param_00,param_01,param_02,param_03,param_04)
{
	self endon("death");
	var_05 = spawnstruct();
	var_05.threads = 0;
	if(isdefined(param_00))
	{
		childthread lib_A4F0::waittill_string(param_00,var_05);
		var_05.threads++;
	}

	if(isdefined(param_01))
	{
		childthread lib_A4F0::waittill_string(param_01,var_05);
		var_05.threads++;
	}

	if(isdefined(param_02))
	{
		childthread lib_A4F0::waittill_string(param_02,var_05);
		var_05.threads++;
	}

	if(isdefined(param_03))
	{
		childthread lib_A4F0::waittill_string(param_03,var_05);
		var_05.threads++;
	}

	if(isdefined(param_04))
	{
		childthread lib_A4F0::waittill_string(param_04,var_05);
		var_05.threads++;
	}

	while(var_05.threads)
	{
		var_05 waittill("returned");
		var_05.threads--;
	}

	var_05 notify("die");
}

//Function Number: 21
lib_A4F0::waittill_multiple_ents(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	self endon("death");
	var_08 = spawnstruct();
	var_08.threads = 0;
	if(isdefined(param_00))
	{
		param_00 childthread lib_A4F0::waittill_string(param_01,var_08);
		var_08.threads++;
	}

	if(isdefined(param_02))
	{
		param_02 childthread lib_A4F0::waittill_string(param_03,var_08);
		var_08.threads++;
	}

	if(isdefined(param_04))
	{
		param_04 childthread lib_A4F0::waittill_string(param_05,var_08);
		var_08.threads++;
	}

	if(isdefined(param_06))
	{
		param_06 childthread lib_A4F0::waittill_string(param_07,var_08);
		var_08.threads++;
	}

	while(var_08.threads)
	{
		var_08 waittill("returned");
		var_08.threads--;
	}

	var_08 notify("die");
}

//Function Number: 22
lib_A4F0::waittill_any_return(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if((!isdefined(param_00) || param_00 != "death") && !isdefined(param_01) || param_01 != "death" && !isdefined(param_02) || param_02 != "death" && !isdefined(param_03) || param_03 != "death" && !isdefined(param_04) || param_04 != "death" && !isdefined(param_05) || param_05 != "death" && !isdefined(param_06) || param_06 != "death")
	{
		self endon("death");
	}

	var_07 = spawnstruct();
	if(isdefined(param_00))
	{
		childthread lib_A4F0::waittill_string(param_00,var_07);
	}

	if(isdefined(param_01))
	{
		childthread lib_A4F0::waittill_string(param_01,var_07);
	}

	if(isdefined(param_02))
	{
		childthread lib_A4F0::waittill_string(param_02,var_07);
	}

	if(isdefined(param_03))
	{
		childthread lib_A4F0::waittill_string(param_03,var_07);
	}

	if(isdefined(param_04))
	{
		childthread lib_A4F0::waittill_string(param_04,var_07);
	}

	if(isdefined(param_05))
	{
		childthread lib_A4F0::waittill_string(param_05,var_07);
	}

	if(isdefined(param_06))
	{
		childthread lib_A4F0::waittill_string(param_06,var_07);
	}

	var_07 waittill("returned",var_08);
	var_07 notify("die");
	return var_08;
}

//Function Number: 23
lib_A4F0::waittill_any_return_parms(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if((!isdefined(param_00) || param_00 != "death") && !isdefined(param_01) || param_01 != "death" && !isdefined(param_02) || param_02 != "death" && !isdefined(param_03) || param_03 != "death" && !isdefined(param_04) || param_04 != "death" && !isdefined(param_05) || param_05 != "death" && !isdefined(param_06) || param_06 != "death" && !isdefined(param_07) || param_07 != "death")
	{
		self endon("death");
	}

	var_08 = spawnstruct();
	if(isdefined(param_00))
	{
		childthread lib_A4F0::waittill_string_parms(param_00,var_08);
	}

	if(isdefined(param_01))
	{
		childthread lib_A4F0::waittill_string_parms(param_01,var_08);
	}

	if(isdefined(param_02))
	{
		childthread lib_A4F0::waittill_string_parms(param_02,var_08);
	}

	if(isdefined(param_03))
	{
		childthread lib_A4F0::waittill_string_parms(param_03,var_08);
	}

	if(isdefined(param_04))
	{
		childthread lib_A4F0::waittill_string_parms(param_04,var_08);
	}

	if(isdefined(param_05))
	{
		childthread lib_A4F0::waittill_string_parms(param_05,var_08);
	}

	if(isdefined(param_06))
	{
		childthread lib_A4F0::waittill_string_parms(param_06,var_08);
	}

	if(isdefined(param_07))
	{
		childthread lib_A4F0::waittill_string_parms(param_07,var_08);
	}

	var_08 waittill("returned",var_09);
	var_08 notify("die");
	return var_09;
}

//Function Number: 24
lib_A4F0::waittill_any_return_no_endon_death(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = spawnstruct();
	if(isdefined(param_00))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_00,var_06);
	}

	if(isdefined(param_01))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_01,var_06);
	}

	if(isdefined(param_02))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_02,var_06);
	}

	if(isdefined(param_03))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_03,var_06);
	}

	if(isdefined(param_04))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_04,var_06);
	}

	if(isdefined(param_05))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_05,var_06);
	}

	var_06 waittill("returned",var_07);
	var_06 notify("die");
	return var_07;
}

//Function Number: 25
lib_A4F0::waittill_any_in_array_return(param_00)
{
	var_01 = spawnstruct();
	var_02 = 0;
	foreach(var_04 in param_00)
	{
		childthread lib_A4F0::waittill_string(var_04,var_01);
		if(var_04 == "death")
		{
			var_02 = 1;
		}
	}

	if(!var_02)
	{
		self endon("death");
	}

	var_01 waittill("returned",var_06);
	var_01 notify("die");
	return var_06;
}

//Function Number: 26
lib_A4F0::waittill_any_in_array_return_no_endon_death(param_00)
{
	var_01 = spawnstruct();
	foreach(var_03 in param_00)
	{
		childthread lib_A4F0::waittill_string_no_endon_death(var_03,var_01);
	}

	var_01 waittill("returned",var_05);
	var_01 notify("die");
	return var_05;
}

//Function Number: 27
lib_A4F0::waittill_any_in_array_or_timeout(param_00,param_01)
{
	var_02 = spawnstruct();
	var_03 = 0;
	foreach(var_05 in param_00)
	{
		childthread lib_A4F0::waittill_string(var_05,var_02);
		if(var_05 == "death")
		{
			var_03 = 1;
		}
	}

	if(!var_03)
	{
		self endon("death");
	}

	var_02 childthread lib_A4F0::_timeout(param_01);
	var_02 waittill("returned",var_07);
	var_02 notify("die");
	return var_07;
}

//Function Number: 28
lib_A4F0::waittill_any_in_array_or_timeout_no_endon_death(param_00,param_01)
{
	var_02 = spawnstruct();
	foreach(var_04 in param_00)
	{
		childthread lib_A4F0::waittill_string_no_endon_death(var_04,var_02);
	}

	var_02 thread lib_A4F0::_timeout(param_01);
	var_02 waittill("returned",var_06);
	var_02 notify("die");
	return var_06;
}

//Function Number: 29
lib_A4F0::waittill_any_timeout(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if((!isdefined(param_01) || param_01 != "death") && !isdefined(param_02) || param_02 != "death" && !isdefined(param_03) || param_03 != "death" && !isdefined(param_04) || param_04 != "death" && !isdefined(param_05) || param_05 != "death" && !isdefined(param_06) || param_06 != "death")
	{
		self endon("death");
	}

	var_07 = spawnstruct();
	if(isdefined(param_01))
	{
		childthread lib_A4F0::waittill_string(param_01,var_07);
	}

	if(isdefined(param_02))
	{
		childthread lib_A4F0::waittill_string(param_02,var_07);
	}

	if(isdefined(param_03))
	{
		childthread lib_A4F0::waittill_string(param_03,var_07);
	}

	if(isdefined(param_04))
	{
		childthread lib_A4F0::waittill_string(param_04,var_07);
	}

	if(isdefined(param_05))
	{
		childthread lib_A4F0::waittill_string(param_05,var_07);
	}

	if(isdefined(param_06))
	{
		childthread lib_A4F0::waittill_string(param_06,var_07);
	}

	var_07 childthread lib_A4F0::_timeout(param_00);
	var_07 waittill("returned",var_08);
	var_07 notify("die");
	return var_08;
}

//Function Number: 30
lib_A4F0::_timeout(param_00)
{
	self endon("die");
	wait(param_00);
	self notify("returned","timeout");
}

//Function Number: 31
lib_A4F0::waittill_any_timeout_no_endon_death(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = spawnstruct();
	if(isdefined(param_01))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_01,var_06);
	}

	if(isdefined(param_02))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_02,var_06);
	}

	if(isdefined(param_03))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_03,var_06);
	}

	if(isdefined(param_04))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_04,var_06);
	}

	if(isdefined(param_05))
	{
		childthread lib_A4F0::waittill_string_no_endon_death(param_05,var_06);
	}

	var_06 childthread lib_A4F0::_timeout(param_00);
	var_06 waittill("returned",var_07);
	var_06 notify("die");
	return var_07;
}

//Function Number: 32
lib_A4F0::waittill_any(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	if(isdefined(param_01))
	{
		self endon(param_01);
	}

	if(isdefined(param_02))
	{
		self endon(param_02);
	}

	if(isdefined(param_03))
	{
		self endon(param_03);
	}

	if(isdefined(param_04))
	{
		self endon(param_04);
	}

	if(isdefined(param_05))
	{
		self endon(param_05);
	}

	if(isdefined(param_06))
	{
		self endon(param_06);
	}

	if(isdefined(param_07))
	{
		self endon(param_07);
	}

	self waittill(param_00);
}

//Function Number: 33
lib_A4F0::waittill_any_ents(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C,param_0D)
{
	if(isdefined(param_02) && isdefined(param_03))
	{
		param_02 endon(param_03);
	}

	if(isdefined(param_04) && isdefined(param_05))
	{
		param_04 endon(param_05);
	}

	if(isdefined(param_06) && isdefined(param_07))
	{
		param_06 endon(param_07);
	}

	if(isdefined(param_08) && isdefined(param_09))
	{
		param_08 endon(param_09);
	}

	if(isdefined(param_0A) && isdefined(param_0B))
	{
		param_0A endon(param_0B);
	}

	if(isdefined(param_0C) && isdefined(param_0D))
	{
		param_0C endon(param_0D);
	}

	param_00 waittill(param_01);
}

//Function Number: 34
lib_A4F0::isflashed()
{
	var_00 = gettime();
	if(isdefined(self.flashendtime) && var_00 < self.flashendtime)
	{
		return 1;
	}

	if(isdefined(self.concussionendtime) && var_00 < self.concussionendtime)
	{
		return 1;
	}

	return 0;
}

//Function Number: 35
lib_A4F0::flag_exist(param_00)
{
	return isdefined(level.flag[param_00]);
}

//Function Number: 36
lib_A4F0::flag(param_00)
{
	return level.flag[param_00];
}

//Function Number: 37
lib_A4F0::init_flags()
{
	level.flag = [];
	level.flags_lock = [];
	level.generic_index = 0;
	if(!isdefined(level.sp_stat_tracking_func))
	{
		level.sp_stat_tracking_func = ::lib_A4F0::empty_init_func;
	}

	level.flag_struct = spawnstruct();
	level.flag_struct lib_A4F0::assign_unique_id();
}

//Function Number: 38
lib_A4F0::flag_init(param_00)
{
	if(!isdefined(level.flag))
	{
		lib_A4F0::init_flags();
	}

	level.flag[param_00] = 0;
	if(!isdefined(level.trigger_flags))
	{
		lib_A4F0::init_trigger_flags();
		level.trigger_flags[param_00] = [];
	}
	else if(!isdefined(level.trigger_flags[param_00]))
	{
		level.trigger_flags[param_00] = [];
	}

	if(lib_A4F0::issuffix(param_00,"aa_"))
	{
		thread [[ level.sp_stat_tracking_func ]](param_00);
	}
}

//Function Number: 39
lib_A4F0::empty_init_func(param_00)
{
}

//Function Number: 40
lib_A4F0::issuffix(param_00,param_01)
{
	if(param_01.size > param_00.size)
	{
		return 0;
	}

	for(var_02 = 0;var_02 < param_01.size;var_02++)
	{
		if(param_00[var_02] != param_01[var_02])
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 41
lib_A4F0::flag_set(param_00,param_01)
{
	level.flag[param_00] = 1;
	lib_A4F0::set_trigger_flag_permissions(param_00);
	if(isdefined(param_01))
	{
		level notify(param_00,param_01);
		return;
	}

	level notify(param_00);
}

//Function Number: 42
lib_A4F0::assign_unique_id()
{
	self.unique_id = "generic" + level.generic_index;
	level.generic_index++;
}

//Function Number: 43
lib_A4F0::flag_wait(param_00)
{
	var_01 = undefined;
	while(!lib_A4F0::flag(param_00))
	{
		var_01 = undefined;
		level waittill(param_00,var_01);
	}

	if(isdefined(var_01))
	{
		return var_01;
	}
}

//Function Number: 44
lib_A4F0::flag_clear(param_00)
{
	if(!lib_A4F0::flag(param_00))
	{
		return;
	}

	level.flag[param_00] = 0;
	lib_A4F0::set_trigger_flag_permissions(param_00);
	level notify(param_00);
}

//Function Number: 45
lib_A4F0::flag_waitopen(param_00)
{
	while(lib_A4F0::flag(param_00))
	{
		level waittill(param_00);
	}
}

//Function Number: 46
lib_A4F0::waittill_either(param_00,param_01)
{
	self endon(param_00);
	self waittill(param_01);
}

//Function Number: 47
lib_A4F0::array_thread(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	if(!isdefined(param_02))
	{
		foreach(var_0C in param_00)
		{
			var_0C thread [[ param_01 ]]();
		}

		return;
	}

	if(!isdefined(param_06))
	{
		foreach(var_0E in param_03)
		{
			var_0E thread [[ param_03 ]](param_04);
		}

		return;
	}

	if(!isdefined(param_09))
	{
		foreach(var_10 in param_05)
		{
			var_10 thread [[ param_05 ]](param_06,param_07);
		}

		return;
	}

	if(!isdefined(var_0C))
	{
		foreach(var_12 in param_07)
		{
			var_12 thread [[ param_07 ]](param_08,param_09,param_0A);
		}

		return;
	}

	if(!isdefined(var_0F))
	{
		foreach(var_14 in param_09)
		{
			var_14 thread [[ param_09 ]](param_0A,var_0B,var_0C,var_0D);
		}

		return;
	}

	if(!isdefined(var_12))
	{
		foreach(var_16 in var_0B)
		{
			var_16 thread [[ var_0B ]](var_0C,var_0D,var_0E,var_0F,var_10);
		}

		return;
	}

	if(!isdefined(var_15))
	{
		foreach(var_18 in var_0D)
		{
			var_18 thread [[ var_0D ]](var_0E,var_0F,var_10,var_11,var_12,var_13);
		}

		return;
	}

	if(!isdefined(var_18))
	{
		foreach(var_1A in var_0F)
		{
			var_1A thread [[ var_0F ]](var_10,var_11,var_12,var_13,var_14,var_15,var_16);
		}

		return;
	}

	if(!isdefined(var_1B))
	{
		foreach(var_1C in var_11)
		{
			var_1C thread [[ var_11 ]](var_12,var_13,var_14,var_15,var_16,var_17,var_18,var_19);
		}

		return;
	}

	foreach(var_1E in var_13)
	{
		var_1E thread [[ var_13 ]](var_14,var_15,var_16,var_17,var_18,var_19,var_1A,var_1B,var_1C);
	}
}

//Function Number: 48
lib_A4F0::array_call(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_04))
	{
		foreach(var_06 in param_00)
		{
			var_06 [[ param_01 ]](param_02,param_03,param_04);
		}

		return;
	}

	if(isdefined(var_06))
	{
		foreach(var_08 in param_03)
		{
			var_08 [[ param_03 ]](param_04,var_05);
		}

		return;
	}

	if(isdefined(var_07))
	{
		foreach(var_0A in var_05)
		{
			var_0A [[ var_05 ]](var_06);
		}

		return;
	}

	foreach(var_0C in var_07)
	{
		var_0C [[ var_07 ]]();
	}
}

//Function Number: 49
lib_A4F0::noself_array_call(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_04))
	{
		foreach(var_06 in param_00)
		{
			[[ param_01 ]](var_06,param_02,param_03,param_04);
		}

		return;
	}

	if(isdefined(var_06))
	{
		foreach(var_08 in param_03)
		{
			[[ param_03 ]](var_08,param_04,var_05);
		}

		return;
	}

	if(isdefined(var_07))
	{
		foreach(var_0A in var_05)
		{
			[[ var_05 ]](var_0A,var_06);
		}

		return;
	}

	foreach(var_0C in var_07)
	{
		[[ var_07 ]](var_0C);
	}
}

//Function Number: 50
lib_A4F0::array_thread4(param_00,param_01,param_02,param_03,param_04,param_05)
{
	lib_A4F0::array_thread(param_00,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 51
lib_A4F0::array_thread5(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	lib_A4F0::array_thread(param_00,param_01,param_02,param_03,param_04,param_05,param_06);
}

//Function Number: 52
lib_A4F0::trigger_on(param_00,param_01)
{
	if(isdefined(param_00) && isdefined(param_01))
	{
		var_02 = getentarray(param_00,param_01);
		lib_A4F0::array_thread(var_02,::lib_A4F0::trigger_on_proc);
		return;
	}

	lib_A4F0::trigger_on_proc();
}

//Function Number: 53
lib_A4F0::trigger_on_proc()
{
	if(isdefined(self.realorigin))
	{
		self.var_2E6 = self.realorigin;
	}

	self.trigger_off = undefined;
}

//Function Number: 54
lib_A4F0::trigger_off(param_00,param_01)
{
	if(isdefined(param_00) && isdefined(param_01))
	{
		var_02 = getentarray(param_00,param_01);
		lib_A4F0::array_thread(var_02,::lib_A4F0::trigger_off_proc);
		return;
	}

	lib_A4F0::trigger_off_proc();
}

//Function Number: 55
lib_A4F0::trigger_off_proc()
{
	if(!isdefined(self.realorigin))
	{
		self.realorigin = self.var_2E6;
	}

	if(self.var_2E6 == self.realorigin)
	{
		self.var_2E6 = self.var_2E6 + (0,0,-10000);
	}

	self.trigger_off = 1;
}

//Function Number: 56
lib_A4F0::set_trigger_flag_permissions(param_00)
{
	if(!isdefined(level.trigger_flags))
	{
		return;
	}

	level.trigger_flags[param_00] = lib_A4F0::array_removeundefined(level.trigger_flags[param_00]);
	lib_A4F0::array_thread(level.trigger_flags[param_00],::lib_A4F0::update_trigger_based_on_flags);
}

//Function Number: 57
lib_A4F0::update_trigger_based_on_flags()
{
	var_00 = 1;
	if(isdefined(self.script_flag_true))
	{
		var_00 = 0;
		var_01 = lib_A4F0::create_flags_and_return_tokens(self.script_flag_true);
		foreach(var_03 in var_01)
		{
			if(lib_A4F0::flag(var_03))
			{
				var_00 = 1;
				break;
			}
		}
	}

	var_05 = 1;
	if(isdefined(self.script_flag_false))
	{
		var_01 = lib_A4F0::create_flags_and_return_tokens(self.script_flag_false);
		foreach(var_03 in var_01)
		{
			if(lib_A4F0::flag(var_03))
			{
				var_05 = 0;
				break;
			}
		}
	}

	[[ level.trigger_func[var_00 && var_05] ]]();
}

//Function Number: 58
lib_A4F0::create_flags_and_return_tokens(param_00)
{
	var_01 = strtok(param_00," ");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		if(!isdefined(level.flag[var_01[var_02]]))
		{
			lib_A4F0::flag_init(var_01[var_02]);
		}
	}

	return var_01;
}

//Function Number: 59
lib_A4F0::init_trigger_flags()
{
	level.trigger_flags = [];
	level.trigger_func[1] = ::lib_A4F0::trigger_on;
	level.trigger_func[0] = ::lib_A4F0::trigger_off;
}

//Function Number: 60
lib_A4F0::getstruct(param_00,param_01)
{
	var_02 = level.struct_class_names[param_01][param_00];
	if(!isdefined(var_02))
	{
		return undefined;
	}

	if(var_02.size > 1)
	{
		return undefined;
	}

	return var_02[0];
}

//Function Number: 61
lib_A4F0::getstructarray(param_00,param_01)
{
	var_02 = level.struct_class_names[param_01][param_00];
	if(!isdefined(var_02))
	{
		return [];
	}

	return var_02;
}

//Function Number: 62
lib_A4F0::struct_class_init()
{
	level.struct_class_names = [];
	level.struct_class_names["target"] = [];
	level.struct_class_names["targetname"] = [];
	level.struct_class_names["script_noteworthy"] = [];
	level.struct_class_names["script_linkname"] = [];
	foreach(var_01 in level.struct)
	{
		lib_A4F0::add_struct_to_global_array(var_01);
	}
}

//Function Number: 63
lib_A4F0::add_struct_to_global_array(param_00)
{
	if(isdefined(param_00.targetname))
	{
		if(!isdefined(level.struct_class_names["targetname"][param_00.targetname]))
		{
			level.struct_class_names["targetname"][param_00.targetname] = [];
		}

		var_01 = level.struct_class_names["targetname"][param_00.targetname].size;
		level.struct_class_names["targetname"][param_00.targetname][var_01] = param_00;
	}

	if(isdefined(param_00.target))
	{
		if(!isdefined(level.struct_class_names["target"][param_00.target]))
		{
			level.struct_class_names["target"][param_00.target] = [];
		}

		var_01 = level.struct_class_names["target"][param_00.target].size;
		level.struct_class_names["target"][param_00.target][var_01] = param_00;
	}

	if(isdefined(param_00.var_39B))
	{
		if(!isdefined(level.struct_class_names["script_noteworthy"][param_00.var_39B]))
		{
			level.struct_class_names["script_noteworthy"][param_00.var_39B] = [];
		}

		var_01 = level.struct_class_names["script_noteworthy"][param_00.var_39B].size;
		level.struct_class_names["script_noteworthy"][param_00.var_39B][var_01] = param_00;
	}

	if(isdefined(param_00.script_linkname))
	{
		if(!isdefined(level.struct_class_names["script_linkname"][param_00.script_linkname]))
		{
			level.struct_class_names["script_linkname"][param_00.script_linkname] = [];
		}

		var_01 = level.struct_class_names["script_linkname"][param_00.script_linkname].size;
		level.struct_class_names["script_linkname"][param_00.script_linkname][0] = param_00;
	}
}

//Function Number: 64
lib_A4F0::fileprint_start(param_00)
{
}

//Function Number: 65
lib_A4F0::fileprint_map_start()
{
}

//Function Number: 66
lib_A4F0::fileprint_map_header(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}
}

//Function Number: 67
lib_A4F0::fileprint_map_keypairprint(param_00,param_01)
{
}

//Function Number: 68
lib_A4F0::fileprint_map_entity_start()
{
}

//Function Number: 69
lib_A4F0::fileprint_map_entity_end()
{
}

//Function Number: 70
lib_A4F0::fileprint_radiant_vec(param_00)
{
}

//Function Number: 71
lib_A4F0::array_remove(param_00,param_01)
{
	var_02 = [];
	foreach(var_04 in param_00)
	{
		if(var_04 != param_01)
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 72
lib_A4F0::array_remove_array(param_00,param_01)
{
	foreach(var_03 in param_01)
	{
		param_00 = lib_A4F0::array_remove(param_00,var_03);
	}

	return param_00;
}

//Function Number: 73
lib_A4F0::array_removeundefined(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return var_01;
}

//Function Number: 74
lib_A4F0::array_remove_duplicates(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		var_04 = 1;
		foreach(var_06 in var_01)
		{
			if(var_03 == var_06)
			{
				var_04 = 0;
				break;
			}
		}

		if(var_04)
		{
			var_01[var_01.size] = var_03;
		}
	}

	return var_01;
}

//Function Number: 75
lib_A4F0::array_levelthread(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_04))
	{
		foreach(var_06 in param_00)
		{
			thread [[ param_01 ]](var_06,param_02,param_03,param_04);
		}

		return;
	}

	if(isdefined(var_06))
	{
		foreach(var_08 in param_03)
		{
			thread [[ param_03 ]](var_08,param_04,var_05);
		}

		return;
	}

	if(isdefined(var_07))
	{
		foreach(var_0A in var_05)
		{
			thread [[ var_05 ]](var_0A,var_06);
		}

		return;
	}

	foreach(var_0C in var_07)
	{
		thread [[ var_07 ]](var_0C);
	}
}

//Function Number: 76
lib_A4F0::array_levelcall(param_00,param_01,param_02,param_03,param_04)
{
	if(isdefined(param_04))
	{
		foreach(var_06 in param_00)
		{
			[[ param_01 ]](var_06,param_02,param_03,param_04);
		}

		return;
	}

	if(isdefined(var_06))
	{
		foreach(var_08 in param_03)
		{
			[[ param_03 ]](var_08,param_04,var_05);
		}

		return;
	}

	if(isdefined(var_07))
	{
		foreach(var_0A in var_05)
		{
			[[ var_05 ]](var_0A,var_06);
		}

		return;
	}

	foreach(var_0C in var_07)
	{
		[[ var_07 ]](var_0C);
	}
}

//Function Number: 77
lib_A4F0::add_to_array(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		return param_00;
	}

	if(!isdefined(param_00))
	{
		param_00[0] = param_01;
	}
	else
	{
		param_00[param_00.size] = param_01;
	}

	return param_00;
}

//Function Number: 78
lib_A4F0::flag_assert(param_00)
{
}

//Function Number: 79
lib_A4F0::flag_wait_either(param_00,param_01)
{
	for(;;)
	{
		if(lib_A4F0::flag(param_00))
		{
			return;
		}

		if(lib_A4F0::flag(param_01))
		{
			return;
		}

		level lib_A4F0::waittill_either(param_00,param_01);
	}
}

//Function Number: 80
lib_A4F0::flag_wait_either_return(param_00,param_01)
{
	for(;;)
	{
		if(lib_A4F0::flag(param_00))
		{
			return param_00;
		}

		if(lib_A4F0::flag(param_01))
		{
			return param_01;
		}

		var_02 = level lib_A4F0::waittill_any_return(param_00,param_01);
		return var_02;
	}
}

//Function Number: 81
lib_A4F0::flag_waitopen_either(param_00,param_01)
{
	for(;;)
	{
		if(!lib_A4F0::flag(param_00))
		{
			return param_00;
		}

		if(!lib_A4F0::flag(param_01))
		{
			return param_01;
		}

		level lib_A4F0::waittill_either(param_00,param_01);
	}
}

//Function Number: 82
lib_A4F0::flag_waitopen_either_return(param_00,param_01)
{
	return lib_A4F0::flag_waitopen_either(param_00,param_01);
}

//Function Number: 83
lib_A4F0::flag_wait_any(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = [];
	if(isdefined(param_05))
	{
		var_06[var_06.size] = param_00;
		var_06[var_06.size] = param_01;
		var_06[var_06.size] = param_02;
		var_06[var_06.size] = param_03;
		var_06[var_06.size] = param_04;
		var_06[var_06.size] = param_05;
	}
	else if(isdefined(param_04))
	{
		var_06[var_06.size] = param_00;
		var_06[var_06.size] = param_01;
		var_06[var_06.size] = param_02;
		var_06[var_06.size] = param_03;
		var_06[var_06.size] = param_04;
	}
	else if(isdefined(param_03))
	{
		var_06[var_06.size] = param_00;
		var_06[var_06.size] = param_01;
		var_06[var_06.size] = param_02;
		var_06[var_06.size] = param_03;
	}
	else if(isdefined(param_02))
	{
		var_06[var_06.size] = param_00;
		var_06[var_06.size] = param_01;
		var_06[var_06.size] = param_02;
	}
	else if(isdefined(param_01))
	{
		lib_A4F0::flag_wait_either(param_00,param_01);
		return;
	}
	else
	{
		return;
	}

	for(;;)
	{
		for(var_07 = 0;var_07 < var_06.size;var_07++)
		{
			if(lib_A4F0::flag(var_06[var_07]))
			{
				return;
			}
		}

		level lib_A4F0::waittill_any(param_00,param_01,param_02,param_03,param_04,param_05);
	}
}

//Function Number: 84
lib_A4F0::flag_wait_any_return(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = [];
	if(isdefined(param_04))
	{
		var_05[var_05.size] = param_00;
		var_05[var_05.size] = param_01;
		var_05[var_05.size] = param_02;
		var_05[var_05.size] = param_03;
		var_05[var_05.size] = param_04;
	}
	else if(isdefined(param_03))
	{
		var_05[var_05.size] = param_00;
		var_05[var_05.size] = param_01;
		var_05[var_05.size] = param_02;
		var_05[var_05.size] = param_03;
	}
	else if(isdefined(param_02))
	{
		var_05[var_05.size] = param_00;
		var_05[var_05.size] = param_01;
		var_05[var_05.size] = param_02;
	}
	else if(isdefined(param_01))
	{
		var_06 = lib_A4F0::flag_wait_either_return(param_00,param_01);
		return var_06;
	}
	else
	{
		return;
	}

	for(;;)
	{
		for(var_07 = 0;var_07 < var_06.size;var_07++)
		{
			if(lib_A4F0::flag(var_06[var_07]))
			{
				return var_06[var_07];
			}
		}

		var_06 = level lib_A4F0::waittill_any_return(param_01,param_02,param_03,param_04,var_05);
		return var_07;
	}
}

//Function Number: 85
lib_A4F0::flag_wait_all(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_00))
	{
		lib_A4F0::flag_wait(param_00);
	}

	if(isdefined(param_01))
	{
		lib_A4F0::flag_wait(param_01);
	}

	if(isdefined(param_02))
	{
		lib_A4F0::flag_wait(param_02);
	}

	if(isdefined(param_03))
	{
		lib_A4F0::flag_wait(param_03);
	}
}

//Function Number: 86
lib_A4F0::flag_wait_or_timeout(param_00,param_01)
{
	var_02 = param_01 * 1000;
	var_03 = gettime();
	for(;;)
	{
		if(lib_A4F0::flag(param_00))
		{
			break;
		}

		if(gettime() >= var_03 + var_02)
		{
			break;
		}

		var_04 = var_02 - gettime() - var_03;
		var_05 = var_04 / 1000;
		lib_A4F0::wait_for_flag_or_time_elapses(param_00,var_05);
	}
}

//Function Number: 87
lib_A4F0::flag_waitopen_or_timeout(param_00,param_01)
{
	var_02 = gettime();
	for(;;)
	{
		if(!lib_A4F0::flag(param_00))
		{
			break;
		}

		if(gettime() >= var_02 + param_01 * 1000)
		{
			break;
		}

		lib_A4F0::wait_for_flag_or_time_elapses(param_00,param_01);
	}
}

//Function Number: 88
lib_A4F0::wait_for_flag_or_time_elapses(param_00,param_01)
{
	level endon(param_00);
	wait(param_01);
}

//Function Number: 89
lib_A4F0::delaycall(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	thread lib_A4F0::delaycall_proc(param_01,param_00,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
}

//Function Number: 90
lib_A4F0::delaycall_proc(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	if(lib_A4F0::issp())
	{
		self endon("death");
		self endon("stop_delay_call");
	}

	wait(param_01);
	if(isdefined(param_0A))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
		return;
	}

	if(isdefined(param_09))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09);
		return;
	}

	if(isdefined(param_08))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07,param_08);
		return;
	}

	if(isdefined(param_07))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07);
		return;
	}

	if(isdefined(param_06))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06);
		return;
	}

	if(isdefined(param_05))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05);
		return;
	}

	if(isdefined(param_04))
	{
		self [[ param_00 ]](param_02,param_03,param_04);
		return;
	}

	if(isdefined(param_03))
	{
		self [[ param_00 ]](param_02,param_03);
		return;
	}

	if(isdefined(param_02))
	{
		self [[ param_00 ]](param_02);
		return;
	}

	self [[ param_00 ]]();
}

//Function Number: 91
lib_A4F0::delay_script_call(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	thread lib_A4F0::delay_script_call_proc(param_01,param_00,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
}

//Function Number: 92
lib_A4F0::delay_script_call_proc(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	wait(param_01);
	if(isdefined(param_0A))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
		return;
	}

	if(isdefined(param_09))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09);
		return;
	}

	if(isdefined(param_08))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07,param_08);
		return;
	}

	if(isdefined(param_07))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06,param_07);
		return;
	}

	if(isdefined(param_06))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05,param_06);
		return;
	}

	if(isdefined(param_05))
	{
		self [[ param_00 ]](param_02,param_03,param_04,param_05);
		return;
	}

	if(isdefined(param_04))
	{
		self [[ param_00 ]](param_02,param_03,param_04);
		return;
	}

	if(isdefined(param_03))
	{
		self [[ param_00 ]](param_02,param_03);
		return;
	}

	if(isdefined(param_02))
	{
		self [[ param_00 ]](param_02);
		return;
	}

	self [[ param_00 ]]();
}

//Function Number: 93
lib_A4F0::noself_delaycall(param_00,param_01,param_02,param_03,param_04,param_05)
{
	thread lib_A4F0::noself_delaycall_proc(param_01,param_00,param_02,param_03,param_04,param_05);
}

//Function Number: 94
lib_A4F0::noself_delaycall_proc(param_00,param_01,param_02,param_03,param_04,param_05)
{
	wait(param_01);
	if(isdefined(param_05))
	{
		[[ param_00 ]](param_02,param_03,param_04,param_05);
		return;
	}

	if(isdefined(param_04))
	{
		[[ param_00 ]](param_02,param_03,param_04);
		return;
	}

	if(isdefined(param_03))
	{
		[[ param_00 ]](param_02,param_03);
		return;
	}

	if(isdefined(param_02))
	{
		[[ param_00 ]](param_02);
		return;
	}

	[[ param_00 ]]();
}

//Function Number: 95
lib_A4F0::issp()
{
	if(!isdefined(level.issp))
	{
		level.issp = !lib_A4F0::string_starts_with(getdvar("mapname"),"mp_");
	}

	return level.issp;
}

//Function Number: 96
lib_A4F0::issp_towerdefense()
{
	if(!isdefined(level.issp_towerdefense))
	{
		level.issp_towerdefense = lib_A4F0::string_starts_with(getdvar("mapname"),"so_td_");
	}

	return level.issp_towerdefense;
}

//Function Number: 97
lib_A4F0::string_starts_with(param_00,param_01)
{
	if(param_00.size < param_01.size)
	{
		return 0;
	}

	for(var_02 = 0;var_02 < param_01.size;var_02++)
	{
		if(tolower(param_00[var_02]) != tolower(param_01[var_02]))
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 98
lib_A4F0::string_find(param_00,param_01)
{
	if(param_00.size < param_01.size)
	{
		return -1;
	}

	if(param_01.size == 0)
	{
		return 0;
	}

	var_02 = 0;
	var_03 = 0;
	while(var_02 < param_00.size)
	{
		if(tolower(param_00[var_02]) == tolower(param_01[var_03]))
		{
			var_03++;
		}
		else
		{
			var_03 = 0;
			if(tolower(param_00[var_02]) == tolower(param_01[var_03]))
			{
				var_03++;
			}
			else if(var_02 > param_00.size - param_01.size)
			{
				return -1;
			}
		}

		if(var_03 >= param_01.size)
		{
			return var_02 - var_03 + 1;
		}

		var_02++;
	}

	return -1;
}

//Function Number: 99
lib_A4F0::plot_points(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = param_00[0];
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	if(!isdefined(param_03))
	{
		param_03 = 1;
	}

	if(!isdefined(param_04))
	{
		param_04 = 0.05;
	}

	for(var_06 = 1;var_06 < param_00.size;var_06++)
	{
		thread lib_A4F0::draw_line_for_time(var_05,param_00[var_06],param_01,param_02,param_03,param_04);
		var_05 = param_00[var_06];
	}
}

//Function Number: 100
lib_A4F0::draw_line_for_time(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_06))
	{
		param_06 = 0;
	}

	param_05 = gettime() + param_05 * 1000;
	while(gettime() < param_05)
	{
		wait(0.05);
	}
}

//Function Number: 101
lib_A4F0::table_combine(param_00,param_01)
{
	var_02 = [];
	foreach(var_05, var_04 in param_00)
	{
		var_02[var_05] = var_04;
	}

	foreach(var_05, var_04 in param_01)
	{
		var_02[var_05] = var_04;
	}

	return var_02;
}

//Function Number: 102
lib_A4F0::array_combine(param_00,param_01)
{
	var_02 = [];
	foreach(var_04 in param_00)
	{
		if(isdefined(var_04))
		{
			var_02[var_02.size] = var_04;
		}
	}

	foreach(var_04 in param_01)
	{
		if(isdefined(var_04))
		{
			var_02[var_02.size] = var_04;
		}
	}

	return var_02;
}

//Function Number: 103
lib_A4F0::array_combine_non_integer_indices(param_00,param_01)
{
	var_02 = [];
	foreach(var_05, var_04 in param_00)
	{
		var_02[var_05] = var_04;
	}

	foreach(var_05, var_04 in param_01)
	{
		var_02[var_05] = var_04;
	}

	return var_02;
}

//Function Number: 104
lib_A4F0::array_randomize(param_00)
{
	for(var_01 = 0;var_01 < param_00.size;var_01++)
	{
		var_02 = randomint(param_00.size);
		var_03 = param_00[var_01];
		param_00[var_01] = param_00[var_02];
		param_00[var_02] = var_03;
	}

	return param_00;
}

//Function Number: 105
lib_A4F0::array_add(param_00,param_01)
{
	param_00[param_00.size] = param_01;
	return param_00;
}

//Function Number: 106
lib_A4F0::array_first(param_00)
{
	var_01 = undefined;
	foreach(var_03 in param_00)
	{
		var_01 = var_03;
		break;
	}

	return var_01;
}

//Function Number: 107
lib_A4F0::array_insert(param_00,param_01,param_02)
{
	if(param_02 == param_00.size)
	{
		var_03 = param_00;
		var_03[var_03.size] = param_01;
		return var_03;
	}

	var_03 = [];
	var_04 = 0;
	for(var_05 = 0;var_05 < param_00.size;var_05++)
	{
		if(var_05 == param_02)
		{
			var_03[var_05] = param_01;
			var_04 = 1;
		}

		var_03[var_05 + var_04] = param_00[var_05];
	}

	return var_03;
}

//Function Number: 108
lib_A4F0::array_contains(param_00,param_01)
{
	if(param_00.size <= 0)
	{
		return 0;
	}

	foreach(var_03 in param_00)
	{
		if(var_03 == param_01)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 109
lib_A4F0::array_find(param_00,param_01)
{
	foreach(var_04, var_03 in param_00)
	{
		if(var_03 == param_01)
		{
			return var_04;
		}
	}

	return undefined;
}

//Function Number: 110
lib_A4F0::flat_angle(param_00)
{
	var_01 = (0,param_00[1],0);
	return var_01;
}

//Function Number: 111
lib_A4F0::flat_origin(param_00)
{
	var_01 = (param_00[0],param_00[1],0);
	return var_01;
}

//Function Number: 112
lib_A4F0::draw_arrow_time(param_00,param_01,param_02,param_03)
{
	level endon("newpath");
	var_04 = [];
	var_05 = vectortoangles(param_00 - param_01);
	var_06 = anglestoright(var_05);
	var_07 = anglestoforward(var_05);
	var_08 = anglestoup(var_05);
	var_09 = distance(param_00,param_01);
	var_0A = [];
	var_0B = 0.1;
	var_0A[0] = param_00;
	var_0A[1] = param_00 + var_06 * var_09 * var_0B + var_07 * var_09 * -0.1;
	var_0A[2] = param_01;
	var_0A[3] = param_00 + var_06 * var_09 * -1 * var_0B + var_07 * var_09 * -0.1;
	var_0A[4] = param_00;
	var_0A[5] = param_00 + var_08 * var_09 * var_0B + var_07 * var_09 * -0.1;
	var_0A[6] = param_01;
	var_0A[7] = param_00 + var_08 * var_09 * -1 * var_0B + var_07 * var_09 * -0.1;
	var_0A[8] = param_00;
	var_0C = param_02[0];
	var_0D = param_02[1];
	var_0E = param_02[2];
	lib_A4F0::plot_points(var_0A,var_0C,var_0D,var_0E,param_03);
}

//Function Number: 113
lib_A4F0::get_linked_ents()
{
	var_00 = [];
	if(isdefined(self.script_linkto))
	{
		var_01 = lib_A4F0::get_links();
		foreach(var_03 in var_01)
		{
			var_04 = getentarray(var_03,"script_linkname");
			if(var_04.size > 0)
			{
				var_00 = lib_A4F0::array_combine(var_00,var_04);
			}
		}
	}

	return var_00;
}

//Function Number: 114
lib_A4F0::get_linked_vehicle_nodes()
{
	var_00 = [];
	if(isdefined(self.script_linkto))
	{
		var_01 = lib_A4F0::get_links();
		foreach(var_03 in var_01)
		{
			var_04 = vehpath_getnodearray(var_03,"script_linkname");
			if(var_04.size > 0)
			{
				var_00 = lib_A4F0::array_combine(var_00,var_04);
			}
		}
	}

	return var_00;
}

//Function Number: 115
lib_A4F0::get_linked_ent()
{
	var_00 = lib_A4F0::get_linked_ents();
	return var_00[0];
}

//Function Number: 116
lib_A4F0::get_linked_vehicle_node()
{
	var_00 = lib_A4F0::get_linked_vehicle_nodes();
	return var_00[0];
}

//Function Number: 117
lib_A4F0::get_links()
{
	return strtok(self.script_linkto," ");
}

//Function Number: 118
lib_A4F0::run_thread_on_targetname(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = getentarray(param_00,"targetname");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
	var_05 = lib_A4F0::getstructarray(param_00,"targetname");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
	var_05 = [[ level.getnodearrayfunction ]](param_00,"targetname");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
	var_05 = vehpath_getnodearray(param_00,"targetname");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
}

//Function Number: 119
lib_A4F0::run_thread_on_noteworthy(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = getentarray(param_00,"script_noteworthy");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
	var_05 = lib_A4F0::getstructarray(param_00,"script_noteworthy");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
	var_05 = [[ level.getnodearrayfunction ]](param_00,"script_noteworthy");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
	var_05 = vehpath_getnodearray(param_00,"script_noteworthy");
	lib_A4F0::array_thread(var_05,param_01,param_02,param_03,param_04);
}

//Function Number: 120
lib_A4F0::draw_arrow(param_00,param_01,param_02)
{
	level endon("newpath");
	var_03 = [];
	var_04 = vectortoangles(param_00 - param_01);
	var_05 = anglestoright(var_04);
	var_06 = anglestoforward(var_04);
	var_07 = distance(param_00,param_01);
	var_08 = [];
	var_09 = 0.05;
	var_08[0] = param_00;
	var_08[1] = param_00 + var_05 * var_07 * var_09 + var_06 * var_07 * -0.2;
	var_08[2] = param_01;
	var_08[3] = param_00 + var_05 * var_07 * -1 * var_09 + var_06 * var_07 * -0.2;
	for(var_0A = 0;var_0A < 4;var_0A++)
	{
		var_0B = var_0A + 1;
		if(var_0B >= 4)
		{
			var_0B = 0;
		}
	}
}

//Function Number: 121
lib_A4F0::draw_entity_bounds(param_00,param_01,param_02,param_03,param_04)
{
	if(!isdefined(param_02))
	{
		param_02 = (0,1,0);
	}

	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!isdefined(param_04))
	{
		param_04 = 0.05;
	}

	if(param_03)
	{
		var_05 = int(param_04 / 0.05);
	}
	else
	{
		var_05 = int(param_02 / 0.05);
	}

	var_06 = [];
	var_07 = [];
	var_08 = gettime();
	var_09 = var_08 + param_01 * 1000;
	while(var_08 < var_09 && isdefined(param_00))
	{
		var_06[0] = param_00 getpointinbounds(1,1,1);
		var_06[1] = param_00 getpointinbounds(1,1,-1);
		var_06[2] = param_00 getpointinbounds(-1,1,-1);
		var_06[3] = param_00 getpointinbounds(-1,1,1);
		var_07[0] = param_00 getpointinbounds(1,-1,1);
		var_07[1] = param_00 getpointinbounds(1,-1,-1);
		var_07[2] = param_00 getpointinbounds(-1,-1,-1);
		var_07[3] = param_00 getpointinbounds(-1,-1,1);
		for(var_0A = 0;var_0A < 4;var_0A++)
		{
			var_0B = var_0A + 1;
			if(var_0B == 4)
			{
				var_0B = 0;
			}
		}

		if(!param_03)
		{
			return;
		}

		wait(param_04);
		var_08 = gettime();
	}
}

//Function Number: 122
lib_A4F0::draw_volume(param_00,param_01,param_02,param_03,param_04)
{
	lib_A4F0::draw_entity_bounds(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 123
lib_A4F0::draw_trigger(param_00,param_01,param_02,param_03,param_04)
{
	lib_A4F0::draw_entity_bounds(param_00,param_01,param_02,param_03,param_04);
}

//Function Number: 124
lib_A4F0::getfx(param_00)
{
	return level._effect[param_00];
}

//Function Number: 125
lib_A4F0::fxexists(param_00)
{
	return isdefined(level._effect[param_00]);
}

//Function Number: 126
lib_A4F0::print_csv_asset(param_00,param_01)
{
	var_02 = param_01 + "," + param_00;
	if(isdefined(level.csv_lines[var_02]))
	{
		return;
	}

	level.csv_lines[var_02] = 1;
}

//Function Number: 127
lib_A4F0::fileprint_csv_start(param_00)
{
}

//Function Number: 128
lib_A4F0::getlastweapon()
{
	return self.saved_lastweapon;
}

//Function Number: 129
lib_A4F0::playerunlimitedammothread()
{
}

//Function Number: 130
lib_A4F0::isusabilityenabled()
{
	return !self.disabledusability;
}

//Function Number: 131
lib_A4F0::_disableusability()
{
	if(!isdefined(self.disabledusability))
	{
		self.disabledusability = 0;
	}

	self.disabledusability++;
	self disableusability();
}

//Function Number: 132
lib_A4F0::_enableusability()
{
	if(!isdefined(self.disabledusability))
	{
		self.disabledusability = 0;
		return;
	}

	if(self.disabledusability > 0)
	{
		self.disabledusability--;
		if(self.disabledusability == 0)
		{
			self enableusability();
			return;
		}
	}
}

//Function Number: 133
lib_A4F0::resetusability()
{
	self.disabledusability = 0;
	self enableusability();
}

//Function Number: 134
lib_A4F0::_disableweapon()
{
	if(!isdefined(self.disabledweapon))
	{
		self.disabledweapon = 0;
	}

	self.disabledweapon++;
	self disableweapons();
}

//Function Number: 135
lib_A4F0::_enableweapon()
{
	if(!isdefined(self.disabledweapon))
	{
		self.disabledweapon = 0;
	}

	self.disabledweapon--;
	if(!self.disabledweapon)
	{
		self enableweapons();
	}
}

//Function Number: 136
lib_A4F0::isweaponenabled()
{
	return !self.disabledweapon;
}

//Function Number: 137
lib_A4F0::_disableweaponswitch()
{
	if(!isdefined(self.disabledweaponswitch))
	{
		self.disabledweaponswitch = 0;
	}

	self.disabledweaponswitch++;
	self disableweaponswitch();
}

//Function Number: 138
lib_A4F0::_enableweaponswitch()
{
	if(!isdefined(self.disabledweaponswitch))
	{
		self.disabledweaponswitch = 0;
	}

	self.disabledweaponswitch--;
	if(!self.disabledweaponswitch)
	{
		if(isdefined(level.hordeweaponsjammed) && level.hordeweaponsjammed == 1)
		{
			return;
		}

		self enableweaponswitch();
	}
}

//Function Number: 139
lib_A4F0::isweaponswitchenabled()
{
	return !self.disabledweaponswitch;
}

//Function Number: 140
lib_A4F0::_disableoffhandweapons()
{
	if(!isdefined(self.disabledoffhandweapons))
	{
		self.disabledoffhandweapons = 0;
	}

	self.disabledoffhandweapons++;
	self disableoffhandweapons();
}

//Function Number: 141
lib_A4F0::_enableoffhandweapons()
{
	if(!isdefined(self.disabledoffhandweapons))
	{
		self.disabledoffhandweapons = 0;
	}

	self.disabledoffhandweapons--;
	if(!self.disabledoffhandweapons)
	{
		self enableoffhandweapons();
	}
}

//Function Number: 142
lib_A4F0::isoffhandweaponenabled()
{
	return !self.disabledoffhandweapons;
}

//Function Number: 143
lib_A4F0::_enabledetonate(param_00,param_01)
{
	if(!self hasweapon(param_00))
	{
		return;
	}

	if(self method_84C4(param_00) == param_01)
	{
		return;
	}

	self method_84C3(param_00,param_01);
	if(param_01)
	{
		self notify("WeaponDetonateEnabled",param_00);
		return;
	}

	self notify("WeaponDetonateDisabled",param_00);
}

//Function Number: 144
lib_A4F0::random(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		var_01[var_01.size] = var_03;
	}

	if(!var_01.size)
	{
		return undefined;
	}

	return var_01[randomint(var_01.size)];
}

//Function Number: 145
lib_A4F0::random_weight_sorted(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		var_01[var_01.size] = var_03;
	}

	if(!var_01.size)
	{
		return undefined;
	}

	var_05 = randomint(var_01.size * var_01.size);
	return var_01[var_01.size - 1 - int(sqrt(var_05))];
}

//Function Number: 146
lib_A4F0::spawn_tag_origin()
{
	var_00 = spawn("script_model",(0,0,0));
	var_00 setmodel("tag_origin");
	var_00 hide();
	if(isdefined(self.var_2E6))
	{
		var_00.var_2E6 = self.var_2E6;
	}

	if(isdefined(self.var_41))
	{
		var_00.var_41 = self.var_41;
	}

	return var_00;
}

//Function Number: 147
lib_A4F0::waittill_notify_or_timeout(param_00,param_01)
{
	self endon(param_00);
	wait(param_01);
}

//Function Number: 148
lib_A4F0::waittill_notify_or_timeout_return(param_00,param_01)
{
	self endon(param_00);
	wait(param_01);
	return "timeout";
}

//Function Number: 149
lib_A4F0::fileprint_launcher_start_file()
{
	level.fileprintlauncher_linecount = 0;
	level.fileprint_launcher = 1;
	lib_A4F0::fileprint_launcher("GAMEPRINTSTARTFILE:");
}

//Function Number: 150
lib_A4F0::fileprint_launcher(param_00)
{
	level.fileprintlauncher_linecount++;
	if(level.fileprintlauncher_linecount > 200)
	{
		wait(0.05);
		level.fileprintlauncher_linecount = 0;
	}
}

//Function Number: 151
lib_A4F0::fileprint_launcher_end_file(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(param_01)
	{
		lib_A4F0::fileprint_launcher("GAMEPRINTENDFILE:GAMEPRINTP4ENABLED:" + param_00);
	}
	else
	{
		lib_A4F0::fileprint_launcher("GAMEPRINTENDFILE:" + param_00);
	}

	var_02 = gettime() + 4000;
	while(getdvarint("LAUNCHER_PRINT_SUCCESS") == 0 && getdvar("LAUNCHER_PRINT_FAIL") == "0" && gettime() < var_02)
	{
		wait(0.05);
	}

	if(!gettime() < var_02)
	{
		iprintlnbold("LAUNCHER_PRINT_FAIL:( TIMEOUT ): launcherconflict? restart launcher and try again? ");
		level.fileprint_launcher = undefined;
		return 0;
	}

	var_03 = getdvar("LAUNCHER_PRINT_FAIL");
	if(var_03 != "0")
	{
		iprintlnbold("LAUNCHER_PRINT_FAIL:( " + var_03 + " ): launcherconflict? restart launcher and try again? ");
		level.fileprint_launcher = undefined;
		return 0;
	}

	level.fileprint_launcher = undefined;
	return 1;
}

//Function Number: 152
lib_A4F0::launcher_write_clipboard(param_00)
{
	level.fileprintlauncher_linecount = 0;
	lib_A4F0::fileprint_launcher("LAUNCHER_CLIP:" + param_00);
}

//Function Number: 153
lib_A4F0::isdestructible()
{
	if(!isdefined(self))
	{
		return 0;
	}

	return isdefined(self.destructible_type);
}

//Function Number: 154
lib_A4F0::pauseeffect()
{
	common_scripts\_createfx::stop_fx_looper();
}

//Function Number: 155
lib_A4F0::activate_individual_exploder()
{
	common_scripts\_exploder::activate_individual_exploder_proc();
}

//Function Number: 156
lib_A4F0::get_target_ent(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self.target;
	}

	var_01 = getent(param_00,"targetname");
	if(isdefined(var_01))
	{
		return var_01;
	}

	if(lib_A4F0::issp())
	{
		var_01 = [[ level.getnodefunction ]](param_00,"targetname");
		if(isdefined(var_01))
		{
			return var_01;
		}
	}

	var_01 = lib_A4F0::getstruct(param_00,"targetname");
	if(isdefined(var_01))
	{
		return var_01;
	}

	var_01 = vehpath_getnode(param_00,"targetname");
	if(isdefined(var_01))
	{
		return var_01;
	}
}

//Function Number: 157
lib_A4F0::get_noteworthy_ent(param_00)
{
	var_01 = getent(param_00,"script_noteworthy");
	if(isdefined(var_01))
	{
		return var_01;
	}

	if(lib_A4F0::issp())
	{
		var_01 = [[ level.getnodefunction ]](param_00,"script_noteworthy");
		if(isdefined(var_01))
		{
			return var_01;
		}
	}

	var_01 = lib_A4F0::getstruct(param_00,"script_noteworthy");
	if(isdefined(var_01))
	{
		return var_01;
	}

	var_01 = vehpath_getnode(param_00,"script_noteworthy");
	if(isdefined(var_01))
	{
		return var_01;
	}
}

//Function Number: 158
lib_A4F0::do_earthquake(param_00,param_01)
{
	var_02 = level.earthquake[param_00];
	earthquake(var_02["magnitude"],var_02["duration"],param_01,var_02["radius"]);
}

//Function Number: 159
lib_A4F0::play_loopsound_in_space(param_00,param_01)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_02 = spawn("script_origin",(0,0,0));
	if(!isdefined(param_01))
	{
		param_01 = self.var_2E6;
	}

	var_02.var_2E6 = param_01;
	var_02 playloopsound(param_00);
	return var_02;
}

//Function Number: 160
lib_A4F0::play_sound_in_space_with_angles(param_00,param_01,param_02,param_03)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_04 = spawn("script_origin",(0,0,1));
	if(!isdefined(param_01))
	{
		param_01 = self.var_2E6;
	}

	var_04.var_2E6 = param_01;
	var_04.var_41 = param_02;
	if(lib_A4F0::issp())
	{
		if(isdefined(param_03) && param_03)
		{
			var_04 method_8074(param_00,"sounddone");
		}
		else
		{
			var_04 playsoundasmaster(param_00,"sounddone");
		}

		var_04 waittill("sounddone");
	}
	else if(isdefined(param_03) && param_03)
	{
		var_04 method_8074(param_00);
	}
	else
	{
		var_04 playsoundasmaster(param_00);
	}

	var_04 delete();
}

//Function Number: 161
lib_A4F0::play_sound_in_space(param_00,param_01,param_02)
{
	lib_A4F0::play_sound_in_space_with_angles(param_00,param_01,(0,0,0),param_02);
}

//Function Number: 162
lib_A4F0::loop_fx_sound(param_00,param_01,param_02,param_03,param_04)
{
	if(!soundexists(param_00))
	{
		return;
	}

	if(isdefined(param_03))
	{
		param_02 = undefined;
	}

	if(isdefined(param_02) && param_02 && !isdefined(level.first_frame) || level.first_frame == 1)
	{
		function_0068(param_00,param_01,(0,0,0));
		return;
	}

	var_05 = spawn("script_origin",(0,0,0));
	if(isdefined(param_03))
	{
		thread lib_A4F0::loop_sound_delete(param_03,var_05);
		self endon(param_03);
	}

	var_05.var_2E6 = param_01;
	var_05 playloopsound(param_00);
	var_05 entitywillneverchange();
}

//Function Number: 163
lib_A4F0::loop_fx_sound_with_angles(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!soundexists(param_00))
	{
		return;
	}

	if(isdefined(param_03) && param_03)
	{
		if(!isdefined(level.first_frame) || level.first_frame == 1)
		{
			function_0068(param_00,param_01,param_02);
			return;
		}

		return;
	}

	if(isdefined(level.createfx_enabled) && level.createfx_enabled && isdefined(param_05.loopsound_ent))
	{
		var_07 = param_05.loopsound_ent;
	}
	else
	{
		var_07 = spawn("script_origin",(0,0,0));
	}

	if(isdefined(param_04))
	{
		thread lib_A4F0::loop_sound_delete(param_04,var_07);
		self endon(param_04);
	}

	var_07.var_2E6 = param_01;
	var_07.var_41 = param_02;
	var_07 playloopsound(param_00);
	if(isdefined(level.createfx_enabled) && level.createfx_enabled)
	{
		param_05.loopsound_ent = var_07;
		return;
	}

	var_07 entitywillneverchange();
}

//Function Number: 164
lib_A4F0::loop_fx_sound_interval(param_00,param_01,param_02,param_03,param_04,param_05)
{
	lib_A4F0::loop_fx_sound_interval_with_angles(param_00,param_01,(0,0,0),param_02,param_03,param_04,param_05);
}

//Function Number: 165
lib_A4F0::loop_fx_sound_interval_with_angles(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = spawn("script_origin",(0,0,0));
	if(isdefined(param_03))
	{
		thread lib_A4F0::loop_sound_delete(param_03,var_07);
		self endon(param_03);
	}

	var_07.var_2E6 = param_01;
	var_07.var_41 = param_02;
	if(param_05 >= param_06)
	{
		wait(0.05);
	}

	if(!soundexists(param_00))
	{
		wait(0.05);
	}

	for(;;)
	{
		wait(randomfloatrange(param_05,param_06));
		lib_A4F0::lock("createfx_looper");
		thread lib_A4F0::play_sound_in_space_with_angles(param_00,var_07.var_2E6,var_07.var_41,undefined);
		lib_A4F0::unlock("createfx_looper");
	}
}

//Function Number: 166
lib_A4F0::loop_sound_delete(param_00,param_01)
{
	param_01 endon("death");
	self waittill(param_00);
	param_01 delete();
}

//Function Number: 167
lib_A4F0::createloopeffect(param_00)
{
	var_01 = common_scripts\_createfx::createeffect("loopfx",param_00);
	var_01.v["delay"] = common_scripts\_createfx::getloopeffectdelaydefault();
	return var_01;
}

//Function Number: 168
lib_A4F0::createoneshoteffect(param_00)
{
	var_01 = common_scripts\_createfx::createeffect("oneshotfx",param_00);
	var_01.v["delay"] = common_scripts\_createfx::getoneshoteffectdelaydefault();
	return var_01;
}

//Function Number: 169
lib_A4F0::createexploder(param_00)
{
	var_01 = common_scripts\_createfx::createeffect("exploder",param_00);
	var_01.v["delay"] = common_scripts\_createfx::getexploderdelaydefault();
	var_01.v["exploder_type"] = "normal";
	return var_01;
}

//Function Number: 170
lib_A4F0::alphabetize(param_00)
{
	if(param_00.size <= 1)
	{
		return param_00;
	}

	var_01 = 0;
	for(var_02 = param_00.size - 1;var_02 >= 1;var_02--)
	{
		var_03 = param_00[var_02];
		var_04 = var_02;
		for(var_05 = 0;var_05 < var_02;var_05++)
		{
			var_06 = param_00[var_05];
			if(stricmp(var_06,var_03) > 0)
			{
				var_03 = var_06;
				var_04 = var_05;
			}
		}

		if(var_04 != var_02)
		{
			param_00[var_04] = param_00[var_02];
			param_00[var_02] = var_03;
		}
	}

	return param_00;
}

//Function Number: 171
lib_A4F0::is_later_in_alphabet(param_00,param_01)
{
	return stricmp(param_00,param_01) > 0;
}

//Function Number: 172
lib_A4F0::play_loop_sound_on_entity(param_00,param_01)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_02 = spawn("script_origin",(0,0,0));
	var_02 endon("death");
	thread lib_A4F0::delete_on_death(var_02);
	if(isdefined(param_01))
	{
		var_02.var_2E6 = self.var_2E6 + param_01;
		var_02.var_41 = self.var_41;
		var_02 method_8446(self);
	}
	else
	{
		var_02.var_2E6 = self.var_2E6;
		var_02.var_41 = self.var_41;
		var_02 method_8446(self);
	}

	var_02 playloopsound(param_00);
	self waittill("stop sound" + param_00);
	var_02 stoploopsound(param_00);
	var_02 delete();
}

//Function Number: 173
lib_A4F0::stop_loop_sound_on_entity(param_00)
{
	self notify("stop sound" + param_00);
}

//Function Number: 174
lib_A4F0::delete_on_death(param_00)
{
	param_00 endon("death");
	self waittill("death");
	if(isdefined(param_00))
	{
		param_00 delete();
	}
}

//Function Number: 175
lib_A4F0::error(param_00)
{
	wait 0.05;
}

//Function Number: 176
lib_A4F0::create_dvar(param_00,param_01)
{
	setdvarifuninitialized(param_00,param_01);
}

//Function Number: 177
lib_A4F0::void(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C,param_0D)
{
}

//Function Number: 178
lib_A4F0::tag_project(param_00,param_01)
{
	var_02 = self gettagorigin(param_00);
	var_03 = self gettagangles(param_00);
	var_04 = anglestoforward(var_03);
	var_04 = vectornormalize(var_04) * param_01;
	return var_02 + var_04;
}

//Function Number: 179
lib_A4F0::ter_op(param_00,param_01,param_02)
{
	if(param_00)
	{
		return param_01;
	}

	return param_02;
}

//Function Number: 180
lib_A4F0::create_lock(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	if(!isdefined(level.lock))
	{
		level.lock = [];
	}

	var_02 = spawnstruct();
	var_02.max_count = param_01;
	var_02.count = 0;
	level.lock[param_00] = var_02;
}

//Function Number: 181
lib_A4F0::lock_exists(param_00)
{
	if(!isdefined(level.lock))
	{
		return 0;
	}

	return isdefined(level.lock[param_00]);
}

//Function Number: 182
lib_A4F0::lock(param_00)
{
	for(var_01 = level.lock[param_00];var_01.count >= var_01.max_count;var_01 waittill("unlocked"))
	{
	}

	var_01.count++;
}

//Function Number: 183
lib_A4F0::is_locked(param_00)
{
	var_01 = level.lock[param_00];
	return var_01.count > var_01.max_count;
}

//Function Number: 184
lib_A4F0::unlock_wait(param_00)
{
	thread lib_A4F0::unlock_thread(param_00);
	wait(0.05);
}

//Function Number: 185
lib_A4F0::unlock(param_00)
{
	thread lib_A4F0::unlock_thread(param_00);
}

//Function Number: 186
lib_A4F0::unlock_thread(param_00)
{
	wait(0.05);
	var_01 = level.lock[param_00];
	var_01.count--;
	var_01 notify("unlocked");
}

//Function Number: 187
lib_A4F0::get_template_level()
{
	var_00 = level.script;
	if(isdefined(level.template_script))
	{
		var_00 = level.template_script;
	}

	return var_00;
}

//Function Number: 188
lib_A4F0::array_reverse(param_00)
{
	var_01 = [];
	for(var_02 = param_00.size - 1;var_02 >= 0;var_02--)
	{
		var_01[var_01.size] = param_00[var_02];
	}

	return var_01;
}

//Function Number: 189
lib_A4F0::distance_2d_squared(param_00,param_01)
{
	return length2dsquared(param_00 - param_01);
}

//Function Number: 190
lib_A4F0::get_array_of_farthest(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = lib_A4F0::get_array_of_closest(param_00,param_01,param_02,param_03,param_04,param_05);
	var_06 = lib_A4F0::array_reverse(var_06);
	return var_06;
}

//Function Number: 191
lib_A4F0::get_array_of_closest(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_03))
	{
		param_03 = param_01.size;
	}

	if(!isdefined(param_02))
	{
		param_02 = [];
	}

	var_06 = undefined;
	if(isdefined(param_04))
	{
		var_06 = param_04 * param_04;
	}

	var_07 = 0;
	if(isdefined(param_05))
	{
		var_07 = param_05 * param_05;
	}

	if(param_02.size == 0 && param_03 >= param_01.size && var_07 == 0 && !isdefined(var_06))
	{
		return sortbydistance(param_01,param_00);
	}

	var_08 = [];
	foreach(var_0A in param_01)
	{
		var_0B = 0;
		foreach(var_0D in param_02)
		{
			if(var_0A == var_0D)
			{
				var_0B = 1;
				break;
			}
		}

		if(var_0B)
		{
			continue;
		}

		var_0F = distancesquared(param_00,var_0A.var_2E6);
		if(isdefined(var_06) && var_0F > var_06)
		{
			continue;
		}

		if(var_0F < var_07)
		{
			continue;
		}

		var_08[var_08.size] = var_0A;
	}

	var_08 = sortbydistance(var_08,param_00);
	if(param_03 >= var_08.size)
	{
		return var_08;
	}

	var_11 = [];
	for(var_12 = 0;var_12 < param_03;var_12++)
	{
		var_11[var_12] = var_08[var_12];
	}

	return var_11;
}

//Function Number: 192
lib_A4F0::is_player_gamepad_enabled()
{
	if(!level.console)
	{
		var_00 = self method_834E();
		if(isdefined(var_00))
		{
			return var_00;
		}
		else
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 193
lib_A4F0::drop_to_ground(param_00,param_01,param_02)
{
	if(!isdefined(param_01))
	{
		param_01 = 1500;
	}

	if(!isdefined(param_02))
	{
		param_02 = -12000;
	}

	return physicstrace(param_00 + (0,0,param_01),param_00 + (0,0,param_02));
}

//Function Number: 194
lib_A4F0::add_destructible_type_function(param_00,param_01)
{
	if(!isdefined(level.destructible_functions))
	{
		level.destructible_functions = [];
	}

	level.destructible_functions[param_00] = param_01;
}

//Function Number: 195
lib_A4F0::add_destructible_type_transient(param_00,param_01)
{
	if(!isdefined(level.destructible_transient))
	{
		level.destructible_transient = [];
	}

	level.destructible_transient[param_00] = param_01;
}

//Function Number: 196
lib_A4F0::within_fov(param_00,param_01,param_02,param_03)
{
	var_04 = vectornormalize(param_02 - param_00);
	var_05 = anglestoforward(param_01);
	var_06 = vectordot(var_05,var_04);
	return var_06 >= param_03;
}

//Function Number: 197
lib_A4F0::entity_path_disconnect_thread(param_00)
{
	self notify("entity_path_disconnect_thread");
	self endon("entity_path_disconnect_thread");
	self endon("death");
	level endon("game_ended");
	var_01 = 0;
	self.forcedisconnectuntil = 0;
	for(;;)
	{
		var_02 = self.var_2E6;
		var_03 = lib_A4F0::waittill_any_timeout(param_00,"path_disconnect");
		var_04 = 0;
		var_05 = distancesquared(self.var_2E6,var_02) > 0;
		if(var_05)
		{
			var_04 = 1;
		}

		if(isdefined(var_03) && var_03 == "path_disconnect")
		{
			var_04 = 1;
		}

		if(gettime() < self.forcedisconnectuntil)
		{
			var_04 = 1;
		}

		foreach(var_07 in level.characters)
		{
			if(isai(var_07) && distancesquared(self.var_2E6,var_07.var_2E6) < 250000)
			{
				var_04 = 1;
				self.forcedisconnectuntil = max(gettime() + 30000,self.forcedisconnectuntil);
			}
		}

		if(var_04 != var_01 || var_05)
		{
			if(var_04)
			{
				self disconnectpaths();
			}
			else
			{
				self connectpaths();
			}

			var_01 = var_04;
		}
	}
}

//Function Number: 198
lib_A4F0::make_entity_sentient_mp(param_00,param_01)
{
	if(level.gametype == "aliens" && isdefined(level.aliens_make_entity_sentient_func))
	{
		return self [[ level.aliens_make_entity_sentient_func ]](param_00,param_01);
	}

	if(isdefined(level.bot_funcs) && isdefined(level.bot_funcs["bots_make_entity_sentient"]))
	{
		return self [[ level.bot_funcs["bots_make_entity_sentient"] ]](param_00,param_01);
	}
}

//Function Number: 199
lib_A4F0::ai_3d_sighting_model(param_00)
{
	if(isdefined(level.bot_funcs) && isdefined(level.bot_funcs["ai_3d_sighting_model"]))
	{
		return self [[ level.bot_funcs["ai_3d_sighting_model"] ]](param_00);
	}
}

//Function Number: 200
lib_A4F0::set_basic_animated_model(param_00,param_01,param_02)
{
	if(!isdefined(level.anim_prop_models))
	{
		level.anim_prop_models = [];
	}

	var_03 = tolower(getdvar("mapname"));
	var_04 = 1;
	if(lib_A4F0::string_starts_with(var_03,"mp_"))
	{
		var_04 = 0;
	}

	if(var_04)
	{
		level.anim_prop_models[param_00]["basic"] = param_01;
		return;
	}

	level.anim_prop_models[param_00]["basic"] = param_02;
}

//Function Number: 201
lib_A4F0::getclosest(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 500000;
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

//Function Number: 202
lib_A4F0::getfarthest(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 500000;
	}

	var_03 = 0;
	var_04 = undefined;
	foreach(var_06 in param_01)
	{
		var_07 = distance(var_06.var_2E6,param_00);
		if(var_07 <= var_03 || var_07 >= param_02)
		{
			continue;
		}

		var_03 = var_07;
		var_04 = var_06;
	}

	return var_04;
}

//Function Number: 203
lib_A4F0::missile_settargetandflightmode(param_00,param_01,param_02)
{
	param_02 = lib_A4F0::ter_op(isdefined(param_02),param_02,(0,0,0));
	self missilesettargetent(param_00,param_02);
	switch(param_01)
	{
		case "direct":
			break;

		case "top":
			break;
	}
}

//Function Number: 204
lib_A4F0::evfromluminancenits(param_00)
{
	return log(param_00 + 6.1E-05) / log(2) + 2.84;
}

//Function Number: 205
lib_A4F0::lineartogamma_srgb(param_00)
{
	if(param_00 <= 0.0031308)
	{
		return param_00 * 12.92;
	}

	return pow(param_00,0.4166667) * 1.055 - 0.055;
}

//Function Number: 206
lib_A4F0::convertlegacyfog(param_00)
{
	if(!isdefined(param_00.hdrcolorintensity))
	{
		if(function_0235())
		{
			var_01 = max(param_00.red,max(param_00.green,param_00.blue));
			var_02 = lib_A4F0::evfromluminancenits(var_01 * function_003F());
			if(var_01 > 0)
			{
				param_00.red = param_00.red / var_01;
				param_00.green = param_00.green / var_01;
				param_00.blue = param_00.blue / var_01;
				param_00.red = lib_A4F0::lineartogamma_srgb(param_00.red);
				param_00.green = lib_A4F0::lineartogamma_srgb(param_00.green);
				param_00.blue = lib_A4F0::lineartogamma_srgb(param_00.blue);
				param_00.hdrcolorintensity = var_02;
			}
			else
			{
				param_00.hdrcolorintensity = 0;
			}
		}
		else
		{
			param_00.hdrcolorintensity = 1;
		}
	}

	if(isdefined(param_00.sunfogenabled) && param_00.sunfogenabled)
	{
		if(!isdefined(param_00.hdrsuncolorintensity))
		{
			if(function_0235())
			{
				var_01 = max(param_00.red,param_00.green,param_00.blue);
				var_02 = lib_A4F0::evfromluminancenits(var_01 * function_003F());
				if(var_01 > 0)
				{
					param_00.sunred = param_00.sunred / var_01;
					param_00.sungreen = param_00.sungreen / var_01;
					param_00.sunblue = param_00.sunblue / var_01;
					param_00.sunred = lib_A4F0::lineartogamma_srgb(param_00.red);
					param_00.sungreen = lib_A4F0::lineartogamma_srgb(param_00.green);
					param_00.sunblue = lib_A4F0::lineartogamma_srgb(param_00.blue);
					param_00.hdrsuncolorintensity = var_02;
					return;
				}

				param_00.hdrsuncolorintensity = 0;
				return;
			}

			param_00.hdrsuncolorintensity = 1;
			return;
		}
	}
}

//Function Number: 207
lib_A4F0::convertfogtech(param_00)
{
	if(isdefined(level.exclusive_fog_tech))
	{
		switch(level.exclusive_fog_tech)
		{
			case "dfog":
				break;

			case "normal_fog":
				break;

			default:
				break;
		}
	}
}

//Function Number: 208
lib_A4F0::set_fog_to_ent_values_dfog(param_00,param_01)
{
	if(isdefined(param_00.sunfogenabled) && param_00.sunfogenabled)
	{
		if(!isplayer(self))
		{
			setexpfogext(param_00.startdist,param_00.halfwaydist,param_00.red,param_00.green,param_00.blue,param_00.hdrcolorintensity,param_00.maxopacity,param_01,param_00.sunred,param_00.sungreen,param_00.sunblue,param_00.hdrsuncolorintensity,param_00.sundir,param_00.sunbeginfadeangle,param_00.sunendfadeangle,param_00.normalfogscale,param_00.skyfogintensity,param_00.skyfogminangle,param_00.skyfogmaxangle,param_00.heightfogenabled,param_00.heightfogbaseheight,param_00.heightfoghalfplanedistance);
			return;
		}

		self playersetexpfogext(param_00.startdist,param_00.halfwaydist,param_00.red,param_00.green,param_00.blue,param_00.hdrcolorintensity,param_00.maxopacity,param_01,param_00.sunred,param_00.sungreen,param_00.sunblue,param_00.hdrsuncolorintensity,param_00.sundir,param_00.sunbeginfadeangle,param_00.sunendfadeangle,param_00.normalfogscale,param_00.skyfogintensity,param_00.skyfogminangle,param_00.skyfogmaxangle,param_00.heightfogenabled,param_00.heightfogbaseheight,param_00.heightfoghalfplanedistance);
		return;
	}

	if(!isplayer(self))
	{
		setexpfogext(param_00.startdist,param_00.halfwaydist,param_00.red,param_00.green,param_00.blue,param_00.hdrcolorintensity,param_00.maxopacity,param_01,param_00.skyfogintensity,param_00.skyfogminangle,param_00.skyfogmaxangle,param_00.heightfogenabled,param_00.heightfogbaseheight,param_00.heightfoghalfplanedistance);
		return;
	}

	self playersetexpfogext(param_00.startdist,param_00.halfwaydist,param_00.red,param_00.green,param_00.blue,param_00.hdrcolorintensity,param_00.maxopacity,param_01,param_00.skyfogintensity,param_00.skyfogminangle,param_00.skyfogmaxangle,param_00.heightfogenabled,param_00.heightfogbaseheight,param_00.heightfoghalfplanedistance);
}

//Function Number: 209
lib_A4F0::set_fog_to_ent_values(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(param_00.skyfogintensity))
	{
		param_00.skyfogintensity = 0;
		param_00.skyfogminangle = 0;
		param_00.skyfogmaxangle = 0;
	}

	if(!isdefined(param_00.heightfogenabled))
	{
		param_00.heightfogenabled = 0;
		param_00.heightfogbaseheight = 0;
		param_00.heightfoghalfplanedistance = 1000;
	}

	lib_A4F0::convertlegacyfog(param_00);
	lib_A4F0::convertfogtech(param_00);
	if(isdefined(param_00.atmosfogenabled))
	{
		if(level.nextgen && param_00.atmosfogenabled)
		{
			if(isplayer(self))
			{
				self playersetatmosfog(param_01,param_00.atmosfogsunfogcolor,param_00.atmosfoghazecolor,param_00.atmosfoghazestrength,param_00.atmosfoghazespread,param_00.atmosfogextinctionstrength,param_00.atmosfoginscatterstrength,param_00.atmosfoghalfplanedistance,param_00.atmosfogstartdistance,param_00.atmosfogdistancescale,int(param_00.atmosfogskydistance),param_00.atmosfogskyangularfalloffenabled,param_00.atmosfogskyfalloffstartangle,param_00.atmosfogskyfalloffanglerange,param_00.atmosfogsundirection,param_00.atmosfogheightfogenabled,param_00.atmosfogheightfogbaseheight,param_00.atmosfogheightfoghalfplanedistance);
				return;
			}

			setatmosfog(param_01,param_00.atmosfogsunfogcolor,param_00.atmosfoghazecolor,param_00.atmosfoghazestrength,param_00.atmosfoghazespread,param_00.atmosfogextinctionstrength,param_00.atmosfoginscatterstrength,param_00.atmosfoghalfplanedistance,param_00.atmosfogstartdistance,param_00.atmosfogdistancescale,int(param_00.atmosfogskydistance),param_00.atmosfogskyangularfalloffenabled,param_00.atmosfogskyfalloffstartangle,param_00.atmosfogskyfalloffanglerange,param_00.atmosfogsundirection,param_00.atmosfogheightfogenabled,param_00.atmosfogheightfogbaseheight,param_00.atmosfogheightfoghalfplanedistance);
			return;
		}

		lib_A4F0::set_fog_to_ent_values_dfog(param_00,param_01);
		return;
	}

	lib_A4F0::set_fog_to_ent_values_dfog(param_00,param_01);
}

//Function Number: 210
lib_A4F0::add_fx(param_00,param_01)
{
	if(!isdefined(level._effect))
	{
		level._effect = [];
	}

	level._effect[param_00] = loadfx(param_01);
}

//Function Number: 211
lib_A4F0::array_sort_by_handler(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00.size - 1;var_02++)
	{
		for(var_03 = var_02 + 1;var_03 < param_00.size;var_03++)
		{
			if(param_00[var_03] [[ param_01 ]]() < param_00[var_02] [[ param_01 ]]())
			{
				var_04 = param_00[var_03];
				param_00[var_03] = param_00[var_02];
				param_00[var_02] = var_04;
			}
		}
	}

	return param_00;
}

//Function Number: 212
lib_A4F0::array_sort_with_func(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = -1;
	}

	for(var_03 = 1;var_03 < param_00.size;var_03++)
	{
		var_04 = param_00[var_03];
		for(var_05 = var_03 - 1;var_05 >= 0 && ![[ param_01 ]](param_00[var_05],var_04);var_05--)
		{
			param_00[var_05 + 1] = param_00[var_05];
		}

		param_00[var_05 + 1] = var_04;
		if(param_02 > 0 && var_03 % param_02 == 0)
		{
			wait(0.05);
		}
	}

	return param_00;
}

//Function Number: 213
lib_A4F0::hide_notsolid()
{
	if(!isdefined(self.var_63C4))
	{
		self.var_63C4 = self setcontents(0);
	}

	self hide();
}

//Function Number: 214
lib_A4F0::show_solid()
{
	if(!isai(self))
	{
		self solid();
	}

	if(isdefined(self.var_63C4))
	{
		self setcontents(self.var_63C4);
	}

	self show();
}

//Function Number: 215
lib_A4F0::setlightingstate(param_00)
{
	var_01 = getentarray();
	setomnvar("lighting_state",param_00);
	if(!getdvarint("r_reflectionProbeGenerate"))
	{
		foreach(var_03 in var_01)
		{
			if(isdefined(var_03.lightingstate) && var_03.classname == "script_brushmodel" || var_03.classname == "script_model")
			{
				if(var_03.lightingstate == 0)
				{
					continue;
				}

				if(var_03.lightingstate == param_00)
				{
					var_03 lib_A4F0::show_solid();
					continue;
				}

				var_03 lib_A4F0::hide_notsolid();
			}
		}
	}
}