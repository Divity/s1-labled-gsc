/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_stand.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 80 ms
 * Timestamp: 4/20/2022 8:20:22 PM
*******************************************************************/

//Function Number: 1
main()
{
	self endon("killanimscript");
	animscripts\utility::func_4DD4("cover_stand");
	animscripts\cover_wall::func_229A("stand");
}

//Function Number: 2
end_script()
{
	animscripts\cover_behavior::end_script("stand");
}