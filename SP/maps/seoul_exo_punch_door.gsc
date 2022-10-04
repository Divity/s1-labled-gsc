/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: seoul_exo_punch_door.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 11
 * Decompile Time: 496 ms
 * Timestamp: 4/20/2022 8:21:42 PM
*******************************************************************/

//Function Number: 1
func_3481()
{
	function_00D3("r_hudoutlineenable",1);
	function_00D3("r_hudoutlinewidth",1);
	function_00D3("r_hudoutlinepostmode",4);
	function_00D3("r_hudoutlinecloaklumscale",0.5);
	function_00D3("r_hudoutlineAlpha0",1);
	function_00D3("r_hudoutlineAlpha1",0);
	function_00D3("r_hudoutlinecloakblurradius",0.45);
	function_00D3("r_hudoutlinecloakDarkenscale",1);
	function_00D3("r_hudoutlinecloaklumscale",1);
	function_00D3("r_hudoutlinehaloblurradius",1);
	function_00D3("r_hudoutlinehalodarkenscale",1);
	function_00D3("r_hudoutlinehaloLumscale",1);
	var_00 = getentarray("door_exo_punch_intact","targetname");
	var_01 = getentarray("door_exo_punch_broken","targetname");
	var_02 = getentarray("exo_punch_door_trigger","targetname");
	var_03 = getentarray("exo_punch_door_clip","targetname");
	var_04 = getentarray("exo_punch_door_usetrigger","targetname");
	foreach(var_06 in var_00)
	{
		var_06.trig = common_scripts\utility::getclosest(var_06.var_2E6,var_02,100);
		var_06.var_1819 = common_scripts\utility::getclosest(var_06.var_2E6,var_01,50);
		var_06.var_1F96 = common_scripts\utility::getclosest(var_06.var_2E6,var_03,100);
		var_06.usetrig = common_scripts\utility::getclosest(var_06.var_2E6,var_04,100);
		var_06 thread func_5D83();
		var_06 thread func_34BE();
		if(isdefined(var_06.usetrig))
		{
			var_06.usetrig sethintstring("Press [R3] to Melee");
		}
	}

	level.var_31D thread func_5DB2();
}

//Function Number: 2
func_5DB2()
{
	self endon("death");
	for(;;)
	{
		var_00 = self getcurrentweapon();
		if(var_00 != "none" && isdefined(var_00))
		{
			self.var_63BE = var_00;
		}

		wait 0.05;
	}
}

//Function Number: 3
func_34BE()
{
	self endon("exo_door_punched");
	thread func_3484();
	for(;;)
	{
		if(distance(self.var_2E6,level.var_31D.var_2E6) < 350)
		{
			if(!function_00A3(self))
			{
				function_009A(self);
				function_00A6(self,level.var_31D);
			}

			if(function_00A3(self) && function_009F(self,level.var_31D,65,120))
			{
				self hudoutlineenable(6,1);
			}
			else
			{
				self hudoutlinedisable();
			}
		}
		else if(function_00A3(self))
		{
			function_009B(self);
		}

		wait 0.05;
	}
}

//Function Number: 4
func_3484()
{
	self waittill("exo_door_punched");
	self hudoutlinedisable();
}

//Function Number: 5
func_5D83()
{
	self.var_1819 hide();
	self.var_1F96 disconnectpaths();
	level waittill("exo_breach_begin");
	var_00 = func_3F47();
	var_01 = func_3F48();
	self.usetrig sethintstring(" ");
	level.var_31D switchtoweaponimmediate(level.var_31D.var_63BE);
	self notify("exo_door_punched");
	self.var_2A6C = var_00;
	self.var_54A2 = var_01;
	self.var_659D = self.var_2E6;
	thread func_3485();
	wait(0.45);
	var_02 = self.var_1819;
	var_02 show();
	self hide();
	self.var_2E6 = self.var_2E6 - (0,0,10000);
	self.var_1F96.var_2E6 = self.var_1F96.var_2E6 - (0,0,10000);
	self.var_1F96 connectpaths();
}

//Function Number: 6
func_3F47()
{
	var_00 = common_scripts\utility::getstruct("struct_exo_punch_vector_a","targetname");
	var_01 = common_scripts\utility::getstruct("struct_exo_punch_vector_b","targetname");
	return var_01.var_2E6 - var_00.var_2E6;
}

//Function Number: 7
func_3F48()
{
	var_00 = common_scripts\utility::getstruct("struct_exo_punch_vector_a","targetname");
	return var_00.var_2E6;
}

//Function Number: 8
func_3485()
{
	level.var_31D notify("exo_door_punched");
	var_00 = self.var_1819;
	var_00.animname = "exo_breach_door";
	var_00 lib_A506::func_7F23();
	var_00 lib_A506::func_C24(var_00,"exo_punch_breach");
}

//Function Number: 9
func_5D82(param_00)
{
	var_01 = param_00.var_1819;
	self endon("death");
	var_01 endon("physics_finished");
	while(distance(self.var_2E6,var_01.var_2E6) > 80)
	{
		wait 0.05;
	}

	var_02 = vectornormalize(self gettagorigin("tag_eye") - param_00.var_659D);
	var_02 = vectornormalize(var_02 + (randomfloat(0.5),randomfloat(0.5),randomfloat(0.5)));
	self method_8024("torso_lower",var_02 * randomintrange(2400,2800));
	thread common_scripts\utility::delaycall(2,::method_8052);
}

//Function Number: 10
func_5D84(param_00)
{
	var_01 = param_00.var_1819;
	self endon("death");
	var_01 endon("physics_finished");
	while(distance(self.var_2E6,var_01.var_2E6) > 200)
	{
		wait 0.05;
	}

	lib_A59A::func_38A9(randomfloatrange(1,4));
}

//Function Number: 11
func_3013()
{
	level.var_78A9["generic"]["exo_punch_react_1"] = %corner_standr_flinchb;
	level.var_78A9["generic"]["exo_punch_react_2"] = %corner_standr_flinch;
	level.var_78A9["generic"]["exo_punch_react_3"] = %exposed_crouch_pain_flinch;
	level.var_78A9["generic"]["exo_punch_react_4"] = %ny_harbor_bulkhead_door_breach_stunned_guy2;
	level.var_2D4F = ["exo_punch_react_1","exo_punch_react_2","exo_punch_react_3","exo_punch_react_4"];
}