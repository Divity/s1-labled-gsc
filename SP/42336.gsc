/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42336.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 12
 * Decompile Time: 6 ms
 * Timestamp: 4/20/2022 8:23:21 PM
*******************************************************************/

//Function Number: 1
lib_A560::main()
{
	level.var_31D thread lib_A560::func_6C2D();
	level endon("new_quote_string");
	level.var_31D waittill("death",var_00,var_01,var_02,var_03);
	lib_A560::func_7DFD("");
	function_00D3("ammoCounterHide",1);
	function_00D3("hud_showstance",0);
	function_00D3("actionSlotsHide",1);
	lib_A5DE::snd_message("player_death");
	if(isdefined(var_03))
	{
		var_04 = level.var_31D.var_2E6 - level.var_31D geteye() + (0,0,35);
		var_05 = spawn("script_model",level.var_31D.var_2E6 + (0,0,var_04[2]));
		var_05.var_41 = (-10,level.var_31D.var_41[2],30);
		var_05 linkto(var_03);
		level.var_31D playerlinkto(var_05);
	}

	lib_A576::func_72D9(var_02,var_01);
	lib_A560::func_8A18(var_00,var_01,var_02);
}

//Function Number: 2
lib_A560::func_6C2D()
{
	self endon("death");
	self.var_55A3 = 0;
	for(;;)
	{
		while(!self method_812C())
		{
			wait(0.05);
		}

		self.var_55A3 = gettime();
		while(self method_812C())
		{
			wait(0.05);
		}
	}
}

//Function Number: 3
lib_A560::func_8A18(param_00,param_01,param_02)
{
	if(lib_A59A::func_5080())
	{
		return;
	}

	if(level.var_5CDB)
	{
		return;
	}

	lib_A560::func_7DFD("");
	if(param_01 != "MOD_GRENADE" && param_01 != "MOD_GRENADE_SPLASH" && param_01 != "MOD_SUICIDE" && param_01 != "MOD_EXPLOSIVE")
	{
		return;
	}

	if(level.gameskill >= 2)
	{
		if(!lib_A546::func_597F())
		{
			return;
		}
	}

	switch(param_01)
	{
		case "MOD_SUICIDE":
			break;

		case "MOD_EXPLOSIVE":
			break;

		case "MOD_GRENADE_SPLASH":
		case "MOD_GRENADE":
			break;

		default:
			break;
	}
}

//Function Number: 4
lib_A560::func_9C99(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(param_00.code_classname != "script_vehicle")
	{
		return 0;
	}

	level notify("new_quote_string");
	lib_A560::func_7DFD("@SCRIPT_EXPLODING_VEHICLE_DEATH");
	thread lib_A560::func_7DFE("hud_burningcaricon",96,96);
	return 1;
}

//Function Number: 5
lib_A560::func_2909(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(!isdefined(param_00.destructible_type))
	{
		return 0;
	}

	level notify("new_quote_string");
	if(issubstr(param_00.destructible_type,"vehicle"))
	{
		lib_A560::func_7DFD("@SCRIPT_EXPLODING_VEHICLE_DEATH");
		thread lib_A560::func_7DFE("hud_burningcaricon",96,96);
	}
	else
	{
		lib_A560::func_7DFD("@SCRIPT_EXPLODING_DESTRUCTIBLE_DEATH");
		thread lib_A560::func_7DFE("hud_destructibledeathicon",96,96);
	}

	return 1;
}

//Function Number: 6
lib_A560::func_353C(param_00)
{
	if(isdefined(level.var_559D))
	{
		if(gettime() != level.var_559D["time"])
		{
			return 0;
		}

		var_01 = distance(self.var_2E6,level.var_559D["origin"]);
		if(var_01 > level.var_559D["radius"])
		{
			return 0;
		}

		level notify("new_quote_string");
		lib_A560::func_7DFD("@SCRIPT_EXPLODING_BARREL_DEATH");
		thread lib_A560::func_7DFE("hud_burningbarrelicon",64,64);
		return 1;
	}

	return 0;
}

//Function Number: 7
lib_A560::func_7DFD(param_00)
{
	setdvar("ui_deadquote",param_00);
}

//Function Number: 8
lib_A560::func_2639(param_00)
{
	if(param_00 == getdvar("ui_deadquote_v1"))
	{
		return 1;
	}

	if(param_00 == getdvar("ui_deadquote_v2"))
	{
		return 1;
	}

	if(param_00 == getdvar("ui_deadquote_v3"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 9
lib_A560::func_5863(param_00)
{
	var_01 = tablelookup("sp/deathQuoteTable.csv",0,param_00,1);
	if(tolower(var_01[0]) != tolower("@"))
	{
		var_01 = "@" + var_01;
	}

	return var_01;
}

//Function Number: 10
lib_A560::func_43E2(param_00,param_01)
{
	level.var_31D.var_3613 = 1;
	lib_A560::func_7DFD("");
	wait(1.5);
	var_02 = newhudelem();
	var_02.elemtype = "font";
	var_02.font = "default";
	var_02.var_18C = 1.5;
	var_02.x = 0;
	var_02.y = -30;
	var_02.alignx = "center";
	var_02.aligny = "middle";
	var_02.horzalign = "center";
	var_02.vertalign = "middle";
	var_02 settext(param_00);
	var_02.foreground = 1;
	var_02.alpha = 0;
	var_02 fadeovertime(1);
	var_02.alpha = 1;
	if(isdefined(param_01))
	{
		var_02 = newhudelem();
		var_02.elemtype = "font";
		var_02.font = "default";
		var_02.var_18C = 1.5;
		var_02.x = 0;
		var_02.y = -25 + level.fontheight * var_02.var_18C;
		var_02.alignx = "center";
		var_02.aligny = "middle";
		var_02.horzalign = "center";
		var_02.vertalign = "middle";
		var_02 settext(param_01);
		var_02.foreground = 1;
		var_02.alpha = 0;
		var_02 fadeovertime(1);
		var_02.alpha = 1;
	}
}

//Function Number: 11
lib_A560::func_43E3()
{
	wait(1.5);
	var_00 = newhudelem();
	var_00.x = 0;
	var_00.y = 68;
	var_00 setshader("hud_grenadeicon",50,50);
	var_00.alignx = "center";
	var_00.aligny = "middle";
	var_00.horzalign = "center";
	var_00.vertalign = "middle";
	var_00.foreground = 1;
	var_00.alpha = 0;
	var_00 fadeovertime(1);
	var_00.alpha = 1;
	var_00 = newhudelem();
	var_00.x = 0;
	var_00.y = 25;
	var_00 setshader("hud_grenadepointer",50,25);
	var_00.alignx = "center";
	var_00.aligny = "middle";
	var_00.horzalign = "center";
	var_00.vertalign = "middle";
	var_00.foreground = 1;
	var_00.alpha = 0;
	var_00 fadeovertime(1);
	var_00.alpha = 1;
}

//Function Number: 12
lib_A560::func_7DFE(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 1.5;
	}

	wait(param_03);
	var_04 = newhudelem();
	var_04.x = 0;
	var_04.y = 40;
	var_04 setshader(param_00,param_01,param_02);
	var_04.alignx = "center";
	var_04.aligny = "middle";
	var_04.horzalign = "center";
	var_04.vertalign = "middle";
	var_04.foreground = 1;
	var_04.alpha = 0;
	var_04 fadeovertime(1);
	var_04.alpha = 1;
}