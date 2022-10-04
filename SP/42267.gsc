/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42267.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 90
 * Decompile Time: 92 ms
 * Timestamp: 4/20/2022 8:22:04 PM
*******************************************************************/

//Function Number: 1
lib_A51B::func_260D()
{
	level.dds = spawnstruct();
	level.dds.var_4791 = 0.25;
	level.dds.var_59F5 = 6;
	level.dds.var_9C5E = 17;
	level.dds.var_1BD1 = 2;
	level.dds.var_7B32 = 2;
	level.dds.var_747E = 500;
	level.dds.var_4914 = [];
	level.dds.var_4915 = 15;
	level.dds.var_4916 = 0;
	level.dds.var_747F = 0.25;
	level.dds.var_7480 = 0.25;
	level.dds.var_97F9 = "trig";
	level.dds.var_479E = 96;
	level.dds.var_9C1C = 0;
	level.dds.var_7301 = [];
	lib_A51B::func_4CD2();
	lib_A51B::func_4CD0();
	lib_A51B::func_4CD1();
	lib_A51B::func_4CD3();
	lib_A51B::func_4CCE();
	lib_A51B::func_4CCF();
	lib_A51B::func_4CCD();
	setdvar("dds_debug_table_active",1);
	setdvar("dds_drawDebugTable",0);
	setdvar("dds_logErrorsAndRequests",0);
	setdvar("dds_drawDebugInfo",0);
	setdvar("dds_drawDebugVerbose",0);
	setdvar("dds_drawDebugFlank",0);
	setdvar("dds_battlechater_disable",0);
	if(!isdefined(level.bcs_locations))
	{
		common_scripts\_bcs_location_trigs::bcs_location_trigs_init();
	}

	lib_A51B::func_6612();
}

//Function Number: 2
lib_A51B::func_4CD2(param_00,param_01)
{
	level.dds.var_1C8C = 0;
	level.dds.var_2244 = [];
	lib_A51B::func_0751("british","UK",2);
	lib_A51B::func_0751("american","US",3);
	lib_A51B::func_0751("seal","NS",4);
	lib_A51B::func_0751("taskforce","TF",1);
	lib_A51B::func_0751("secretservice","SS",4);
	lib_A51B::func_0751("delta","DF",3);
	lib_A51B::func_0751("french","FR",3);
	lib_A51B::func_0751("czech","CZ",3);
	lib_A51B::func_0751("pmc","PC",3);
	lib_A51B::func_0751("russian","RU",3);
	lib_A51B::func_0751("arab","AB",3);
	lib_A51B::func_0751("portugese","PG",3);
	lib_A51B::func_0751("shadowcompany","SC",4);
	lib_A51B::func_0751("african","AF",3);
	lib_A51B::func_0751("seal","GS",1);
	lib_A51B::func_0751("shadowcompany","SP",1);
	lib_A51B::func_0751("xslice","XS",3);
	lib_A51B::func_0751("atlas","AT",3);
	lib_A51B::func_0751("kva","KV",3);
	lib_A51B::func_0751("sentinel","SE",3);
	lib_A51B::func_0751("squad","SQ",3);
	lib_A51B::func_0751("northkorea","NK",3);
}

//Function Number: 3
lib_A51B::func_0751(param_00,param_01,param_02)
{
	level.dds.var_2244[param_00] = spawnstruct();
	level.dds.var_2244[param_00].label = param_01;
	level.dds.var_2244[param_00].count = 0;
	level.dds.var_2244[param_00].var_5A18 = param_02;
	for(var_03 = 0;var_03 < param_02;var_03++)
	{
		var_04 = param_01 + var_03;
		level.dds.var_1C8D[var_04] = 0;
	}
}

//Function Number: 4
lib_A51B::func_4CD0()
{
	level.dds.var_1BD2 = [];
	lib_A51B::func_074F("oclock",5);
}

//Function Number: 5
lib_A51B::func_074F(param_00,param_01)
{
	level.dds.var_1BD2[param_00] = spawnstruct();
	level.dds.var_1BD2[param_00].var_9366 = param_01;
	level.dds.var_1BD2[param_00].timeout = 0;
	level.dds.var_1BD2[param_00].var_1BCE = [];
	level.dds.var_1BD2[param_00].var_5564 = param_01;
	level.dds.var_1BD2[param_00].var_5561 = gettime();
	level.dds.var_1BD2[param_00].var_1258 = 0;
}

//Function Number: 6
lib_A51B::func_4CD1()
{
	level.dds.var_1BD3 = [];
	lib_A51B::func_0750("oclock",5);
}

//Function Number: 7
lib_A51B::func_0750(param_00,param_01)
{
	level.dds.var_1BD3[param_00] = spawnstruct();
	level.dds.var_1BD3[param_00].var_9366 = param_01;
	level.dds.var_1BD3[param_00].timeout = 0;
	level.dds.var_1BD3[param_00].var_1BCE = [];
	level.dds.var_1BD3[param_00].var_5564 = param_01;
	level.dds.var_1BD3[param_00].var_5561 = gettime();
	level.dds.var_1BD3[param_00].var_1258 = 0;
}

//Function Number: 8
lib_A51B::func_4CD3()
{
	common_scripts\utility::flag_init("dds_running_allies");
	level thread lib_A51B::func_261D("allies");
	common_scripts\utility::flag_init("dds_running_axis");
	level thread lib_A51B::func_261D("axis");
}

//Function Number: 9
lib_A51B::func_4CCE()
{
	if(!isdefined(level.dds.var_1BCE))
	{
		level.dds.var_1BCE = [];
	}

	lib_A51B::func_074D("react_ast","react_ast",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_zipliners","react_zipliners",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_man_down","react_man_down",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_microwave","react_microwave",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_boost_jumpers","react_boost_jumpers",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_drones","react_drones",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_elite","react_elite",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_dogs","react_dogs",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_mmg","react_mmg",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_friendly_fire","react_friendly_fire",3,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.8,1,0,"",undefined,undefined);
	lib_A51B::func_074D("react_sniper","react_sniper",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,240,0,"",undefined,undefined);
	lib_A51B::func_074D("react_rpg","react_rpg",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,10,0,"",undefined,undefined);
	lib_A51B::func_074D("react_emp","react_emp",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("react_grenade","react_grenade",1.25,"grenade_rspns",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("kill_confirm","act_kill_confirm",2,"rspns_killfirm",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2500,0.7,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("headshot","act_kill_confirm",0.75,"rspns_killfirm",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2500,0.7,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("rspns_killfirm","rspns_killfirm",0.75,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2500,1,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("rspns_movement","rspns_movement",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.2,13.5,0,"",undefined,undefined);
	lib_A51B::func_074D("fragout","act_fragout",0.75,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("empout","act_empout",0.5,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.7,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("trigger",level.dds.var_97F9,0.5,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.95,20,1,"rspns_affirm",::lib_A51B::func_0B01,undefined);
	lib_A51B::func_074D("thrt_left","thrt_left",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074D("thrt_right","thrt_right",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074D("thrt_behind","thrt_behind",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074D("thrt_front","thrt_front",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074D("thrt_flankleft","thrt_flankleft",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074D("thrt_flankright","thrt_flankright",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074D("thrt_flank","thrt_flank",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074D("thrt_clock01","thrt_clock01",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock10","thrt_clock10",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock11","thrt_clock11",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock12","thrt_clock12",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock02","thrt_clock02",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock03","thrt_clock03",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock04","thrt_clock04",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock05","thrt_clock05",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock06","thrt_clock06",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock07","thrt_clock07",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock08","thrt_clock08",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_clock09","thrt_clock09",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074D("thrt_dist10","thrt_dist10",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074D("thrt_dist20","thrt_dist20",2.5,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074D("thrt_dist30","thrt_dist30",2.5,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074D("thrt_dist40","thrt_dist40",2.5,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074D("thrt_open","thrt_open",2.5,"rspns_suppress",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,18,0,"",undefined,undefined);
	lib_A51B::func_074D("thrt_exposed","thrt_exposed",2.5,"rspns_suppress",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,18,0,"",undefined,undefined);
	lib_A51B::func_074D("thrt_movement","thrt_movement",2.5,"thrt_rspns",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,18,0,"",undefined,undefined);
	lib_A51B::func_074D("thrt_breaking","thrt_breaking",2.5,"rspns_lm",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.1,7.5,0,"",undefined,undefined);
	lib_A51B::func_074D("rspns_act","rspns_act",2,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.2,4,0,"",undefined,undefined);
	lib_A51B::func_074D("rspns_affirm","rspns_affirm",2,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.2,4,0,"",undefined,undefined);
	lib_A51B::func_074D("rspns_neg","rspns_neg",2,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.2,4,0,"",undefined,undefined);
	lib_A51B::func_074D("rspns_suppress","react_suppress",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.8,14,0,"",undefined,undefined);
	lib_A51B::func_074D("casualty","react_casualty",2,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2800,1,1.4,0,"",undefined,undefined);
	lib_A51B::func_074D("reload","act_reload",2,"action_rspns",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,5000,0.3,3.5,0,"",undefined,undefined);
	lib_A51B::func_074D("kill_melee","kill_melee",0.75,"",1,::lib_A51B::func_2620,::lib_A51B::func_3CCB,400,1,3.5,0,"",undefined,undefined);
	lib_A51B::func_074D("order_combatmove","order_combatmove",3,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.3,8,0,"",undefined,undefined);
	lib_A51B::func_074D("order_noncombatmove","order_noncombatmove",3,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.3,8,0,"",undefined,undefined);
	lib_A51B::func_074D("order_coverme","order_coverme",3,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.7,8,0,"",undefined,undefined);
	lib_A51B::func_074D("react_leave_cover","react_leave_cover",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("react_cantsee","react_cantsee",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,300,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("act_moving","act_moving",0.75,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074D("order_suppress","order_suppress",3,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.3,8,0,"",undefined,undefined);
	lib_A51B::func_074D("order_coverme","order_coverme",3,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.3,8,0,"",undefined,undefined);
	lib_A51B::func_074D("order_kill_command","order_kill_command",3,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.3,8,0,"",undefined,undefined);
}

//Function Number: 10
lib_A51B::func_4CCF()
{
	if(!isdefined(level.dds.var_1BCF))
	{
		level.dds.var_1BCF = [];
	}

	lib_A51B::func_074E("react_em1","react_em1",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.8,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("react_smart","react_smart",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("react_rpg","react_rpg",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,3000,0.8,10,0,"",undefined,undefined);
	lib_A51B::func_074E("react_emp","react_emp",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074E("react_grenade","react_grenade",1.25,"grenade_rspns",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074E("react_sniper","react_sniper",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_acquired","thrt_acquired",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,5000,0.3,16.5,0,"",undefined,undefined);
	lib_A51B::func_074E("kill_confirm","act_kill_confirm",2,"rspns_killfirm",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2500,0.7,1.5,0,"",undefined,undefined);
	lib_A51B::func_074E("headshot","act_kill_confirm",0.75,"rspns_killfirm",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2500,0.7,1.5,0,"",undefined,undefined);
	lib_A51B::func_074E("rspns_killfirm","rspns_killfirm",0.75,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2500,0.3,7,0,"",undefined,undefined);
	lib_A51B::func_074E("rspns_movement","rspns_movement",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.2,13.5,0,"",undefined,undefined);
	lib_A51B::func_074E("fragout","act_fragout",0.75,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074E("empout","act_empout",0.5,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.7,1.5,0,"",undefined,undefined);
	lib_A51B::func_074E("trigger",level.dds.var_97F9,0.5,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.95,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_dist10","thrt_dist10",0.5,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_dist20","thrt_dist20",0.5,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_dist30","thrt_dist30",0.5,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_dist40","thrt_dist40",0.5,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,3000,0.2,15,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_open","thrt_open",1,"rspns_suppress",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.7,18,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_exposed","thrt_exposed",2.5,"rspns_suppress",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,18,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_movement","thrt_movement",1,"thrt_rspns",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.7,18,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_breaking","thrt_breaking",1,"rspns_lm",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,2000,0.7,7.5,0,"",undefined,undefined);
	lib_A51B::func_074E("rspns_act","rspns_act",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,2000,0.2,4,0,"",undefined,undefined);
	lib_A51B::func_074E("rspns_affirm","rspns_affirm",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,2000,0.2,4,0,"",undefined,undefined);
	lib_A51B::func_074E("rspns_neg","rspns_neg",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,2000,0.2,4,0,"",undefined,undefined);
	lib_A51B::func_074E("thrt_clock01","thrt_clock01",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock02","thrt_clock02",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock03","thrt_clock03",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock04","thrt_clock04",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock05","thrt_clock05",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock06","thrt_clock06",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock07","thrt_clock07",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock08","thrt_clock08",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock09","thrt_clock09",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock10","thrt_clock10",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock11","thrt_clock11",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock12","thrt_clock12",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock01h","thrt_clock01h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock02h","thrt_clock02h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock03h","thrt_clock03h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock04h","thrt_clock04h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock05h","thrt_clock05h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock06h","thrt_clock06h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock07h","thrt_clock07h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock08h","thrt_clock08h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock09h","thrt_clock09h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock10h","thrt_clock10h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock11h","thrt_clock11h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_clock12h","thrt_clock12h",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,"use_group",1,"",undefined,"oclock");
	lib_A51B::func_074E("thrt_left","thrt_left",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_right","thrt_right",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_behind","thrt_behind",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_front","thrt_front",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_flankleft","thrt_flankleft",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_flankright","thrt_flankright",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_flank","thrt_flank",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2000,0.1,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinaln","thrt_cardinaln",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinalne","thrt_cardinalne",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinale","thrt_cardinale",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinalse","thrt_cardinalse",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinals","thrt_cardinals",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinalsw","thrt_cardinalsw",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinalw","thrt_cardinalw",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("thrt_cardinalnw","thrt_cardinalnw",2,"react_cover",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2000,0.15,20,1,"",undefined,undefined);
	lib_A51B::func_074E("rspns_suppress","react_suppress",0.5,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,2000,0.8,14,0,"",undefined,undefined);
	lib_A51B::func_074E("casualty","react_casualty",2,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE5,2800,1,1.4,0,"",undefined,undefined);
	lib_A51B::func_074E("reload","act_reload",2,"action_rspns",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,5000,0.3,3.5,0,"",undefined,undefined);
	lib_A51B::func_074E("kill_melee","kill_melee",0.75,"",1,::lib_A51B::func_2620,::lib_A51B::func_3CCB,400,1,3.5,0,"",undefined,undefined);
	lib_A51B::func_074E("order_combatmove","order_combatmove",3,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.3,8,0,"",undefined,undefined);
	lib_A51B::func_074E("order_noncombatmove","order_noncombatmove",3,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.3,8,0,"",undefined,undefined);
	lib_A51B::func_074E("order_coverme","order_coverme",3,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,2500,0.7,8,0,"",undefined,undefined);
	lib_A51B::func_074E("react_threat","react_threat",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("react_getting_away","react_getting_away",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("react_cantsee","react_cantsee",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("react_vehicle","react_vehicle",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("order_kill_command","order_kill_command",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("order_reinforce","order_reinforce",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("order_flush","order_flush",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("order_suppress","order_suppress",1.25,"",1,::lib_A51B::func_2620,::lib_A51B::func_3DE2,3000,0.4,26.5,0,"",undefined,undefined);
	lib_A51B::func_074E("act_moving","act_moving",0.75,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.8,1.5,0,"",undefined,undefined);
	lib_A51B::func_074E("act_advancing","act_advancing",0.75,"rspns_act",1,::lib_A51B::func_2620,::lib_A51B::func_3E5C,4000,0.8,1.5,0,"",undefined,undefined);
}

//Function Number: 11
lib_A51B::func_6612()
{
	if(animscripts\battlechatter::func_50A0())
	{
		lib_A51B::func_6614("trigger",undefined,undefined,undefined,undefined,undefined,undefined,1,10,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_open",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_exposed",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_movement",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_breaking",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist10",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist20",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist30",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist40",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock01",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock02",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock03",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock04",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock05",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock06",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock07",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock08",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock09",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock10",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock11",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock12",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("react_grenade",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("react_emp",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("react_sniper",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("rspns_neg",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_acquired",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("kill_confirm",undefined,undefined,undefined,undefined,undefined,undefined,0.5,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinaln",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalne",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinale",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalse",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinals",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalsw",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalw",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalnw",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("order_combatmove",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("order_noncombatmove",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("order_coverme",undefined,undefined,undefined,undefined,undefined,undefined,0,undefined,undefined,undefined,undefined,undefined);
		level.dds.var_9C1C = 1;
	}

	if(isdefined(level.var_669))
	{
		lib_A51B::func_6614("trigger",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist10",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist20",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist30",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_dist40",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_open",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_exposed",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_movement",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_breaking",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock01",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock02",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock03",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock04",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock05",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock06",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock07",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock08",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock09",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock10",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock11",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock12",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_acquired",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinaln",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalne",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinale",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalse",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinals",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalsw",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalw",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_cardinalnw",undefined,undefined,undefined,undefined,undefined,undefined,undefined,30,undefined,undefined,undefined,undefined);
		level.dds.var_9C1C = 1;
	}

	if(animscripts\battlechatter::func_502F())
	{
		lib_A51B::func_6614("trigger",undefined,undefined,undefined,undefined,undefined,undefined,1,10,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock01",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock02",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock03",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock04",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock05",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock06",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock07",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock08",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock09",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock10",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock11",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		lib_A51B::func_6614("thrt_clock12",undefined,undefined,undefined,undefined,undefined,undefined,0.1,20,undefined,undefined,undefined,undefined);
		level.dds.var_9C1C = 1;
	}
}

//Function Number: 12
lib_A51B::func_074D(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C,param_0D)
{
	if(isdefined(level.dds.var_717))
	{
		for(var_0E = 0;var_0E < level.dds.var_1BCE.size;var_0E++)
		{
			if(level.dds.var_1BCE[var_0E].name == param_00)
			{
				if(isdefined(param_01))
				{
					level.dds.var_1BCE[var_0E].var_9D8 = param_01;
				}

				if(isdefined(param_02))
				{
					level.dds.var_1BCE[var_0E].duration = param_02;
				}

				if(isdefined(param_03))
				{
					level.dds.var_1BCE[var_0E].var_766D = param_03;
				}

				if(isdefined(param_04))
				{
					level.dds.var_1BCE[var_0E].var_1EC8 = param_04;
				}

				if(isdefined(param_05))
				{
					level.dds.var_1BCE[var_0E].var_6FBC = param_05;
				}

				if(isdefined(param_06))
				{
					level.dds.var_1BCE[var_0E].var_3E84 = param_06;
				}

				if(isdefined(param_07))
				{
					level.dds.var_1BCE[var_0E].var_8A12 = param_07;
				}

				if(isdefined(param_08))
				{
					level.dds.var_1BCE[var_0E].var_6FD8 = param_08;
				}

				if(isdefined(param_09))
				{
					level.dds.var_1BCE[var_0E].var_9366 = param_09;
				}

				if(isdefined(param_0A))
				{
					level.dds.var_1BCE[var_0E].var_8474 = param_0A;
				}

				if(isdefined(param_0B))
				{
					level.dds.var_1BCE[var_0E].var_766E = param_0B;
				}

				if(isdefined(param_0C))
				{
					level.dds.var_1BCE[var_0E].var_B02 = param_0C;
				}

				if(isdefined(param_0D))
				{
					level.dds.var_1BCE[var_0E].var_4417 = param_0D;
					level.dds.var_1BD2[param_0D].var_1BCE[level.dds.var_1BD2[param_0D].var_1BCE.size] = param_00;
				}

				return;
			}
		}

		return;
	}

	var_0F = spawnstruct();
	var_0F.name = param_00;
	var_0F.var_9D8 = param_01;
	var_0F.duration = param_02;
	var_0F.var_6FBC = param_05;
	var_0F.var_6FD8 = param_08;
	var_0F.var_3E84 = param_06;
	var_0F.var_8A12 = param_07;
	var_0F.var_5561 = gettime();
	var_0F.var_1258 = 0;
	var_0F.timeout = randomint(10);
	var_0F.var_5564 = var_0F.timeout;
	var_0F.var_9366 = param_09;
	var_0F.var_766D = param_03;
	var_0F.var_1EC8 = param_04;
	var_0F.var_8474 = param_0A;
	var_0F.var_766E = param_0B;
	var_0F.var_B02 = param_0C;
	var_0F.var_4417 = param_0D;
	if(isdefined(param_0D))
	{
		level.dds.var_1BD2[param_0D].var_1BCE[level.dds.var_1BD2[param_0D].var_1BCE.size] = param_00;
	}

	level.dds.var_1BCE[level.dds.var_1BCE.size] = var_0F;
}

//Function Number: 13
lib_A51B::func_074E(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C,param_0D)
{
	if(isdefined(level.dds.var_718))
	{
		for(var_0E = 0;var_0E < level.dds.var_1BCE.size;var_0E++)
		{
			if(level.dds.var_1BCF[var_0E].name == param_00)
			{
				if(isdefined(param_01))
				{
					level.dds.var_1BCF[var_0E].var_9D8 = param_01;
				}

				if(isdefined(param_02))
				{
					level.dds.var_1BCF[var_0E].duration = param_02;
				}

				if(isdefined(param_03))
				{
					level.dds.var_1BCF[var_0E].var_766D = param_03;
				}

				if(isdefined(param_04))
				{
					level.dds.var_1BCF[var_0E].var_1EC8 = param_04;
				}

				if(isdefined(param_05))
				{
					level.dds.var_1BCF[var_0E].var_6FBC = param_05;
				}

				if(isdefined(param_06))
				{
					level.dds.var_1BCF[var_0E].var_3E84 = param_06;
				}

				if(isdefined(param_07))
				{
					level.dds.var_1BCF[var_0E].var_8A12 = param_07;
				}

				if(isdefined(param_08))
				{
					level.dds.var_1BCF[var_0E].var_6FD8 = param_08;
				}

				if(isdefined(param_09))
				{
					level.dds.var_1BCF[var_0E].var_9366 = param_09;
				}

				if(isdefined(param_0B))
				{
					level.dds.var_6097[var_0E].var_766E = param_0B;
				}

				if(isdefined(param_0C))
				{
					level.dds.var_1BCF[var_0E].var_B02 = param_0C;
				}

				if(isdefined(param_0D))
				{
					level.dds.var_1BCF[var_0E].var_4417 = param_0D;
					level.dds.var_1BD3[param_0D].var_1BCE[level.dds.var_1BD3[param_0D].var_1BCE.size] = param_00;
				}

				return;
			}
		}

		return;
	}

	var_0F = spawnstruct();
	var_0F.name = param_00;
	var_0F.var_9D8 = param_01;
	var_0F.duration = param_02;
	var_0F.var_6FBC = param_05;
	var_0F.var_6FD8 = param_08;
	var_0F.var_3E84 = param_06;
	var_0F.var_8A12 = param_07;
	var_0F.var_5561 = gettime();
	var_0F.var_1258 = 0;
	var_0F.timeout = randomint(10);
	var_0F.var_5564 = var_0F.timeout;
	var_0F.var_9366 = param_09;
	var_0F.var_766D = param_03;
	var_0F.var_1EC8 = param_04;
	var_0F.var_766E = param_0B;
	var_0F.var_B02 = param_0C;
	var_0F.var_4417 = param_0D;
	if(isdefined(param_0D))
	{
		level.dds.var_1BD3[param_0D].var_1BCE[level.dds.var_1BD3[param_0D].var_1BCE.size] = param_00;
	}

	level.dds.var_1BCF[level.dds.var_1BCF.size] = var_0F;
}

//Function Number: 14
lib_A51B::func_4CCD()
{
	level.dds.var_717 = [];
	level.dds.var_718 = [];
	for(var_00 = 0;var_00 < level.dds.var_1BCE.size;var_00++)
	{
		level.dds.var_717[level.dds.var_1BCE[var_00].name] = [];
	}

	for(var_00 = 0;var_00 < level.dds.var_1BCF.size;var_00++)
	{
		level.dds.var_718[level.dds.var_1BCF[var_00].name] = [];
	}
}

//Function Number: 15
lib_A51B::func_6614(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C)
{
	lib_A51B::func_6613(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C);
	lib_A51B::func_6615(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C);
}

//Function Number: 16
lib_A51B::func_6613(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C)
{
	lib_A51B::func_074D(param_00,undefined,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C);
}

//Function Number: 17
lib_A51B::func_6615(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C)
{
	lib_A51B::func_074E(param_00,undefined,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A,param_0B,param_0C);
}

//Function Number: 18
lib_A51B::func_7426()
{
	lib_A51B::func_4CCE();
	lib_A51B::func_4CCF();
	level.dds.var_9C1C = 0;
}

//Function Number: 19
lib_A51B::func_25FE()
{
	for(var_00 = 0;var_00 < level.dds.var_1BCE.size;var_00++)
	{
		var_01 = level.dds.var_1BCE[var_00];
		for(var_02 = 0;var_02 < level.dds.var_717[var_01.name].size;var_02++)
		{
			level.dds.var_717[var_01.name][var_02].duration = level.dds.var_717[var_01.name][var_02].duration - level.dds.var_4791;
			if(level.dds.var_717[var_01.name][var_02].duration <= 0 || level.dds.var_717[var_01.name][var_02].var_1EB6)
			{
				level.dds.var_717[var_01.name] = common_scripts\utility::array_remove(level.dds.var_717[var_01.name],level.dds.var_717[var_01.name][var_02]);
			}
		}
	}
}

//Function Number: 20
lib_A51B::func_25FF()
{
	for(var_00 = 0;var_00 < level.dds.var_1BCF.size;var_00++)
	{
		var_01 = level.dds.var_1BCF[var_00];
		for(var_02 = 0;var_02 < level.dds.var_718[var_01.name].size;var_02++)
		{
			level.dds.var_718[var_01.name][var_02].duration = level.dds.var_718[var_01.name][var_02].duration - level.dds.var_4791;
			if(level.dds.var_718[var_01.name][var_02].duration <= 0 || level.dds.var_718[var_01.name][var_02].var_1EB6)
			{
				level.dds.var_718[var_01.name] = common_scripts\utility::array_remove(level.dds.var_718[var_01.name],level.dds.var_718[var_01.name][var_02]);
			}
		}
	}
}

//Function Number: 21
lib_A51B::func_25FC()
{
	for(var_00 = 0;var_00 < level.dds.var_1BCE.size;var_00++)
	{
		for(var_01 = 0;var_01 < level.dds.var_717[level.dds.var_1BCE[var_00].name].size;var_01++)
		{
			level.dds.var_717[level.dds.var_1BCE[var_00].name] = [];
		}
	}
}

//Function Number: 22
lib_A51B::func_25FD()
{
	for(var_00 = 0;var_00 < level.dds.var_1BCF.size;var_00++)
	{
		for(var_01 = 0;var_01 < level.dds.var_718[level.dds.var_1BCF[var_00].name].size;var_01++)
		{
			level.dds.var_718[level.dds.var_1BCF[var_00].name] = [];
		}
	}
}

//Function Number: 23
lib_A51B::func_260F()
{
	if(common_scripts\utility::flag("dds_running_allies"))
	{
		return;
	}

	common_scripts\utility::flag_set("dds_running_allies");
	lib_A51B::func_2607("allies","axis");
	var_00 = 0;
	while(common_scripts\utility::flag("dds_running_allies"))
	{
		if(isdefined(level.var_628F) && level.var_628F > 0)
		{
			var_00 = 1;
			wait(level.dds.var_4791);
			continue;
		}

		if(var_00)
		{
			wait(level.dds.var_7B32);
			lib_A51B::func_25FC();
			var_00 = 0;
		}

		if(!lib_A51B::func_261A())
		{
			wait(level.dds.var_4791);
			continue;
		}

		wait(0.1);
		lib_A51B::func_25FE();
	}
}

//Function Number: 24
lib_A51B::func_2610()
{
	if(common_scripts\utility::flag("dds_running_axis"))
	{
		return;
	}

	common_scripts\utility::flag_set("dds_running_axis");
	lib_A51B::func_2607("axis","allies");
	var_00 = 0;
	while(common_scripts\utility::flag("dds_running_axis"))
	{
		if(isdefined(level.var_628F) && level.var_628F > 1)
		{
			var_00 = 1;
			wait(level.dds.var_4791);
			continue;
		}

		if(var_00)
		{
			wait(level.dds.var_7B32);
			lib_A51B::func_25FD();
			var_00 = 0;
		}

		if(lib_A51B::func_261B())
		{
			wait(level.dds.var_4791);
			continue;
		}

		wait(0.1);
		lib_A51B::func_25FF();
	}
}

//Function Number: 25
lib_A51B::func_2607(param_00,param_01)
{
	level thread lib_A51B::func_2606(param_00,param_01);
}

//Function Number: 26
lib_A51B::func_2602(param_00)
{
	if(!isdefined(level.dds))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		level thread lib_A51B::func_260F();
		level thread lib_A51B::func_2610();
		return;
	}

	if(param_00 == "allies")
	{
		level thread lib_A51B::func_260F();
		return;
	}

	if(param_00 == "axis")
	{
		level thread lib_A51B::func_2610();
		return;
	}
}

//Function Number: 27
lib_A51B::func_2600(param_00)
{
	if(!isdefined(level.dds))
	{
		return;
	}

	if(!isdefined(param_00))
	{
		lib_A51B::func_25FC();
		common_scripts\utility::flag_clear("dds_running_allies");
		lib_A51B::func_25FD();
		common_scripts\utility::flag_clear("dds_running_axis");
		return;
	}

	switch(param_00)
	{
		case "axis":
			break;

		case "allies":
			break;

		default:
			break;
	}
}

//Function Number: 28
lib_A51B::func_261D(param_00)
{
	for(;;)
	{
		common_scripts\utility::flag_waitopen("dds_running_" + param_00);
		level notify("dds_running_" + param_00);
		common_scripts\utility::flag_wait("dds_running_" + param_00);
	}
}

//Function Number: 29
lib_A51B::func_5010()
{
	if(!isdefined(level.dds))
	{
		return 0;
	}

	if(level.createfx_enabled || !common_scripts\utility::flag("dds_running_allies") && !common_scripts\utility::flag("dds_running_axis"))
	{
		return 0;
	}

	return 1;
}

//Function Number: 30
lib_A51B::func_3581(param_00,param_01)
{
	if(param_01 == 0)
	{
		return 1;
	}

	return param_00 * lib_A51B::func_3581(param_00,param_01 - 1);
}

//Function Number: 31
lib_A51B::func_261A()
{
	foreach(var_01 in level.dds.var_1BD2)
	{
		if(var_01.timeout > 0)
		{
			var_01.timeout = var_01.timeout - level.dds.var_4791;
		}
	}

	for(var_03 = 0;var_03 < level.dds.var_1BCE.size;var_03++)
	{
		var_04 = level.dds.var_1BCE[var_03];
		if(isstring(var_04.var_9366) && var_04.var_9366 == "use_group")
		{
			if(level.dds.var_1BD2[var_04.var_4417].timeout > 0)
			{
				continue;
			}
		}
		else if(var_04.timeout > 0)
		{
			var_04.timeout = var_04.timeout - level.dds.var_4791;
			continue;
		}

		if(level.dds.var_717[var_04.name].size != 0)
		{
			level.dds.var_717[var_04.name] = [[ var_04.var_6FBC ]](level.dds.var_717[var_04.name]);
			for(var_05 = 0;var_05 < level.dds.var_717[var_04.name].size;var_05++)
			{
				if(randomfloat(1) >= var_04.var_6FD8)
				{
					level.dds.var_717[var_04.name][var_05].var_1EB6 = 1;
					continue;
				}

				if(level.dds.var_717[var_04.name][var_05].var_6FF5)
				{
					continue;
				}

				if(lib_A51B::func_2603(level.dds.var_717[var_04.name][var_05],var_04.var_3E84,var_04.var_8A12,var_04.var_766D,var_04.var_8474,var_04.var_766E,var_04.var_B02))
				{
					if(!isstring(var_04.var_9366) && var_04.var_9366 == 0)
					{
						var_04.timeout = var_04.var_9366;
					}
					else
					{
						var_06 = undefined;
						if(isstring(var_04.var_9366) && var_04.var_9366 == "use_group")
						{
							var_06 = level.dds.var_1BD2[var_04.var_4417];
						}
						else
						{
							var_06 = var_04;
						}

						if(gettime() - var_06.var_5561 < var_06.var_5564 * 1.5 * 1000)
						{
							var_06.var_1258++;
							if(var_06.var_1258 > level.dds.var_1BD1)
							{
								var_06.var_1258 = level.dds.var_1BD1;
							}
						}
						else
						{
							var_06.var_1258--;
							if(var_06.var_1258 < 0)
							{
								var_06.var_1258 = 0;
							}
						}

						var_06.timeout = var_06.var_9366 * lib_A51B::func_3581(2,var_06.var_1258) + randomint(2);
						var_06.var_5564 = var_06.timeout;
						var_06.var_5561 = gettime();
					}

					if(var_04.var_1EC8)
					{
						level.dds.var_717[var_04.name] = [];
						if(isdefined(var_04.var_4417))
						{
							for(var_07 = 0;var_07 < level.dds.var_1BD2[var_04.var_4417].var_1BCE.size;var_07++)
							{
								level.dds.var_717[level.dds.var_1BD2[var_04.var_4417].var_1BCE[var_07]] = [];
							}
						}
					}

					return 1;
				}
				else
				{
					wait(level.dds.var_4791);
				}
			}
		}
	}

	return 0;
}

//Function Number: 32
lib_A51B::func_261B()
{
	foreach(var_01 in level.dds.var_1BD3)
	{
		if(var_01.timeout > 0)
		{
			var_01.timeout = var_01.timeout - level.dds.var_4791;
		}
	}

	for(var_03 = 0;var_03 < level.dds.var_1BCF.size;var_03++)
	{
		var_04 = level.dds.var_1BCF[var_03];
		if(isstring(var_04.var_9366) && var_04.var_9366 == "use_group")
		{
			if(level.dds.var_1BD3[var_04.var_4417].timeout > 0)
			{
				continue;
			}
		}
		else if(var_04.timeout > 0)
		{
			var_04.timeout = var_04.timeout - level.dds.var_4791;
			continue;
		}

		if(level.dds.var_718[var_04.name].size != 0)
		{
			level.dds.var_718[var_04.name] = [[ var_04.var_6FBC ]](level.dds.var_718[var_04.name]);
			for(var_05 = 0;var_05 < level.dds.var_718[var_04.name].size;var_05++)
			{
				if(randomfloat(1) >= var_04.var_6FD8)
				{
					level.dds.var_718[var_04.name][var_05].var_1EB6 = 1;
					continue;
				}

				if(level.dds.var_718[var_04.name][var_05].var_6FF5)
				{
					continue;
				}

				if(lib_A51B::func_2603(level.dds.var_718[var_04.name][var_05],var_04.var_3E84,var_04.var_8A12,var_04.var_766D,0,var_04.var_766E,var_04.var_B02))
				{
					if(!isstring(var_04.var_9366) && var_04.var_9366 == 0)
					{
						var_04.timeout = var_04.var_9366;
					}
					else
					{
						var_06 = undefined;
						if(isstring(var_04.var_9366) && var_04.var_9366 == "use_group")
						{
							var_06 = level.dds.var_1BD3[var_04.var_4417];
						}
						else
						{
							var_06 = var_04;
						}

						if(gettime() - var_06.var_5561 < var_06.var_5564 * 1.5 * 1000)
						{
							var_06.var_1258++;
							if(var_06.var_1258 > level.dds.var_1BD1)
							{
								var_06.var_1258 = level.dds.var_1BD1;
							}
						}
						else
						{
							var_06.var_1258--;
							if(var_06.var_1258 < 0)
							{
								var_06.var_1258 = 0;
							}
						}

						var_06.timeout = var_06.var_9366 * lib_A51B::func_3581(2,var_06.var_1258) + randomint(2);
						var_06.var_5564 = var_06.timeout;
						var_06.var_5561 = gettime();
					}

					if(var_04.var_1EC8)
					{
						level.dds.var_718[var_04.name] = [];
						if(isdefined(var_04.var_4417))
						{
							for(var_07 = 0;var_07 < level.dds.var_1BD3[var_04.var_4417].var_1BCE.size;var_07++)
							{
								level.dds.var_718[level.dds.var_1BD3[var_04.var_4417].var_1BCE[var_07]] = [];
							}
						}
					}

					return 1;
				}
				else
				{
					wait(level.dds.var_4791);
				}
			}
		}
	}

	return 0;
}

//Function Number: 33
lib_A51B::func_2603(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_07 = param_00.var_1BD4;
	if(isdefined(param_00.var_1BD5))
	{
		var_07 = param_00.var_1BD5;
	}

	var_08 = param_00 [[ param_01 ]](isdefined(param_00.var_1BD5),param_02);
	if(!isdefined(var_08) || !isalive(var_08))
	{
		param_00.var_6FF5 = 1;
		return 0;
	}

	if(var_08.var_2600)
	{
		return 0;
	}

	var_0A = lib_A51B::func_2609(var_08,param_00.var_1BD0,param_00.ent,param_00.var_32EB);
	if(!isdefined(var_0A))
	{
		return 0;
	}

	if(isdefined(param_00.var_1BD5))
	{
		if(param_00.var_50B1)
		{
			wait(level.dds.var_747F);
		}
		else
		{
			wait(level.dds.var_7480);
		}
	}

	if(isdefined(param_00.var_6543) && param_00.var_6543 != "")
	{
		var_0B = lib_A51B::func_260A(var_08,param_00.var_6543);
		if(isdefined(var_0B))
		{
			lib_A51B::func_2604(var_08,var_0B);
			wait(0.6);
		}
	}

	lib_A51B::func_2604(var_08,var_0A,param_04);
	param_00.var_912C = var_08;
	param_00.var_912E = var_08.var_2E6;
	param_00.var_67F3 = var_0A;
	param_00.var_6FF5 = 1;
	lib_A51B::func_0786(var_0A);
	if(param_03 != "")
	{
		if(param_05 != "" && isdefined(param_06) && param_00 [[ param_06 ]]())
		{
			lib_A51B::func_2617(param_00,var_08,var_0A,param_05);
		}
		else
		{
			lib_A51B::func_2617(param_00,var_08,var_0A,param_03);
		}
	}

	return 1;
}

//Function Number: 34
lib_A51B::func_2604(param_00,param_01,param_02)
{
	if(!getdvarint("snd_dsp_futz"))
	{
		param_02 = 0;
	}

	if(isalive(param_00))
	{
		if(param_02 && !isplayer(param_00) && param_00.voice != "russian_english")
		{
			param_00 animscripts\face::func_6D97(undefined,"dds_squelch_strt",0.5,"dds_squelch_strt");
		}

		param_00 lib_A51B::func_7EC9(param_00);
		if(lib_A59A::func_3F72("dds_battlechater_disable") == 0)
		{
			param_00 animscripts\face::func_6D97(undefined,param_01,0.5,param_01);
		}

		param_00 lib_A51B::func_1ED8(param_00,param_01);
	}

	if(param_02 && !isplayer(param_00) && isalive(param_00) && param_00.voice != "russian_english")
	{
		param_00 animscripts\face::func_6D97(undefined,"dds_squelch_end",0.5,"dds_squelch_end");
	}
}

//Function Number: 35
lib_A51B::func_912D(param_00)
{
	return level.dds.var_1C8D[param_00.var_25FB];
}

//Function Number: 36
lib_A51B::func_7EC9(param_00)
{
	level.dds.var_1C8D[param_00.var_25FB] = 1;
}

//Function Number: 37
lib_A51B::func_1ED8(param_00,param_01)
{
	param_00 common_scripts\utility::waittill_any_timeout(5,param_01,"death");
	level.dds.var_1C8D[param_00.var_25FB] = 0;
}

//Function Number: 38
lib_A51B::func_0786(param_00)
{
	level.dds.var_4914[level.dds.var_4916] = param_00;
	level.dds.var_4916 = level.dds.var_4916 + 1 % level.dds.var_4915;
}

//Function Number: 39
lib_A51B::func_3DE4(param_00,param_01,param_02)
{
	var_03 = level.var_31D;
	if(self.var_50B1)
	{
		var_04 = function_00D6("allies");
		if(param_01)
		{
			var_04[var_04.size] = var_03;
		}
	}
	else
	{
		var_04 = function_00D6("axis");
	}

	if(var_04.size <= 0)
	{
		return undefined;
	}

	var_04 = lib_A51B::func_7329(var_04);
	if(param_00 && isdefined(self.var_912C))
	{
		var_04 = lib_A51B::func_732A(var_04,self.var_912C.var_25FB);
		var_05 = lib_A59A::func_3CF8(self.var_912C.var_2E6,var_04);
	}
	else
	{
		var_05 = lib_A59A::func_3CF8(var_04.var_2E6,var_05);
	}

	if(!isdefined(var_05))
	{
		return undefined;
	}

	var_06 = distancesquared(var_03.var_2E6,var_05.var_2E6);
	if(var_06 > param_02 * param_02)
	{
		return undefined;
	}

	if(param_00 && var_06 < level.dds.var_747E * level.dds.var_747E)
	{
		return undefined;
	}

	return var_05;
}

//Function Number: 40
lib_A51B::func_7329(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!isdefined(var_03.var_1823))
		{
			var_01[var_01.size] = var_03;
		}
	}

	return var_01;
}

//Function Number: 41
lib_A51B::func_732A(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(!isdefined(param_00[var_02].var_25FB))
		{
			param_00 = common_scripts\utility::array_remove(param_00,param_00[var_02]);
			continue;
		}

		if(param_00[var_02].var_25FB == param_01)
		{
			param_00 = common_scripts\utility::array_remove(param_00,param_00[var_02]);
			continue;
		}
	}

	return param_00;
}

//Function Number: 42
lib_A51B::func_3DE2(param_00,param_01)
{
	return lib_A51B::func_3DE4(param_00,1,param_01);
}

//Function Number: 43
lib_A51B::func_3DE5(param_00,param_01)
{
	return lib_A51B::func_3DE4(param_00,0,param_01);
}

//Function Number: 44
lib_A51B::func_3CCB(param_00,param_01)
{
	if(isdefined(self.var_32D5) && isalive(self.var_32D5))
	{
		if(isdefined(self.var_32EA))
		{
			if(isdefined(self.var_32D5.inliveplayerkillstreak) && self.var_32EA == self.var_32D5.inliveplayerkillstreak)
			{
				return undefined;
			}

			if(isdefined(self.var_32D5.var_9F4C) && self.var_32EA == self.var_32D5.var_9F4C)
			{
				return undefined;
			}
		}

		return self.var_32D5;
	}

	return undefined;
}

//Function Number: 45
lib_A51B::func_3E5C(param_00,param_01)
{
	if(isdefined(self.ent) && isalive(self.ent))
	{
		return self.ent;
	}

	return undefined;
}

//Function Number: 46
lib_A51B::func_0B01()
{
	return 1;
}

//Function Number: 47
lib_A51B::func_260A(param_00,param_01)
{
	return lib_A51B::func_2609(param_00,"name_" + param_01);
}

//Function Number: 48
lib_A51B::func_2609(param_00,param_01,param_02,param_03)
{
	if(!isalive(param_00))
	{
		return undefined;
	}

	if(!isdefined(param_00.var_25FB))
	{
		return undefined;
	}

	if(lib_A51B::func_912D(param_00))
	{
		return undefined;
	}

	var_04 = "dds_" + param_00.var_25FB + "_" + param_01;
	if(isdefined(param_02) && param_01 == level.dds.var_97F9)
	{
		var_05 = param_03 lib_A51B::func_3EA2(var_04);
		if(isdefined(var_05))
		{
			var_04 = var_04 + "_" + var_05;
		}
	}

	if(soundexists(var_04))
	{
		return var_04;
	}

	return undefined;
}

//Function Number: 49
lib_A51B::func_505C(param_00)
{
	for(var_01 = 0;var_01 < level.dds.var_4914.size;var_01++)
	{
		if(level.dds.var_4914[var_01] == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 50
lib_A51B::func_503F()
{
	var_00 = [];
	var_00 = animscripts\battlechatter::get_all_my_locations();
	return var_00.size > 0;
}

//Function Number: 51
lib_A51B::func_3EA2(param_00)
{
	var_01 = animscripts\battlechatter::get_all_my_locations();
	if(!isdefined(var_01) || var_01.size == 0)
	{
		return undefined;
	}

	if(var_01[0].locationaliases.size == 0)
	{
		return undefined;
	}

	foreach(var_03 in var_01[0].locationaliases)
	{
		param_00 = param_00 + "_" + var_03;
		if(soundexists(param_00))
		{
			return var_03;
		}
	}

	return undefined;
}

//Function Number: 52
lib_A51B::func_260B(param_00)
{
	var_01 = [];
	var_02 = getentarray("actor_enemy_dog","classname");
	foreach(var_04 in var_02)
	{
		if(lib_A51B::func_3E8E(var_04) == param_00)
		{
			var_01[var_01.size] = var_04;
		}
	}

	var_06 = lib_A59A::func_4150();
	foreach(var_04 in var_06)
	{
		if(lib_A51B::func_3E8E(var_04) == param_00)
		{
			if(lib_A51B::func_5017(var_04))
			{
				var_01[var_01.size] = var_04;
			}
		}
	}

	var_09 = getentarray("misc_turret","classname");
	foreach(var_04 in var_09)
	{
		if(lib_A51B::func_3E8E(var_04) == param_00)
		{
			if(lib_A51B::func_5090(var_04))
			{
				var_01[var_01.size] = var_04;
			}
		}
	}

	if(param_00 == "allies")
	{
		var_01[var_01.size] = level.var_31D;
	}

	return var_01;
}

//Function Number: 53
lib_A51B::func_3E8E(param_00)
{
	if(isdefined(param_00.inliveplayerkillstreak))
	{
		return param_00.inliveplayerkillstreak;
	}

	if(isdefined(param_00.var_7AE9))
	{
		return param_00.var_7AE9;
	}

	return "";
}

//Function Number: 54
lib_A51B::func_5017(param_00)
{
	if(isdefined(param_00.vehicletype) && param_00.vehicletype == "pdrone" || param_00.vehicletype == "aerial_drone" || param_00.vehicletype == "attack_drone_queen" || issubstr(param_00.vehicletype,"drone"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 55
lib_A51B::func_5090(param_00)
{
	if(param_00.classname == "misc_turret" && param_00 isfiringturret())
	{
		return 1;
	}

	return 0;
}

//Function Number: 56
lib_A51B::func_2606(param_00,param_01)
{
	var_02 = 0;
	var_03 = 3000;
	var_04 = param_01 == "allies";
	var_05 = 0;
	while(common_scripts\utility::flag("dds_running_" + param_00))
	{
		var_06 = level.var_31D;
		var_07 = function_00D6(param_01);
		var_08 = function_00D6(param_00);
		var_09 = lib_A51B::func_260B(param_00);
		var_0A = 0;
		var_0B = 0;
		var_0C = 0;
		var_0D = 0;
		for(var_0E = 0;var_0E < var_08.size + var_09.size;var_0E++)
		{
			var_0F = undefined;
			var_10 = 0;
			if(var_0E >= var_08.size)
			{
				var_10 = 1;
			}

			if(var_10)
			{
				var_0F = var_09[var_0E - var_08.size];
			}
			else
			{
				var_0F = var_08[var_0E];
			}

			for(var_11 = 0;var_11 < var_07.size;var_11++)
			{
				if(var_07.size >= 1 && randomfloat(1) < 0.5)
				{
					var_0D++;
					var_12 = var_07[var_11];
					if(var_12.var_20B5 > 0)
					{
						var_0C = 1;
					}

					var_13 = 0;
					if(distancesquared(var_12.var_2E6,var_0F.var_2E6) < 16000000 && var_12 method_81BE(var_0F))
					{
						var_13 = 1;
						var_0B = 1;
					}

					if(var_13 && distancesquared(var_12.var_2E6,var_06.var_2E6) < 16000000)
					{
						var_12 lib_A51B::func_2619(var_04,var_0F);
						if(var_10)
						{
							continue;
						}

						var_12 lib_A51B::func_2618(var_04,var_0F);
						var_0A = 1;
						if(gettime() > var_02)
						{
							var_14 = var_12 gettagorigin("TAG_EYE");
							var_15 = var_0F.var_2E6 - var_14;
							var_12 lib_A51B::func_857D(var_0F,var_15,var_04);
							var_12 lib_A51B::func_7801(var_0F,var_15);
							var_02 = var_02 + var_03;
						}

						break;
					}
				}
			}

			if(var_0A)
			{
				break;
			}
		}

		if(!var_04 && var_07.size > 0 && var_0D / var_07.size > 0.75)
		{
			if(!var_0B && var_0B != var_05 && var_0C)
			{
				var_07[0] lib_A51B::func_2612("react_cantsee",var_04);
			}

			var_05 = var_0B;
		}

		wait(0.3 + randomfloat(0.2));
	}
}

//Function Number: 57
lib_A51B::func_7801(param_00,param_01)
{
	self.var_2623 = param_00;
	self.var_2622 = param_01;
	self.var_2624 = self.var_2E6;
}

//Function Number: 58
lib_A51B::func_857D(param_00,param_01,param_02)
{
	var_03 = undefined;
	if(!isdefined(self.var_2623))
	{
		self.var_2623 = undefined;
		self.var_2622 = undefined;
		return;
	}

	if(param_00 != self.var_2623)
	{
		return;
	}

	if(distance2dsquared(self.var_2E6,self.var_2623.var_2E6) < 90000)
	{
		return;
	}

	if(distance2dsquared(self.var_2E6,self.var_2624) > 10000)
	{
		return;
	}

	var_04 = vectortoangles(self.var_2622)[1];
	var_05 = vectortoangles(param_01)[1];
	var_06 = var_05 - var_04;
	if(var_06 < -180)
	{
		var_06 = var_05 + 360 - var_04;
	}

	if(var_06 > 180)
	{
		var_06 = var_05 - 360 - var_04;
	}

	if(var_06 < -45)
	{
		var_03 = "RIGHT";
	}

	if(var_06 > 45)
	{
		var_03 = "LEFT";
	}

	if(isdefined(var_03))
	{
		lib_A51B::func_2612("thrt_flank",param_02,self.var_2623);
		if(var_03 == "RIGHT")
		{
			lib_A51B::func_2612("thrt_flankright",param_02,self.var_2623,"");
		}

		if(var_03 == "LEFT")
		{
			lib_A51B::func_2612("thrt_flankleft",param_02,self.var_2623,"");
		}
	}
}

//Function Number: 59
lib_A51B::func_260C(param_00)
{
	if(!isdefined(level.var_31D))
	{
		return;
	}

	var_01 = level.var_31D getplayerangles();
	var_02 = anglestoforward(var_01);
	var_03 = vectornormalize(var_02);
	var_04 = level.var_31D getorigin();
	var_05 = param_00 - var_04;
	var_06 = vectornormalize(var_05);
	var_07 = vectordot(var_03,var_06);
	var_08 = acos(var_07);
	var_09 = vectorcross(var_03,var_06);
	var_0A = vectordot(var_09,anglestoup(var_01));
	if(var_0A < 0)
	{
		var_08 = var_08 * -1;
	}

	var_0B = var_08 + 180;
	var_0C = 6;
	for(var_0D = 15;var_0D < 375;var_0D = var_0D + 30)
	{
		if(var_0B < var_0D)
		{
			break;
		}

		var_0C = var_0C - 1;
		if(var_0C < 1)
		{
			var_0C = 12;
		}
	}

	return var_0C;
}

//Function Number: 60
lib_A51B::func_2619(param_00,param_01)
{
	var_02 = "";
	if(!isdefined(level.var_31D))
	{
		return;
	}

	if(lib_A51B::func_3E8E(self) == level.var_31D.inliveplayerkillstreak)
	{
		var_03 = level.var_31D;
		var_04 = var_03.var_2E6;
		var_05 = level.var_31D.var_41;
		var_06 = param_01.var_2E6;
	}
	else
	{
		var_03 = self;
		var_04 = var_06.var_2E6;
		var_05 = animscripts\battlechatter::func_40B2(var_05);
		var_06 = var_02.var_2E6;
	}

	if((isdefined(param_01.type) && param_01.type == "dog") || param_01.classname == "actor_enemy_dog")
	{
		lib_A51B::func_2612("react_dogs",param_00,param_01,var_02);
		return;
	}

	if(isdefined(param_01.var_5094) && param_01.var_5094)
	{
		lib_A51B::func_2612("react_boost_jumpers",param_00,param_01,var_02);
		return;
	}

	if(lib_A51B::func_5017(param_01))
	{
		lib_A51B::func_2612("react_drones",param_00,param_01,var_02);
		return;
	}

	if(isdefined(param_01.var_305D) && param_01.var_305D)
	{
		lib_A51B::func_2612("react_elites",param_00,param_01,var_02);
		return;
	}

	if((isdefined(param_01.var_C4D) && param_01.var_C4D == "mech") || param_01.classname == "actor_enemy_mech")
	{
		lib_A51B::func_2612("react_ast",param_00,param_01,var_02);
		return;
	}

	if(isdefined(param_01.var_5096) && param_01.var_5096)
	{
		lib_A51B::func_2612("react_zipliners",param_00,param_01,var_02);
		return;
	}

	if(isdefined(param_01.alias) && animscripts\utility::func_51A9(param_01.alias))
	{
		lib_A51B::func_2612("react_sniper",param_00,param_01,var_02);
		return;
	}

	if(lib_A51B::func_5090(param_01))
	{
		lib_A51B::func_2612("react_mmg",param_00,param_01,var_02);
		return;
	}
}

//Function Number: 61
lib_A51B::func_2618(param_00,param_01)
{
	var_02 = (0,0,0);
	var_03 = (0,0,0);
	var_04 = self;
	var_05 = "";
	if(!isdefined(level.var_31D))
	{
		return;
	}

	if(self.inliveplayerkillstreak == level.var_31D.inliveplayerkillstreak && !isdefined(param_01))
	{
		return;
	}

	if(self.inliveplayerkillstreak == level.var_31D.inliveplayerkillstreak)
	{
		var_04 = level.var_31D;
		var_03 = var_04.var_2E6;
		var_06 = level.var_31D.var_41;
		var_02 = param_01.var_2E6;
		if(randomint(100) > 50)
		{
			var_05 = var_04.var_25FB;
		}
	}
	else
	{
		var_05 = self;
		var_04 = var_05.var_2E6;
		var_06 = animscripts\battlechatter::func_40B2(var_05);
		var_02 = param_01.var_2E6;
	}

	var_07 = distancesquared(var_02,var_03);
	var_08 = var_02[2] - var_03[2];
	if(param_01 lib_A51B::func_503F())
	{
		lib_A51B::func_2612("trigger",param_00,param_01,var_05);
	}

	if(var_07 < 200)
	{
		lib_A51B::func_2612("thrt_dist10",param_00,param_01,var_05);
	}
	else if(var_07 < 500)
	{
		lib_A51B::func_2612("thrt_dist20",param_00,param_01,var_05);
	}
	else if(var_07 < 1000)
	{
		lib_A51B::func_2612("thrt_dist30",param_00,param_01,var_05);
	}

	if(param_01 animscripts\battlechatter::func_5100(0))
	{
		lib_A51B::func_2612("thrt_exposed",param_00,param_01,var_05);
	}
	else
	{
		lib_A51B::func_2612("thrt_open",param_00,param_01,var_05);
	}

	var_09 = animscripts\battlechatter::func_3F59(var_06,var_03,var_02);
	var_0A = animscripts\battlechatter::func_3F5B(var_09);
	if(var_08 > level.dds.var_479E)
	{
		if(lib_A59A::func_8F50(var_0A))
		{
			var_0A = "0" + var_0A;
		}

		lib_A51B::func_2612("thrt_clockh" + var_0A,param_00,param_01,var_05);
	}

	if(lib_A59A::func_8F50(var_0A))
	{
		var_0A = "0" + var_0A;
	}

	lib_A51B::func_2612("thrt_clock" + var_0A,param_00,param_01,var_05);
	if(var_09 >= 45 && var_09 <= 135)
	{
		lib_A51B::func_2612("thrt_right",param_00,param_01,var_05);
	}
	else if(var_09 > 135 && var_09 <= 225)
	{
		lib_A51B::func_2612("thrt_back",param_00,param_01,var_05);
	}
	else if(var_09 >= 225 && var_09 <= 315)
	{
		lib_A51B::func_2612("thrt_left",param_00,param_01,var_05);
	}
	else
	{
		lib_A51B::func_2612("thrt_front",param_00,param_01,var_05);
	}

	var_0B = animscripts\battlechatter::func_3F58(var_03,var_02);
	var_0C = animscripts\battlechatter::func_615E(var_0B);
	lib_A51B::func_2612("thrt_cardinal" + var_0C,param_00,param_01,var_05);
}

//Function Number: 62
lib_A51B::player_init()
{
	if(!isplayer(self))
	{
		return;
	}

	if(!isdefined(level.dds))
	{
		return;
	}

	self.var_5139 = 0;
	self.var_5395 = 0;
	lib_A59A::func_32DC("dds_killstreak");
	lib_A59A::func_32DC("dds_low_health");
	thread lib_A51B::func_260E();
	thread lib_A51B::func_2627();
	thread lib_A51B::func_2611();
	self.var_25FB = "player";
	while(!isdefined(level.var_1A3D))
	{
		wait(0.1);
	}

	self.var_2243 = level.dds.var_2244[level.var_1A3D].label;
	self.var_2600 = 0;
	level.dds.var_1C8D[self.var_25FB] = 0;
}

//Function Number: 63
lib_A51B::func_2611()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		level common_scripts\utility::flag_wait("dds_running_" + self.inliveplayerkillstreak);
		self waittill("multikill");
		lib_A51B::func_2612("multikill",self.inliveplayerkillstreak == "allies");
	}
}

//Function Number: 64
lib_A51B::func_2627()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		level common_scripts\utility::flag_wait("dds_running_" + self.inliveplayerkillstreak);
		wait(0.5);
		if(self.health < self.var_275 * 0.4)
		{
			lib_A51B::func_2612("low_health",self.inliveplayerkillstreak == "allies");
			lib_A59A::func_32DD("dds_low_health");
			thread lib_A51B::func_7431();
		}

		lib_A59A::func_32E3("dds_low_health");
	}
}

//Function Number: 65
lib_A51B::func_7431()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		if(self.health > self.var_275 * 0.75)
		{
			lib_A59A::func_32D9("dds_low_health");
			return;
		}

		wait(1);
	}
}

//Function Number: 66
lib_A51B::func_260E()
{
	self endon("death");
	self endon("disconnect");
	var_00 = lib_A59A::func_3F72("dds_killstreak_kills",3);
	var_01 = lib_A59A::func_3F72("dds_killstreak_timer",10);
	for(;;)
	{
		level common_scripts\utility::flag_wait("dds_running_" + self.inliveplayerkillstreak);
		lib_A59A::func_32DF("dds_killstreak");
		self.var_5395++;
		if(!self.var_5139)
		{
			self.var_5139 = 1;
			thread lib_A51B::func_94A3(var_00,var_01);
		}

		lib_A59A::func_32D9("dds_killstreak");
	}
}

//Function Number: 67
lib_A51B::func_94A3(param_00,param_01)
{
	var_02 = gettime() + param_01 * 1000;
	while(gettime() < var_02)
	{
		if(self.var_5395 >= param_00)
		{
			lib_A51B::func_2612("killstreak",self.inliveplayerkillstreak == "allies");
			self.var_5395 = 0;
			var_02 = -1;
		}

		wait(0.1);
	}

	self.var_5395 = 0;
	self.var_5139 = 0;
}

//Function Number: 68
lib_A51B::func_25FA()
{
	if(!isdefined(level.dds))
	{
		return;
	}

	lib_A51B::func_2608();
	thread lib_A51B::func_2626();
	thread lib_A51B::func_2625();
}

//Function Number: 69
lib_A51B::func_2608()
{
	self.var_2243 = level.dds.var_2244[self.voice].label;
	var_00 = 0;
	var_01 = 0;
	var_02 = tolower(self.classname);
	if(issubstr(var_02,"gideon"))
	{
		self.var_25FB = "gdn";
	}
	else if(issubstr(var_02,"carter"))
	{
		self.var_25FB = "ctr";
	}
	else if(issubstr(var_02,"joker"))
	{
		self.var_25FB = "jkr";
	}
	else if(issubstr(var_02,"cormack"))
	{
		self.var_25FB = "crk";
	}
	else if(issubstr(var_02,"knox"))
	{
		self.var_25FB = "knx";
	}
	else if(issubstr(var_02,"ilana"))
	{
		self.var_25FB = "iln";
	}
	else if(issubstr(var_02,"will"))
	{
		self.var_25FB = "wil";
	}
	else if(issubstr(var_02,"jackson"))
	{
		self.var_25FB = "jkn";
	}
	else if(issubstr(var_02,"ajani"))
	{
		self.var_25FB = "ajn";
	}
	else if(self.inliveplayerkillstreak != "neutral")
	{
		if(isdefined(level.dds.var_2244[self.voice]))
		{
			var_01 = 1;
			var_00 = level.dds.var_2244[self.voice].count % level.dds.var_2244[self.voice].var_5A18;
			self.var_25FB = level.dds.var_2244[self.voice].label + var_00;
			level.dds.var_2244[self.voice].count++;
		}
		else
		{
		}
	}
	else
	{
	}

	if(isdefined(self.var_25FB) && !var_01)
	{
		level.dds.var_1C8D[self.var_25FB] = 0;
	}

	if(isdefined(self.var_25FB) && !animscripts\battlechatter::func_1357())
	{
		self.var_624F = var_00 + 1;
	}

	self.var_2600 = 0;
}

//Function Number: 70
lib_A51B::func_2626()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		self waittill("grenade_flee",var_00);
		if(var_00 == "frag_grenade_sp" || var_00 == "frag_grenade_future_sp" || var_00 == "frag_grenade_80s_sp")
		{
			lib_A51B::func_2612("react_grenade",self.inliveplayerkillstreak == "allies");
		}

		if(var_00 == "emp_grenade_sp")
		{
			lib_A51B::func_2612("react_emp",self.inliveplayerkillstreak == "allies");
		}
	}
}

//Function Number: 71
lib_A51B::func_2625()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		self waittill("damage",var_00,var_01,var_02,var_03,var_04,var_05,var_06,var_07,var_08);
		if(isdefined(var_01) && isdefined(var_01.inliveplayerkillstreak) && self.inliveplayerkillstreak == var_01.inliveplayerkillstreak)
		{
			lib_A51B::func_2612("react_friendly_fire",self.inliveplayerkillstreak == "allies");
		}

		if(isdefined(var_01) && isdefined(var_01.inliveplayerkillstreak) && var_04 == "MOD_RIFLE_BULLET" && lib_A51B::func_3D1F(var_01) == "iw5_em1_sp")
		{
			lib_A51B::func_2612("react_em1",self.inliveplayerkillstreak == "allies");
		}
	}
}

//Function Number: 72
lib_A51B::func_3D1F(param_00)
{
	var_01 = "";
	if(isplayer(param_00))
	{
		var_01 = param_00 getcurrentweapon();
		var_01 = getweaponbasename(var_01);
	}
	else if(isdefined(param_00.alias))
	{
		var_01 = getweaponbasename(param_00.alias);
	}

	return var_01;
}

//Function Number: 73
lib_A51B::func_9ACC(param_00)
{
	if(!lib_A51B::func_5010())
	{
		return;
	}

	self.var_2601 = param_00;
}

//Function Number: 74
lib_A51B::func_9A93(param_00,param_01)
{
	if(!lib_A51B::func_5010())
	{
		return;
	}

	self.var_2601 = param_00;
	if(isplayer(param_00))
	{
		switch(param_01)
		{
			case "MOD_IMPACT":
			case "MOD_GRENADE_SPLASH":
				break;
		}
	}
}

//Function Number: 75
lib_A51B::func_33B0()
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!lib_A51B::func_5010())
	{
		return;
	}

	if(!isdefined(self.node))
	{
		return;
	}

	if(!animscripts\battlechatter::func_515A())
	{
		return;
	}

	if(!animscripts\battlechatter_ai::func_6062())
	{
		return;
	}

	var_00 = lib_A51B::func_3E02("order_combatmove");
	if(isdefined(var_00))
	{
		lib_A51B::func_2612("order_suppress",self.inliveplayerkillstreak == "allies",undefined,var_00.var_25FB);
	}
	else
	{
		lib_A51B::func_2612("order_suppress",self.inliveplayerkillstreak == "allies");
	}

	var_00 = lib_A51B::func_3E02("order_kill_command");
	if(isdefined(var_00))
	{
		lib_A51B::func_2612("order_kill_command",self.inliveplayerkillstreak == "allies",undefined,var_00.var_25FB);
	}
	else
	{
		lib_A51B::func_2612("order_kill_command",self.inliveplayerkillstreak == "allies");
	}

	var_00 = lib_A51B::func_3E02("order_flush");
	if(isdefined(var_00))
	{
		lib_A51B::func_2612("order_flush",self.inliveplayerkillstreak == "allies",undefined,var_00.var_25FB);
		return;
	}

	lib_A51B::func_2612("order_flush",self.inliveplayerkillstreak == "allies");
}

//Function Number: 76
lib_A51B::func_33B3(param_00)
{
	self endon("death");
	self endon("removed from battleChatter");
	if(!lib_A51B::func_5010())
	{
		return;
	}

	if(!isdefined(self.node))
	{
		return;
	}

	var_01 = distance(self.var_2E6,self.node.var_2E6);
	if(!animscripts\battlechatter::func_515A())
	{
		return;
	}

	if(!animscripts\battlechatter_ai::func_6062())
	{
		return;
	}

	if(self.var_20B5 > 0)
	{
		if(param_00)
		{
			var_02 = lib_A51B::func_3E02("order_coverme");
			if(isdefined(var_02))
			{
				lib_A51B::func_2612("order_coverme",self.inliveplayerkillstreak == "allies",undefined,var_02.var_25FB);
			}
			else
			{
				lib_A51B::func_2612("order_coverme",self.inliveplayerkillstreak == "allies");
			}

			var_02 = lib_A51B::func_3E02("order_combatmove");
			if(isdefined(var_02))
			{
				lib_A51B::func_2612("order_combatmove",self.inliveplayerkillstreak == "allies",undefined,var_02.var_25FB);
			}
			else
			{
				lib_A51B::func_2612("order_combatmove",self.inliveplayerkillstreak == "allies");
			}
		}

		lib_A51B::func_33B0();
		return;
	}

	if(animscripts\battlechatter_ai::func_6063())
	{
		var_02 = lib_A51B::func_3E02("order_noncombatmove");
		if(isdefined(var_02))
		{
			lib_A51B::func_2612("order_noncombatmove",self.inliveplayerkillstreak == "allies",undefined,var_02.var_25FB);
			return;
		}

		lib_A51B::func_2612("order_noncombatmove",self.inliveplayerkillstreak == "allies");
		return;
	}
}

//Function Number: 77
lib_A51B::func_3E02(param_00)
{
	var_01 = lib_A51B::func_3E50(param_00);
	if(self.inliveplayerkillstreak == level.var_31D.inliveplayerkillstreak)
	{
		if(!isdefined(var_01))
		{
			var_01 = level.var_31D;
		}
		else if(randomint(100) < 50)
		{
			var_01 = level.var_31D;
		}
	}

	return var_01;
}

//Function Number: 78
lib_A51B::func_3E50(param_00)
{
	var_01 = undefined;
	var_02 = undefined;
	if(self.inliveplayerkillstreak == "allies")
	{
		var_02 = lib_A51B::func_375B(level.dds.var_1BCE,param_00);
	}
	else
	{
		var_02 = lib_A51B::func_375B(level.dds.var_1BCF,param_00);
	}

	if(!isdefined(var_02))
	{
		return undefined;
	}

	var_03 = var_02.var_766D;
	if(self.inliveplayerkillstreak == "allies")
	{
		var_02 = lib_A51B::func_375B(level.dds.var_1BCE,var_03);
	}
	else
	{
		var_02 = lib_A51B::func_375B(level.dds.var_1BCF,var_03);
	}

	if(!isdefined(var_02))
	{
		return undefined;
	}

	var_04 = spawnstruct();
	var_04.var_1BD4 = var_03;
	var_04.ent = self;
	var_04.var_32E8 = self.var_2E6;
	var_04.var_32EA = self.inliveplayerkillstreak;
	var_04.var_50B1 = self.inliveplayerkillstreak == "allies";
	var_01 = var_04 [[ var_02.var_3E84 ]](isdefined(var_02.var_766D),var_02.var_8A12);
}

//Function Number: 79
lib_A51B::func_1CCE(param_00,param_01)
{
	if(isdefined(self.var_2601) && isdefined(self.var_2601.var_2601))
	{
		if(self == self.var_2601.var_2601)
		{
			return "kill_dmg_" + param_01;
		}
	}

	return param_00;
}

//Function Number: 80
lib_A51B::func_2615(param_00,param_01)
{
	if(!lib_A51B::func_5010())
	{
		return;
	}

	if(!isdefined(self.var_FF))
	{
		return;
	}

	if(isdefined(self.var_2601) && isdefined(self.inliveplayerkillstreak))
	{
		if(isdefined(self.var_2601.inliveplayerkillstreak) && self.var_2601.inliveplayerkillstreak == self.inliveplayerkillstreak || self.inliveplayerkillstreak == "neutral")
		{
			return;
		}
		else if(isdefined(self.var_2601.var_9F4C) && self.var_2601.var_9F4C == self.inliveplayerkillstreak)
		{
			return;
		}
	}

	var_02 = 0;
	if(!isdefined(param_01))
	{
		switch(self.var_FF)
		{
			case "MOD_DROWN":
			case "MOD_HIT_BY_OBJECT":
			case "MOD_BURNED":
			case "MOD_TRIGGER_HURT":
			case "MOD_SUICIDE":
			case "MOD_FALLING":
			case "MOD_TELEFRAG":
			case "MOD_CRUSH":
				break;

			case "MOD_BAYONET":
			case "MOD_UNKNOWN":
			case "MOD_PROJECTILE_SPLASH":
			case "MOD_PROJECTILE":
				break;

			case "MOD_MELEE":
			case "MOD_MELEE_ALT":
				break;

			case "MOD_EXPLOSIVE":
			case "MOD_GRENADE_SPLASH":
			case "MOD_GRENADE":
				break;

			case "MOD_RIFLE_BULLET":
			case "MOD_PISTOL_BULLET":
				break;

			case "MOD_HEAD_SHOT":
				break;

			default:
				break;
		}
	}
}

//Function Number: 81
lib_A51B::func_2613()
{
	var_00 = self.inliveplayerkillstreak == "allies";
	lib_A51B::func_2612("casualty",var_00);
	thread lib_A51B::func_261C(self.inliveplayerkillstreak);
}

//Function Number: 82
lib_A51B::func_261C(param_00)
{
	if(isdefined(level.dds.var_7301[param_00]))
	{
		level.dds.var_7301[param_00] = gettime() + 5000;
		return;
	}

	var_01 = function_00D6(param_00);
	var_02 = var_01.size;
	var_03 = 0;
	level.dds.var_7301[param_00] = gettime() + 5000;
	while(gettime() < level.dds.var_7301[param_00])
	{
		var_01 = function_00D6(param_00);
		if(var_01.size > var_02)
		{
			var_03 = var_03 + var_01.size - var_02;
		}

		if(var_03 >= 1)
		{
			var_01[0] lib_A51B::func_2612("order_reinforce",param_00 == "allies");
			break;
		}

		var_02 = var_01.size;
		wait 0.05;
	}

	level.dds.var_7301[param_00] = undefined;
}

//Function Number: 83
lib_A51B::func_2614(param_00,param_01,param_02)
{
	if(!lib_A51B::func_5010())
	{
		return;
	}

	if(!param_02)
	{
		switch(param_00)
		{
			case "willy_pete_80s_sp":
			case "willy_pete_sp":
				break;

			case "emp_grenade_sp":
				break;

			case "vc_grenade_sp":
			case "molotov_sp":
			case "claymore_80s_sp":
			case "claymore_sp":
			case "m8_white_smoke_sp":
			case "flash_grenade_80s_sp":
			case "flash_grenade_sp":
				break;

			case "frag_grenade_80s_sp":
			case "frag_grenade_future_sp":
			case "frag_grenade_sp":
			default:
				break;
		}
	}
}

//Function Number: 84
lib_A51B::func_2616(param_00,param_01)
{
	if(!isdefined(param_00))
	{
		lib_A51B::func_2612("reload",param_01);
		return;
	}
	else if(self getcurrentweaponclipammo() > 0)
	{
		return;
	}

	switch(param_00)
	{
		case "crossbow_explosive_alt_sp":
		case "crossbow_vzoom_alt_sp":
		case "crossbow_80s_sp":
		case "crossbow_sp":
			break;

		default:
			break;
	}
}

//Function Number: 85
lib_A51B::func_2612(param_00,param_01,param_02,param_03)
{
	if(!isdefined(level.dds))
	{
		return;
	}

	if(!common_scripts\utility::flag("dds_running_allies") && param_01)
	{
		return;
	}

	if(!common_scripts\utility::flag("dds_running_axis") && !param_01)
	{
		return;
	}

	if(param_01 && !isdefined(level.dds.var_717[param_00]))
	{
		if(lib_A59A::func_3F72("dds_logErrorsAndRequests"))
		{
		}

		return;
	}

	if(!param_01 && !isdefined(level.dds.var_718[param_00]))
	{
		if(lib_A59A::func_3F72("dds_logErrorsAndRequests"))
		{
		}

		return;
	}

	if(!param_01)
	{
		if(level.dds.var_718[param_00].size > level.dds.var_59F5)
		{
			return;
		}
	}
	else if(level.dds.var_717[param_00].size > level.dds.var_59F5)
	{
		return;
	}

	var_04 = spawnstruct();
	var_04.var_1BD4 = param_00;
	var_04.ent = self;
	var_04.var_32EB = param_02;
	var_04.var_32E8 = self.var_2E6;
	var_04.var_32EA = self.inliveplayerkillstreak;
	var_04.var_1EB6 = 0;
	var_04.var_6FF5 = 0;
	var_04.var_32D5 = self.var_2601;
	var_04.var_50B1 = param_01;
	var_04.var_6543 = param_03;
	if(!param_01)
	{
		var_05 = lib_A51B::func_375B(level.dds.var_1BCF,param_00);
		if(!isdefined(var_05))
		{
			return;
		}

		var_04.duration = var_05.duration;
		var_04.var_1BD0 = var_05.var_9D8;
		level.dds.var_718[param_00][level.dds.var_718[param_00].size] = var_04;
		return;
	}

	var_05 = lib_A51B::func_375B(level.dds.var_1BCE,param_01);
	if(!isdefined(var_05))
	{
		return;
	}

	var_04.duration = var_05.duration;
	var_04.var_1BD0 = var_05.var_9D8;
	level.dds.var_717[param_00][level.dds.var_717[param_00].size] = var_04;
}

//Function Number: 86
lib_A51B::func_2617(param_00,param_01,param_02,param_03)
{
	param_00.var_1BD5 = param_03;
	param_00.var_6FF5 = 0;
	if(param_03 == "grenade_rspns" && isdefined(param_00.ent) && isdefined(param_00.ent.grenade) && isdefined(param_00.ent.grenade.originalowner) && isdefined(param_00.ent.grenade.originalowner.inliveplayerkillstreak != param_00.var_32EA))
	{
		return;
	}

	if(!param_00.var_50B1)
	{
		var_04 = lib_A51B::func_375B(level.dds.var_1BCF,param_00.var_1BD5);
		if(!isdefined(var_04))
		{
			return;
		}

		param_00.duration = var_04.duration;
		param_00.var_1BD0 = var_04.var_9D8;
		level.dds.var_718[param_00.var_1BD5][level.dds.var_718[param_00.var_1BD5].size] = param_00;
		return;
	}

	var_04 = lib_A51B::func_375B(level.dds.var_1BCE,param_01.var_1BD5);
	if(!isdefined(var_04))
	{
		return;
	}

	param_00.duration = var_04.duration;
	param_00.var_1BD0 = var_04.var_9D8;
	level.dds.var_717[param_00.var_1BD5][level.dds.var_717[param_00.var_1BD5].size] = param_00;
}

//Function Number: 87
lib_A51B::func_375B(param_00,param_01)
{
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		if(param_00[var_02].name == param_01)
		{
			return param_00[var_02];
		}
	}

	return undefined;
}

//Function Number: 88
lib_A51B::func_2620(param_00)
{
	var_01 = level.var_31D;
	var_02 = [];
	var_03 = [];
	for(var_04 = 0;var_04 < param_00.size;var_04++)
	{
		var_05 = distancesquared(var_01.var_2E6,param_00[var_04].var_32E8);
		var_02[var_02.size] = var_05;
		var_03[var_03.size] = var_04;
	}

	var_06 = undefined;
	for(var_04 = 0;var_04 < var_02.size - 1;var_04++)
	{
		if(var_02[var_04] <= var_02[var_04 + 1])
		{
			continue;
		}

		var_06 = var_02[var_04];
		var_02[var_04] = var_02[var_04 + 1];
		var_02[var_04 + 1] = var_06;
		var_06 = var_03[var_04];
		var_03[var_04] = var_03[var_04 + 1];
		var_03[var_04 + 1] = var_06;
	}

	var_07 = [];
	for(var_04 = 0;var_04 < var_03.size;var_04++)
	{
		var_07[var_04] = param_00[var_03[var_04]];
	}

	return var_07;
}

//Function Number: 89
lib_A51B::func_2621(param_00)
{
	return param_00;
}

//Function Number: 90
lib_A51B::func_261F(param_00)
{
	return param_00;
}