/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42249.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 28
 * Decompile Time: 35 ms
 * Timestamp: 4/20/2022 8:22:02 PM
*******************************************************************/

//Function Number: 1
lib_A509::main()
{
	lib_A59A::set_console_status();
	level.var_24FC = "default";
	level._clearalltextafterhudelem = 0;
	lib_A509::func_2C57();
	lib_A509::func_9294();
	precachemenu("dev_vision_noloc");
	precachemenu("dev_vision_exec");
	level.var_8A1E = [];
	level.buttons = [];
	if(!isdefined(level.vision_set_transition_ent))
	{
		level.vision_set_transition_ent = spawnstruct();
		level.vision_set_transition_ent.vision_set = "";
		level.vision_set_transition_ent.time = 0;
	}

	if(!isdefined(level.var_8FC8))
	{
		level.var_8FC8 = [];
	}

	if(!isdefined(level.vision_set_fog))
	{
		level.vision_set_fog = [];
		lib_A509::create_default_vision_set_fog(level.script);
		common_scripts\_artcommon::setfogsliders();
	}

	if(!isdefined(level.script))
	{
		level.script = tolower(getdvar("mapname"));
	}
}

//Function Number: 2
lib_A509::create_default_vision_set_fog(param_00)
{
	var_01 = lib_A59A::create_vision_set_fog(param_00);
	var_01.startdist = 3764.17;
	var_01.halfwaydist = 19391;
	var_01.red = 0.661137;
	var_01.green = 0.554261;
	var_01.blue = 0.454014;
	var_01.maxopacity = 0.7;
	var_01.transitiontime = 0;
	var_01.skyfogintensity = 0;
	var_01.skyfogminangle = 0;
	var_01.skyfogmaxangle = 0;
	var_01.heightfogenabled = 0;
	var_01.heightfogbaseheight = 0;
	var_01.heightfoghalfplanedistance = 1000;
}

//Function Number: 3
lib_A509::func_3D75()
{
	if(function_0235())
	{
		return "\\share\\raw\\maps\\createart\\" + common_scripts\utility::get_template_level() + "_fog_hdr.gsc";
	}

	return "\\share\\raw\\maps\\createart\\" + common_scripts\utility::get_template_level() + "_fog.gsc";
}

//Function Number: 4
lib_A509::func_2C6D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	level.var_2C3C[param_00][param_01]["nearStart"] = param_02;
	level.var_2C3C[param_00][param_01]["nearEnd"] = param_03;
	level.var_2C3C[param_00][param_01]["nearBlur"] = param_04;
	level.var_2C3C[param_00][param_01]["farStart"] = param_05;
	level.var_2C3C[param_00][param_01]["farEnd"] = param_06;
	level.var_2C3C[param_00][param_01]["farBlur"] = param_07;
	level.var_2C3C[param_00][param_01]["weight"] = param_08;
	if(isdefined(param_09))
	{
		level.var_2C3C[param_00][param_01]["bias"] = param_09;
	}
}

//Function Number: 5
lib_A509::func_2C42(param_00)
{
	if(level.var_2C3C[param_00]["timeRemaining"] <= 0)
	{
		return;
	}

	var_01 = min(1,0.05 / level.var_2C3C[param_00]["timeRemaining"]);
	level.var_2C3C[param_00]["timeRemaining"] = level.var_2C3C[param_00]["timeRemaining"] - 0.05;
	if(level.var_2C3C[param_00]["timeRemaining"] <= 0)
	{
		level.var_2C3C[param_00]["timeRemaining"] = 0;
		level.var_2C3C[param_00]["current"]["nearStart"] = level.var_2C3C[param_00]["goal"]["nearStart"];
		level.var_2C3C[param_00]["current"]["nearEnd"] = level.var_2C3C[param_00]["goal"]["nearEnd"];
		level.var_2C3C[param_00]["current"]["nearBlur"] = level.var_2C3C[param_00]["goal"]["nearBlur"];
		level.var_2C3C[param_00]["current"]["farStart"] = level.var_2C3C[param_00]["goal"]["farStart"];
		level.var_2C3C[param_00]["current"]["farEnd"] = level.var_2C3C[param_00]["goal"]["farEnd"];
		level.var_2C3C[param_00]["current"]["farBlur"] = level.var_2C3C[param_00]["goal"]["farBlur"];
		level.var_2C3C[param_00]["current"]["weight"] = level.var_2C3C[param_00]["goal"]["weight"];
		return;
	}

	level.var_2C3C[param_00]["current"]["nearStart"] = level.var_2C3C[param_00]["current"]["nearStart"] + var_01 * level.var_2C3C[param_00]["goal"]["nearStart"] - level.var_2C3C[param_00]["current"]["nearStart"];
	level.var_2C3C[param_00]["current"]["nearEnd"] = level.var_2C3C[param_00]["current"]["nearEnd"] + var_01 * level.var_2C3C[param_00]["goal"]["nearEnd"] - level.var_2C3C[param_00]["current"]["nearEnd"];
	level.var_2C3C[param_00]["current"]["nearBlur"] = level.var_2C3C[param_00]["current"]["nearBlur"] + var_01 * level.var_2C3C[param_00]["goal"]["nearBlur"] - level.var_2C3C[param_00]["current"]["nearBlur"];
	level.var_2C3C[param_00]["current"]["farStart"] = level.var_2C3C[param_00]["current"]["farStart"] + var_01 * level.var_2C3C[param_00]["goal"]["farStart"] - level.var_2C3C[param_00]["current"]["farStart"];
	level.var_2C3C[param_00]["current"]["farEnd"] = level.var_2C3C[param_00]["current"]["farEnd"] + var_01 * level.var_2C3C[param_00]["goal"]["farEnd"] - level.var_2C3C[param_00]["current"]["farEnd"];
	level.var_2C3C[param_00]["current"]["farBlur"] = level.var_2C3C[param_00]["current"]["farBlur"] + var_01 * level.var_2C3C[param_00]["goal"]["farBlur"] - level.var_2C3C[param_00]["current"]["farBlur"];
	level.var_2C3C[param_00]["current"]["weight"] = level.var_2C3C[param_00]["current"]["weight"] + var_01 * level.var_2C3C[param_00]["goal"]["weight"] - level.var_2C3C[param_00]["current"]["weight"];
}

//Function Number: 6
lib_A509::func_2C57()
{
	if(getdvar("scr_dof_enable") == "")
	{
		function_00D3("scr_dof_enable","1");
	}

	setdvar("ads_dof_tracedist",8192);
	setdvar("ads_dof_maxEnemyDist",10000);
	setdvar("ads_dof_playerForgetEnemyTime",5000);
	setdvar("ads_dof_nearStartScale",0.25);
	setdvar("ads_dof_nearEndScale",0.85);
	setdvar("ads_dof_farStartScale",1.15);
	setdvar("ads_dof_farEndScale",3);
	setdvar("ads_dof_nearBlur",4);
	setdvar("ads_dof_farBlur",1.5);
	setdvar("ads_dof_debug",0);
	var_00 = 1;
	var_01 = 1;
	var_02 = 4.5;
	var_03 = 500;
	var_04 = 500;
	var_05 = 0.05;
	level.var_2C3C = [];
	level.var_2C3C["base"] = [];
	level.var_2C3C["base"]["current"] = [];
	level.var_2C3C["base"]["goal"] = [];
	level.var_2C3C["base"]["timeRemaining"] = 0;
	lib_A509::func_2C6D("base","current",var_00,var_01,var_02,var_03,var_04,var_05,1,0.5);
	lib_A509::func_2C6D("base","goal",0,0,0,0,0,0,0,0.5);
	level.var_2C3C["script"] = [];
	level.var_2C3C["script"]["current"] = [];
	level.var_2C3C["script"]["goal"] = [];
	level.var_2C3C["script"]["timeRemaining"] = 0;
	lib_A509::func_2C6D("script","current",0,0,0,0,0,0,0,0.5);
	lib_A509::func_2C6D("script","goal",0,0,0,0,0,0,0,0.5);
	level.var_2C3C["ads"] = [];
	level.var_2C3C["ads"]["current"] = [];
	level.var_2C3C["ads"]["goal"] = [];
	lib_A509::func_2C6D("ads","current",0,0,0,0,0,0,0,0.5);
	lib_A509::func_2C6D("ads","goal",0,0,0,0,0,0,0,0.5);
	level.var_2C3C["results"] = [];
	level.var_2C3C["results"]["current"] = [];
	lib_A509::func_2C6D("results","current",var_00,var_01,var_02,var_03,var_04,var_05,1,0.5);
	foreach(var_07 in level.var_328)
	{
		var_07 thread lib_A509::func_2C76();
	}
}

//Function Number: 7
lib_A509::func_2C6B(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	lib_A509::func_2C6D("base","goal",param_00,param_01,param_02,param_03,param_04,param_05,1,param_07);
	level.var_2C3C["base"]["timeRemaining"] = param_06;
	if(param_06 <= 0)
	{
		lib_A509::func_2C6D("base","current",param_00,param_01,param_02,param_03,param_04,param_05,1,param_07);
	}
}

//Function Number: 8
lib_A509::func_2C4A(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	lib_A509::func_2C6D("script","goal",param_00,param_01,param_02,param_03,param_04,param_05,1,param_07);
	level.var_2C3C["script"]["timeRemaining"] = param_06;
	if(param_06 <= 0)
	{
		lib_A509::func_2C6D("script","current",param_00,param_01,param_02,param_03,param_04,param_05,1,param_07);
		return;
	}

	if(level.var_2C3C["script"]["current"]["weight"] <= 0)
	{
		lib_A509::func_2C6D("script","current",param_00,param_01,param_02,param_03,param_04,param_05,0,param_07);
	}
}

//Function Number: 9
lib_A509::func_2C46(param_00)
{
	level.var_2C3C["script"]["goal"]["weight"] = 0;
	level.var_2C3C["script"]["timeRemaining"] = param_00;
	if(param_00 <= 0)
	{
		level.var_2C3C["script"]["current"]["weight"] = 0;
	}
}

//Function Number: 10
lib_A509::func_2C47(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	lib_A509::func_2C6D("ads","goal",param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07);
	if(level.var_2C3C["ads"]["current"]["weight"] <= 0)
	{
		lib_A509::func_2C6D("ads","current",param_00,param_01,param_02,param_03,param_04,param_05,0,param_07);
	}
}

//Function Number: 11
lib_A509::func_2C40(param_00,param_01,param_02,param_03)
{
	if(param_00 > param_01)
	{
		var_04 = param_00 - param_01 * param_03;
		if(var_04 > param_02)
		{
			var_04 = param_02;
		}
		else if(var_04 < 1)
		{
			var_04 = 1;
		}

		if(param_00 - var_04 <= param_01)
		{
			return param_01;
		}
		else
		{
			return param_00 - var_04;
		}
	}
	else if(param_00 < param_01)
	{
		var_04 = param_01 - param_00 * param_03;
		if(var_04 > param_02)
		{
			var_04 = param_02;
		}
		else if(var_04 < 1)
		{
			var_04 = 1;
		}

		if(param_00 + var_04 >= param_01)
		{
			return param_01;
		}
		else
		{
			return param_00 + var_04;
		}
	}

	return param_00;
}

//Function Number: 12
lib_A509::func_2C3F()
{
	var_00 = level.var_2C3C["ads"]["goal"]["weight"];
	if(var_00 < 1)
	{
		if(self adsbuttonpressed() && self playerads() > 0)
		{
			var_00 = min(1,var_00 + 0.7);
		}
		else
		{
			var_00 = 0;
		}

		level.var_2C3C["ads"]["current"]["nearStart"] = level.var_2C3C["ads"]["goal"]["nearStart"];
		level.var_2C3C["ads"]["current"]["nearEnd"] = level.var_2C3C["ads"]["goal"]["nearEnd"];
		level.var_2C3C["ads"]["current"]["nearBlur"] = level.var_2C3C["ads"]["goal"]["nearBlur"];
		level.var_2C3C["ads"]["current"]["farStart"] = level.var_2C3C["ads"]["goal"]["farStart"];
		level.var_2C3C["ads"]["current"]["farEnd"] = level.var_2C3C["ads"]["goal"]["farEnd"];
		level.var_2C3C["ads"]["current"]["farBlur"] = level.var_2C3C["ads"]["goal"]["farBlur"];
		level.var_2C3C["ads"]["current"]["weight"] = var_00;
		level.var_2C3C["ads"]["current"]["bias"] = level.var_2C3C["ads"]["goal"]["bias"];
		return;
	}

	if(isdefined(level.var_2C41))
	{
		var_01 = level.var_2C41;
	}
	else
	{
		var_01 = 0.1;
	}

	var_02 = 10;
	var_03 = max(var_02,abs(level.var_2C3C["ads"]["current"]["nearStart"] - level.var_2C3C["ads"]["goal"]["nearStart"]) * var_01);
	var_04 = max(var_02,abs(level.var_2C3C["ads"]["current"]["nearEnd"] - level.var_2C3C["ads"]["goal"]["nearEnd"]) * var_01);
	var_05 = max(var_02,abs(level.var_2C3C["ads"]["current"]["farStart"] - level.var_2C3C["ads"]["goal"]["farStart"]) * var_01);
	var_06 = max(var_02,abs(level.var_2C3C["ads"]["current"]["farEnd"] - level.var_2C3C["ads"]["goal"]["farEnd"]) * var_01);
	var_07 = 0.1;
	var_08 = 0.1;
	level.var_2C3C["ads"]["current"]["nearStart"] = lib_A509::func_2C40(level.var_2C3C["ads"]["current"]["nearStart"],level.var_2C3C["ads"]["goal"]["nearStart"],var_03,0.33);
	level.var_2C3C["ads"]["current"]["nearEnd"] = lib_A509::func_2C40(level.var_2C3C["ads"]["current"]["nearEnd"],level.var_2C3C["ads"]["goal"]["nearEnd"],var_04,0.33);
	level.var_2C3C["ads"]["current"]["nearBlur"] = lib_A509::func_2C40(level.var_2C3C["ads"]["current"]["nearBlur"],level.var_2C3C["ads"]["goal"]["nearBlur"],var_07,0.33);
	level.var_2C3C["ads"]["current"]["farStart"] = lib_A509::func_2C40(level.var_2C3C["ads"]["current"]["farStart"],level.var_2C3C["ads"]["goal"]["farStart"],var_05,0.33);
	level.var_2C3C["ads"]["current"]["farEnd"] = lib_A509::func_2C40(level.var_2C3C["ads"]["current"]["farEnd"],level.var_2C3C["ads"]["goal"]["farEnd"],var_06,0.33);
	level.var_2C3C["ads"]["current"]["farBlur"] = lib_A509::func_2C40(level.var_2C3C["ads"]["current"]["farBlur"],level.var_2C3C["ads"]["goal"]["farBlur"],var_07,0.33);
	level.var_2C3C["ads"]["current"]["weight"] = 1;
	level.var_2C3C["ads"]["current"]["bias"] = lib_A509::func_2C40(level.var_2C3C["ads"]["current"]["bias"],level.var_2C3C["ads"]["goal"]["bias"],var_08,0.33);
}

//Function Number: 13
lib_A509::func_2C45()
{
	level.var_2C3C["ads"]["goal"]["weight"] = 0;
	level.var_2C3C["ads"]["current"]["weight"] = 0;
}

//Function Number: 14
lib_A509::func_2C3D(param_00)
{
	var_01 = level.var_2C3C[param_00]["current"]["weight"];
	var_02 = 1 - var_01;
	level.var_2C3C["results"]["current"]["nearStart"] = level.var_2C3C["results"]["current"]["nearStart"] * var_02 + level.var_2C3C[param_00]["current"]["nearStart"] * var_01;
	level.var_2C3C["results"]["current"]["nearEnd"] = level.var_2C3C["results"]["current"]["nearEnd"] * var_02 + level.var_2C3C[param_00]["current"]["nearEnd"] * var_01;
	level.var_2C3C["results"]["current"]["nearBlur"] = level.var_2C3C["results"]["current"]["nearBlur"] * var_02 + level.var_2C3C[param_00]["current"]["nearBlur"] * var_01;
	level.var_2C3C["results"]["current"]["farStart"] = level.var_2C3C["results"]["current"]["farStart"] * var_02 + level.var_2C3C[param_00]["current"]["farStart"] * var_01;
	level.var_2C3C["results"]["current"]["farEnd"] = level.var_2C3C["results"]["current"]["farEnd"] * var_02 + level.var_2C3C[param_00]["current"]["farEnd"] * var_01;
	level.var_2C3C["results"]["current"]["farBlur"] = level.var_2C3C["results"]["current"]["farBlur"] * var_02 + level.var_2C3C[param_00]["current"]["farBlur"] * var_01;
	level.var_2C3C["results"]["current"]["bias"] = level.var_2C3C["results"]["current"]["bias"] * var_02 + level.var_2C3C[param_00]["current"]["bias"] * var_01;
}

//Function Number: 15
lib_A509::func_2C43()
{
	lib_A509::func_2C42("base");
	lib_A509::func_2C42("script");
	lib_A509::func_2C3F();
	lib_A509::func_2C3D("base");
	lib_A509::func_2C3D("script");
	lib_A509::func_2C3D("ads");
	var_00 = level.var_2C3C["results"]["current"]["nearStart"];
	var_01 = level.var_2C3C["results"]["current"]["nearEnd"];
	var_02 = level.var_2C3C["results"]["current"]["nearBlur"];
	var_03 = level.var_2C3C["results"]["current"]["farStart"];
	var_04 = level.var_2C3C["results"]["current"]["farEnd"];
	var_05 = level.var_2C3C["results"]["current"]["farBlur"];
	var_06 = level.var_2C3C["results"]["current"]["bias"];
	var_00 = max(0,var_00);
	var_01 = max(0,var_01);
	var_03 = max(0,var_03);
	var_04 = max(0,var_04);
	var_02 = max(4,var_02);
	var_02 = min(10,var_02);
	var_05 = max(0,var_05);
	var_05 = min(var_02,var_05);
	if(var_05 > 0)
	{
		var_03 = max(var_01,var_03);
	}

	var_06 = max(0,var_06);
	level.var_2C3C["results"]["current"]["nearStart"] = var_00;
	level.var_2C3C["results"]["current"]["nearEnd"] = var_01;
	level.var_2C3C["results"]["current"]["nearBlur"] = var_02;
	level.var_2C3C["results"]["current"]["farStart"] = var_03;
	level.var_2C3C["results"]["current"]["farEnd"] = var_04;
	level.var_2C3C["results"]["current"]["farBlur"] = var_05;
	level.var_2C3C["results"]["current"]["bias"] = var_06;
}

//Function Number: 16
lib_A509::func_2C66()
{
	var_00 = self playerads();
	if(var_00 <= 0)
	{
		lib_A509::func_2C45();
		return;
	}

	if(isdefined(level.var_2540))
	{
		[[ level.var_2540 ]]();
		return;
	}

	var_01 = getdvarfloat("ads_dof_tracedist",4096);
	var_02 = getdvarfloat("ads_dof_maxEnemyDist",0);
	var_03 = getdvarint("ads_dof_playerForgetEnemyTime",5000);
	var_04 = getdvarfloat("ads_dof_nearStartScale",0.25);
	var_05 = getdvarfloat("ads_dof_nearEndScale",0.85);
	var_06 = getdvarfloat("ads_dof_farStartScale",1.15);
	var_07 = getdvarfloat("ads_dof_farEndScale",3);
	var_08 = getdvarfloat("ads_dof_nearBlur",4);
	var_09 = getdvarfloat("ads_dof_farBlur",2.5);
	var_0A = self geteye();
	var_0B = self getplayerangles();
	if(isdefined(self.var_2C68))
	{
		var_0C = combineangles(self.var_2C68.var_41,var_0B);
	}
	else
	{
		var_0C = var_0C;
	}

	var_0D = vectornormalize(anglestoforward(var_0C));
	var_0E = bullettrace(var_0A,var_0A + var_0D * var_01,1,self,0,0,0,0,0);
	var_0F = function_00D6("axis");
	var_10 = self getcurrentweapon();
	if(isdefined(level.var_8A1E[var_10]))
	{
		[[ level.var_8A1E[var_10] ]](var_0E,var_0F,var_0A,var_0D,var_00);
		return;
	}

	if(var_0E["fraction"] == 1)
	{
		var_01 = 2048;
		var_11 = 256;
		var_12 = var_01 * var_06 * 2;
	}
	else
	{
		var_03 = distance(var_0C,var_10["position"]);
		var_11 = var_03 * var_06;
		var_12 = var_02 * var_07;
	}

	foreach(var_14 in var_0F)
	{
		var_15 = var_14 method_8410();
		var_16 = var_14 method_8411(var_03);
		if(!var_15 && !var_16)
		{
			continue;
		}

		var_17 = vectornormalize(var_14.var_2E6 - var_0A);
		var_18 = vectordot(var_0D,var_17);
		if(var_18 < 0.923)
		{
			continue;
		}

		var_19 = distance(var_0A,var_14.var_2E6);
		if(var_19 - 30 < var_11)
		{
			var_11 = var_19 - 30;
		}

		var_1A = min(var_19,var_02);
		if(var_1A + 30 > var_12)
		{
			var_12 = var_1A + 30;
		}
	}

	if(var_11 > var_12)
	{
		var_11 = var_12 - 256;
	}

	if(var_11 > var_01)
	{
		var_11 = var_01 - 30;
	}

	if(var_11 < 1)
	{
		var_11 = 1;
	}

	if(var_12 < var_01)
	{
		var_12 = var_01;
	}

	var_1C = var_11 * var_04;
	var_1D = var_12 * var_07;
	lib_A509::func_2C47(var_1C,var_11,var_08,var_12,var_1D,var_09,var_00);
}

//Function Number: 17
lib_A509::func_2C67(param_00)
{
	if(isdefined(level.var_2540))
	{
		return [[ level.var_2540 ]]();
	}

	var_01 = getdvarfloat("ads_dof_tracedist",4096);
	var_02 = getdvarfloat("ads_dof_maxEnemyDist",0);
	var_03 = getdvarint("ads_dof_playerForgetEnemyTime",5000);
	var_04 = self geteye();
	var_05 = self getplayerangles();
	if(isdefined(self.var_2C68))
	{
		var_06 = combineangles(self.var_2C68.var_41,var_05);
	}
	else
	{
		var_06 = var_06;
	}

	var_07 = vectornormalize(anglestoforward(var_06));
	var_08 = bullettrace(var_04,var_04 + var_07 * var_01,1,self,0,1,0,0,0);
	var_09 = function_00D6("axis");
	var_0A = self getcurrentweapon();
	if(isdefined(level.var_8A1E[var_0A]))
	{
		return [[ level.var_8A1E[var_0A] ]](var_08,var_09,var_04,var_07,param_00);
	}

	var_0B["start"] = distance(var_04,var_08["position"]);
	var_0B["end"] = var_0B["start"];
	foreach(var_0D in var_09)
	{
		var_0E = var_0D method_8410();
		var_0F = var_0D method_8411(var_03);
		if(!var_0E && !var_0F)
		{
			continue;
		}

		var_10 = vectornormalize(var_0D.var_2E6 - var_04);
		var_11 = vectordot(var_07,var_10);
		if(var_11 < 0.923)
		{
			continue;
		}

		var_12 = distance(var_04,var_0D.var_2E6);
		if(var_12 < var_0B["start"])
		{
			var_0B["start"] = var_12;
		}

		var_13 = min(var_12,var_02);
		if(var_13 > var_0B["end"])
		{
			var_0B["end"] = var_13;
		}
	}

	return var_0B;
}

//Function Number: 18
lib_A509::func_5223(param_00,param_01,param_02,param_03,param_04)
{
	if(param_04 < 0.88)
	{
		lib_A509::func_2C45();
		return;
	}

	var_05 = 10000;
	var_06 = -1;
	var_05 = 2400;
	var_07 = 2400;
	for(var_08 = 0;var_08 < param_01.size;var_08++)
	{
		var_09 = vectornormalize(param_01[var_08].var_2E6 - param_02);
		var_0A = vectordot(param_03,var_09);
		if(var_0A < 0.923)
		{
			continue;
		}

		var_0B = distance(param_02,param_01[var_08].var_2E6);
		if(var_0B < 2500)
		{
			var_0B = 2500;
		}

		if(var_0B - 30 < var_05)
		{
			var_05 = var_0B - 30;
		}

		if(var_0B + 30 > var_06)
		{
			var_06 = var_0B + 30;
		}
	}

	if(var_05 > var_06)
	{
		var_05 = 2400;
		var_06 = 3000;
	}
	else
	{
		if(var_05 < 50)
		{
			var_05 = 50;
		}

		if(var_06 > 2500)
		{
			var_06 = 2500;
		}
		else if(var_06 < 1000)
		{
			var_06 = 1000;
		}
	}

	var_0C = distance(param_02,param_00["position"]);
	if(var_0C < 2500)
	{
		var_0C = 2500;
	}

	if(var_05 > var_0C)
	{
		var_05 = var_0C - 30;
	}

	if(var_05 < 1)
	{
		var_05 = 1;
	}

	if(var_06 < var_0C)
	{
		var_06 = var_0C;
	}

	if(var_07 >= var_05)
	{
		var_07 = var_05 - 1;
	}

	var_0D = var_06 * 4;
	var_0E = 4;
	var_0F = 1.8;
	lib_A509::func_2C47(var_07,var_05,var_0E,var_06,var_0D,var_0F,param_04);
}

//Function Number: 19
lib_A509::func_2C76()
{
	for(;;)
	{
		wait 0.05;
		if(level.var_56CF)
		{
			continue;
		}

		if(!getdvarint("scr_dof_enable"))
		{
			continue;
		}

		if(getdvarint("r_dof_physical_enable"))
		{
			var_00 = self playerads();
			if(var_00 > 0)
			{
				var_01 = lib_A509::func_2C67(var_00);
				self method_84AC(var_01["start"],var_01["end"]);
			}

			continue;
		}

		lib_A509::func_2C66();
		lib_A509::func_2C43();
		var_02 = level.var_2C3C["results"]["current"]["nearStart"];
		var_03 = level.var_2C3C["results"]["current"]["nearEnd"];
		var_04 = level.var_2C3C["results"]["current"]["farStart"];
		var_05 = level.var_2C3C["results"]["current"]["farEnd"];
		var_06 = level.var_2C3C["results"]["current"]["nearBlur"];
		var_07 = level.var_2C3C["results"]["current"]["farBlur"];
		self setdepthoffield(var_02,var_03,var_04,var_05,var_06,var_07);
	}
}

//Function Number: 20
lib_A509::func_9294()
{
	var_00 = getdvar("r_tessellation");
	if(var_00 == "")
	{
		return;
	}

	level.var_9293 = spawnstruct();
	level.var_9293.var_256A = getdvarfloat("r_tessellationCutoffDistance",960);
	level.var_9293.var_256B = level.var_9293.var_256A;
	level.var_9293.var_256C = getdvarfloat("r_tessellationCutoffFalloff",320);
	level.var_9293.var_256D = level.var_9293.var_256C;
	level.var_9293.var_9350 = 0;
	foreach(var_02 in level.var_328)
	{
		var_02 thread lib_A509::func_9296();
	}
}

//Function Number: 21
lib_A509::func_9295(param_00,param_01,param_02)
{
	level.var_9293.var_256B = param_00;
	level.var_9293.var_256D = param_01;
	level.var_9293.var_9350 = param_02;
}

//Function Number: 22
lib_A509::func_9296()
{
	for(;;)
	{
		var_00 = level.var_9293.var_256A;
		var_01 = level.var_9293.var_256C;
		wait 0.05;
		if(level.var_9293.var_9350 > 0)
		{
			var_02 = level.var_9293.var_9350 * 20;
			var_03 = level.var_9293.var_256B - level.var_9293.var_256A / var_02;
			var_04 = level.var_9293.var_256D - level.var_9293.var_256C / var_02;
			level.var_9293.var_256A = level.var_9293.var_256A + var_03;
			level.var_9293.var_256C = level.var_9293.var_256C + var_04;
			level.var_9293.var_9350 = level.var_9293.var_9350 - 0.05;
		}
		else
		{
			level.var_9293.var_256A = level.var_9293.var_256B;
			level.var_9293.var_256C = level.var_9293.var_256D;
		}

		if(var_00 != level.var_9293.var_256A)
		{
			function_00D3("r_tessellationCutoffDistance",level.var_9293.var_256A);
		}

		if(var_01 != level.var_9293.var_256C)
		{
			function_00D3("r_tessellationCutoffFalloff",level.var_9293.var_256C);
		}
	}
}

//Function Number: 23
lib_A509::func_8FC7(param_00,param_01)
{
	if(!isdefined(level.var_8FC8[param_00]))
	{
		return;
	}

	self notify("sunflare_start_adjust");
	self endon("sunflare_start_adjust");
	var_02 = gettime();
	var_03 = param_01 * 1000;
	var_04 = getdvarvector("r_sunflare_position",(0,0,0));
	var_05 = gettime() - var_02;
	var_06 = level.var_8FC8[param_00].var_32E;
	level.var_24FC = param_00;
	while(var_05 < var_03)
	{
		var_06 = level.var_8FC8[param_00].var_32E;
		var_07 = min(float(var_05 / var_03),1);
		var_08 = var_04 + var_06 - var_04 * var_07;
		setdvar("r_sunflare_position",var_08);
		function_0102(var_08);
		wait(0.05);
		var_05 = gettime() - var_02;
	}

	setdvar("r_sunflare_position",level.var_8FC8[param_00].var_32E);
	function_0102(var_06);
}

//Function Number: 24
lib_A509::init_fog_transition()
{
	if(!isdefined(level.fog_transition_ent))
	{
		level.fog_transition_ent = spawnstruct();
		level.fog_transition_ent.fogset = "";
		level.fog_transition_ent.time = 0;
	}
}

//Function Number: 25
lib_A509::func_7E2F(param_00)
{
	var_01 = 1 - param_00;
	var_02 = self.var_8C0F * var_01 + self.var_313A * param_00;
	var_03 = self.var_8B9C * var_01 + self.var_312F * param_00;
	var_04 = self.var_8B60 * var_01 + self.var_3123 * param_00;
	var_05 = self.var_8BCA * var_01 + self.var_3134 * param_00;
	var_06 = self.var_8C19;
	var_07 = self.var_313B;
	var_08 = self.var_8C8E;
	var_09 = self.var_8C90;
	var_0A = self.var_8C8F;
	var_08 = self.var_8C8E * var_01 + self.var_3143 * param_00;
	var_09 = self.var_8C90 * var_01 + self.var_3145 * param_00;
	var_0A = self.var_8C8F * var_01 + self.var_3144 * param_00;
	if(!isdefined(var_06))
	{
		var_06 = 1;
	}

	if(!isdefined(var_07))
	{
		var_07 = 1;
	}

	var_0B = var_06 * var_01 + var_07 * param_00;
	if(self.var_8FCA)
	{
		var_0C = self.var_8CAC * var_01 + self.var_314B * param_00;
		var_0D = self.var_8BCB * var_01 + self.var_3135 * param_00;
		var_0E = self.var_8CAD * var_01 + self.var_314C * param_00;
		var_0F = self.var_8CAB * var_01 + self.var_314A * param_00;
		var_10 = self.var_8CAE * var_01 + self.var_314D * param_00;
		var_11 = self.var_8CAF * var_01 + self.var_314E * param_00;
		setexponentialfog(var_02,var_03,var_04[0],var_04[1],var_04[2],var_05,var_0B,0.4,var_0C[0],var_0C[1],var_0C[2],var_0D,var_0E,var_0F,var_10,var_11,var_08,var_09,var_0A);
		return;
	}

	setexponentialfog(var_02,var_03,var_04[0],var_04[1],var_04[2],var_05,var_0B,0.4,var_08,var_09,var_0A);
}

//Function Number: 26
lib_A509::func_8AD9(param_00,param_01)
{
	level notify("ssao_set_target_over_time_internal");
	level endon("ssao_set_target_over_time_internal");
	lib_A59A::set_console_status();
	if(!lib_A59A::is_gen4())
	{
		return;
	}

	var_02 = getdvarfloat("r_ssaoScriptScale",1);
	var_03 = param_01;
	while(var_03 > 0)
	{
		var_04 = min(1,0.05 / var_03);
		var_05 = var_02;
		var_02 = var_02 + var_04 * param_00 - var_02;
		if(var_05 != var_02)
		{
			function_00D3("r_ssaoScriptScale",var_02);
		}

		wait 0.05;
		var_03 = var_03 - 0.05;
	}

	function_00D3("r_ssaoScriptScale",param_00);
}

//Function Number: 27
lib_A509::func_2AD2(param_00)
{
	level thread lib_A509::func_8AD9(0,param_00);
}

//Function Number: 28
lib_A509::func_30F1(param_00)
{
	level thread lib_A509::func_8AD9(1,param_00);
}