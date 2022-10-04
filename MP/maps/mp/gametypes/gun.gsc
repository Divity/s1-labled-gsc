/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: gun.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 23
 * Decompile Time: 1366 ms
 * Timestamp: 4/20/2022 8:15:27 PM
*******************************************************************/

//Function Number: 1
main()
{
	maps\mp\gametypes\_globallogic::init();
	maps\mp\gametypes\_callbacksetup::setupcallbacks();
	maps\mp\gametypes\_globallogic::setupcallbacks();
	setguns();
	if(isusingmatchrulesdata())
	{
		level.initializematchrules = ::initializematchrules;
		[[ level.initializematchrules ]]();
		level thread maps\mp\_utility::reinitializematchrulesonmigration();
	}
	else
	{
		maps\mp\_utility::registertimelimitdvar(level.gametype,10);
		setdynamicdvar("scr_gun_scorelimit",level.var_4456.size);
		maps\mp\_utility::registerscorelimitdvar(level.gametype,level.var_4456.size);
		level thread reinitializescorelimitonmigration();
		maps\mp\_utility::registerroundlimitdvar(level.gametype,1);
		maps\mp\_utility::registerwinlimitdvar(level.gametype,0);
		maps\mp\_utility::registernumlivesdvar(level.gametype,0);
		maps\mp\_utility::registerhalftimedvar(level.gametype,0);
		level.matchrules_randomize = 0;
		level.matchrules_damagemultiplier = 0;
		level.matchrules_vampirism = 0;
	}

	setspecialloadout();
	level.teambased = 0;
	level.doprematch = 1;
	level.onstartgametype = ::onstartgametype;
	level.onspawnplayer = ::onspawnplayer;
	level.getspawnpoint = ::getspawnpoint;
	level.onplayerkilled = ::onplayerkilled;
	level.ontimelimit = ::ontimelimit;
	level.onplayerscore = ::onplayerscore;
	level.bypassclasschoicefunc = ::gungameclass;
	level.assists_disabled = 1;
	level.setbacklevel = maps\mp\_utility::getintproperty("scr_setback_levels",1);
	level.var_55A6 = 0;
	if(level.matchrules_damagemultiplier)
	{
		level.idflags_stun = ::maps\mp\gametypes\_damage::gamemodemodifyplayerdamage;
	}

	setteammode("ffa");
	game["dialog"]["gametype"] = "gg_intro";
	game["dialog"]["defense_obj"] = "gbl_start";
	game["dialog"]["offense_obj"] = "gbl_start";
	game["dialog"]["humiliation"] = "gg_humiliation";
	game["dialog"]["lastgun"] = "at_anr1_gg_lastgun";
	if(maps\mp\_utility::isgrapplinghookgamemode())
	{
		game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];
	}
}

//Function Number: 2
initializematchrules()
{
	maps\mp\_utility::setcommonrulesfrommatchrulesdata(1);
	level.matchrules_randomize = getmatchrulesdata("gunData","randomize");
	setdynamicdvar("scr_gun_scorelimit",level.var_4456.size);
	maps\mp\_utility::registerscorelimitdvar(level.gametype,level.var_4456.size);
	setdynamicdvar("scr_gun_winlimit",1);
	maps\mp\_utility::registerwinlimitdvar("gun",1);
	setdynamicdvar("scr_gun_roundlimit",1);
	maps\mp\_utility::registerroundlimitdvar("gun",1);
	setdynamicdvar("scr_gun_halftime",0);
	maps\mp\_utility::registerhalftimedvar("gun",0);
	setdynamicdvar("scr_gun_playerrespawndelay",0);
	setdynamicdvar("scr_gun_waverespawndelay",0);
	setdynamicdvar("scr_player_forcerespawn",1);
	setdynamicdvar("scr_setback_levels",getmatchrulesdata("gunData","setbackLevels"));
}

//Function Number: 3
reinitializescorelimitonmigration()
{
	setdynamicdvar("scr_gun_scorelimit",level.var_4456.size);
	maps\mp\_utility::registerscorelimitdvar(level.gametype,level.var_4456.size);
}

//Function Number: 4
onstartgametype()
{
	setclientnamemode("auto_change");
	maps\mp\_utility::setobjectivetext("allies",&"OBJECTIVES_DM");
	maps\mp\_utility::setobjectivetext("axis",&"OBJECTIVES_DM");
	if(level.splitscreen)
	{
		maps\mp\_utility::setobjectivescoretext("allies",&"OBJECTIVES_DM");
		maps\mp\_utility::setobjectivescoretext("axis",&"OBJECTIVES_DM");
	}
	else
	{
		maps\mp\_utility::setobjectivescoretext("allies",&"OBJECTIVES_DM_SCORE");
		maps\mp\_utility::setobjectivescoretext("axis",&"OBJECTIVES_DM_SCORE");
	}

	maps\mp\_utility::setobjectivehinttext("allies",&"OBJECTIVES_DM_HINT");
	maps\mp\_utility::setobjectivehinttext("axis",&"OBJECTIVES_DM_HINT");
	initspawns();
	var_00 = [];
	maps\mp\gametypes\_gameobjects::main(var_00);
	level.quickmessagetoall = 1;
	level.blockweapondrops = 1;
	level thread onplayerconnect();
}

//Function Number: 5
initspawns()
{
	level.spawnmins = (0,0,0);
	level.spawnmaxs = (0,0,0);
	level.var_8923 = "mp_dm_spawn";
	maps\mp\gametypes\_spawnlogic::addspawnpoints("allies",level.var_8923);
	maps\mp\gametypes\_spawnlogic::addspawnpoints("axis",level.var_8923);
	level.var_5983 = maps\mp\gametypes\_spawnlogic::findboxcenter(level.spawnmins,level.spawnmaxs);
	setmapcenter(level.var_5983);
}

//Function Number: 6
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00.gun_guns = 0;
		var_00.gungameprevgunindex = 0;
		var_00.stabs = 0;
		var_00.var_6034 = 0;
		var_00.var_55B7 = 0;
		var_00.showsetbacksplash = 0;
		if(level.matchrules_randomize)
		{
			var_00.gunlist = common_scripts\utility::array_randomize(level.var_4456);
		}

		var_00 thread refillammo();
		var_00 thread refillsinglecountammo();
		var_00 thread watchforhostmigration();
	}
}

//Function Number: 7
getspawnpoint()
{
	var_00 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints(self.connectedpostgame["team"]);
	if(level.ingraceperiod)
	{
		var_01 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random(var_00);
	}
	else
	{
		var_01 = maps\mp\gametypes\_spawnscoring::getspawnpoint_freeforall(var_01);
	}

	maps\mp\gametypes\_spawnlogic::recon_set_spawnpoint(var_01);
	return var_01;
}

//Function Number: 8
gungameclass()
{
	self.connectedpostgame["class"] = "gamemode";
	self.connectedpostgame["lastClass"] = "";
	self.connectedpostgame["gamemodeLoadout"] = level.gun_loadout;
	self.class = self.connectedpostgame["class"];
	self.lastclass = self.connectedpostgame["lastClass"];
	self method_8511(level.var_4456[0]);
}

//Function Number: 9
onspawnplayer()
{
	thread waitloadoutdone();
}

//Function Number: 10
waitloadoutdone()
{
	level endon("game_ended");
	self endon("disconnect");
	level waittill("player_spawned");
	givenextgun(1);
	if(self.showsetbacksplash)
	{
		self.showsetbacksplash = 0;
		thread maps\mp\_events::decreasegunlevelevent();
	}
}

//Function Number: 11
watchforhostmigration()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("player_migrated");
		if(self.sessionstate == "spectator")
		{
			maps\mp\gametypes\_menus::handleclasschoicedisallowed();
		}
	}
}

//Function Number: 12
onplayerscore(param_00,param_01,param_02)
{
	if(param_00 == "gained_gun_score")
	{
		var_03 = maps\mp\gametypes\_rank::getscoreinfovalue(param_00);
		param_01 maps\mp\_utility::setextrascore0(param_01.extrascore0 + var_03);
		param_01 maps\mp\gametypes\_gamescore::updatescorestatsffa(param_01,var_03);
		return 1;
	}

	if(param_01 == "dropped_gun_score")
	{
		var_04 = min(level.setbacklevel,self.score);
		return int(var_04 * -1);
	}

	return 0;
}

//Function Number: 13
onplayerkilled(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09)
{
	if(!isdefined(param_01))
	{
		return;
	}

	if(param_03 == "MOD_TRIGGER_HURT" && !isplayer(param_01))
	{
		param_01 = self;
	}

	if(param_03 == "MOD_FALLING" || isplayer(param_01))
	{
		if(param_03 == "MOD_FALLING" || param_01 == self || maps\mp\_utility::ismeleemod(param_03) && param_04 != "riotshield_mp" || param_04 == "boost_slam_mp" || param_04 == "iw5_dlcgun12loot8_mp")
		{
			self method_82F4("mp_war_objective_lost");
			self.gungameprevgunindex = self.gun_guns;
			self.gun_guns = int(max(0,self.gun_guns - level.setbacklevel));
			self.lastkillweapon = undefined;
			if(self.gungameprevgunindex > self.gun_guns)
			{
				self.var_6034++;
				maps\mp\_utility::setextrascore1(self.var_6034);
				self.showsetbacksplash = 1;
				if(maps\mp\_utility::ismeleemod(param_03) || param_04 == "boost_slam_mp" || param_04 == "iw5_dlcgun12loot8_mp")
				{
					param_01.stabs++;
					param_01.assists = param_01.stabs;
					param_01 thread maps\mp\_events::setbackenemygunlevelevent();
					if(self.gungameprevgunindex == level.var_4456.size - 1)
					{
						param_01 thread maps\mp\_events::setbackfirstplayergunlevelevent();
						param_01 maps\mp\_utility::leaderdialogonplayer("humiliation","status");
						return;
					}

					return;
				}

				return;
			}

			return;
		}

		if(param_03 == "MOD_PISTOL_BULLET" || param_03 == "MOD_RIFLE_BULLET" || param_03 == "MOD_HEAD_SHOT" || param_03 == "MOD_PROJECTILE" || param_03 == "MOD_PROJECTILE_SPLASH" || param_03 == "MOD_EXPLOSIVE" || param_03 == "MOD_IMPACT" || param_03 == "MOD_GRENADE" || param_03 == "MOD_GRENADE_SPLASH" || maps\mp\_utility::ismeleemod(param_03) && param_04 == "riotshield_mp")
		{
			if(isdefined(param_01.lastkillweapon) && param_01.lastkillweapon == param_04)
			{
				return;
			}

			var_0A = level.var_4456;
			if(level.matchrules_randomize)
			{
				var_0A = param_01.gunlist;
			}

			var_0B = var_0A[param_01.gun_guns];
			if(!issubstr(param_04,maps\mp\_utility::getbaseweaponname(var_0B)))
			{
				return;
			}

			param_01.lastkillweapon = param_04;
			if(param_01.var_55B7 + 3000 > gettime())
			{
				param_01 thread maps\mp\_events::quickgunlevelevent();
			}

			param_01.var_55B7 = gettime();
			param_01.gungameprevgunindex = param_01.gun_guns;
			param_01.gun_guns++;
			param_01 thread maps\mp\_events::increasegunlevelevent();
			if(param_01.gun_guns == level.var_4456.size - 1)
			{
				maps\mp\_utility::playsoundonplayers("mp_enemy_obj_captured");
				level thread maps\mp\_utility::teamplayercardsplash("callout_top_gun_rank",param_01);
				var_0C = gettime();
				if(level.var_55A6 + 4500 < var_0C)
				{
					level thread maps\mp\_utility::leaderdialogonplayers("lastgun",level.var_328,"status");
					level.var_55A6 = var_0C;
				}
			}

			if(param_01.gun_guns < level.var_4456.size)
			{
				param_01 givenextgun(0,param_04);
				return;
			}

			return;
		}
	}
}

//Function Number: 14
givenextgun(param_00,param_01)
{
	self endon("disconnect");
	var_02 = getnextgun();
	self.gun_curgun = var_02;
	var_02 = addattachments(var_02);
	while(!self method_8511(var_02))
	{
		wait 0.05;
	}

	if(isdefined(param_01))
	{
		self takeweapon(param_01);
	}
	else
	{
		self takeallweapons();
	}

	maps\mp\_utility::_giveweapon(var_02);
	self switchtoweaponimmediate(var_02);
	if(isdefined(param_00) && param_00 == 1)
	{
		self setspawnweapon(var_02);
	}

	var_03 = maps\mp\_utility::getbaseweaponname(var_02);
	self.connectedpostgame["primaryWeapon"] = var_03;
	self.alias = var_02;
	self givestartammo(var_02);
	self switchtoweapon(var_02);
	self.gungameprevgunindex = self.gun_guns;
}

//Function Number: 15
getnextgun()
{
	var_00 = level.var_4456;
	var_01 = [];
	var_02 = undefined;
	if(level.matchrules_randomize)
	{
		var_00 = self.gunlist;
	}

	var_02 = var_00[self.gun_guns];
	var_01[var_01.size] = var_02;
	if(self.gun_guns + 1 < var_00.size)
	{
		var_01[var_01.size] = var_00[self.gun_guns + 1];
	}

	if(self.gun_guns > 0)
	{
		var_01[var_01.size] = var_00[self.gun_guns - 1];
	}

	self method_8511(var_01);
	return var_02;
}

//Function Number: 16
addattachments(param_00)
{
	if(getdvarint("scr_gun_loot_variants",0) == 1)
	{
		var_01 = tablelookup("mp/statstable.csv",4,param_00,40);
		if(isdefined(var_01) && var_01 != "")
		{
			var_02 = maps\mp\gametypes\_class::buildweaponname(param_00,var_01,"none","none",0,0);
		}
		else
		{
			var_02 = maps\mp\gametypes\_class::buildweaponname(param_00,"none","none","none",0,0);
		}
	}
	else
	{
		var_02 = maps\mp\gametypes\_class::buildweaponname(var_02,"none","none","none",0,0);
	}

	return var_02;
}

//Function Number: 17
ontimelimit()
{
	level.finalkillcam_winner = "none";
	var_00 = gethighestprogressedplayers();
	if(!isdefined(var_00) || !var_00.size)
	{
		thread maps\mp\gametypes\_gamelogic::endgame("tie",game["end_reason"]["time_limit_reached"]);
		return;
	}

	if(var_00.size == 1)
	{
		thread maps\mp\gametypes\_gamelogic::endgame(var_00[0],game["end_reason"]["time_limit_reached"]);
		return;
	}

	if(var_00[var_00.size - 1].gun_guns > var_00[var_00.size - 2].gun_guns)
	{
		thread maps\mp\gametypes\_gamelogic::endgame(var_00[var_00.size - 1],game["end_reason"]["time_limit_reached"]);
		return;
	}

	thread maps\mp\gametypes\_gamelogic::endgame("tie",game["end_reason"]["time_limit_reached"]);
}

//Function Number: 18
gethighestprogressedplayers()
{
	var_00 = -1;
	var_01 = [];
	foreach(var_03 in level.var_328)
	{
		if(isdefined(var_03.gun_guns) && var_03.gun_guns >= var_00)
		{
			var_00 = var_03.gun_guns;
			var_01[var_01.size] = var_03;
		}
	}

	return var_01;
}

//Function Number: 19
refillammo()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		self waittill("reload");
		self givestartammo(self.alias);
	}
}

//Function Number: 20
refillsinglecountammo()
{
	level endon("game_ended");
	self endon("disconnect");
	for(;;)
	{
		if(maps\mp\_utility::isreallyalive(self) && self.inliveplayerkillstreak != "spectator" && isdefined(self.alias) && self getammocount(self.alias) == 0)
		{
			wait(2);
			self notify("reload");
			wait(1);
			continue;
		}

		wait(0.05);
	}
}

//Function Number: 21
setguns()
{
	var_00 = getdvarint("scr_gun_loot_variants",0);
	level.var_4456 = [];
	level.var_4456[0] = "iw5_asm1";
	level.var_4456[1] = "iw5_asaw";
	level.var_4456[2] = "iw5_himar";
	level.var_4456[3] = "iw5_kf5";
	level.var_4456[4] = "iw5_hbra3";
	level.var_4456[5] = "iw5_mp11";
	level.var_4456[6] = "iw5_ak12";
	level.var_4456[7] = "iw5_sn6";
	level.var_4456[8] = "iw5_arx160";
	level.var_4456[9] = "iw5_hmr9";
	level.var_4456[10] = "iw5_maul";
	level.var_4456[11] = "iw5_dlcgun3";
	level.var_4456[12] = "iw5_em1";
	level.var_4456[13] = "iw5_uts19";
	level.var_4456[14] = "iw5_lsat";
	level.var_4456[15] = "iw5_rhino";
	level.var_4456[16] = "iw5_exoxmg";
	level.var_4456[17] = "iw5_epm3";
	level.var_4456[18] = "iw5_mors";
	level.var_4456[19] = "iw5_rw1";
	level.var_4456[20] = "iw5_vbr";
	level.var_4456[21] = "iw5_pbw";
	level.var_4456[22] = "iw5_thor";
	level.var_4456[23] = "iw5_mahem";
	level.var_4456[24] = "iw5_exocrossbow";
	if(isdefined(var_00) && var_00)
	{
		for(var_01 = 0;var_01 < level.var_4456.size;var_01++)
		{
			var_02 = level.var_4456[var_01];
			if(maps\mp\_utility::getweaponclass(var_02) == "weapon_projectile" || maps\mp\_utility::getweaponclass(var_02) == "weapon_sec_special")
			{
				var_02 = assign_random_loot_variant(var_02,4);
			}
			else
			{
				var_02 = assign_random_loot_variant(var_02,10);
			}

			level.var_4456[var_01] = var_02;
		}
	}

	if(!isusingmatchrulesdata())
	{
		return;
	}

	var_03[0] = "iw5_titan45";
	var_03[1] = "iw5_pbw";
	var_03[2] = "iw5_vbr";
	var_03[3] = "iw5_rw1";
	var_03[4] = "iw5_maul";
	var_03[5] = "iw5_uts19";
	var_03[6] = "iw5_rhino";
	var_03[7] = "iw5_sac3";
	var_03[8] = "iw5_exoxmg";
	var_03[9] = "iw5_kf5";
	var_03[10] = "iw5_sn6";
	var_03[11] = "iw5_hmr9";
	var_03[12] = "iw5_mp11";
	var_03[13] = "iw5_asm1";
	var_03[14] = "iw5_ak12";
	var_03[15] = "iw5_bal27";
	var_03[16] = "iw5_hbra3";
	var_03[17] = "iw5_microdronelauncher";
	var_03[18] = "iw5_mahem";
	var_03[19] = "iw5_exocrossbow";
	var_04[0] = "iw5_titan45";
	var_04[1] = "iw5_pbw";
	var_04[2] = "iw5_vbr";
	var_04[3] = "iw5_rw1";
	var_04[4] = "iw5_ak12";
	var_04[5] = "iw5_bal27";
	var_04[6] = "iw5_hbra3";
	var_04[7] = "iw5_himar";
	var_04[8] = "iw5_arx160";
	var_04[9] = "iw5_m182spr";
	var_04[10] = "iw5_asaw";
	var_04[11] = "iw5_lsat";
	var_04[12] = "iw5_em1";
	var_04[13] = "iw5_epm3";
	var_04[14] = "iw5_mors";
	var_04[15] = "iw5_gm6";
	var_04[16] = "iw5_thor";
	var_04[17] = "iw5_m990";
	var_04[18] = "iw5_mahem";
	var_04[19] = "iw5_exocrossbow";
	var_05 = getmatchrulesdata("gunData","progression");
	switch(var_05)
	{
		case 1:
			break;

		case 2:
			break;

		case 3:
			break;
	}
}

//Function Number: 22
assign_random_loot_variant(param_00,param_01)
{
	var_02 = randomint(param_01);
	switch(var_02)
	{
		case 0:
			break;

		case 1:
			break;

		case 2:
			break;

		case 3:
			break;

		case 4:
			break;

		case 5:
			break;

		case 6:
			break;

		case 7:
			break;

		case 8:
			break;

		case 9:
			break;

		default:
			break;
	}
}

//Function Number: 23
setspecialloadout()
{
	level.gun_loadout = maps\mp\gametypes\_class::getemptyloadout();
	if(maps\mp\gametypes\_class::isvalidprimary(level.var_4456[0]))
	{
		level.gun_loadout["loadoutPrimary"] = level.var_4456[0];
		return;
	}

	if(maps\mp\gametypes\_class::isvalidsecondary(level.var_4456[0],0))
	{
		level.gun_loadout["loadoutSecondary"] = level.var_4456[0];
	}
}