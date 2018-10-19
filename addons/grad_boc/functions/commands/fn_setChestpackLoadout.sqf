/*
 * Author: DerZade
 * Sets loadout of soldier's chestpack. The loadout is a array similar to the loadout of a container in a 'Unit Loadout Array'
 * (i.e. returned in 'getUnitLoadout'). It can contain as many items as you wish. The items can be split into three categories
 * (items, weaons, magazines), which all have their own specific format in the array:
 * Items: [<CLASSNAME>, <AMOUNT>] i.e.: ["NVGoggles",1],
 * Magazines: [<CLASSNAME>, <AMOUNT>, <AMMO COUNT>] i.e.: ["30Rnd_65x39_caseless_mag",6,30]
 * Weapons: [[<CLASSNAME>, <SILENCER>, <POINTER>, <OPTIC>, <PRIMARY MAG>, <SECONDARY MAG>, <BIPOD>], <AMOUNT>]
 * 		where PRIMARY/SECONDARY MAG is [<CLASSNAME>, <AMMO COUNT>]
 *		i.e.: [["arifle_MX_GL_F","","acc_pointer_IR","optic_Aco",["30Rnd_65x39_caseless_mag",30],["1Rnd_SmokeOrange_Grenade_shell",1],""],1]
 *
 * The easiest way to get such a loadout is just "getUnitLoadout player select 5 select 1", which will return the loadout 
 * of the players backpack.
 * For further information see https://community.bistudio.com/wiki/Unit_Loadout_Array
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Chestpack Loadout <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,[["FirstAidKit", 1], ["30Rnd_65x39_caseless_mag",5,30]]] call grad_boc_fnc_setChestpackLoadout;
 *
 * Public: No
 */
params [ ["_unit", objNull, [objNull]], ["_loadout", [], [[]]] ];

if (isNull _unit) exitWith {};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {};

private _var = _unit getVariable ["grad_boc_chestpack", nil];

_var set [2, _loadout];

// update variable
_unit setVariable ["grad_boc_chestpack", _var, true];