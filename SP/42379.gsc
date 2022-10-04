/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42379.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 18
 * Decompile Time: 3 ms
 * Timestamp: 4/20/2022 8:23:25 PM
*******************************************************************/

//Function Number: 1
lib_A58B::func_8E10()
{
	lib_A58B::func_9088();
	thread lib_A58B::func_908A();
	common_scripts\utility::array_thread(getentarray("stealth_clipbrush","targetname"),::lib_A58B::func_9087);
}

//Function Number: 2
lib_A58B::func_908A()
{
	var_00 = "_stealth_spotted";
	for(;;)
	{
		common_scripts\utility::flag_wait("_stealth_enabled");
		common_scripts\utility::flag_wait(var_00);
		if(!common_scripts\utility::flag("_stealth_enabled"))
		{
			continue;
		}

		lib_A58B::func_9086("spotted");
		thread lib_A58B::func_908F();
		common_scripts\utility::flag_waitopen(var_00);
		if(!common_scripts\utility::flag("_stealth_enabled"))
		{
			continue;
		}

		lib_A58B::func_9086("hidden");
		waittillframeend;
	}
}

//Function Number: 3
lib_A58B::func_9086(param_00)
{
	level.var_669.var_5833.var_29A0 = param_00;
	foreach(var_04, var_02 in level.var_669.var_5833.var_1E)
	{
		function_00D3(var_04,var_02[param_00]);
		var_03 = "ai_busyEvent" + getsubstr(var_04,8);
		function_00D3(var_03,var_02[param_00]);
	}
}

//Function Number: 4
lib_A58B::func_908F()
{
	while(common_scripts\utility::flag("_stealth_spotted"))
	{
		common_scripts\utility::flag_wait("_stealth_enabled");
		var_00 = level.var_669.var_4417.var_443B;
		foreach(var_04, var_02 in var_00)
		{
			var_03 = lib_A585::func_4424("_stealth_spotted",var_04);
			if(!common_scripts\utility::flag(var_03))
			{
				continue;
			}

			var_02 = common_scripts\utility::array_removeundefined(var_02);
			if(var_02.size > 0)
			{
				if(var_02[0].inliveplayerkillstreak == "allies")
				{
					continue;
				}
			}

			thread lib_A58B::func_9090(var_04);
		}

		common_scripts\utility::flag_waitopen_or_timeout("_stealth_spotted",1.25);
	}
}

//Function Number: 5
lib_A58B::func_9090(param_00)
{
	var_01 = lib_A58B::func_908E(param_00);
	if(!var_01)
	{
		return;
	}

	wait(1);
	var_01 = lib_A58B::func_908E(param_00);
	if(!var_01)
	{
		return;
	}

	lib_A585::func_441E("_stealth_spotted",param_00);
}

//Function Number: 6
lib_A58B::func_908E(param_00)
{
	var_01 = lib_A585::func_4422(param_00);
	foreach(var_03 in var_01)
	{
		if(!isalive(var_03.enemy))
		{
			continue;
		}

		return 0;
	}

	return 1;
}

//Function Number: 7
lib_A58B::func_908B()
{
	common_scripts\utility::flag_init("_stealth_player_nade");
	level.var_669.var_5833.var_6BA6 = 0;
	common_scripts\utility::array_thread(level.var_328,::lib_A58B::func_6B30);
}

//Function Number: 8
lib_A58B::func_6B30()
{
	for(;;)
	{
		self waittill("grenade_pullback");
		common_scripts\utility::flag_set("_stealth_player_nade");
		self waittill("grenade_fire",var_00);
		thread lib_A58B::func_6B31(var_00);
	}
}

//Function Number: 9
lib_A58B::func_6B31(param_00)
{
	level.var_669.var_5833.var_6BA6++;
	param_00 common_scripts\utility::waittill_notify_or_timeout("death",10);
	level.var_669.var_5833.var_6BA6--;
	waittillframeend;
	if(!level.var_669.var_5833.var_6BA6)
	{
		common_scripts\utility::flag_clear("_stealth_player_nade");
	}
}

//Function Number: 10
lib_A58B::func_9089()
{
	common_scripts\utility::array_thread(getentarray("_stealth_shadow","targetname"),::lib_A58B::func_8E02);
	common_scripts\utility::array_thread(getentarray("stealth_shadow","targetname"),::lib_A58B::func_8E02);
}

//Function Number: 11
lib_A58B::func_8E02()
{
	self endon("death");
	for(;;)
	{
		self waittill("trigger",var_00);
		if(!isalive(var_00))
		{
			continue;
		}

		if(!var_00 lib_A59A::func_32DB("_stealth_in_shadow") || var_00 lib_A59A::func_32D7("_stealth_in_shadow"))
		{
			continue;
		}

		var_00 thread lib_A58B::func_8E01(self);
	}
}

//Function Number: 12
lib_A58B::func_8E01(param_00)
{
	self endon("death");
	lib_A59A::func_32DD("_stealth_in_shadow");
	while(isdefined(param_00) && self istouching(param_00))
	{
		wait(0.05);
	}

	lib_A59A::func_32D9("_stealth_in_shadow");
}

//Function Number: 13
lib_A58B::func_9087()
{
	self endon("death");
	if(isdefined(self.var_79D5))
	{
		common_scripts\utility::flag_wait(self.var_79D5);
	}

	waittillframeend;
	var_00 = "_stealth_spotted";
	var_01 = "_stealth_found_corpse";
	var_02 = "_stealth_event";
	if(isdefined(self.var_7ADE))
	{
		lib_A585::func_4436(lib_A59A::func_8F4D(self.var_7ADE));
		var_00 = lib_A585::func_4424(var_00,self.var_7ADE);
		var_01 = lib_A585::func_4424(var_01,self.var_7ADE);
		var_02 = lib_A585::func_4424(var_02,self.var_7ADE);
	}

	self setcandamage(1);
	lib_A59A::func_7BE(::lib_A59A::func_A090,"damage");
	level lib_A59A::func_7BE(::common_scripts\utility::flag_wait,var_00);
	level lib_A59A::func_7BE(::common_scripts\utility::flag_wait,var_01);
	level lib_A59A::func_7BE(::common_scripts\utility::flag_wait,var_02);
	lib_A59A::func_2BDC();
	if(self.spawnflags & 1)
	{
		self connectpaths();
	}

	self delete();
}

//Function Number: 14
lib_A58B::func_9088()
{
	common_scripts\utility::flag_init("_stealth_spotted");
	common_scripts\utility::flag_init("_stealth_event");
	common_scripts\utility::flag_init("_stealth_enabled");
	common_scripts\utility::flag_set("_stealth_enabled");
	level.var_669 = spawnstruct();
	level.var_669.var_5833 = spawnstruct();
	level.var_669.var_4417 = spawnstruct();
	level.var_669.var_4417.flags = [];
	level.var_669.var_4417.var_443B = [];
	level.var_669.var_5833.var_29A0 = "hidden";
	level.var_669.var_5833.var_298D = [];
	level.var_669.var_5833.var_298D["hidden"] = [];
	level.var_669.var_5833.var_298D["spotted"] = [];
	lib_A58B::func_9084();
	level.var_669.var_5833.var_1E = [];
	level.var_669.var_5833.var_1E["ai_eventDistDeath"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistPain"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistExplosion"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistBullet"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistFootstep"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistFootstepWalk"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistFootstepSprint"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistGunShot"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistGunShotTeam"] = [];
	level.var_669.var_5833.var_1E["ai_eventDistNewEnemy"] = [];
	lib_A58B::func_9085();
	lib_A58B::func_9086("hidden");
	lib_A58B::func_908B();
	lib_A58B::func_9089();
	lib_A588::func_8D8A(0.5);
}

//Function Number: 15
lib_A58B::func_9084()
{
	var_00 = [];
	var_00["prone"] = 70;
	var_00["crouch"] = 600;
	var_00["stand"] = 1024;
	var_01 = [];
	var_01["prone"] = 512;
	var_01["crouch"] = 5000;
	var_01["stand"] = 8000;
	lib_A58B::func_908C(var_00,var_01);
}

//Function Number: 16
lib_A58B::func_908C(param_00,param_01)
{
	if(isdefined(param_00))
	{
		level.var_669.var_5833.var_298D["hidden"]["prone"] = param_00["prone"];
		level.var_669.var_5833.var_298D["hidden"]["crouch"] = param_00["crouch"];
		level.var_669.var_5833.var_298D["hidden"]["stand"] = param_00["stand"];
	}

	if(isdefined(param_01))
	{
		level.var_669.var_5833.var_298D["spotted"]["prone"] = param_01["prone"];
		level.var_669.var_5833.var_298D["spotted"]["crouch"] = param_01["crouch"];
		level.var_669.var_5833.var_298D["spotted"]["stand"] = param_01["stand"];
	}
}

//Function Number: 17
lib_A58B::func_9085()
{
	var_00["ai_eventDistDeath"] = [];
	var_00["ai_eventDistPain"] = [];
	var_00["ai_eventDistExplosion"] = [];
	var_00["ai_eventDistBullet"] = [];
	var_00["ai_eventDistFootstep"] = [];
	var_00["ai_eventDistFootstepWalk"] = [];
	var_00["ai_eventDistFootstepSprint"] = [];
	var_00["ai_eventDistGunShot"] = [];
	var_00["ai_eventDistGunShotTeam"] = [];
	var_00["ai_eventDistNewEnemy"] = [];
	var_00["ai_eventDistDeath"]["spotted"] = getdvar("ai_eventDistDeath");
	var_00["ai_eventDistDeath"]["hidden"] = 512;
	var_00["ai_eventDistPain"]["spotted"] = getdvar("ai_eventDistPain");
	var_00["ai_eventDistPain"]["hidden"] = 256;
	var_00["ai_eventDistExplosion"]["spotted"] = 4000;
	var_00["ai_eventDistExplosion"]["hidden"] = 4000;
	var_00["ai_eventDistBullet"]["spotted"] = 96;
	var_00["ai_eventDistBullet"]["hidden"] = 64;
	var_00["ai_eventDistFootstep"]["spotted"] = 350;
	var_00["ai_eventDistFootstep"]["hidden"] = 64;
	var_00["ai_eventDistFootstepWalk"]["spotted"] = 256;
	var_00["ai_eventDistFootstepWalk"]["hidden"] = 32;
	var_00["ai_eventDistFootstepSprint"]["spotted"] = 400;
	var_00["ai_eventDistFootstepSprint"]["hidden"] = 400;
	var_00["ai_eventDistGunShot"]["spotted"] = 2048;
	var_00["ai_eventDistGunShot"]["hidden"] = 2048;
	var_00["ai_eventDistGunShotTeam"]["spotted"] = 750;
	var_00["ai_eventDistGunShotTeam"]["hidden"] = 750;
	var_00["ai_eventDistNewEnemy"]["spotted"] = 750;
	var_00["ai_eventDistNewEnemy"]["hidden"] = 750;
	lib_A58B::func_908D(var_00);
}

//Function Number: 18
lib_A58B::func_908D(param_00)
{
	foreach(var_06, var_02 in param_00)
	{
		foreach(var_05, var_04 in var_02)
		{
			level.var_669.var_5833.var_1E[var_06][var_05] = var_04;
		}
	}
}