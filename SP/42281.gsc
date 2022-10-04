/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42281.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 21
 * Decompile Time: 9 ms
 * Timestamp: 4/20/2022 8:22:05 PM
*******************************************************************/

//Function Number: 1
lib_A529::init()
{
	precacheitem("s1_exo_shield_sp");
	precacheshader("dpad_icon_shield");
	precacheshader("dpad_icon_shield_off");
	level.var_31D lib_A59A::func_7EE1("s1_exo_shield_sp");
	precachestring(&"GAME_CROUCH_BLOCKED_WEAPON");
	lib_A59A::func_764("EXO_SHIELD_CROUCH_BLOCKED_WEAPON",&"GAME_CROUCH_BLOCKED_WEAPON");
	if(!isdefined(level.var_31D.var_3507))
	{
		level.var_31D.var_3507 = [];
	}

	level.var_31D.var_3507["shield"] = spawnstruct();
	var_00 = level.var_31D.var_3507["shield"];
	var_00.weapon_name = "s1_exo_shield_sp";
	var_00.var_710 = 1;
	var_00.state = "disabled";
	var_00.var_74CA = 1;
	var_00.duration = 15;
	level.var_31D thread lib_A529::func_5E14();
	level.var_31D thread lib_A529::func_5D9D();
	if(!level.var_31D lib_A59A::func_32DB("exo_shield_on"))
	{
		level.var_31D lib_A59A::func_32DC("exo_shield_on");
	}
}

//Function Number: 2
lib_A529::func_3D5B()
{
	return level.var_31D.var_3507["shield"];
}

//Function Number: 3
lib_A529::func_8D52(param_00)
{
	var_01 = lib_A529::func_3D5B();
	var_02 = lib_A529::func_5079(var_01.state);
	var_03 = lib_A529::func_5079(param_00);
	var_01.state = param_00;
	if(!var_02 && var_03)
	{
		lib_A529::func_6445();
		return;
	}

	if(var_02 && !var_03)
	{
		lib_A529::func_6444();
	}
}

//Function Number: 4
lib_A529::func_5079(param_00)
{
	return isdefined(param_00) && param_00 == "raised";
}

//Function Number: 5
lib_A529::func_6445()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D lib_A59A::func_6C5C(0,"exo_shield");
	level.var_31D.var_39A9 = 1;
}

//Function Number: 6
lib_A529::func_6444()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D lib_A59A::func_6C5C(1,"exo_shield");
	level.var_31D.var_39A9 = undefined;
}

//Function Number: 7
lib_A529::func_30EE()
{
	level.var_31D endon("exo_shield_disabled");
	level.var_31D notify("exo_shield_enabled");
	lib_A529::func_8D52("idle");
	var_00 = lib_A529::func_3D5B();
	lib_A529::func_9AB2();
	level.var_31D notifyonplayercommand("exo_shield_toggle","+actionslot 2");
	level.var_31D waittill("exo_shield_toggle");
	switch(var_00.state)
	{
		case "equipping":
		case "raised":
			break;

		case "idle":
			break;
	}
}

//Function Number: 8
lib_A529::func_2ACD()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D setweaponhudiconoverride("actionslot2","dpad_icon_shield_off");
	switch(var_00.state)
	{
		case "equipping":
		case "raised":
			break;
	}
}

//Function Number: 9
lib_A529::func_9885()
{
	var_00 = lib_A529::func_3D5B();
	var_01 = 0;
	if(level.var_31D getstance() == "prone")
	{
		level.var_31D setstance("crouch");
	}

	if(level.var_31D getstance() == "prone")
	{
		lib_A59A::func_2B49("EXO_SHIELD_CROUCH_BLOCKED_WEAPON",undefined,undefined,undefined,200);
		var_01 = 1;
	}
	else if(level.var_31D method_812C() || level.var_31D method_801A())
	{
		var_01 = 1;
	}
	else if(lib_A561::func_1323(var_00.var_710))
	{
		lib_A529::func_70FF();
	}

	if(var_01)
	{
		lib_A561::func_3502();
	}
}

//Function Number: 10
lib_A529::func_70FF()
{
	level.var_31D endon("exo_shield_disabled");
	level.var_31D endon("exo_shield_lower");
	level.var_31D endon("exo_shield_removed");
	level.var_31D lib_A59A::func_32DD("exo_shield_on");
	var_00 = lib_A529::func_3D5B();
	lib_A529::func_8D52("equipping");
	var_00.var_6F59 = level.var_31D getcurrentprimaryweapon();
	level.var_31D giveweapon(var_00.weapon_name);
	lib_A5DE::snd_message("exo_raise_shield");
	level.var_31D thread lib_A529::func_5D94();
	level.var_31D switchtoweapon(var_00.weapon_name);
	var_01 = undefined;
	var_02 = level.var_31D getcurrentweapon(1);
	while(!isdefined(var_01) || var_01 || var_02 == "none")
	{
		level.var_31D waittill("weapon_change");
		var_01 = level.var_31D method_801A();
		var_02 = level.var_31D getcurrentweapon(1);
	}

	var_03 = level.var_31D getcurrentweapon(0) == var_00.weapon_name;
	if(!var_03)
	{
		var_02 = level.var_31D getcurrentweapon();
		if(var_02 == var_00.weapon_name || var_02 == "none")
		{
			lib_A529::func_9076();
		}

		lib_A529::func_0626();
		return;
	}

	level.var_31D notify("exo_shield_equipped");
	lib_A529::func_8D52("raised");
	thread lib_A529::func_5E00();
	thread lib_A529::func_5E01();
}

//Function Number: 11
lib_A529::func_5D94()
{
	level.var_31D endon("exo_shield_equipped");
	level.var_31D endon("exo_shield_removed");
	level.var_31D childthread lib_A529::func_5DFF();
	level.var_31D common_scripts\utility::waittill_any("exo_shield_disabled","exo_shield_lower");
	lib_A529::func_0626();
}

//Function Number: 12
lib_A529::func_5DFF()
{
	level.var_31D endon("exo_shield_disabled");
	level.var_31D endon("exo_shield_lower");
	var_00 = lib_A529::func_3D5B();
	for(;;)
	{
		level.var_31D waittill("weapon_taken",var_01);
		if(issubstr(var_01,var_00.weapon_name))
		{
			lib_A529::func_8D52("idle");
			level.var_31D notify("exo_shield_removed");
		}
	}
}

//Function Number: 13
lib_A529::func_589D(param_00)
{
	var_01 = lib_A529::func_3D5B();
	level.var_31D notify("exo_shield_lower");
	lib_A5DE::snd_message("exo_lower_shield");
	level.var_31D lib_A59A::func_32D9("exo_shield_on");
	var_02 = level.var_31D getcurrentweapon();
	if(var_02 == "none" || var_02 == var_01.weapon_name || var_01.state == "equipping")
	{
		lib_A529::func_9076(param_00);
	}
}

//Function Number: 14
lib_A529::func_0626()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D takeweapon(var_00.weapon_name);
	lib_A529::func_8D52("idle");
	level.var_31D notify("exo_shield_removed");
}

//Function Number: 15
lib_A529::func_9076(param_00)
{
	var_01 = lib_A529::func_3D5B();
	var_02 = undefined;
	if(isdefined(var_01.var_6F59) && level.var_31D hasweapon(var_01.var_6F59))
	{
		var_02 = var_01.var_6F59;
	}
	else
	{
		var_02 = level.var_31D lib_A59A::func_3D6A();
	}

	if(!isdefined(var_02) && var_02 != "none")
	{
	}

	if(isdefined(var_02))
	{
		if(isdefined(param_00) && param_00)
		{
			level.var_31D switchtoweaponimmediate(var_02);
			return;
		}

		level.var_31D switchtoweapon(var_02);
	}
}

//Function Number: 16
lib_A529::func_5E01()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D endon("exo_shield_removed");
	var_00.var_8CBF = gettime();
	wait(var_00.duration);
	if(var_00.state == "raised")
	{
		if(level.var_31D method_84E0())
		{
			lib_A529::func_633F();
			return;
		}

		var_02 = level.var_31D getcurrentweapon(0) == var_00.weapon_name;
		lib_A529::func_589D(!var_02);
	}
}

//Function Number: 17
lib_A529::func_5E00()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D endon("exo_shield_removed");
	var_01 = 0;
	if(!var_01)
	{
		level.var_31D common_scripts\utility::waittill_any("weapon_switch_started","weapon_change","exo_shield_toggle");
		var_02 = level.var_31D getcurrentweapon(0) == var_00.weapon_name;
		var_03 = !var_02 && level.var_31D getcurrentweapon(1) == var_00.weapon_name;
		var_04 = level.var_31D method_84E0() || level.var_31D method_812C();
		var_05 = level.var_31D hasweapon(var_00.weapon_name);
		var_06 = !var_03 && var_05 && level.var_31D method_801A();
		switch(var_00.state)
		{
			case "raised":
				break;

			default:
				break;
		}
	}
}

//Function Number: 18
lib_A529::func_5D9D()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D endon("death");
	for(;;)
	{
		level.var_31D waittill("weapon_switch_invalid",var_01,var_02);
		if(isdefined(var_01) && var_01 == var_00.weapon_name)
		{
			lib_A529::func_9076(var_02);
		}
	}
}

//Function Number: 19
lib_A529::func_5E14()
{
	var_00 = lib_A529::func_3D5B();
	level.var_31D endon("death");
	for(;;)
	{
		level.var_31D waittill("weapon_switch_started",var_01);
		if((var_00.state == "disabled" || var_00.state == "idle") && level.var_31D hasweapon(var_00.weapon_name))
		{
			level.var_31D takeweapon(var_00.weapon_name);
			if(isdefined(var_01) && var_01 == var_00.weapon_name)
			{
				lib_A529::func_9076(0);
			}
		}
	}
}

//Function Number: 20
lib_A529::func_633F()
{
	var_00 = lib_A529::func_3D5B();
	var_01 = level.var_31D method_84E0();
	while(!var_01)
	{
		wait 0.05;
		var_01 = level.var_31D method_84E0();
	}

	lib_A529::func_589D(1);
	lib_A529::func_0626();
}

//Function Number: 21
lib_A529::func_9AB2()
{
	if(!lib_A561::func_6B02())
	{
		level.var_31D setweaponhudiconoverride("actionslot2","none");
		return;
	}

	if(lib_A561::func_3D59() > 0)
	{
		level.var_31D setweaponhudiconoverride("actionslot2","dpad_icon_shield");
		return;
	}

	level.var_31D setweaponhudiconoverride("actionslot2","dpad_icon_shield_off");
}