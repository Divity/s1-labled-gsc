/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42312.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 2 ms
 * Timestamp: 4/20/2022 8:23:18 PM
*******************************************************************/

//Function Number: 1
lib_A548::func_781B(param_00,param_01)
{
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	level.var_31D endon("death");
	if(level.var_31D.health == 0)
	{
		return;
	}

	var_02 = level.var_31D lib_A59A::func_3E75();
	if(!isdefined(var_02) || var_02 == "none")
	{
	}

	game["weaponstates"][param_00]["current"] = var_02;
	var_03 = level.var_31D getcurrentoffhand();
	var_04 = level.var_31D getoffhandprimaryclass();
	var_05 = level.var_31D getoffhandsecondaryclass();
	game["weaponstates"][param_00]["offhand"] = var_03;
	game["weaponstates"][param_00]["list"] = [];
	var_06 = common_scripts\utility::array_combine(level.var_31D getweaponslistprimaries(),level.var_31D getweaponslistoffhands());
	var_07 = 0;
	foreach(var_09 in var_06)
	{
		if(level.var_31D lib_A59A::func_5093(var_09))
		{
			continue;
		}

		game["weaponstates"][param_00]["list"][var_07]["name"] = var_06[var_07];
		var_0A = level.var_31D method_8317(var_06[var_07]);
		game["weaponstates"][param_00]["list"][var_07]["hybrid_sight_enabled"] = var_0A;
		if(var_06[var_07] == var_04)
		{
			game["weaponstates"][param_00]["list"][var_07]["isLethal"] = 1;
		}
		else
		{
			game["weaponstates"][param_00]["list"][var_07]["isLethal"] = 0;
		}

		if(var_06[var_07] == var_05)
		{
			game["weaponstates"][param_00]["list"][var_07]["isTactical"] = 1;
		}
		else
		{
			game["weaponstates"][param_00]["list"][var_07]["isTactical"] = 0;
		}

		if(param_01)
		{
			game["weaponstates"][param_00]["list"][var_07]["clip"] = level.var_31D getweaponammoclip(var_06[var_07]);
			game["weaponstates"][param_00]["list"][var_07]["stock"] = level.var_31D getweaponammostock(var_06[var_07]);
		}

		var_07++;
	}
}

//Function Number: 2
lib_A548::func_74AE(param_00,param_01,param_02)
{
	var_03 = common_scripts\utility::ter_op(isdefined(param_02) && param_02,::switchtoweaponimmediate,::switchtoweapon);
	if(!isdefined(param_01))
	{
		param_01 = 0;
	}

	if(!isdefined(game["weaponstates"]))
	{
		return 0;
	}

	if(!isdefined(game["weaponstates"][param_00]))
	{
		return 0;
	}

	level.var_31D takeallweapons();
	var_04 = [];
	for(var_05 = 0;var_05 < game["weaponstates"][param_00]["list"].size;var_05++)
	{
		var_06 = game["weaponstates"][param_00]["list"][var_05]["name"];
		if(var_06 == "c4")
		{
			continue;
		}

		if(var_06 == "claymore")
		{
			continue;
		}

		if(game["weaponstates"][param_00]["list"][var_05]["isLethal"] == 1)
		{
			level.var_31D setoffhandprimaryclass(var_06);
		}

		if(game["weaponstates"][param_00]["list"][var_05]["isTactical"] == 1)
		{
			level.var_31D setoffhandsecondaryclass(var_06);
		}

		level.var_31D giveweapon(var_06);
		level.var_31D givemaxammo(var_06);
		var_07 = game["weaponstates"][param_00]["list"][var_05]["hybrid_sight_enabled"];
		level.var_31D method_8440(var_06,var_07);
		if(param_01)
		{
			var_08 = var_04.size;
			var_04[var_08]["name"] = var_06;
			var_04[var_08]["clip"] = game["weaponstates"][param_00]["list"][var_05]["clip"];
			var_04[var_08]["stock"] = game["weaponstates"][param_00]["list"][var_05]["stock"];
		}
	}

	foreach(var_0A in var_04)
	{
		level.var_31D setweaponammoclip(var_0A["name"],var_0A["clip"]);
		level.var_31D setweaponammostock(var_0A["name"],var_0A["stock"]);
	}

	level.var_31D switchtooffhand(game["weaponstates"][param_00]["offhand"]);
	level.var_31D [[ var_03 ]](game["weaponstates"][param_00]["current"]);
	return 1;
}

//Function Number: 3
lib_A548::func_7F40()
{
	self setactionslot(1,"");
	self setactionslot(2,"");
	self setactionslot(3,"altMode");
	self setactionslot(4,"");
}

//Function Number: 4
lib_A548::func_4D2E()
{
	lib_A548::func_7F40();
	self takeallweapons();
}

//Function Number: 5
lib_A548::func_3DCA()
{
	if(isdefined(level.loadout))
	{
		return level.loadout;
	}

	return level.script;
}

//Function Number: 6
lib_A548::func_1A3D(param_00)
{
	level.var_5DD = param_00;
}

//Function Number: 7
lib_A548::func_67D6(param_00,param_01)
{
	var_02 = lib_A548::func_3DCA();
	if(param_00 != var_02)
	{
		return;
	}

	if(!isdefined(game["previous_map"]))
	{
		return;
	}

	level.var_5DE = 1;
	lib_A548::func_74AE(param_01,1);
	level.var_46F0 = 1;
}

//Function Number: 8
lib_A548::loadout(param_00,param_01,param_02,param_03,param_04,param_05)
{
	if(isdefined(param_00))
	{
		var_06 = lib_A548::func_3DCA();
		if(param_00 != var_06 || isdefined(level.var_5DE))
		{
			return;
		}
	}

	if(isdefined(param_01))
	{
		level.var_2791 = param_01;
		level.var_31D giveweapon(param_01);
	}

	if(isdefined(param_02))
	{
		level.var_31D giveweapon(param_02);
	}

	if(isdefined(param_03))
	{
		level.var_31D setoffhandprimaryclass(param_03);
		level.var_31D giveweapon(param_03);
	}

	if(isdefined(param_04))
	{
		level.var_31D setoffhandsecondaryclass(param_04);
		level.var_31D giveweapon(param_04);
	}

	level.var_31D switchtoweapon(param_01);
	if(isdefined(param_05))
	{
		level.var_31D setviewmodel(param_05);
	}

	level.var_1A3D = level.var_5DD;
	level.var_5DD = undefined;
	level.var_46F0 = 1;
}

//Function Number: 9
lib_A548::func_57D5()
{
	level.var_57D7 = 1;
	level notify("loadout complete");
}

//Function Number: 10
lib_A548::func_2782()
{
	if(level.var_46F0)
	{
		return;
	}

	lib_A548::loadout(undefined,"iw5_sn6_sp",undefined,"fraggrenade","flash_grenade","viewmodel_base_viewhands");
	level.var_5982 = 1;
}