
/*-----------
Script: fn_saveInventory
Description: Save player inventory and return an array
Author: BlackHat
-----------*/

params [ "_unit", "_inventory" ];

_inventory = [

	assignedItems _unit,
	headgear _unit,
	goggles _unit,
	
	[ primaryWeapon _unit, primaryWeaponItems _unit, primaryWeaponMagazine _unit ],
	[ secondaryWeapon _unit, secondaryWeaponItems _unit, secondaryWeaponMagazine _unit ],
	[ handgunWeapon _unit, handgunItems _unit, handgunMagazine _unit ],
	
	[ uniform _unit, uniformItems _unit ],
	[ vest _unit, vestItems _unit ],
	[ backpack _unit, backpackItems _unit ]
	
];

_inventory
