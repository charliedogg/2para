params [ "_unit", "_inventory" ];

removeAllAssignedItems _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;

_unit removeWeapon ( primaryWeapon _unit );
_unit removeWeapon ( secondaryWeapon _unit );
_unit removeWeapon ( handgunWeapon _unit );

_unit addBackpack "B_Kitbag_mcamo";

{

	if ( getNumber ( configFile >> "CfgWeapons" >> _x >> "type" ) == 4096 ) then {

		_unit addWeapon _x;

	} else {

		_unit linkItem _x;

	};

} forEach ( _inventory select 0 );

_unit addHeadgear ( _inventory select 1 );

_unit addGoggles ( _inventory select 2 );

if ( ( ( _inventory select 3 ) select 0 ) != "" ) then {

	{ _unit addMagazine _x } forEach ( ( _inventory select 3 ) select 2 );

	_unit addWeapon ( ( _inventory select 3 ) select 0 );
	{ if ( _x != "" ) then { _unit addPrimaryWeaponItem _x } } forEach ( ( _inventory select 3 ) select 1 );

};

if ( ( ( _inventory select 4 ) select 0 ) != "" ) then {

	{ _unit addMagazine _x } forEach ( ( _inventory select 4 ) select 2 );

	_unit addWeapon ( ( _inventory select 4 ) select 0 );
	{ if ( _x != "" ) then { _unit addSecondaryWeaponItem _x } } forEach ( ( _inventory select 4 ) select 1 );

};

if ( ( ( _inventory select 5 ) select 0 ) != "" ) then {

	{ _unit addMagazine _x } forEach ( ( _inventory select 5 ) select 2 );

	_unit addWeapon ( ( _inventory select 5 ) select 0 );
	{ if ( _x != "" ) then { _unit addHandgunItem _x } } forEach ( ( _inventory select 5 ) select 1 );

};

removeBackpack _unit;

if ( ( ( _inventory select 6 ) select 0 ) != "" ) then {

	_unit forceAddUniform ( ( _inventory select 6 ) select 0 );
	{ _unit addItemToUniform _x } forEach ( ( _inventory select 6 ) select 1 );

};

if ( ( ( _inventory select 7 ) select 0 ) != "" ) then {

	_unit addVest ( ( _inventory select 7 ) select 0 );
	{ _unit addItemToVest _x } forEach ( ( _inventory select 7 ) select 1 );

};

if ( ( ( _inventory select 8 ) select 0 ) != "" ) then {

	_unit addBackpack ( ( _inventory select 8 ) select 0 );
	{ _unit addItemToBackpack _x } forEach ( ( _inventory select 8 ) select 1 );

};

true