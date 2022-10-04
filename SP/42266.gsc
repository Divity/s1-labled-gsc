/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42266.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 8
 * Decompile Time: 1 ms
 * Timestamp: 4/20/2022 8:22:04 PM
*******************************************************************/

//Function Number: 1
lib_A51A::init()
{
	precacheshader("damage_feedback");
	precacheshader("damage_feedback_headshot");
	lib_A59A::func_30B1();
	lib_A59A::func_30B2();
	common_scripts\utility::array_thread(level.var_328,::lib_A51A::func_4CCC);
	common_scripts\utility::array_thread(level.var_328,::lib_A59A::func_3C8A);
	common_scripts\utility::array_thread(level.var_328,::lib_A51A::monitordamage);
}

//Function Number: 2
lib_A51A::func_4CCC()
{
	self.var_4AB4 = newclienthudelem(self);
	self.var_4AB4.alignx = "center";
	self.var_4AB4.aligny = "middle";
	self.var_4AB4.horzalign = "center";
	self.var_4AB4.vertalign = "middle";
	self.var_4AB4.alpha = 0;
	self.var_4AB4.archived = 1;
	self.var_4AB4 setshader("damage_feedback",50,100);
	self.var_4AB4.y = 25;
	self.var_4AB5 = newclienthudelem(self);
	self.var_4AB5.alignx = "center";
	self.var_4AB5.aligny = "middle";
	self.var_4AB5.horzalign = "center";
	self.var_4AB5.vertalign = "middle";
	self.var_4AB5.alpha = 0;
	self.var_4AB5.archived = 1;
	self.var_4AB5 setshader("damage_feedback_headshot",50,100);
	self.var_4AB5.y = 25;
}

//Function Number: 3
lib_A51A::monitordamage()
{
	lib_A59A::func_749(::lib_A51A::func_259D);
}

//Function Number: 4
lib_A51A::func_8EF3()
{
	lib_A59A::func_7339(::lib_A51A::func_259D);
}

//Function Number: 5
lib_A51A::func_259D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	var_0A = 0;
	if(isdefined(self.var_18A8))
	{
		var_0B = [];
		var_0B["MOD_PISTOL_BULLET"] = 1;
		var_0B["MOD_RIFLE_BULLET"] = 1;
		if(isdefined(var_0B[param_04]))
		{
			if(param_00 <= self.var_18A8 && !isdefined(self.var_5A77) || !self.var_5A77 || !isdefined(param_09) || !issubstr(param_09,"iw5_em1"))
			{
				return;
			}
		}
	}

	if(isdefined(self.var_FE) && self.var_FE == "head" || self.var_FE == "helmet")
	{
		var_0A = 1;
	}

	param_01 lib_A51A::updatedamagefeedback(self,var_0A);
}

//Function Number: 6
lib_A51A::updatedamagefeedback(param_00,param_01)
{
	var_02 = undefined;
	if(isdefined(param_00.inliveplayerkillstreak))
	{
		var_02 = param_00.inliveplayerkillstreak;
	}
	else if(isdefined(param_00.var_7AE9))
	{
		var_02 = param_00.var_7AE9;
	}

	if(!isdefined(var_02))
	{
		return;
	}

	if(var_02 == "neutral" || isdefined(self.inliveplayerkillstreak) && var_02 == self.inliveplayerkillstreak)
	{
		return;
	}

	if(isdefined(param_00.var_58D4) && param_00.var_58D4)
	{
		return;
	}

	if(isdefined(param_00.godmode) && param_00.godmode)
	{
		return;
	}

	if(isdefined(param_00.var_7A01) && param_00.var_7A01)
	{
		return;
	}

	lib_A51A::func_9B06(param_00);
	lib_A51A::func_9B05(param_01,param_00);
}

//Function Number: 7
lib_A51A::func_9B06(param_00)
{
	if(!lib_A59A::func_500F())
	{
		return;
	}

	if(isdefined(param_00) && isdefined(param_00.var_2B01) && param_00.var_2B01)
	{
		return;
	}

	if(isplayer(self))
	{
		var_01 = "SP_hit_alert_npc";
		if(soundexists(var_01))
		{
			level.var_31D method_82F4(var_01);
			return;
		}

		return;
	}

	if(isplayer(param_00))
	{
	}
}

//Function Number: 8
lib_A51A::func_9B05(param_00,param_01)
{
	if(!lib_A59A::func_500E())
	{
		return;
	}

	if(!isplayer(self))
	{
		return;
	}

	var_02 = 1;
	if(isdefined(level.var_8631.var_8A50))
	{
		var_02 = level.var_8631.var_8A50;
	}

	if(isdefined(param_00) && param_00 && isdefined(param_01) && !isalive(param_01))
	{
		self.var_4AB5.alpha = 1;
		self.var_4AB5 fadeovertime(var_02);
		self.var_4AB5.alpha = 0;
		var_03 = getdvarfloat("cg_crosshairVerticalOffset") * 240;
		self.var_4AB5.y = 25 - int(var_03);
		return;
	}

	self.var_4AB4.alpha = 1;
	self.var_4AB4 fadeovertime(var_03);
	self.var_4AB4.alpha = 0;
	var_03 = getdvarfloat("cg_crosshairVerticalOffset") * 240;
	self.var_4AB4.y = 25 - int(var_03);
}