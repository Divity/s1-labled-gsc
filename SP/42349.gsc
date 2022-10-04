/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42349.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A56D::func_5FE4(param_00)
{
	lib_A59A::func_134E();
	if(isdefined(self.var_5549))
	{
		lib_A59A::func_9F83(self.var_5549,0.5);
	}

	var_01 = [];
	var_01[0] = [self,0];
	lib_A59A::func_3AF0(::lib_A56D::func_0C1A,var_01,param_00);
	if(isalive(self))
	{
		self.var_5549 = gettime();
	}
}

//Function Number: 2
lib_A56D::func_0C1A(param_00,param_01,param_02)
{
	var_03 = self;
	var_04 = [];
	foreach(var_07, var_06 in param_00)
	{
		var_04[var_07] = var_06[0];
	}

	foreach(var_09 in var_04)
	{
		if(!isdefined(var_09))
		{
			continue;
		}

		if(!isdefined(var_09.var_550))
		{
			var_09.var_550 = 0;
		}

		var_09.var_550++;
	}

	var_0B = lib_A506::func_3CC8(param_02);
	var_0C = var_0B["origin"];
	var_0D = var_0B["angles"];
	var_0E = "single anim";
	var_0F = spawnstruct();
	var_10 = 0;
	foreach(var_07, var_09 in var_04)
	{
		var_12 = 0;
		var_13 = 0;
		var_14 = 0;
		var_15 = 0;
		var_16 = undefined;
		var_17 = undefined;
		var_18 = var_09.animname;
		if(isdefined(level.var_78AF[var_18]) && isdefined(level.var_78AF[var_18][param_01]))
		{
			var_12 = 1;
			var_17 = level.var_78AF[var_18][param_01];
		}

		if(isdefined(level.scr_sound[var_18]) && isdefined(level.scr_sound[var_18][param_01]))
		{
			var_13 = 1;
			var_16 = level.scr_sound[var_18][param_01];
		}

		if(isdefined(level.var_78A9[var_18]) && isdefined(level.var_78A9[var_18][param_01]) && !isai(var_09) || !var_09 lib_A59A::func_2CE6())
		{
			var_14 = 1;
		}

		if(isdefined(level.var_78AD[var_18]) && isdefined(level.var_78AD[var_18][param_01]))
		{
			var_09 playsoundasmaster(level.var_78AD[var_18][param_01]);
		}

		if(var_14)
		{
			var_09 lib_A506::func_5506();
			if(isplayer(var_09))
			{
				var_19 = level.var_78A9[var_18]["root"];
				var_09 method_814B(var_19,0,0.2);
				var_1A = level.var_78A9[var_18][param_01];
				var_09 method_8111(var_0E,var_1A,1,0.2);
			}
			else if(var_09.code_classname == "misc_turret")
			{
				var_1A = level.var_78A9[var_18][param_01];
				var_09 method_8111(var_0E,var_1A,1,0.2);
			}
			else
			{
				var_09 method_813E(var_0E,var_0C,var_0D,level.var_78A9[var_18][param_01]);
			}

			thread lib_A506::func_8C11(var_09,var_0E,param_01,var_18,level.var_78A9[var_18][param_01]);
			thread lib_A506::func_C7E(var_09,var_0E,param_01);
		}

		if(var_12 || var_13)
		{
			if(var_12)
			{
				if(var_13)
				{
					var_09 thread lib_A56D::func_2C79(param_01,var_12,var_16,level.var_78AF[var_18][param_01]);
				}

				thread lib_A506::func_BC2(var_09,param_01,level.var_78AF[var_18][param_01]);
			}
			else if(isai(var_09))
			{
				if(var_14)
				{
					var_09 animscripts\face::func_7825(var_17,var_16,1);
				}
				else
				{
					var_09 thread lib_A506::func_BC4("single dialogue");
					var_09 animscripts\face::func_7825(var_17,var_16,1,"single dialogue");
				}
			}
			else
			{
				var_09 thread lib_A59A::play_sound_on_entity(var_16,"single dialogue");
			}
		}

		if(var_14)
		{
			var_1B = function_0063(level.var_78A9[var_18][param_01]);
			var_0F thread lib_A56D::func_0BBE(var_09,param_01);
			var_0F thread lib_A56D::func_0BBD(var_09,param_01,var_1B,param_00[var_07][1]);
			var_10++;
			continue;
		}

		if(var_12)
		{
			var_0F thread lib_A56D::func_0BBE(var_09,param_01);
			var_0F thread lib_A56D::func_0BC0(var_09,param_01,var_17);
			var_10++;
			continue;
		}

		if(var_13)
		{
			var_0F thread lib_A56D::func_0BBE(var_09,param_01);
			var_0F thread lib_A56D::func_0BBF(var_09,param_01);
			var_10++;
		}
	}

	while(var_10 > 0)
	{
		var_0F waittill(param_01,var_09);
		var_10--;
		if(!isdefined(var_09))
		{
			continue;
		}

		if(isplayer(var_09))
		{
			var_18 = var_09.animname;
			if(isdefined(level.var_78A9[var_18][param_01]))
			{
				var_19 = level.var_78A9[var_18]["root"];
				var_09 method_814B(var_19,1,0.2);
				var_1A = level.var_78A9[var_18][param_01];
				var_09 method_8142(var_1A,0.2);
			}
		}

		var_09.var_550--;
		var_09.var_5DB = gettime();
	}

	self notify(param_01);
}

//Function Number: 3
lib_A56D::func_0BBE(param_00,param_01)
{
	param_00 endon("kill_anim_end_notify_" + param_01);
	param_00 waittill("death");
	self notify(param_01,param_00);
	param_00 notify("kill_anim_end_notify_" + param_01);
}

//Function Number: 4
lib_A56D::func_0BC0(param_00,param_01,param_02)
{
	param_00 endon("kill_anim_end_notify_" + param_01);
	var_03 = function_0063(param_02);
	wait(var_03);
	self notify(param_01,param_00);
	param_00 notify("kill_anim_end_notify_" + param_01);
}

//Function Number: 5
lib_A56D::func_0BBF(param_00,param_01)
{
	param_00 endon("kill_anim_end_notify_" + param_01);
	param_00 waittill("single dialogue");
	self notify(param_01,param_00);
	param_00 notify("kill_anim_end_notify_" + param_01);
}

//Function Number: 6
lib_A56D::func_0BBD(param_00,param_01,param_02,param_03)
{
	param_00 endon("kill_anim_end_notify_" + param_01);
	param_02 = param_02 - param_03;
	if(param_03 > 0 && param_02 > 0)
	{
		param_00 lib_A59A::func_A08F("single anim","end",param_02);
		param_00 method_8141();
	}
	else
	{
		param_00 waittillmatch("end","single anim");
	}

	param_00 notify("anim_ended");
	self notify(param_01,param_00);
	param_00 notify("kill_anim_end_notify_" + param_01);
}

//Function Number: 7
lib_A56D::func_2C79(param_00,param_01,param_02,param_03)
{
	if(param_01)
	{
		thread lib_A56D::func_6204(param_00);
		thread lib_A56D::func_A1A0(param_00);
		thread lib_A56D::func_A19F(param_00);
		var_04 = [];
		if(!isarray(param_02))
		{
			var_04[0] = param_02;
		}
		else
		{
			var_04 = param_02;
		}

		foreach(var_06 in var_04)
		{
			self waittillmatch("dialogue_line","face_done_" + param_00);
			animscripts\face::func_7825(undefined,var_06,1);
		}

		self notify("all_facial_lines_done");
		return;
	}

	animscripts\face::func_7825(undefined,param_02,1,"single dialogue");
}

//Function Number: 8
lib_A56D::func_6204(param_00)
{
	self endon("death");
	self waittillmatch("end","face_done_" + param_00);
	self notify("facial_anim_end_" + param_00);
}

//Function Number: 9
lib_A56D::func_A1A0(param_00)
{
	self endon("death");
	self endon("all_facial_lines_done");
	self waittill("facial_anim_end_" + param_00);
}

//Function Number: 10
lib_A56D::func_A19F(param_00)
{
	self endon("death");
	self endon("facial_anim_end_" + param_00);
	self waittill("all_facial_lines_done");
	self waittillmatch("dialogue_line","face_done_" + param_00);
}