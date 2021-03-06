/*-----------
Script: fn_trackGroups
Description: Tracks subscribed groups from the mission every 2.5 seconds
Author: BlackHat
-----------*/

bftRunning = true;

while {bftRunning} do {

	_groups = missionNamespace getVariable "bft_tracker";

	//if(isnull _groups) then {_groups = bftTrackingGroups};

	{
		if(not isnull (leader _x)) then {
		
			_marker = _x getVariable "bft_marker";
			_marker setMarkerPos (getPos (leader _x));
		
		};

	} forEach _groups;
	
	sleep 2.5;
	
};
