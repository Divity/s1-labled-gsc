/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42481.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 23
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:45 PM
*******************************************************************/

//Function Number: 1
lib_A5F1::snd_play_linked(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = "oneshot";
	var_07 = undefined;
	var_08 = "3d";
	return lib_A5F1::func_87A6(param_00,var_06,var_07,var_08,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 2
lib_A5F1::func_8728(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = "oneshot";
	var_07 = param_01;
	var_08 = "3d";
	return lib_A5F1::func_87A6(param_00,var_06,var_07,var_08,param_02,param_03,param_04,param_05);
}

//Function Number: 3
lib_A5F1::func_8725(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = "oneshot";
	var_06 = undefined;
	var_07 = "2d";
	return lib_A5F1::func_87A6(param_00,var_05,var_06,var_07,param_01,param_02,param_03,param_04);
}

//Function Number: 4
lib_A5F1::func_873C(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = "loop";
	var_07 = undefined;
	var_08 = "3d";
	return lib_A5F1::func_87A6(param_00,var_06,var_07,var_08,param_01,param_02,param_03,param_04,param_05);
}

//Function Number: 5
lib_A5F1::func_873A(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = "loop";
	var_07 = param_01;
	var_08 = "3d";
	return lib_A5F1::func_87A6(param_00,var_06,var_07,var_08,param_02,param_03,param_04,param_05);
}

//Function Number: 6
lib_A5F1::func_8739(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = "loop";
	var_06 = undefined;
	var_07 = "2d";
	return lib_A5F1::func_87A6(param_00,var_05,var_06,var_07,param_01,param_02,param_03,param_04);
}

//Function Number: 7
lib_A5F1::func_872B(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = "oneshot";
	var_09 = undefined;
	var_0A = "3d";
	return lib_A5F1::func_87A6(param_00,var_08,var_09,var_0A,param_03,param_04,param_05,param_06,param_07,param_01,param_02);
}

//Function Number: 8
lib_A5F1::func_872A(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = "oneshot";
	var_09 = param_01;
	var_0A = "3d";
	return lib_A5F1::func_87A6(param_00,var_08,var_09,var_0A,param_04,param_05,param_06,param_07,(0,0,0),param_02,param_03);
}

//Function Number: 9
lib_A5F1::func_8729(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = "oneshot";
	var_08 = undefined;
	var_09 = "2d";
	return lib_A5F1::func_87A6(param_00,var_07,var_08,var_09,param_03,param_04,param_05,param_06,(0,0,0),param_01,param_02);
}

//Function Number: 10
lib_A5F1::func_872F(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = "loop";
	var_09 = undefined;
	var_0A = "3d";
	return lib_A5F1::func_87A6(param_00,var_08,var_09,var_0A,param_03,param_04,param_05,param_06,param_07,param_01,param_02);
}

//Function Number: 11
lib_A5F1::func_872E(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07)
{
	var_08 = "loop";
	var_09 = param_03;
	var_0A = "3d";
	return lib_A5F1::func_87A6(param_00,var_08,var_09,var_0A,param_04,param_05,param_06,param_07,(0,0,0),param_01,param_02);
}

//Function Number: 12
lib_A5F1::func_872D(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	var_07 = "loop";
	var_08 = undefined;
	var_09 = "2d";
	return lib_A5F1::func_87A6(param_00,var_07,var_08,var_09,param_03,param_04,param_05,param_06,(0,0,0),param_01,param_02);
}

//Function Number: 13
lib_A5F1::func_873F(param_00)
{
}

//Function Number: 14
lib_A5F1::func_87A6(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	if(!soundexists(param_00))
	{
		return;
	}

	var_0C = param_03 == "3d" && !isdefined(param_02);
	var_0D = self;
	if(!var_0C)
	{
		var_0D = level.var_31D;
	}

	if(!isdefined(var_0D))
	{
		return;
	}

	var_0E = var_0D.var_2E6;
	if(isdefined(param_02))
	{
		var_0E = param_02;
	}

	var_0F = spawn("script_origin",var_0E);
	var_0D thread lib_A5F1::func_87AB(param_00,param_01,var_0C,param_02,param_03,var_0F,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
	return var_0F;
}

//Function Number: 15
lib_A5F1::func_87AB(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C)
{
	var_0D = self;
	var_0E = "sndx_play_alias_" + lib_A5DE::func_8712();
	level endon(var_0E);
	param_05 endon("death");
	param_06 = lib_A5D2::func_F30(undefined,param_06);
	param_07 = lib_A5D2::func_F30(0,param_07);
	param_08 = lib_A5D2::func_F30(0.1,param_08);
	param_09 = lib_A5D2::func_F30(1,param_09);
	param_0A = lib_A5D2::func_F30((0,0,0),param_0A);
	param_0B = lib_A5D2::func_F30(0,param_0B);
	param_0C = lib_A5D2::func_F30(0,param_0C);
	if(param_02)
	{
		var_0F = "tag_origin";
		if(isdefined(var_0D.model) || var_0D.model != "" || var_0D method_8442(var_0F) < 0)
		{
			var_0F = "";
		}

		param_05 linkto(var_0D,var_0F,param_0A,(0,0,0));
		param_05 thread lib_A5F1::func_87A8(param_08,var_0E,var_0D);
	}

	if(param_0B > 0)
	{
		if(param_0C)
		{
			lib_A5D2::func_1094(param_0B);
		}
		else
		{
			wait(param_0B);
		}
	}

	if(param_01 == "oneshot")
	{
		var_10 = "sounddone";
		var_11 = param_07;
		param_05 lib_A5F1::func_8724(param_00,var_10,var_11);
		param_05 thread lib_A5F1::func_87A9(0.05,var_0E,var_10);
	}
	else
	{
		param_05 lib_A5F1::func_8738(param_00);
	}

	param_05 scalevolume(0,0);
	if(isstring(param_06))
	{
		param_05 thread lib_A5F1::func_87AA(param_08,var_0E,param_06);
	}

	param_05 scalevolume(param_09,param_07);
}

//Function Number: 16
lib_A5F1::func_87A8(param_00,param_01,param_02)
{
	level endon(param_01);
	self endon("death");
	var_03 = self;
	param_02 waittill("death");
	var_03 thread lib_A5F1::func_87A7(param_00,param_01);
}

//Function Number: 17
lib_A5F1::func_87A9(param_00,param_01,param_02)
{
	level endon(param_01);
	self endon("death");
	var_03 = self;
	var_03 waittill(param_02);
	var_03 thread lib_A5F1::func_87A7(undefined,param_01);
}

//Function Number: 18
lib_A5F1::func_87AA(param_00,param_01,param_02)
{
	level endon(param_01);
	self endon("death");
	var_03 = self;
	level waittill(param_02);
	var_03 thread lib_A5F1::func_87A7(param_00,param_01);
}

//Function Number: 19
lib_A5F1::func_87A7(param_00,param_01)
{
	level notify(param_01);
	var_02 = self;
	if(isdefined(var_02))
	{
		if(isdefined(param_00))
		{
			var_02 scalevolume(0,param_00);
			wait(param_00);
			waittillframeend;
		}

		if(isdefined(var_02))
		{
			var_02 delete();
		}
	}
}

//Function Number: 20
lib_A5F1::func_8724(param_00,param_01,param_02)
{
	if(soundexists(param_00))
	{
		self.assistedsuicide = lib_A5DE::func_8712();
		self.var_86FC = 1;
		param_01 = lib_A5D2::func_F30(undefined,param_01);
		param_02 = lib_A5D2::func_F30(0,param_02);
		self playsoundasmaster(param_00,param_01,0,param_02);
	}
}

//Function Number: 21
lib_A5F1::func_8738(param_00)
{
	if(soundexists(param_00))
	{
		if(!isdefined(self.var_86FB))
		{
			self playloopsound(param_00);
			self.assistedsuicide = lib_A5DE::func_8712();
			self.var_86FB = 1;
			return;
		}

		return;
	}
}

//Function Number: 22
lib_A5F1::func_8772()
{
	if(isdefined(self.var_86FC))
	{
		self.var_86FC = undefined;
		self stopsounds();
		return;
	}

	if(isdefined(self.var_86FB))
	{
		self.var_86FB = undefined;
		self stoploopsound();
		self notify("sounddone");
	}
}

//Function Number: 23
lib_A5F1::func_8727(param_00,param_01,param_02,param_03)
{
	if(soundexists(param_00))
	{
		var_04 = 0.1;
		var_05 = spawn("script_origin",param_01);
		var_05 playloopsound(param_00);
		level waittill(param_02);
		if(isdefined(param_03))
		{
			var_04 = param_03;
		}

		if(isdefined(var_05))
		{
			var_05 scalevolume(0,var_04);
			wait(0.05);
			var_05 delete();
			return;
		}
	}
}