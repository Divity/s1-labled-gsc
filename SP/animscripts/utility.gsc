/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: utility.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 157
 * Decompile Time: 5703 ms
 * Timestamp: 4/20/2022 8:20:59 PM
*******************************************************************/

//Function Number: 1
func_4D86(param_00)
{
	self method_8142(%body,0.3);
	self method_814B(%body,1,0);
	if(param_00 != "pain" && param_00 != "death")
	{
		self.var_7.var_8A14 = "none";
	}

	self.var_7.var_97E = 1;
	self.var_7.var_980 = 1;
	self.var_7.var_97F = 1;
	self.var_7.var_982 = 0;
	self.var_7.var_981 = 0;
	func_9B23();
}

//Function Number: 2
func_9AED()
{
	if(isdefined(self.var_28B3) && self.var_28B3 != self.var_7.var_6E57)
	{
		if(self.var_7.var_6E57 == "prone")
		{
			func_3449(0.5);
		}

		if(self.var_28B3 == "prone")
		{
			self method_81FA(-45,45,%prone_legs_down,%exposed_aiming,%prone_legs_up);
			func_3307(0.5);
			self method_8147(func_5860("default_prone","straight_level"),%body,1,0.1,1);
		}
	}

	self.var_28B3 = undefined;
}

//Function Number: 3
func_4DD4(param_00)
{
	if(isdefined(self.var_584B))
	{
		if(param_00 != "pain" && param_00 != "death")
		{
			self method_8052(self.var_2E6);
		}

		if(param_00 != "pain")
		{
			self.var_584B = undefined;
			self notify("kill_long_death");
		}
	}

	if(isdefined(self.var_7.var_5A5C) && param_00 != "death")
	{
		self method_8052(self.var_2E6);
	}

	if(isdefined(self.var_7.var_6E8A))
	{
		var_01 = self.var_7.var_6E8A;
		self.var_7.var_6E8A = undefined;
		[[ var_01 ]](param_00);
	}

	if(param_00 != "combat" && param_00 != "pain" && param_00 != "death" && func_9C32())
	{
		animscripts\combat::func_907A(func_5860("combat","pistol_to_primary"),1);
	}

	if(param_00 != "combat" && param_00 != "move" && param_00 != "pain")
	{
		self.var_7.var_58DB = undefined;
	}

	if(param_00 != "death")
	{
		self.var_7.var_612B = 0;
	}

	if(isdefined(self.var_5118) && param_00 == "pain" || param_00 == "death" || param_00 == "flashed")
	{
		animscripts\combat_utility::func_2F6E();
	}

	self.var_5118 = undefined;
	animscripts\squadmanager::func_9A9(param_00);
	self.var_22BA = undefined;
	self.var_8FDE = 0;
	self.var_5189 = 0;
	self.var_1C86 = 0;
	self.var_7.var_979 = undefined;
	self.var_7.var_7B40 = gettime();
	self.var_7.var_D83 = 0;
	if(isdefined(self.node) && self.node.type == "Conceal Prone" || self.node.type == "Conceal Crouch" || self.node.type == "Conceal Stand")
	{
		self.var_7.var_D83 = 1;
	}

	func_4D86(param_00);
	func_9AED();
}

//Function Number: 4
func_4098()
{
	if(isdefined(self.var_A14B) && self.var_A14B)
	{
		if(func_51A0(self.alias))
		{
			return self.alias;
		}
		else if(func_51A0(self.secondaryweapon))
		{
			return self.secondaryweapon;
		}
	}

	return self.alias;
}

//Function Number: 5
func_1269(param_00,param_01,param_02)
{
	for(var_03 = 0;var_03 < param_00 * 20;var_03++)
	{
		for(var_04 = 0;var_04 < 10;var_04++)
		{
			var_05 = (0,randomint(360),0);
			var_06 = anglestoforward(var_05);
			var_07 = var_06 * param_02;
		}

		wait(0.05);
	}
}

//Function Number: 6
func_6FAC()
{
	self endon("death");
	self notify("displaceprint");
	self endon("displaceprint");
	wait(0.05);
}

//Function Number: 7
func_5121(param_00)
{
	if((!isdefined(param_00) || param_00) && self.var_27 > 1)
	{
		return 1;
	}

	if(isdefined(self.enemy))
	{
		return 1;
	}

	return self.var_7.var_20AA > gettime();
}

//Function Number: 8
func_9B23()
{
	if(isdefined(self.enemy))
	{
		self.var_7.var_20AA = gettime() + level.var_20AE + randomint(level.var_20AF);
	}
}

//Function Number: 9
func_3F7B()
{
	if(isdefined(self.enemy))
	{
		if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
		{
			self.var_7.var_5597 = animscripts\combat_utility::func_3DB0(self.enemy);
		}
		else
		{
			self.var_7.var_5597 = self.enemy method_8097();
		}

		self.var_7.var_559B = gettime();
		return self.var_7.var_5597;
	}

	if(isdefined(self.var_7.var_559B) && isdefined(self.var_7.var_5597) && self.var_7.var_559B + 3000 < gettime())
	{
		return self.var_7.var_5597;
	}

	var_00 = self method_8097();
	var_00 = var_00 + (196 * self.var_25F[0],196 * self.var_25F[1],196 * self.var_25F[2]);
	return var_00;
}

//Function Number: 10
func_4049(param_00)
{
	if(!isdefined(self.var_4792))
	{
		if(func_5158(param_00))
		{
			return param_00.var_41[1] + 90;
		}
		else if(func_515B(param_00))
		{
			return param_00.var_41[1] - 90;
		}
		else if(param_00.type == "Cover Multi")
		{
			if(isdefined(self.var_DA) && isdefined(self.var_DA.state))
			{
				if(self.var_DA.state == "right")
				{
					return param_00.var_41[1] - 90;
				}
				else if(self.var_DA.state == "left")
				{
					return param_00.var_41[1] + 90;
				}
			}
		}
	}

	return param_00.var_41[1];
}

//Function Number: 11
func_404F(param_00)
{
	if(isdefined(self.node))
	{
		var_01 = self.node.var_41[1] - func_416E(param_00);
	}
	else
	{
		var_01 = self.var_41[1] - func_416E(var_01);
	}

	var_01 = angleclamp180(var_01);
	return var_01;
}

//Function Number: 12
func_404E()
{
	var_00 = undefined;
	if(isdefined(self.enemy))
	{
		var_00 = self.enemy.var_2E6;
	}
	else
	{
		if(isdefined(self.node))
		{
			var_01 = anglestoforward(self.node.var_41);
		}
		else
		{
			var_01 = anglestoforward(self.var_41);
		}

		var_01 = var_01 * 150;
		var_00 = self.var_2E6 + var_01;
	}

	if(isdefined(self.node))
	{
		var_02 = self.node.var_41[1] - func_416E(var_00);
	}
	else
	{
		var_02 = self.var_41[1] - func_416E(var_02);
	}

	var_02 = angleclamp180(var_02);
	return var_02;
}

//Function Number: 13
func_4174(param_00)
{
	if(func_51AD())
	{
		var_01 = anglestoforward(self.var_41);
		var_02 = rotatepointaroundvector(var_01,param_00 - self.var_2E6,self.var_41[2] * -1);
		param_00 = var_02 + self.var_2E6;
	}

	var_03 = self.var_41[1] - func_416E(param_00);
	var_03 = angleclamp180(var_03);
	return var_03;
}

//Function Number: 14
func_4172()
{
	var_00 = undefined;
	if(isdefined(self.enemy))
	{
		var_00 = self.enemy.var_2E6;
	}
	else
	{
		var_01 = anglestoforward(self.var_41);
		var_01 = var_01 * 150;
		var_00 = self.var_2E6 + var_01;
	}

	var_02 = self.var_41[1] - func_416E(var_00);
	var_02 = angleclamp180(var_02);
	return var_02;
}

//Function Number: 15
func_416E(param_00)
{
	return vectortoyaw(param_00 - self.var_2E6);
}

//Function Number: 16
func_416F(param_00)
{
	var_01 = vectortoangles((param_00[0],param_00[1],0) - (self.var_2E6[0],self.var_2E6[1],0));
	return var_01[1];
}

//Function Number: 17
func_06C6()
{
	var_00 = self.var_41[1] - func_416E(self.enemy.var_2E6);
	var_00 = angleclamp180(var_00);
	if(var_00 < 0)
	{
		var_00 = -1 * var_00;
	}

	return var_00;
}

//Function Number: 18
func_06C7()
{
	var_00 = self.var_41[1] - func_416F(self.enemy.var_2E6);
	var_00 = angleclamp180(var_00);
	if(var_00 < 0)
	{
		var_00 = -1 * var_00;
	}

	return var_00;
}

//Function Number: 19
func_06C8(param_00)
{
	var_01 = self.var_41[1] - func_416E(param_00);
	var_01 = angleclamp180(var_01);
	if(var_01 < 0)
	{
		var_01 = -1 * var_01;
	}

	return var_01;
}

//Function Number: 20
func_06C5(param_00)
{
	var_01 = self.var_41[1] - param_00;
	var_01 = angleclamp180(var_01);
	if(var_01 < 0)
	{
		var_01 = -1 * var_01;
	}

	return var_01;
}

//Function Number: 21
func_4171(param_00,param_01)
{
	var_02 = vectortoangles(param_00 - param_01);
	return var_02[1];
}

//Function Number: 22
func_4175(param_00,param_01)
{
	var_02 = self gettagangles(param_00)[1] - func_4171(param_01,self gettagorigin(param_00));
	var_02 = angleclamp180(var_02);
	return var_02;
}

//Function Number: 23
func_4173(param_00)
{
	if(isdefined(self.type) && self.type == "Cover Up 3D" || self.type == "Cover Left 3D" || self.type == "Cover Right 3D" || self.type == "Exposed 3D")
	{
		var_01 = func_4139(self);
		var_02 = anglestoforward(var_01);
		var_03 = rotatepointaroundvector(var_02,param_00 - self.var_2E6,var_01[2] * -1);
		var_03 = var_03 + self.var_2E6;
		var_04 = var_01[1] - func_416E(var_03);
		var_04 = angleclamp180(var_04);
		return var_04;
	}

	var_04 = self.var_41[1] - func_416E(var_04);
	var_04 = angleclamp180(var_04);
	return var_04;
}

//Function Number: 24
func_3F8D(param_00)
{
	var_01 = self gettagangles("TAG_EYE")[1] - func_416E(param_00);
	var_01 = angleclamp180(var_01);
	return var_01;
}

//Function Number: 25
func_51B5(param_00)
{
	if(isdefined(self.var_22BA))
	{
		return self.var_22BA doesnodeallowstance(param_00);
	}

	return self method_81CB(param_00);
}

//Function Number: 26
func_1D45(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = self.var_7.var_6E57;
	}

	switch(param_00)
	{
		case "stand":
			break;

		case "crouch":
			break;

		case "prone":
			break;

		default:
			break;
	}
}

//Function Number: 27
func_3F2D()
{
	var_00 = self.node;
	if(isdefined(var_00) && self method_8161(var_00) || isdefined(self.var_22BA) && var_00 == self.var_22BA)
	{
		return var_00;
	}

	return undefined;
}

//Function Number: 28
func_404D()
{
	var_00 = func_3F2D();
	if(isdefined(var_00))
	{
		return var_00.type;
	}

	return "none";
}

//Function Number: 29
func_4046()
{
	var_00 = func_3F2D();
	if(isdefined(var_00))
	{
		return var_00.var_41[1];
	}

	return self.var_117;
}

//Function Number: 30
func_4047()
{
	var_00 = func_3F2D();
	if(isdefined(var_00))
	{
		return anglestoforward(var_00.var_41);
	}

	return anglestoforward(self.var_41);
}

//Function Number: 31
func_404C()
{
	var_00 = func_3F2D();
	if(isdefined(var_00))
	{
		return var_00.var_2E6;
	}

	return self.var_2E6;
}

//Function Number: 32
func_77C8(param_00,param_01)
{
	var_02 = int(param_00) % param_01;
	var_02 = var_02 + param_01;
	return var_02 % param_01;
}

//Function Number: 33
func_06C4(param_00)
{
	return abs(angleclamp180(param_00));
}

//Function Number: 34
func_707F(param_00)
{
	var_01 = cos(param_00);
	var_02 = sin(param_00);
	var_03["front"] = 0;
	var_03["right"] = 0;
	var_03["back"] = 0;
	var_03["left"] = 0;
	if(isdefined(self.var_B0D))
	{
		var_03["front"] = 1;
		return var_03;
	}

	if(var_01 > 0)
	{
		if(var_02 > var_01)
		{
			var_03["left"] = 1;
		}
		else if(var_02 < -1 * var_01)
		{
			var_03["right"] = 1;
		}
		else
		{
			var_03["front"] = 1;
		}
	}
	else
	{
		var_04 = -1 * var_01;
		if(var_02 > var_04)
		{
			var_03["left"] = 1;
		}
		else if(var_02 < var_01)
		{
			var_03["right"] = 1;
		}
		else
		{
			var_03["back"] = 1;
		}
	}

	return var_03;
}

//Function Number: 35
func_409E(param_00)
{
	param_00 = angleclamp360(param_00);
	if(param_00 < 45 || param_00 > 315)
	{
		var_01 = "front";
	}
	else if(var_01 < 135)
	{
		var_01 = "left";
	}
	else if(var_01 < 225)
	{
		var_01 = "back";
	}
	else
	{
		var_01 = "right";
	}

	return var_01;
}

//Function Number: 36
func_5129(param_00,param_01)
{
	for(var_02 = param_01.size - 1;var_02 >= 0;var_02--)
	{
		if(param_00 == param_01[var_02])
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 37
playanim(param_00)
{
	if(isdefined(param_00))
	{
		self method_8110("playAnim",param_00,%animscript_root,1,0.1,1);
		var_01 = function_0063(param_00);
		var_01 = 3 * var_01 + 1;
		thread func_6222("time is up","time is up",var_01);
		self waittill("time is up");
		self notify("enddrawstring");
	}
}

//Function Number: 38
func_6222(param_00,param_01,param_02)
{
	self endon("death");
	self endon(param_01);
	wait(param_02);
	self notify(param_00);
}

//Function Number: 39
func_2DE4(param_00)
{
	self endon("killanimscript");
	self endon("enddrawstring");
	wait(0.05);
}

//Function Number: 40
func_2DE5(param_00,param_01,param_02,param_03)
{
	var_04 = param_03 * 20;
	for(var_05 = 0;var_05 < var_04;var_05++)
	{
		wait(0.05);
	}
}

//Function Number: 41
func_8512(param_00)
{
	self notify("got known enemy2");
	self endon("got known enemy2");
	self endon("death");
	if(!isdefined(self.enemy))
	{
		return;
	}

	if(self.enemy.inliveplayerkillstreak == "allies")
	{
		var_01 = (0.4,0.7,1);
	}
	else
	{
		var_01 = (1,0.7,0.4);
	}

	for(;;)
	{
		wait(0.05);
		if(!isdefined(self.var_24B))
		{
			continue;
		}
	}
}

//Function Number: 42
func_4729()
{
	if(isdefined(self.node))
	{
		return func_1AE2() || func_1AF0();
	}

	return func_1AE1() || func_1AEF();
}

//Function Number: 43
func_3F7C()
{
	return self.var_4276;
}

//Function Number: 44
func_9C36()
{
	if(!func_4729())
	{
		return;
	}

	self.var_4BB7 = func_3F7C();
	self.var_4BB3 = self.var_2E6;
}

//Function Number: 45
func_9C35()
{
	if(!func_4729())
	{
		return 0;
	}

	var_00 = self method_81B8();
	var_01 = self method_8097() - var_00;
	if(isdefined(self.var_4BB7) && isdefined(self.var_4BB3))
	{
		if(distance(self.var_2E6,self.var_4BB3) < 25)
		{
			return 0;
		}
	}

	self.var_4BB7 = undefined;
	var_02 = self method_81BC(func_3F7C(),var_01);
	if(!var_02)
	{
		self.var_4BB7 = func_3F7C();
		return 0;
	}

	return 1;
}

//Function Number: 46
func_2739()
{
	wait(5);
	self notify("timeout");
}

//Function Number: 47
func_272E(param_00,param_01,param_02)
{
	self endon("death");
	self notify("stop debug " + param_00);
	self endon("stop debug " + param_00);
	var_03 = spawnstruct();
	var_03 thread func_2739();
	var_03 endon("timeout");
	if(self.enemy.inliveplayerkillstreak == "allies")
	{
		var_04 = (0.4,0.7,1);
	}
	else
	{
		var_04 = (1,0.7,0.4);
	}

	wait(0.05);
}

//Function Number: 48
func_272D(param_00,param_01)
{
	thread func_272E(param_00,param_01,2.15);
}

//Function Number: 49
func_272F(param_00,param_01,param_02)
{
	thread func_272E(param_00,param_01,param_02);
}

//Function Number: 50
func_271C(param_00,param_01)
{
	var_02 = param_00 / param_01;
	var_03 = undefined;
	if(param_00 == self.var_18B0)
	{
		var_03 = "all rounds";
	}
	else if(var_02 < 0.25)
	{
		var_03 = "small burst";
	}
	else if(var_02 < 0.5)
	{
		var_03 = "med burst";
	}
	else
	{
		var_03 = "long burst";
	}

	thread func_272F(self.var_2E6 + (0,0,42),var_03,1.5);
	thread func_272D(self.var_2E6 + (0,0,60),"Suppressing");
}

//Function Number: 51
func_6FB6()
{
	self endon("death");
	self notify("stop shoot " + self.var_3582);
	self endon("stop shoot " + self.var_3582);
	var_00 = 0.25;
	var_01 = var_00 * 20;
	for(var_02 = 0;var_02 < var_01;var_02 = var_02 + 1)
	{
		wait(0.05);
	}
}

//Function Number: 52
func_6FB5()
{
}

//Function Number: 53
func_84FE(param_00,param_01,param_02,param_03)
{
	self endon("death");
	var_04 = param_03 * 20;
	for(var_05 = 0;var_05 < var_04;var_05 = var_05 + 1)
	{
		wait(0.05);
	}
}

//Function Number: 54
func_84FD(param_00,param_01,param_02,param_03)
{
	thread func_84FE(param_00,param_01 + (0,0,-5),param_02,param_03);
}

//Function Number: 55
func_83EC(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	[[ level.var_83ED ]](param_00);
}

//Function Number: 56
func_83EE(param_00)
{
	self.var_7.var_55D4 = gettime();
	lib_A52D::func_7DA9();
	self notify("shooting");
	self method_81E7(1,undefined,param_00);
}

//Function Number: 57
func_83EF(param_00)
{
	level notify("an_enemy_shot",self);
	func_83EE(param_00);
}

//Function Number: 58
func_840C(param_00,param_01)
{
	var_02 = function_001D(self method_81B8(),param_00,4);
	self.var_7.var_55D4 = gettime();
	if(!isdefined(param_01))
	{
		param_01 = 1;
	}

	self notify("shooting");
	self method_81E7(1,var_02,param_01);
}

//Function Number: 59
func_9336()
{
	var_00 = spawn("script_model",(0,0,0));
	var_00 setmodel("temp");
	var_00.var_2E6 = self gettagorigin("tag_weapon_right") + (50,50,0);
	var_00.var_41 = self gettagangles("tag_weapon_right");
	var_01 = anglestoright(var_00.var_41);
	var_01 = var_01 * 15;
	var_02 = anglestoforward(var_00.var_41);
	var_02 = var_02 * 15;
	var_00 gravitymove((0,50,150),100);
	var_03 = "weapon_" + self.weapon;
	var_04 = spawn(var_03,var_00.var_2E6);
	var_04.var_41 = self gettagangles("tag_weapon_right");
	var_04 linkto(var_00);
	var_05 = var_00.var_2E6;
	while(isdefined(var_04) && isdefined(var_04.var_2E6))
	{
		var_06 = var_05;
		var_07 = var_00.var_2E6;
		var_08 = vectortoangles(var_07 - var_06);
		var_02 = anglestoforward(var_08);
		var_02 = var_02 * 4;
		var_09 = bullettrace(var_07,var_07 + var_02,1,var_04);
		if(isalive(var_09["entity"]) && var_09["entity"] == self)
		{
			wait(0.05);
			continue;
		}

		if(var_09["fraction"] < 1)
		{
			break;
		}

		var_05 = var_00.var_2E6;
		wait(0.05);
	}

	if(isdefined(var_04) && isdefined(var_04.var_2E6))
	{
		var_04 unlink();
	}

	var_00 delete();
}

//Function Number: 60
func_67D9()
{
	var_00 = "TAG_EYE";
	self endon("death");
	self notify("stop personal effect");
	self endon("stop personal effect");
	while(isdefined(self))
	{
		wait(0.05);
		if(!isdefined(self))
		{
			break;
		}

		if(isdefined(self.var_7.var_5F58) && self.var_7.var_5F58 == "stop")
		{
			if(isdefined(self.var_5123) && self.var_5123 == 1)
			{
				continue;
			}

			playfxontag(level._effect["cold_breath"],self,var_00);
			wait(2.5 + randomfloat(3));
			continue;
		}

		wait(0.5);
	}
}

//Function Number: 61
func_67DB()
{
	self notify("stop personal effect");
}

//Function Number: 62
func_67DA()
{
	self endon("death");
	self notify("stop personal effect");
	self endon("stop personal effect");
	for(;;)
	{
		self waittill("spawned",var_00);
		if(lib_A59A::func_88EB(var_00))
		{
			continue;
		}

		var_00 thread func_67D9();
	}
}

//Function Number: 63
func_51C0()
{
	if(isdefined(self.var_39CB))
	{
		return self.var_39CB;
	}

	if(self.var_41F <= self.var_8FE6)
	{
		return 0;
	}

	return self method_81CD();
}

//Function Number: 64
func_51AD()
{
	return isdefined(self.var_425) && self.var_425 == 1 && isdefined(self.var_3D8) && self.var_3D8 == 1;
}

//Function Number: 65
func_4139(param_00)
{
	if(!isdefined(param_00))
	{
		return (0,0,0);
	}

	if(!isdefined(param_00.script_angles))
	{
		return param_00.var_41;
	}

	var_01 = param_00.var_41;
	var_02 = angleclamp180(var_01[0] + param_00.script_angles[0]);
	var_03 = var_01[1];
	var_04 = angleclamp180(var_01[2] + param_00.script_angles[2]);
	return (var_02,var_03,var_04);
}

//Function Number: 66
func_516B()
{
	if(self.var_41F <= self.var_8FE6 * 0.25)
	{
		return 0;
	}

	return self method_81CD();
}

//Function Number: 67
func_404B(param_00,param_01)
{
	if(isdefined(param_00.var_6376))
	{
		return param_00.var_6376;
	}

	var_02 = (-26,0.4,36);
	var_03 = (-32,7,63);
	var_04 = (43.5,11,36);
	var_05 = (36,8.3,63);
	var_06 = (3.5,-12.5,45);
	var_07 = (-3.7,-22,63);
	var_08 = 0;
	var_09 = (0,0,0);
	var_0A = anglestoright(param_00.var_41);
	var_0B = anglestoforward(param_00.var_41);
	if(!isdefined(param_01))
	{
		param_01 = param_00.type;
		if(param_01 == "Cover Multi")
		{
			param_01 = func_3F3D(param_00);
		}
	}

	switch(param_01)
	{
		case "Cover Left":
		case "Cover Left 3D":
			break;

		case "Cover Right":
		case "Cover Right 3D":
			break;

		case "Turret":
		case "Cover Stand":
		case "Conceal Stand":
			break;

		case "Cover Crouch Window":
		case "Cover Crouch":
		case "Conceal Crouch":
			break;
	}
}

//Function Number: 68
func_19E3(param_00,param_01,param_02)
{
	return param_00 * param_02[0] + param_01 * param_02[1] + (0,0,param_02[2]);
}

//Function Number: 69
func_725F()
{
	return isdefined(self.enemy) && self method_81BF(self.enemy,5);
}

//Function Number: 70
func_1AE1(param_00)
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		if(isdefined(self.var_329F) && self.var_329F == self.enemy)
		{
			return 1;
		}
		else
		{
			return self method_81BE(self.enemy);
		}
	}

	if((isdefined(param_00) && self method_81BE(self.enemy,param_00)) || self method_81BE(self.enemy))
	{
		if(!func_1D15(self geteye(),self.enemy method_8097()))
		{
			return 0;
		}

		self.var_4276 = func_3F7B();
		func_2D36();
		return 1;
	}

	return 0;
}

//Function Number: 71
func_1AE2()
{
	if(!isdefined(self.enemy))
	{
		self.var_4276 = undefined;
		return 0;
	}

	var_00 = func_3F7B();
	if(!isdefined(self.node))
	{
		var_01 = self method_81BE(self.enemy);
	}
	else
	{
		var_01 = func_1AE5(var_01,self.node);
	}

	if(var_01)
	{
		self.var_4276 = var_00;
		func_2D36();
	}
	else
	{
	}

	return var_01;
}

//Function Number: 72
func_1AE5(param_00,param_01)
{
	if(func_5158(param_01) || func_515B(param_01) || func_5159(param_01))
	{
		if(!animscripts\corner::func_1AE4(param_00,param_01))
		{
			return 0;
		}
	}

	var_02 = func_404B(param_01);
	var_03 = param_01.var_2E6 + var_02;
	if(!func_1D15(var_03,param_00,param_01))
	{
		return 0;
	}

	if(!sighttracepassed(var_03,param_00,0,undefined))
	{
		if(param_01.type == "Cover Crouch" || param_01.type == "Conceal Crouch")
		{
			var_03 = (0,0,64) + param_01.var_2E6;
			return sighttracepassed(var_03,param_00,0,undefined);
		}

		if(func_51AD() && param_01.type == "Cover Up 3D")
		{
			var_04 = anglestoup(self.var_41);
			var_03 = param_01.var_2E6 + (var_04[0] * 32,var_04[1] * 32,var_04[2] * 32);
			return sighttracepassed(var_03,param_00,0,undefined);
		}

		return 0;
	}

	return 1;
}

//Function Number: 73
func_5159(param_00)
{
	if(param_00.type != "Cover Multi")
	{
		return 0;
	}

	if(!isdefined(self.var_DA))
	{
		return 0;
	}

	if(isdefined(self.var_DA.state))
	{
		return self.var_DA.state == "right" || self.var_DA.state == "left";
	}

	if(isdefined(self.var_DA.var_D25))
	{
		return self.var_DA.var_D25 == "right" || self.var_DA.var_D25 == "left";
	}

	return 0;
}

//Function Number: 74
func_3F3D(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = param_00 animscripts\cover_multi::func_22B2();
	}

	switch(param_01)
	{
		case "right":
			break;

		case "left":
			break;

		case "stand":
			break;

		case "crouch":
			break;

		default:
			break;
	}
}

//Function Number: 75
func_1D15(param_00,param_01,param_02)
{
	var_03 = self.var_134 - level.var_97B;
	var_04 = self.var_4E0 + level.var_97B;
	var_05 = angleclamp180(vectortoangles(param_01 - param_00)[0]);
	if(var_05 > var_04)
	{
		return 0;
	}

	if(var_05 < var_03)
	{
		if(isdefined(param_02) && param_02.type != "Cover Crouch" && param_02.type != "Conceal Crouch")
		{
			return 0;
		}

		if(var_05 < level.var_22A1 + var_03)
		{
			return 0;
		}
	}

	return 1;
}

//Function Number: 76
func_2D36()
{
	self.var_7.var_84A0 = 1;
}

//Function Number: 77
func_9B1B()
{
	if(!isdefined(self.var_7.var_84A0))
	{
		self.var_7.var_84A0 = 1;
	}

	if(self.var_7.var_84A0)
	{
		self.var_7.var_420B = gettime() + randomintrange(15000,30000);
		self.var_7.var_84A0 = 0;
	}
}

//Function Number: 78
func_8514(param_00,param_01,param_02)
{
	for(;;)
	{
		wait(0.05);
		wait(0.05);
	}
}

//Function Number: 79
func_09A5()
{
	if(!self method_819C())
	{
		return 0;
	}

	var_00 = undefined;
	if(isdefined(self.enemy.node))
	{
		var_01 = func_404B(self.enemy.node);
		var_00 = self.enemy.node.var_2E6 + var_01;
	}
	else if(common_scripts\utility::flag("_cloaked_stealth_enabled"))
	{
		var_00 = animscripts\combat_utility::func_3DB0(self.enemy);
	}
	else
	{
		var_00 = self.enemy method_8097();
	}

	if(!self method_81BC(var_00))
	{
		return 0;
	}

	if(self.script == "combat")
	{
		if(!sighttracepassed(self geteye(),self method_81B8(),0,undefined))
		{
			return 0;
		}
	}

	self.var_4276 = var_00;
	return 1;
}

//Function Number: 80
func_1AF0()
{
	if(!func_4745())
	{
		self.var_4276 = undefined;
		return 0;
	}

	if(!isplayer(self.enemy))
	{
		return func_09A5();
	}

	if(isdefined(self.node))
	{
		if(func_5158(self.node) || func_515B(self.node))
		{
			if(!animscripts\corner::func_1AE4(func_3F7B(),self.node))
			{
				return 0;
			}
		}

		var_00 = func_404B(self.node);
		var_01 = self.node.var_2E6 + var_00;
	}
	else
	{
		var_01 = self method_81B8();
	}

	if(!func_1D15(var_01,self.var_24B))
	{
		return 0;
	}

	return func_377E(var_01);
}

//Function Number: 81
func_1AEF()
{
	if(!func_4745())
	{
		self.var_4276 = undefined;
		return 0;
	}

	if(!isplayer(self.enemy))
	{
		return func_09A5();
	}

	var_00 = self method_81B8();
	if(!func_1D15(var_00,self.var_24B))
	{
		return 0;
	}

	return func_377E(var_00);
}

//Function Number: 82
func_4745()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}

	if(!isdefined(self.var_24B))
	{
		return 0;
	}

	func_9B1B();
	if(gettime() > self.var_7.var_420B)
	{
		return 0;
	}

	if(!func_607B())
	{
		return isdefined(self.var_4276);
	}

	return 1;
}

//Function Number: 83
func_1AE0(param_00)
{
	if(!sighttracepassed(self method_8097(),param_00,0,undefined))
	{
		return 0;
	}

	if(self.var_7.var_A2D9["right"] == "none")
	{
		return 0;
	}

	var_01 = self method_81B8();
	return sighttracepassed(var_01,param_00,0,undefined);
}

//Function Number: 84
func_607B()
{
	if(isdefined(self.var_4276) && !func_1AE0(self.var_4276))
	{
		return 1;
	}

	return !isdefined(self.var_5598) || self.var_5598 != self.var_24B || distancesquared(self.var_5599,self.var_2E6) > 1024;
}

//Function Number: 85
func_377E(param_00)
{
	if(!func_607B())
	{
		return isdefined(self.var_4276);
	}

	if(isdefined(self.enemy) && distancesquared(self.var_2E6,self.enemy.var_2E6) > squared(self.enemy.var_279))
	{
		self.var_4276 = undefined;
		return 0;
	}

	if(!sighttracepassed(self method_8097(),param_00,0,undefined))
	{
		self.var_4276 = undefined;
		return 0;
	}

	self.var_5599 = self.var_2E6;
	self.var_5598 = self.var_24B;
	var_01 = func_3F7B();
	var_02 = bullettrace(self.var_24B,var_01,0,undefined);
	var_03 = var_02["position"];
	var_04 = self.var_24B - var_03;
	var_05 = vectornormalize(self.var_24B - param_00);
	var_04 = var_04 - var_05 * vectordot(var_04,var_05);
	var_06 = 20;
	var_07 = int(length(var_04) / var_06 + 0.5);
	if(var_07 < 1)
	{
		var_07 = 1;
	}

	if(var_07 > 20)
	{
		var_07 = 20;
	}

	var_08 = self.var_24B - var_03;
	var_08 = (var_08[0] / var_07,var_08[1] / var_07,var_08[2] / var_07);
	var_07++;
	var_09 = var_03;
	self.var_4276 = undefined;
	var_0A = 0;
	var_0B = 2;
	for(var_0C = 0;var_0C < var_07 + var_0B;var_0C++)
	{
		var_0D = sighttracepassed(param_00,var_09,0,undefined);
		var_0E = var_09;
		if(var_0C == var_07 - 1)
		{
			var_08 = var_08 - var_05 * vectordot(var_08,var_05);
		}

		var_09 = var_09 + var_08;
		if(var_0D)
		{
			var_0A++;
			self.var_4276 = var_0E;
			if(var_0C > 0 && var_0A < var_0B && var_0C < var_07 + var_0B - 1)
			{
				continue;
			}

			return 1;
		}
		else
		{
			var_0A = 0;
		}
	}

	return isdefined(self.var_4276);
}

//Function Number: 86
func_0BAA(param_00,param_01)
{
	var_02 = param_00.size;
	var_03 = randomint(var_02);
	if(var_02 == 1)
	{
		return param_00[0];
	}

	var_04 = 0;
	var_05 = 0;
	for(var_06 = 0;var_06 < var_02;var_06++)
	{
		var_05 = var_05 + param_01[var_06];
	}

	var_07 = randomfloat(var_05);
	var_08 = 0;
	for(var_06 = 0;var_06 < var_02;var_06++)
	{
		var_08 = var_08 + param_01[var_06];
		if(var_07 >= var_08)
		{
			continue;
		}

		var_03 = var_06;
		break;
	}

	return param_00[var_03];
}

//Function Number: 87
func_6FA4(param_00,param_01,param_02,param_03,param_04,param_05)
{
	var_06 = param_00 / 0.05;
	for(var_07 = 0;var_07 < var_06;var_07++)
	{
		wait(0.05);
	}
}

//Function Number: 88
func_6FA2(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = 100;
	var_06 = 0;
	param_00 = param_00 + common_scripts\utility::randomvector(30);
	for(var_07 = 0;var_07 < var_05;var_07++)
	{
		var_06 = var_06 + 0.5;
		wait(0.05);
	}
}

//Function Number: 89
func_247B(param_00,param_01)
{
	return param_00[0] * param_01[1] - param_00[1] * param_01[0] > 0;
}

//Function Number: 90
func_3FAE()
{
	return getweaponmodel(self.var_1D6);
}

//Function Number: 91
func_781F(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 500;
	}

	return gettime() - self.var_67E1 < param_00;
}

//Function Number: 92
func_1AF3()
{
	if(!self.var_1D3)
	{
		return 0;
	}

	if(self.var_79E5)
	{
		return 1;
	}

	return isplayer(self.enemy);
}

//Function Number: 93
func_9C25()
{
	return weaponisboltaction(self.weapon);
}

//Function Number: 94
func_7118(param_00)
{
	var_01 = randomint(param_00.size);
	if(param_00.size > 1)
	{
		var_02 = 0;
		for(var_03 = 0;var_03 < param_00.size;var_03++)
		{
			var_02 = var_02 + param_00[var_03];
		}

		var_04 = randomfloat(var_02);
		var_02 = 0;
		for(var_03 = 0;var_03 < param_00.size;var_03++)
		{
			var_02 = var_02 + param_00[var_03];
			if(var_04 < var_02)
			{
				var_01 = var_03;
				break;
			}
		}
	}

	return var_01;
}

//Function Number: 95
func_7F6E(param_00,param_01)
{
	if(!isdefined(level.var_6546))
	{
		anim.var_6546 = [];
	}

	level.var_6546[param_00] = 1;
	level._effect["step_" + param_00] = param_01;
}

//Function Number: 96
func_7F6F(param_00,param_01)
{
	if(!isdefined(level.var_6548))
	{
		anim.var_6548 = [];
	}

	level.var_6548[param_00] = 1;
	level._effect["step_small_" + param_00] = param_01;
}

//Function Number: 97
func_9A69(param_00)
{
	if(isdefined(level.var_6546))
	{
		level.var_6546[param_00] = undefined;
	}

	level._effect["step_" + param_00] = undefined;
}

//Function Number: 98
func_9A6A(param_00)
{
	if(isdefined(level.var_6548))
	{
		level.var_6548[param_00] = undefined;
	}

	level._effect["step_small_" + param_00] = undefined;
}

//Function Number: 99
func_7FB9(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(!isdefined(param_02))
	{
		param_02 = "all";
	}

	if(!isdefined(level.var_601))
	{
		level.var_601 = [];
	}

	level.var_601[param_00][param_02] = spawnstruct();
	level.var_601[param_00][param_02].tag = param_01;
	level.var_601[param_00][param_02].fx = param_03;
	level.var_61E2[param_00] = ::animscripts\notetracks::func_2565;
	func_7FBA(param_00,param_02,param_04,param_05);
}

//Function Number: 100
func_7FBA(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_01))
	{
		param_01 = "all";
	}

	if(!isdefined(level.var_601))
	{
		level.var_601 = [];
	}

	if(isdefined(level.var_601[param_00][param_01]))
	{
		var_04 = level.var_601[param_00][param_01];
	}
	else
	{
		var_04 = spawnstruct();
		level.var_601[param_00][param_01] = var_04;
	}

	level.var_61E2[param_00] = ::animscripts\notetracks::func_2565;
	if(isdefined(param_02))
	{
		var_04.var_889E = param_02;
	}

	if(isdefined(param_03))
	{
		var_04.var_88A0 = param_03;
	}
}

//Function Number: 101
func_67D8(param_00,param_01)
{
	self endon("death");
	level notify("newdebugline");
	level endon("newdebugline");
	wait(0.05);
}

//Function Number: 102
func_3307(param_00)
{
	thread func_3308(param_00);
}

//Function Number: 103
func_3308(param_00)
{
	self endon("death");
	self notify("anim_prone_change");
	self endon("anim_prone_change");
	self method_81F8(param_00,isdefined(self.var_7.var_644E));
	self waittill("killanimscript");
	if(self.var_7.var_6E57 != "prone" && !isdefined(self.var_7.var_644E))
	{
		self.var_7.var_6E57 = "prone";
	}
}

//Function Number: 104
func_3449(param_00)
{
	thread func_344A(param_00);
}

//Function Number: 105
func_344A(param_00)
{
	self endon("death");
	self notify("anim_prone_change");
	self endon("anim_prone_change");
	self method_81F9(param_00);
	self waittill("killanimscript");
	if(self.var_7.var_6E57 == "prone")
	{
		self.var_7.var_6E57 = "crouch";
	}
}

//Function Number: 106
func_1AAF()
{
	if(self.var_7.var_D83)
	{
		return 0;
	}

	if(!animscripts\weaponlist::func_9C24())
	{
		return 0;
	}

	if(weaponclass(self.weapon) == "mg")
	{
		return 0;
	}

	if(isdefined(self.var_2A7D) && self.var_2A7D == 1)
	{
		return 0;
	}

	return 1;
}

//Function Number: 107
func_1AC9()
{
	if(!func_4729())
	{
		return 0;
	}

	var_00 = self method_81B8();
	return sighttracepassed(var_00,func_3F7C(),0,undefined);
}

//Function Number: 108
func_402B(param_00)
{
	return self.var_7.var_5F40[param_00];
}

//Function Number: 109
func_711B(param_00,param_01)
{
	if(randomint(2))
	{
		return param_00;
	}

	return param_01;
}

//Function Number: 110
func_0C4E(param_00)
{
	return self.var_7.var_CD8[param_00];
}

//Function Number: 111
func_0C4F(param_00)
{
	return isdefined(self.var_7.var_CD8[param_00]) && self.var_7.var_CD8[param_00].size > 0;
}

//Function Number: 112
func_0C51(param_00)
{
	var_01 = randomint(self.var_7.var_CD8[param_00].size);
	return self.var_7.var_CD8[param_00][var_01];
}

//Function Number: 113
func_0CD8(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C,param_0D)
{
	var_0E = [];
	if(isdefined(param_00))
	{
		var_0E[0] = param_00;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_01))
	{
		var_0E[1] = param_01;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_02))
	{
		var_0E[2] = param_02;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_03))
	{
		var_0E[3] = param_03;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_04))
	{
		var_0E[4] = param_04;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_05))
	{
		var_0E[5] = param_05;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_06))
	{
		var_0E[6] = param_06;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_07))
	{
		var_0E[7] = param_07;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_08))
	{
		var_0E[8] = param_08;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_09))
	{
		var_0E[9] = param_09;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_0A))
	{
		var_0E[10] = param_0A;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_0B))
	{
		var_0E[11] = param_0B;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_0C))
	{
		var_0E[12] = param_0C;
	}
	else
	{
		return var_0E;
	}

	if(isdefined(param_0D))
	{
		var_0E[13] = param_0D;
	}

	return var_0E;
}

//Function Number: 114
func_3EE3()
{
	return self.alias;
}

//Function Number: 115
func_3EE5()
{
	return self.secondaryweapon;
}

//Function Number: 116
func_3EE6()
{
	return self.var_8557;
}

//Function Number: 117
func_3EDE()
{
	return self.weapon;
}

//Function Number: 118
func_9C2B()
{
	return self.weapon == self.alias && self.weapon != "none";
}

//Function Number: 119
func_9C2F()
{
	return self.weapon == self.secondaryweapon && self.weapon != "none";
}

//Function Number: 120
func_9C32()
{
	return self.weapon == self.var_8557 && self.weapon != "none";
}

//Function Number: 121
func_3EDF()
{
	if(self.weapon == self.alias)
	{
		return "primary";
	}

	if(self.weapon == self.secondaryweapon)
	{
		return "secondary";
	}

	if(self.weapon == self.var_8557)
	{
		return "sidearm";
	}
}

//Function Number: 122
func_095B(param_00)
{
	if(isdefined(self.energyturret[param_00]))
	{
		return 1;
	}

	return 0;
}

//Function Number: 123
func_3EFA(param_00)
{
	var_01 = getmovedelta(param_00,0,1);
	return self localtoworldcoords(var_01);
}

//Function Number: 124
func_25A5(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(self.var_FE == param_00)
	{
		return 1;
	}

	if(!isdefined(param_01))
	{
		return 0;
	}

	if(self.var_FE == param_01)
	{
		return 1;
	}

	if(!isdefined(param_02))
	{
		return 0;
	}

	if(self.var_FE == param_02)
	{
		return 1;
	}

	if(!isdefined(param_03))
	{
		return 0;
	}

	if(self.var_FE == param_03)
	{
		return 1;
	}

	if(!isdefined(param_04))
	{
		return 0;
	}

	if(self.var_FE == param_04)
	{
		return 1;
	}

	if(!isdefined(param_05))
	{
		return 0;
	}

	if(self.var_FE == param_05)
	{
		return 1;
	}

	if(!isdefined(param_06))
	{
		return 0;
	}

	if(self.var_FE == param_06)
	{
		return 1;
	}

	if(!isdefined(param_07))
	{
		return 0;
	}

	if(self.var_FE == param_07)
	{
		return 1;
	}

	if(!isdefined(param_08))
	{
		return 0;
	}

	if(self.var_FE == param_08)
	{
		return 1;
	}

	if(!isdefined(param_09))
	{
		return 0;
	}

	if(self.var_FE == param_09)
	{
		return 1;
	}

	if(!isdefined(param_0A))
	{
		return 0;
	}

	if(self.var_FE == param_0A)
	{
		return 1;
	}

	return 0;
}

//Function Number: 125
func_9C29()
{
	if(!isdefined(self.weapon))
	{
		return 0;
	}

	return weaponclass(self.weapon) == "pistol";
}

//Function Number: 126
func_9C2E()
{
	if(!isdefined(self.weapon))
	{
		return 0;
	}

	return weaponclass(self.weapon) == "rocketlauncher";
}

//Function Number: 127
func_9C26()
{
	if(!isdefined(self.weapon))
	{
		return 0;
	}

	return weaponclass(self.weapon) == "mg";
}

//Function Number: 128
func_9C31()
{
	if(!isdefined(self.weapon))
	{
		return 0;
	}

	return weaponclass(self.weapon) == "spread";
}

//Function Number: 129
func_9C33()
{
	if(!isdefined(self.weapon))
	{
		return 0;
	}

	return weaponclass(self.weapon) == "smg";
}

//Function Number: 130
func_9C2D()
{
	if(!isdefined(self.weapon))
	{
		return 0;
	}

	var_00 = weaponclass(self.weapon);
	switch(var_00)
	{
		case "rifle":
		case "sniper":
		case "smg":
		case "spread":
		case "mg":
			break;
	}
}

//Function Number: 131
func_848F(param_00)
{
	return isdefined(self.secondaryweapon) && self.secondaryweapon != "none" && param_00 < squared(512) || self.var_7.rockets < 1;
}

//Function Number: 132
func_70DB(param_00)
{
	self endon("killanimscript");
	var_01 = self.var_2E6;
	var_02 = (0,0,0);
	for(;;)
	{
		wait(0.05);
		var_03 = distance(self.var_2E6,var_01);
		var_01 = self.var_2E6;
		if(self.health == 1)
		{
			self.var_7.var_612B = 1;
			self startragdoll();
			self method_8142(param_00,0.1);
			wait(0.05);
			physicsexplosionsphere(var_01,600,0,var_03 * 0.1);
			self notify("killanimscript");
			return;
		}
	}
}

//Function Number: 133
func_5029()
{
	return isdefined(self.var_3A14);
}

//Function Number: 134
func_8485()
{
	return isdefined(self.var_22E0) && !isdefined(self.grenade);
}

//Function Number: 135
func_50E6()
{
	return isdefined(self.var_22E0);
}

//Function Number: 136
func_8038(param_00)
{
	if(param_00)
	{
		self.var_2562["run"] = func_5861("unstable_run");
		self.var_2562["walk"] = func_5861("unstable_walk");
		self.var_51DB = 1;
		return;
	}

	self.var_2562["run"] = undefined;
	self.var_2562["walk"] = undefined;
	self.var_51DB = 0;
}

//Function Number: 137
func_51DB()
{
	return isdefined(self.var_51DB);
}

//Function Number: 138
func_7F1A(param_00)
{
	if(!isdefined(param_00))
	{
		return;
	}

	if(param_00)
	{
		self.var_2562["run"] = func_5861("pistol_move");
		self.var_2562["walk"] = func_5861("pistol_move");
		self.var_B0F = 1;
		self method_81CA("stand");
		self.var_6106 = 1;
		self.var_2D3A = 1;
		self.var_2AF6 = 1;
		return;
	}

	self.var_2562["run"] = undefined;
	self.var_2562["walk"] = undefined;
	self.var_B0F = undefined;
	self method_81CA("stand","crouch","prone");
	self.var_6106 = undefined;
	self.var_2D3A = undefined;
	self.var_2AF6 = undefined;
}

//Function Number: 139
func_50E7()
{
	return !self.var_178 || isdefined(self.var_22E0);
}

//Function Number: 140
func_7126()
{
	self.var_7.var_4B7E = randomint(2);
}

//Function Number: 141
func_51A0(param_00)
{
	return weaponclass(param_00) == "spread";
}

//Function Number: 142
func_51A9(param_00)
{
	return weaponclass(param_00) == "sniper";
}

//Function Number: 143
func_A2C6()
{
	return self.weapon != "none" && weaponisboltaction(self.weapon) && weaponclass(self.weapon) == "spread";
}

//Function Number: 144
func_40A4(param_00,param_01)
{
	var_02 = param_00 % level.var_7122;
	return level.var_7121[var_02] % param_01;
}

//Function Number: 145
func_3F45()
{
	if(func_9C2F())
	{
		return "secondary";
	}

	if(func_9C32())
	{
		return "sidearm";
	}

	return "primary";
}

//Function Number: 146
func_5158(param_00)
{
	return param_00.type == "Cover Left" || param_00.type == "Cover Left 3D";
}

//Function Number: 147
func_515B(param_00)
{
	return param_00.type == "Cover Right" || param_00.type == "Cover Right 3D";
}

//Function Number: 148
func_5157(param_00)
{
	return param_00.type == "Cover Left 3D" || param_00.type == "Cover Right 3D" || param_00.type == "Cover Up 3D";
}

//Function Number: 149
func_5860(param_00,param_01)
{
	if(isdefined(level.var_39B0) || isdefined(level.var_39B1))
	{
		lib_A59A::func_30EC(1);
	}

	if(isdefined(self.var_C4D))
	{
		if(isdefined(level.var_CCA[self.var_C4D][param_00]) && isdefined(level.var_CCA[self.var_C4D][param_00][param_01]))
		{
			return level.var_CCA[self.var_C4D][param_00][param_01];
		}
	}

	return level.var_CCA["soldier"][param_00][param_01];
}

//Function Number: 150
func_5861(param_00)
{
	if(isdefined(level.var_39B0) || isdefined(level.var_39B1))
	{
		lib_A59A::func_30EC(1);
	}

	if(isdefined(self.var_C4D))
	{
		if(isdefined(level.var_CCA[self.var_C4D][param_00]))
		{
			if(isdefined(level.var_CCA["soldier"][param_00]))
			{
				var_01 = level.var_CCA["soldier"][param_00];
				foreach(var_04, var_03 in level.var_CCA[self.var_C4D][param_00])
				{
					var_01[var_04] = var_03;
				}

				return var_01;
			}

			return level.var_CCA[self.var_C4D][var_04];
		}
	}

	return level.var_CCA["soldier"][var_04];
}

//Function Number: 151
func_5865(param_00,param_01,param_02)
{
	if(isdefined(self.var_C4D))
	{
		if(isdefined(level.var_CCA[self.var_C4D][param_00]) && isdefined(level.var_CCA[self.var_C4D][param_00][param_01]) && isdefined(level.var_CCA[self.var_C4D][param_00][param_01][param_02]))
		{
			return level.var_CCA[self.var_C4D][param_00][param_01][param_02];
		}

		if(isdefined(level.var_CCA[self.var_C4D][param_00]) && isdefined(level.var_CCA[self.var_C4D][param_00][param_01]))
		{
			return level.var_CCA[self.var_C4D][param_00][param_01];
		}
	}

	return level.var_CCA["soldier"][param_00][param_01][param_02];
}

//Function Number: 152
func_5864(param_00,param_01)
{
	if(isdefined(self.var_C4D))
	{
		if(isdefined(level.var_CCA[self.var_C4D][param_00]) && isdefined(level.var_CCA[self.var_C4D][param_00][param_01]))
		{
			return level.var_CCA[self.var_C4D][param_00][param_01];
		}
	}

	return level.var_CCA["dog"][param_00][param_01];
}

//Function Number: 153
func_50F1()
{
	if(isdefined(self.var_7.var_665C) && isdefined(self.var_7.var_664E))
	{
		var_00 = self.var_7.var_665C + self.var_7.var_664E * 1000;
		var_01 = gettime() < var_00;
		if(!var_01)
		{
			self.var_7.var_664E = 0;
		}

		return var_01;
	}

	return 0;
}

//Function Number: 154
func_3E9E(param_00,param_01,param_02,param_03)
{
	return param_00 + param_01 * param_03 + 0.5 * param_02 * squared(param_03);
}

//Function Number: 155
func_3E9C(param_00,param_01,param_02,param_03)
{
	if(param_03 == 0)
	{
		if(param_02 == 0)
		{
			return 999999;
		}

		return param_01 - param_00 / param_02;
	}

	var_04 = 0.5 * param_03;
	var_05 = param_02;
	var_06 = param_00 - param_01;
	var_07 = squared(var_05) - 4 * var_04 * var_06;
	if(var_07 < 0)
	{
		return 999999;
	}

	var_08 = -1 * var_05 - sqrt(var_07) / 2 * var_04;
	if(var_08 >= 0)
	{
		return var_08;
	}

	var_08 = -1 * var_05 + sqrt(var_07) / 2 * var_04;
	return var_08;
}

//Function Number: 156
func_3E9D(param_00,param_01,param_02,param_03)
{
	var_04 = func_3E9C(param_00,param_01,param_02,param_03);
	var_05 = param_02 + param_03 * var_04;
	return var_05;
}

//Function Number: 157
func_3966(param_00,param_01)
{
	if(!isdefined(param_00) || param_01 == "")
	{
		return;
	}

	if(!isdefined(param_00.var_54C8))
	{
		param_00.var_54C8 = 1;
	}
	else
	{
		return;
	}

	if(param_00 method_8442("tag_flash") == -1)
	{
		param_00.var_54C8 = undefined;
		return;
	}

	var_02 = spawn("script_model",param_00 gettagorigin("tag_flash"));
	if(!isdefined(var_02))
	{
		param_00.var_54C8 = undefined;
		return;
	}

	var_02 setmodel("tag_laser");
	var_02 method_80B2(param_01);
	var_03 = cos(10);
	var_04 = 0.5;
	for(;;)
	{
		if(!isdefined(param_00) || !isalive(param_00))
		{
			break;
		}

		if(isdefined(param_00.enemy))
		{
			var_02.var_2E6 = param_00 gettagorigin("tag_flash");
			var_05 = param_00 gettagangles("tag_flash");
			var_06 = vectornormalize(param_00.enemy method_8097() - var_02.var_2E6);
			var_07 = anglestoforward(var_05);
			var_08 = vectornormalize(var_06);
			var_09 = vectortoangles(var_08);
			var_0A = vectordot(var_07,var_08);
			if(var_0A > var_03)
			{
				var_02 method_80B2(param_01);
				var_0B = vectortoangles(var_06) + (randomfloatrange(-1 * var_04,var_04),randomfloatrange(-1 * var_04,var_04),randomfloatrange(-1 * var_04,var_04));
				var_02.var_41 = vectorlerp(var_02.var_41,var_0B,0.15);
			}
			else
			{
				var_02 method_80B3();
			}
		}

		wait 0.05;
	}

	var_02 method_80B3();
	var_02 delete();
	if(isdefined(param_00))
	{
		param_00.var_54C8 = undefined;
	}
}