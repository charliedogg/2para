// BFT MARKERS
[] call PARA_fnc_initGroups;
[] call PARA_fnc_updateTrackingList;
[] spawn PARA_fnc_trackGroups;

onPlayerConnected {
	[] call PARA_fnc_updateTrackingList;
};

onPlayerDisconnected {
	[] call PARA_fnc_updateTrackingList;
};

// UPSMON
nul = call compile preprocessFile "scripts\UPSMON\COMMON\markerAlpha.sqf";
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
