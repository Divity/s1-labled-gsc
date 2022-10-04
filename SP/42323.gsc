/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: 42323.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 14
 * Decompile Time: 31 ms
 * Timestamp: 4/20/2022 8:23:19 PM
*******************************************************************/

//Function Number: 1
lib_A553::main()
{
}

//Function Number: 2
lib_A553::func_823B()
{
	if(isdefined(level.var_6045))
	{
		return;
	}

	var_00 = [];
	var_00[var_00.size] = "american";
	var_00[var_00.size] = "seal";
	var_00[var_00.size] = "taskforce";
	var_00[var_00.size] = "secretservice";
	var_00[var_00.size] = "british";
	var_00[var_00.size] = "arab";
	var_00[var_00.size] = "russian";
	var_00[var_00.size] = "multilingual";
	var_00[var_00.size] = "portuguese";
	var_00[var_00.size] = "shadowcompany";
	var_00[var_00.size] = "delta";
	var_00[var_00.size] = "french";
	var_00[var_00.size] = "african";
	var_00[var_00.size] = "czech";
	var_00[var_00.size] = "czech_surnames";
	var_00[var_00.size] = "pmc";
	var_00[var_00.size] = "xslice";
	var_00[var_00.size] = "kva";
	var_00[var_00.size] = "atlas";
	var_00[var_00.size] = "sentinel";
	var_00[var_00.size] = "squad";
	var_00[var_00.size] = "northkorea";
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		level.var_6045[var_00[var_01]] = [];
	}

	lib_A553::func_0778("american","Smith");
	lib_A553::func_0778("american","Johnson");
	lib_A553::func_0778("american","Williams");
	lib_A553::func_0778("american","Jones");
	lib_A553::func_0778("american","Brown");
	lib_A553::func_0778("american","Davis");
	lib_A553::func_0778("american","Miller");
	lib_A553::func_0778("american","Wilson");
	lib_A553::func_0778("american","Moore");
	lib_A553::func_0778("american","Taylor");
	lib_A553::func_0778("american","Anderson");
	lib_A553::func_0778("american","Thomas");
	lib_A553::func_0778("american","Jackson");
	lib_A553::func_0778("american","White");
	lib_A553::func_0778("american","Harris");
	lib_A553::func_0778("american","Martin");
	lib_A553::func_0778("american","Garcia");
	lib_A553::func_0778("american","Martinez");
	lib_A553::func_0778("american","Robinson");
	lib_A553::func_0778("american","Clark");
	lib_A553::func_0778("american","Rodriguez");
	lib_A553::func_0778("american","Lewis");
	lib_A553::func_0778("american","Lee");
	lib_A553::func_0778("american","Hall");
	lib_A553::func_0778("american","Allen");
	lib_A553::func_0778("american","Young");
	lib_A553::func_0778("american","Hernandez");
	lib_A553::func_0778("american","King");
	lib_A553::func_0778("seal","Angel");
	lib_A553::func_0778("seal","Apex");
	lib_A553::func_0778("seal","Bearcat");
	lib_A553::func_0778("seal","Bishop");
	lib_A553::func_0778("seal","Boomer");
	lib_A553::func_0778("seal","Boxer");
	lib_A553::func_0778("seal","Canine");
	lib_A553::func_0778("seal","Chemist");
	lib_A553::func_0778("seal","Chemo");
	lib_A553::func_0778("seal","Cherub");
	lib_A553::func_0778("seal","Chino");
	lib_A553::func_0778("seal","Coffin");
	lib_A553::func_0778("seal","Coma");
	lib_A553::func_0778("seal","Cyclops");
	lib_A553::func_0778("seal","Cypher");
	lib_A553::func_0778("seal","Doc");
	lib_A553::func_0778("seal","Druid");
	lib_A553::func_0778("seal","Gator");
	lib_A553::func_0778("seal","Hannibal");
	lib_A553::func_0778("seal","Hazard");
	lib_A553::func_0778("seal","Hitman");
	lib_A553::func_0778("seal","Jayhawk");
	lib_A553::func_0778("seal","Jester");
	lib_A553::func_0778("seal","Justice");
	lib_A553::func_0778("seal","Klepto");
	lib_A553::func_0778("seal","Kojak");
	lib_A553::func_0778("seal","Langley");
	lib_A553::func_0778("seal","Neptune");
	lib_A553::func_0778("seal","Mamba");
	lib_A553::func_0778("seal","Midnight");
	lib_A553::func_0778("seal","Neon");
	lib_A553::func_0778("seal","Nomad");
	lib_A553::func_0778("seal","Ogre");
	lib_A553::func_0778("seal","Ozone");
	lib_A553::func_0778("seal","Patron");
	lib_A553::func_0778("seal","Pharaoh");
	lib_A553::func_0778("seal","Pieces");
	lib_A553::func_0778("seal","Poet");
	lib_A553::func_0778("seal","Preacher");
	lib_A553::func_0778("seal","Reaper");
	lib_A553::func_0778("seal","Redcell");
	lib_A553::func_0778("seal","Roadie");
	lib_A553::func_0778("seal","Robot");
	lib_A553::func_0778("seal","Rocket");
	lib_A553::func_0778("seal","Rooster");
	lib_A553::func_0778("seal","Sparrow");
	lib_A553::func_0778("seal","Taco");
	lib_A553::func_0778("seal","Thumper");
	lib_A553::func_0778("seal","Trojan");
	lib_A553::func_0778("seal","Twister");
	lib_A553::func_0778("seal","Undertone");
	lib_A553::func_0778("seal","Utah");
	lib_A553::func_0778("seal","Whiskey");
	lib_A553::func_0778("seal","Worm");
	lib_A553::func_0778("seal","Yankee");
	lib_A553::func_0778("seal","Zero");
	lib_A553::func_21D7("taskforce","seal");
	lib_A553::func_0778("xslice","Wolfman");
	lib_A553::func_0778("xslice","Rodriguez");
	lib_A553::func_0778("xslice","Boone");
	lib_A553::func_0778("xslice","Junger");
	lib_A553::func_0778("xslice","Miggs");
	lib_A553::func_0778("xslice","Arturro");
	lib_A553::func_0778("xslice","Sidewinder");
	lib_A553::func_0778("xslice","Capp");
	lib_A553::func_0778("xslice","Jackson");
	lib_A553::func_0778("xslice","Vickers");
	lib_A553::func_0778("xslice","Krakauer");
	lib_A553::func_0778("xslice","Daniels");
	lib_A553::func_0778("xslice","Walker");
	lib_A553::func_0778("xslice","Flatline");
	lib_A553::func_0778("xslice","Vasquez");
	lib_A553::func_0778("xslice","Jackal");
	lib_A553::func_0778("xslice","Anderson");
	lib_A553::func_0778("xslice","Monster");
	lib_A553::func_0778("xslice","Chan");
	lib_A553::func_0778("xslice","Jones");
	lib_A553::func_0778("xslice","Breaker");
	lib_A553::func_0778("xslice","Doc");
	lib_A553::func_0778("xslice","Booker");
	lib_A553::func_0778("xslice","Dunn");
	lib_A553::func_0778("xslice","Williams");
	lib_A553::func_0778("xslice","Davis");
	lib_A553::func_0778("xslice","McReady");
	lib_A553::func_0778("xslice","Childs");
	lib_A553::func_21D7("delta","xslice");
	lib_A553::func_0778("secretservice","Smith");
	lib_A553::func_0778("secretservice","Jones");
	lib_A553::func_0778("british","Abbot");
	lib_A553::func_0778("british","Adams");
	lib_A553::func_0778("british","Bartlett");
	lib_A553::func_0778("british","Boyd");
	lib_A553::func_0778("russian","Sasha Ivanov");
	lib_A553::func_0778("russian","Aleksei Vyshinskiy");
	lib_A553::func_0778("russian","Boris Ryzhkov");
	lib_A553::func_0778("russian","Dima Tikhonov");
	lib_A553::func_0778("russian","Oleg Kosygin");
	lib_A553::func_0778("arab","Abdulaziz");
	lib_A553::func_0778("arab","Abdullah");
	lib_A553::func_0778("arab","Ali");
	lib_A553::func_0778("portuguese","Carlitos");
	lib_A553::func_0778("portuguese","Antonio");
	lib_A553::func_0778("portuguese","Gervasio");
	lib_A553::func_0778("portuguese","Lois");
	lib_A553::func_0778("portuguese","Xesus");
	lib_A553::func_0778("shadowcompany","Lestat");
	lib_A553::func_0778("shadowcompany","Nosferatu");
	lib_A553::func_0778("shadowcompany","Lecter");
	lib_A553::func_0778("multilingual","Kugelschreiber");
	lib_A553::func_0778("multilingual","Flughafen");
	lib_A553::func_0778("french","Astor");
	lib_A553::func_0778("french","Beliveau");
	lib_A553::func_0778("african","Sulaiman");
	lib_A553::func_0778("african","Camara");
	lib_A553::func_0778("african","Mustapha");
	lib_A553::func_0778("african","Abubakarr");
	lib_A553::func_0778("czech","Andrej");
	lib_A553::func_0778("czech","Anton");
	lib_A553::func_0778("czech_surnames","Blumel");
	lib_A553::func_0778("czech_surnames","Maly");
	lib_A553::func_0778("czech_surnames","Pospisil");
	lib_A553::func_0778("atlas","Abeles");
	lib_A553::func_0778("atlas","Angeles");
	lib_A553::func_0778("atlas","Anjos");
	lib_A553::func_0778("atlas","Baker");
	lib_A553::func_0778("atlas","Beahm");
	lib_A553::func_0778("atlas","Bein");
	lib_A553::func_0778("atlas","Betka");
	lib_A553::func_0778("atlas","Bilodeau");
	lib_A553::func_0778("atlas","Bingham");
	lib_A553::func_0778("atlas","Blair");
	lib_A553::func_0778("atlas","Blake");
	lib_A553::func_0778("atlas","Blizard");
	lib_A553::func_0778("atlas","Brown");
	lib_A553::func_0778("atlas","Bryner");
	lib_A553::func_0778("atlas","Bullock ");
	lib_A553::func_0778("atlas","Carter");
	lib_A553::func_0778("atlas","Chan");
	lib_A553::func_0778("atlas","Chang");
	lib_A553::func_0778("atlas","Chavez");
	lib_A553::func_0778("atlas","Chen");
	lib_A553::func_0778("atlas","Cinquegrano");
	lib_A553::func_0778("atlas","Cooper");
	lib_A553::func_0778("atlas","Coucoules");
	lib_A553::func_0778("atlas","Cox");
	lib_A553::func_0778("atlas","Cumings");
	lib_A553::func_0778("atlas","Davenport");
	lib_A553::func_0778("atlas","Davis");
	lib_A553::func_0778("atlas","DeRosa");
	lib_A553::func_0778("atlas","Desmarais");
	lib_A553::func_0778("atlas","Dolin");
	lib_A553::func_0778("atlas","Durham");
	lib_A553::func_0778("atlas","Erck");
	lib_A553::func_0778("atlas","Ettenberger");
	lib_A553::func_0778("atlas","Farahani");
	lib_A553::func_0778("atlas","Felker");
	lib_A553::func_0778("atlas","Forsyth");
	lib_A553::func_0778("atlas","Gaugy");
	lib_A553::func_0778("atlas","Gavazza");
	lib_A553::func_0778("atlas","Ghiglieri");
	lib_A553::func_0778("atlas","Gonzales");
	lib_A553::func_0778("atlas","Gray");
	lib_A553::func_0778("atlas","Guaman");
	lib_A553::func_0778("atlas","Gudihal");
	lib_A553::func_0778("atlas","Herrera");
	lib_A553::func_0778("atlas","Hook");
	lib_A553::func_0778("atlas","Hort");
	lib_A553::func_0778("atlas","Imai");
	lib_A553::func_0778("atlas","Jessup");
	lib_A553::func_0778("atlas","Katz");
	lib_A553::func_0778("atlas","Kendall");
	lib_A553::func_0778("atlas","Krotenberg");
	lib_A553::func_0778("atlas","Kuo");
	lib_A553::func_0778("atlas","Lamperski");
	lib_A553::func_0778("atlas","Leal");
	lib_A553::func_0778("atlas","Lin-Chiang");
	lib_A553::func_0778("atlas","Lopez-Centellas");
	lib_A553::func_0778("atlas","Louie");
	lib_A553::func_0778("atlas","Madden");
	lib_A553::func_0778("atlas","Magbag");
	lib_A553::func_0778("atlas","Mangan");
	lib_A553::func_0778("atlas","Matulac");
	lib_A553::func_0778("atlas","Maurer");
	lib_A553::func_0778("atlas","Mekala");
	lib_A553::func_0778("atlas","Menghini");
	lib_A553::func_0778("atlas","Mermelstein");
	lib_A553::func_0778("atlas","Miggels");
	lib_A553::func_0778("atlas","Molina");
	lib_A553::func_0778("atlas","Morgan");
	lib_A553::func_0778("atlas","Naas");
	lib_A553::func_0778("atlas","O\'Connor");
	lib_A553::func_0778("atlas","Olazabal");
	lib_A553::func_0778("atlas","Pena");
	lib_A553::func_0778("atlas","Pham");
	lib_A553::func_0778("atlas","Rausch");
	lib_A553::func_0778("atlas","Rente");
	lib_A553::func_0778("atlas","Robbins");
	lib_A553::func_0778("atlas","Rodgers");
	lib_A553::func_0778("atlas","Roozbeh");
	lib_A553::func_0778("atlas","Salud");
	lib_A553::func_0778("atlas","Sani");
	lib_A553::func_0778("atlas","Schmidt");
	lib_A553::func_0778("atlas","Schofield");
	lib_A553::func_0778("atlas","Shande");
	lib_A553::func_0778("atlas","Sheffield");
	lib_A553::func_0778("atlas","Simas");
	lib_A553::func_0778("atlas","Sontag");
	lib_A553::func_0778("atlas","Soukkampha");
	lib_A553::func_0778("atlas","Stephanus");
	lib_A553::func_0778("atlas","Stoddard");
	lib_A553::func_0778("atlas","Strickland");
	lib_A553::func_0778("atlas","Tang");
	lib_A553::func_0778("atlas","Todd");
	lib_A553::func_0778("atlas","Tucker");
	lib_A553::func_0778("atlas","Veca");
	lib_A553::func_0778("atlas","Vuong");
	lib_A553::func_0778("atlas","Warnke");
	lib_A553::func_0778("atlas","Waters");
	lib_A553::func_0778("atlas","Wells");
	lib_A553::func_0778("atlas","West");
	lib_A553::func_0778("atlas","Whitfield");
	lib_A553::func_0778("atlas","Whitney");
	lib_A553::func_0778("atlas","Wojick");
	lib_A553::func_0778("atlas","Wong");
	lib_A553::func_0778("atlas","Ytuarte");
	lib_A553::func_0778("atlas","Zhang");
	lib_A553::func_0778("atlas","Arditti");
	lib_A553::func_0778("atlas","Campbell");
	lib_A553::func_0778("atlas","Christie");
	lib_A553::func_0778("atlas","Couturier");
	lib_A553::func_0778("atlas","Della Penna");
	lib_A553::func_0778("atlas","Ecker");
	lib_A553::func_0778("atlas","Evans");
	lib_A553::func_0778("atlas","Johnson");
	lib_A553::func_0778("atlas","Kaplow");
	lib_A553::func_0778("atlas","Kit");
	lib_A553::func_0778("atlas","Krystek");
	lib_A553::func_0778("atlas","Lim");
	lib_A553::func_0778("atlas","Marinov");
	lib_A553::func_0778("atlas","Mika");
	lib_A553::func_0778("atlas","Nguyen");
	lib_A553::func_0778("atlas","Pasetto");
	lib_A553::func_0778("atlas","Prescott");
	lib_A553::func_0778("atlas","Rigby");
	lib_A553::func_0778("atlas","Sakanai");
	lib_A553::func_0778("atlas","Shields");
	lib_A553::func_0778("atlas","Stebbing");
	lib_A553::func_0778("atlas","Szentirmay");
	lib_A553::func_0778("atlas","Villar");
	lib_A553::func_0778("atlas","Yager");
	lib_A553::func_0778("atlas","Adelmeyer");
	lib_A553::func_0778("atlas","Carontenuto");
	lib_A553::func_0778("atlas","Dickinson");
	lib_A553::func_0778("atlas","DiMeo");
	lib_A553::func_0778("atlas","Egert");
	lib_A553::func_0778("atlas","Friedrich");
	lib_A553::func_0778("atlas","Georgescu");
	lib_A553::func_0778("atlas","Keele");
	lib_A553::func_0778("atlas","Kimoto");
	lib_A553::func_0778("atlas","Ko");
	lib_A553::func_0778("atlas","Kutcher");
	lib_A553::func_0778("atlas","Lord");
	lib_A553::func_0778("atlas","Maynard");
	lib_A553::func_0778("atlas","McDonald");
	lib_A553::func_0778("atlas","Micciulla");
	lib_A553::func_0778("atlas","Myers");
	lib_A553::func_0778("atlas","Ojomo");
	lib_A553::func_0778("atlas","Raymond");
	lib_A553::func_0778("atlas","Reinhardt");
	lib_A553::func_0778("atlas","Rogers");
	lib_A553::func_0778("atlas","Smith");
	lib_A553::func_0778("atlas","St. Laurent");
	lib_A553::func_0778("atlas","Swenty");
	lib_A553::func_0778("atlas","Velaquez");
	lib_A553::func_0778("atlas","Apilado");
	lib_A553::func_0778("atlas","Barnett");
	lib_A553::func_0778("atlas","Beese");
	lib_A553::func_0778("atlas","Biessman");
	lib_A553::func_0778("atlas","Blumel");
	lib_A553::func_0778("atlas","Burnett");
	lib_A553::func_0778("atlas","Butts");
	lib_A553::func_0778("atlas","Carani");
	lib_A553::func_0778("atlas","Cork");
	lib_A553::func_0778("atlas","Curd");
	lib_A553::func_0778("atlas","Dariano");
	lib_A553::func_0778("atlas","Devenero");
	lib_A553::func_0778("atlas","Dusette");
	lib_A553::func_0778("atlas","Ekberg");
	lib_A553::func_0778("atlas","Fifield");
	lib_A553::func_0778("atlas","Gilardi");
	lib_A553::func_0778("atlas","Gulisano");
	lib_A553::func_0778("atlas","Hackbarth");
	lib_A553::func_0778("atlas","Hartmann");
	lib_A553::func_0778("atlas","Hiley");
	lib_A553::func_0778("atlas","Hodge");
	lib_A553::func_0778("atlas","Hummer");
	lib_A553::func_0778("atlas","Jorgenson");
	lib_A553::func_0778("atlas","Koberstein");
	lib_A553::func_0778("atlas","Kornkven");
	lib_A553::func_0778("atlas","Kramer");
	lib_A553::func_0778("atlas","Kreimeier");
	lib_A553::func_0778("atlas","Larson");
	lib_A553::func_0778("atlas","Li");
	lib_A553::func_0778("atlas","Loane");
	lib_A553::func_0778("atlas","Long");
	lib_A553::func_0778("atlas","Luetscher");
	lib_A553::func_0778("atlas","Magro");
	lib_A553::func_0778("atlas","Marty");
	lib_A553::func_0778("atlas","Mathews");
	lib_A553::func_0778("atlas","McCool");
	lib_A553::func_0778("atlas","Menard");
	lib_A553::func_0778("atlas","Middleton");
	lib_A553::func_0778("atlas","Monroe");
	lib_A553::func_0778("atlas","Negrete");
	lib_A553::func_0778("atlas","Nigl");
	lib_A553::func_0778("atlas","Nuniyants");
	lib_A553::func_0778("atlas","Olson");
	lib_A553::func_0778("atlas","Osei");
	lib_A553::func_0778("atlas","Parent");
	lib_A553::func_0778("atlas","Parkinson");
	lib_A553::func_0778("atlas","Peeples");
	lib_A553::func_0778("atlas","Petrosky");
	lib_A553::func_0778("atlas","Raffel");
	lib_A553::func_0778("atlas","Renner");
	lib_A553::func_0778("atlas","Schlautman");
	lib_A553::func_0778("atlas","Seaman");
	lib_A553::func_0778("atlas","Sherman");
	lib_A553::func_0778("atlas","Sierra");
	lib_A553::func_0778("atlas","Singer");
	lib_A553::func_0778("atlas","Smith");
	lib_A553::func_0778("atlas","Stampfli");
	lib_A553::func_0778("atlas","Stevenson");
	lib_A553::func_0778("atlas","Superty");
	lib_A553::func_0778("atlas","Tafaro");
	lib_A553::func_0778("atlas","Thelen");
	lib_A553::func_0778("atlas","Tiran");
	lib_A553::func_0778("atlas","Tomplait");
	lib_A553::func_0778("atlas","Vondrak");
	lib_A553::func_0778("atlas","Weiss");
	lib_A553::func_0778("atlas","Widner");
	lib_A553::func_0778("atlas","Williams");
	lib_A553::func_0778("atlas","Zuk");
	lib_A553::func_0778("sentinel","Abbott");
	lib_A553::func_0778("sentinel","Andaya");
	lib_A553::func_0778("sentinel","Anderson");
	lib_A553::func_0778("sentinel","Arcovitch");
	lib_A553::func_0778("sentinel","Bailey");
	lib_A553::func_0778("sentinel","Beaver");
	lib_A553::func_0778("sentinel","Bell");
	lib_A553::func_0778("sentinel","Benhamou");
	lib_A553::func_0778("sentinel","Benko");
	lib_A553::func_0778("sentinel","Bianchi");
	lib_A553::func_0778("sentinel","Blackwell");
	lib_A553::func_0778("sentinel","Bolak");
	lib_A553::func_0778("sentinel","Bolton");
	lib_A553::func_0778("sentinel","Caisley");
	lib_A553::func_0778("sentinel","Centkowski");
	lib_A553::func_0778("sentinel","Cervantes");
	lib_A553::func_0778("sentinel","Charles");
	lib_A553::func_0778("sentinel","Chu");
	lib_A553::func_0778("sentinel","Clayton");
	lib_A553::func_0778("sentinel","Condrey");
	lib_A553::func_0778("sentinel","Dai");
	lib_A553::func_0778("sentinel","Daley");
	lib_A553::func_0778("sentinel","David");
	lib_A553::func_0778("sentinel","Debolt");
	lib_A553::func_0778("sentinel","DeMartini");
	lib_A553::func_0778("sentinel","Dolan");
	lib_A553::func_0778("sentinel","Doron");
	lib_A553::func_0778("sentinel","Drinkward");
	lib_A553::func_0778("sentinel","Feiss");
	lib_A553::func_0778("sentinel","Fong");
	lib_A553::func_0778("sentinel","Garza");
	lib_A553::func_0778("sentinel","Gebhart");
	lib_A553::func_0778("sentinel","Gil");
	lib_A553::func_0778("sentinel","Graham");
	lib_A553::func_0778("sentinel","Grasshoff");
	lib_A553::func_0778("sentinel","Gu");
	lib_A553::func_0778("sentinel","Halon");
	lib_A553::func_0778("sentinel","Henchey");
	lib_A553::func_0778("sentinel","Hipple");
	lib_A553::func_0778("sentinel","Hosticka");
	lib_A553::func_0778("sentinel","Jackson");
	lib_A553::func_0778("sentinel","Kart");
	lib_A553::func_0778("sentinel","Kato");
	lib_A553::func_0778("sentinel","Klein");
	lib_A553::func_0778("sentinel","Koehler");
	lib_A553::func_0778("sentinel","Lacey");
	lib_A553::func_0778("sentinel","Lai");
	lib_A553::func_0778("sentinel","Lane");
	lib_A553::func_0778("sentinel","Lao");
	lib_A553::func_0778("sentinel","Lee");
	lib_A553::func_0778("sentinel","Longland");
	lib_A553::func_0778("sentinel","Lothian");
	lib_A553::func_0778("sentinel","Ly");
	lib_A553::func_0778("sentinel","Mai");
	lib_A553::func_0778("sentinel","Marino");
	lib_A553::func_0778("sentinel","Martinez");
	lib_A553::func_0778("sentinel","McNeal");
	lib_A553::func_0778("sentinel","McSweeney");
	lib_A553::func_0778("sentinel","Mejia");
	lib_A553::func_0778("sentinel","Miller");
	lib_A553::func_0778("sentinel","Minor");
	lib_A553::func_0778("sentinel","Mohsini");
	lib_A553::func_0778("sentinel","Munson");
	lib_A553::func_0778("sentinel","Navidad");
	lib_A553::func_0778("sentinel","Och");
	lib_A553::func_0778("sentinel","Owens");
	lib_A553::func_0778("sentinel","Pavey");
	lib_A553::func_0778("sentinel","Pennya");
	lib_A553::func_0778("sentinel","Phan");
	lib_A553::func_0778("sentinel","Pitts");
	lib_A553::func_0778("sentinel","Reisdorf");
	lib_A553::func_0778("sentinel","Reyes");
	lib_A553::func_0778("sentinel","Reyna");
	lib_A553::func_0778("sentinel","Rodriguez");
	lib_A553::func_0778("sentinel","Romel");
	lib_A553::func_0778("sentinel","Ryu");
	lib_A553::func_0778("sentinel","Schmill");
	lib_A553::func_0778("sentinel","Seo");
	lib_A553::func_0778("sentinel","Shaughnessy");
	lib_A553::func_0778("sentinel","Shimomura");
	lib_A553::func_0778("sentinel","Sidey");
	lib_A553::func_0778("sentinel","Soto");
	lib_A553::func_0778("sentinel","Soucy");
	lib_A553::func_0778("sentinel","Steamer");
	lib_A553::func_0778("sentinel","Steele");
	lib_A553::func_0778("sentinel","Stone");
	lib_A553::func_0778("sentinel","Swenson");
	lib_A553::func_0778("sentinel","Syrnyk");
	lib_A553::func_0778("sentinel","Tardy");
	lib_A553::func_0778("sentinel","Thibodeaux");
	lib_A553::func_0778("sentinel","Turner");
	lib_A553::func_0778("sentinel","Vitalone");
	lib_A553::func_0778("sentinel","Waterman");
	lib_A553::func_0778("sentinel","Webb");
	lib_A553::func_0778("sentinel","Weise");
	lib_A553::func_0778("sentinel","White");
	lib_A553::func_0778("sentinel","Whitten");
	lib_A553::func_0778("sentinel","Winkelman");
	lib_A553::func_0778("sentinel","Wrede");
	lib_A553::func_0778("sentinel","Biglang-Awa");
	lib_A553::func_0778("sentinel","Callahan");
	lib_A553::func_0778("sentinel","Carbonero");
	lib_A553::func_0778("sentinel","Cole");
	lib_A553::func_0778("sentinel","Cravens");
	lib_A553::func_0778("sentinel","Diaz");
	lib_A553::func_0778("sentinel","Etienne");
	lib_A553::func_0778("sentinel","Froehlich");
	lib_A553::func_0778("sentinel","Haekkinen");
	lib_A553::func_0778("sentinel","Johnston");
	lib_A553::func_0778("sentinel","Kersey");
	lib_A553::func_0778("sentinel","Krolak");
	lib_A553::func_0778("sentinel","Kwak");
	lib_A553::func_0778("sentinel","Loperfido");
	lib_A553::func_0778("sentinel","Midlil");
	lib_A553::func_0778("sentinel","Mulkiewicz");
	lib_A553::func_0778("sentinel","Ott II");
	lib_A553::func_0778("sentinel","Power");
	lib_A553::func_0778("sentinel","Przybyla");
	lib_A553::func_0778("sentinel","Ruiz");
	lib_A553::func_0778("sentinel","Sheets");
	lib_A553::func_0778("sentinel","Staines");
	lib_A553::func_0778("sentinel","Stockholm");
	lib_A553::func_0778("sentinel","Tieger");
	lib_A553::func_0778("sentinel","Wilson Hart");
	lib_A553::func_0778("sentinel","Zaferakis");
	lib_A553::func_0778("sentinel","Barnes");
	lib_A553::func_0778("sentinel","Bibbo");
	lib_A553::func_0778("sentinel","Chung");
	lib_A553::func_0778("sentinel","Curry");
	lib_A553::func_0778("sentinel","Day");
	lib_A553::func_0778("sentinel","Delalla");
	lib_A553::func_0778("sentinel","Elenes");
	lib_A553::func_0778("sentinel","Espinoza");
	lib_A553::func_0778("sentinel","Esposito");
	lib_A553::func_0778("sentinel","Feldman");
	lib_A553::func_0778("sentinel","Gersant");
	lib_A553::func_0778("sentinel","Le-Roche");
	lib_A553::func_0778("sentinel","Marvin");
	lib_A553::func_0778("sentinel","Ow");
	lib_A553::func_0778("sentinel","Palser");
	lib_A553::func_0778("sentinel","Rodriguez");
	lib_A553::func_0778("sentinel","Son");
	lib_A553::func_0778("sentinel","Tawarotip");
	lib_A553::func_0778("sentinel","Valdivia");
	lib_A553::func_0778("sentinel","Wen");
	lib_A553::func_0778("sentinel","Williams");
	lib_A553::func_0778("sentinel","Achrekar");
	lib_A553::func_0778("sentinel","Bayless");
	lib_A553::func_0778("sentinel","Bernstein");
	lib_A553::func_0778("sentinel","Blondin");
	lib_A553::func_0778("sentinel","Bradford");
	lib_A553::func_0778("sentinel","Button");
	lib_A553::func_0778("sentinel","Bychowski");
	lib_A553::func_0778("sentinel","Christopher");
	lib_A553::func_0778("sentinel","Corona");
	lib_A553::func_0778("sentinel","Danz");
	lib_A553::func_0778("sentinel","Degenhardt");
	lib_A553::func_0778("sentinel","Donatelli");
	lib_A553::func_0778("sentinel","Edwards");
	lib_A553::func_0778("sentinel","Fetter");
	lib_A553::func_0778("sentinel","Foster");
	lib_A553::func_0778("sentinel","Giombi");
	lib_A553::func_0778("sentinel","Griebel");
	lib_A553::func_0778("sentinel","Gummelt");
	lib_A553::func_0778("sentinel","Hamilton");
	lib_A553::func_0778("sentinel","Hauptman");
	lib_A553::func_0778("sentinel","Hill");
	lib_A553::func_0778("sentinel","Holt");
	lib_A553::func_0778("sentinel","Jenkins");
	lib_A553::func_0778("sentinel","Kilborn");
	lib_A553::func_0778("sentinel","Koenig");
	lib_A553::func_0778("sentinel","Kraft");
	lib_A553::func_0778("sentinel","Kreeger");
	lib_A553::func_0778("sentinel","Lara");
	lib_A553::func_0778("sentinel","Linn");
	lib_A553::func_0778("sentinel","Lohman");
	lib_A553::func_0778("sentinel","Love");
	lib_A553::func_0778("sentinel","Lynch");
	lib_A553::func_0778("sentinel","Majernik");
	lib_A553::func_0778("sentinel","Matejka");
	lib_A553::func_0778("sentinel","McBain");
	lib_A553::func_0778("sentinel","McDaniel");
	lib_A553::func_0778("sentinel","Merboth");
	lib_A553::func_0778("sentinel","Morrow");
	lib_A553::func_0778("sentinel","Newquist");
	lib_A553::func_0778("sentinel","Noti");
	lib_A553::func_0778("sentinel","Olsen");
	lib_A553::func_0778("sentinel","Parker");
	lib_A553::func_0778("sentinel","Peekna");
	lib_A553::func_0778("sentinel","Petersen");
	lib_A553::func_0778("sentinel","Plesha");
	lib_A553::func_0778("sentinel","Reed");
	lib_A553::func_0778("sentinel","Sabin");
	lib_A553::func_0778("sentinel","Serio");
	lib_A553::func_0778("sentinel","Shockey");
	lib_A553::func_0778("sentinel","Sinclair");
	lib_A553::func_0778("sentinel","Skubal");
	lib_A553::func_0778("sentinel","Spray");
	lib_A553::func_0778("sentinel","Stephens");
	lib_A553::func_0778("sentinel","Swekel");
	lib_A553::func_0778("sentinel","Terry");
	lib_A553::func_0778("sentinel","Thurler");
	lib_A553::func_0778("sentinel","Uttech");
	lib_A553::func_0778("sentinel","Wagner");
	lib_A553::func_0778("sentinel","Wiegert");
	lib_A553::func_0778("sentinel","Zart");
	lib_A553::func_0778("kva","Soho");
	lib_A553::func_0778("kva","Soap");
	lib_A553::func_0778("kva","Motoko");
	lib_A553::func_0778("squad","Sarge");
	lib_A553::func_0778("squad","LT");
	lib_A553::func_0778("squad","McSweeney");
	lib_A553::func_0778("northkorea","Shima");
	lib_A553::func_0778("northkorea","Hikomori");
	lib_A553::func_0778("northkorea","Masamura");
	lib_A553::func_21D7("pmc","czech_surnames");
	lib_A553::func_4D4F();
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		lib_A553::func_737A(var_00[var_01]);
		lib_A553::func_7124(var_00[var_01]);
		level.var_6042[var_00[var_01]] = 0;
	}
}

//Function Number: 3
lib_A553::func_21D7(param_00,param_01)
{
	level.var_6045[param_00] = level.var_6045[param_01];
}

//Function Number: 4
lib_A553::func_0778(param_00,param_01)
{
	level.var_6045[param_00][level.var_6045[param_00].size] = param_01;
}

//Function Number: 5
lib_A553::func_736B(param_00,param_01)
{
	level.var_6045[param_00] = common_scripts\utility::array_remove(level.var_6045[param_00],param_01);
}

//Function Number: 6
lib_A553::func_4D4F()
{
	var_00 = [];
	var_01 = function_00D8();
	var_02 = function_00D6();
	foreach(var_04 in var_01)
	{
		if(isdefined(var_04.var_79E9) && var_04.var_79E9 != "none")
		{
			var_05 = lib_A553::func_615D(var_04.var_79E9);
			var_00[var_00.size] = var_05;
		}
	}

	foreach(var_08 in var_02)
	{
		if(isdefined(var_08.var_79E9) && var_08.var_79E9 != "none")
		{
			var_05 = lib_A553::func_615D(var_08.var_79E9);
			var_00[var_00.size] = var_05;
		}
	}

	level.var_79EA = var_00;
}

//Function Number: 7
lib_A553::func_615D(param_00)
{
	var_01 = strtok(param_00," ");
	if(var_01.size > 1)
	{
		param_00 = var_01[1];
	}

	return param_00;
}

//Function Number: 8
lib_A553::func_737A(param_00)
{
	foreach(var_02 in level.var_79EA)
	{
		foreach(var_04 in level.var_6045[param_00])
		{
			if(var_02 == var_04)
			{
				lib_A553::func_736B(param_00,var_04);
			}
		}
	}
}

//Function Number: 9
lib_A553::func_7124(param_00)
{
	var_01 = level.var_6045[param_00].size;
	for(var_02 = 0;var_02 < var_01;var_02++)
	{
		var_03 = randomint(var_01);
		var_04 = level.var_6045[param_00][var_02];
		level.var_6045[param_00][var_02] = level.var_6045[param_00][var_03];
		level.var_6045[param_00][var_03] = var_04;
	}
}

//Function Number: 10
lib_A553::func_3DE0(param_00)
{
	if(isdefined(self.inliveplayerkillstreak) && self.inliveplayerkillstreak == "neutral")
	{
		return;
	}

	if(isdefined(self.var_79E9))
	{
		if(self.var_79E9 == "none")
		{
			return;
		}

		self.name = self.var_79E9;
		lib_A553::func_40A9(self.name);
		self notify("set name and rank");
		return;
	}

	lib_A553::func_3DE1(self.voice);
	self notify("set name and rank");
}

//Function Number: 11
lib_A553::func_3DE1(param_00)
{
	level.var_6042[param_00] = level.var_6042[param_00] + 1 % level.var_6045[param_00].size;
	var_01 = level.var_6045[param_00][level.var_6042[param_00]];
	var_02 = randomint(10);
	if(lib_A553::func_6065(param_00))
	{
		var_03 = param_00 + "_surnames";
		level.var_6042[var_03] = level.var_6042[var_03] + 1 % level.var_6045[var_03].size;
		var_01 = var_01 + " " + level.var_6045[var_03][level.var_6042[var_03]];
	}

	if(lib_A553::func_6064(param_00))
	{
		var_04 = var_01;
		self.var_992 = "private";
	}
	else if(var_01 == "secretservice")
	{
		var_04 = "Agent " + var_02;
		self.var_992 = "private";
	}
	else if(var_04 > 5)
	{
		var_04 = "Pvt. " + var_02;
		self.var_992 = "private";
	}
	else if(var_04 > 2)
	{
		var_04 = "Cpl. " + var_02;
		self.var_992 = "private";
	}
	else
	{
		var_04 = "Sgt. " + var_02;
		self.var_992 = "sergeant";
	}

	if(isai(self) && self method_813D())
	{
		self.var_986 = var_04;
		return;
	}

	self.name = var_04;
}

//Function Number: 12
lib_A553::func_40A9(param_00)
{
	if(!isdefined(param_00))
	{
		self.var_992 = "private";
	}

	var_01 = strtok(param_00," ");
	var_02 = var_01[0];
	switch(var_02)
	{
		case "Pvt.":
			break;

		case "Pfc.":
			break;

		case "Agent":
			break;

		case "Cpl.":
			break;

		case "Sgt.":
			break;

		case "Lt.":
			break;

		case "Cpt.":
			break;

		default:
			break;
	}
}

//Function Number: 13
lib_A553::func_6064(param_00)
{
	switch(param_00)
	{
		case "sentinel":
		case "atlas":
		case "czech":
		case "seal":
		case "taskforce":
		case "delta":
		case "xslice":
			break;
	}
}

//Function Number: 14
lib_A553::func_6065(param_00)
{
	return isdefined(level.var_6045[param_00 + "_surnames"]);
}