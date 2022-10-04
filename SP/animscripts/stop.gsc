/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: stop.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 398 ms
 * Timestamp: 4/20/2022 8:20:51 PM
*******************************************************************/

//Function Number: 1
func_4C8C()
{
	var_00 = [];
	var_00["stand"][0] = [%casual_stand_idle,%casual_stand_idle_twitch,%casual_stand_idle_twitchb];
	var_00["stand"][1] = [%casual_stand_v2_idle,%casual_stand_v2_twitch_radio,%casual_stand_v2_twitch_shift,%casual_stand_v2_twitch_talk];
	var_00["stand_cqb"][0] = [%cqb_stand_idle,%cqb_stand_twitch];
	var_00["crouch"][0] = [%casual_crouch_idle];
	level.var_CCA["soldier"]["idle"] = var_00;
	var_00 = [];
	var_00["stand"][0] = [2,1,1];
	var_00["stand"][1] = [10,4,7,4];
	var_00["stand_cqb"][0] = [2,1];
	var_00["crouch"][0] = [6];
	level.var_CCA["soldier"]["idle_weights"] = var_00;
	var_00 = [];
	var_00["stand"] = %casual_stand_idle_trans_in;
	var_00["crouch"] = %casual_crouch_idle_in;
	var_00["stand_smg"] = %smg_casual_stand_idle_trans_in;
	level.var_CCA["soldier"]["idle_transitions"] = var_00;
}

//Function Number: 2
main()
{
	if(isdefined(self.var_60EB))
	{
		return;
	}

	if(isdefined(self.var_2533))
	{
		if(isdefined(self.var_2533["stop"]))
		{
			[[ self.var_2533["stop"] ]]();
			return;
		}
	}

	self notify("stopScript");
	self endon("killanimscript");
	[[ self.exception["stop_immediate"] ]]();
	thread func_27DF();
	animscripts\utility::func_4DD4("stop");
	if(isdefined(self.var_8A29))
	{
		func_8A2A();
	}

	animscripts\utility::func_7126();
	thread func_7F98();
	thread animscripts\reactions::func_7187();
	var_00 = isdefined(self.var_255C);
	if(!var_00)
	{
		if(self.var_7.var_A2D9["right"] == "none" && self.var_7.var_A2D9["left"] == "none")
		{
			var_00 = 1;
		}
		else if(angleclamp180(self method_81B9()[0]) > 20)
		{
			var_00 = 1;
		}
	}

	if(self.var_425 && !isdefined(self.enemy))
	{
		var_01 = animscripts\exit_node::func_3F89();
		if(isdefined(var_01))
		{
			self method_8110("idle",self.var_255C["stand"],%body,1,0.5,self.var_C78);
			turntoangle(var_01.var_41[1]);
		}
		else
		{
			self method_818F("face angle",self.var_41[1]);
		}
	}

	for(;;)
	{
		var_02 = func_3F54();
		if(var_02 == "prone")
		{
			var_00 = 1;
			func_7025();
			continue;
		}

		if(self.var_7.var_6E57 != var_02)
		{
			self method_8142(%animscript_root,0.3);
			var_00 = 0;
		}

		animscripts\setposemovement::func_7FEB(var_02,"stop");
		if(!var_00)
		{
			func_9718(var_02,self.var_7.var_4B7E);
			var_00 = 1;
			continue;
		}

		func_6DA7(var_02,self.var_7.var_4B7E);
	}
}

//Function Number: 3
turntoangle(param_00)
{
	var_01 = self.var_41[1];
	var_02 = angleclamp180(param_00 - var_01);
	if(-20 < var_02 && var_02 < 20)
	{
		rotatetoangle(param_00,2);
		return;
	}

	var_03 = animscripts\swim::func_40FE("idle_turn");
	if(var_02 < -80)
	{
		var_04 = var_03[2];
	}
	else if(var_03 < -20)
	{
		var_04 = var_04[3];
	}
	else if(var_03 < 80)
	{
		var_04 = var_04[5];
	}
	else
	{
		var_04 = var_04[6];
	}

	var_05 = function_0063(var_04);
	var_06 = abs(var_02) / self.var_4CB;
	var_06 = var_06 / 1000;
	var_07 = var_05 / var_06;
	self method_818F("face angle",param_00);
	self method_8113("swim_turn",var_04,1,0.2,var_07 * self.var_5F62);
	animscripts\shared::func_2D05("swim_turn");
	self method_8142(var_04,0.2);
}

//Function Number: 4
rotatetoangle(param_00,param_01)
{
	self method_818F("face angle",param_00);
	while(angleclamp360(param_00 - self.var_41[1]) > param_01)
	{
		wait(0.1);
	}
}

//Function Number: 5
func_7F98()
{
	self endon("death");
	self waittill("killanimscript");
	self.var_55FA = gettime();
}

//Function Number: 6
func_8A2A()
{
	self endon("stop_specialidle");
	self.var_7.var_5F58 = "stop";
	var_00 = self.var_8A29;
	self method_818E("gravity");
	self method_818F("face current");
	self method_8142(%animscript_root,0.2);
	if(var_00.size == 0)
	{
		return;
	}

	var_01 = [];
	var_02 = var_00[0];
	for(;;)
	{
		if(var_01.size == 0)
		{
			var_01 = common_scripts\utility::array_randomize(var_00);
		}

		if(var_01[0] == var_02 && var_01.size > 1)
		{
			var_02 = var_01[1];
		}
		else
		{
			var_02 = var_01[0];
		}

		var_01 = common_scripts\utility::array_remove(var_01,var_02);
		self method_8113("special_idle",var_02,1,0.2,self.var_C78);
		childthread animscripts\shared::func_2D05("special_idle");
		self waittillmatch("end","special_idle");
		if(var_00.size > 1)
		{
			self method_8142(var_02,0.2);
		}
	}
}

//Function Number: 7
func_3F54()
{
	var_00 = animscripts\utility::func_3F2D();
	if(isdefined(var_00))
	{
		var_01 = var_00.var_41[1];
		var_02 = var_00.type;
	}
	else
	{
		var_01 = self.var_117;
		var_02 = "node was undefined";
	}

	animscripts\face::func_7F89(level.var_9D2);
	var_03 = animscripts\utility::func_1D45();
	if(var_02 == "Cover Stand" || var_02 == "Conceal Stand")
	{
		var_03 = animscripts\utility::func_1D45("stand");
	}
	else if(var_02 == "Cover Crouch" || var_02 == "Conceal Crouch")
	{
		var_03 = animscripts\utility::func_1D45("crouch");
	}
	else if(var_02 == "Cover Prone" || var_02 == "Conceal Prone")
	{
		var_03 = animscripts\utility::func_1D45("prone");
	}

	return var_03;
}

//Function Number: 8
func_9718(param_00,param_01)
{
	if(animscripts\utility::func_50E6() && self.var_7.var_6E57 == "stand")
	{
		param_00 = "stand_cqb";
	}
	else if(animscripts\utility::func_9C33() && self.var_7.var_6E57 == "stand")
	{
		param_00 = "stand_smg";
	}

	var_02 = animscripts\utility::func_5861("idle_transitions");
	if(isdefined(var_02[param_00]))
	{
		var_03 = var_02[param_00];
		self method_8110("idle_transition",var_03,%body,1,0.2,self.var_C78);
		animscripts\shared::func_2D05("idle_transition");
	}
}

//Function Number: 9
func_6DA7(param_00,param_01)
{
	if(animscripts\utility::func_50E6() && self.var_7.var_6E57 == "stand")
	{
		param_00 = "stand_cqb";
	}

	var_02 = undefined;
	if(isdefined(self.var_255C) && isdefined(self.var_255C[param_00]))
	{
		if(isarray(self.var_255C[param_00]))
		{
			var_03 = animscripts\utility::func_BAA(self.var_255C[param_00],self.var_255D[param_00]);
		}
		else
		{
			var_03 = self.var_255C[param_01];
			var_04 = param_00 + "_add";
			if(isdefined(self.var_255C[var_04]))
			{
				var_02 = self.var_255C[var_04];
			}
		}
	}
	else if(isdefined(level.var_71DA) && param_01 == "stand" || param_01 == "stand_cqb" && isdefined(self.var_1944) && self.var_1944 == 1)
	{
		var_03 = animscripts\utility::func_BAA(level.var_71DA["stand"][0],level.var_71DB["stand"][0]);
	}
	else
	{
		var_05 = animscripts\utility::func_5861("idle");
		var_06 = animscripts\utility::func_5861("idle_weights");
		param_01 = param_01 % var_05[param_00].size;
		var_03 = animscripts\utility::func_BAA(var_05[param_00][param_01],var_06[param_00][param_01]);
	}

	var_07 = 0.2;
	if(gettime() == self.var_7.var_7B40)
	{
		var_07 = 0.5;
	}

	if(isdefined(var_02))
	{
		self method_8147(var_03,%body,1,var_07,1);
		self method_814B(%add_idle);
		self method_8110("idle",var_02,%add_idle,1,var_07,self.var_C78);
	}
	else
	{
		self method_8110("idle",var_03,%body,1,var_07,self.var_C78);
	}

	animscripts\shared::func_2D05("idle");
}

//Function Number: 10
func_7025()
{
	if(self.var_7.var_6E57 != "prone")
	{
		var_00["stand_2_prone"] = %stand_2_prone;
		var_00["crouch_2_prone"] = %crouch_2_prone;
		var_01 = var_00[self.var_7.var_6E57 + "_2_prone"];
		self method_8110("trans",var_01,%body,1,0.2,1);
		animscripts\shared::func_2D05("trans");
		self.var_7.var_5F58 = "stop";
		self method_81FA(-45,45,%prone_legs_down,%exposed_modern,%prone_legs_up);
		return;
	}

	thread func_9B47();
	if(randomint(10) < 3)
	{
		var_02 = animscripts\utility::func_5860("cover_prone","twitch");
		var_03 = var_02[randomint(var_02.size)];
		self method_810F("prone_idle",var_03,%exposed_modern,1,0.2);
	}
	else
	{
		self method_8147(animscripts\utility::func_5860("cover_prone","straight_level"),%exposed_modern,1,0.2);
		self method_8152("prone_idle",animscripts\utility::func_5860("cover_prone","exposed_idle")[0],1,0.2);
	}

	self waittillmatch("end","prone_idle");
	self notify("kill UpdateProneThread");
}

//Function Number: 11
func_9B47()
{
	self endon("killanimscript");
	self endon("kill UpdateProneThread");
	for(;;)
	{
		animscripts\cover_prone::func_9B48(0.1);
		wait(0.1);
	}
}

//Function Number: 12
func_27DF()
{
	self endon("killanimscript");
	wait(0.05);
	[[ self.exception["stop"] ]]();
}