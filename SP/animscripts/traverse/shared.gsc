/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: shared.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 20
 * Decompile Time: 1000 ms
 * Timestamp: 4/20/2022 8:19:50 PM
*******************************************************************/

//Function Number: 1
func_087F(param_00,param_01)
{
	self.var_28B3 = "crouch";
	animscripts\utility::func_9AED();
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	var_02 = self getnegotiationstartnode();
	self method_818F("face angle",var_02.var_41[1]);
	var_02.var_9723 = var_02.var_2E6[2] + var_02.var_9724;
	var_03 = var_02.var_9723 - var_02.var_2E6[2];
	thread func_9257(var_03 - param_01);
	var_04 = 0.15;
	self method_8142(%body,var_04);
	self method_8110("traverse",param_00,%animscript_root,1,var_04,1);
	var_05 = 0.2;
	var_06 = 0.2;
	thread animscripts\notetracks::func_2D06("traverse","no clear");
	if(!animhasnotetrack(param_00,"gravity on"))
	{
		var_07 = 1.23;
		wait(var_07 - var_05);
		self method_818D("gravity");
		wait(var_05);
		return;
	}

	self waittillmatch("gravity on","traverse");
	self method_818D("gravity");
	if(!animhasnotetrack(param_00,"blend"))
	{
		wait(var_05);
		return;
	}

	self waittillmatch("blend","traverse");
}

//Function Number: 2
func_9257(param_00)
{
	self endon("killanimscript");
	self notify("endTeleportThread");
	self endon("endTeleportThread");
	var_01 = 5;
	var_02 = (0,0,param_00 / var_01);
	for(var_03 = 0;var_03 < var_01;var_03++)
	{
		self method_81C6(self.var_2E6 + var_02);
		wait(0.05);
	}
}

//Function Number: 3
func_9258(param_00,param_01,param_02,param_03)
{
	self endon("killanimscript");
	self notify("endTeleportThread");
	self endon("endTeleportThread");
	if(param_00 >= 0 || param_02 <= 0)
	{
		return;
	}

	if(param_01 > 0)
	{
		wait(param_01);
	}

	var_04 = (0,0,param_00 / param_02);
	if(isdefined(param_03) && param_03 < 1)
	{
		self method_810F("traverseAnim",self.var_972E,self.var_972F,1,0.2,param_03);
	}

	for(var_05 = 0;var_05 < param_02;var_05++)
	{
		self method_81C6(self.var_2E6 + var_04);
		wait(0.05);
	}

	if(isdefined(param_03) && param_03 < 1)
	{
		self method_810F("traverseAnim",self.var_972E,self.var_972F,1,0.2,1);
	}
}

//Function Number: 4
func_2D85(param_00)
{
	self endon("killanimscript");
	setdvarifuninitialized("scr_traverse_debug",0);
	self.var_51D7 = 1;
	self.var_28B3 = "stand";
	animscripts\utility::func_9AED();
	var_01 = self getnegotiationstartnode();
	if(isdefined(var_01.var_9724))
	{
		var_01.var_9723 = var_01.var_2E6[2] + var_01.var_9724;
	}
	else
	{
		var_01.var_9723 = var_01.var_2E6[2];
	}

	var_02 = self getnegotiationendnode();
	self method_818F("face angle",var_01.var_41[1]);
	self.var_9736 = param_00["traverseHeight"];
	self.var_9738 = var_01;
	var_03 = param_00["traverseAnim"];
	var_04 = param_00["traverseToCoverAnim"];
	self method_818D("nogravity");
	self method_818D("noclip");
	self.var_9739 = self.var_2E6[2];
	var_05 = 0;
	if(isdefined(var_04) && isdefined(self.node) && self.node.type == param_00["coverType"] && distancesquared(self.node.var_2E6,var_02.var_2E6) < 625)
	{
		if(animscripts\utility::func_6C4(self.node.var_41[1] - var_02.var_41[1]) > 160)
		{
			var_05 = 1;
			var_03 = var_04;
		}
	}

	if(var_05)
	{
		if(isdefined(param_00["traverseToCoverSound"]))
		{
			thread lib_A59A::play_sound_on_entity(param_00["traverseToCoverSound"]);
		}
	}
	else if(isdefined(param_00["traverseSound"]))
	{
		thread lib_A59A::play_sound_on_entity(param_00["traverseSound"]);
	}

	self.var_972E = var_03;
	if(!animhasnotetrack(var_03,"traverse_align"))
	{
		func_4680();
	}

	if(isdefined(param_00["traverseBodyNode"]))
	{
		self.var_972F = param_00["traverseBodyNode"];
	}
	else
	{
		self.var_972F = %body;
	}

	self method_8110("traverseAnim",var_03,self.var_972F,1,0.2,1);
	var_06 = ::func_4683;
	if(isdefined(param_00["traverseNotetrackFunc"]))
	{
		var_06 = param_00["traverseNotetrackFunc"];
	}

	self.var_9733 = 0;
	self.var_9732 = param_00["interruptDeathAnim"];
	animscripts\shared::func_2D05("traverseAnim",var_06);
	self method_818D("gravity");
	if(self.var_113)
	{
		return;
	}

	self.var_7.var_612B = 0;
	if(var_05 && isdefined(self.node) && distancesquared(self.var_2E6,self.node.var_2E6) < 256)
	{
		self.var_7.var_5F58 = "stop";
		self method_81C5(self.node.var_2E6);
	}
	else if(isdefined(param_00["traverseStopsAtEnd"]))
	{
		self.var_7.var_5F58 = "stop";
	}
	else
	{
		self.var_7.var_5F58 = "run";
		self method_8142(var_03,0.2);
	}

	self notify("traverse_finish");
	self.var_972F = undefined;
	self.var_972E = undefined;
	self.var_2651 = undefined;
	self.var_9738 = undefined;
	self.var_51D7 = undefined;
}

//Function Number: 5
func_4683(param_00)
{
	if(param_00 == "traverse_death")
	{
		return func_4681();
	}

	if(param_00 == "traverse_align")
	{
		return func_4680();
	}

	if(param_00 == "traverse_drop")
	{
		return func_4682();
	}
}

//Function Number: 6
func_4681()
{
	if(isdefined(self.var_9732))
	{
		var_00 = self.var_9732[self.var_9733];
		self.var_2651 = var_00[randomint(var_00.size)];
		self.var_9733++;
	}
}

//Function Number: 7
func_4680()
{
	self method_818D("nogravity");
	self method_818D("noclip");
	if(isdefined(self.var_9736) && isdefined(self.var_9738.var_9723))
	{
		var_00 = self.var_9738.var_9723 - self.var_9739;
		thread func_9257(var_00 - self.var_9736);
	}
}

//Function Number: 8
func_4682()
{
	var_00 = self.var_2E6 + (0,0,32);
	var_01 = self method_814F(self.var_972E);
	var_02 = function_0063(self.var_972E);
	var_03 = var_01 * var_02;
	var_04 = 0;
	var_05 = 0;
	var_06 = 0;
	var_07 = undefined;
	var_08 = 1;
	var_09 = getnotetracktimes(self.var_972E,"land");
	if(var_09.size > 0)
	{
		var_0A = func_403B(var_01,var_09);
		var_08 = var_0A;
		var_0B = getmovedelta(self.var_972E,var_01,var_0A);
		var_0C = (0,self.var_41[1],0);
		var_0B = rotatevector(var_0B,var_0C);
		var_07 = self.var_2E6 + var_0B;
		var_04 = 0 - var_0B[2];
		var_0B = (var_0B[0],var_0B[1],0);
		var_00 = var_00 + var_0B;
		var_05 = var_0A - var_01 * var_02;
	}
	else
	{
		var_0D = getmovedelta(self.var_972E,var_02,1);
		var_0C = (0,self.var_41[1],0);
		var_0D = rotatevector(var_0D,var_0C);
		var_04 = 0 - var_0D[2];
		var_07 = self.var_2E6 + var_0D;
		var_0E = var_02 - var_03;
		var_05 = var_0E / 3;
	}

	var_0F = physicstrace(var_00,var_00 + (0,0,-768));
	var_10 = distance(var_00,var_0F);
	var_11 = var_10 - 32 - 0.5;
	var_12 = var_04 - var_11;
	if(var_04 < var_11)
	{
		var_13 = var_04 / var_11;
	}
	else
	{
		var_13 = 1;
	}

	var_06 = ceil(var_05 * 20);
	thread func_9258(var_12,0,var_06,var_13);
	thread func_379A(var_0F[2],var_05,var_09.size,var_12);
}

//Function Number: 9
func_403B(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_01.size - 1;var_02++)
	{
		for(var_03 = var_02 + 1;var_03 < param_01.size;var_03++)
		{
			if(param_01[var_03] < param_01[var_02])
			{
				var_04 = param_01[var_03];
				param_01[var_03] = param_01[var_02];
				param_01[var_02] = var_04;
			}
		}
	}

	for(var_02 = 0;var_02 < param_01.size;var_02++)
	{
		if(param_01[var_02] > param_00)
		{
			return param_01[var_02];
		}
	}

	return param_01[param_01.size - 1];
}

//Function Number: 10
func_379A(param_00,param_01,param_02,param_03)
{
	self endon("killanimscript");
	if(param_02 > 0)
	{
		var_04 = param_01;
		if(param_03 > 0)
		{
			var_04 = var_04 - 0.1;
		}

		if(var_04 < 0)
		{
			var_04 = 0;
		}

		wait(var_04);
		self method_818D("gravity");
		return;
	}

	param_00 = param_00 + 4;
	for(;;)
	{
		if(self.var_2E6[2] < param_00)
		{
			self method_818D("gravity");
			break;
		}

		wait(0.05);
	}
}

//Function Number: 11
func_2D14()
{
	self method_818E("zonly_physics");
	self waittill("killanimscript");
}

//Function Number: 12
func_2D8C(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	self endon("killanimscript");
	var_07 = 1;
	if(isdefined(self.var_5F62))
	{
		var_07 = self.var_5F62;
	}

	var_08 = self getnegotiationstartnode();
	var_09 = self.var_2E6;
	if(isdefined(param_00))
	{
		var_0A = getmovedelta(param_00,0,1);
		var_09 = func_96E8(var_0A,var_08.var_2E6,var_08.var_41);
	}

	var_0B = self getnegotiationendnode();
	var_0C = var_0B.var_2E6;
	if(isdefined(param_02))
	{
		var_0D = getmovedelta(param_02,0,1);
		var_0C = func_96E8(var_0D * -1,var_0B.var_2E6,var_0B.var_41);
		var_0C = var_0C + (0,0,1);
	}

	var_0E = getmovedelta(param_01,0,1);
	var_0F = length(var_0E) * var_07 / function_0063(param_01);
	var_10 = length(var_0C - var_09) / var_0F;
	if(var_10 <= 0)
	{
		return;
	}

	self.var_51D7 = 1;
	self.var_28B3 = "crouch";
	animscripts\utility::func_9AED();
	if(isdefined(param_03))
	{
		self method_818D(param_03);
	}
	else
	{
		self method_818D("noclip");
	}

	self.var_34 = 1;
	if(isdefined(param_06))
	{
		var_11 = param_06;
	}
	else
	{
		var_11 = %body;
	}

	self method_818F("face angle",var_08.var_41[1]);
	if(isdefined(param_00))
	{
		self method_8110("traversal",param_00,var_11,1,0.1,var_07);
		animscripts\shared::func_2D05("traversal");
	}

	self method_8110("traversal",param_01,var_11,1,0.1,var_07);
	animscripts\notetracks::func_2D0A(var_10,"traversal");
	if(isdefined(param_02))
	{
		self method_8110("traversal",param_02,var_11,1,0.1,var_07);
		animscripts\shared::func_2D05("traversal");
	}

	self method_818D("gravity");
	if(isdefined(param_04))
	{
		self.var_7.var_6E57 = param_04;
	}

	if(isdefined(param_05))
	{
		self.var_7.var_5F58 = param_05;
	}

	self.var_51D7 = undefined;
}

//Function Number: 13
func_96E8(param_00,param_01,param_02)
{
	var_03 = length(param_00);
	var_04 = vectortoangles(param_00);
	var_05 = combineangles(param_02,var_04);
	var_06 = anglestoforward(var_05);
	return param_01 + var_06 * var_03;
}

//Function Number: 14
func_2CA2(param_00)
{
	var_01 = undefined;
	var_02 = 0;
	var_03 = 0;
	if(param_00 == "traverse_jump_start")
	{
		var_02 = 1;
		var_04 = getnotetracktimes(self.var_972E,"traverse_align");
		if(var_04.size > 0)
		{
			var_01 = var_04;
		}
		else
		{
			var_01 = getnotetracktimes(self.var_972E,"traverse_jump_end");
			var_03 = 1;
		}
	}
	else if(param_00 == "gravity on")
	{
		var_02 = 1;
		var_01 = getnotetracktimes(self.var_972E,"traverse_jump_end");
		var_03 = 1;
	}

	if(var_02)
	{
		var_05 = getnotetracktimes(self.var_972E,param_00);
		var_06 = var_05[0];
		var_07 = getmovedelta(self.var_972E,0,var_05[0]);
		var_08 = var_07[2];
		var_07 = getmovedelta(self.var_972E,0,var_01[0]);
		var_09 = var_07[2];
		var_0A = var_01[0];
		var_0B = function_0063(self.var_972E);
		var_0C = int(var_0A - var_06 * var_0B * 30);
		var_0D = max(1,var_0C - 2);
		var_0E = var_09 - var_08;
		if(var_03)
		{
			var_07 = getmovedelta(self.var_972E,0,1);
			var_0F = var_07[2] - var_09;
			var_10 = self.var_9734.var_2E6[2] - self.var_2E6[2] - var_0F;
		}
		else
		{
			var_11 = self.var_9738;
			var_10 = var_11.var_9724 - self.var_2E6[2] - var_11.var_2E6[2];
		}

		thread func_9258(var_10 - var_0E,0,var_0D);
		return 1;
	}
}

//Function Number: 15
func_2CB8()
{
	self waittill("killanimscript");
	self.var_9738 = undefined;
	self.var_9734 = undefined;
}

//Function Number: 16
func_2CBC(param_00,param_01,param_02)
{
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	thread func_2CB8();
	var_03 = self getnegotiationstartnode();
	self method_818F("face angle",var_03.var_41[1]);
	if(!isdefined(param_02))
	{
		var_04 = var_03.var_9723 - var_03.var_2E6[2];
		thread func_9257(var_04 - param_01);
	}

	self.var_972E = level.dogtraverseanims[param_00];
	self.var_9738 = var_03;
	self.var_9734 = self getnegotiationendnode();
	self method_8142(%body,0.2);
	self method_8113("dog_traverse",self.var_972E,1,0.2,1);
	self.var_5F41 = "land";
	animscripts\notetracks::func_2D0F("dog_traverse",::func_2CA2);
	self.var_5F41 = undefined;
	self.var_972E = undefined;
}

//Function Number: 17
func_2CA7(param_00,param_01,param_02,param_03)
{
	self endon("killanimscript");
	self method_818D("noclip");
	thread func_2CB8();
	var_04 = self getnegotiationstartnode();
	var_05 = self getnegotiationendnode();
	self method_818F("face angle",var_04.var_41[1]);
	if(!isdefined(param_02))
	{
		param_02 = "jump_down_40";
	}

	self.var_972E = level.dogtraverseanims[param_02];
	self.var_972F = %body;
	self.var_9738 = var_04;
	self.var_9734 = var_05;
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!param_03)
	{
		var_06 = var_04.var_2E6[2] - var_05.var_2E6[2];
		thread func_9258(40 - var_06,0.1,param_00,param_01);
	}

	self.var_5F41 = "land";
	self method_8142(%body,0.2);
	self method_8113("traverseAnim",self.var_972E,1,0.2,1);
	if(!param_03)
	{
		animscripts\shared::func_2D05("traverseAnim");
	}
	else
	{
		animscripts\notetracks::func_2D0F("traverseAnim",::func_2CA2);
	}

	self.var_5F41 = undefined;
	self method_818D("gravity");
	self.var_972F = undefined;
	self.var_972E = undefined;
}

//Function Number: 18
func_2CA8(param_00,param_01,param_02,param_03)
{
	self endon("killanimscript");
	self method_818D("noclip");
	thread func_2CB8();
	var_04 = self getnegotiationstartnode();
	self method_818F("face angle",var_04.var_41[1]);
	if(!isdefined(param_02))
	{
		param_02 = "jump_up_40";
	}

	self.var_972E = level.dogtraverseanims[param_02];
	self.var_972F = %body;
	self.var_9738 = var_04;
	self.var_9734 = self getnegotiationendnode();
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	if(!param_03)
	{
		thread func_9258(param_00 - 40,0.2,param_01);
	}

	self.var_5F41 = "land";
	self method_8142(%body,0.2);
	self method_8113("traverseAnim",self.var_972E,1,0.2,1);
	if(!param_03)
	{
		animscripts\shared::func_2D05("traverseAnim");
	}
	else
	{
		animscripts\notetracks::func_2D0F("traverseAnim",::func_2CA2);
	}

	self.var_5F41 = undefined;
	self method_818D("gravity");
	self.var_972E = undefined;
	self.var_972F = undefined;
}

//Function Number: 19
func_2CAA(param_00,param_01)
{
	self endon("killanimscript");
	self method_818D("nogravity");
	self method_818D("noclip");
	thread func_2CB8();
	var_02 = self getnegotiationstartnode();
	self method_818F("face angle",var_02.var_41[1]);
	if(!isdefined(var_02.var_9723))
	{
		var_02.var_9723 = var_02.var_2E6[2];
	}

	var_03 = var_02.var_9723 - var_02.var_2E6[2];
	thread func_9257(var_03 - param_01);
	self.var_5F41 = "land";
	self method_8142(%body,0.2);
	self method_8110("dog_traverse",level.dogtraverseanims[param_00],1,0.2,1);
	animscripts\shared::func_2D05("dog_traverse");
	self.var_5F41 = undefined;
}

//Function Number: 20
func_4039()
{
	var_00 = (0,0,0);
	var_01 = (0,0,0);
	if(isdefined(self.var_5A77) && self.var_5A77)
	{
		var_01 = self gettagorigin("j2_ball_ri");
		var_00 = self gettagorigin("j2_ball_le");
	}
	else
	{
		var_01 = self gettagorigin("j_ball_ri");
		var_00 = self gettagorigin("j_ball_le");
	}

	if(!isdefined(var_01) || !isdefined(var_00))
	{
		return "none";
	}

	if(var_00[2] > var_01[2])
	{
		return "Left";
	}

	return "Right";
}