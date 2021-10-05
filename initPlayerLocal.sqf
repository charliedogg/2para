SHP_fnc_openSquadnameSet = {
	params ["_charArray"];
	_char = _charArray select 1;
	if (_char == 47) then {
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
		}];

	ctrlSetFocus _ctrlEdit;
	_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
	_ctrlGroup ctrlCommit 0.1;
};


waitUntil { !isNull player && alive player };

loadout = [player] call PARA_fnc_saveInventory;


player addEventHandler["Respawn", {
	
	if(true) then {
		[player, loadout] call PARA_fnc_loadInventory;
	};
}];

[]spawn{
	waitUntil { !isNull (findDisplay 46) };
	[]spawn{moduleSetName = findDisplay 46 displayAddEventHandler ["char", "[_this] call SHP_fnc_openSquadnameSet;"];};
};

_playerUnit = player;
[_playerUnit,["squadname","",TRUE]] remoteExec ["setVariable", 2];
