/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42549.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 38
 * Decompile Time: 9 ms
 * Timestamp: 4/20/2022 8:23:50 PM
*******************************************************************/

//Function Number: 1
lib_A635::main(param_00,param_01,param_02)
{
	lib_A59E::func_186C("razorback",param_00,param_01,param_02);
	if(issubstr(param_02,"simple"))
	{
		lib_A59E::func_1859(::lib_A635::func_4D0E);
	}
	else
	{
		lib_A59E::func_1859(::lib_A635::func_4D0D);
	}

	lib_A59E::func_1842("vfx/explosion/rocket_explosion_default",undefined,"explo_metal_rand");
	lib_A59E::func_1864("vfx/explosion/rocket_explosion_default","tag_deathfx","apache_helicopter_crash",undefined,undefined,undefined,undefined,1,undefined,0,5);
	lib_A59E::func_1870(param_02,["thrusterCenter_TL_FX","thrusterCenter_TR_FX","thrusterCenter_BL_FX","thrusterCenter_BR_FX"]);
	lib_A59E::func_186F(param_02,::lib_A635::func_714D);
	lib_A59E::func_186E(param_02,"default","vfx/treadfx/razorback_tread_smk_idle_runner");
	lib_A59E::func_186E(param_02,"default_regular","vfx/treadfx/razorback_tread_smk_regular_runner");
	lib_A59E::func_186E(param_02,"default_strong","vfx/treadfx/razorback_tread_smk_strong_runner");
	lib_A59E::func_186E(param_02,"default_idle","vfx/treadfx/razorback_tread_smk_idle_runner");
	lib_A59E::func_1856(999,500,1500);
	lib_A59E::func_186A("allies");
	lib_A59E::func_1839(::lib_A635::func_7F1D,::lib_A635::func_7EF4);
	lib_A59E::func_1855();
	lib_A635::func_185B(param_02);
	lib_A636::main();
	setdvar("razorback_debug",0);
	lib_A59E::func_185C("razor_missile_launcher","launcherhatch","projectile_rpg7","rpg_guided",::lib_A635::func_5C91,::lib_A635::func_5C90);
}

//Function Number: 2
lib_A635::func_7DD4()
{
}

//Function Number: 3
lib_A635::func_185B(param_00)
{
	if(!isdefined(level.var_9C7F))
	{
		level.var_9C7F = [];
	}

	if(!isdefined(level.var_9C7F[param_00]))
	{
		level.var_9C7F[param_00] = [];
	}

	level.var_9C7F[param_00][0] = [];
	level.var_9C7F[param_00][0]["rotate_root"] = %razorback_root_wl;
	level.var_9C7F[param_00][0]["rotate_anim"] = %razorback_wing_left_rot;
	level.var_9C7F[param_00][0]["nozzle_root"] = %razorback_root_wl_nozzle;
	level.var_9C7F[param_00][0]["nozzle_anim"] = %razorback_wing_left_nozzle;
	level.var_9C7F[param_00][0]["socket_root"] = %razorback_root_wl_socket;
	level.var_9C7F[param_00][0]["socket_anim"] = %razorback_wing_left_socket;
	level.var_9C7F[param_00][0]["thruster_fx_tag"] = "thrusterCenter_TL_FX";
	level.var_9C7F[param_00][1] = [];
	level.var_9C7F[param_00][1]["rotate_root"] = %razorback_root_wr;
	level.var_9C7F[param_00][1]["rotate_anim"] = %razorback_wing_right_rot;
	level.var_9C7F[param_00][1]["nozzle_root"] = %razorback_root_wr_nozzle;
	level.var_9C7F[param_00][1]["nozzle_anim"] = %razorback_wing_right_nozzle;
	level.var_9C7F[param_00][1]["socket_root"] = %razorback_root_wr_socket;
	level.var_9C7F[param_00][1]["socket_anim"] = %razorback_wing_right_socket;
	level.var_9C7F[param_00][1]["thruster_fx_tag"] = "thrusterCenter_TR_FX";
	level.var_9C7F[param_00][2] = [];
	level.var_9C7F[param_00][2]["rotate_root"] = %razorback_root_bl;
	level.var_9C7F[param_00][2]["rotate_anim"] = %razorback_base_left_rot;
	level.var_9C7F[param_00][2]["nozzle_root"] = %razorback_root_bl_nozzle;
	level.var_9C7F[param_00][2]["nozzle_anim"] = %razorback_base_left_nozzle;
	level.var_9C7F[param_00][2]["thruster_fx_tag"] = "thrusterCenter_BL_FX";
	level.var_9C7F[param_00][3] = [];
	level.var_9C7F[param_00][3]["rotate_root"] = %razorback_root_br;
	level.var_9C7F[param_00][3]["rotate_anim"] = %razorback_base_right_rot;
	level.var_9C7F[param_00][3]["nozzle_root"] = %razorback_root_br_nozzle;
	level.var_9C7F[param_00][3]["nozzle_anim"] = %razorback_base_right_nozzle;
	level.var_9C7F[param_00][3]["thruster_fx_tag"] = "thrusterCenter_BR_FX";
	level.var_9C7F[param_00][4] = [];
	level.var_9C7F[param_00][4]["rotate_root"] = %razorback_root_tl;
	level.var_9C7F[param_00][4]["rotate_anim"] = %razorback_tail_left_rot;
	level.var_9C7F[param_00][5] = [];
	level.var_9C7F[param_00][5]["rotate_root"] = %razorback_root_tr;
	level.var_9C7F[param_00][5]["rotate_anim"] = %razorback_tail_right_rot;
}

//Function Number: 4
lib_A635::func_7EF4(param_00)
{
	return param_00;
}

//Function Number: 5
lib_A635::func_7F1D()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 9;var_01++)
	{
		var_00[var_01] = spawnstruct();
	}

	var_00[0].var_85A8 = "tag_driver";
	var_00[0].var_4B60 = %razor_copilot_idle;
	var_00[0].var_2645 = 1;
	var_00[0].var_1433 = 0;
	var_00[1].var_85A8 = "tag_passenger";
	var_00[1].var_4B60 = %razor_copilot_idle;
	var_00[1].var_2645 = 1;
	var_00[1].var_1433 = 0;
	var_00[2].var_85A8 = "tag_guy0";
	var_00[2].var_4B60 = %lab_chopper_evac_hover_idle_npc;
	var_00[2].var_2645 = 1;
	var_00[3].var_85A8 = "tag_guy1";
	var_00[3].var_4B60 = %lab_chopper_evac_hover_idle_npc;
	var_00[3].var_2645 = 1;
	var_00[4].var_85A8 = "tag_guy2";
	var_00[4].var_4B60 = %lab_chopper_evac_hover_idle_npc;
	var_00[4].var_2645 = 1;
	var_00[5].var_85A8 = "tag_guy3";
	var_00[5].var_4B60 = %lab_chopper_evac_hover_idle_npc;
	var_00[5].var_2645 = 1;
	var_00[6].var_85A8 = "tag_guy4";
	var_00[6].var_4B60 = %lab_chopper_evac_hover_idle_npc;
	var_00[6].var_2645 = 1;
	var_00[7].var_85A8 = "tag_guy5";
	var_00[7].var_4B60 = %lab_chopper_evac_hover_idle_npc;
	var_00[7].var_2645 = 1;
	var_00[8].var_85A8 = "tag_guy6";
	var_00[8].var_4B60 = %lab_chopper_evac_hover_idle_npc;
	var_00[8].var_2645 = 1;
	return var_00;
}

//Function Number: 6
lib_A635::func_4D0D()
{
	lib_A635::func_4630();
	self.var_5CAA = 1;
	self.var_2D2F = 1;
	self.var_7953 = 0;
	self.var_3117 = 1;
	wait(0.05);
	lib_A59E::func_9CFA("running");
	while(lib_A635::func_506A())
	{
		wait 0.05;
	}

	thread lib_A635::func_9A9E();
	self.var_933A = [];
	self.var_9339 = [];
	self.var_933B = [];
	self method_814B(%razorback_idle,1,0,1);
	thread lib_A636::func_9DE1(self);
	thread lib_A636::func_699E(self);
	thread lib_A636::func_9DE5();
	thread lib_A635::func_4D66("thruster_TL");
	thread lib_A635::func_4D66("thruster_TR");
	thread lib_A635::func_4D66("thruster_BL");
	thread lib_A635::func_4D66("thruster_BR");
	thread lib_A635::func_4D66("thruster_KL");
	thread lib_A635::func_4D66("thruster_KR");
	thread lib_A635::func_9ADE();
}

//Function Number: 7
lib_A635::func_4D0E()
{
	self.var_2D2F = 1;
	self.var_7953 = 0;
	self.var_3117 = 1;
	wait(0.05);
	lib_A59E::func_9CFA("running");
}

//Function Number: 8
lib_A635::func_714D(param_00,param_01)
{
	var_02 = 0;
	if(param_01 == "thrusterCenter_TL_FX")
	{
		var_02 = 0;
	}
	else if(param_01 == "thrusterCenter_TR_FX")
	{
		var_02 = 1;
	}
	else if(param_01 == "thrusterCenter_BL_FX")
	{
		var_02 = 2;
	}
	else if(param_01 == "thrusterCenter_BR_FX")
	{
		var_02 = 3;
	}

	if(!isdefined(self.var_933B) || !isdefined(self.var_933B[var_02]))
	{
		return param_00;
	}

	return "default_" + self.var_933B[var_02];
}

//Function Number: 9
lib_A635::func_7E37(param_00,param_01)
{
	lib_A640::func_7E37(param_00,param_01);
}

//Function Number: 10
lib_A635::func_2AA3(param_00)
{
	lib_A640::func_2AA3(param_00);
}

//Function Number: 11
lib_A635::func_30C1(param_00)
{
	lib_A640::func_30C1(param_00);
}

//Function Number: 12
lib_A635::func_2AE2(param_00)
{
	lib_A640::func_2AE2(param_00);
}

//Function Number: 13
lib_A635::func_30FD(param_00)
{
	lib_A640::func_30FD(param_00);
}

//Function Number: 14
lib_A635::func_562A()
{
	lib_A640::func_7ED0(1,-2);
}

//Function Number: 15
lib_A635::func_5629()
{
	lib_A640::func_7ED0(0,-2);
}

//Function Number: 16
lib_A635::func_30FB()
{
	lib_A640::func_7ED0(1,-1);
}

//Function Number: 17
lib_A635::func_2AE0()
{
	lib_A640::func_7ED0(0,-1);
}

//Function Number: 18
lib_A635::func_37BB(param_00)
{
	lib_A63F::func_37BB(param_00);
}

//Function Number: 19
lib_A635::func_4630()
{
	lib_A635::func_2AE2();
	thread lib_A641::func_9D5C(1.5);
	thread lib_A641::func_9D5B(3,5,0.15,5);
	thread lib_A641::func_9D56();
	lib_A635::func_8230();
}

//Function Number: 20
lib_A635::func_8230()
{
	self.var_5CC7 = [];
	self.var_5CCA = [];
	self.var_5CC7[0] = "TAG_MISSILE_1";
	self.var_5CC7[1] = "TAG_MISSILE_2";
	self.var_5CC7[2] = "TAG_MISSILE_3";
	self.var_5CC7[3] = "TAG_MISSILE_4";
	self.var_5CC7[4] = "TAG_MISSILE_5";
	self.var_5CC7[5] = "TAG_MISSILE_6";
	thread lib_A63F::func_7312();
}

//Function Number: 21
lib_A635::func_5C91()
{
	self method_8145(%razorback_launcher_hatch_open,0.9,0);
	self method_814C(%razorback_root_launcher_hatch,1,0);
	wait(function_0063(%razorback_launcher_hatch_open));
}

//Function Number: 22
lib_A635::func_5C90()
{
	self method_814C(%razorback_root_launcher_hatch,0.01,0.5);
	wait(function_0063(%razorback_launcher_hatch_open));
}

//Function Number: 23
lib_A635::func_506A()
{
	return isdefined(self.var_550) && self.var_550 > 0;
}

//Function Number: 24
lib_A635::func_3D69(param_00,param_01)
{
	return level.var_9C7F[self.classname][param_00][param_01];
}

//Function Number: 25
lib_A635::func_4D66(param_00)
{
	self endon("death");
	var_01 = lib_A635::func_3E83(param_00);
	self.var_9339[var_01] = 0;
	self.var_933A[var_01] = 0;
}

//Function Number: 26
lib_A635::func_9ADE()
{
	self endon("death");
	for(;;)
	{
		if(!lib_A635::func_506A())
		{
			for(var_00 = 0;var_00 < self.var_933A.size;var_00++)
			{
				if(isdefined(self.var_2687))
				{
				}
				else
				{
					var_01 = lib_A635::func_3CC4(var_00,0);
					var_02 = lib_A635::func_3CC5(var_00);
					var_03 = lib_A635::func_3CC6(var_00);
					var_04 = var_01 + -90 - var_01 * var_02;
					var_04 = var_04 + -90 - var_04 * var_03;
					self.var_933A[var_00] = var_04;
					var_05 = lib_A635::func_3DF2(var_00,self.var_933A[var_00]);
					lib_A635::func_9AC5(var_00,var_05);
				}

				self.var_933A[var_00] = clamp(self.var_933A[var_00],-90,0);
				lib_A635::func_9ADD(var_00);
			}
		}

		wait(0.05);
	}
}

//Function Number: 27
lib_A635::func_3E83(param_00)
{
	if(param_00 == "thruster_TL")
	{
		return 0;
	}

	if(param_00 == "thruster_TR")
	{
		return 1;
	}

	if(param_00 == "thruster_BL")
	{
		return 2;
	}

	if(param_00 == "thruster_BR")
	{
		return 3;
	}

	if(param_00 == "thruster_KL")
	{
		return 4;
	}

	if(param_00 == "thruster_KR")
	{
		return 5;
	}
}

//Function Number: 28
lib_A635::func_69C9(param_00,param_01)
{
	var_02 = lib_A635::func_3D69(param_00,"rotate_root");
	param_01 = clamp(param_01,0,1);
	var_03 = lib_A635::func_3D69(param_00,"rotate_anim");
	var_04 = 0.05;
	if(param_00 == 4)
	{
		var_04 = 0.2;
	}

	self method_8144(var_03,1,0,1);
	self method_8117(var_03,1);
	if(param_01 == 0)
	{
		self method_814C(var_02,0.01,var_04,1);
		return;
	}

	self method_814C(var_02,param_01,var_04,1);
}

//Function Number: 29
lib_A635::func_9ADD(param_00)
{
	var_01 = self.var_933A[param_00];
	var_02 = self.var_9339[param_00];
	if(!lib_A635::func_5028(var_02,var_01))
	{
		if(abs(var_01 - var_02) < 6)
		{
			self.var_9339[param_00] = var_01;
		}
		else if(var_02 > var_01)
		{
			self.var_9339[param_00] = self.var_9339[param_00] - 6;
		}
		else
		{
			self.var_9339[param_00] = self.var_9339[param_00] + 6;
		}

		lib_A635::func_69C9(param_00,self.var_9339[param_00] / -90);
	}
}

//Function Number: 30
lib_A635::func_9AC5(param_00,param_01)
{
	var_02 = lib_A635::func_3D69(param_00,"nozzle_root");
	var_03 = lib_A635::func_3D69(param_00,"nozzle_anim");
	var_04 = lib_A635::func_3D69(param_00,"thruster_fx_tag");
	var_05 = undefined;
	var_06 = undefined;
	if(isdefined(var_02))
	{
		self method_8144(var_03,1,0,1);
		self method_8117(var_03,1);
		if(param_01 == 0)
		{
			self method_814C(var_02,0.01,0.05,1);
		}
		else
		{
			self method_814C(var_02,param_01,0.05,1);
		}

		var_05 = self.var_933B[param_00];
		if(param_01 < 0.01)
		{
			var_06 = "idle";
		}
		else if(param_01 > 0.5)
		{
			var_06 = "strong";
		}
		else
		{
			var_06 = "regular";
		}

		if(!isdefined(var_05) || var_05 != var_06)
		{
			self.var_933B[param_00] = var_06;
			self notify("killfx_" + var_04);
			lib_A636::func_69C8(param_00,var_06,var_04);
		}
	}
}

//Function Number: 31
lib_A635::func_5028(param_00,param_01)
{
	var_02 = 0.1;
	return abs(param_00 - param_01) < var_02;
}

//Function Number: 32
lib_A635::func_3CC6(param_00)
{
	var_01 = 0;
	var_02 = self.var_A3AC;
	if(var_02 < -1)
	{
		if(param_00 == 5)
		{
			var_01 = lib_A635::func_4EBD(var_02,-2,-1,1,0);
		}
	}

	if(var_02 < -1.5)
	{
		if(param_00 == 4)
		{
			var_01 = lib_A635::func_4EBD(var_02,-2,-1.5,-1,0);
		}
	}

	if(var_02 > 1)
	{
		if(param_00 == 4)
		{
			var_01 = lib_A635::func_4EBD(var_02,0.75,1.75,0,1);
		}
	}

	if(var_02 > 1.5)
	{
		if(param_00 == 5)
		{
			var_01 = lib_A635::func_4EBD(var_02,1.5,2,0,-1);
		}
	}

	return var_01;
}

//Function Number: 33
lib_A635::func_3CC5(param_00)
{
	var_01 = 0;
	var_02 = self.var_49E7;
	if(var_02 < -10)
	{
		if(param_00 == 0)
		{
			var_01 = lib_A635::func_4EBD(var_02,-100,-10,1,0);
		}
		else if(param_00 == 2)
		{
			var_01 = lib_A635::func_4EBD(var_02,-100,-10,1,0);
		}
	}

	if(var_02 > 10)
	{
		if(param_00 == 1)
		{
			var_01 = lib_A635::func_4EBD(var_02,10,100,0,1);
		}
		else if(param_00 == 3)
		{
			var_01 = lib_A635::func_4EBD(var_02,10,100,0,1);
		}
	}

	return var_01;
}

//Function Number: 34
lib_A635::func_3CC4(param_00,param_01)
{
	if(param_00 == 4)
	{
		return 0;
	}

	if(param_00 == 5)
	{
		return 0;
	}

	return lib_A635::func_4EBD(self.var_8A49,13,20 + param_01,-90,0);
}

//Function Number: 35
lib_A635::func_3DF2(param_00,param_01)
{
	if(param_00 == 4)
	{
		return 0;
	}
	else if(param_00 == 5)
	{
		return 0;
	}

	if(param_01 < -70)
	{
		return 1;
	}

	if(param_00 == 0)
	{
		return lib_A635::func_4EBD(self.var_8A49,10,15,1,0.25);
	}

	if(param_00 == 1)
	{
		return lib_A635::func_4EBD(self.var_8A49,10,15,1,0.25);
	}

	if(param_00 == 2)
	{
		return lib_A635::func_4EBD(self.var_8A49,10,15,1,0.75);
	}

	if(param_00 == 3)
	{
		return lib_A635::func_4EBD(self.var_8A49,10,15,1,0.75);
	}
}

//Function Number: 36
lib_A635::func_4EBD(param_00,param_01,param_02,param_03,param_04)
{
	if(param_00 <= param_01)
	{
		return param_03;
	}

	if(param_00 > param_02)
	{
		return param_04;
	}

	var_05 = param_04 - param_03 / param_02 - param_01;
	var_06 = var_05 * param_00 - param_01 + param_03;
	return var_06;
}

//Function Number: 37
lib_A635::func_5D39(param_00)
{
	return param_00 / 63360 * 60 * 60;
}

//Function Number: 38
lib_A635::func_9A9E()
{
	self endon("death");
	var_00 = self.var_2E6;
	var_01 = self.var_41;
	for(;;)
	{
		var_02 = self.var_2E6 - var_00;
		var_03 = self.var_41 - var_01;
		self.var_A3AC = var_03[1];
		self.var_9D78 = var_02 / 0.05;
		self.var_8A49 = lib_A635::func_5D39(length(self.var_9D78));
		var_04 = anglestoright(self.var_41);
		var_05 = (var_04[0],var_04[1],0);
		var_06 = (self.var_9D78[0],self.var_9D78[1],0);
		var_07 = vectordot(var_06,var_05);
		self.var_49E7 = var_07;
		var_00 = self.var_2E6;
		var_01 = self.var_41;
		wait 0.05;
	}
}