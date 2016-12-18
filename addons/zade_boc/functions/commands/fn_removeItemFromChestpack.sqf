/*
 * Author: DerZade
 * Removes unit's chestpack.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: item/magazine/weapon classname <STRING>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [player,"FirstAidKit"] call zade_boc_fnc_removeItemFromChestpack;
 *
 * Public: No
 */
params ["_unit","_item"];

if (isNil "_unit" or isNil "_item") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

//exit if there is no such item in chestpack
if ([_unit] call zade_boc_fnc_chestpackItems find _item isEqualTo -1) exitWith {};

private _var = _unit getVariable ["zade_boc_chestpack",nil];

if (isClass (configFile >> "CfgMagazines" >> _item)) then {
     (_var select 3) deleteAt ([(_var select 3),_item] call BIS_fnc_findInPairs);
} else {
     (_var select 2) deleteAt ((_var select 2) find _item);
};

_unit setVariable ["zade_boc_chestpack",_var,true];
