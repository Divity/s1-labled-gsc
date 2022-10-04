/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42345.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 17
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A569::func_7036(param_00,param_01)
{
	if(!isdefined(level.var_7037))
	{
		level.var_7037 = [];
	}

	if(!isdefined(level.var_7037[param_00]))
	{
		level.var_7037[param_00] = [];
	}

	if(isdefined(level.var_7037[param_00][param_01]))
	{
		return 1;
	}

	level.var_7037[param_00][param_01] = 1;
	return 0;
}

//Function Number: 2
lib_A569::func_0796(param_00)
{
	if(lib_A569::func_7036(param_00,"add_smoking_notetracks"))
	{
		return;
	}

	lib_A506::func_807(param_00,"attach cig",::lib_A569::func_0DDB);
	lib_A506::func_807(param_00,"detach cig",::lib_A569::func_2975);
	lib_A506::func_807(param_00,"puff",::lib_A569::func_867C);
	lib_A506::func_807(param_00,"exhale",::lib_A569::func_867A);
	level._effect["cigar_glow"] = loadfx("fx/fire/cigar_glow_far");
	level._effect["cigar_glow_puff"] = loadfx("fx/fire/cigar_glow_puff");
	level._effect["cigar_smoke_puff"] = loadfx("fx/smoke/cigarsmoke_puff_far");
	level._effect["cigar_exhale"] = loadfx("fx/smoke/cigarsmoke_exhale_far");
	level.var_78B2["cigar"] = "prop_price_cigar";
}

//Function Number: 3
lib_A569::func_2978(param_00)
{
	if(isdefined(param_00.var_1F96))
	{
		param_00.var_1F96 delete();
	}
}

//Function Number: 4
lib_A569::func_0793(param_00)
{
	if(lib_A569::func_7036(param_00,"add_cellphone_notetracks"))
	{
		return;
	}

	lib_A506::func_807(param_00,"attach clip left",::lib_A569::func_0DDD);
	lib_A506::func_807(param_00,"detach clip left",::lib_A569::func_2978);
	level.var_78B2["clip"] = "weapon_ak47_clip";
}

//Function Number: 5
lib_A569::func_0DDD(param_00)
{
	param_00 notify("new_prop_rotation");
	var_01 = spawn("script_model",(0,0,0));
	var_01 linkto(param_00,"tag_inhand",(0,0,0),(0,0,0));
	var_01 setmodel(lib_A59A::func_4024("clip"));
	param_00.var_1F96 = var_01;
	thread lib_A569::func_7034(var_01,param_00);
}

//Function Number: 6
lib_A569::func_073F(param_00)
{
	if(lib_A569::func_7036(param_00,"add_cellphone_notetracks"))
	{
		return;
	}

	lib_A506::func_807(param_00,"attach phone",::lib_A569::func_0DEA);
	lib_A506::func_807(param_00,"detach phone",::lib_A569::func_297C);
	level.var_78B2["cellphone"] = "com_cellphone_off";
}

//Function Number: 7
lib_A569::func_0DEA(param_00)
{
	param_00 notify("new_phone_rotation");
	var_01 = spawn("script_model",(0,0,0));
	var_01 linkto(param_00,"tag_inhand",(0,0,0),(0,0,0));
	var_01 setmodel(lib_A59A::func_4024("cellphone"));
	param_00.var_67EA = var_01;
	thread lib_A569::func_7034(var_01,param_00);
}

//Function Number: 8
lib_A569::func_297C(param_00)
{
	if(isdefined(param_00.var_67EA))
	{
		param_00.var_67EA delete();
	}
}

//Function Number: 9
lib_A569::func_0DDB(param_00)
{
	param_00 notify("new_cigar_rotation");
	var_01 = spawn("script_model",(0,0,0));
	var_01 linkto(param_00,"tag_inhand",(0,0,0),(0,0,0));
	var_01 setmodel(lib_A59A::func_4024("cigar"));
	playfxontag(common_scripts\utility::getfx("cigar_glow"),var_01,"tag_cigarglow");
	param_00.var_1D6B = var_01;
	thread lib_A569::func_7035(var_01,param_00);
}

//Function Number: 10
lib_A569::func_2975(param_00)
{
	if(isdefined(param_00.var_1D6B))
	{
		param_00.var_1D6B thread lib_A569::func_7033();
	}
}

//Function Number: 11
lib_A569::func_7034(param_00,param_01)
{
	param_01 notify("new_prop_rotation" + param_00.model);
	param_01 endon("new_prop_rotation" + param_00.model);
	param_00 endon("death");
	param_01 lib_A59A::func_75B("new_prop_rotation" + param_00.model);
	param_00 lib_A59A::func_75B("death");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"stop_loop");
	param_01 lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_2BDC();
	param_00 delete();
}

//Function Number: 12
lib_A569::func_7035(param_00,param_01)
{
	param_01 notify("new_prop_rotation" + param_00.model);
	param_01 endon("new_prop_rotation" + param_00.model);
	param_00 endon("death");
	param_01 lib_A59A::func_75B("new_prop_rotation" + param_00.model);
	param_00 lib_A59A::func_75B("death");
	lib_A59A::func_7BE(::lib_A59A::func_A090,"stop_loop");
	param_01 lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_2BDC();
	param_00 thread lib_A569::func_7033();
}

//Function Number: 13
lib_A569::func_7033()
{
	self endon("death");
	if(!isdefined(self))
	{
		return;
	}

	if(isdefined(self.var_1D6A) && self.var_1D6A)
	{
		return;
	}

	self.var_1D6A = 1;
	stopfxontag(common_scripts\utility::getfx("cigar_glow"),self,"tag_cigarglow");
	var_00 = 3;
	var_01 = anglestoforward(self.var_41);
	self unlink();
	self gravitymove(var_01 * 100,var_00);
	self rotatevelocity((400,0,0),var_00,0,var_00);
	wait(var_00);
	self delete();
}

//Function Number: 14
lib_A569::func_867C(param_00)
{
	if(!isdefined(param_00.var_1D6B))
	{
		return;
	}

	param_00 endon("death");
	param_00.var_1D6B endon("death");
	playfxontag(common_scripts\utility::getfx("cigar_glow_puff"),param_00.var_1D6B,"tag_cigarglow");
	wait(1);
	playfxontag(common_scripts\utility::getfx("cigar_smoke_puff"),param_00,"tag_eye");
}

//Function Number: 15
lib_A569::func_867A(param_00)
{
	if(!isdefined(param_00.var_1D6B))
	{
		return;
	}

	playfxontag(common_scripts\utility::getfx("cigar_exhale"),param_00,"tag_eye");
}

//Function Number: 16
lib_A569::func_4188()
{
	var_00 = [];
	var_00[var_00.size] = "J_MainRoot";
	var_00[var_00.size] = "J_CoatFront_LE";
	var_00[var_00.size] = "J_Hip_LE";
	var_00[var_00.size] = "J_CoatRear_RI";
	var_00[var_00.size] = "J_CoatRear_LE";
	var_00[var_00.size] = "J_CoatFront_RI";
	var_00[var_00.size] = "J_Cheek_RI";
	var_00[var_00.size] = "J_Brow_LE";
	var_00[var_00.size] = "J_Shoulder_RI";
	var_00[var_00.size] = "J_Head";
	var_00[var_00.size] = "J_ShoulderRaise_LE";
	var_00[var_00.size] = "J_Neck";
	var_00[var_00.size] = "J_Clavicle_RI";
	var_00[var_00.size] = "J_Ball_LE";
	var_00[var_00.size] = "J_Knee_Bulge_LE";
	var_00[var_00.size] = "J_Ankle_RI";
	var_00[var_00.size] = "J_Ankle_LE";
	var_00[var_00.size] = "J_SpineUpper";
	var_00[var_00.size] = "J_Knee_RI";
	var_00[var_00.size] = "J_Knee_LE";
	var_00[var_00.size] = "J_HipTwist_RI";
	var_00[var_00.size] = "J_HipTwist_LE";
	var_00[var_00.size] = "J_SpineLower";
	var_00[var_00.size] = "J_Hip_RI";
	var_00[var_00.size] = "J_Elbow_LE";
	var_00[var_00.size] = "J_Wrist_RI";
	self endon("death");
	for(;;)
	{
		while(self.movemode != "run")
		{
			wait(0.2);
			continue;
		}

		playfxontag(level._effect["ghillie_leaves"],self,common_scripts\utility::random(var_00));
		wait(randomfloatrange(0.1,2.5));
	}
}

//Function Number: 17
lib_A569::func_0DDC()
{
	lib_A569::func_0DDB(self);
}