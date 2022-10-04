/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: battlechatter.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 174
 * Decompile Time: 7168 ms
 * Timestamp: 4/20/2022 8:20:05 PM
*******************************************************************/

//Function Number: 1
func_4CB5()
{
	if(isdefined(level.var_1CA5) && level.var_1CA5)
	{
		return;
	}

	setdvar("bcs_logErrorsAndRequests",0);
	setdvarifuninitialized("bcs_enable",1);
	if(getdvarint("bcs_enable") == 0)
	{
		anim.var_1CA5 = 0;
		level.var_31D.var_1CA5 = 0;
		return;
	}

	anim.var_1CA5 = 1;
	level.var_31D.var_1CA5 = 0;
	setdvarifuninitialized("bcs_filterThreat","off");
	setdvarifuninitialized("bcs_filterInform","off");
	setdvarifuninitialized("bcs_filterOrder","off");
	setdvarifuninitialized("bcs_filterReaction","off");
	setdvarifuninitialized("bcs_filterResponse","off");
	setdvarifuninitialized("bcs_forceEnglish","0");
	setdvarifuninitialized("bcs_allowsamevoiceresponse","off");
	setdvarifuninitialized("debug_bcprint","off");
	setdvarifuninitialized("debug_bcprintdump","off");
	setdvarifuninitialized("debug_bcprintdumptype","csv");
	setdvarifuninitialized("debug_bcshowqueue","off");
	anim.var_1344 = "^3***** BCS FAILURE: ";
	anim.var_1345 = "^3***** BCS WARNING: ";
	func_1352();
	func_1350();
	level.var_6D1C["american"] = "1";
	level.var_6D1C["seal"] = "1";
	level.var_6D1C["taskforce"] = "1";
	level.var_6D1C["secretservice"] = "1";
	level.var_6D1C["delta"] = "1";
	level.var_6D1C["xslice"] = "1";
	thread func_7FDE();
	func_4CEF();
	if(!isdefined(level.var_3A9F))
	{
		level.var_3A9F = 0;
	}

	anim.var_33DC = [];
	level.var_33DC["threat"] = [];
	level.var_33DC["response"] = [];
	level.var_33DC["reaction"] = [];
	level.var_33DC["order"] = [];
	level.var_33DC["inform"] = [];
	level.var_33DC["custom"] = [];
	level.var_33DC["direction"] = [];
	if(isdefined(level.var_669))
	{
		level.var_33D7["threat"]["self"] = 20000;
		level.var_33D7["threat"]["squad"] = 30000;
	}
	else
	{
		level.var_33D7["threat"]["self"] = 12500;
		level.var_33D7["threat"]["squad"] = 7500;
	}

	if(func_50A0())
	{
		level.var_33D7["threat"]["location_repeat"] = 3000;
	}
	else
	{
		level.var_33D7["threat"]["location_repeat"] = 15000;
	}

	level.var_33D7["response"]["self"] = 1000;
	level.var_33D7["response"]["squad"] = 1000;
	level.var_33D7["reaction"]["self"] = 1000;
	level.var_33D7["reaction"]["squad"] = 1000;
	level.var_33D7["order"]["self"] = 8000;
	level.var_33D7["order"]["squad"] = 10000;
	level.var_33D7["inform"]["self"] = 6000;
	level.var_33D7["inform"]["squad"] = 8000;
	level.var_33D7["custom"]["self"] = 0;
	level.var_33D7["custom"]["squad"] = 0;
	if(func_50A0())
	{
		level.var_33DC["playername"] = 7000;
	}
	else
	{
		level.var_33DC["playername"] = 50000;
	}

	level.var_33DC["reaction"]["casualty"] = 14000;
	level.var_33DC["reaction"]["friendlyfire"] = 5000;
	level.var_33DC["reaction"]["takingfire"] = 40000;
	level.var_33DC["reaction"]["ask_ok"] = 15000;
	level.var_33DC["reaction"]["taunt"] = 30000;
	level.var_33DC["inform"]["reloading"] = 20000;
	level.var_33DC["inform"]["killfirm"] = 15000;
	if(func_50A0())
	{
		level.var_33DA["threat"]["infantry"] = 1;
		level.var_33DA["threat"]["vehicle"] = 0.7;
		level.var_33DA["response"]["ack"] = 0;
		level.var_33DA["response"]["exposed"] = 0.8;
		level.var_33DA["response"]["callout"] = 1;
		level.var_33DA["response"]["echo"] = 0.9;
		level.var_33DA["reaction"]["casualty"] = 0.6;
		level.var_33DA["reaction"]["friendlyfire"] = 1;
		level.var_33DA["reaction"]["taunt"] = 0.2;
		level.var_33DA["order"]["action"] = 0;
		level.var_33DA["order"]["move"] = 0;
		level.var_33DA["order"]["displace"] = 0;
		level.var_33DA["inform"]["attack"] = 0.9;
		level.var_33DA["inform"]["incoming"] = 0.9;
		level.var_33DA["inform"]["reloading"] = 0.2;
		level.var_33DA["inform"]["suppressed"] = 0;
		level.var_33DA["inform"]["killfirm"] = 0.9;
		level.var_33DA["custom"]["generic"] = 0;
	}
	else
	{
		level.var_33DA["threat"]["infantry"] = 0.5;
		level.var_33DA["threat"]["vehicle"] = 0.7;
		level.var_33DA["response"]["ack"] = 0.9;
		level.var_33DA["response"]["exposed"] = 0.8;
		level.var_33DA["response"]["callout"] = 0.9;
		level.var_33DA["response"]["echo"] = 0.9;
		level.var_33DA["response"]["covering"] = 0.9;
		level.var_33DA["response"]["im"] = 0.9;
		level.var_33DA["reaction"]["casualty"] = 0.5;
		level.var_33DA["reaction"]["friendlyfire"] = 1;
		level.var_33DA["reaction"]["takingfire"] = 1;
		level.var_33DA["reaction"]["ask_ok"] = 1;
		level.var_33DA["reaction"]["taunt"] = 0.9;
		level.var_33DA["order"]["action"] = 0.3;
		level.var_33DA["order"]["move"] = 0.3;
		level.var_33DA["order"]["displace"] = 0.5;
		level.var_33DA["inform"]["attack"] = 0.9;
		level.var_33DA["inform"]["incoming"] = 0.9;
		level.var_33DA["inform"]["reloading"] = 0.2;
		level.var_33DA["inform"]["suppressed"] = 0.2;
		level.var_33DA["inform"]["killfirm"] = 0.7;
		level.var_33DA["custom"]["generic"] = 1;
	}

	level.var_33D9["threat"]["infantry"] = 1000;
	level.var_33D9["threat"]["vehicle"] = 1000;
	level.var_33D9["response"]["exposed"] = 2000;
	level.var_33D9["response"]["callout"] = 2000;
	level.var_33D9["response"]["echo"] = 2000;
	level.var_33D9["response"]["ack"] = 1750;
	level.var_33D9["response"]["covering"] = 1500;
	level.var_33D9["response"]["im"] = 1500;
	level.var_33D9["reaction"]["casualty"] = 2000;
	level.var_33D9["reaction"]["friendlyfire"] = 1000;
	level.var_33D9["reaction"]["takingfire"] = 1500;
	level.var_33D9["reaction"]["ask_ok"] = 1500;
	level.var_33D9["reaction"]["taunt"] = 2000;
	level.var_33D9["order"]["action"] = 3000;
	level.var_33D9["order"]["move"] = 3000;
	level.var_33D9["order"]["displace"] = 3000;
	level.var_33D9["inform"]["attack"] = 1000;
	level.var_33D9["inform"]["incoming"] = 1500;
	level.var_33D9["inform"]["reloading"] = 1000;
	level.var_33D9["inform"]["suppressed"] = 2000;
	level.var_33D9["inform"]["killfirm"] = 2000;
	level.var_33D9["custom"]["generic"] = 1000;
	if(func_50A0())
	{
		level.var_33D8["response"]["exposed"] = 65;
		level.var_33D8["response"]["reload"] = 55;
		level.var_33D8["response"]["callout"] = 99;
		level.var_33D8["response"]["callout_negative"] = 10;
		level.var_33D8["response"]["order"] = 0;
		level.var_33D8["moveEvent"]["coverme"] = 0;
		level.var_33D8["moveEvent"]["ordertoplayer"] = 0;
	}
	else
	{
		level.var_33D8["response"]["exposed"] = 75;
		level.var_33D8["response"]["reload"] = 65;
		level.var_33D8["response"]["callout"] = 75;
		level.var_33D8["response"]["callout_negative"] = 20;
		level.var_33D8["response"]["order"] = 40;
		level.var_33D8["moveEvent"]["coverme"] = 70;
		level.var_33D8["moveEvent"]["ordertoplayer"] = 10;
	}

	anim.var_3698 = 620;
	anim.var_369E = 12;
	anim.var_369D = 24;
	anim.var_369C = 2;
	anim.var_369B = 5;
	anim.var_5F60 = spawn("script_origin",(0,0,0));
	if(func_50A0())
	{
		if(!isdefined(level.var_134B))
		{
			level.var_134B = squared(3500);
		}

		if(!isdefined(level.var_134C))
		{
			level.var_134C = squared(4500);
		}
	}
	else
	{
		if(!isdefined(level.var_134B))
		{
			level.var_134B = squared(1500);
		}

		if(!isdefined(level.var_134C))
		{
			level.var_134C = squared(2500);
		}
	}

	level.var_479E = 96;
	level.var_5C41 = 8;
	level.var_5A2E = 45;
	common_scripts\_bcs_location_trigs::bcs_location_trigs_init();
	if(func_50A0())
	{
		anim.var_7B39 = 2000;
	}
	else
	{
		anim.var_7B39 = 4000;
	}

	anim.var_1354 = 3000;
	level.var_8AC3[level.var_8AC3.size] = ::func_4D5B;
	level.var_8AC4[level.var_8AC4.size] = "::init_squadBattleChatter";
	foreach(var_01 in level.var_91F9)
	{
		level.isteamspeaking[var_01] = 0;
		level.var_51CC[var_01]["threat"] = 0;
		level.var_51CC[var_01]["order"] = 0;
		level.var_51CC[var_01]["reaction"] = 0;
		level.var_51CC[var_01]["response"] = 0;
		level.var_51CC[var_01]["inform"] = 0;
		level.var_51CC[var_01]["custom"] = 0;
	}

	func_134F();
	func_1351();
	anim.var_55FF = [];
	anim.var_55BD = [];
	anim.var_55BE = [];
	foreach(var_01 in level.var_91F9)
	{
		level.var_55FF[var_01] = -50000;
		level.var_55BD[var_01] = "none";
		level.var_55BE[var_01] = -100000;
	}

	if(func_50A0())
	{
		anim.var_55BF = 1000;
	}
	else
	{
		anim.var_55BF = 120000;
	}

	for(var_05 = 0;var_05 < level.var_8AC8.size;var_05++)
	{
		if(isdefined(level.var_8AC8[var_05].var_1CA5) && level.var_8AC8[var_05].var_1CA5)
		{
			continue;
		}

		level.var_8AC8[var_05] func_4D5B();
	}

	anim.var_9320 = [];
	if(func_50A0())
	{
		level.var_9320["rpg"] = 0;
		level.var_9320["exposed"] = 25;
		level.var_9320["player_distance"] = 0;
		level.var_9320["player_obvious"] = 0;
		level.var_9320["player_contact_clock"] = 65;
		level.var_9320["player_target_clock"] = 0;
		level.var_9320["player_target_clock_high"] = 40;
		level.var_9320["player_cardinal"] = 0;
		level.var_9320["ai_distance"] = 0;
		level.var_9320["ai_obvious"] = 0;
		level.var_9320["ai_contact_clock"] = 65;
		level.var_9320["ai_target_clock"] = 0;
		level.var_9320["ai_target_clock_high"] = 40;
		level.var_9320["ai_cardinal"] = 0;
		level.var_9320["concat_location"] = 100;
		level.var_9320["player_location"] = 100;
		level.var_9320["ai_location"] = 100;
		level.var_9320["generic_location"] = 100;
	}
	else
	{
		level.var_9320["rpg"] = 80;
		level.var_9320["exposed"] = 25;
		level.var_9320["player_distance"] = 25;
		level.var_9320["player_obvious"] = 25;
		level.var_9320["player_contact_clock"] = 25;
		level.var_9320["player_target_clock"] = 25;
		level.var_9320["player_target_clock_high"] = 25;
		level.var_9320["player_cardinal"] = 20;
		level.var_9320["ai_distance"] = 25;
		level.var_9320["ai_obvious"] = 25;
		level.var_9320["ai_contact_clock"] = 20;
		level.var_9320["ai_casual_clock"] = 20;
		level.var_9320["ai_target_clock"] = 20;
		level.var_9320["ai_target_clock_high"] = 25;
		level.var_9320["ai_cardinal"] = 10;
		level.var_9320["concat_location"] = 90;
		level.var_9320["player_location"] = 90;
		level.var_9320["ai_location"] = 100;
		level.var_9320["generic_location"] = 95;
	}

	anim.var_5600 = [];
	anim.var_5601 = [];
	foreach(var_01 in level.var_91F9)
	{
		level.var_5600[var_01] = undefined;
		level.var_5601[var_01] = undefined;
	}

	if(func_50A0())
	{
		anim.var_91FD = 5000;
	}
	else
	{
		anim.var_91FD = 120000;
	}

	level notify("battlechatter initialized");
	anim notify("battlechatter initialized");
}

//Function Number: 2
func_1352()
{
	if(!isdefined(level.var_91F9))
	{
		anim.var_91F9 = [];
		level.var_91F9[level.var_91F9.size] = "axis";
		level.var_91F9[level.var_91F9.size] = "allies";
		level.var_91F9[level.var_91F9.size] = "team3";
		level.var_91F9[level.var_91F9.size] = "neutral";
	}
}

//Function Number: 3
func_1350()
{
	if(!isdefined(level.var_9BF1))
	{
		anim.var_9BF1 = [];
		anim.var_38CD = [];
		anim.var_2244 = [];
		func_1353("british","UK",2);
		func_1353("secretservice","SS",4);
		func_1353("french","FR",3);
		func_1353("czech","CZ",3);
		func_1353("pmc","PC",3);
		func_1353("russian","RU",3);
		func_1353("arab","AB",3);
		func_1353("portugese","PG",3);
		func_1353("african","AF",3);
		func_1353("american","US",3,1);
		func_1353("delta","GL",1);
		func_1353("taskforce","GM",1);
		func_1353("seal","GS",1);
		func_1353("shadowcompany","SP",6);
		func_1353("russian","SP",6);
		func_1353("xslice","XS",3);
	}
}

//Function Number: 4
func_1353(param_00,param_01,param_02,param_03)
{
	if(!isdefined(param_03))
	{
		param_03 = 0;
	}

	level.var_9BF1[param_00] = [];
	for(var_04 = 0;var_04 < param_02;var_04++)
	{
		level.var_9BF1[param_00][var_04] = spawnstruct();
		level.var_9BF1[param_00][var_04].count = 0;
		level.var_9BF1[param_00][var_04].var_624F = "" + var_04;
	}

	level.var_2244[param_00] = param_01;
	level.var_38CD[param_00] = param_03;
}

//Function Number: 5
func_134F()
{
	func_1352();
	if(!isdefined(level.var_132D))
	{
		level.var_132D = [];
		foreach(var_01 in level.var_91F9)
		{
			lib_A59A::func_7DDA(var_01,1);
		}
	}
}

//Function Number: 6
func_1351()
{
	func_1352();
	if(!isdefined(level.var_38C9))
	{
		level.var_38C9 = [];
		foreach(var_01 in level.var_91F9)
		{
			level.var_38C9[var_01] = 1;
		}
	}
}

//Function Number: 7
func_4CEF()
{
	level.var_38C9["american"] = [];
	var_00 = 41;
	for(var_01 = 0;var_01 < var_00;var_01++)
	{
		level.var_38C9["american"][var_01] = lib_A59A::func_8F4D(var_01 + 1);
	}

	level.var_38C9["shadowcompany"] = [];
	var_00 = 9;
	for(var_01 = 1;var_01 <= var_00;var_01++)
	{
		level.var_38C9["shadowcompany"][var_01] = lib_A59A::func_8F4D(var_01 + 1);
	}

	anim.var_38CC = [];
}

//Function Number: 8
func_8545()
{
	anim.var_2244 = undefined;
	anim.var_33DC = undefined;
	anim.var_33D7 = undefined;
	anim.var_33DC = undefined;
	anim.var_33DA = undefined;
	anim.var_33D9 = undefined;
	anim.var_5F60 = undefined;
	anim.var_7B39 = undefined;
	anim.var_1354 = undefined;
	anim.locationlastcallouttimes = undefined;
	anim.var_9BF1 = undefined;
	anim.var_38CC = undefined;
	anim.var_5600 = undefined;
	anim.var_5601 = undefined;
	anim.var_55BF = undefined;
	anim.var_55BD = undefined;
	anim.var_55BE = undefined;
	anim.var_1CA5 = 0;
	level.var_31D.var_1CA5 = 0;
	level.var_132D = undefined;
	anim.bcs_locations = undefined;
	for(var_00 = 0;var_00 < level.var_8AC3.size;var_00++)
	{
		if(level.var_8AC4[var_00] != "::init_squadBattleChatter")
		{
			continue;
		}

		if(var_00 != level.var_8AC3.size - 1)
		{
			level.var_8AC3[var_00] = level.var_8AC3[level.var_8AC3.size - 1];
			level.var_8AC4[var_00] = level.var_8AC4[level.var_8AC4.size - 1];
		}

		level.var_8AC3[level.var_8AC3.size - 1] = undefined;
		level.var_8AC4[level.var_8AC4.size - 1] = undefined;
	}

	level notify("battlechatter disabled");
	anim notify("battlechatter disabled");
}

//Function Number: 9
func_4D5B()
{
	var_00 = self;
	if(func_50A0())
	{
		var_00.var_62AB = 0;
		var_00.var_5A51 = 2;
	}
	else
	{
		var_00.var_62AB = 0;
		var_00.var_5A51 = 1;
	}

	var_00.var_60D7 = gettime() + 50;
	var_00.var_60D8["threat"] = gettime() + 50;
	var_00.var_60D8["order"] = gettime() + 50;
	var_00.var_60D8["reaction"] = gettime() + 50;
	var_00.var_60D8["response"] = gettime() + 50;
	var_00.var_60D8["inform"] = gettime() + 50;
	var_00.var_60D8["custom"] = gettime() + 50;
	var_00.var_60DC["threat"] = [];
	var_00.var_60DC["order"] = [];
	var_00.var_60DC["reaction"] = [];
	var_00.var_60DC["response"] = [];
	var_00.var_60DC["inform"] = [];
	var_00.var_60DC["custom"] = [];
	var_00.var_514E["threat"] = 0;
	var_00.var_514E["order"] = 0;
	var_00.var_514E["reaction"] = 0;
	var_00.var_514E["response"] = 0;
	var_00.var_514E["inform"] = 0;
	var_00.var_514E["custom"] = 0;
	var_00.var_5592 = "";
	var_00.var_5B9A[var_00.var_5B9A.size] = ::animscripts\battlechatter_ai::func_850;
	var_00.var_5B9B[var_00.var_5B9B.size] = "::addToSystem";
	var_00.var_5BA1[var_00.var_5BA1.size] = ::animscripts\battlechatter_ai::func_73AB;
	var_00.var_5BA2[var_00.var_5BA2.size] = "::removeFromSystem";
	var_00.var_8AD3[var_00.var_8AD3.size] = ::func_4DA0;
	var_00.var_8AD4[var_00.var_8AD4.size] = "::initContact";
	var_00.var_3699 = 1;
	var_00.var_369A = undefined;
	for(var_01 = 0;var_01 < level.var_8AC8.size;var_01++)
	{
		var_00 thread func_4DA0(level.var_8AC8[var_01].var_3F0);
	}

	var_00 thread animscripts\battlechatter_ai::func_8AD1();
	var_00 thread animscripts\battlechatter_ai::func_8ACD();
	var_00 thread func_8AC5();
	var_00.var_1CA5 = 1;
	var_00 notify("squad chat initialized");
}

//Function Number: 10
func_8548()
{
	var_00 = self;
	var_00.var_62AB = undefined;
	var_00.var_5A51 = undefined;
	var_00.var_60D7 = undefined;
	var_00.var_60D8 = undefined;
	var_00.var_60DC = undefined;
	var_00.var_514E = undefined;
	var_00.var_3699 = undefined;
	var_00.var_369A = undefined;
	for(var_01 = 0;var_01 < var_00.var_5B9A.size;var_01++)
	{
		if(var_00.var_5B9B[var_01] != "::addToSystem")
		{
			continue;
		}

		if(var_01 != var_00.var_5B9A.size - 1)
		{
			var_00.var_5B9A[var_01] = var_00.var_5B9A[var_00.var_5B9A.size - 1];
			var_00.var_5B9B[var_01] = var_00.var_5B9B[var_00.var_5B9B.size - 1];
		}

		var_00.var_5B9A[var_00.var_5B9A.size - 1] = undefined;
		var_00.var_5B9B[var_00.var_5B9B.size - 1] = undefined;
	}

	for(var_01 = 0;var_01 < var_00.var_5BA1.size;var_01++)
	{
		if(var_00.var_5BA2[var_01] != "::removeFromSystem")
		{
			continue;
		}

		if(var_01 != var_00.var_5BA1.size - 1)
		{
			var_00.var_5BA1[var_01] = var_00.var_5BA1[var_00.var_5BA1.size - 1];
			var_00.var_5BA2[var_01] = var_00.var_5BA2[var_00.var_5BA2.size - 1];
		}

		var_00.var_5BA1[var_00.var_5BA1.size - 1] = undefined;
		var_00.var_5BA2[var_00.var_5BA2.size - 1] = undefined;
	}

	for(var_01 = 0;var_01 < var_00.var_8AD3.size;var_01++)
	{
		if(var_00.var_8AD4[var_01] != "::initContact")
		{
			continue;
		}

		if(var_01 != var_00.var_8AD3.size - 1)
		{
			var_00.var_8AD3[var_01] = var_00.var_8AD3[var_00.var_8AD3.size - 1];
			var_00.var_8AD4[var_01] = var_00.var_8AD4[var_00.var_8AD4.size - 1];
		}

		var_00.var_8AD3[var_00.var_8AD3.size - 1] = undefined;
		var_00.var_8AD4[var_00.var_8AD4.size - 1] = undefined;
	}

	for(var_01 = 0;var_01 < level.var_8AC8.size;var_01++)
	{
		var_00 func_8549(level.var_8AC8[var_01].var_3F0);
	}

	var_00.var_1CA5 = 0;
}

//Function Number: 11
func_1357()
{
	if(isdefined(level.var_1CA5))
	{
		return level.var_1CA5;
	}

	return 0;
}

//Function Number: 12
func_1356()
{
	var_00 = getdvarint("bcs_enable");
	var_01 = getdvarint("bcs_enable");
	if(var_01 != var_00)
	{
		switch(var_01)
		{
			case 1:
				break;

			case 0:
				break;
		}
	}
}

//Function Number: 13
enablebattlechatter()
{
	func_4CB5();
	level.var_31D thread animscripts\battlechatter_ai::func_850();
	var_00 = function_00D6();
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_00[var_01] animscripts\battlechatter_ai::func_850();
	}
}

//Function Number: 14
disablebattlechatter()
{
	if(!isdefined(level.var_1CA5))
	{
		return;
	}

	func_8545();
	var_00 = function_00D6();
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(isdefined(var_00[var_01].var_8AAA) && var_00[var_01].var_8AAA.var_1CA5)
		{
			var_00[var_01].var_8AAA func_8548();
		}

		var_00[var_01] animscripts\battlechatter_ai::func_73AB();
	}
}

//Function Number: 15
func_7FDE(param_00,param_01)
{
	if(isdefined(param_00) && isdefined(param_01))
	{
		level.var_31D.var_1343 = param_00;
		level.var_31D.var_2243 = param_01;
		return;
	}

	while(!isdefined(level.var_1A3D))
	{
		wait(0.1);
	}

	var_02 = level.var_1A3D;
	var_03 = level.var_6D1C[var_02];
	var_04 = level.var_2244[var_02];
	if(isdefined(var_03))
	{
		level.var_31D.var_1343 = var_03;
	}

	if(isdefined(var_04))
	{
		level.var_31D.var_2243 = var_04;
	}
}

//Function Number: 16
func_6A2B()
{
	if(!isalive(self))
	{
		return;
	}

	if(!func_1357())
	{
		return;
	}

	if(self.var_550 > 0)
	{
		return;
	}

	if(isdefined(self.var_51B0) && self.var_51B0)
	{
		return;
	}

	if(self.inliveplayerkillstreak == "allies" && isdefined(level.var_7B3A))
	{
		if(level.var_7B3A + level.var_7B39 > gettime())
		{
			return;
		}
	}

	if(func_3A9E())
	{
		return;
	}

	if(!isdefined(self.var_132D) || !self.var_132D)
	{
		return;
	}

	if(self.inliveplayerkillstreak == "allies" && getdvarint("bcs_forceEnglish",0))
	{
		return;
	}

	if(level.isteamspeaking[self.inliveplayerkillstreak])
	{
		return;
	}

	self endon("death");
	var_00 = func_3FC5();
	if(!isdefined(var_00))
	{
		return;
	}

	switch(var_00)
	{
		case "custom":
			break;

		case "response":
			break;

		case "order":
			break;

		case "threat":
			break;

		case "reaction":
			break;

		case "inform":
			break;
	}
}

//Function Number: 17
func_6DE0()
{
	self endon("death");
	self endon("removed from battleChatter");
	self endon("cancel speaking");
	self.var_24C5 = self.var_1CA6["threat"];
	var_00 = self.var_1CA6["threat"].var_9310;
	if(!isalive(var_00))
	{
		return;
	}

	if(func_932D(var_00) && !isplayer(var_00))
	{
		return;
	}

	anim thread func_5805(self,"threat");
	var_01 = 0;
	switch(self.var_1CA6["threat"].eventtype)
	{
		case "infantry":
			break;

		case "dog":
			break;

		case "vehicle":
			break;
	}
}

//Function Number: 18
func_932D(param_00)
{
	if(isdefined(param_00.var_1A07) && isdefined(param_00.var_1A07[self.var_8AAA.var_3F0]))
	{
		if(param_00.var_1A07[self.var_8AAA.var_3F0].var_351A < gettime())
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 19
func_9324(param_00,param_01)
{
	self endon("cancel speaking");
	var_02 = func_23EB();
	var_02.var_59D5 = 1;
	var_02.var_9323 = param_00;
	var_03 = func_4122(param_00);
	if(!isdefined(var_03) || isdefined(var_03) && !isdefined(var_03.type))
	{
		return 0;
	}

	switch(var_03.type)
	{
		case "rpg":
			break;

		case "exposed":
			break;

		case "player_obvious":
			break;

		case "player_distance":
			break;

		case "player_contact_clock":
			break;

		case "player_target_clock":
			break;

		case "player_target_clock_high":
			break;

		case "player_cardinal":
			break;

		case "ai_obvious":
			break;

		case "ai_distance":
			break;

		case "ai_contact_clock":
			break;

		case "ai_casual_clock":
			break;

		case "ai_target_clock":
			break;

		case "ai_target_clock_high":
			break;

		case "ai_cardinal":
			break;

		case "generic_location":
			break;

		case "player_location":
			break;

		case "concat_location":
			break;

		case "ai_location":
			break;
	}
}

//Function Number: 20
func_2C3A(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(param_00.var_2243 != "US" && param_00.var_2243 != "NS" && param_00.var_2243 != "TF")
	{
		return 0;
	}

	if(randomint(100) > level.var_33D8["response"]["exposed"])
	{
		return 0;
	}

	return 1;
}

//Function Number: 21
func_9325(param_00,param_01)
{
	var_02 = func_083B(param_00.location,param_01);
	return var_02;
}

//Function Number: 22
func_07CE(param_00,param_01,param_02)
{
	if(!isdefined(param_01.var_7479))
	{
		return;
	}

	if(randomint(100) > level.var_33D8["response"]["callout"])
	{
		return;
	}

	var_03 = "affirm";
	if(!param_01.var_7479 method_81BE(param_02) && randomint(100) < level.var_33D8["response"]["callout_negative"])
	{
		var_03 = "neg";
	}

	param_01.var_7479 animscripts\battlechatter_ai::func_826("callout",var_03,param_00,0.9);
}

//Function Number: 23
func_4122(param_00)
{
	var_01 = param_00 getvalidlocation(self);
	var_02 = func_3F5A(self.var_41,self.var_2E6,param_00.var_2E6);
	var_03 = func_40B6(64,1024,"response");
	var_04 = undefined;
	if(isdefined(var_03))
	{
		var_04 = func_3F5A(var_03.var_41,var_03.var_2E6,param_00.var_2E6);
	}

	var_05 = func_3F5A(level.var_31D.var_41,level.var_31D.var_2E6,param_00.var_2E6);
	if(self.inliveplayerkillstreak == "allies")
	{
		var_06 = var_05;
		var_07 = level.var_31D;
	}
	else if(isdefined(var_05))
	{
		var_06 = var_06;
		var_07 = var_04;
	}
	else
	{
		var_06 = var_04;
		var_07 = self;
	}

	var_08 = func_3F5D(var_07.var_2E6,param_00.var_2E6);
	self.var_6E64 = [];
	if(!isplayer(param_00) && param_00 animscripts\utility::func_9C2E())
	{
		func_081F("rpg");
	}

	if(!isdefined(var_01) && param_00 func_5100(0))
	{
		func_081F("exposed");
	}

	if(self.inliveplayerkillstreak == "allies")
	{
		var_09 = 0;
		if(param_00.var_2E6[2] - var_07.var_2E6[2] >= level.var_479E)
		{
			if(func_081F("player_target_clock_high"))
			{
				var_09 = 1;
			}
		}

		if(!var_09)
		{
			if(var_06 == "12")
			{
				func_081F("player_obvious");
				if(var_08 > level.var_5C41 && var_08 < level.var_5A2E)
				{
					func_081F("player_distance");
				}
			}

			if(func_1ADF() && var_06 != "12")
			{
				func_081F("player_contact_clock");
				func_081F("player_target_clock");
				func_081F("player_cardinal");
			}
		}
	}

	var_09 = 0;
	if(param_00.var_2E6[2] - var_07.var_2E6[2] >= level.var_479E)
	{
		if(func_081F("ai_target_clock_high"))
		{
			var_09 = 1;
		}
	}

	func_081F("ai_casual_clock");
	if(!var_09)
	{
		if(var_06 == "12")
		{
			func_081F("ai_distance");
			if(var_08 > level.var_5C41 && var_08 < level.var_5A2E)
			{
				func_081F("ai_obvious");
			}
		}

		func_081F("ai_contact_clock");
		func_081F("ai_target_clock");
		func_081F("ai_cardinal");
	}

	if(isdefined(var_01))
	{
		if(canconcat(var_01))
		{
			func_081F("concat_location");
		}
		else if(isdefined(var_01 getcannedresponse(self)))
		{
			if(isdefined(var_03))
			{
				func_081F("ai_location");
			}
			else
			{
				if(func_1ADF())
				{
					func_081F("player_location");
				}

				func_081F("generic_location");
			}
		}
		else
		{
			if(isdefined(var_03))
			{
				func_081F("ai_location");
			}

			if(func_1ADF())
			{
				func_081F("player_location");
			}

			func_081F("generic_location");
		}
	}

	if(!self.var_6E64.size)
	{
		return undefined;
	}

	var_0B = func_416B(self.var_6E64,level.var_9320);
	var_0C = spawnstruct();
	var_0C.type = var_0B;
	var_0C.var_7479 = var_03;
	var_0C.var_747A = var_04;
	var_0C.var_6C79 = var_05;
	if(isdefined(var_01))
	{
		var_0C.location = var_01;
	}

	return var_0C;
}

//Function Number: 24
cancalloutlocation(param_00)
{
	foreach(var_02 in param_00.locationaliases)
	{
		var_03 = getloccalloutalias("co_loc_" + var_02);
		var_04 = getqacalloutalias(var_02,0);
		var_05 = getloccalloutalias("concat_loc_" + var_02);
		var_06 = soundexists(var_03) || soundexists(var_04) || soundexists(var_05);
		if(var_06)
		{
			return var_06;
		}
	}

	return 0;
}

//Function Number: 25
canconcat(param_00)
{
	var_01 = param_00.locationaliases;
	foreach(var_03 in var_01)
	{
		if(iscallouttypeconcat(var_03,self))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 26
getcannedresponse(param_00)
{
	var_01 = undefined;
	var_02 = self.locationaliases;
	foreach(var_04 in var_02)
	{
		if(iscallouttypeqa(var_04,param_00) && !isdefined(self.qafinished))
		{
			var_01 = var_04;
			break;
		}

		if(iscallouttypereport(var_04))
		{
			var_01 = var_04;
		}
	}

	return var_01;
}

//Function Number: 27
iscallouttypereport(param_00)
{
	return issubstr(param_00,"_report");
}

//Function Number: 28
iscallouttypeconcat(param_00,param_01)
{
	var_02 = param_01 getloccalloutalias("concat_loc_" + param_00);
	if(soundexists(var_02))
	{
		return 1;
	}

	return 0;
}

//Function Number: 29
iscallouttypeqa(param_00,param_01)
{
	if(issubstr(param_00,"_qa") && soundexists(param_00))
	{
		return 1;
	}

	var_02 = param_01 getqacalloutalias(param_00,0);
	if(soundexists(var_02))
	{
		return 1;
	}

	return 0;
}

//Function Number: 30
getloccalloutalias(param_00)
{
	var_01 = self.var_2243 + "_" + self.var_624F + "_";
	var_01 = var_01 + param_00;
	return var_01;
}

//Function Number: 31
getqacalloutalias(param_00,param_01)
{
	var_02 = getloccalloutalias("co_loc_" + param_00);
	var_02 = var_02 + "_qa" + param_01;
	return var_02;
}

//Function Number: 32
func_07C8(param_00)
{
	self.var_AA4[self.var_AA4.size] = param_00;
}

//Function Number: 33
func_081F(param_00)
{
	var_01 = 0;
	foreach(var_03 in self.var_AA4)
	{
		if(var_03 == param_00)
		{
			if(!func_1A0A(param_00))
			{
				var_01 = 1;
			}

			break;
		}
	}

	if(!var_01)
	{
		return var_01;
	}

	self.var_6E64[self.var_6E64.size] = param_00;
	return var_01;
}

//Function Number: 34
func_1A0A(param_00)
{
	if(!isdefined(level.var_5600[self.inliveplayerkillstreak]))
	{
		return 0;
	}

	if(!isdefined(level.var_5601[self.inliveplayerkillstreak]))
	{
		return 0;
	}

	var_01 = level.var_5600[self.inliveplayerkillstreak];
	var_02 = level.var_5601[self.inliveplayerkillstreak];
	var_03 = level.var_91FD;
	if(param_00 == var_01 && gettime() - var_02 < var_03)
	{
		return 1;
	}

	return 0;
}

//Function Number: 35
func_7F97(param_00)
{
	level.var_5600[self.inliveplayerkillstreak] = param_00;
	level.var_5601[self.inliveplayerkillstreak] = gettime();
}

//Function Number: 36
func_416B(param_00,param_01)
{
	var_02 = undefined;
	var_03 = -1;
	foreach(var_05 in param_00)
	{
		if(param_01[var_05] <= 0)
		{
			continue;
		}

		var_06 = randomint(param_01[var_05]);
		if(isdefined(var_02) && param_01[var_02] >= 100)
		{
			if(param_01[var_05] < 100)
			{
				continue;
			}

			continue;
		}

		if(param_01[var_05] >= 100)
		{
			var_02 = var_05;
			var_03 = var_06;
			continue;
		}

		if(var_06 > var_03)
		{
			var_02 = var_05;
			var_03 = var_06;
		}
	}

	return var_02;
}

//Function Number: 37
func_9322(param_00,param_01)
{
	self endon("cancel speaking");
	var_02 = func_23EB();
	var_02.var_59D5 = 1;
	var_02.var_9323 = param_00;
	var_02 func_0837("dog","generic");
	func_6DCD(var_02);
	return 1;
}

//Function Number: 38
func_9326(param_00)
{
	var_01 = [];
	var_01 = common_scripts\utility::array_add(var_01,"open");
	if(self.owner.var_2243 != "GS")
	{
		var_01 = common_scripts\utility::array_add(var_01,"breaking");
	}

	if(self.owner.inliveplayerkillstreak == "allies" && self.owner.var_2243 != "RU")
	{
		var_01 = common_scripts\utility::array_add(var_01,"movement");
	}

	var_02 = var_01[randomint(var_01.size)];
	func_0841(var_02);
}

//Function Number: 39
func_9327(param_00)
{
	func_0837("rpg");
}

//Function Number: 40
func_6DCF()
{
	self endon("death");
	self endon("removed from battleChatter");
	self.var_24C5 = self.var_1CA6["reaction"];
	var_00 = self.var_1CA6["reaction"].var_71CC;
	var_01 = self.var_1CA6["reaction"].var_5D44;
	anim thread func_5805(self,"reaction");
	switch(self.var_1CA6["reaction"].eventtype)
	{
		case "casualty":
			break;

		case "taunt":
			break;

		case "friendlyfire":
			break;

		case "takingfire":
			break;

		case "ask_ok":
			break;
	}
}

//Function Number: 41
func_7185(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_02 = func_23EB();
	var_02 func_0823("casualty","generic");
	func_6DCD(var_02);
}

//Function Number: 42
func_7189(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_02 = func_23EB();
	if(isdefined(param_01) && param_01 == "hostileburst")
	{
		var_02 func_07E5();
	}
	else
	{
		var_02 func_0836("taunt","generic");
	}

	func_6DCD(var_02);
}

//Function Number: 43
func_7186(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_02 = func_23EB();
	var_02 func_07D7();
	func_6DCD(var_02);
}

//Function Number: 44
func_7188(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_02 = func_23EB();
	var_02 func_0835();
	func_6DCD(var_02);
}

//Function Number: 45
func_7483(param_00,param_01,param_02)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_03 = func_23EB();
	var_03 func_0825(param_01,param_02);
	func_6DCD(var_03);
}

//Function Number: 46
func_6DD0()
{
	self endon("death");
	self endon("removed from battleChatter");
	self.var_24C5 = self.var_1CA6["response"];
	var_00 = self.var_1CA6["response"].var_5D44;
	var_01 = self.var_1CA6["response"].var_747B;
	if(!isalive(var_01))
	{
		return;
	}

	if(self.var_1CA6["response"].var_5D44 == "follow" && self.var_7.state != "move")
	{
		return;
	}

	anim thread func_5805(self,"response");
	switch(self.var_1CA6["response"].eventtype)
	{
		case "exposed":
			break;

		case "callout":
			break;

		case "ack":
			break;

		default:
			break;
	}
}

//Function Number: 47
func_7485(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!isalive(param_00))
	{
		return;
	}

	var_02 = func_23EB();
	var_02 func_0841(param_01);
	var_02.var_261 = param_00;
	var_02.var_59D5 = 1;
	func_6DCD(var_02);
}

//Function Number: 48
func_7484(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!isalive(param_00))
	{
		return;
	}

	var_02 = func_23EB();
	var_03 = 0;
	if(param_01 == "echo")
	{
		var_03 = var_02 func_0839(self.var_24C5.var_7402,param_00);
	}
	else if(param_01 == "QA")
	{
		var_03 = var_02 func_083C(param_00,self.var_24C5.var_7402,self.var_24C5.location);
	}
	else
	{
		var_03 = var_02 func_083D(param_01);
	}

	if(!var_03)
	{
		return;
	}

	var_02.var_261 = param_00;
	var_02.var_59D5 = 1;
	func_6DCD(var_02);
}

//Function Number: 49
func_7482(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!isalive(param_00))
	{
		return;
	}

	var_02 = self.var_1CA6["response"].eventtype;
	var_03 = func_23EB();
	var_03 func_0825(var_02,param_01);
	var_03.var_261 = param_00;
	var_03.var_59D5 = 1;
	func_6DCD(var_03);
}

//Function Number: 50
func_6DC9()
{
	self endon("death");
	self endon("removed from battleChatter");
	self.var_24C5 = self.var_1CA6["order"];
	var_00 = self.var_1CA6["order"].var_5D44;
	var_01 = self.var_1CA6["order"].var_657D;
	anim thread func_5805(self,"order");
	switch(self.var_1CA6["order"].eventtype)
	{
		case "action":
			break;

		case "move":
			break;

		case "displace":
			break;
	}
}

//Function Number: 51
func_6579(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_02 = func_23EB();
	func_989A(var_02,param_01);
	var_02 func_081A("action",param_00);
	func_6DCD(var_02);
}

//Function Number: 52
func_657B(param_00,param_01)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_02 = func_23EB();
	func_989A(var_02,param_01);
	var_02 func_081A("move",param_00);
	func_6DCD(var_02);
}

//Function Number: 53
func_657A(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_01 = func_23EB();
	var_01 func_081A("displace",param_00);
	func_6DCD(var_01,1);
}

//Function Number: 54
func_989A(param_00,param_01)
{
	if(randomint(100) > level.var_33D8["response"]["order"])
	{
		if(!isdefined(param_01) || isdefined(param_01) && !isplayer(param_01))
		{
			return;
		}
	}

	if(isdefined(param_01) && isplayer(param_01) && isdefined(level.var_31D.var_1343))
	{
		param_00 func_081D();
		param_00.var_261 = level.var_31D;
		return;
	}

	if(isdefined(param_01) && func_1ADE(param_01))
	{
		param_00 func_0802(param_01.var_1342);
		param_00.var_261 = param_01;
		param_01 animscripts\battlechatter_ai::func_826("ack","yes",self,0.9);
		return;
	}

	level notify("follow order",self);
}

//Function Number: 55
func_6DAC()
{
	self endon("death");
	self endon("removed from battleChatter");
	self.var_24C5 = self.var_1CA6["inform"];
	var_00 = self.var_1CA6["inform"].var_5D44;
	anim thread func_5805(self,"inform");
	switch(self.var_1CA6["inform"].eventtype)
	{
		case "incoming":
			break;

		case "attack":
			break;

		case "reloading":
			break;

		case "suppressed":
			break;

		case "killfirm":
			break;
	}
}

//Function Number: 56
func_4C61(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_01 = func_23EB();
	var_01 func_07E6("reloading",param_00);
	func_6DCD(var_01);
}

//Function Number: 57
func_4C62(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_01 = func_23EB();
	var_01 func_07E6("suppressed",param_00);
	func_6DCD(var_01);
}

//Function Number: 58
func_4C5F(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_01 = func_23EB();
	if(param_00 == "grenade")
	{
		var_01.var_59D5 = 1;
	}

	var_01 func_07E6("incoming",param_00);
	func_6DCD(var_01);
}

//Function Number: 59
func_4C5E(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_01 = func_23EB();
	var_01 func_07E6("attack",param_00);
	func_6DCD(var_01);
}

//Function Number: 60
func_4C60(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	var_01 = func_23EB();
	var_01 func_07E6("killfirm",param_00);
	func_6DCD(var_01);
}

//Function Number: 61
func_6A38()
{
	self endon("death");
	self endon("removed from battleChatter");
	self.var_24C5 = self.var_1CA6["custom"];
	anim thread func_5805(self,self.var_24C5.type,1);
	func_6DCD(self.var_2557);
	self notify("done speaking");
	self.var_2556 = undefined;
	self.var_2557 = undefined;
}

//Function Number: 62
func_6DCD(param_00,param_01)
{
	anim endon("battlechatter disabled");
	self endon("dog_attacks_ai");
	self endon("death");
	if(isdefined(param_01))
	{
		return;
	}

	if(battlechatter_canprint() || battlechatter_canprintdump())
	{
		var_02 = [];
		foreach(var_04 in param_00.var_88A3)
		{
			var_02[var_02.size] = var_04;
		}

		if(battlechatter_canprint())
		{
			battlechatter_print(var_02);
		}

		if(battlechatter_canprintdump())
		{
			var_06 = self.var_24C5.var_33D6 + "_" + self.var_24C5.eventtype;
			if(isdefined(self.var_24C5.var_5D44))
			{
				var_06 = var_06 + "_" + self.var_24C5.var_5D44;
			}

			thread battlechatter_printdump(var_02,var_06);
		}
	}

	for(var_07 = 0;var_07 < param_00.var_88A3.size;var_07++)
	{
		if(!self.var_132D)
		{
			if(!func_502A(self.var_24C5))
			{
			}
			else
			{
			}
			else if(!func_1A4C(0))
			{
			}
			else if(self.var_550 > 0)
			{
			}
			else if(func_5102(self.var_24C5.var_33D6))
			{
				wait(0.85);
			}
			else if(!soundexists(param_00.var_88A3[var_07]))
			{
			}
			else
			{
				var_08 = gettime();
				var_09 = spawn("script_origin",self gettagorigin("j_head"));
				var_09 linkto(self);
				thread func_8EC5(param_00.var_88A3[var_07],var_09);
				if(param_00.var_59D5 && self.inliveplayerkillstreak == "allies")
				{
					thread lib_A506::func_BC4(param_00.var_88A3[var_07],param_00.var_261);
					var_09 playsoundasmaster(param_00.var_88A3[var_07],param_00.var_88A3[var_07],1);
					var_09 waittill(param_00.var_88A3[var_07]);
					self notify(param_00.var_88A3[var_07]);
				}
				else
				{
					thread lib_A506::func_BC4(param_00.var_88A3[var_07],param_00.var_261);
					if(getdvarint("bcs_forceEnglish",0))
					{
						var_09 playsoundasmaster(param_00.var_88A3[var_07],param_00.var_88A3[var_07],1);
					}
					else
					{
						var_09 playsoundasmaster(param_00.var_88A3[var_07],param_00.var_88A3[var_07],1);
					}

					var_09 waittill(param_00.var_88A3[var_07]);
					self notify(param_00.var_88A3[var_07]);
				}

				var_09 delete();
				if(gettime() < var_08 + 250)
				{
				}
			}
		}
	}

	self notify("playPhrase_done");
	func_2D8A(self.var_24C5.var_33D6,self.var_24C5.eventtype);
}

//Function Number: 63
func_8EC5(param_00,param_01)
{
	param_01 endon("death");
	common_scripts\utility::waittill_either("death","dog_attacks_ai");
	param_01 stopsounds();
	wait 0.05;
	param_01 notify(param_00);
	param_01 delete();
}

//Function Number: 64
func_502A(param_00)
{
	if(!isdefined(param_00.var_33D6) || !isdefined(param_00.eventtype))
	{
		return 0;
	}

	if(param_00.var_33D6 == "reaction" && param_00.eventtype == "friendlyfire")
	{
		return 1;
	}

	return 0;
}

//Function Number: 65
func_51B1(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	wait(25);
	func_1EF1(param_00);
}

//Function Number: 66
func_1EF1(param_00)
{
	self.var_51B0 = 0;
	self.var_1CA6[param_00].var_351A = 0;
	self.var_1CA6[param_00].priority = 0;
	self.var_60D8[param_00] = gettime() + level.var_33D7[param_00]["self"];
}

//Function Number: 67
func_5805(param_00,param_01,param_02)
{
	anim endon("battlechatter disabled");
	var_03 = param_00.var_8AAA;
	var_04 = param_00.inliveplayerkillstreak;
	param_00.var_51B0 = 1;
	param_00 thread func_51B1(param_01);
	var_03.var_514E[param_01] = 1;
	var_03.var_62AB++;
	level.isteamspeaking[var_04] = 1;
	level.var_51CC[var_04][param_01] = 1;
	var_05 = param_00 common_scripts\utility::waittill_any_return("death","done speaking","cancel speaking");
	var_03.var_514E[param_01] = 0;
	var_03.var_62AB--;
	level.isteamspeaking[var_04] = 0;
	level.var_51CC[var_04][param_01] = 0;
	if(var_05 == "cancel speaking")
	{
		return;
	}

	level.var_55FF[var_04] = gettime();
	if(isalive(param_00))
	{
		param_00 func_1EF1(param_01);
	}

	var_03.var_60D8[param_01] = gettime() + level.var_33D7[param_01]["squad"];
}

//Function Number: 68
func_9B02(param_00,param_01)
{
	if(gettime() - self.var_8ACA[param_00].var_5589 > 10000)
	{
		var_02 = 0;
		for(var_03 = 0;var_03 < self.var_5BA3.size;var_03++)
		{
			if(self.var_5BA3[var_03] != param_01 && isalive(self.var_5BA3[var_03].enemy) && isdefined(self.var_5BA3[var_03].enemy.var_8AAA) && self.var_5BA3[var_03].enemy.var_8AAA.var_3F0 == param_00)
			{
				var_02 = 1;
			}
		}

		if(!var_02)
		{
			self.var_8ACA[param_00].var_3817 = gettime();
			self.var_8ACA[param_00].var_1A07 = 0;
		}
	}

	self.var_8ACA[param_00].var_5589 = gettime();
}

//Function Number: 69
cansay(param_00,param_01,param_02,param_03)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(isplayer(self))
	{
		return 0;
	}

	if(distance(level.var_31D.var_2E6,self.var_2E6) > level.var_134B)
	{
		return 0;
	}

	if(!isdefined(self.var_132D) || !self.var_132D)
	{
		return 0;
	}

	if(isdefined(param_02) && param_02 >= 1)
	{
		return 1;
	}

	if(gettime() + level.var_33D7[param_00]["self"] < self.var_60D8[param_00])
	{
		return 0;
	}

	if(gettime() + level.var_33D7[param_00]["squad"] < self.var_8AAA.var_60D8[param_00])
	{
		return 0;
	}

	if(isdefined(param_01) && func_99DF(param_00,param_01))
	{
		return 0;
	}

	if(isdefined(param_01) && level.var_33DA[param_00][param_01] < self.var_134D)
	{
		return 0;
	}

	return 1;
}

//Function Number: 70
func_3FC5()
{
	var_00 = undefined;
	var_01 = -999999999;
	foreach(var_04, var_03 in self.var_1CA6)
	{
		if(func_51E8(var_04))
		{
			if(var_03.priority > var_01)
			{
				var_00 = var_04;
				var_01 = var_03.priority;
			}
		}
	}

	return var_00;
}

//Function Number: 71
func_4106(param_00)
{
	var_01 = self.var_8AAA;
	var_02 = [];
	for(var_03 = 0;var_03 < var_01.var_5BA3.size;var_03++)
	{
		if(isdefined(var_01.var_5BA3[var_03].enemy) && var_01.var_5BA3[var_03].enemy == param_00)
		{
			var_02[var_02.size] = var_01.var_5BA3[var_03];
		}
	}

	if(!isdefined(var_02[0]))
	{
		return undefined;
	}

	var_04 = undefined;
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		if(var_02[var_03] cansay("response"))
		{
			return var_04;
		}
	}

	return common_scripts\utility::getclosest(self.var_2E6,var_02);
}

//Function Number: 72
func_409F()
{
	var_00 = [];
	var_01 = [];
	var_00[0] = "custom";
	var_00[1] = "response";
	var_00[2] = "order";
	var_00[3] = "threat";
	var_00[4] = "inform";
	for(var_02 = var_00.size - 1;var_02 >= 0;var_02--)
	{
		for(var_03 = 1;var_03 <= var_02;var_03++)
		{
			if(self.var_1CA6[var_00[var_03 - 1]].priority < self.var_1CA6[var_00[var_03]].priority)
			{
				var_04 = var_00[var_03 - 1];
				var_00[var_03 - 1] = var_00[var_03];
				var_00[var_03] = var_04;
			}
		}
	}

	var_05 = 0;
	for(var_02 = 0;var_02 < var_00.size;var_02++)
	{
		var_06 = func_3F88(var_00[var_02]);
		if(var_06 == " valid" && !var_05)
		{
			var_05 = 1;
			var_01[var_02] = "g " + var_00[var_02] + var_06 + " " + self.var_1CA6[var_00[var_02]].priority;
			continue;
		}

		if(var_06 == " valid")
		{
			var_01[var_02] = "y " + var_00[var_02] + var_06 + " " + self.var_1CA6[var_00[var_02]].priority;
			continue;
		}

		if(self.var_1CA6[var_00[var_02]].var_351A == 0)
		{
			var_01[var_02] = "b " + var_00[var_02] + var_06 + " " + self.var_1CA6[var_00[var_02]].priority;
			continue;
		}

		var_01[var_02] = "r " + var_00[var_02] + var_06 + " " + self.var_1CA6[var_00[var_02]].priority;
	}

	return var_01;
}

//Function Number: 73
func_3F88(param_00)
{
	var_01 = "";
	if(self.var_8AAA.var_514E[param_00])
	{
		var_01 = var_01 + " playing";
	}

	if(gettime() > self.var_1CA6[param_00].var_351A)
	{
		var_01 = var_01 + " expired";
	}

	if(gettime() < self.var_8AAA.var_60D8[param_00])
	{
		var_01 = var_01 + " cantspeak";
	}

	if(var_01 == "")
	{
		var_01 = " valid";
	}

	return var_01;
}

//Function Number: 74
func_5102(param_00)
{
	if(getdvar("bcs_filter" + param_00,"off") == "on" || getdvar("bcs_filter" + param_00,"off") == "1")
	{
		return 1;
	}

	return 0;
}

//Function Number: 75
func_51E8(param_00)
{
	if(!self.var_8AAA.var_514E[param_00] && !level.var_51CC[self.inliveplayerkillstreak][param_00] && gettime() < self.var_1CA6[param_00].var_351A && gettime() > self.var_8AAA.var_60D8[param_00])
	{
		if(!func_99DF(param_00,self.var_1CA6[param_00].eventtype))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 76
func_99DF(param_00,param_01)
{
	if(!isdefined(level.var_33DC[param_00][param_01]))
	{
		return 0;
	}

	if(!isdefined(self.var_8AAA.var_60DC[param_00][param_01]))
	{
		return 0;
	}

	if(gettime() > self.var_8AAA.var_60DC[param_00][param_01])
	{
		return 0;
	}

	return 1;
}

//Function Number: 77
func_2D8A(param_00,param_01)
{
	if(!isdefined(level.var_33DC[param_00][param_01]))
	{
		return;
	}

	self.var_8AAA.var_60DC[param_00][param_01] = gettime() + level.var_33DC[param_00][param_01];
}

//Function Number: 78
func_1340()
{
	if(isplayer(self))
	{
		return 0;
	}

	if(func_5100())
	{
		return 0;
	}

	return animscripts\utility::func_51A9(self.weapon);
}

//Function Number: 79
func_5100(param_00)
{
	if(distancesquared(self.var_2E6,level.var_31D.var_2E6) > 2250000)
	{
		return 0;
	}

	if(isdefined(param_00) && param_00 && isdefined(getlocation()))
	{
		return 0;
	}

	var_01 = func_133E();
	if(!isdefined(var_01))
	{
		return 1;
	}

	if(!func_515A())
	{
		return 0;
	}

	return 1;
}

//Function Number: 80
func_515A()
{
	var_00 = self.node;
	if(!isdefined(var_00))
	{
		return 0;
	}

	if(issubstr(var_00.type,"Cover") || issubstr(var_00.type,"Conceal"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 81
func_8AC6(param_00)
{
	if(param_00.var_6371 > 0)
	{
		return 1;
	}

	return 0;
}

//Function Number: 82
func_5161()
{
	var_00 = getrank();
	if(!isdefined(var_00))
	{
		return 0;
	}

	if(var_00 == "sergeant" || var_00 == "lieutenant" || var_00 == "captain" || var_00 == "sergeant")
	{
		return 1;
	}

	return 0;
}

//Function Number: 83
func_133E()
{
	if(isplayer(self))
	{
		return self.node;
	}

	return animscripts\utility::func_3F2D();
}

//Function Number: 84
func_3289()
{
	if(self method_813D())
	{
		return 1;
	}

	return 0;
}

//Function Number: 85
func_402E()
{
	if(func_3289())
	{
		var_00 = self.var_986;
	}
	else if(self.inliveplayerkillstreak == "allies")
	{
		var_00 = self.name;
	}
	else
	{
		var_00 = undefined;
	}

	if(!isdefined(var_00))
	{
		return undefined;
	}

	var_01 = strtok(var_00," ");
	if(var_01.size < 2)
	{
		return var_00;
	}

	return var_01[1];
}

//Function Number: 86
getrank()
{
	return self.var_992;
}

//Function Number: 87
func_3F36(param_00)
{
	var_01 = func_40DD(param_00,self.inliveplayerkillstreak);
	var_02 = common_scripts\utility::getclosest(self.var_2E6,var_01);
	return var_02;
}

//Function Number: 88
func_40DD(param_00,param_01)
{
	var_02 = [];
	var_03 = function_00D6(param_01);
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		if(var_03[var_04] == self)
		{
			continue;
		}

		if(!var_03[var_04] cansay(param_00))
		{
			continue;
		}

		var_02[var_02.size] = var_03[var_04];
	}

	return var_02;
}

//Function Number: 89
func_40B6(param_00,param_01,param_02)
{
	var_03 = undefined;
	if(!isdefined(param_02))
	{
		param_02 = "response";
	}

	var_04 = common_scripts\utility::array_randomize(self.var_8AAA.var_5BA3);
	param_00 = param_00 * param_00;
	param_01 = param_01 * param_01;
	for(var_05 = 0;var_05 < var_04.size;var_05++)
	{
		if(var_04[var_05] == self)
		{
			continue;
		}

		if(!isalive(var_04[var_05]))
		{
			continue;
		}

		var_06 = distancesquared(self.var_2E6,var_04[var_05].var_2E6);
		if(var_06 < param_00)
		{
			continue;
		}

		if(var_06 > param_01)
		{
			continue;
		}

		if(func_51E1(var_04[var_05]))
		{
			continue;
		}

		if(!var_04[var_05] cansay(param_02))
		{
			continue;
		}

		var_03 = var_04[var_05];
		if(func_1ADE(var_03))
		{
			break;
		}
	}

	return var_03;
}

//Function Number: 90
getlocation()
{
	var_00 = get_all_my_locations();
	var_00 = common_scripts\utility::array_randomize(var_00);
	if(var_00.size)
	{
		foreach(var_02 in var_00)
		{
			if(!location_called_out_ever(var_02))
			{
				return var_02;
			}
		}

		foreach(var_02 in var_00)
		{
			if(!location_called_out_recently(var_02))
			{
				return var_02;
			}
		}
	}

	return undefined;
}

//Function Number: 91
getvalidlocation(param_00)
{
	var_01 = get_all_my_locations();
	var_01 = common_scripts\utility::array_randomize(var_01);
	if(var_01.size)
	{
		foreach(var_03 in var_01)
		{
			if(!location_called_out_ever(var_03) && param_00 cancalloutlocation(var_03))
			{
				return var_03;
			}
		}

		foreach(var_03 in var_01)
		{
			if(!location_called_out_recently(var_03) && param_00 cancalloutlocation(var_03))
			{
				return var_03;
			}
		}
	}

	return undefined;
}

//Function Number: 92
get_all_my_locations()
{
	var_00 = [];
	if(!isdefined(self))
	{
		return var_00;
	}

	var_01 = level.bcs_locations;
	var_02 = self getistouchingentities(var_01);
	if(!isdefined(var_02))
	{
		return var_00;
	}

	foreach(var_04 in var_02)
	{
		if(isdefined(var_04.locationaliases))
		{
			var_00[var_00.size] = var_04;
		}
	}

	return var_00;
}

//Function Number: 93
update_bcs_locations()
{
	if(isdefined(level.bcs_locations))
	{
		anim.bcs_locations = common_scripts\utility::array_removeundefined(level.bcs_locations);
	}
}

//Function Number: 94
is_in_callable_location()
{
	var_00 = get_all_my_locations();
	foreach(var_02 in var_00)
	{
		if(!location_called_out_recently(var_02))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 95
location_called_out_ever(param_00)
{
	var_01 = location_get_last_callout_time(param_00);
	if(!isdefined(var_01))
	{
		return 0;
	}

	return 1;
}

//Function Number: 96
location_called_out_recently(param_00)
{
	var_01 = location_get_last_callout_time(param_00);
	if(!isdefined(var_01))
	{
		return 0;
	}

	var_02 = var_01 + level.var_33D7["threat"]["location_repeat"];
	if(gettime() < var_02)
	{
		return 1;
	}

	return 0;
}

//Function Number: 97
location_add_last_callout_time(param_00)
{
	level.locationlastcallouttimes[param_00.classname] = gettime();
}

//Function Number: 98
location_get_last_callout_time(param_00)
{
	if(isdefined(level.locationlastcallouttimes[param_00.classname]))
	{
		return level.locationlastcallouttimes[param_00.classname];
	}

	return undefined;
}

//Function Number: 99
func_40B2(param_00)
{
	var_01 = param_00.var_41;
	if(!isplayer(param_00))
	{
		var_02 = param_00 func_133E();
		if(isdefined(var_02))
		{
			var_01 = var_02.var_41;
		}
	}

	return var_01;
}

//Function Number: 100
func_8558(param_00)
{
	if(param_00 == "left" || param_00 == "right")
	{
		return 1;
	}

	return 0;
}

//Function Number: 101
func_3F5C(param_00,param_01,param_02)
{
	var_03 = vectortoangles(param_02);
	var_04 = vectortoangles(param_01 - param_00);
	var_05 = var_03[1] - var_04[1];
	var_05 = var_05 + 360;
	var_05 = int(var_05) % 360;
	if(var_05 > 315 || var_05 < 45)
	{
		var_06 = "front";
	}
	else if(var_06 < 135)
	{
		var_06 = "right";
	}
	else if(var_06 < 225)
	{
		var_06 = "rear";
	}
	else
	{
		var_06 = "left";
	}

	return var_06;
}

//Function Number: 102
func_615E(param_00)
{
	var_01 = undefined;
	switch(param_00)
	{
		case "north":
			break;

		case "northwest":
			break;

		case "west":
			break;

		case "southwest":
			break;

		case "south":
			break;

		case "southeast":
			break;

		case "east":
			break;

		case "northeast":
			break;

		case "impossible":
			break;

		default:
			break;
	}
}

//Function Number: 103
func_3F58(param_00,param_01)
{
	var_02 = vectortoangles(param_01 - param_00);
	var_03 = var_02[1];
	var_04 = getnorthyaw();
	var_03 = var_03 - var_04;
	if(var_03 < 0)
	{
		var_03 = var_03 + 360;
	}
	else if(var_03 > 360)
	{
		var_03 = var_03 - 360;
	}

	if(var_03 < 22.5 || var_03 > 337.5)
	{
		var_05 = "north";
	}
	else if(var_04 < 67.5)
	{
		var_05 = "northwest";
	}
	else if(var_04 < 112.5)
	{
		var_05 = "west";
	}
	else if(var_04 < 157.5)
	{
		var_05 = "southwest";
	}
	else if(var_04 < 202.5)
	{
		var_05 = "south";
	}
	else if(var_04 < 247.5)
	{
		var_05 = "southeast";
	}
	else if(var_04 < 292.5)
	{
		var_05 = "east";
	}
	else if(var_04 < 337.5)
	{
		var_05 = "northeast";
	}
	else
	{
		var_05 = "impossible";
	}

	return var_05;
}

//Function Number: 104
func_3F5D(param_00,param_01)
{
	var_02 = distance2d(param_00,param_01);
	var_03 = 0.0254 * var_02;
	return var_03;
}

//Function Number: 105
func_3F5E(param_00,param_01)
{
	var_02 = func_3F5D(param_00,param_01);
	if(var_02 < 15)
	{
		return "10";
	}

	if(var_02 < 25)
	{
		return "20";
	}

	if(var_02 < 35)
	{
		return "30";
	}

	return "40";
}

//Function Number: 106
func_3FA5(param_00)
{
	var_01 = "undefined";
	if(param_00 == "10" || param_00 == "11")
	{
		var_01 = "10";
	}
	else if(param_00 == "12")
	{
		var_01 = param_00;
	}
	else if(param_00 == "1" || param_00 == "2")
	{
		var_01 = "2";
	}

	return var_01;
}

//Function Number: 107
func_3F5A(param_00,param_01,param_02)
{
	var_03 = func_3F59(param_00,param_01,param_02);
	return func_3F5B(var_03);
}

//Function Number: 108
func_3F59(param_00,param_01,param_02)
{
	var_03 = anglestoforward(param_00);
	var_04 = vectornormalize(var_03);
	var_05 = vectortoangles(var_04);
	var_06 = vectortoangles(param_02 - param_01);
	var_07 = var_05[1] - var_06[1];
	var_07 = var_07 + 360;
	var_07 = int(var_07) % 360;
	return var_07;
}

//Function Number: 109
func_3F5B(param_00)
{
	var_01 = undefined;
	if(param_00 > 345 || param_00 < 15)
	{
		var_01 = "12";
	}
	else if(param_00 < 45)
	{
		var_01 = "1";
	}
	else if(param_00 < 75)
	{
		var_01 = "2";
	}
	else if(param_00 < 105)
	{
		var_01 = "3";
	}
	else if(param_00 < 135)
	{
		var_01 = "4";
	}
	else if(param_00 < 165)
	{
		var_01 = "5";
	}
	else if(param_00 < 195)
	{
		var_01 = "6";
	}
	else if(param_00 < 225)
	{
		var_01 = "7";
	}
	else if(param_00 < 255)
	{
		var_01 = "8";
	}
	else if(param_00 < 285)
	{
		var_01 = "9";
	}
	else if(param_00 < 315)
	{
		var_01 = "10";
	}
	else
	{
		var_01 = "11";
	}

	return var_01;
}

//Function Number: 110
func_3F50(param_00,param_01)
{
	var_02 = param_01[2] - param_00[2];
	var_03 = distance2d(param_00,param_01);
	var_04 = atan(var_02 / var_03);
	if(var_04 < 15 || var_04 > 55)
	{
		return var_04;
	}

	if(var_04 < 25)
	{
		return 20;
	}

	if(var_04 < 35)
	{
		return 30;
	}

	if(var_04 < 45)
	{
		return 40;
	}

	if(var_04 < 55)
	{
		return 50;
	}
}

//Function Number: 111
getvectorrightangle(param_00)
{
	return (param_00[1],0 - param_00[0],param_00[2]);
}

//Function Number: 112
func_414E(param_00)
{
	var_01 = (0,0,0);
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		var_01 = var_01 + param_00[var_02];
	}

	return (var_01[0] / param_00.size,var_01[1] / param_00.size,var_01[2] / param_00.size);
}

//Function Number: 113
func_07DB(param_00)
{
	var_01 = "";
	if(param_00 animscripts\utility::func_9C2E())
	{
		var_01 = "_rpg";
	}
	else if(param_00 func_1340())
	{
		var_01 = "_sniper";
	}

	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_concat_target" + var_01;
	self.var_88A3[self.var_88A3.size] = var_02;
}

//Function Number: 114
func_07DA(param_00,param_01)
{
	var_02 = common_scripts\utility::random(["relative","absolute"]);
	switch(var_02)
	{
		case "absolute":
			break;

		case "relative":
			break;
	}
}

//Function Number: 115
func_0802(param_00)
{
	self.var_88A3[self.var_88A3.size] = self.owner.var_2243 + "_" + self.owner.var_624F + "_name_" + param_00;
	level.var_55BD[self.owner.inliveplayerkillstreak] = param_00;
	level.var_55BE[self.owner.inliveplayerkillstreak] = gettime();
}

//Function Number: 116
func_081D()
{
	if(!self.owner func_1ADF())
	{
		return;
	}

	anim.var_55C8 = gettime();
	var_00 = self.owner.var_2243 + "_" + self.owner.var_624F + "_name_player_" + level.var_31D.var_2243 + "_" + level.var_31D.var_1343;
	self.var_88A3[self.var_88A3.size] = var_00;
	self.var_261 = level.var_31D;
}

//Function Number: 117
func_0822(param_00)
{
	self.var_88A3[self.var_88A3.size] = self.owner.var_2243 + "_" + self.owner.var_624F + "_rank_" + param_00;
}

//Function Number: 118
func_1ADE(param_00)
{
	if(func_3289())
	{
		return 0;
	}

	if(!isdefined(param_00.var_1342))
	{
		return 0;
	}

	if(param_00.var_132D == 0)
	{
		return 0;
	}

	if(!isdefined(param_00.var_2243))
	{
		return 0;
	}

	if(self.var_2243 != param_00.var_2243)
	{
		return 0;
	}

	if(func_6046(param_00))
	{
		return 0;
	}

	var_01 = self.var_2243 + "_" + self.var_624F + "_name_" + param_00.var_1342;
	if(soundexists(var_01))
	{
		return 1;
	}

	return 0;
}

//Function Number: 119
func_6046(param_00)
{
	if(level.var_55BD[self.inliveplayerkillstreak] == param_00.var_1342 || gettime() - level.var_55BE[self.inliveplayerkillstreak] < level.var_55BF)
	{
		return 1;
	}

	return 0;
}

//Function Number: 120
func_1ADF()
{
	if(func_3289())
	{
		return 0;
	}

	if(!isdefined(level.var_31D.var_1343) || !isdefined(level.var_31D.var_2243))
	{
		return 0;
	}

	if(func_6BA7())
	{
		return 0;
	}

	var_00 = self.var_2243 + "_" + self.var_624F + "_name_player_" + level.var_31D.var_2243 + "_" + level.var_31D.var_1343;
	if(soundexists(var_00))
	{
		return 1;
	}

	return 0;
}

//Function Number: 121
func_6BA7()
{
	if(!isdefined(level.var_55C8))
	{
		return 0;
	}

	if(gettime() - level.var_55C8 >= level.var_33DC["playername"])
	{
		return 0;
	}

	return 1;
}

//Function Number: 122
func_51E1(param_00)
{
	if(isstring(self.var_624F) && isstring(param_00.var_624F) && self.var_624F == param_00.var_624F)
	{
		return 1;
	}

	if(!isstring(self.var_624F) && !isstring(param_00.var_624F) && self.var_624F == param_00.var_624F)
	{
		return 1;
	}

	return 0;
}

//Function Number: 123
func_0837(param_00,param_01)
{
	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_threat_" + param_00;
	if(isdefined(param_01))
	{
		var_02 = var_02 + "_" + param_01;
	}

	self.var_88A3 = common_scripts\utility::array_add(self.var_88A3,var_02);
	return 1;
}

//Function Number: 124
func_0841(param_00)
{
	var_01 = self.owner.var_2243 + "_" + self.owner.var_624F + "_exposed_" + param_00;
	self.var_88A3[self.var_88A3.size] = var_01;
	return 1;
}

//Function Number: 125
func_0842()
{
	var_00 = self.owner.var_2243 + "_" + self.owner.var_624F + "_order_action_suppress";
	self.var_88A3[self.var_88A3.size] = var_00;
	return 1;
}

//Function Number: 126
func_083E(param_00)
{
	var_01 = self.owner.var_2243 + "_" + self.owner.var_624F + "_co_dist_" + param_00;
	self.var_88A3[self.var_88A3.size] = var_01;
	return 1;
}

//Function Number: 127
func_083F(param_00)
{
	var_01 = self.owner.var_2243 + "_" + self.owner.var_624F + "_co_elev_" + param_00;
	self.var_88A3[self.var_88A3.size] = var_01;
	return 1;
}

//Function Number: 128
func_0839(param_00,param_01)
{
	var_02 = func_23FA(param_00,param_01);
	if(!soundexists(var_02))
	{
		return 0;
	}

	self.var_88A3[self.var_88A3.size] = var_02;
	return 1;
}

//Function Number: 129
func_083D(param_00)
{
	var_01 = self.owner.var_2243 + "_" + self.owner.var_624F + "_resp_ack_co_gnrc_" + param_00;
	if(!soundexists(var_01))
	{
		return 0;
	}

	self.var_88A3[self.var_88A3.size] = var_01;
	return 1;
}

//Function Number: 130
func_083C(param_00,param_01,param_02)
{
	var_03 = undefined;
	foreach(var_05 in param_02.locationaliases)
	{
		if(issubstr(param_01,var_05))
		{
			var_03 = var_05;
			break;
		}
	}

	var_07 = self.owner.var_2243 + "_" + self.owner.var_624F + "_";
	var_08 = getsubstr(param_01,param_01.size - 1,param_01.size);
	var_09 = int(var_08) + 1;
	var_0A = var_07 + "co_loc_" + var_03 + "_qa" + var_09;
	if(!soundexists(var_0A))
	{
		if(randomint(100) < level.var_33D8["response"]["callout_negative"])
		{
			param_00 animscripts\battlechatter_ai::func_826("callout","neg",self.owner,0.9);
		}
		else
		{
			param_00 animscripts\battlechatter_ai::func_826("exposed","acquired",self.owner,0.9);
		}

		param_02.qafinished = 1;
		return 0;
	}

	param_00 animscripts\battlechatter_ai::func_826("callout","QA",self.owner,0.9,var_0A,param_02);
	self.var_88A3[self.var_88A3.size] = var_0A;
	return 1;
}

//Function Number: 131
func_23FA(param_00,param_01)
{
	var_02 = "_report";
	var_03 = "_echo";
	var_04 = self.owner.var_2243 + "_" + self.owner.var_624F + "_";
	var_05 = param_00.size - var_02.size;
	var_06 = self.owner.var_2243 + "_" + param_01.var_624F + "_";
	var_07 = var_06.size;
	var_08 = getsubstr(param_00,var_07,var_05);
	var_09 = var_04 + var_08 + var_03;
	return var_09;
}

//Function Number: 132
func_0838(param_00,param_01)
{
	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_callout_" + param_00 + "_" + param_01;
	self.var_88A3[self.var_88A3.size] = var_02;
	return 1;
}

//Function Number: 133
func_083A(param_00,param_01,param_02)
{
	var_03 = param_00.var_7A1B;
	if(!isdefined(param_02))
	{
		param_02 = 0;
	}

	var_04 = self.owner.var_2243 + "_" + self.owner.var_624F + "_callout_obj_" + var_03;
	if(param_02)
	{
		var_04 = var_04 + "_y";
	}

	var_04 = var_04 + "_" + param_01;
	if(!soundexists(var_04))
	{
		return 0;
	}

	self.var_88A3[self.var_88A3.size] = var_04;
	return 1;
}

//Function Number: 134
func_083B(param_00,param_01)
{
	var_02 = undefined;
	var_03 = param_00.locationaliases;
	var_04 = var_03[0];
	if(var_03.size > 1)
	{
		var_05 = undefined;
		var_05 = param_00 getcannedresponse(self.owner);
		if(isdefined(var_05))
		{
			var_04 = var_05;
		}
		else
		{
			var_04 = common_scripts\utility::random(var_03);
		}
	}

	var_06 = undefined;
	if(isdefined(param_01) && param_01)
	{
		var_06 = self.owner getloccalloutalias("concat_loc_" + var_04);
	}
	else if(!isdefined(param_00.qafinished) && iscallouttypeqa(var_04,self.owner))
	{
		var_06 = self.owner getqacalloutalias(var_04,0);
	}
	else
	{
		var_06 = self.owner getloccalloutalias("co_loc_" + var_04);
	}

	if(soundexists(var_06))
	{
		var_02 = var_06;
	}

	if(!isdefined(var_02))
	{
		return 0;
	}

	location_add_last_callout_time(param_00);
	self.var_88A3[self.var_88A3.size] = var_02;
	return 1;
}

//Function Number: 135
func_07E6(param_00,param_01)
{
	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_inform_" + param_00 + "_" + param_01;
	self.var_88A3[self.var_88A3.size] = var_02;
}

//Function Number: 136
func_0825(param_00,param_01)
{
	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_response_" + param_00 + "_" + param_01;
	self.var_88A3[self.var_88A3.size] = var_02;
	return 1;
}

//Function Number: 137
func_0823(param_00,param_01)
{
	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_reaction_" + param_00 + "_" + param_01;
	self.var_88A3[self.var_88A3.size] = var_02;
	return 1;
}

//Function Number: 138
func_07D7()
{
	var_00 = self.owner.var_2243 + "_" + self.owner.var_624F + "_check_fire";
	self.var_88A3[self.var_88A3.size] = var_00;
	return 1;
}

//Function Number: 139
func_0835()
{
	var_00 = self.owner.var_2243 + "_" + self.owner.var_624F + "_inform_taking_fire";
	self.var_88A3[self.var_88A3.size] = var_00;
	return 1;
}

//Function Number: 140
func_0836(param_00,param_01)
{
	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_taunt";
	self.var_88A3[self.var_88A3.size] = var_02;
	return 1;
}

//Function Number: 141
func_07E5()
{
	var_00 = self.owner.var_2243 + "_" + self.owner.var_624F + "_hostile_burst";
	self.var_88A3[self.var_88A3.size] = var_00;
	return 1;
}

//Function Number: 142
func_081A(param_00,param_01)
{
	var_02 = self.owner.var_2243 + "_" + self.owner.var_624F + "_order_" + param_00 + "_" + param_01;
	self.var_88A3[self.var_88A3.size] = var_02;
	return 1;
}

//Function Number: 143
func_4DA0(param_00)
{
	if(!isdefined(self.var_8ACA[param_00].var_1A07))
	{
		self.var_8ACA[param_00].var_1A07 = 0;
	}

	if(!isdefined(self.var_8ACA[param_00].var_3817))
	{
		self.var_8ACA[param_00].var_3817 = 2000000000;
	}

	if(!isdefined(self.var_8ACA[param_00].var_5589))
	{
		self.var_8ACA[param_00].var_5589 = 0;
	}
}

//Function Number: 144
func_8549(param_00)
{
	self.var_8ACA[param_00].var_1A07 = undefined;
	self.var_8ACA[param_00].var_3817 = undefined;
	self.var_8ACA[param_00].var_5589 = undefined;
}

//Function Number: 145
func_23EA(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	var_03.owner = self;
	var_03.eventtype = param_01;
	var_03.var_33D6 = param_00;
	if(isdefined(param_02))
	{
		var_03.priority = param_02;
	}
	else
	{
		var_03.priority = level.var_33DA[param_00][param_01];
	}

	var_03.var_351A = gettime() + level.var_33D9[param_00][param_01];
	return var_03;
}

//Function Number: 146
func_23EB()
{
	var_00 = spawnstruct();
	var_00.owner = self;
	var_00.var_88A3 = [];
	var_00.var_59D5 = 0;
	return var_00;
}

//Function Number: 147
func_6E23(param_00)
{
	return common_scripts\utility::within_fov(self.var_2E6,self.var_41,param_00,0.766);
}

//Function Number: 148
func_330A(param_00)
{
	return common_scripts\utility::within_fov(self.var_2E6,self.var_41,param_00.var_2E6,0);
}

//Function Number: 149
func_8AC5()
{
	anim endon("battlechatter disabled");
	self endon("squad_deleting");
	if(self.inliveplayerkillstreak != "allies")
	{
		return;
	}

	while(self.var_5B9D <= 0)
	{
		wait(0.5);
	}

	wait(0.5);
	var_00 = 0;
	while(isdefined(self))
	{
		if(!func_8AC1(self))
		{
			var_00 = 1;
			wait(1);
			continue;
		}
		else if(self.var_3699)
		{
			if(!var_00)
			{
				wait(randomfloat(level.var_369E));
			}

			if(var_00)
			{
				var_00 = 0;
			}

			self.var_3699 = 0;
		}
		else
		{
			if(!var_00)
			{
				wait(randomfloatrange(level.var_369E,level.var_369D));
			}

			if(var_00)
			{
				var_00 = 0;
			}
		}

		var_01 = func_3F1D(self);
		if(!isdefined(var_01))
		{
			continue;
		}

		var_02 = var_01.voice;
		var_03 = func_3F98(self,var_02);
		var_04 = func_3F97(var_02,var_03);
		foreach(var_08, var_06 in var_04)
		{
			if(!var_01 func_1AC7() || distance(level.var_31D.var_2E6,var_01.var_2E6) > level.var_3698)
			{
				for(var_07 = 0;var_07 < self.var_5BA3.size;var_07++)
				{
					var_01 = func_3F1D(self);
					if(!isdefined(var_01))
					{
						continue;
					}

					if(var_01.voice == var_02)
					{
						break;
					}
				}

				if(!isdefined(var_01) || var_01.voice != var_02)
				{
					break;
				}
			}

			thread func_6D9B(var_01,var_06);
			self waittill("burst_line_done");
			if(var_08 != var_04.size - 1)
			{
				wait(randomfloatrange(level.var_369C,level.var_369B));
			}
		}
	}
}

//Function Number: 150
func_8AC1(param_00)
{
	var_01 = 0;
	foreach(var_03 in param_00.var_5BA3)
	{
		if(var_03 func_1AC7())
		{
			var_01 = 1;
			break;
		}
	}

	return var_01;
}

//Function Number: 151
func_1AC7()
{
	var_00 = 0;
	if(!isplayer(self) && isalive(self) && self.classname != "actor_enemy_dog" && level.var_38C9[self.inliveplayerkillstreak] && func_9F2C() && self.var_38C9)
	{
		var_00 = 1;
	}

	return var_00;
}

//Function Number: 152
func_9F2C()
{
	if(isdefined(level.var_38CD[self.voice]) && level.var_38CD[self.voice])
	{
		return 1;
	}

	return 0;
}

//Function Number: 153
func_3F1D(param_00)
{
	var_01 = undefined;
	var_02 = common_scripts\utility::get_array_of_farthest(level.var_31D.var_2E6,param_00.var_5BA3);
	foreach(var_04 in var_02)
	{
		if(var_04 func_1AC7())
		{
			var_01 = var_04;
			if(!isdefined(param_00.var_369A))
			{
				break;
			}

			if(isdefined(param_00.var_369A) && param_00.var_369A == var_01.unique_id)
			{
				continue;
			}
		}
	}

	if(isdefined(var_01))
	{
		param_00.var_369A = var_01.unique_id;
	}

	return var_01;
}

//Function Number: 154
func_3F98(param_00,param_01)
{
	var_02 = common_scripts\utility::array_randomize(level.var_38C9[param_01]);
	if(level.var_38CC.size >= var_02.size)
	{
		anim.var_38CC = [];
	}

	var_03 = undefined;
	foreach(var_05 in var_02)
	{
		var_03 = var_05;
		if(!func_38CE(var_03))
		{
			break;
		}
	}

	level.var_38CC[level.var_38CC.size] = var_03;
	return var_03;
}

//Function Number: 155
func_38CE(param_00)
{
	if(!level.var_38CC.size)
	{
		return 0;
	}

	var_01 = 0;
	foreach(var_03 in level.var_38CC)
	{
		if(var_03 == param_00)
		{
			var_01 = 1;
			break;
		}
	}

	return var_01;
}

//Function Number: 156
func_3F97(param_00,param_01,param_02)
{
	if(!isdefined(param_02))
	{
		param_02 = 1;
	}

	var_03 = param_02;
	var_04 = [];
	for(;;)
	{
		var_05 = "FB_" + level.var_2244[param_00] + "_" + param_01 + "_" + var_03;
		var_03++;
		if(soundexists(var_05))
		{
			var_04[var_04.size] = var_05;
			continue;
		}

		break;
	}

	return var_04;
}

//Function Number: 157
func_6D9B(param_00,param_01)
{
	anim endon("battlechatter disabled");
	var_02 = spawn("script_origin",param_00 gettagorigin("j_head"));
	var_02 linkto(param_00);
	var_02 playsoundasmaster(param_01,param_01,1);
	var_02 waittill(param_01);
	var_02 delete();
	if(isdefined(self))
	{
		self notify("burst_line_done");
	}
}

//Function Number: 158
func_38C8(param_00,param_01)
{
	self endon("burst_line_done");
	wait(0.05);
}

//Function Number: 159
battlechatter_canprint()
{
	return 0;
}

//Function Number: 160
battlechatter_canprintdump()
{
	return 0;
}

//Function Number: 161
battlechatter_print(param_00)
{
	if(param_00.size <= 0)
	{
		return;
	}

	if(!battlechatter_canprint())
	{
		return;
	}

	var_01 = "^5 ";
	if(func_3289())
	{
		var_01 = "^6 ";
	}

	foreach(var_03 in param_00)
	{
	}
}

//Function Number: 162
battlechatter_printdump(param_00,param_01)
{
}

//Function Number: 163
getaliastypefromsoundalias(param_00)
{
	var_01 = self.var_2243 + "_" + self.var_624F + "_";
	var_02 = getsubstr(param_00,var_01.size,param_00.size);
	return var_02;
}

//Function Number: 164
battlechatter_printdumpline(param_00,param_01,param_02)
{
	if(common_scripts\utility::flag(param_02))
	{
		common_scripts\utility::flag_wait(param_02);
	}

	common_scripts\utility::flag_set(param_02);
	common_scripts\utility::flag_clear(param_02);
}

//Function Number: 165
func_133D()
{
	for(var_00 = 0;var_00 < level.bcs_locations.size;var_00++)
	{
		var_01 = level.bcs_locations[var_00].locationaliases;
		if(!isdefined(var_01))
		{
			continue;
		}

		var_02 = "";
		foreach(var_04 in var_01)
		{
			var_02 = var_02 + var_04;
		}

		thread func_2DD2("Location: " + var_02,level.bcs_locations[var_00] getorigin(),(0,0,8),(1,1,1));
	}
}

//Function Number: 166
func_2DD2(param_00,param_01,param_02,param_03)
{
	for(;;)
	{
		if(distancesquared(level.var_31D.var_2E6,param_01) > 4194304)
		{
			wait(0.1);
			continue;
		}

		wait(0.05);
	}
}

//Function Number: 167
func_2DD1(param_00,param_01,param_02)
{
	var_03 = param_00 getorigin();
	for(;;)
	{
		if(distancesquared(level.var_31D.var_2E6,var_03) > 4194304)
		{
			wait(0.1);
			continue;
		}

		var_04 = func_3F58(level.var_31D.var_2E6,var_03);
		var_04 = func_615E(var_04);
		var_05 = func_3F5A(level.var_31D.var_41,level.var_31D.var_2E6,var_03);
		var_06 = var_04 + ", " + var_05 + ":00";
		wait(0.05);
	}
}

//Function Number: 168
func_744E(param_00,param_01)
{
	var_02 = function_00D6(param_00);
	for(var_03 = 0;var_03 < var_02.size;var_03++)
	{
		var_04 = var_02[var_03];
		if(!isalive(var_04))
		{
			continue;
		}

		if(!isdefined(var_04.var_132D))
		{
			continue;
		}

		var_04.var_60D8[param_01] = gettime() + 350;
		var_04.var_8AAA.var_60D8[param_01] = gettime() + 350;
	}
}

//Function Number: 169
func_9F2B()
{
	self endon("death");
	if(self.voice == "british")
	{
		return 1;
	}

	return 0;
}

//Function Number: 170
func_3A9E()
{
	if(!func_1A4C())
	{
		return 0;
	}

	func_2D8A("reaction","friendlyfire");
	thread func_6DCF();
	return 1;
}

//Function Number: 171
func_1A4C(param_00)
{
	if(isdefined(self.var_3AA0))
	{
		return 0;
	}

	if(!isdefined(self.var_1CA6))
	{
		return 0;
	}

	if(!isdefined(self.var_1CA6["reaction"]) || !isdefined(self.var_1CA6["reaction"].eventtype))
	{
		return 0;
	}

	if(self.var_1CA6["reaction"].eventtype != "friendlyfire")
	{
		return 0;
	}

	if(gettime() > self.var_1CA6["reaction"].var_351A)
	{
		return 0;
	}

	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	if(param_00)
	{
		if(isdefined(self.var_8AAA.var_60DC["reaction"]["friendlyfire"]))
		{
			if(gettime() < self.var_8AAA.var_60DC["reaction"]["friendlyfire"])
			{
				return 0;
			}
		}
	}

	return 1;
}

//Function Number: 172
func_50A0()
{
	return isdefined(level.var_1A3D) && level.var_1A3D == "xslice";
}

//Function Number: 173
func_502F()
{
	return isdefined(level.script) && level.script == "greece";
}

//Function Number: 174
func_9BDA()
{
	if(level.script == "sp_berlin" || level.script == "sp_ny_harbor")
	{
		return 1;
	}

	return 0;
}