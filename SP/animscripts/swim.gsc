/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: swim.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 63
 * Decompile Time: 2420 ms
 * Timestamp: 4/20/2022 8:20:53 PM
*******************************************************************/

//Function Number: 1
func_5F7D()
{
	self endon("movemode");
	self method_818F("face enemy or motion");
	if(animscripts\utility::func_51AD())
	{
		self.var_4CB = 0.16;
	}
	else
	{
		self.var_4CB = 0.03;
	}

	animscripts\utility::func_9B23();
	if(animscripts\utility::func_5121(0))
	{
		func_5F7E();
		return;
	}

	func_5F86();
}

//Function Number: 2
func_9029()
{
	self.var_9020 = spawnstruct();
	self.var_9020.var_20B4 = "nostate";
	self.var_9020.movestate = "combat_stationary";
	self.var_9020.var_950C = "track_none";
	self.var_9020.var_8D5F = [];
	self.var_9020.var_8D5F["nostate"] = [::func_9041,::func_9041];
	self.var_9020.var_8D5F["noncombat"] = [::func_5F87,::func_5F88];
	self.var_9020.var_8D5F["combat"] = [::func_5F7F,::func_5F80];
	self.var_9020.var_8D5F["combat_stationary"] = [::func_9041,::func_9041];
	self.var_9020.var_8D5F["combat_forward"] = [::func_5F81,::func_5F82];
	self.var_9020.var_8D5F["combat_strafe"] = [::func_5F84,::func_5F85];
	self.var_9020.var_8D5F["track_none"] = [::func_9041,::func_9041];
	self.var_9020.var_8D5F["track_forward"] = [::func_9062,::func_9063];
	self.var_9020.var_8D5F["track_strafe"] = [::func_9065,::func_9066];
	self method_814C(func_40FE("aim_stand_D"));
	self method_814C(func_40FE("aim_stand_U"));
	self method_814C(func_40FE("aim_stand_L"));
	self method_814C(func_40FE("aim_stand_R"));
	self.var_2563 = ::func_903F;
	self.var_67D5 = 1;
	self.var_66F2 = ::func_9043;
	self.var_66F1 = 0.2;
}

//Function Number: 3
func_9035()
{
	self.var_9020 = undefined;
	if(animscripts\utility::func_51AD())
	{
		self.var_4CB = 0.16;
		return;
	}

	self.var_4CB = 0.3;
}

//Function Number: 4
func_9041()
{
}

//Function Number: 5
func_9040()
{
	func_5F8A("nostate");
	func_902E();
	if(isdefined(self.prevturnrate))
	{
		self.var_4CB = self.prevturnrate;
		self.prevturnrate = undefined;
	}
}

//Function Number: 6
func_5F86()
{
	if(self.var_9020.var_20B4 != "noncombat")
	{
		func_5F8A("noncombat");
	}

	var_00 = self.var_9020.var_5F18;
	var_01 = 0.4;
	if(animscripts\utility::func_51AD())
	{
		var_01 = 0.2;
	}

	self method_8152("swimanim",var_00,1,var_01,self.var_5F62);
	func_9067();
	animscripts\notetracks::func_2D0A(0.2,"swimanim");
}

//Function Number: 7
func_5F7E()
{
	if(self.var_9020.var_20B4 != "combat")
	{
		func_5F8A("combat");
	}

	if(isdefined(self.enemy))
	{
		animscripts\run::func_8007(1);
		if(!self.var_178)
		{
			func_9034();
			return;
		}
		else
		{
			if(self.var_9020.movestate != "combat_forward")
			{
				func_5F83("combat_forward");
			}

			if(isdefined(self.var_1341) && self.var_1341 && lengthsquared(self.var_4FF))
			{
				var_00 = vectortoangles(self.var_4FF);
				if(abs(angleclamp180(var_00[1] - self.var_41[1])) > 35)
				{
					self.var_4CB = 0.18;
					if(animscripts\utility::func_51AD())
					{
						self.var_4CB = 0.2;
					}
				}
				else
				{
					if(animscripts\utility::func_51AD())
					{
						self.var_4CB = 0.16;
					}
					else
					{
						self.var_4CB = 0.03;
					}

					self.var_1341 = undefined;
				}
			}
			else
			{
				self.var_1341 = undefined;
			}

			var_01 = func_40FE("forward_aim");
		}
	}
	else
	{
		if(self.var_9020.movestate != "combat_forward")
		{
			func_5F83("combat_forward");
		}

		animscripts\run::func_8007(0);
		var_01 = func_40FE("forward_aim");
	}

	var_02 = 0.4;
	if(animscripts\utility::func_51AD())
	{
		var_02 = 0.2;
	}

	func_9067();
	self method_8152("swimanim",var_01,1,var_02,self.var_5F62);
	animscripts\notetracks::func_2D0A(0.2,"swimanim");
}

//Function Number: 8
func_5F8A(param_00)
{
	if(param_00 == self.var_9020.var_20B4)
	{
		return;
	}

	[[ self.var_9020.var_8D5F[self.var_9020.var_20B4][1] ]]();
	[[ self.var_9020.var_8D5F[param_00][0] ]]();
	self.var_9020.var_20B4 = param_00;
}

//Function Number: 9
func_5F87()
{
	if(self.var_9020.var_950C != "track_none")
	{
		func_9064("track_none");
	}

	func_905A();
	thread func_5F89();
}

//Function Number: 10
func_5F88()
{
	self notify("end_MoveSwim_NonCombat_TwitchUpdate");
}

//Function Number: 11
func_5F7F()
{
	self method_8143(%combatrun,1,0.5,self.var_5F62);
	if(self.var_9020.movestate != "combat_forward")
	{
		func_5F83("combat_forward");
	}
}

//Function Number: 12
func_5F80()
{
	func_5F83("combat_stationary");
}

//Function Number: 13
func_5F83(param_00)
{
	if(param_00 == self.var_9020.movestate)
	{
		return;
	}

	[[ self.var_9020.var_8D5F[self.var_9020.movestate][1] ]]();
	[[ self.var_9020.var_8D5F[param_00][0] ]]();
	self.var_9020.movestate = param_00;
}

//Function Number: 14
func_5F81()
{
	if(self.var_9020.var_950C != "track_forward")
	{
		func_9064("track_forward");
	}

	func_905A();
}

//Function Number: 15
func_5F82()
{
}

//Function Number: 16
func_5F84()
{
	self method_8144(func_40FE("strafe_B"),1,0.1,self.var_8559,1);
	self method_8144(func_40FE("strafe_L"),1,0.1,self.var_8559,1);
	self method_8144(func_40FE("strafe_R"),1,0.1,self.var_8559,1);
	if(self.var_9020.var_950C != "track_strafe")
	{
		func_9064("track_strafe");
	}

	func_902E();
	if(animscripts\utility::func_51AD())
	{
		self.var_4CB = 0.25;
		return;
	}

	self.var_4CB = 0.18;
	self.var_230 = 1;
}

//Function Number: 17
func_5F85()
{
	self method_8142(%combatrun_forward,0.2);
	self method_8142(%combatrun_backward,0.2);
	self method_8142(%combatrun_left,0.2);
	self method_8142(%combatrun_right,0.2);
	if(animscripts\utility::func_51AD())
	{
		self.var_4CB = 0.16;
	}
	else
	{
		self.var_4CB = 0.03;
		self.var_230 = 0;
	}

	self.var_1341 = 1;
}

//Function Number: 18
func_9064(param_00)
{
	if(self.var_9020.var_950C == param_00)
	{
		return;
	}

	[[ self.var_9020.var_8D5F[self.var_9020.var_950C][1] ]]();
	[[ self.var_9020.var_8D5F[param_00][0] ]]();
	self.var_9020.var_950C = param_00;
}

//Function Number: 19
func_9062()
{
	self method_814C(func_40FE("aim_move_D"));
	self method_814C(func_40FE("aim_move_L"));
	self method_814C(func_40FE("aim_move_R"));
	self method_814C(func_40FE("aim_move_U"));
	thread func_5F8B();
}

//Function Number: 20
func_9063()
{
	self method_8142(%aim_2,0.2);
	self method_8142(%aim_4,0.2);
	self method_8142(%aim_6,0.2);
	self method_8142(%aim_8,0.2);
}

//Function Number: 21
func_9065()
{
}

//Function Number: 22
func_9066()
{
	self method_8142(%w_aim_4,0.2);
	self method_8142(%w_aim_6,0.2);
	self method_8142(%w_aim_8,0.2);
	self method_8142(%w_aim_2,0.2);
}

//Function Number: 23
func_5F8B()
{
	self endon("killanimscript");
	self endon("end_face_enemy_tracking");
	if(!isdefined(self.var_972))
	{
		self.var_972 = 1;
		animscripts\combat::func_7E02();
		if(animscripts\utility::func_51AD())
		{
			self.var_37F = 90;
			self.var_251 = -90;
		}

		animscripts\track::func_94FB(%w_aim_2,%w_aim_4,%w_aim_6,%w_aim_8);
	}
}

//Function Number: 24
func_40FE(param_00,param_01)
{
	var_02 = animscripts\utility::func_5860("swim",param_00);
	if(isdefined(param_01))
	{
		return var_02[param_01];
	}

	return var_02;
}

//Function Number: 25
func_5F89()
{
	var_00 = func_40FE("forward");
	self.var_9020.var_5F18 = var_00;
}

//Function Number: 26
func_905F()
{
	if(isdefined(self.var_2B0D))
	{
		return 0;
	}

	if(!isdefined(self.var_2FD))
	{
		return 0;
	}

	var_00 = self.var_274;
	self.var_274 = 128;
	if(!self method_8191())
	{
		self.var_274 = var_00;
		return 0;
	}

	self.var_274 = var_00;
	var_01 = 10000;
	if(animscripts\utility::func_51AD())
	{
		var_01 = 32400;
	}

	if(distancesquared(self.var_2E6,self.var_2FD) < var_01)
	{
		return 0;
	}

	if(self.var_7.var_5F58 != "stop")
	{
		return 0;
	}

	if(lengthsquared(self.var_338) > 1)
	{
		var_02 = vectortoangles(self.var_338);
		if(abs(angleclamp180(var_02[1] - self.var_41[1])) < 90)
		{
			var_03 = vectortoangles(self.var_25C);
			if(abs(angleclamp180(var_03[1] - self.var_41[1])) < 90)
			{
				return 0;
			}
		}
	}

	return 1;
}

//Function Number: 27
func_903F()
{
	self.var_7.var_6E57 = "stand";
	if(!func_905F())
	{
		return;
	}

	var_00 = func_902C();
	if(!isdefined(var_00))
	{
		return;
	}

	var_01 = var_00.var_58BD;
	var_02 = var_00.var_58BB;
	var_03 = var_00.var_58BA;
	var_04 = vectortoangles(self.var_25C);
	var_05 = var_04 - var_03;
	var_06 = anglestoforward(var_05);
	var_07 = animscripts\exit_node::func_3F89();
	if(animscripts\utility::func_51AD() && isdefined(var_07))
	{
		var_08 = func_9039(var_07);
		if(var_08 != "exposed")
		{
			var_09 = func_4048(var_07);
			var_06 = anglestoforward(var_09);
		}
		else
		{
			var_06 = anglestoforward(self.var_41);
		}
	}

	self method_818E("nogravity",0);
	var_0A = randomfloatrange(0.9,1.1);
	var_0B = 0.3;
	self method_818F("face angle 3d",self.var_41);
	if(isdefined(var_01) && !animscripts\utility::func_51AD())
	{
		self method_8110("startturn",var_01,%body,1,0.3,var_0A * self.var_5F62);
		animscripts\shared::func_2D05("startturn");
		var_0B = 0.5;
	}
	else if(isdefined(var_01) && animscripts\utility::func_51AD())
	{
		if(isdefined(var_07))
		{
			self method_818F("face direction",var_06);
		}

		self.prevturnrate = 0.16;
		self.var_4CB = 5;
		var_0B = 0.1;
		self method_8110("startturn",var_01,%body,1,var_0B,var_0A * self.var_5F62);
		animscripts\shared::func_2D05("startturn");
		var_0B = 0.5;
		self.var_4CB = 0.16;
		self.prevturnrate = undefined;
		var_0C = getangledelta(var_01);
		var_07 = animscripts\exit_node::func_3F89();
		var_06 = anglestoforward(self.var_41);
		if(isdefined(var_07))
		{
			var_08 = func_9039(var_07);
			if(var_08 != "exposed")
			{
				var_09 = func_4048(var_07);
				var_09 = (var_09[0],var_09[1] - var_0C,var_09[2]);
				var_06 = anglestoforward(var_09);
			}
		}
	}

	var_0D = var_04 - self.var_41;
	var_0E = function_0063(var_02);
	var_0F = 0.001 * abs(angleclamp180(var_0D[1] - var_03[1])) / var_0E;
	var_10 = 0.001 * abs(angleclamp180(var_0D[0] - var_03[0])) / var_0E;
	var_11 = max(var_0F,var_10);
	if(var_11 < 0.01)
	{
		var_11 = 0.01;
	}

	if(animscripts\utility::func_51AD())
	{
		var_0B = 0.05;
		self.var_4CB = 0.16;
		var_11 = 5;
	}

	self.prevturnrate = self.var_4CB;
	self.var_4CB = var_11;
	self method_818F("face direction",var_06);
	self method_8110("startmove",var_02,%body,1,var_0B,var_0A * self.var_5F62);
	animscripts\shared::func_2D05("startmove");
	self.var_4CB = self.prevturnrate;
	self.prevturnrate = undefined;
	self method_818F("face default");
	self method_818E("none",0);
	if(animscripts\utility::func_51AD())
	{
		if(animhasnotetrack(var_02,"finish"))
		{
			animscripts\shared::func_2D05("startmove");
		}

		var_12 = 65536;
		var_13 = self.var_1C6;
		if(isdefined(self.node))
		{
			var_13 = self.node.var_2E6;
		}

		if(distance2dsquared(self.var_2E6,var_13) > var_12)
		{
			self notify("force_space_rotation_update",0,0,undefined,1);
		}
	}

	if(animscripts\utility::func_51AD())
	{
		return 0.2;
	}

	return 0.4;
}

//Function Number: 28
func_905A()
{
	self method_814C(func_40FE("turn_add_l"));
	self method_814C(func_40FE("turn_add_r"));
	self method_814C(func_40FE("turn_add_u"));
	self method_814C(func_40FE("turn_add_d"));
	self.var_6F68 = 0;
	self.var_6F67 = 0;
}

//Function Number: 29
func_902E()
{
	self method_8142(%add_turn_l,0.2);
	self method_8142(%add_turn_r,0.2);
	self method_8142(%add_turn_u,0.2);
	self method_8142(%add_turn_d,0.2);
	self.var_6F68 = undefined;
	self.var_6F67 = undefined;
}

//Function Number: 30
func_902C()
{
	var_00 = animscripts\utility::func_5121();
	var_01 = animscripts\exit_node::func_3F89();
	var_02 = self.var_41;
	var_03 = 0;
	var_04 = 0;
	var_05 = 0;
	var_06 = vectortoangles(self.var_25C);
	var_07 = animscripts\utility::func_4139(var_01);
	if(animscripts\utility::func_51AD() && var_07[2])
	{
		if(var_07[2] != 0)
		{
			var_08 = anglestoforward(var_07);
			var_09 = self.var_1C6;
			if(isdefined(self.node))
			{
				var_09 = self.node.var_2E6;
			}

			var_0A = rotatepointaroundvector(var_08,var_09 - self.var_2E6,var_07[2] * -1);
			var_0B = var_0A + self.var_2E6;
			var_0C = var_0B - self.var_2E6;
			var_0C = vectornormalize(var_0C);
			var_06 = vectortoangles(var_0C);
			var_05 = 1;
		}
	}

	var_0D = undefined;
	var_0E = undefined;
	if(isdefined(var_01) && isdefined(var_01.type))
	{
		var_0E = func_9039(var_01);
		if(var_0E != "exposed")
		{
			var_0D = "exit_" + var_0E;
			var_02 = var_01.var_41;
			if(animscripts\utility::func_51AD())
			{
				var_02 = animscripts\utility::func_4139(var_01);
				if(var_05 == 1)
				{
					var_02 = (var_02[0],var_02[1],0);
				}
			}
			else
			{
				var_02 = var_01.var_41;
			}

			var_03 = 1;
		}
	}

	if(!isdefined(var_0D))
	{
		if(var_00)
		{
			var_0D = "idle_ready_to_forward";
		}
		else
		{
			var_0D = "idle_to_forward";
			var_04 = 1;
			var_03 = 1;
		}
	}

	var_0F = func_40FE(var_0D);
	var_10 = angleclamp180(var_06[1] - var_02[1]);
	var_11 = angleclamp180(var_06[0] - var_02[0]);
	var_12 = undefined;
	if(animscripts\utility::func_51AD())
	{
		var_12 = 3;
	}

	var_13 = func_9037(var_10,var_12);
	var_14 = func_9037(var_11,var_12);
	var_15 = var_0E;
	if(!isdefined(var_15) && isdefined(self.var_339) && distance2dsquared(self.var_339.var_2E6,self.var_2E6) < 36)
	{
		var_15 = func_9039(self.var_339);
	}

	if(var_13 == 4 && isdefined(var_15))
	{
		var_16 = isdefined(var_0E);
		if(var_15 == "cover_corner_l" && var_10 < -10 && !var_16 || isdefined(var_0F[2]))
		{
			var_13 = 2;
		}
		else if(var_15 == "cover_corner_r" && var_10 > 10 && !var_16 || isdefined(var_0F[6]))
		{
			var_13 = 6;
		}
	}

	if(!isdefined(var_0F[var_13]))
	{
		var_0D = "idle_to_forward";
		var_0F = func_40FE(var_0D);
		var_04 = 1;
	}

	var_17 = spawnstruct();
	if(var_04)
	{
		var_18 = func_40FE("idle_turn");
		if(!isdefined(var_18[var_13]))
		{
			var_19 = 0;
			var_1A = 8;
			while(!isdefined(var_0F[var_19]) && var_19 < 8)
			{
				var_19++;
			}

			while(!isdefined(var_0F[var_1A]) && var_1A > 0)
			{
				var_1A--;
			}

			if(var_13 < var_19)
			{
				var_13 = var_19;
			}
			else if(var_13 > var_1A)
			{
				var_13 = var_1A;
			}
		}

		var_17.var_58BD = var_18[var_13];
		var_13 = 4;
	}

	if(isdefined(var_0F[var_13]) && isdefined(var_0F[var_13][var_14]))
	{
		var_17.var_58BB = var_0F[var_13][var_14];
		if(var_03)
		{
			var_0F = func_40FE(var_0D + "_angleDelta");
			var_17.var_58BA = var_0F[var_13][var_14];
		}
		else
		{
			var_17.var_58BA = (0,0,0);
		}

		return var_17;
	}

	var_17 = undefined;
	return undefined;
}

//Function Number: 31
func_905E()
{
	self endon("killanimscript");
	self endon("swim_cancelapproach");
	thread func_9044();
	if(isdefined(self.var_2AF2) && self.var_2AF2)
	{
		return;
	}

	self.var_9020.var_D26 = self.var_2FD;
	if(isdefined(self getnegotiationstartnode()))
	{
		return;
	}

	var_00 = animscripts\cover_arrival::func_3EFE();
	if(isdefined(var_00) && func_903D(var_00))
	{
		thread func_9026();
		return;
	}

	thread func_9027();
}

//Function Number: 32
func_9044()
{
	self endon("killanimscript");
	self endon("swim_killrestartlistener");
	self waittill("path_set");
	var_00 = isdefined(self.var_2FD) && isdefined(self.var_9020.var_D26) && distancesquared(self.var_2FD,self.var_9020.var_D26) < 4;
	if(var_00)
	{
		thread func_9044();
		return;
	}

	func_902B();
	func_905E();
}

//Function Number: 33
func_902B()
{
	self notify("swim_cancelapproach");
	self.var_412 = 0;
}

//Function Number: 34
func_906A(param_00,param_01)
{
	self endon("swim_cancelwaitforapproachpos");
	var_02 = param_01 + 60 * param_01 + 60;
	var_03 = distancesquared(param_00,self.var_2E6);
	if(var_03 <= var_02)
	{
		return;
	}

	self.var_412 = var_02;
	self waittill("stop_soon");
	self.var_412 = 0;
}

//Function Number: 35
func_9027()
{
	self endon("killanimscript");
	self endon("swim_cancelapproach");
	self endon("move_interrupt");
	self endon("swim_killrestartlistener");
	if(!isdefined(self.var_2FD))
	{
		return;
	}

	var_00 = func_903A("arrival_exposed");
	func_906A(self.var_2FD,var_00);
	func_9033();
}

//Function Number: 36
func_9026()
{
	self endon("killanimscript");
	self endon("swim_cancelapproach");
	self endon("swim_killrestartlistener");
	var_00 = animscripts\cover_arrival::func_3EFE();
	self.var_CBC = func_9039(var_00);
	self.var_36C = 1;
	self waittill("cover_approach",var_01);
	var_00 = animscripts\cover_arrival::func_3EFE();
	var_02 = func_9039(var_00);
	if(var_02 == "exposed")
	{
		if(isdefined(var_00))
		{
			var_03 = var_00.var_2E6;
		}
		else
		{
			var_03 = self.var_2FD;
		}

		var_04 = var_03 - self.var_2E6;
		var_05 = vectortoangles(var_04);
		var_06 = (0,var_05[1],0);
		var_07 = (0,var_05[1],0);
	}
	else
	{
		var_03 = var_03.var_2E6;
		var_06 = func_4048(var_02);
		if(animscripts\utility::func_51AD())
		{
			var_07 = animscripts\utility::func_4139(var_01);
		}
		else
		{
			var_07 = var_01.var_41;
		}
	}

	thread func_9032(var_02,var_03,var_01,var_07,var_06);
}

//Function Number: 37
func_9033()
{
	var_00 = animscripts\cover_arrival::func_3EFE();
	var_01 = self.var_2FD;
	var_02 = (0,self.var_41[1],self.var_41[2]);
	if(isdefined(var_00) && var_00.type != "Path" && var_00.type != "Path 3D")
	{
		var_02 = func_4048(var_00);
	}
	else if(animscripts\cover_arrival::func_35B6())
	{
		var_02 = vectortoangles(self.enemy.var_2E6 - var_01);
	}

	var_03 = vectornormalize(var_01 - self.var_2E6);
	if(isdefined(var_00) && func_903D(var_00))
	{
		var_04 = func_9039(var_00);
		var_05 = func_4048(var_00);
		var_02 = var_00.var_41;
		if(animscripts\utility::func_51AD())
		{
			var_02 = animscripts\utility::func_4139(var_00);
		}

		thread func_9032(var_04,var_00.var_2E6,var_03,var_02,var_05);
		return;
	}

	thread func_9032("exposed",var_03,var_05,var_04,var_04);
}

//Function Number: 38
func_9031(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(animscripts\utility::func_51AD())
	{
		var_06 = (0,0,0);
		var_07 = (0,0,0);
		var_08 = combineangles(invertangles(param_04),param_05);
		var_09 = rotatevectorinverted(vectornormalize(self.var_2E6 - param_02),param_04) * -1;
		var_0A = func_9030(param_00,param_01,var_06,var_09,var_07,var_08,1,param_02,param_04);
		if(var_0A)
		{
			param_00.var_58BF = rotatevector(param_00.var_58BF,param_04) + param_02;
		}

		return var_0A;
	}

	return func_9030(param_05,var_06,var_07,var_08,var_09,var_0A,0);
}

//Function Number: 39
func_9032(param_00,param_01,param_02,param_03,param_04)
{
	self endon("killanimscript");
	self endon("swim_cancelapproach");
	self.var_CBC = param_00;
	var_05 = spawnstruct();
	if(!func_9031(var_05,param_00,param_01,param_02,param_03,param_04))
	{
		return;
	}

	var_06 = anglestoforward(self.var_41);
	var_07 = var_05.var_58BF - self.var_2E6;
	var_08 = length(var_07);
	var_07 = var_07 / var_08;
	if(animscripts\utility::func_51AD())
	{
		var_09 = param_01 - var_05.var_58BF;
		var_0A = length(var_09);
		var_0B = vectordot(var_07,var_06);
		if(var_08 > var_0A * 0.4 && vectordot(var_07,var_06) < 0.5)
		{
			self notify("force_space_rotation_update",0,0);
			return;
		}
	}
	else if(var_08 < 100 && vectordot(var_07,var_06) < 0.5)
	{
		return;
	}

	if(var_08 > 4)
	{
		if(var_08 < 12 || self.var_180 || !isdefined(self.node) || !animscripts\cover_arrival::func_51D1())
		{
			self.var_9020.var_D26 = var_05.var_58BF;
			self method_8160(var_05.var_58BF);
			if(animscripts\utility::func_51AD())
			{
				var_0C = 16384;
				for(;;)
				{
					if(distancesquared(self.var_2E6,var_05.var_58BF) < var_0C)
					{
						self.prevturnrate = self.var_4CB;
						self.var_4CB = 0.1;
						var_0D = calculatestartorientation(var_05.var_58BC,var_05.var_58BA,param_01,param_04);
						self notify("force_space_rotation_update",0,0,var_0D[1]);
						break;
					}

					wait(0.1);
				}
			}

			self waittill("runto_arrived");
		}
	}

	self notify("swim_killrestartlistener");
	var_0E = vectornormalize(param_01 - self.var_2E6);
	if(!func_9031(var_05,param_00,param_01,var_0E,param_03,param_04))
	{
		return;
	}

	self.var_9020.var_D23 = var_05.var_58BB;
	if(animscripts\utility::func_51AD())
	{
		var_0F = self method_81E4(var_05.var_58BF,param_04[1] - var_05.var_58BA[1],param_04[0] - var_05.var_58BA[0],param_04,var_05.var_58BA);
		return;
	}

	self method_81E4(var_05.var_58BF,param_04[1] - var_05.var_58BA[1],param_04[0] - var_05.var_58BA[0]);
}

//Function Number: 40
func_902F()
{
	self endon("killanimscript");
	self endon("abort_approach");
	var_00 = "arrival_" + self.var_CBC;
	var_01 = self.var_9020.var_D23;
	if(!self.var_180)
	{
		thread animscripts\cover_arrival::func_6BE();
	}

	var_02 = 0.4;
	if(animscripts\utility::func_51AD())
	{
		var_02 = 0.2;
		thread func_88AD();
	}

	self method_8142(%body,0.2);
	self method_8113("coverArrival",var_01,1,var_02,self.var_5F94);
	animscripts\shared::func_2D05("coverArrival",::func_903C);
	if(!animhasnotetrack(var_01,"start_aim"))
	{
		func_9060();
	}

	self.var_7.var_6E57 = "stand";
	self.var_7.var_5F58 = "stop";
	self.var_7.var_D29 = self.var_CBC;
	if(animscripts\utility::func_51AD())
	{
		self.var_4CB = 0.16;
		self.prevturnrate = undefined;
	}

	self method_8142(%animscript_root,0.3);
	self.var_5572 = undefined;
	self.var_9020.var_D23 = undefined;
	if(animscripts\utility::func_51AD() && self.var_CBC == "exposed")
	{
		self notify("force_space_rotation_update",0,0,undefined,1);
	}
}

//Function Number: 41
func_88AD()
{
	self endon("killanimscript");
	self endon("abort_approach");
	wait(0.22);
	self.prevturnrate = 0.16;
	self.var_4CB = 5;
}

//Function Number: 42
func_9038(param_00,param_01,param_02,param_03,param_04)
{
	if(param_04)
	{
		var_05 = calculatestartorientation(param_02,param_03,param_00,param_01);
		return var_05[0];
	}

	var_06 = param_02 - param_04;
	var_07 = anglestoforward(var_06);
	var_08 = anglestoright(var_06);
	var_09 = anglestoup(var_06);
	var_0A = var_07 * param_03[0];
	var_0B = var_08 * param_03[1];
	var_0C = var_09 * param_03[2];
	return param_01 - var_0A + var_0B - var_0C;
}

//Function Number: 43
func_903E(param_00,param_01,param_02,param_03,param_04)
{
	if(param_02)
	{
		param_01 = rotatevector(param_01,param_04) + param_03;
		return self method_81C4(param_03,param_01,0,1);
	}

	return self method_81C4(param_00,param_01,0,1);
}

//Function Number: 44
func_9030(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	if(lengthsquared(param_03) < 0.003)
	{
		return 0;
	}

	var_09 = vectortoangles(param_03);
	if(param_01 == "exposed")
	{
		var_0A = 4;
		var_0B = 4;
	}
	else
	{
		var_0C = angleclamp180(param_06[1] - var_0B[1]);
		var_0A = func_9037(var_0C);
		var_0B = func_9037(var_0C,25);
	}

	var_0D = angleclamp180(param_04[0] - var_09[0]);
	var_0E = func_9037(var_0D);
	var_0F = func_9037(var_0D,25);
	var_10 = "arrival_" + param_01;
	if(param_01 == "exposed" && !animscripts\utility::func_5121(0))
	{
		var_10 = var_10 + "_noncombat";
	}

	var_11 = func_40FE(var_10);
	if(!isdefined(var_11[var_0A]) || !isdefined(var_11[var_0A][var_0E]))
	{
		return 0;
	}

	var_12 = (var_0A != var_0B || var_0E != var_0F) && isdefined(var_11[var_0B]) && isdefined(var_11[var_0B][var_0F]);
	var_13 = 0;
	var_14 = 0;
	var_15 = undefined;
	var_16 = var_11[var_0A][var_0E];
	if(var_12)
	{
		var_15 = var_11[var_0B][var_0F];
	}

	var_17 = var_10 + "_delta";
	var_11 = func_40FE(var_17);
	var_18 = var_11[var_0A][var_0E];
	if(var_12)
	{
		var_13 = var_11[var_0B][var_0F];
	}

	var_19 = var_10 + "_angleDelta";
	var_11 = func_40FE(var_19);
	var_1A = var_11[var_0A][var_0E];
	if(var_12)
	{
		var_14 = var_11[var_0B][var_0F];
	}

	var_1B = func_9038(param_02,param_05,var_18,var_1A,param_06);
	if(!func_903E(param_02,var_1B,param_06,param_07,param_08) && var_12 && !animscripts\utility::func_51AD())
	{
		var_16 = var_15;
		var_18 = var_13;
		var_1A = var_14;
		var_1B = func_9038(param_02,param_05,var_18,var_1A,param_06);
		if(!func_903E(param_02,var_1B,param_06,param_07,param_08))
		{
			return 0;
		}
	}

	param_00.var_58BB = var_16;
	param_00.var_58BC = var_18;
	param_00.var_58BA = var_1A;
	param_00.var_58BF = var_1B;
	return 1;
}

//Function Number: 45
func_9037(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 10;
	}

	if(param_00 < 0)
	{
		return int(ceil(180 + param_00 - param_01 / 45));
	}

	return int(floor(180 + param_00 + param_01 / 45));
}

//Function Number: 46
func_903A(param_00)
{
	var_01 = level.var_CCA["soldier"]["swim"][param_00]["maxDelta"];
	if(isdefined(self.var_C4D) && self.var_C4D != "soldier")
	{
		if(isdefined(level.var_CCA[self.var_C4D]["swim"]) && isdefined(level.var_CCA[self.var_C4D]["swim"][param_00]))
		{
			var_02 = level.var_CCA[self.var_C4D]["swim"][param_00]["maxDelta"];
			if(var_02 > var_01)
			{
				var_01 = var_02;
			}
		}
	}

	return var_01;
}

//Function Number: 47
func_9060()
{
	animscripts\animset::func_7DCC();
	animscripts\combat::func_7DB0();
	self.var_6F64 = 0;
	animscripts\combat_utility::func_82F2(0);
	thread animscripts\track::func_950B();
}

//Function Number: 48
func_903C(param_00)
{
	if(param_00 != "start_aim")
	{
		return;
	}

	func_9060();
}

//Function Number: 49
func_9039(param_00)
{
	if(!isdefined(param_00))
	{
		return "exposed";
	}

	var_01 = param_00.type;
	if(!isdefined(var_01))
	{
		return "exposed";
	}

	switch(var_01)
	{
		case "Cover Right 3D":
			break;

		case "Cover Left 3D":
			break;

		case "Cover Up 3D":
			break;

		case "Path 3D":
		case "Exposed 3D":
			break;

		default:
			break;
	}
}

//Function Number: 50
func_4048(param_00)
{
	if(getdvarint("player_spaceEnabled") == 1)
	{
		var_01 = animscripts\utility::func_4139(param_00);
		if(animscripts\utility::func_5158(param_00))
		{
			var_02 = func_40FE("arrival_cover_corner_l_angleDelta");
			var_03 = var_02[4][4][1];
		}
		else if(animscripts\utility::func_515B(var_01))
		{
			var_02 = func_40FE("arrival_cover_corner_r_angleDelta");
			var_03 = var_02[4][4][1];
		}
		else
		{
			var_03 = 0;
		}

		var_01 = combineangles(var_01,(0,var_03,0));
		return var_01;
	}
	else
	{
		var_01 = var_03.var_41;
	}

	var_04 = var_03[1];
	if(animscripts\utility::func_5158(var_01))
	{
		var_02 = func_40FE("arrival_cover_corner_l_angleDelta");
		var_04 = var_04 + var_02[4][4][1];
	}
	else if(animscripts\utility::func_515B(var_01))
	{
		var_02 = func_40FE("arrival_cover_corner_r_angleDelta");
		var_04 = var_04 + var_02[4][4][1];
	}

	var_03 = (var_03[0],var_04,var_03[2]);
	return var_03;
}

//Function Number: 51
func_9034()
{
	if(self.var_9020.movestate != "combat_strafe")
	{
		func_5F83("combat_strafe");
	}

	var_00 = func_40FE("forward_aim");
	self method_8153("swimanim",var_00,1,0.1,1,1);
	thread func_9069();
	animscripts\notetracks::func_2D0A(0.2,"swimanim");
	self notify("end_swim_updatestrafeanim");
}

//Function Number: 52
func_9069()
{
	self endon("killanimscript");
	self endon("move_interrupt");
	self endon("move_mode");
	self endon("move_loop_restart");
	self endon("end_swim_updatestrafeanim");
	var_00 = 0;
	for(;;)
	{
		if(self.var_178)
		{
			if(!var_00)
			{
				func_905D(1,0,0,0);
				func_905C(0,0,0,0);
			}
		}
		else
		{
			if(self.var_363 == 1)
			{
				var_01 = [];
				var_01["front"] = 1;
				var_01["back"] = 0;
				var_01["left"] = 0;
				var_01["right"] = 0;
			}
			else
			{
				var_01 = animscripts\utility::func_707F(self method_8190());
			}

			if(isdefined(self.var_9AC2))
			{
				var_01["back"] = 0;
				if(var_01["front"] < 0.2)
				{
					var_01["front"] = 0.2;
				}
			}

			var_02 = func_905D(var_01["front"],var_01["back"],var_01["left"],var_01["right"]);
			func_905B(var_02);
			func_9068();
		}

		var_00 = self.var_178;
		wait(0.05);
		waittillframeend;
	}
}

//Function Number: 53
func_903B()
{
	if(animscripts\utility::func_51AD())
	{
		return 0.5;
	}

	return 0.5;
}

//Function Number: 54
func_905D(param_00,param_01,param_02,param_03)
{
	var_04 = func_903B();
	self method_814B(%combatrun_forward,param_00,var_04,1,1);
	self method_814B(%combatrun_backward,param_01,var_04,1,1);
	self method_814B(%combatrun_left,param_02,var_04,1,1);
	self method_814B(%combatrun_right,param_03,var_04,1,1);
	if(param_00 > 0)
	{
		return "front";
	}

	if(param_01 > 0)
	{
		return "back";
	}

	if(param_02 > 0)
	{
		return "left";
	}

	if(param_03 > 0)
	{
		return "right";
	}
}

//Function Number: 55
func_905B(param_00)
{
	switch(param_00)
	{
		case "front":
			break;

		case "back":
			break;

		case "left":
			break;

		case "right":
			break;

		default:
			break;
	}
}

//Function Number: 56
func_9068()
{
	var_00 = self.var_41[1];
	var_01 = self.var_41[0];
	var_02 = 0;
	var_03 = 0;
	var_04 = 0;
	var_05 = 0;
	var_06 = 45;
	var_07 = 60;
	if(isdefined(self.enemy))
	{
		var_08 = self.enemy.var_2E6 - self.var_2E6;
		var_09 = vectortoangles(var_08);
		var_0A = angleclamp180(var_09[1] - var_00);
		var_0B = angleclamp180(var_09[0] - var_01);
		if(var_0A > 0)
		{
			var_04 = clamp(1 - var_06 - var_0A / var_06,0,1);
		}
		else
		{
			var_05 = clamp(1 - var_06 + var_0A / var_06,0,1);
		}

		if(var_0B > 0)
		{
			var_03 = clamp(1 - var_07 - var_0B / var_07,0,1);
		}
		else
		{
			var_02 = clamp(1 - var_07 + var_0B / var_07,0,1);
		}
	}

	func_905C(var_02,var_03,var_04,var_05);
}

//Function Number: 57
func_905C(param_00,param_01,param_02,param_03)
{
	self method_814B(%w_aim_4,param_02,0.2,1,1);
	self method_814B(%w_aim_6,param_03,0.2,1,1);
	self method_814B(%w_aim_8,param_00,0.2,1,1);
	self method_814B(%w_aim_2,param_01,0.2,1,1);
}

//Function Number: 58
func_9043(param_00,param_01)
{
	var_02 = undefined;
	var_03 = undefined;
	var_04 = func_40FE("turn");
	var_05 = func_9037(param_00);
	var_06 = func_9037(param_01);
	if(isdefined(var_04[var_05]))
	{
		var_02 = var_04[var_05][var_06];
	}

	if(var_05 == 4)
	{
		if(var_06 > 4 && isdefined(var_04[4][var_06 + 1]))
		{
			var_02 = var_04[4][var_06 + 1];
		}
		else if(var_06 < 4 && var_06 > 0 && isdefined(var_04[4][var_06 - 1]))
		{
			var_02 = var_04[4][var_06 - 1];
		}
	}

	if(!isdefined(var_02))
	{
		var_02 = var_04[var_05][4];
	}

	if(isdefined(var_02))
	{
		if(animscripts\move::func_66D1(var_02))
		{
			return var_02;
		}
	}

	return undefined;
}

//Function Number: 59
func_902D()
{
	func_5F8A("nostate");
}

//Function Number: 60
func_9067()
{
	var_00 = clamp(self.leanamount / 20,-1,1);
	if(var_00 > 0)
	{
		if(self.var_6F68 <= 0 && var_00 < 0.075)
		{
			var_00 = 0;
		}

		self method_814B(%add_turn_l,var_00,0.2,1,1);
		self method_814B(%add_turn_r,0,0.2,1,1);
	}
	else
	{
		if(self.var_6F68 >= 0 && var_00 > -0.075)
		{
			var_00 = 0;
		}

		self method_814B(%add_turn_l,0,0.2,1,1);
		self method_814B(%add_turn_r,0 - var_00,0.2,1,1);
	}

	self.var_6F68 = var_00;
	var_00 = clamp(self.var_317 / 25,-1,1);
	if(var_00 > 0)
	{
		if(self.var_6F67 <= 0 && var_00 < 0.075)
		{
			var_00 = 0;
		}

		self method_814B(%add_turn_d,var_00,0.2,1,1);
		self method_814B(%add_turn_u,0,0.2,1,1);
	}
	else
	{
		if(self.var_6F67 >= 0 && var_00 > -0.075)
		{
			var_00 = 0;
		}

		self method_814B(%add_turn_d,0,0.2,1,1);
		self method_814B(%add_turn_u,0 - var_00,0.2,1,1);
	}

	self.var_6F67 = var_00;
}

//Function Number: 61
func_903D(param_00)
{
	switch(param_00.type)
	{
		case "Exposed 3D":
		case "Cover Right 3D":
		case "Cover Left 3D":
		case "Cover Up 3D":
			break;
	}
}

//Function Number: 62
func_88AE()
{
	return 0.16;
}

//Function Number: 63
func_88AF()
{
	return 0.1;
}