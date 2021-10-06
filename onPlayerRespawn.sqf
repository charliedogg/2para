_loadedLoadout = player getVariable "loadoutPara";
if (not isNil "_loadedLoadout") then {
	player setUnitLoadout _loadedLoadout;
};
_savedLoadout = getUnitLoadout player;
player setVariable ["loadoutPara",_savedLoadout]