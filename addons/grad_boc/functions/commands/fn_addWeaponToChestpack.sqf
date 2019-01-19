/*
 * Author: DerZade
 * Creates new weapon and stores it in  the soldier's chestpack. Only weapons are supported.
 * The purpose of this function is to ensure that weapons with specific attachments and magazines can be added.
 * If you want to add weapon(s) without any attachments you may want to use 'grad_boc_fnc_addItemToChestpack' instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <ARRAY> [<CLASSNAME>, <SILENCER>, <POINTER>, <OPTIC>, <PRIMARY MAG>, <SECONDARY MAG>, <BIPOD>]
 * 		0: Weapon classname <STRING>
 * 		1: Silencer classname <STRING>
 * 		2: Pointer classname <STRING>
 * 		3: Optic classname <STRING>
 * 		4: Primary magazine [Classname <STRING>, Ammo count <NUMBER>] or []
 * 		5: Secondary magazine [Classname <STRING>, Ammo count <NUMBER>] or []
 * 		6: Bipod classname <STRING>
 * 		0: Weapon classname <STRING>
 * 2: Amount <NUMBER> (optional | default: 1)
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,["arifle_MX_GL_F","","acc_pointer_IR","optic_Aco",["30Rnd_65x39_caseless_mag",30],["1Rnd_SmokeOrange_Grenade_shell",1],""],2] call grad_boc_fnc_addWeaponToChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]], ["_weapon",[],[[]],[7]], ["_amount",1,[0]] ];

if (isNull _unit || count _weapon isEqualTo 0 || _amount < 1) exitWith {};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {};

_weapon params [ 
	["_class", "", [""]],
	["_silencer", "", [""]],
	["_pointer", "", [""]],
	["_optic", "", [""]],
	["_primary", [], [[]], [0,2]],
	["_secondary", [], [[]], [0,2]],
	["_bipod", "", [""]]
];

if (_class isEqualTo "") exitWith {};

// validate primary mag
if (count _primary > 0) then {
	_primary params [["_mag","",[""]], ["_ammo",0,[0]]];
	if (_mag isEqualTo "") then {
		_primary = [];
	};
};

// validate secondary mag
if (count _secondary > 0) then {
	_secondary params [["_mag","",[""]], ["_ammo",0,[0]]];
	if (_mag isEqualTo "") then {
		_secondary = [];
	};
};

// exit if there is not enough space left
if !([_unit,_class,_amount] call grad_boc_fnc_canAddItemToChestpack) exitWith {};

[_unit, [[_class, _silencer, _pointer, _optic, _primary, _secondary, _bipod], _amount]] call grad_boc_fnc_modifyItemAmount;
