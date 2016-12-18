/*
 * Author: DerZade
 * Creates new magazine and stores it in  the soldier's chestpack. Only magazines are supported.
 * The purpose of this function is to ensure that magazines with a specified ammo count can be added.
 * If you want to add a/multiple full magazine(s) you may want to use 'zade_boc_addItemToChestpack' instead.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: classname <STRING>
 * 2: ammo count <NUMBER>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [player,"30Rnd_556x45_Stanag",25] call zade_boc_fnc_addMagToChestpack;
 *
 * Public: No
 */
params ["_unit","_item","_ammo"];

if (isNil "_unit" or isNil "_item" or isNil "_ammo") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

//exit if there is not enough space left
if !([_unit,_item,1] call zade_boc_fnc_canAddItemToChestpack) exitWith {};

private _var = _unit getVariable ["zade_boc_chestpack",nil];

(_var select 3) pushBack [_item, _ammo];

//update variable
_unit setVariable ["zade_boc_chestpack",_var,true];
