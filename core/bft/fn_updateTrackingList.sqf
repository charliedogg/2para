
bftTrackingGroups = [];

{
	_hasPlayerLeader = false;
	
	_leader = leader _x;
	
	if(isPlayer _leader) then {
		_hasPlayerLeader = true;
		
	};
	
	if(((side _x) == West) && _hasPlayerLeader) then {
		_squadleader = leader _x;
		_squadname = _squadleader getVariable "squadname";
		groupIDname = groupID _x; 
		if (isNil "_squadname") then {
			markerText1 = groupIDname;
		}else{
			if (_squadname == "") then {
				markerText1 = groupIDname;
			}else{
				markerText1 = _squadname;
			};
		};
		
		deleteMarker (_x getVariable "bft_marker");
		
		marker = createMarker [markerText1, getPos (leader _x)];
		markerText1 setMarkerType "b_inf";
		markerText1 setMarkerText markerText1;
		markerText1 setMarkerColor "colorBLUFOR";
		markerText1 setMarkerAlpha 1;
		_x setVariable ["bft_marker", markerText1];
		
		bftTrackingGroups pushBack _x;
		
	};
	
}forEach allGroups;

missionNamespace setVariable ["bft_tracker", bftTrackingGroups];