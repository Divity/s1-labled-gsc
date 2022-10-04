/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42310.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 77
 * Decompile Time: 68 ms
 * Timestamp: 4/20/2022 8:23:18 PM
*******************************************************************/

//Function Number: 1
lib_A546::main()
{
	if(!isdefined(level.func))
	{
		level.func = [];
	}

	level.func["setsaveddvar"] = ::function_00D3;
	level.func["useanimtree"] = ::method_8115;
	level.func["setanim"] = ::method_814B;
	level.func["setanimknob"] = ::method_8143;
	level.func["setflaggedanimknob"] = ::method_8152;
	level.func["setflaggedanimknobrestart"] = ::method_810D;
	level.func["setanimlimited"] = ::method_814C;
	level.func["setanimtime"] = ::method_8117;
	level.func["getanimtime"] = ::method_814F;
	level.func["getanimlength"] = ::function_0063;
	level.func["clearanim"] = ::method_8142;
	level.func["kill"] = ::method_8052;
	level.func["magicgrenade"] = ::function_0070;
	lib_A546::func_7E12();
	lib_A59A::set_console_status();
	level.var_4221 = [];
	level.var_4221["_autosave_stealthcheck"] = ::lib_A546::func_4229;
	level.var_4221["_patrol_endon_spotted_flag"] = ::lib_A546::func_4229;
	level.var_4221["_spawner_stealth_default"] = ::lib_A546::func_4229;
	level.var_4221["_idle_call_idle_func"] = ::lib_A546::func_4229;
	common_scripts\utility::flag_init("_cloaked_stealth_enabled");
	if(!isdefined(level.var_9E74))
	{
		level.var_9E74 = "default";
	}

	visionsetthermal(level.var_9E74);
	visionsetpain("near_death");
	level.func["damagefeedback"] = ::lib_A51A::updatedamagefeedback;
	common_scripts\utility::array_thread(getentarray("script_model_pickup_claymore","classname"),::lib_A546::func_1E42);
	common_scripts\utility::array_thread(getentarray("ammo_cache","targetname"),::lib_A546::func_0B6F);
	lib_A59A::func_CE5(getentarray("trigger_multiple_softlanding","classname"));
	if(getdvar("debug") == "")
	{
		setdvar("debug","0");
	}

	if(getdvar("fallback") == "")
	{
		setdvar("fallback","0");
	}

	if(getdvar("angles") == "")
	{
		setdvar("angles","0");
	}

	if(getdvar("noai") == "")
	{
		setdvar("noai","off");
	}

	if(getdvar("scr_RequiredMapAspectratio") == "")
	{
		setdvar("scr_RequiredMapAspectratio","1");
	}

	setdvar("ac130_player_num",-1);
	setdvar("ui_remotemissile_playernum",0);
	setdvar("ui_pmc_won",0);
	setdvar("ui_actionSlot_1_forceActive","off");
	setdvar("ui_actionSlot_2_forceActive","off");
	setdvar("ui_actionSlot_3_forceActive","off");
	setdvar("ui_actionSlot_4_forceActive","off");
	setdvar("ui_dog_grenade",0);
	setdvar("ui_securing","");
	setdvar("ui_securing_progress",0);
	setdvar("hud_showObjectives",1);
	setdvar("hud_showIntel",1);
	setdvar("minimap_sp",0);
	setdvar("minimap_full_sp",0);
	if(!isdefined(level.var_61E2))
	{
		anim.var_61E2 = [];
		animscripts\notetracks::func_72F0();
	}

	common_scripts\utility::flag_init("introscreen_complete");
	lib_A59A::func_79C("no_game",::lib_A546::func_8C10);
	lib_A546::func_0779();
	level._loadstarted = 1;
	level.first_frame = 1;
	level.var_56CF = 0;
	thread lib_A546::func_7364();
	level.var_9F7A = [];
	level.var_76A8 = [];
	level.var_76A4 = [];
	level.var_76AA = [];
	level.var_2BDD = [];
	level.var_6BD = [];
	if(!isdefined(level.script))
	{
		level.script = tolower(getdvar("mapname"));
	}

	precacheshader("black");
	precacheshader("white");
	precacheshader("fullscreen_lit_bloodsplat_01");
	if(level.currentgen)
	{
		precacheshader("vfx_blood_screen_overlay");
	}

	level.var_908 = 0;
	if(!isdefined(level.flag))
	{
		common_scripts\utility::init_flags();
	}
	else
	{
		var_00 = getarraykeys(level.flag);
		common_scripts\utility::array_levelthread(var_00,::lib_A546::func_1CBC);
	}

	lib_A546::func_4D03();
	if(issplitscreen())
	{
		function_00D3("cg_fovScale","0.75");
	}
	else
	{
		function_00D3("cg_fovScale","1");
	}

	level.var_70B5 = 0;
	common_scripts\utility::flag_init("missionfailed");
	common_scripts\utility::flag_init("auto_adjust_initialized");
	common_scripts\utility::flag_init("_radiation_poisoning");
	common_scripts\utility::flag_init("gameskill_selected");
	common_scripts\utility::flag_init("battlechatter_on_thread_waiting");
	common_scripts\utility::flag_init("start_is_set");
	thread lib_A52D::func_6AA();
	thread lib_A546::func_6AC4();
	level.var_2789 = 190;
	function_00D3("g_speed",level.var_2789);
	if(lib_A59A::func_5080())
	{
		function_00D3("sv_saveOnStartMap",0);
	}
	else if(isdefined(level.var_244D))
	{
		function_00D3("sv_saveOnStartMap",0);
	}
	else
	{
		function_00D3("sv_saveOnStartMap",1);
	}

	common_scripts\utility::create_lock("mg42_drones");
	common_scripts\utility::create_lock("mg42_drones_target_trace");
	level.var_2F2F = [];
	foreach(var_03, var_02 in level.struct)
	{
		if(!isdefined(var_02.targetname))
		{
			continue;
		}

		if(var_02.targetname == "delete_on_load")
		{
			level.struct[var_03] = undefined;
		}
	}

	common_scripts\utility::struct_class_init();
	common_scripts\utility::flag_init("player_flashed");
	level.connectpathsfunction = ::connectpaths;
	level.disconnectpathsfunction = ::disconnectpaths;
	level.badplace_cylinder_func = ::badplace_cylinder;
	level.badplace_delete_func = ::badplace_delete;
	level.isaifunc = ::isai;
	level.createclientfontstring_func = ::lib_A53C::func_23ED;
	level.hudsetpoint_func = ::lib_A53C::setpoint;
	level.var_593D = ::sentient_makeentitysentient;
	level.var_3A24 = ::sentient_freeentitysentient;
	level.var_54F9 = ::method_80B2;
	level.var_54F6 = ::method_80B3;
	level.var_8D49 = ::lib_A565::func_72DC;
	level.var_8D48 = ::lib_A565::func_72E4;
	level.var_2D6F = 1;
	level.var_115E = 1;
	level.getnodefunction = ::getnode;
	level.getnodearrayfunction = ::getnodearray;
	level.var_7C6 = ::method_8041;
	if(!isdefined(level.var_601))
	{
		level.var_601 = [];
	}

	if(!animscripts\battlechatter::func_9BDA())
	{
		lib_A51B::func_260D();
		lib_A51B::func_2602();
	}

	foreach(var_05 in level.var_328)
	{
		var_05.var_275 = level.var_31D.health;
		var_05.var_83B7 = 0;
		var_05.inwater = 0;
		var_05 thread lib_A546::watchweaponchange();
		var_05 thread lib_A51B::player_init();
	}

	level.var_553E = -5000;
	level.var_4837 = [];
	thread lib_A546::func_6ECB();
	for(var_07 = 0;var_07 < level.var_328.size;var_07++)
	{
		var_05 = level.var_328[var_07];
		var_05 thread lib_A59A::func_38BF();
		var_05 thread lib_A59A::func_83CA();
		var_05 thread lib_A59A::func_608F();
	}

	precachemodel("fx");
	precachemodel("tag_origin");
	precachemodel("tag_ik_target");
	precacheshellshock("default");
	precacheshellshock("flashbang");
	precacheshellshock("dog_bite");
	precacheshellshock("dog_bite_hit_shield");
	precacherumble("damage_heavy");
	precacherumble("damage_light");
	precacherumble("grenade_rumble");
	precacherumble("artillery_rumble");
	precacherumble("slide_start");
	precacherumble("slide_loop");
	precachestring(&"GAME_GET_TO_COVER");
	precachestring(&"GAME_LAST_STAND_GET_BACK_UP");
	precachestring(&"SCRIPT_GRENADE_DEATH");
	precachestring(&"SCRIPT_GRENADE_SUICIDE_LINE1");
	precachestring(&"SCRIPT_GRENADE_SUICIDE_LINE2");
	precachestring(&"SCRIPT_EXPLODING_VEHICLE_DEATH");
	precachestring(&"SCRIPT_EXPLODING_DESTRUCTIBLE_DEATH");
	precachestring(&"SCRIPT_EXPLODING_BARREL_DEATH");
	precacheshader("hud_grenadeicon");
	precacheshader("hud_grenadepointer");
	precacheshader("hud_burningcaricon");
	precacheshader("death_juggernaut");
	precacheshader("hud_destructibledeathicon");
	precacheshader("hud_burningbarrelicon");
	precacheshader("waypoint_ammo");
	precachestring(&"init_hud");
	precachestring(&"close_hud");
	function_0251("nvg_laser");
	level._effect["deathfx_bloodpool_generic"] = loadfx("vfx/weaponimpact/deathfx_bloodpool_generic");
	animscripts\pain::func_4DF4();
	animscripts\melee::func_5B5E();
	level.createfx_enabled = getdvar("createfx") != "";
	lib_A546::func_8644();
	lib_A54E::main();
	common_scripts\_exploder::setupexploders();
	lib_A509::main();
	lib_A52D::func_800A();
	lib_A506::init();
	thread common_scripts\_fx::initfx();
	if(level.createfx_enabled)
	{
	}

	lib_A52F::init();
	lib_A52E::main();
	lib_A546::func_277B();
	lib_A51E::init();
	lib_A544::func_5702();
	lib_A545::func_4D78();
	lib_A553::func_823B();
	if(isdefined(level.var_4615))
	{
		thread [[ level.var_4615 ]]();
	}
	else
	{
		thread lib_A546::func_4614();
	}

	if(getdvar("functional_test_starts") == "1")
	{
		thread lib_A546::func_3AF9();
	}

	if(!isdefined(level.trigger_flags))
	{
		common_scripts\utility::init_trigger_flags();
	}

	level.var_5379 = [];
	lib_A5D2::func_F91();
	lib_A5DE::func_86EE();
	lib_A594::func_4D50();
	function_00D3("ufoHitsTriggers","0");
	lib_A53B::init();
	lib_A546::func_2BC6();
	if(getdvar("g_connectpaths") == "2")
	{
		level waittill("eternity");
	}

	lib_A50A::main();
	thread lib_A576::init();
	if(!isdefined(level.var_C8A))
	{
		thread lib_A546::func_4CAF();
	}

	lib_A506::init();
	if(isdefined(level.var_110D))
	{
		lib_A5D2::func_7EC2(level.var_110D);
	}

	anim.var_9BF7 = 0;
	if(!isdefined(level.var_5CDB))
	{
		level.var_5CDB = 0;
	}

	if(!lib_A59A::func_5080())
	{
		lib_A547::func_4D0C();
		function_00D3("ui_campaign",level.var_1A3D);
	}

	common_scripts\_destructible::init();
	thread lib_A59E::func_4D70();
	lib_A546::func_7FC0();
	common_scripts\_dynamic_world::init();
	thread lib_A50A::func_139E();
	thread lib_A541::main();
	thread lib_A526::main();
	thread lib_A51A::init();
	lib_A52C::main();
	common_scripts\utility::array_levelthread(getentarray("badplace","targetname"),::lib_A546::func_1266);
	common_scripts\utility::array_levelthread(getentarray("delete_on_load","targetname"),::lib_A59A::func_284D);
	common_scripts\utility::array_thread(getnodearray("traverse","targetname"),::lib_A546::func_973A);
	common_scripts\utility::array_thread(getentarray("piano_key","targetname"),::lib_A546::func_6804);
	common_scripts\utility::array_thread(getentarray("piano_damage","targetname"),::lib_A546::func_6803);
	common_scripts\utility::array_thread(getentarray("water","targetname"),::lib_A546::func_A293);
	common_scripts\utility::array_thread(getentarray("kill_all_players","targetname"),::lib_A546::func_52F5);
	common_scripts\utility::flag_init("allow_ammo_pickups");
	common_scripts\utility::flag_set("allow_ammo_pickups");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_grenade_launcher","targetname"),::lib_A546::func_0B76,"grenade_launcher");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_rpg","targetname"),::lib_A546::func_0B76,"rpg");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_c4","targetname"),::lib_A546::func_0B76,"c4");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_claymore","targetname"),::lib_A546::func_0B76,"claymore");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_556","targetname"),::lib_A546::func_0B76,"556");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_762","targetname"),::lib_A546::func_0B76,"762");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_45","targetname"),::lib_A546::func_0B76,"45");
	common_scripts\utility::array_thread(getentarray("ammo_pickup_pistol","targetname"),::lib_A546::func_0B76,"pistol");
	thread lib_A540::main();
	thread lib_A52D::func_6CC2();
	for(var_07 = 0;var_07 < level.var_328.size;var_07++)
	{
		var_05 = level.var_328[var_07];
		if(!getdvarint("disable_player_regen") == 1)
		{
			var_05 thread lib_A52D::playerhealthregen();
		}

		var_05 thread lib_A546::func_6C80();
	}

	thread lib_A560::main();
	thread lib_A546::func_59D4();
	common_scripts\utility::flag_init("spawning_friendlies");
	common_scripts\utility::flag_init("friendly_wave_spawn_enabled");
	common_scripts\utility::flag_clear("spawning_friendlies");
	level.var_3A7D["rifleguy"] = getentarray("rifle_spawner","script_noteworthy");
	level.var_3A7D["smgguy"] = getentarray("smg_spawner","script_noteworthy");
	level.var_88F8 = [];
	level.var_88F8["allies"] = [];
	level.var_88F8["axis"] = [];
	level.var_88F8["team3"] = [];
	level.var_88F8["neutral"] = [];
	thread lib_A577::func_4252();
	thread lib_A577::func_3A94();
	thread lib_A577::func_3A92();
	common_scripts\utility::array_thread(getentarray("friendly_spawn","targetname"),::lib_A577::func_3ABA);
	common_scripts\utility::array_thread(getentarray("flood_and_secure","targetname"),::lib_A577::func_38E8);
	common_scripts\utility::array_thread(getentarray("window_poster","targetname"),::lib_A546::func_A32E);
	if(!isdefined(level.var_97A1))
	{
		level.var_97A1 = [];
		level.var_97A0 = [];
	}

	level.var_83AD = [];
	level.var_8901 = [];
	lib_A577::main();
	common_scripts\utility::array_thread(getentarray("background_block","targetname"),::lib_A546::func_1250);
	thread lib_A546::func_57C0();
	thread lib_A507::main();
	thread lib_A546::func_A2AD();
	foreach(var_0A, var_09 in level.var_5CDD.var_56E2)
	{
		if(var_09.name == level.script)
		{
			function_00D3("ui_currentLevelIndex",var_0A);
			break;
		}
	}

	if(level.script == level.var_5CDD.var_56E2[0].name && !level.var_31D getplayerprofiledata("hasEverPlayed_SP"))
	{
		lib_A59A::delaythread(0.1,::lib_A546::func_9AB8);
	}

	var_0B = level.var_31D getplayersetting("gameskill");
	var_0C = level.var_2A62[int(var_0B)];
	function_02A3("start_difficulty",var_0C);
	function_02A3("final_difficulty",var_0C);
	level thread lib_A59A::func_8C09();
	level notify("load_finished");
	lib_A546::func_76B1();
	level.var_31D thread lib_A59A::func_581D();
}

//Function Number: 2
lib_A546::func_9AB8()
{
	level.var_31D setplayerprofiledata("hasEverPlayed_SP",1);
	function_002C();
}

//Function Number: 3
lib_A546::func_76B1()
{
	if(isdefined(level.var_6E77))
	{
		foreach(var_01 in level.var_6E77)
		{
			[[ var_01 ]]();
		}
	}
}

//Function Number: 4
lib_A546::func_7E12()
{
	level.var_3003 = [];
	level.var_3003["seoul"] = 1;
	level.var_3003["recovery"] = 1;
	level.var_3003["lagos"] = 1;
	level.var_3003["fusion"] = 1;
}

//Function Number: 5
lib_A546::func_A2AD()
{
	var_00 = getentarray();
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(isdefined(var_00[var_01].classname) && getsubstr(var_00[var_01].classname,0,7) == "weapon_")
		{
			var_02 = var_00[var_01];
			var_03 = getsubstr(var_02.classname,7);
			if(isdefined(var_02.var_7936))
			{
				var_04 = weaponclipsize(var_03);
				var_05 = weaponmaxammo(var_03);
				var_02 itemweaponsetammo(var_04,var_05,var_04,0);
				var_06 = weaponaltweaponname(var_03);
				if(var_06 != "none")
				{
					var_07 = weaponclipsize(var_06);
					var_08 = weaponmaxammo(var_06);
					var_02 itemweaponsetammo(var_07,var_08,var_07,1);
				}

				continue;
			}

			var_09 = 0;
			var_04 = undefined;
			var_0A = undefined;
			var_0B = 0;
			var_0C = undefined;
			var_0D = undefined;
			if(isdefined(var_02.var_7934))
			{
				var_04 = var_02.var_7934;
				var_09 = 1;
			}

			if(isdefined(var_02.var_7935))
			{
				var_0A = var_02.var_7935;
				var_09 = 1;
			}

			if(isdefined(var_02.var_7932))
			{
				var_0C = var_02.var_7932;
				var_0B = 1;
			}

			if(isdefined(var_02.var_7933))
			{
				var_0D = var_02.var_7933;
				var_0B = 1;
			}

			if(var_09)
			{
				if(!isdefined(var_04))
				{
				}

				if(!isdefined(var_0A))
				{
				}

				var_02 itemweaponsetammo(var_04,var_0A);
			}

			if(var_0B)
			{
				if(!isdefined(var_0C))
				{
				}

				if(!isdefined(var_0D))
				{
				}

				var_02 itemweaponsetammo(var_0C,var_0D,0,1);
			}
		}
	}
}

//Function Number: 6
lib_A546::exploder_load(param_00)
{
	level endon("killexplodertridgers" + param_00.script_exploder);
	param_00 waittill("trigger");
	if(isdefined(param_00.script_chance) && randomfloat(1) > param_00.script_chance)
	{
		if(!param_00 lib_A59A::script_delay())
		{
			wait(4);
		}

		level thread lib_A546::exploder_load(param_00);
		return;
	}

	if(!param_00 lib_A59A::script_delay() && isdefined(param_00.var_79BB))
	{
		wait(param_00.var_79BB);
	}

	common_scripts\_exploder::exploder(param_00.script_exploder);
	level notify("killexplodertridgers" + param_00.script_exploder);
}

//Function Number: 7
lib_A546::func_1266(param_00)
{
	if(!isdefined(level.var_126A))
	{
		level.var_126A = 0;
	}

	level.var_126A++;
	badplace_cylinder("badplace" + level.var_126A,-1,param_00.var_2E6,param_00.radius,1024);
}

//Function Number: 8
lib_A546::func_6C80()
{
	for(;;)
	{
		self waittill("damage",var_00);
		if(isdefined(self.var_8A24))
		{
			continue;
		}

		self playrumbleonentity("damage_heavy");
	}
}

//Function Number: 9
lib_A546::func_597F()
{
	if(isdefined(level.var_3003[level.script]))
	{
		return level.var_3003[level.script];
	}

	return 0;
}

//Function Number: 10
lib_A546::func_973A()
{
	var_00 = getent(self.target,"targetname");
	self.var_9723 = var_00.var_2E6[2];
	self.var_9724 = var_00.var_2E6[2] - self.var_2E6[2];
	var_00 delete();
}

//Function Number: 11
lib_A546::func_6803()
{
	var_00 = self getorigin();
	var_01[0] = "large";
	var_01[1] = "small";
	for(;;)
	{
		self waittill("trigger");
		thread common_scripts\utility::play_sound_in_space("bullet_" + common_scripts\utility::random(var_01) + "_piano",var_00);
	}
}

//Function Number: 12
lib_A546::func_6804()
{
	var_00 = self getorigin();
	var_01 = "piano_" + self.var_39B;
	self sethintstring(&"SCRIPT_PLATFORM_PIANO");
	for(;;)
	{
		self waittill("trigger");
		thread common_scripts\utility::play_sound_in_space(var_01,var_00);
	}
}

//Function Number: 13
lib_A546::func_A293()
{
	var_00 = getent(self.target,"targetname");
	var_01 = var_00.var_2E6[2];
	var_00 = undefined;
	level.var_28AB = 8;
	level.var_28AA = 33;
	level.var_28AC = 50;
	var_02 = 0;
	for(;;)
	{
		wait(0.05);
		if(!level.var_31D.inwater && var_02)
		{
			var_02 = 0;
			level.var_31D method_811A(1);
			level.var_31D method_8119(1);
			level.var_31D method_8118(1);
			thread lib_A546::func_A294(level.var_2789);
		}

		self waittill("trigger");
		level.var_31D.inwater = 1;
		var_02 = 1;
		while(level.var_31D istouching(self))
		{
			level.var_31D.inwater = 1;
			var_03 = level.var_31D getorigin();
			var_04 = var_03[2] - var_01;
			if(var_04 > 0)
			{
				break;
			}

			var_05 = int(level.var_2789 - abs(var_04 * 5));
			if(var_05 < 50)
			{
				var_05 = 50;
			}

			thread lib_A546::func_A294(var_05);
			if(abs(var_04) > level.var_28AA)
			{
				level.var_31D method_8119(0);
			}
			else
			{
				level.var_31D method_8119(1);
			}

			if(abs(var_04) > level.var_28AB)
			{
				level.var_31D method_811A(0);
				continue;
			}

			level.var_31D method_811A(1);
			wait(0.5);
		}

		level.var_31D.inwater = 0;
		wait(0.05);
	}
}

//Function Number: 14
lib_A546::func_A294(param_00)
{
	level notify("ramping_water_movement_speed");
	level endon("ramping_water_movement_speed");
	var_01 = 0.5;
	var_02 = int(var_01 * 20);
	var_03 = getdvarint("g_speed");
	var_04 = 0;
	if(param_00 < var_03)
	{
		var_04 = 1;
	}

	var_05 = int(abs(var_03 - param_00));
	var_06 = int(var_05 / var_02);
	for(var_07 = 0;var_07 < var_02;var_07++)
	{
		var_03 = getdvarint("g_speed");
		if(var_04)
		{
			function_00D3("g_speed",var_03 - var_06);
		}
		else
		{
			function_00D3("g_speed",var_03 + var_06);
		}

		wait(0.05);
	}

	function_00D3("g_speed",param_00);
}

//Function Number: 15
lib_A546::func_59D4()
{
	var_00 = getallnodes();
	thread lib_A54E::func_1126(var_00);
	thread lib_A54E::func_781D(var_00);
	thread lib_A512::func_4CC7(var_00);
}

//Function Number: 16
lib_A546::func_4C40(param_00)
{
	var_01 = newhudelem();
	var_01.alignx = "left";
	var_01.aligny = "middle";
	var_01.x = 10;
	var_01.y = 400;
	var_01 settext(param_00);
	var_01.alpha = 0;
	var_01.var_18C = 3;
	wait(1);
	var_01 fadeovertime(1);
	var_01.alpha = 1;
	wait(5);
	var_01 fadeovertime(1);
	var_01.alpha = 0;
	wait(1);
	var_01 destroy();
}

//Function Number: 17
lib_A546::func_4614()
{
	level.var_8CAA = spawnstruct();
	common_scripts\utility::create_dvar("start","");
	if(getdvar("scr_generateClipModels") != "" && getdvar("scr_generateClipModels") != "0")
	{
		return;
	}

	if(!isdefined(level.var_8BAF))
	{
		level.var_8BAF = [];
	}

	var_00 = tolower(getdvar("start"));
	var_01 = lib_A546::func_3E6E();
	if(isdefined(level.var_8C30))
	{
		var_00 = level.var_8C30;
	}

	var_02 = 0;
	for(var_03 = 0;var_03 < var_01.size;var_03++)
	{
		if(var_00 == var_01[var_03])
		{
			var_02 = var_03;
			level.var_8C30 = var_01[var_03];
			break;
		}
	}

	if(isdefined(level.var_278B) && !isdefined(level.var_8C30))
	{
		foreach(var_06, var_05 in var_01)
		{
			if(level.var_278B == var_05)
			{
				var_02 = var_06;
				level.var_8C30 = var_05;
				break;
			}
		}
	}

	if(!isdefined(level.var_8C30))
	{
		if(isdefined(level.var_278A))
		{
			level.var_8C30 = "default";
		}
		else if(lib_A59A::func_56BF())
		{
			level.var_8C30 = level.var_8BAF[0]["name"];
		}
		else
		{
			level.var_8C30 = "default";
		}
	}

	var_07 = getdvarint("sv_loadingsavegame",0);
	if(var_07 != 0)
	{
		var_08 = getdvar("sv_savegametransients","");
		if(var_08 == "")
		{
			function_021F("");
		}
		else
		{
			var_09 = strtok(var_08,",");
			function_021F(var_09);
		}
	}
	else if(level.var_8C30 != "default")
	{
		var_0A = level.var_8B2E[level.var_8C30];
		if(isdefined(var_0A["transients_to_load"]))
		{
			var_0B = var_0A["transients_to_load"];
			if(var_0B.size > 0)
			{
				function_021F(var_0B);
			}
			else
			{
				function_021F("");
			}
		}
	}

	waittillframeend;
	common_scripts\utility::flag_set("start_is_set");
	thread lib_A546::func_8C04();
	if(level.var_8C30 == "default")
	{
		if(isdefined(level.var_278A))
		{
			level thread [[ level.var_278A ]]();
		}
	}
	else
	{
		var_0A = level.var_8B2E[level.var_8C30];
		thread [[ var_0A["start_func"] ]]();
	}

	if(lib_A59A::func_5013())
	{
		var_0C = lib_A546::func_3E78(var_01);
		setdvar("start",var_0C);
	}

	waittillframeend;
	if(var_07 != 0)
	{
		wait(0.1);
	}

	var_0D = [];
	if(!lib_A59A::func_5013() && level.var_8C30 != "no_game")
	{
		var_0E = gettime();
		for(var_03 = 0;var_03 < level.var_8BAF.size;var_03++)
		{
			var_0A = level.var_8BAF[var_03];
			if(var_0A["name"] == level.var_8C30)
			{
				break;
			}

			if(!isdefined(var_0A["catchup_function"]))
			{
				continue;
			}

			[[ var_0A["catchup_function"] ]]();
		}
	}

	for(var_03 = var_02;var_03 < level.var_8BAF.size;var_03++)
	{
		var_0A = level.var_8BAF[var_03];
		if(!isdefined(var_0A["logic_func"]))
		{
			continue;
		}

		if(lib_A546::func_0AFD(var_0A["logic_func"],var_0D))
		{
			continue;
		}

		level.var_8CAA [[ var_0A["logic_func"] ]]();
		var_0D[var_0D.size] = var_0A["logic_func"];
	}
}

//Function Number: 18
lib_A546::func_0AFD(param_00,param_01)
{
	foreach(var_03 in param_01)
	{
		if(var_03 == param_00)
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 19
lib_A546::func_3E78(param_00)
{
	var_01 = " ** No starts have been set up for this map with maps_utility::add_start().";
	if(param_00.size)
	{
		var_01 = " ** ";
		for(var_02 = param_00.size - 1;var_02 >= 0;var_02--)
		{
			var_01 = var_01 + param_00[var_02] + " ";
		}
	}

	setdvar("start",var_01);
	return var_01;
}

//Function Number: 20
lib_A546::func_23D9(param_00,param_01)
{
	var_02 = 1;
	var_03 = (0.9,0.9,0.9);
	if(param_01 != -1)
	{
		var_04 = 5;
		if(param_01 != var_04)
		{
			var_02 = 1 - abs(var_04 - param_01) / var_04;
		}
		else
		{
			var_03 = (1,1,0);
		}
	}

	if(var_02 == 0)
	{
		var_02 = 0.05;
	}

	var_05 = newhudelem();
	var_05.alignx = "left";
	var_05.aligny = "middle";
	var_05.x = 80;
	var_05.y = 80 + param_01 * 18;
	var_05 settext(param_00);
	var_05.alpha = 0;
	var_05.foreground = 1;
	var_05.color = var_03;
	var_05.var_18C = 1.75;
	var_05 fadeovertime(0.5);
	var_05.alpha = var_02;
	return var_05;
}

//Function Number: 21
lib_A546::func_8C04()
{
}

//Function Number: 22
lib_A546::func_8C10()
{
	common_scripts\utility::array_call(function_00D6(),::delete);
	common_scripts\utility::array_call(function_00D8(),::delete);
}

//Function Number: 23
lib_A546::func_3E6E()
{
	var_00 = [];
	for(var_01 = 0;var_01 < level.var_8BAF.size;var_01++)
	{
		var_00[var_00.size] = level.var_8BAF[var_01]["name"];
	}

	return var_00;
}

//Function Number: 24
lib_A546::func_2B55()
{
	level.var_2B56 = 1;
	if(level.var_8BAF.size <= 0)
	{
		return;
	}

	var_00 = lib_A546::func_3E6E();
	var_00[var_00.size] = "default";
	var_00[var_00.size] = "cancel";
	var_01 = lib_A546::func_8BF2();
	var_02 = lib_A546::func_23D9("Selected Start:",-1);
	var_02.color = (1,1,1);
	var_03 = [];
	for(var_04 = 0;var_04 < var_00.size;var_04++)
	{
		var_05 = var_00[var_04];
		var_06 = "[" + var_00[var_04] + "]";
		if(var_05 != "cancel" && var_05 != "default")
		{
			if(isdefined(level.var_8B2E[var_05]["start_loc_string"]))
			{
				var_06 = var_06 + " -> ";
				var_06 = var_06 + level.var_8B2E[var_05]["start_loc_string"];
			}
		}

		var_03[var_03.size] = var_06;
	}

	var_07 = var_00.size - 1;
	var_08 = 0;
	var_09 = 0;
	var_0A = 0;
	while(var_07 > 0)
	{
		if(var_00[var_07] == level.var_8C30)
		{
			var_0A = 1;
			break;
		}

		var_07--;
	}

	if(!var_0A)
	{
		var_07 = var_00.size - 1;
	}

	lib_A546::func_8BF3(var_01,var_03,var_07);
	var_0B = var_07;
	for(;;)
	{
		if(!level.var_31D buttonpresseddevonly("F10"))
		{
			level.var_2B56 = 0;
		}

		if(var_0B != var_07)
		{
			lib_A546::func_8BF3(var_01,var_03,var_07);
			var_0B = var_07;
		}

		if(!var_08)
		{
			if(level.var_31D buttonpresseddevonly("UPARROW") || level.var_31D buttonpresseddevonly("DPAD_UP") || level.var_31D buttonpresseddevonly("APAD_UP"))
			{
				var_08 = 1;
				var_07--;
			}
		}
		else if(!level.var_31D buttonpresseddevonly("UPARROW") && !level.var_31D buttonpresseddevonly("DPAD_UP") && !level.var_31D buttonpresseddevonly("APAD_UP"))
		{
			var_08 = 0;
		}

		if(!var_09)
		{
			if(level.var_31D buttonpresseddevonly("DOWNARROW") || level.var_31D buttonpresseddevonly("DPAD_DOWN") || level.var_31D buttonpresseddevonly("APAD_DOWN"))
			{
				var_09 = 1;
				var_07++;
			}
		}
		else if(!level.var_31D buttonpresseddevonly("DOWNARROW") && !level.var_31D buttonpresseddevonly("DPAD_DOWN") && !level.var_31D buttonpresseddevonly("APAD_DOWN"))
		{
			var_09 = 0;
		}

		if(var_07 < 0)
		{
			var_07 = var_00.size - 1;
		}

		if(var_07 >= var_00.size)
		{
			var_07 = 0;
		}

		if(level.var_31D buttonpresseddevonly("BUTTON_B"))
		{
			lib_A546::func_8B81(var_01,var_02);
			break;
		}

		if(level.var_31D buttonpresseddevonly("kp_enter") || level.var_31D buttonpresseddevonly("BUTTON_A") || level.var_31D buttonpresseddevonly("enter"))
		{
			if(var_00[var_07] == "cancel")
			{
				lib_A546::func_8B81(var_01,var_02);
				break;
			}

			setdvar("start",var_00[var_07]);
		}

		wait(0.05);
	}
}

//Function Number: 25
lib_A546::func_8BF2()
{
	var_00 = [];
	for(var_01 = 0;var_01 < 11;var_01++)
	{
		var_02 = lib_A546::func_23D9("",var_01);
		var_00[var_00.size] = var_02;
	}

	return var_00;
}

//Function Number: 26
lib_A546::func_8BF3(param_00,param_01,param_02)
{
	for(var_03 = 0;var_03 < param_00.size;var_03++)
	{
		var_04 = var_03 + param_02 - 5;
		if(isdefined(param_01[var_04]))
		{
			var_05 = param_01[var_04];
		}
		else
		{
			var_05 = "";
		}

		param_00[var_03] settext(var_05);
	}
}

//Function Number: 27
lib_A546::func_8B81(param_00,param_01)
{
	param_01 destroy();
	for(var_02 = 0;var_02 < param_00.size;var_02++)
	{
		param_00[var_02] destroy();
	}
}

//Function Number: 28
lib_A546::func_1250()
{
	self.var_2E6 = self.var_2E6 - self.var_795A;
}

//Function Number: 29
lib_A546::func_7E98(param_00)
{
	level.var_6C4E = param_00;
	precachemodel(level.var_6C4E);
}

//Function Number: 30
lib_A546::func_7FC0()
{
	var_00 = "1.0 1.0 1.0";
	var_01 = "0.9 0.9 0.9";
	var_02 = "0.85 0.85 0.85";
	function_00D3("con_typewriterColorBase",var_00);
}

//Function Number: 31
lib_A546::func_0B76(param_00)
{
	var_01 = [];
	if(param_00 == "grenade_launcher")
	{
		var_01[var_01.size] = "alt_m4_grenadier";
		var_01[var_01.size] = "alt_m4m203_acog";
		var_01[var_01.size] = "alt_m4m203_acog_payback";
		var_01[var_01.size] = "alt_m4m203_eotech";
		var_01[var_01.size] = "alt_m4m203_motion_tracker";
		var_01[var_01.size] = "alt_m4m203_reflex";
		var_01[var_01.size] = "alt_m4m203_reflex_arctic";
		var_01[var_01.size] = "alt_m4m203_silencer";
		var_01[var_01.size] = "alt_m4m203_silencer_reflex";
		var_01[var_01.size] = "alt_m16_grenadier";
		var_01[var_01.size] = "alt_ak47_grenadier";
		var_01[var_01.size] = "alt_ak47_desert_grenadier";
		var_01[var_01.size] = "alt_ak47_digital_grenadier";
		var_01[var_01.size] = "alt_ak47_fall_grenadier";
		var_01[var_01.size] = "alt_ak47_woodland_grenadier";
	}
	else if(param_00 == "rpg")
	{
		var_01[var_01.size] = "rpg";
		var_01[var_01.size] = "rpg_player";
		var_01[var_01.size] = "rpg_straight";
	}
	else if(param_00 == "c4")
	{
		var_01[var_01.size] = "c4";
	}
	else if(param_00 == "claymore")
	{
		var_01[var_01.size] = "claymore";
	}
	else if(param_00 == "556")
	{
		var_01[var_01.size] = "m4_grenadier";
		var_01[var_01.size] = "m4_grunt";
		var_01[var_01.size] = "m4_sd_cloth";
		var_01[var_01.size] = "m4_shotgun";
		var_01[var_01.size] = "m4_silencer";
		var_01[var_01.size] = "m4_silencer_acog";
		var_01[var_01.size] = "m4m203_acog";
		var_01[var_01.size] = "m4m203_acog_payback";
		var_01[var_01.size] = "m4m203_eotech";
		var_01[var_01.size] = "m4m203_motion_tracker";
		var_01[var_01.size] = "m4m203_reflex";
		var_01[var_01.size] = "m4m203_reflex_arctic";
		var_01[var_01.size] = "m4m203_silencer";
		var_01[var_01.size] = "m4m203_silencer_reflex";
		var_01[var_01.size] = "m4m203_silencer";
	}
	else if(param_00 == "762")
	{
		var_01[var_01.size] = "ak47";
		var_01[var_01.size] = "ak47_acog";
		var_01[var_01.size] = "ak47_eotech";
		var_01[var_01.size] = "ak47_grenadier";
		var_01[var_01.size] = "ak47_reflex";
		var_01[var_01.size] = "ak47_shotgun";
		var_01[var_01.size] = "ak47_silencer";
		var_01[var_01.size] = "ak47_thermal";
		var_01[var_01.size] = "ak47_desert";
		var_01[var_01.size] = "ak47_desert_acog";
		var_01[var_01.size] = "ak47_desert_eotech";
		var_01[var_01.size] = "ak47_desert_grenadier";
		var_01[var_01.size] = "ak47_desert_reflex";
		var_01[var_01.size] = "ak47_digital";
		var_01[var_01.size] = "ak47_digital_acog";
		var_01[var_01.size] = "ak47_digital_eotech";
		var_01[var_01.size] = "ak47_digital_grenadier";
		var_01[var_01.size] = "ak47_digital_reflex";
		var_01[var_01.size] = "ak47_fall";
		var_01[var_01.size] = "ak47_fall_acog";
		var_01[var_01.size] = "ak47_fall_eotech";
		var_01[var_01.size] = "ak47_fall_grenadier";
		var_01[var_01.size] = "ak47_fall_reflex";
		var_01[var_01.size] = "ak47_woodland";
		var_01[var_01.size] = "ak47_woodland_acog";
		var_01[var_01.size] = "ak47_woodland_eotech";
		var_01[var_01.size] = "ak47_woodland_grenadier";
		var_01[var_01.size] = "ak47_woodland_reflex";
	}
	else if(param_00 == "45")
	{
		var_01[var_01.size] = "ump45";
		var_01[var_01.size] = "ump45_acog";
		var_01[var_01.size] = "ump45_eotech";
		var_01[var_01.size] = "ump45_reflex";
		var_01[var_01.size] = "ump45_silencer";
		var_01[var_01.size] = "ump45_arctic";
		var_01[var_01.size] = "ump45_arctic_acog";
		var_01[var_01.size] = "ump45_arctic_eotech";
		var_01[var_01.size] = "ump45_arctic_reflex";
		var_01[var_01.size] = "ump45_digital";
		var_01[var_01.size] = "ump45_digital_acog";
		var_01[var_01.size] = "ump45_digital_eotech";
		var_01[var_01.size] = "ump45_digital_reflex";
	}
	else if(param_00 == "pistol")
	{
		var_01[var_01.size] = "beretta";
		var_01[var_01.size] = "beretta393";
		var_01[var_01.size] = "usp";
		var_01[var_01.size] = "usp_scripted";
		var_01[var_01.size] = "usp_silencer";
		var_01[var_01.size] = "glock";
	}

	var_02 = spawn("trigger_radius",self.var_2E6,0,25,32);
	for(;;)
	{
		common_scripts\utility::flag_wait("allow_ammo_pickups");
		var_02 waittill("trigger",var_03);
		if(!common_scripts\utility::flag("allow_ammo_pickups"))
		{
			continue;
		}

		if(!isdefined(var_03))
		{
			continue;
		}

		if(!isplayer(var_03))
		{
			continue;
		}

		var_04 = undefined;
		var_05 = undefined;
		var_06 = var_03 getweaponslistall();
		for(var_07 = 0;var_07 < var_06.size;var_07++)
		{
			for(var_08 = 0;var_08 < var_01.size;var_08++)
			{
				if(var_06[var_07] == var_01[var_08])
				{
					var_04 = var_06[var_07];
				}
			}
		}

		if(!isdefined(var_04) && param_00 == "claymore")
		{
			var_05 = 1;
			var_04 = "claymore";
			break;
		}

		if(!isdefined(var_04) && param_00 == "c4")
		{
			var_05 = 1;
			var_04 = "c4";
			break;
		}

		if(!isdefined(var_04))
		{
			continue;
		}

		if(var_03 getfractionmaxammo(var_04) >= 1)
		{
			continue;
		}

		break;
	}

	if(isdefined(var_05))
	{
		var_03 giveweapon(var_04);
	}
	else
	{
		var_09 = 1;
		if(param_00 == "556" || param_00 == "762")
		{
			var_09 = 30;
		}
		else if(param_00 == "45")
		{
			var_09 = 25;
		}
		else if(param_00 == "pistol")
		{
			var_09 = 15;
		}

		var_03 setweaponammostock(var_04,var_03 getweaponammostock(var_04) + var_09);
	}

	var_03 method_82F4("grenade_pickup");
	var_02 delete();
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 32
lib_A546::func_7364()
{
	wait(0.05);
	level.first_frame = -1;
}

//Function Number: 33
lib_A546::func_57C0()
{
	if(isdefined(game["total characters"]))
	{
		var_00 = game["total characters"];
	}
	else
	{
		return;
	}

	var_01 = function_00D6("allies");
	var_02 = var_01.size;
	var_03 = 0;
	var_04 = function_00DA("allies");
	var_05 = var_04.size;
	var_06 = 0;
	for(;;)
	{
		if((var_02 <= 0 && var_05 <= 0) || var_00 <= 0)
		{
			return;
		}

		if(var_02 > 0)
		{
			if(isdefined(var_01[var_03].var_79E9))
			{
				var_02--;
				var_03++;
				continue;
			}

			var_01[var_03] codescripts\character::new();
			var_01[var_03] thread codescripts\character::load(game["character" + var_00 - 1]);
			var_02--;
			var_03++;
			var_00--;
			continue;
		}

		if(var_05 > 0)
		{
			if(isdefined(var_04[var_06].var_79E9))
			{
				var_05--;
				var_06++;
				continue;
			}

			var_07 = game["character" + var_00 - 1];
			lib_A59A::precache(var_07["model"]);
			lib_A59A::precache(var_07["model"]);
			var_04[var_06] thread lib_A59A::func_8947(game["character" + var_00 - 1]);
			var_05--;
			var_06++;
			var_00--;
			continue;
		}
	}
}

//Function Number: 34
lib_A546::func_1CBC(param_00)
{
	if(!common_scripts\utility::issuffix(param_00,"aa_"))
	{
		return;
	}

	[[ level.sp_stat_tracking_func ]](param_00);
}

//Function Number: 35
lib_A546::func_6ECB()
{
	waittillframeend;
	if(!isdefined(level.var_78B2))
	{
		return;
	}

	var_00 = getarraykeys(level.var_78B2);
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(isarray(level.var_78B2[var_00[var_01]]))
		{
			for(var_02 = 0;var_02 < level.var_78B2[var_00[var_01]].size;var_02++)
			{
				precachemodel(level.var_78B2[var_00[var_01]][var_02]);
			}

			continue;
		}

		precachemodel(level.var_78B2[var_00[var_01]]);
	}
}

//Function Number: 36
lib_A546::func_6AC4()
{
	setdvar("player_died_recently","0");
	thread lib_A546::func_6AC9();
	level lib_A59A::func_7BE(::common_scripts\utility::flag_wait,"missionfailed");
	level.var_31D lib_A59A::func_7BE(::lib_A59A::func_A090,"death");
	lib_A59A::func_2BDC();
	var_00 = [];
	var_00[0] = 70;
	var_00[1] = 30;
	var_00[2] = 0;
	var_00[3] = 0;
	setdvar("player_died_recently",var_00[level.gameskill]);
}

//Function Number: 37
lib_A546::func_6AC9()
{
	for(;;)
	{
		var_00 = getdvarint("player_died_recently",0);
		if(var_00 > 0)
		{
			var_00 = var_00 - 5;
			setdvar("player_died_recently",var_00);
		}

		wait(5);
	}
}

//Function Number: 38
lib_A546::func_726E()
{
	self notify("new_recon_player");
	self endon("new_recon_player");
	self waittill("death",var_00,var_01,var_02);
	if(!isdefined(var_02))
	{
		var_02 = "script_kill";
	}

	var_03 = 0;
	var_04 = "none";
	var_05 = (0,0,0);
	if(isdefined(var_00))
	{
		var_04 = var_00.classname;
		var_05 = var_00.var_2E6;
		var_06 = vectornormalize(var_05 - self.var_2E6);
		var_07 = anglestoforward(self getplayerangles());
		var_03 = vectordot(var_06,var_07);
	}

	function_0101(self.var_2E6,"script_player_death: playerid %s, enemy %s, enemyposition %v, enemydotproduct %f, cause %s, weapon %s",self.unique_id,var_04,var_05,var_03,var_01,var_02);
	if(isdefined(var_00))
	{
		function_0101(var_00.var_2E6,"script_player_killer: playerid %s, enemy %s, playerposition %v, enemydotproduct %f, cause %s, weapon %s",self.unique_id,var_04,self.var_2E6,var_03,var_01,var_02);
	}
}

//Function Number: 39
lib_A546::func_726F()
{
	self notify("new_player_downed_recon");
	self endon("new_player_downed_recon");
	self endon("death");
	for(;;)
	{
		self waittill("player_downed");
		var_00 = function_00FD() * 0.05;
		var_01 = var_00;
		if(isdefined(self.var_5519))
		{
			var_00 = var_01 - self.var_5519;
		}

		self.var_5519 = var_01;
		function_0101(self.var_2E6,"script_player_downed: playerid %s, leveltime %d, deltatime %d",self.unique_id,var_01,var_00);
	}
}

//Function Number: 40
lib_A546::func_4D03()
{
	level.var_328 = getentarray("player","classname");
	for(var_00 = 0;var_00 < level.var_328.size;var_00++)
	{
		level.var_328[var_00].unique_id = "player" + var_00;
	}

	level.var_31D = level.var_328[0];
	if(level.var_328.size > 1)
	{
		level.var_6C58 = level.var_328[1];
	}

	level notify("level.players initialized");
	foreach(var_02 in level.var_328)
	{
		var_02 thread lib_A546::func_726E();
		if(lib_A59A::func_5080())
		{
			var_02 thread lib_A546::func_726F();
		}
	}
}

//Function Number: 41
lib_A546::func_52F5()
{
	self waittill("trigger",var_00);
	var_00 lib_A59A::func_5343();
}

//Function Number: 42
lib_A546::watchweaponchange()
{
	if(!isdefined(level.var_3A8A))
	{
		level.var_3A8A = loadfx("vfx/unique/thermal_beacon_inverted");
	}

	self endon("death");
	var_00 = self getcurrentweapon();
	if(lib_A546::func_A2A9(var_00))
	{
		thread lib_A546::func_92F9();
	}
	else if(lib_A546::func_A2AA(var_00))
	{
		thread lib_A546::func_305F();
	}
	else if(lib_A546::func_A2AB(var_00))
	{
		thread lib_A546::func_476F();
	}
	else if(lib_A546::func_6B44())
	{
		thread lib_A546::func_48A9();
	}

	for(;;)
	{
		self waittill("weapon_change",var_01);
		if(lib_A546::func_A2A9(var_01))
		{
			thread lib_A546::func_92F9();
		}
		else
		{
			self notify("acogThermalTracker");
		}

		if(lib_A546::func_A2AA(var_01))
		{
			thread lib_A546::func_305F();
		}

		if(lib_A546::func_A2AB(var_01))
		{
			thread lib_A546::func_476F();
		}

		if(lib_A546::func_6B44())
		{
			thread lib_A546::func_48A9();
		}
	}
}

//Function Number: 43
lib_A546::func_3060()
{
	common_scripts\utility::waittill_any("death","weapon_change","em1_heat_meter");
	setomnvar("ui_em1",0);
	setomnvar("ui_em1_heat",0);
}

//Function Number: 44
lib_A546::func_305F()
{
	self endon("death");
	self endon("weapon_change");
	self notify("em1_heat_meter");
	self endon("em1_heat_meter");
	thread lib_A546::func_3060();
	setomnvar("ui_em1",1);
	setomnvar("ui_em1_heat",0);
	for(;;)
	{
		var_00 = self getcurrentweapon();
		var_01 = self method_83B9(var_00);
		setomnvar("ui_em1_heat",var_01);
		wait(0.05);
	}
}

//Function Number: 45
lib_A546::func_A2AA(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(weaponclass(param_00) == "beam" && issubstr(param_00,"_em1"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 46
lib_A546::func_4770()
{
	common_scripts\utility::waittill_any("death","weapon_change","hbra3_signature");
	setomnvar("ui_hbra3",0);
}

//Function Number: 47
lib_A546::func_476F()
{
	self endon("death");
	self endon("weapon_change");
	self notify("hbra3_signature");
	self endon("hbra3_signature");
	thread lib_A546::func_4770();
	setomnvar("ui_hbra3",1);
}

//Function Number: 48
lib_A546::func_A2AB(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(weaponclass(param_00) == "rifle" && issubstr(param_00,"_hbra3"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 49
lib_A546::func_48A9()
{
	self endon("death");
	self endon("himar_print_ammo_stop");
	if(isdefined(self.var_48AA) && self.var_48AA)
	{
		return;
	}

	self.var_48AA = 1;
	self notify("himar_print_ammo");
	self endon("himar_print_ammo");
	setomnvar("ui_himar",1);
	setomnvar("ui_himar_printing",0);
	var_00 = undefined;
	foreach(var_02 in self getweaponslistprimaries())
	{
		if(issubstr(var_02,"himar"))
		{
			var_00 = var_02;
			break;
		}
	}

	if(!isdefined(var_00))
	{
		return;
	}

	for(;;)
	{
		var_04 = self getfractionmaxammo(var_00);
		setomnvar("ui_himar_printing",var_04);
		if(var_04 < 1)
		{
			thread lib_A546::func_48AB(var_00);
			common_scripts\utility::waittill_notify_or_timeout("himar_ammo_full",30);
			self notify("stop_himar_printing_ammo_full_check");
			var_05 = self getweaponammostock(var_00);
			var_06 = weaponmaxammo(var_00);
			var_07 = var_05 + weaponclipsize(var_00);
			if(var_07 > var_06)
			{
				var_07 = var_06;
			}

			self setweaponammostock(var_00,var_07);
			continue;
		}

		wait(1);
	}
}

//Function Number: 50
lib_A546::func_48AB(param_00)
{
	self endon("stop_himar_printing_ammo_full_check");
	while(self getfractionmaxammo(param_00) != 1)
	{
		wait(0.5);
	}

	self notify("himar_ammo_full");
}

//Function Number: 51
lib_A546::func_A2AC(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(weaponclass(param_00) == "rifle" && issubstr(param_00,"_himar"))
	{
		return 1;
	}

	return 0;
}

//Function Number: 52
lib_A546::func_6B44()
{
	foreach(var_01 in self getweaponslistprimaries())
	{
		if(issubstr(var_01,"iw5_himar_sp") && issubstr(var_01,"himarscope"))
		{
			return 1;
		}
	}

	self.var_48AA = undefined;
	self notify("himar_print_ammo_stop");
	setomnvar("ui_himar",0);
	setomnvar("ui_himar_printing",0);
	return 0;
}

//Function Number: 53
lib_A546::func_A2A9(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(param_00 == "none")
	{
		return 0;
	}

	if(weaponhasthermalscope(param_00))
	{
		return 1;
	}

	return 0;
}

//Function Number: 54
lib_A546::func_92F9()
{
	self endon("death");
	self notify("acogThermalTracker");
	self endon("acogThermalTracker");
	var_00 = 0;
	for(;;)
	{
		var_01 = var_00;
		var_00 = self playerads();
		if(lib_A546::func_9922(var_00,var_01))
		{
			lib_A546::func_92F8();
		}
		else if(lib_A546::func_9921(var_00,var_01))
		{
			lib_A546::func_92F7();
		}

		wait(0.05);
	}
}

//Function Number: 55
lib_A546::func_9922(param_00,param_01)
{
	if(param_00 <= param_01)
	{
		return 0;
	}

	if(param_00 <= 0.65)
	{
		return 0;
	}

	return !isdefined(self.var_503C);
}

//Function Number: 56
lib_A546::func_9921(param_00,param_01)
{
	if(param_00 >= param_01)
	{
		return 0;
	}

	if(param_00 >= 0.8)
	{
		return 0;
	}

	return isdefined(self.var_503C);
}

//Function Number: 57
lib_A546::func_92F8()
{
	self.var_503C = 1;
	var_00 = function_00D6("allies");
	foreach(var_02 in var_00)
	{
		if(isdefined(var_02.var_46FF))
		{
			continue;
		}

		var_02.var_46FF = 1;
		var_02 thread lib_A546::func_586C(self.unique_id);
	}

	if(lib_A59A::func_5009())
	{
		var_04 = lib_A59A::func_3E05(self);
		if(!isdefined(var_04.var_46FF))
		{
			var_04.var_46FF = 1;
			var_04 thread lib_A546::func_586C(self.unique_id,self);
		}
	}
}

//Function Number: 58
lib_A546::func_92F7()
{
	self.var_503C = undefined;
	level notify("thermal_fx_off" + self.unique_id);
	var_00 = function_00D6("allies");
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_00[var_01].var_46FF = undefined;
	}

	if(lib_A59A::func_5009())
	{
		var_02 = lib_A59A::func_3E05(self);
		var_02.var_46FF = undefined;
	}
}

//Function Number: 59
lib_A546::func_586C(param_00,param_01)
{
	if(isdefined(self.var_46F3))
	{
		return;
	}

	level endon("thermal_fx_off" + param_00);
	self endon("death");
	for(;;)
	{
		if(isdefined(param_01))
		{
			playfxontagforclients(level.var_3A8A,self,"J_Spine4",param_01);
		}
		else
		{
			playfxontag(level.var_3A8A,self,"J_Spine4");
		}

		wait(0.2);
	}
}

//Function Number: 60
lib_A546::func_1E42()
{
	precacheitem("claymore");
	self endon("deleted");
	self setcursorhint("HINT_NOICON");
	self sethintstring(&"WEAPON_CLAYMORE_PICKUP");
	self makeusable();
	var_00 = weaponmaxammo("claymore") + weaponclipsize("claymore");
	if(isdefined(self.var_7934))
	{
		var_00 = self.var_7934;
	}

	while(var_00 > 0)
	{
		self waittill("trigger",var_01);
		var_01 playsoundasmaster("null");
		var_02 = 0;
		if(!var_01 hasweapon("claymore"))
		{
			var_01 giveweapon("claymore");
		}
		else
		{
			var_02 = var_01 getammocount("claymore");
		}

		if(isdefined(var_00) && var_00 > 0)
		{
			var_00 = var_02 + var_00;
			var_03 = weaponmaxammo("claymore");
			var_04 = weaponclipsize("claymore");
			if(var_00 >= var_04)
			{
				var_00 = var_00 - var_04;
				var_01 setweaponammoclip("claymore",var_04);
			}

			if(var_00 >= var_03)
			{
				var_00 = var_00 - var_03;
				var_01 setweaponammostock("claymore",var_03);
			}
			else if(var_00 > 0)
			{
				var_01 setweaponammostock("claymore",var_00);
				var_00 = 0;
			}
		}
		else
		{
			var_01 givemaxammo("claymore");
		}

		var_05 = 4;
		if(isdefined(var_01.var_7322) && var_01.var_7322 == 4)
		{
			var_05 = 2;
		}

		var_01 setactionslot(var_05,"weapon","claymore");
		var_01 switchtoweapon("claymore");
	}

	if(isdefined(self.target))
	{
		var_06 = getentarray(self.target,"targetname");
		foreach(var_08 in var_06)
		{
			var_08 delete();
		}
	}

	self makeunusable();
	self delete();
}

//Function Number: 61
lib_A546::func_0B6F(param_00)
{
	self endon("remove_ammo_cache");
	self.var_9BE3 = spawn("script_model",self.var_2E6 + (0,0,28));
	self.var_9BE3 setmodel("tag_origin");
	self.var_9BE3 makeusable();
	self.var_9BE3 setcursorhint("HINT_NOICON");
	var_01 = &"WEAPON_CACHE_USE_HINT";
	if(getdvar("consoleGame") == "true")
	{
		var_01 = &"WEAPON_CACHE_USE_CONTROLLER_HINT";
	}

	self.var_9BE3 sethintstring(var_01);
	if(!isdefined(param_00) || isdefined(param_00) && param_00)
	{
		thread lib_A546::func_0B73();
	}

	for(;;)
	{
		self.var_9BE3 waittill("trigger",var_02);
		if(isdefined(var_02.var_2D16))
		{
			continue;
		}

		var_02.var_9C17 = 1;
		self notify("used_ammo_cache");
		self.var_9BE3 makeunusable();
		var_02 playsoundasmaster("player_refill_all_ammo");
		var_02 disableweapons();
		wait(0.1);
		var_03 = var_02 getweaponslistall();
		foreach(var_05 in var_03)
		{
			if(var_05 == "claymore")
			{
				continue;
			}

			if(var_05 == "c4")
			{
				continue;
			}

			var_02 givemaxammo(var_05);
			var_06 = weaponclipsize(var_05);
			if(isdefined(var_06))
			{
				if(var_02 getweaponammoclip(var_05) < var_06)
				{
					var_02 setweaponammoclip(var_05,var_06);
				}
			}
		}

		wait(1.4);
		var_02 enableweapons();
		self.var_9BE3 makeusable();
		var_02.var_9C17 = undefined;
	}
}

//Function Number: 62
lib_A546::func_0B73()
{
	self endon("remove_ammo_cache");
	var_00 = spawn("trigger_radius",self.var_2E6,0,320,72);
	var_01 = newhudelem();
	var_01 setshader("waypoint_ammo",1,1);
	var_01.alpha = 0;
	var_01.color = (1,1,1);
	var_01.x = self.var_2E6[0];
	var_01.y = self.var_2E6[1];
	var_01.z = self.var_2E6[2] + 16;
	var_01 setwaypoint(1,1);
	self.var_B70 = var_01;
	self.var_B74 = var_00;
	if(isdefined(self.var_4B26) && self.var_4B26)
	{
		lib_A546::func_0B71(var_01);
		return;
	}

	wait(0.05);
	for(;;)
	{
		var_00 waittill("trigger",var_02);
		if(!isplayer(var_02))
		{
			continue;
		}

		while(var_02 istouching(var_00))
		{
			var_03 = 1;
			var_04 = var_02 getcurrentweapon();
			if(var_04 == "none")
			{
				var_03 = 0;
			}
			else if(var_02 getfractionmaxammo(var_04) > 0.9)
			{
				var_03 = 0;
			}

			if(lib_A59A::func_6B8E(self.var_2E6,0.8,1) && var_03)
			{
				lib_A546::func_0B71(var_01);
				continue;
			}

			lib_A546::func_0B72(var_01);
			wait(0.25);
		}

		lib_A546::func_0B72(var_01);
	}
}

//Function Number: 63
lib_A546::func_0B71(param_00)
{
	if(param_00.alpha != 0)
	{
		return;
	}

	param_00 fadeovertime(0.2);
	param_00.alpha = 0.3;
	wait(0.2);
}

//Function Number: 64
lib_A546::func_0B72(param_00)
{
	if(param_00.alpha == 0)
	{
		return;
	}

	param_00 fadeovertime(0.2);
	param_00.alpha = 0;
	wait(0.2);
}

//Function Number: 65
lib_A546::func_A32E()
{
	var_00 = getglass(self.target);
	if(!isdefined(var_00))
	{
		return;
	}

	if(isdefined(self.var_39B))
	{
		if(self.var_39B == "ondamage" || self.var_39B == "ondamage_appear")
		{
			if(self.var_39B == "ondamage_appear")
			{
				self hide();
			}

			level waittillmatch(var_00,"glass_damaged");
			if(self.var_39B == "ondamage_appear")
			{
				self show();
				level waittillmatch(var_00,"glass_destroyed");
			}

			self delete();
			return;
		}

		level waittillmatch(var_00,"glass_destroyed");
		self delete();
		return;
	}

	level waittillmatch(var_00,"glass_destroyed");
	self delete();
}

//Function Number: 66
lib_A546::func_4229(param_00,param_01,param_02,param_03,param_04)
{
}

//Function Number: 67
lib_A546::func_A2BC()
{
	common_scripts\utility::create_dvar("weaponlist","0");
	if(!getdvarint("weaponlist"))
	{
		return;
	}

	var_00 = getentarray();
	var_01 = [];
	foreach(var_03 in var_00)
	{
		if(!isdefined(var_03.code_classname))
		{
			continue;
		}

		if(issubstr(var_03.code_classname,"weapon"))
		{
			var_01[var_03.classname] = 1;
		}
	}

	foreach(var_06 in var_01)
	{
	}

	var_08 = function_00D8();
	var_09 = [];
	foreach(var_0B in var_08)
	{
		var_09[var_0B.code_classname] = 1;
	}

	foreach(var_06 in var_09)
	{
	}
}

//Function Number: 68
lib_A546::func_8644()
{
	level.var_8631 = spawnstruct();
	lib_A546::func_8643();
	function_000E("_cheat_player_press_slowmo","+melee");
	function_000E("_cheat_player_press_slowmo","+melee_breath");
	function_000E("_cheat_player_press_slowmo","+melee_zoom");
}

//Function Number: 69
lib_A546::func_8643()
{
	level.var_8631.var_56A6 = 0;
	level.var_8631.var_56A7 = 0.25;
	level.var_8631.var_8A50 = 0.4;
	level.var_8631.var_8A4D = 1;
}

//Function Number: 70
lib_A546::func_0779()
{
	var_00 = getentarray("script_origin_start_nogame","classname");
	if(!var_00.size)
	{
		return;
	}

	foreach(var_02 in var_00)
	{
		if(!isdefined(var_02.var_7AD7))
		{
			continue;
		}

		lib_A59A::func_79C("no_game_" + var_02.var_7AD7,::lib_A546::func_8C10);
	}
}

//Function Number: 71
lib_A546::func_2BC6()
{
	if(!lib_A59A::func_5053())
	{
		return;
	}

	function_00D3("ufoHitsTriggers","1");
	level.var_8E98 = 1;
	if(isdefined(level.var_254C))
	{
		level [[ level.var_254C ]]();
	}

	lib_A547::func_4D0C();
	lib_A5D2::func_F91();
	lib_A5DE::func_86EE();
	lib_A52E::main();
	lib_A546::func_2BC7();
	common_scripts\utility::array_call(getentarray("truckjunk","targetname"),::delete);
	common_scripts\utility::array_call(getentarray("truckjunk","script_noteworthy"),::delete);
	level waittill("eternity");
}

//Function Number: 72
lib_A546::func_2BC7()
{
	var_00 = getentarray("script_origin_start_nogame","classname");
	if(!var_00.size)
	{
		return;
	}

	var_00 = sortbydistance(var_00,level.var_31D.var_2E6);
	if(level.var_8C30 == "no_game")
	{
		level.var_31D lib_A59A::func_9237(var_00[0]);
		return;
	}

	var_01 = getsubstr(level.var_8C30,8);
	var_02 = 0;
	foreach(var_04 in var_00)
	{
		if(!isdefined(var_04.var_7AD7))
		{
			continue;
		}

		if(var_01 != var_04.var_7AD7)
		{
			continue;
		}

		if(isdefined(var_04.script_visionset))
		{
			lib_A59A::func_9E65(var_04.script_visionset,0);
		}

		level.var_31D lib_A59A::func_9237(var_04);
		var_02 = 1;
		break;
	}

	if(!var_02)
	{
		level.var_31D lib_A59A::func_9237(var_00[0]);
	}
}

//Function Number: 73
lib_A546::func_4CAF()
{
	level.var_C8A = [];
	level.var_C82 = [];
	waittillframeend;
	waittillframeend;
	var_00 = getarraykeys(level.var_78B3);
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		lib_A546::func_4D1E(var_00[var_01]);
	}

	var_00 = getarraykeys(level.var_78AD);
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		lib_A546::func_4CB0(var_00[var_01]);
	}
}

//Function Number: 74
lib_A546::func_4CB0(param_00)
{
	var_01 = getarraykeys(level.var_78AD[param_00]);
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_03 = var_01[var_02];
		var_04 = level.var_78AD[param_00][var_03];
		level.var_C82[param_00][var_03]["#" + var_03]["soundalias"] = var_04;
		level.var_C82[param_00][var_03]["#" + var_03]["created_by_animSound"] = 1;
	}
}

//Function Number: 75
lib_A546::func_4D1E(param_00)
{
	foreach(var_0A, var_02 in level.var_78B3[param_00])
	{
		foreach(var_09, var_04 in var_02)
		{
			foreach(var_06 in var_04)
			{
				var_07 = var_06["sound"];
				if(!isdefined(var_07))
				{
					continue;
				}

				level.var_C82[param_00][var_0A][var_09]["soundalias"] = var_07;
				if(isdefined(var_06["created_by_animSound"]))
				{
					level.var_C82[param_00][var_0A][var_09]["created_by_animSound"] = 1;
				}
			}
		}
	}
}

//Function Number: 76
lib_A546::func_277B()
{
	animscripts\utility::func_7F6E("default",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("asphalt",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("brick",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("carpet",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("cloth",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("concrete",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("cushion",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("dirt",loadfx("vfx/treadfx/footstep_dust"));
	animscripts\utility::func_7F6E("foliage",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("grass",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("gravel",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("mud",loadfx("vfx/treadfx/footstep_mud"));
	animscripts\utility::func_7F6E("rock",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("sand",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("wood",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("water_waist",loadfx("vfx/treadfx/footstep_water"));
	animscripts\utility::func_7F6E("water_ankle",loadfx("vfx/treadfx/footstep_water"));
	animscripts\utility::func_7F6E("water_knee",loadfx("vfx/treadfx/footstep_water"));
	animscripts\utility::func_7F6E("snow",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6E("ice",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("default",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("asphalt",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("brick",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("carpet",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("cloth",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("concrete",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("cushion",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("dirt",loadfx("vfx/treadfx/footstep_dust"));
	animscripts\utility::func_7F6F("foliage",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("grass",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("gravel",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("mud",loadfx("vfx/treadfx/footstep_mud"));
	animscripts\utility::func_7F6F("rock",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("sand",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("wood",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("water_waist",loadfx("vfx/treadfx/footstep_water"));
	animscripts\utility::func_7F6F("water_ankle",loadfx("vfx/treadfx/footstep_water"));
	animscripts\utility::func_7F6F("water_knee",loadfx("vfx/treadfx/footstep_water"));
	animscripts\utility::func_7F6F("snow",loadfx("vfx/unique/no_fx"));
	animscripts\utility::func_7F6F("ice",loadfx("vfx/unique/no_fx"));
	var_00 = "bodyfall small";
	var_01 = "J_SpineLower";
	var_02 = "bodyfall_";
	var_03 = "_small";
	animscripts\utility::func_7FB9(var_00,var_01,"dirt",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	animscripts\utility::func_7FB9(var_00,var_01,"concrete",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	animscripts\utility::func_7FB9(var_00,var_01,"asphalt",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	animscripts\utility::func_7FB9(var_00,var_01,"rock",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	var_04 = ["brick","carpet","foliage","grass","gravel","ice","metal","painted metal","mud","plaster","sand","snow","slush","water","wood","ceramic"];
	foreach(var_06 in var_04)
	{
		animscripts\utility::func_7FBA(var_00,var_06,var_02,var_03);
	}

	var_00 = "bodyfall small";
	var_01 = "J_SpineLower";
	var_02 = "bodyfall_";
	var_03 = "_large";
	animscripts\utility::func_7FB9(var_00,var_01,"dirt",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	animscripts\utility::func_7FB9(var_00,var_01,"concrete",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	animscripts\utility::func_7FB9(var_00,var_01,"asphalt",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	animscripts\utility::func_7FB9(var_00,var_01,"rock",loadfx("vfx/treadfx/bodyfall_default_runner"),var_02,var_03);
	foreach(var_06 in var_04)
	{
		animscripts\utility::func_7FBA(var_00,var_06,var_02,var_03);
	}
}

//Function Number: 77
lib_A546::func_3AF9()
{
	wait(3);
	if(level.var_8BAF.size <= 0)
	{
		return;
	}

	var_00 = lib_A546::func_3E6E();
	if(!isdefined(var_00) || !isdefined(level.var_8C30))
	{
		return;
	}

	var_01 = 0;
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		if(var_00[var_01] == level.var_8C30)
		{
			var_01++;
			break;
		}
	}

	if(var_01 >= var_00.size)
	{
		return;
	}

	setdvar("start",var_00[var_01]);
}