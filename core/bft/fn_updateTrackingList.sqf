
bftTrackingGroups = [];

{
	_hasPlayerLeader = false;
	
	_leader = leader _x;
	
	if(isPlayer _leader) then {
		_hasPlayerLeader = true;
		
	};
	
	if(((side _x) == West) && _hasPlayerLeader) then {
		
		_markerText = groupID _x;
		
		deleteMarker (_x getVariable "bft_marker");
		
		_marker = createMarker [_markerText, getPos (leader _x)];
		_markerText setMarkerType "b_inf";
		_markerText setMarkerText _markerText;
		_markerText setMarkerColor "colorBLUFOR";
		
		_x setVariable ["bft_marker", _markerText];
		
		bftTrackingGroups pushBack _x;
		
	};
	
}forEach allGroups;

missionNamespace setVariable ["bft_tracker", bftTrackingGroups];