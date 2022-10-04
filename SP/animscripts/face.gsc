/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: face.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 19
 * Decompile Time: 745 ms
 * Timestamp: 4/20/2022 8:20:29 PM
*******************************************************************/

//Function Number: 1
func_4D93()
{
	if(!level.var_9BF7)
	{
		return;
	}

	if(!isdefined(self.var_7.var_2510))
	{
		self.var_7.var_2510 = 0;
		self.var_7.var_4B79 = level.var_9D2;
		self.var_35BD = [];
		self.var_35B9 = 0;
	}
}

//Function Number: 2
func_7821(param_00)
{
	var_01 = undefined;
	switch(self.voice)
	{
		case "czech":
		case "french":
		case "seal":
		case "taskforce":
		case "delta":
		case "pmc":
		case "xslice":
		case "american":
			break;

		default:
			break;
	}
}

//Function Number: 3
func_7F8A(param_00)
{
	animscripts\battlechatter::func_6A2B();
	self.var_7.var_4B79 = param_00;
}

//Function Number: 4
func_7F89(param_00)
{
	if(!level.var_9BF7)
	{
		return;
	}

	animscripts\battlechatter::func_6A2B();
	self.var_7.var_4B79 = param_00;
	func_6DAA();
}

//Function Number: 5
func_7825(param_00,param_01,param_02,param_03,param_04,param_05)
{
	thread func_6D97(param_00,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 6
func_1D41(param_00)
{
}

//Function Number: 7
func_6DAA()
{
}

//Function Number: 8
func_6D97(param_00,param_01,param_02,param_03,param_04,param_05)
{
	self.var_7.var_35C2 = 1;
	self.var_7.var_35C6 = 1;
	if(isdefined(param_03))
	{
		if(isdefined(param_01))
		{
			if(!soundexists(param_01))
			{
				wait(0);
				self notify(param_03);
			}

			self method_806A(param_01,"animscript facesound" + param_03,1);
			thread func_A013(param_03);
		}
	}
	else
	{
		self method_806A(param_01);
	}

	if(!level.var_9BF7)
	{
		return;
	}

	func_4D93();
	if(!isdefined(param_00) && !isdefined(param_01))
	{
		if(isdefined(param_03))
		{
			wait(0);
			self.var_35BB = "failed";
			self notify(param_03);
		}

		return;
	}

	self endon("death");
	if(isstring(param_02))
	{
		switch(param_02)
		{
			case "any":
				break;

			case "pain":
				break;

			case "death":
				break;
		}
	}
}

//Function Number: 9
func_A014()
{
	self endon("death");
	self endon("end current face");
	animscripts\shared::func_2D05("animscript faceanim");
	self.var_7.var_35C2 = 1;
	self notify("animscript facedone");
	lib_A506::func_2B03(0);
}

//Function Number: 10
func_A013(param_00)
{
	self endon("death");
	self waittill("animscript facesound" + param_00);
	self notify(param_00);
}

//Function Number: 11
func_6D95(param_00,param_01,param_02)
{
	self endon("death");
	self endon(param_02);
	self waittill(param_00);
	self.var_7.var_35BC = "notify";
	self notify(param_01);
}

//Function Number: 12
func_6D96(param_00,param_01,param_02)
{
	self endon("death");
	self endon(param_02);
	wait(param_00);
	self.var_7.var_35BC = "time";
	self notify(param_01);
}

//Function Number: 13
func_4DEC()
{
	anim.var_629E = 8;
	anim.var_629A = 8;
	func_4DB9();
}

//Function Number: 14
func_4DB9()
{
	anim.var_35BF = [];
	level.var_35BF["pain"] = [%facial_pain_1,%facial_pain_2,%facial_pain_3,%facial_pain_4];
	level.var_35BF["aim"] = [%facial_aim_1,%facial_aim_2];
	level.var_35BF["run"] = [%facial_run_1,%facial_run_2];
	level.var_35BF["corner_stand_L"] = [%facial_corner_stand_l_1,%facial_corner_stand_l_2];
	level.var_35BF["corner_stand_R"] = [%facial_corner_stand_r_1,%facial_corner_stand_r_2];
	level.var_35BF["death"] = [%facial_death_1,%facial_death_2,%facial_death_3,%facial_death_4];
	level.var_35BF["idle"] = [%facial_idle_1,%facial_idle_2,%facial_idle_3];
	level.var_35BF["pain_blend"] = [%facial_pain_blend_1,%facial_pain_blend_2,%facial_pain_blend_3,%facial_pain_blend_4];
	level.var_35BF["aim_blend"] = [%facial_aim_blend_1,%facial_aim_blend_2];
	level.var_35BF["run_blend"] = [%facial_run_blend_1,%facial_run_blend_2];
	level.var_35BF["corner_stand_L_blend"] = [%facial_corner_stand_l_blend_1,%facial_corner_stand_l_blend_2];
	level.var_35BF["corner_stand_R_blend"] = [%facial_corner_stand_r_blend_1,%facial_corner_stand_r_blend_2];
	level.var_35BF["death_blend"] = [%facial_death_blend_1,%facial_death_blend_2,%facial_death_blend_3,%facial_death_blend_4];
	level.var_35BF["idle_blend"] = [%facial_idle_blend_1,%facial_idle_blend_2,%facial_idle_blend_3];
}

//Function Number: 15
func_0C6F(param_00)
{
	return animhasnotetrack(param_00,"facial_override");
}

//Function Number: 16
func_6D98(param_00,param_01,param_02)
{
	if(!isdefined(self.var_35C4))
	{
		thread func_35C1();
	}

	if(isdefined(self.var_1359) && self.var_1359)
	{
		self method_8142(%head,0.2);
		return;
	}

	if(isdefined(param_00) && func_0C6F(param_00))
	{
		self method_8142(%head,0.2);
		return;
	}

	if(self method_84F3())
	{
		param_01 = param_01 + "_blend";
	}

	if(!isdefined(level.var_35BF[param_01]))
	{
		return;
	}

	if(isdefined(param_02) && param_02 >= 0 && param_02 < level.var_35BF[param_01].size)
	{
		var_03 = param_02;
	}
	else
	{
		var_03 = randomint(level.var_35BF[param_02].size);
	}

	var_04 = level.var_35BF[param_01][var_03];
	self method_8143(var_04);
	if(param_01 == "death")
	{
		thread func_312D();
	}

	return var_03;
}

//Function Number: 17
func_312D()
{
	wait(1);
	if(isdefined(self))
	{
		self method_8142(%head,0.2);
	}
}

//Function Number: 18
func_3D64()
{
	if(self method_8442("jnt_eyelid_TL") == -1 || self method_8442("tag_eye") == -1)
	{
		return;
	}

	if(self method_8442("jnt_eyelid_TR") == -1)
	{
		return;
	}

	var_00 = self gettagangles("tag_eye");
	var_01 = self gettagangles("jnt_eyelid_TR");
	var_02 = self gettagangles("jnt_eyelid_TL");
	var_03 = angleclamp180(abs(var_00[0] - var_01[0]));
	var_04 = angleclamp180(abs(var_00[0] - var_02[0]));
	if(!isdefined(self.var_6F3A))
	{
		self.var_6F3A = var_03;
	}

	if(!isdefined(self.var_6F3B))
	{
		self.var_6F3B = var_04;
	}

	if(!isdefined(self.var_35AE))
	{
		self.var_35AE = 0;
	}

	if(angleclamp180(var_03 - self.var_6F3A) > 5 || angleclamp180(var_04 - self.var_6F3B) > 5)
	{
		self.var_6F3A = var_03;
		self.var_6F3B = var_04;
	}
	else
	{
		self.var_35AE++;
	}

	if(isdefined(self.var_35AE) && self.var_35AE > 4 && isdefined(self.script) && self.script != "scripted")
	{
		var_05 = func_6D98(undefined,"idle",undefined);
		if(isdefined(var_05))
		{
			wait(function_0063(level.var_35BF["idle"][var_05]));
		}

		self.var_35AE = 0;
	}
}

//Function Number: 19
func_35C1()
{
	self endon("death");
	self endon("killanimscript");
	self.var_35C4 = 1;
	for(;;)
	{
		func_3D64();
		wait(0.35);
	}
}