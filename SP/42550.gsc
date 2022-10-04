/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42550.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 31
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:50 PM
*******************************************************************/

//Function Number: 1
lib_A636::main()
{
	level._effect["light_point_red_solid_nolens"] = loadfx("vfx/lights/light_wingtip_red_med_point_nolens");
	level._effect["razorback_tread_smk_regular_runner"] = loadfx("vfx/treadfx/razorback_tread_smk_regular_runner");
	level._effect["razorback_tread_smk_strong_runner"] = loadfx("vfx/treadfx/razorback_tread_smk_strong_runner");
	level._effect["razorback_tread_smk_idle_runner"] = loadfx("vfx/treadfx/razorback_tread_smk_idle_runner");
	level._effect["razorback_exhaust_regular"] = loadfx("vfx/vehicle/razorback_exhaust_regular");
	level._effect["razorback_exhaust_idle"] = loadfx("vfx/vehicle/razorback_exhaust_idle");
	level._effect["razorback_exhaust_strong"] = loadfx("vfx/vehicle/razorback_exhaust_strong");
	level._effect["razorback_exhaust_light_flicker"] = loadfx("vfx/vehicle/razorback_exhaust_light_flicker");
	level._effect["razorback_exhaust_tail_left_regular"] = loadfx("vfx/vehicle/razorback_exhaust_tail_left_regular");
	level._effect["razorback_exhaust_tail_right_regular"] = loadfx("vfx/vehicle/razorback_exhaust_tail_right_regular");
}

//Function Number: 2
lib_A636::func_9DE1(param_00)
{
	lib_A59A::delaythread(0.4,::lib_A636::func_6897);
	lib_A59A::delaythread(0.45,::lib_A636::func_6949);
}

//Function Number: 3
lib_A636::func_9DE0(param_00)
{
	lib_A59A::delaythread(3.8,::lib_A636::func_8E65);
	lib_A59A::delaythread(6.5,::lib_A636::func_8E87);
}

//Function Number: 4
lib_A636::func_9DE3(param_00)
{
	lib_A59A::delaythread(0,::lib_A636::func_699D,param_00);
	lib_A59A::delaythread(0.2,::lib_A636::func_69A0,param_00);
	lib_A59A::delaythread(0.3,::lib_A636::func_699E,param_00);
	lib_A59A::delaythread(0.05,::lib_A636::func_8E93,param_00);
	lib_A59A::delaythread(0.15,::lib_A636::func_8E94,param_00);
}

//Function Number: 5
lib_A636::func_9DE2(param_00)
{
	lib_A59A::delaythread(0,::lib_A636::func_8EAF,param_00);
	lib_A59A::delaythread(0.2,::lib_A636::func_8EB0,param_00);
	lib_A59A::delaythread(0.3,::lib_A636::func_8EB2,param_00);
	lib_A59A::delaythread(0.05,::lib_A636::func_6961,param_00);
	lib_A59A::delaythread(0.15,::lib_A636::func_6962,param_00);
}

//Function Number: 6
lib_A636::func_9DDF(param_00)
{
	wait(0.1);
	lib_A59A::delaythread(0,::lib_A636::func_699C,param_00);
	lib_A59A::delaythread(0.1,::lib_A636::func_699F,param_00);
	lib_A59A::delaythread(0.3,::lib_A636::func_8E92,param_00);
	lib_A59A::delaythread(0.05,::lib_A636::func_9DDD,param_00);
}

//Function Number: 7
lib_A636::func_9DDE(param_00)
{
	wait(0.1);
	lib_A59A::delaythread(0,::lib_A636::func_8EAE,param_00);
	lib_A59A::delaythread(0.1,::lib_A636::func_8EB1,param_00);
	lib_A59A::delaythread(0.3,::lib_A636::func_6960,param_00);
	lib_A59A::delaythread(0.05,::lib_A636::func_9DDC,param_00);
}

//Function Number: 8
lib_A636::func_699D(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_TR_FX");
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 9
lib_A636::func_8EAF(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_TR_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 10
lib_A636::func_69A0(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_TR_FX");
	playfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 11
lib_A636::func_8EB2(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_TR_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 12
lib_A636::func_6962(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_tread_smk_idle_runner"),param_00,"thrusterCenter_TR_FX");
	playfxontag(common_scripts\utility::getfx("razorback_tread_smk_idle_runner"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 13
lib_A636::func_8E94(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_tread_smk_idle_runner"),param_00,"thrusterCenter_TR_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_tread_smk_idle_runner"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 14
lib_A636::func_6961(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_TR_FX");
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 15
lib_A636::func_8E93(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_TR_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_TL_FX");
}

//Function Number: 16
lib_A636::func_6949()
{
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_TR_FX");
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_TL_FX");
}

//Function Number: 17
lib_A636::func_8E87()
{
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_TR_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_TL_FX");
}

//Function Number: 18
lib_A636::func_699E(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_tail_right_regular"),param_00,"thrusterCenter_KR_FX1");
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_tail_left_regular"),param_00,"thrusterCenter_KL_FX1");
}

//Function Number: 19
lib_A636::func_8EB0(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_tail_right_regular"),param_00,"thrusterCenter_KR_FX1");
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_tail_left_regular"),param_00,"thrusterCenter_KL_FX1");
}

//Function Number: 20
lib_A636::func_699C(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_BL_FX");
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_BR_FX");
}

//Function Number: 21
lib_A636::func_8EAE(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_BL_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),param_00,"thrusterCenter_BR_FX");
}

//Function Number: 22
lib_A636::func_699F(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_BL_FX");
	playfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_BR_FX");
}

//Function Number: 23
lib_A636::func_8EB1(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_BL_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_tread_smk_regular_runner"),param_00,"thrusterCenter_BR_FX");
}

//Function Number: 24
lib_A636::func_6960(param_00)
{
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_BL_FX");
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_BR_FX");
}

//Function Number: 25
lib_A636::func_8E92(param_00)
{
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_BL_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),param_00,"thrusterCenter_BR_FX");
}

//Function Number: 26
lib_A636::func_6897()
{
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_BR_FX");
	playfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_BL_FX");
}

//Function Number: 27
lib_A636::func_8E65()
{
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_BR_FX");
	stopfxontag(common_scripts\utility::getfx("razorback_exhaust_light_flicker"),self,"thrusterCenter_BL_FX");
}

//Function Number: 28
lib_A636::func_69C8(param_00,param_01,param_02)
{
	self endon("kill_" + param_02);
	wait(param_00 * 0.05);
	if(param_01 == "idle")
	{
		stopfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),self,param_02);
		wait(0.05);
		stopfxontag(common_scripts\utility::getfx("razorback_exhaust_strong"),self,param_02);
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),self,param_02);
		wait(0.05);
		return;
	}

	if(param_01 == "regular")
	{
		wait(0.05);
		stopfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),self,param_02);
		wait(0.05);
		stopfxontag(common_scripts\utility::getfx("razorback_exhaust_strong"),self,param_02);
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),self,param_02);
		wait(0.05);
		return;
	}

	if(param_01 == "strong")
	{
		stopfxontag(common_scripts\utility::getfx("razorback_exhaust_idle"),self,param_02);
		wait(0.05);
		stopfxontag(common_scripts\utility::getfx("razorback_exhaust_regular"),self,param_02);
		wait(0.05);
		playfxontag(common_scripts\utility::getfx("razorback_exhaust_strong"),self,param_02);
		wait(0.05);
		return;
	}
}

//Function Number: 29
lib_A636::func_9DE5()
{
	wait(0.5);
	playfxontag(common_scripts\utility::getfx("light_point_red_solid_nolens"),self,"TAG_LIGHT_BACK_RIGHT");
	wait(0.05);
	playfxontag(common_scripts\utility::getfx("light_point_red_solid_nolens"),self,"TAG_LIGHT_BACK_LEFT");
	wait(0.05);
	playfxontag(common_scripts\utility::getfx("light_point_red_solid_nolens"),self,"TAG_LIGHT_RIGHT");
	wait(0.05);
	playfxontag(common_scripts\utility::getfx("light_point_red_solid_nolens"),self,"TAG_LIGHT_LEFT");
}

//Function Number: 30
lib_A636::func_9DDC(param_00)
{
	level.var_714E notify("stop_kicking_up_dustthrusterCenter_BR_FX");
	level.var_714E notify("stop_kicking_up_dustthrusterCenter_BL_FX");
}

//Function Number: 31
lib_A636::func_9DDD(param_00)
{
	level.var_714E thread lib_A5A0::func_995(undefined,"thrusterCenter_BR_FX");
	level.var_714E thread lib_A5A0::func_995(undefined,"thrusterCenter_BL_FX");
}