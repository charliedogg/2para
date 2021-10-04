
waitUntil { !isNull player && alive player };

loadout = [player] call PARA_fnc_saveInventory;


player addEventHandler["Respawn", {
	
	if(true) then {
		[player, loadout] call PARA_fnc_loadInventory;
	};
	
}];
