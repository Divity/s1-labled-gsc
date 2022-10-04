/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_swim_right.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 104 ms
 * Timestamp: 4/20/2022 8:20:23 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_C50 = [];
	self.var_C50["hiding"]["stand"] = ::func_7F1F;
	self.var_C50["hiding"]["crouch"] = ::func_7F1F;
	self endon("killanimscript");
	animscripts\utility::func_4DD4("cover_swim_right");
	if(!isdefined(self.var_CBC) || self.var_CBC != "cover_corner_r")
	{
		self.var_CBC = "cover_corner_r";
	}

	var_00 = level.var_CCA["soldier"]["swim"]["arrival_cover_corner_r_angleDelta"][4][4];
	animscripts\corner::func_2222("right",var_00[1]);
}

//Function Number: 2
end_script()
{
	animscripts\corner::func_3142();
	animscripts\cover_behavior::end_script("right");
}

//Function Number: 3
func_7F1F()
{
	self.var_7.var_CD8 = animscripts\swim::func_40FE("cover_corner_r");
	var_00 = level.var_CCA["soldier"]["swim"]["arrival_cover_corner_r_angleDelta"][4][4];
	self.var_4881 = var_00[1];
}