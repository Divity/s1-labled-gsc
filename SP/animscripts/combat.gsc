/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: combat.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 68
 * Decompile Time: 2590 ms
 * Timestamp: 4/20/2022 8:20:10 PM
*******************************************************************/

//Function Number: 1
func_4C77()
{
	var_00 = [];
	var_00["surprise_stop"] = %surprise_stop_v1;
	var_00["trans_to_combat"] = %casual_stand_idle_trans_out;
	var_00["smg_trans_to_combat"] = %smg_casual_stand_idle_trans_out;
	var_00["drop_rpg_stand"] = %rpg_stand_throw;
	var_00["drop_rpg_crouch"] = %rpg_crouch_throw;
	var_00["pistol_to_primary"] = %pistol_stand_switch;
	var_00["primary_to_pistol"] = %pistol_stand_pullout;
	var_00["rpg_death"] = %rpg_stand_death;
	var_00["rpg_death_stagger"] = %rpg_stand_death_stagger;
	level.var_CCA["soldier"]["combat"] = var_00;
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
		if(isdefined(self.var_2533["combat"]))
		{
			[[ self.var_2533["combat"] ]]();
			return;
		}
	}

	self endon("killanimscript");
	[[ self.exception["exposed"] ]]();
	animscripts\utility::func_4DD4("combat");
	self.var_7.var_D29 = undefined;
	if(isdefined(self.node) && self.node.type == "Ambush" && self method_8161(self.node))
	{
		self.var_B6A = self.node;
	}

	if(isdefined(self.inliveplayerkillstreak))
	{
		lib_A51B::func_2612("thrt_movement",self.inliveplayerkillstreak == "allies");
	}

	func_9717();
	func_2C7F();
	if(isdefined(self.var_8A29))
	{
		animscripts\stop::func_8A2A();
	}

	func_8039();
	func_358C();
	self notify("stop_deciding_how_to_shoot");
}

//Function Number: 3
end_script()
{
	self.var_B6A = undefined;
	func_2061();
}

//Function Number: 4
func_2C7F()
{
	if(self.inliveplayerkillstreak != "allies")
	{
		return;
	}

	if(self method_81CE() && self.var_33A == "move" && self.var_7.var_6E57 == "stand" && !isdefined(self.var_2B11))
	{
		if(isdefined(self.enemy) && distancesquared(self.var_2E6,self.enemy.var_2E6) < squared(128))
		{
			return;
		}

		if(!isdefined(self.var_7.var_CD8))
		{
			return;
		}

		if(isdefined(self.var_7.var_CD8["surprise_stop"]))
		{
			var_00 = animscripts\utility::func_C4E("surprise_stop");
		}
		else if(self.var_425)
		{
			var_00 = animscripts\swim::func_40FE("surprise_stop");
			if(!isdefined(var_00))
			{
				return;
			}
		}
		else
		{
			var_00 = animscripts\utility::func_5860("combat","surprise_stop");
		}

		func_7441();
		self method_8110("react",var_00,%animscript_root,1,0.2,self.var_C78);
		func_2088(var_00,"run");
		animscripts\shared::func_2D05("react");
	}
}

//Function Number: 5
func_9717()
{
	if(isdefined(self.var_8A29) || isdefined(self.var_255C))
	{
		return;
	}

	if(isdefined(self.var_C4D) && self.var_C4D == "s1_soldier")
	{
		if(!isdefined(self.enemy))
		{
			return;
		}

		if(self.var_7.var_6E57 == "crouch")
		{
			if(self.var_33A == "cover_right")
			{
				func_7441();
				self method_818F("face current");
				var_00 = animscripts\utility::func_5860("combat","trans_from_crouch_r");
				self method_8110("transition",var_00,%animscript_root,1,0.2,1);
				wait(function_0063(var_00));
			}
			else if(self.var_33A == "cover_left")
			{
				func_7441();
				self method_818F("face current");
				var_00 = animscripts\utility::func_5860("combat","trans_from_crouch_l");
				self method_8110("transition",var_00,%animscript_root,1,0.2,1);
				wait(function_0063(var_00));
			}
		}
	}

	if(isdefined(self.enemy) && distancesquared(self.var_2E6,self.enemy.var_2E6) < 262144)
	{
		return;
	}

	if(self.var_33A == "stop" && !animscripts\utility::func_50E6() && self.var_7.var_6E57 == "stand")
	{
		func_7441();
		var_00 = undefined;
		if(animscripts\utility::func_9C33())
		{
			var_00 = animscripts\utility::func_5860("combat","smg_trans_to_combat");
		}
		else
		{
			var_00 = animscripts\utility::func_5860("combat","trans_to_combat");
		}

		self method_8110("transition",var_00,%animscript_root,1,0.2,1.2 * self.var_C78);
		func_2088(var_00,"run");
		animscripts\shared::func_2D05("transition");
	}
}

//Function Number: 6
func_8049()
{
	if(self.var_7.var_6E57 == "stand")
	{
		animscripts\animset::func_7DCC();
		return;
	}

	if(self.var_7.var_6E57 == "crouch")
	{
		animscripts\animset::func_7DBF();
		return;
	}

	if(self.var_7.var_6E57 == "prone")
	{
		animscripts\animset::func_7DC8();
		return;
	}
}

//Function Number: 7
func_8039()
{
	if(animscripts\utility::func_9C32() && self method_81CB("stand"))
	{
		func_9716("stand");
	}

	func_8049();
	func_7DB0();
	thread func_8EFC();
	self.var_6F64 = 0;
	self method_8142(%animscript_root,0.2);
	var_00 = 0.2;
	if(isdefined(self.var_97C))
	{
		var_00 = self.var_97C;
	}

	animscripts\combat_utility::func_82F2(var_00);
	thread animscripts\combat_utility::func_979();
	self.var_7.var_5B8D = "aim";
	func_27EC();
}

//Function Number: 8
func_8EFC()
{
	self endon("killanimscript");
	wait(0.2);
	self.var_7.var_5F58 = "stop";
}

//Function Number: 9
func_7E07()
{
	if(self.var_425)
	{
		if(animscripts\utility::func_51AD())
		{
			self.var_4E0 = 90;
			self.var_134 = -90;
			self.var_37F = 45;
			self.var_251 = -45;
			return;
		}

		self.var_4E0 = 90;
		self.var_134 = -120;
	}
}

//Function Number: 10
func_7E02(param_00)
{
	if(isdefined(param_00))
	{
		self method_8173(param_00);
	}
	else
	{
		self method_8173();
	}

	func_7E07();
}

//Function Number: 11
func_7DB0()
{
	func_7E02();
	if(self.var_7.var_6E57 == "stand" && !self.var_425)
	{
		self.var_4E0 = 60;
		self.var_134 = -60;
	}

	self.var_9932 = self.var_279F;
}

//Function Number: 12
func_830E()
{
	thread animscripts\track::func_950B();
	thread func_7176();
	thread animscripts\shoot_behavior::func_2742("normal");
	thread func_A24F();
	func_7448();
	if(isdefined(self.var_7.var_58DB))
	{
		animscripts\weaponlist::func_72AE();
		self.var_7.var_58DB = undefined;
	}

	self.var_7.var_2D2E = gettime() + randomintrange(500,1500);
}

//Function Number: 13
func_358F(param_00)
{
	if(animscripts\utility::func_9C2E() && animscripts\utility::func_848F(param_00))
	{
		if(self.var_7.var_6E57 != "stand" && self.var_7.var_6E57 != "crouch")
		{
			func_9716("crouch");
		}

		if(self.var_7.var_6E57 == "stand")
		{
			animscripts\shared::func_9333(animscripts\utility::func_5860("combat","drop_rpg_stand"));
		}
		else
		{
			animscripts\shared::func_9333(animscripts\utility::func_5860("combat","drop_rpg_crouch"));
		}

		self method_8142(%animscript_root,0.2);
		animscripts\combat_utility::func_315D();
		func_8049();
		animscripts\combat_utility::func_8D11();
		return 1;
	}

	return 0;
}

//Function Number: 14
func_358B(param_00)
{
	if(self.var_7.var_6E57 != "stand" && self method_81CB("stand"))
	{
		if(param_00 < 81225)
		{
			func_9716("stand");
			return 1;
		}

		if(func_8B02())
		{
			return 1;
		}
	}

	if(param_00 > 262144 && self.var_7.var_6E57 != "crouch" && self method_81CB("crouch") && !self.var_425 && !animscripts\utility::func_9C32() && !isdefined(self.var_4792) && gettime() >= self.var_7.var_2D2E && lengthsquared(self.var_83F1) < 10000)
	{
		if(!isdefined(self.var_8409) || sighttracepassed(self.var_2E6 + (0,0,36),self.var_8409,0,undefined))
		{
			func_9716("crouch");
			return 1;
		}
	}

	return 0;
}

//Function Number: 15
func_358A(param_00)
{
	if(!animscripts\utility::func_9C32())
	{
		if(isdefined(self.var_39C5) && self.var_7.var_6E57 == "stand")
		{
			if(func_98CE())
			{
				return 1;
			}
		}

		if(animscripts\combat_utility::issniper() && param_00 < 167772.2)
		{
			if(func_98CE())
			{
				return 1;
			}
		}
	}

	if(animscripts\combat_utility::func_6086(0))
	{
		if(!animscripts\utility::func_9C32() && common_scripts\utility::cointoss() && !animscripts\utility::func_9C2E() && animscripts\utility::func_9C2B() && param_00 < 167772.2 && self method_81CB("stand"))
		{
			if(self.var_7.var_6E57 != "stand")
			{
				func_9716("stand");
				return 1;
			}

			if(func_98CE())
			{
				return 1;
			}
		}

		if(func_3590(0))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 16
func_3589(param_00)
{
	if(animscripts\utility::func_9C32() && self.var_7.var_6E57 == "stand" && !isdefined(self.var_39C5))
	{
		if(param_00 > 262144 || self.var_C8 == "ambush_nodes_only" && !isdefined(self.enemy) || !self method_81BE(self.enemy))
		{
			func_907A(animscripts\utility::func_5860("combat","pistol_to_primary"));
		}
	}
}

//Function Number: 17
func_358E()
{
	if(isdefined(self.var_4792) && self method_8163())
	{
		self method_81C7(self.var_2C4,self.node.var_41);
	}
}

//Function Number: 18
func_358D()
{
	if(func_6087())
	{
		var_00 = 0.25;
		if(isdefined(self.var_83F0) && !issentient(self.var_83F0))
		{
			var_00 = 1.5;
		}

		var_01 = animscripts\shared::func_4094(var_00);
		if(func_9935(var_01))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 19
func_358C()
{
	self endon("killanimscript");
	func_830E();
	func_7441(0);
	if(animscripts\utility::func_51AD())
	{
		var_00 = (0,self.var_41[1],0);
		self method_818F("face angle 3d",var_00);
	}
	else
	{
		self method_818F("face angle",self.var_41[1]);
	}

	for(;;)
	{
		if(animscripts\utility::func_9C2E())
		{
			self.var_265F = undefined;
		}

		animscripts\utility::func_9B23();
		if(func_A030())
		{
			continue;
		}

		func_9899();
		func_358E();
		if(!isdefined(self.var_8409))
		{
			func_1AF5();
			continue;
		}

		func_7448();
		var_01 = lengthsquared(self.var_2E6 - self.var_8409);
		if(func_358F(var_01))
		{
			continue;
		}

		if(func_358D())
		{
			continue;
		}

		if(func_2152())
		{
			continue;
		}

		if(func_358A(var_01))
		{
			continue;
		}

		if(animscripts\utility::func_9C2E() && self.var_7.var_6E57 != "crouch" && randomfloat(1) > 0.65)
		{
			self.var_265F = ::func_7666;
		}

		func_3589(var_01);
		if(func_358B(var_01))
		{
			continue;
		}

		if(animscripts\combat_utility::func_976())
		{
			func_8410();
			animscripts\combat_utility::func_4870();
			continue;
		}

		if(isdefined(self.inliveplayerkillstreak))
		{
			lib_A51B::func_2612("thrt_acquired",self.inliveplayerkillstreak == "allies");
		}

		func_3593();
	}
}

//Function Number: 20
func_3593()
{
	if(!isdefined(self.enemy) || !self method_81BE(self.enemy))
	{
		self endon("enemy");
		self endon("shoot_behavior_change");
		wait(0.2 + randomfloat(0.1));
		self waittill("do_slow_things");
		return;
	}

	wait(0.05);
}

//Function Number: 21
func_8B02()
{
	if(isdefined(self.enemy) && !self method_81BE(self.enemy) || !self method_81BD() && sighttracepassed(self.var_2E6 + (0,0,64),self.enemy method_8097(),0,undefined))
	{
		self.var_7.var_2D2E = gettime() + 3000;
		func_9716("stand");
		return 1;
	}

	return 0;
}

//Function Number: 22
func_6087()
{
	var_00 = self.var_8409;
	if(!isdefined(var_00))
	{
		return 0;
	}

	var_01 = self.var_41[1] - vectortoyaw(var_00 - self.var_2E6);
	var_02 = distancesquared(self.var_2E6,var_00);
	if(var_02 < 65536)
	{
		var_03 = sqrt(var_02);
		if(var_03 > 3)
		{
			var_01 = var_01 + asin(-3 / var_03);
		}
	}

	return animscripts\utility::func_6C4(var_01) > self.var_9932;
}

//Function Number: 23
func_A030()
{
	var_00 = self.var_7.var_6E57;
	if(isdefined(self.var_7.var_644E))
	{
		wait(0.1);
		return 1;
	}

	if(var_00 == "stand" && isdefined(self.var_4792))
	{
		return 0;
	}

	if(!self method_81CB(var_00))
	{
		var_01 = "crouch";
		if(var_00 == "crouch")
		{
			var_01 = "stand";
		}

		var_02 = "prone";
		if(var_00 == "prone")
		{
			var_01 = "stand";
			var_02 = "crouch";
		}

		if(self method_81CB(var_01))
		{
			if(var_00 == "stand" && animscripts\utility::func_9C32())
			{
				return 0;
			}

			func_9716(var_01);
			return 1;
		}
		else if(self method_81CB(var_02))
		{
			if(var_00 == "stand" && animscripts\utility::func_9C32())
			{
				return 0;
			}

			func_9716(var_02);
			return 1;
		}
		else
		{
		}
	}

	return 0;
}

//Function Number: 24
func_1AF5()
{
	if(self.var_7.var_6E57 != "stand" && self method_81CB("stand") && func_8B02())
	{
		return 1;
	}

	var_00 = gettime();
	self.var_7.var_2D2E = var_00 + 1500;
	if(isdefined(self.var_4417) && isdefined(self.var_4417.forward))
	{
		var_01 = angleclamp180(self.var_41[1] - vectortoyaw(self.var_4417.forward));
		if(func_9935(var_01))
		{
			return 1;
		}
	}

	if(isdefined(self.node) && isdefined(level.var_50E1[self.node.type]))
	{
		var_01 = angleclamp180(self.var_41[1] - self.node.var_41[1]);
		if(func_9935(var_01))
		{
			return 1;
		}
	}
	else if((isdefined(self.enemy) && self method_81BF(self.enemy,2)) || var_00 > self.var_7.var_7B40 + 1200)
	{
		var_01 = undefined;
		var_02 = self method_8192();
		if(isdefined(var_02))
		{
			var_01 = angleclamp180(self.var_41[1] - var_02[1]);
		}
		else if(isdefined(self.node))
		{
			var_01 = angleclamp180(self.var_41[1] - self.node.var_41[1]);
		}
		else if(isdefined(self.enemy))
		{
			var_02 = vectortoangles(self sentient_lastknownpos(self.enemy) - self.var_2E6);
			var_01 = angleclamp180(self.var_41[1] - var_02[1]);
		}

		if(isdefined(var_01) && func_9935(var_01))
		{
			return 1;
		}
	}
	else if(isdefined(self.var_4792) && self method_8162())
	{
		var_01 = angleclamp180(self.var_41[1] - self.node.var_41[1]);
		if(func_9935(var_01))
		{
			return 1;
		}
	}

	if(func_2152())
	{
		return 1;
	}

	var_03 = self.var_7.var_60C7 < var_00;
	var_04 = 0;
	if(var_03)
	{
		var_04 = 0.99999;
	}

	if(func_3590(var_04))
	{
		return 1;
	}

	if(var_03 && animscripts\utility::func_9C32())
	{
		if(func_907A(animscripts\utility::func_5860("combat","pistol_to_primary")))
		{
			return 1;
		}
	}

	func_1AF6();
	return 1;
}

//Function Number: 25
func_1AF6()
{
	self endon("shoot_behavior_change");
	wait(0.4 + randomfloat(0.4));
	self waittill("do_slow_things");
}

//Function Number: 26
func_7448()
{
	self.var_7.var_60C7 = gettime() + randomintrange(2000,4000);
}

//Function Number: 27
func_9935(param_00)
{
	if(param_00 < 0 - self.var_9932)
	{
		if(self.var_7.var_6E57 == "prone")
		{
			animscripts\cover_prone::func_7028("crouch");
			animscripts\animset::func_7DBF();
		}

		func_2D87("left",0 - param_00);
		lib_A52D::func_2A4C();
		return 1;
	}

	if(param_00 > self.var_9932)
	{
		if(self.var_7.var_6E57 == "prone")
		{
			animscripts\cover_prone::func_7028("crouch");
			animscripts\animset::func_7DBF();
		}

		func_2D87("right",param_00);
		lib_A52D::func_2A4C();
		return 1;
	}

	return 0;
}

//Function Number: 28
func_A24F()
{
	self endon("killanimscript");
	self.var_83F1 = (0,0,0);
	var_00 = undefined;
	var_01 = self.var_2E6;
	var_02 = 0.15;
	for(;;)
	{
		if(isdefined(self.var_83F0) && isdefined(var_00) && self.var_83F0 == var_00)
		{
			var_03 = self.var_83F0.var_2E6;
			self.var_83F1 = var_03 - var_01 * 1 / var_02;
			var_01 = var_03;
		}
		else
		{
			if(isdefined(self.var_83F0))
			{
				var_01 = self.var_83F0.var_2E6;
			}
			else
			{
				var_01 = self.var_2E6;
			}

			var_00 = self.var_83F0;
			self.var_83F1 = (0,0,0);
		}

		wait(var_02);
	}
}

//Function Number: 29
func_84B1()
{
	return 0;
}

//Function Number: 30
func_2D12(param_00)
{
	self endon("killanimscript");
	animscripts\shared::func_2D05(param_00);
}

//Function Number: 31
func_35B8()
{
	self endon("killanimscript");
	self notify("facing_enemy_immediately");
	self endon("facing_enemy_immediately");
	var_00 = 5;
	for(;;)
	{
		var_01 = 0 - animscripts\utility::func_4172();
		if(abs(var_01) < 2)
		{
			break;
		}

		if(abs(var_01) > var_00)
		{
			var_01 = var_00 * common_scripts\utility::sign(var_01);
		}

		self method_818F("face angle",self.var_41[1] + var_01);
		wait(0.05);
	}

	self method_818F("face current");
	self notify("can_stop_turning");
}

//Function Number: 32
func_50ED(param_00)
{
	var_01 = getmovedelta(param_00,0,1);
	var_02 = self localtoworldcoords(var_01);
	return self method_815F(var_02) && self method_81C3(var_02);
}

//Function Number: 33
func_50B5(param_00)
{
	var_01 = getmovedelta(param_00,0,1);
	var_02 = self localtoworldcoords(var_01);
	return self method_815F(var_02);
}

//Function Number: 34
func_2D87(param_00,param_01)
{
	var_02 = isdefined(self.var_8409);
	var_03 = 1;
	var_04 = 0.2;
	var_05 = isdefined(self.enemy) && !isdefined(self.var_9936) && self method_81BF(self.enemy,2) && distancesquared(self.enemy.var_2E6,self.var_2E6) < 262144;
	if(self.var_7.var_7B40 + 500 > gettime())
	{
		var_04 = 0.25;
		if(var_05)
		{
			thread func_35B8();
		}
	}
	else if(var_05)
	{
		var_06 = 1 - distance(self.enemy.var_2E6,self.var_2E6) / 512;
		var_03 = 1 + var_06 * 1;
		if(var_03 > 2)
		{
			var_04 = 0.05;
		}
		else if(var_03 > 1.3)
		{
			var_04 = 0.1;
		}
		else
		{
			var_04 = 0.15;
		}
	}

	var_07 = 0;
	if(param_01 > 157.5)
	{
		var_07 = 180;
	}
	else if(param_01 > 112.5)
	{
		var_07 = 135;
	}
	else if(param_01 > 67.5)
	{
		var_07 = 90;
	}
	else
	{
		var_07 = 45;
	}

	var_08 = "turn_" + param_00 + "_" + var_07;
	var_09 = animscripts\utility::func_C4E(var_08);
	if(isdefined(self.var_9936))
	{
		self method_818E("angle deltas",0);
	}
	else if(isdefined(self.node) && isdefined(level.var_50E0[self.node.type]) && distancesquared(self.var_2E6,self.node.var_2E6) < 256)
	{
		self method_818E("angle deltas",0);
	}
	else if(func_50B5(var_09))
	{
		func_7441();
	}
	else
	{
		self method_818E("angle deltas",0);
	}

	self method_8147(%exposed_aiming,%body,1,var_04);
	if(!isdefined(self.var_9936))
	{
		func_9928(var_04);
	}

	self method_814C(%turn,1,var_04);
	if(isdefined(self.var_4792))
	{
		var_03 = min(1,var_03);
	}
	else if(isdefined(self.var_9936))
	{
		var_03 = max(1.5,var_03);
	}

	self method_810E("turn",var_09,1,var_04,var_03);
	func_2088(var_09,"aim");
	self notify("turning");
	if(var_02 && !isdefined(self.var_9936) && !isdefined(self.var_4792))
	{
		thread func_8416();
	}

	func_2D88();
	self method_814C(%turn,0,0.2);
	if(!isdefined(self.var_9936))
	{
		func_9927(0.2);
	}

	if(!isdefined(self.var_9936))
	{
		self method_8142(%turn,0.2);
		self method_8143(%exposed_aiming,1,0.2,1);
	}
	else
	{
		self method_8142(%exposed_modern,0.3);
	}

	if(isdefined(self.var_9929))
	{
		self.var_9929 = undefined;
		thread func_35B8();
	}

	func_7441(0);
	self notify("done turning");
}

//Function Number: 35
func_2D88()
{
	self endon("can_stop_turning");
	animscripts\shared::func_2D05("turn");
}

//Function Number: 36
func_5946()
{
	self endon("killanimscript");
	self endon("done turning");
	var_00 = self.var_41[1];
	wait(0.3);
	if(self.var_41[1] == var_00)
	{
		self notify("turning_isnt_working");
		self.var_9929 = 1;
	}
}

//Function Number: 37
func_9928(param_00)
{
	self method_814C(animscripts\utility::func_C4E("straight_level"),0,param_00);
	self method_814B(%add_idle,0,param_00);
	if(!animscripts\utility::func_A2C6())
	{
		self method_8142(%add_fire,0.2);
	}
}

//Function Number: 38
func_9927(param_00)
{
	self method_814C(animscripts\utility::func_C4E("straight_level"),1,param_00);
	self method_814B(%add_idle,1,param_00);
}

//Function Number: 39
func_8416()
{
	self endon("killanimscript");
	self endon("done turning");
	if(animscripts\utility::func_9C2E())
	{
		return;
	}

	animscripts\combat_utility::func_8411();
	self method_8142(%add_fire,0.2);
}

//Function Number: 40
func_8410()
{
	thread func_A21E();
	self endon("need_to_turn");
	thread func_52E0();
	animscripts\combat_utility::func_8411();
	self notify("stop_watching_for_need_to_turn");
	self notify("stop_trying_to_melee");
}

//Function Number: 41
func_A21E()
{
	self endon("killanimscript");
	self endon("stop_watching_for_need_to_turn");
	var_00 = gettime() + 4000 + randomint(2000);
	for(;;)
	{
		if(gettime() > var_00 || func_6087())
		{
			self notify("need_to_turn");
			break;
		}

		wait(0.1);
	}
}

//Function Number: 42
func_2152()
{
	if(!animscripts\combat_utility::func_6033())
	{
		return 0;
	}

	if(self.var_1D3 <= 0)
	{
		return 0;
	}

	if(isdefined(level.var_9334) && isalive(level.var_31D))
	{
		if(func_9893(level.var_31D,200))
		{
			return 1;
		}
	}

	if(isdefined(self.enemy) && func_9893(self.enemy,self.var_5C62))
	{
		return 1;
	}

	self.var_7.var_60C9 = gettime() + 500;
	return 0;
}

//Function Number: 43
func_9893(param_00,param_01)
{
	var_02 = 0;
	if(isdefined(self.var_2D33) || isdefined(param_00.var_2D2A))
	{
		return 0;
	}

	if(!isdefined(self.var_7.var_CD8["exposed_grenade"]))
	{
		return 0;
	}

	var_03 = param_00.var_2E6;
	if(!self method_81BE(param_00))
	{
		if(isdefined(self.enemy) && param_00 == self.enemy && isdefined(self.var_8409))
		{
			var_03 = self.var_8409;
		}
	}

	if(!self method_81BE(param_00))
	{
		param_01 = 100;
	}

	if(distancesquared(self.var_2E6,var_03) > param_01 * param_01 && self.var_7.var_6E57 == self.var_7.var_4409)
	{
		animscripts\combat_utility::func_7F0F(param_00);
		if(!animscripts\combat_utility::func_43F8(param_00))
		{
			return 0;
		}

		var_04 = animscripts\utility::func_4174(var_03);
		if(abs(var_04) < 60)
		{
			var_05 = [];
			foreach(var_07 in self.var_7.var_CD8["exposed_grenade"])
			{
				if(func_50ED(var_07))
				{
					var_05[var_05.size] = var_07;
				}
			}

			if(var_05.size > 0)
			{
				self method_814B(%exposed_aiming,0,0.1);
				func_2061();
				self method_818E("zonly_physics");
				animscripts\track::func_7F1B(0,0);
				var_02 = animscripts\combat_utility::func_9895(param_00,var_05[randomint(var_05.size)]);
				self method_814B(%exposed_aiming,1,0.1);
				func_2088(undefined,"aim");
				if(var_02)
				{
					animscripts\track::func_7F1B(1,0.5);
				}
				else
				{
					animscripts\track::func_7F1B(1,0);
				}
			}
		}
	}

	if(var_02)
	{
		lib_A52D::func_2A4C();
	}

	return var_02;
}

//Function Number: 44
func_9716(param_00)
{
	if(param_00 == self.var_7.var_6E57)
	{
		return;
	}

	var_01 = self.var_7.var_6E57 + "_2_" + param_00;
	if(!isdefined(self.var_7.var_CD8))
	{
		return;
	}

	var_02 = self.var_7.var_CD8[var_01];
	if(!isdefined(var_02))
	{
		return;
	}

	self method_8142(%animscript_root,0.3);
	animscripts\combat_utility::func_315D();
	if(param_00 == "stand")
	{
		var_03 = 2;
	}
	else
	{
		var_03 = 1.5;
	}

	if(!animhasnotetrack(var_02,"anim_pose = \" + param_00 + "\"))
	{
	}

	self method_8110("trans",var_02,%body,1,0.2,var_03);
	func_2088(var_02,"run");
	var_04 = function_0063(var_02) / var_03;
	var_05 = var_04 - 0.3;
	if(var_05 < 0.2)
	{
		var_05 = 0.2;
	}

	animscripts\notetracks::func_2D0A(var_05,"trans");
	self.var_7.var_6E57 = param_00;
	func_8049();
	animscripts\combat_utility::func_8D11();
	lib_A52D::func_2A4C();
}

//Function Number: 45
func_52E0()
{
	self endon("killanimscript");
	self endon("stop_trying_to_melee");
	self endon("done turning");
	self endon("need_to_turn");
	self endon("shoot_behavior_change");
	for(;;)
	{
		wait(0.2 + randomfloat(0.3));
		if(isdefined(self.enemy))
		{
			if(isplayer(self.enemy))
			{
				var_00 = 40000;
			}
			else
			{
				var_00 = 10000;
			}

			if(distancesquared(self.enemy.var_2E6,self.var_2E6) < var_00)
			{
				func_9899();
			}
		}
	}
}

//Function Number: 46
func_9899()
{
	animscripts\melee::func_5B78();
}

//Function Number: 47
func_27EC()
{
	if(isdefined(self.var_6148))
	{
		return;
	}

	if(isplayer(self.enemy))
	{
		return;
	}

	animscripts\melee::func_5B6E(self.enemy);
}

//Function Number: 48
func_3590(param_00)
{
	if(animscripts\combat_utility::func_6086(param_00))
	{
		self.var_7.var_3591 = 1;
		animscripts\combat_utility::func_315D();
		var_01 = undefined;
		if(isdefined(self.var_8A2F))
		{
			var_01 = self [[ self.var_8A2F ]]();
			self.var_233 = 1;
		}
		else
		{
			var_01 = animscripts\utility::func_C51("reload");
			if(self.var_7.var_6E57 == "stand" && animscripts\utility::func_C4F("reload_crouchhide") && common_scripts\utility::cointoss())
			{
				var_01 = animscripts\utility::func_C51("reload_crouchhide");
			}
		}

		thread func_52E0();
		self.var_3796 = 0;
		if(weaponclass(self.weapon) == "pistol")
		{
			self method_818F("face default");
		}

		func_2D76(var_01,param_00 > 0.05);
		self notify("abort_reload");
		self method_818F("face current");
		if(self.var_3796)
		{
			animscripts\weaponlist::func_72AE();
		}

		self method_8142(%reload,0.2);
		self.var_233 = 0;
		self notify("stop_trying_to_melee");
		self.var_7.var_3591 = 0;
		self.var_3796 = undefined;
		lib_A52D::func_2A4C();
		animscripts\combat_utility::func_8D11();
		return 1;
	}

	return 0;
}

//Function Number: 49
func_2D76(param_00,param_01)
{
	self endon("abort_reload");
	if(param_01)
	{
		thread func_06C0();
	}

	var_02 = 1;
	if(!animscripts\utility::func_9C32() && !animscripts\utility::func_51A0(self.weapon) && isdefined(self.enemy) && self method_81BE(self.enemy) && distancesquared(self.enemy.var_2E6,self.var_2E6) < 1048576)
	{
		var_02 = 1.2;
	}

	var_03 = "reload_" + animscripts\combat_utility::func_4140();
	self method_8142(%animscript_root,0.2);
	self method_8113(var_03,param_00,1,0.2,var_02);
	func_2088(param_00,"run");
	thread func_622F("abort_reload",var_03);
	self endon("start_aim");
	animscripts\shared::func_2D05(var_03);
	self.var_3796 = 1;
}

//Function Number: 50
func_06C0()
{
	self endon("abort_reload");
	self endon("killanimscript");
	for(;;)
	{
		if(isdefined(self.var_83F0) && self method_81BE(self.var_83F0))
		{
			break;
		}

		wait(0.05);
	}

	self notify("abort_reload");
}

//Function Number: 51
func_622F(param_00,param_01)
{
	self endon(param_00);
	self waittillmatch("start_aim",param_01);
	self.var_3796 = 1;
	self notify("start_aim");
}

//Function Number: 52
func_3797(param_00)
{
	self endon("killanimscript");
	animscripts\shared::func_2D05(param_00);
}

//Function Number: 53
func_2F69()
{
	lib_A54E::func_2F95();
	animscripts\weaponlist::func_72AE();
	self.var_7.var_6081 = 0;
	self notify("dropped_gun");
	lib_A54E::func_74A6();
}

//Function Number: 54
func_33E4()
{
	func_2F69();
}

//Function Number: 55
func_98CE()
{
	if(isdefined(self.secondaryweapon) && animscripts\utility::func_51A0(self.secondaryweapon))
	{
		return 0;
	}

	if(isdefined(self.var_6106))
	{
		return 0;
	}

	self.var_7.var_6E57 = "stand";
	func_907B(animscripts\utility::func_5860("combat","primary_to_pistol"));
	return 1;
}

//Function Number: 56
func_907B(param_00)
{
	self endon("killanimscript");
	thread animscripts\combat_utility::func_7063();
	animscripts\combat_utility::func_315D();
	self.var_9009 = param_00;
	self method_8110("weapon swap",param_00,%body,1,0.2,animscripts\combat_utility::func_3678());
	func_2088(param_00,"run");
	func_2D11("weapon swap",::func_466A,"end_weapon_swap");
	self method_8142(self.var_9009,0.2);
	self notify("facing_enemy_immediately");
	self notify("switched_to_sidearm");
	lib_A52D::func_2A4C();
}

//Function Number: 57
func_2D11(param_00,param_01,param_02)
{
	self endon(param_02);
	animscripts\notetracks::func_2D10(param_00,param_01);
}

//Function Number: 58
func_35B7(param_00)
{
	self endon("killanimscript");
	wait(param_00);
	func_35B8();
}

//Function Number: 59
func_466A(param_00)
{
	if(param_00 == "pistol_pickup")
	{
		self method_8142(animscripts\utility::func_C4E("straight_level"),0);
		animscripts\animset::func_7DCC();
		thread func_35B7(0.25);
		return;
	}

	if(param_00 == "start_aim")
	{
		animscripts\combat_utility::func_8D11();
		if(func_6087())
		{
			self notify("end_weapon_swap");
			return;
		}
	}
}

//Function Number: 60
func_907A(param_00,param_01)
{
	self endon("killanimscript");
	if(animscripts\utility::func_51A0(self.alias) && isdefined(self.var_A14B) && !self.var_A14B && self.var_560C == animscripts\utility::func_3EE3())
	{
		return 0;
	}

	animscripts\combat_utility::func_315D();
	self.var_9009 = param_00;
	self method_8110("weapon swap",param_00,%body,1,0.1,1);
	func_2088(param_00,"run");
	if(isdefined(param_01))
	{
		func_2D11("weapon swap",::func_464B,"end_weapon_swap");
	}
	else
	{
		func_2D11("weapon swap",::func_466F,"end_weapon_swap");
	}

	self method_8142(self.var_9009,0.2);
	self notify("switched_to_lastweapon");
	lib_A52D::func_2A4C();
	return 1;
}

//Function Number: 61
func_466F(param_00)
{
	if(param_00 == "pistol_putaway")
	{
		self method_8142(animscripts\utility::func_C4E("straight_level"),0);
		animscripts\animset::func_7DCC();
		thread animscripts\combat_utility::func_7063();
		return;
	}

	if(param_00 == "start_aim")
	{
		animscripts\combat_utility::func_8D11();
		if(func_6087())
		{
			self notify("end_weapon_swap");
			return;
		}
	}
}

//Function Number: 62
func_464B(param_00)
{
	if(param_00 == "pistol_putaway")
	{
		thread animscripts\combat_utility::func_7063();
		return;
	}

	if(issubstr(param_00,"anim_gunhand"))
	{
		self notify("end_weapon_swap");
	}
}

//Function Number: 63
func_7666()
{
	if(!animscripts\utility::func_9C2E() || self.var_18B0 == 0)
	{
		return 0;
	}

	if(randomfloat(1) > 0.5)
	{
		var_00 = animscripts\utility::func_5860("combat","rpg_death");
	}
	else
	{
		var_00 = animscripts\utility::func_5860("combat","rpg_death_stagger");
	}

	self method_810F("deathanim",var_00,%animscript_root,1,0.05,1);
	func_2088(var_00,"death");
	animscripts\shared::func_2D05("deathanim");
	animscripts\shared::func_2F6B();
}

//Function Number: 64
func_7176()
{
	self endon("killanimscript");
	self.var_7.var_3591 = 0;
	for(;;)
	{
		wait(0.2);
		if(isdefined(self.enemy) && !self method_81BF(self.enemy,2))
		{
			if(self.var_C8 == "ambush" || self.var_C8 == "ambush_nodes_only")
			{
				continue;
			}
		}

		func_9892();
	}
}

//Function Number: 65
func_9892()
{
	if(self.var_180)
	{
		return;
	}

	if(!isdefined(self.enemy))
	{
		self.var_7174 = 0;
		return;
	}

	if(gettime() < self.var_4AD)
	{
		self.var_7174 = 0;
		return;
	}

	if(isdefined(self.var_6F4B) && self.var_6F4B != self.enemy)
	{
		self.var_7174 = 0;
		self.var_6F4B = undefined;
		return;
	}

	self.var_6F4B = self.enemy;
	if(self method_81BE(self.enemy) && self method_81BD())
	{
		self.var_7174 = 0;
		return;
	}

	if(isdefined(self.var_3796) && !self.var_3796)
	{
		self.var_7174 = 0;
		return;
	}

	if(!isdefined(self.var_7175) || !self.var_7175)
	{
		var_00 = vectornormalize(self.enemy.var_2E6 - self.var_2E6);
		var_01 = anglestoforward(self.var_41);
		if(vectordot(var_00,var_01) < 0.5)
		{
			self.var_7174 = 0;
			return;
		}
	}

	if(self.var_7.var_3591 && animscripts\combat_utility::func_6086(0.25) && self.enemy.health > self.enemy.var_275 * 0.5)
	{
		self.var_7174 = 0;
		return;
	}

	if(animscripts\combat_utility::func_8496() && self.var_7174 < 3)
	{
		self.var_7174 = 3;
	}

	switch(self.var_7174)
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		default:
			break;
	}
}

//Function Number: 66
func_7441(param_00)
{
	var_01 = param_00;
	if(!isdefined(var_01))
	{
		var_01 = 1;
	}

	if(self.var_425)
	{
		self method_818E("nogravity",var_01);
		return;
	}

	self method_818E("zonly_physics",var_01);
}

//Function Number: 67
func_2088(param_00,param_01)
{
	self.var_35C5 = animscripts\face::func_6D98(param_00,param_01,self.var_35C5);
}

//Function Number: 68
func_2061()
{
	self.var_35C5 = undefined;
	self method_8142(%head,0.2);
}