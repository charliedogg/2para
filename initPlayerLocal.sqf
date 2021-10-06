SHP_fnc_openSquadnameSet = {
	params ["_charArray"];
	_char = _charArray select 1;
	if (_char == 42) then {
		call SHP_fnc_setSquadname;
	};
};

SHP_fnc_setSquadname = {

	params ["_target", "_caller", "_actionId", "_arguments"];
	
	disableSerialization;
	private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
	private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
	private _ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
	IDD_EDIT_BOX = 123;
	private _ctrlEdit = _display ctrlCreate ["RscEdit", IDD_EDIT_BOX, _ctrlGroup];
	private _ctrlButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
	_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
	_ctrlGroup ctrlCommit 0;
	_ctrlBackground ctrlSetPosition [0, 0, 0.5, 0.14];
	_ctrlBackground ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.9];
	_ctrlBackground ctrlSetText "Squadname:";
	_ctrlBackground ctrlEnable false;
	_ctrlBackground ctrlCommit 0;
	_ctrlEdit ctrlSetPosition [0.01, 0.05, 0.48, 0.08];
	_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
	_ctrlEdit ctrlCommit 0;
	_ctrlButton ctrlSetPosition [0.18, 0.18, 0.17, 0.05];
	_ctrlButton ctrlCommit 0;
	_ctrlButton ctrlSetText "SAVE";
	_ctrlButton ctrlAddEventHandler ["ButtonClick", 
		{
			params ["_ctrl"];
			_display = ctrlParent _ctrl;
			_text = ctrlText (_display displayCtrl IDD_EDIT_BOX);
			_playerUnit = player;
			[_playerUnit,["squadname",_text,TRUE]] remoteExec ["setVariable", 2];
			_display closeDisplay 1;
			[[], PARA_fnc_updateTrackingList] remoteExec ["call", 2];
		}];

	ctrlSetFocus _ctrlEdit;
	_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
	_ctrlGroup ctrlCommit 0.1;
};

SHP_fnc_addCarMarker = {
	params ["_unit","_role","_vehicle"];
	if (_role == "driver") then{
		_markerCheck = _vehicle getVariable "bft_marker_car";
		if (isNil "_markerCheck") then{
			_markerText1 = _unit getVariable "squadname";
			_markerName = _markerText1;
			if (_markerText1 == "") then{
				_markerText1 = (name _unit + " vehicle");
				_markerName = _markerText1;
			};
			_marker = createMarker [_markerText1, getPos (_vehicle)];
			_markerText1 setMarkerType "b_mech_inf";
			_markerText1 setMarkerText _markerName;
			_markerText1 setMarkerColor "colorBLUFOR";
			_markerText1 setMarkerAlpha 1;
			_vehicle setVariable ["bft_marker_car", _markerText1];
			_oldTrackingCars = missionNamespace getVariable "trackingCars";
			_oldTrackingCars pushBack _vehicle;
			missionNamespace setVariable ["trackingCars",_oldTrackingCars,true];
		}else{
			if (_markerCheck isEqualTo "") then{
				_markerText1 = _unit getVariable "squadname";
			_markerName = _markerText1;
			if (_markerText1 == "") then{
				_markerText1 = (name _unit + " vehicle");
				_markerName = _markerText1;
			};
			_marker = createMarker [_markerText1, getPos (_vehicle)];
			_markerText1 setMarkerType "b_mech_inf";
			_markerText1 setMarkerText _markerName;
			_markerText1 setMarkerColor "colorBLUFOR";
			_markerText1 setMarkerAlpha 1;
			_vehicle setVariable ["bft_marker_car", _markerText1];
			_oldTrackingCars = missionNamespace getVariable "trackingCars";
			_oldTrackingCars pushBack _vehicle;
			missionNamespace setVariable ["trackingCars",_oldTrackingCars,true];
			};
		};
	};	
};

SHP_fnc_removeCarMarker = {
	params ["_unit","_role","_vehicle"];
	
	
	if (count (crew _vehicle) == 0) then{
	
		_marker = _vehicle getVariable "bft_marker_car";
		deleteMarker (_marker);
		_vehicle setVariable ["bft_marker_car",""];
	};

};


waitUntil { !isNull player && alive player };


player addEventHandler["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	[[_unit,_role,_vehicle],SHP_fnc_addCarMarker] remoteExec["call",2];
}];

player addEventHandler["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	[[_unit,_role,_vehicle],SHP_fnc_removeCarMarker] remoteExec["call",2];
}];

[]spawn{
	waitUntil { !isNull (findDisplay 46) };
	[]spawn{moduleSetName = findDisplay 46 displayAddEventHandler ["char", "[_this] call SHP_fnc_openSquadnameSet;"];};
};

_playerUnit = player;
[_playerUnit,["squadname","",TRUE]] remoteExec ["setVariable", 2];

[allPlayers, [player]] call ace_spectator_fnc_updateUnits;
[[west], [east,civilian]] call ace_spectator_fnc_updateSides;
[[1,2],[0]] call ace_spectator_fnc_updateCameraModes;
[[-2,-1],[0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;