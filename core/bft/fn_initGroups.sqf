/*-----------
Script: fn_initGroups
Description: Initializes groups for BFT
Author: BlackHat
-----------*/

{
	
	if(((side _x) == West)) then {
		
		_x setVariable ["bft_marker", ""];
		
	};
	
}forEach allGroups;
