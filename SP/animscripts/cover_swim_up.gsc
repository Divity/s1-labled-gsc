/*******************************************************************
 * Decompiled By: AgreedBog381
 * Decompiled File: cover_swim_up.gsc
 * Game: Call of Duty: Advanced Warfare
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 138 ms
 * Timestamp: 4/20/2022 8:20:23 PM
*******************************************************************/

//Function Number: 1
main()
{
	self.var_C50 = [];
	self.var_C50["hiding"]["stand"] = ::func_7F20;
	self.var_C50["hiding"]["crouch"] = ::func_7F20;
	self endon("killanimscript");
	animscripts\utility::func_4DD4("cover_swim_up");
	if(!isdefined(self.var_CBC) || self.var_CBC != "cover_u")
	{
		self.var_CBC = "cover_u";
	}

	animscripts\corner::func_2222("up",0);
}

//Function Number: 2
end_script()
{
	animscripts\corner::func_3142();
	animscripts\cover_behavior::end_script("up");
}

//Function Number: 3
func_7F20()
{
	self.var_7.var_CD8 = animscripts\swim::func_40FE("cover_u");
	self.var_4881 = 0;
}