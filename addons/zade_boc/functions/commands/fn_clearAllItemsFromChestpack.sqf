/*
 * Author: DerZade
 * Removes all items (includes weapons and magazines) from a unit's chestpack.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [player] call zade_boc_fnc_clearAllItemsFromChestpack;
 *
 * Public: No
 */
params ["_unit"];

if (isNil "_unit") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _var = _unit getVariable ["zade_boc_chestpack",nil];
_var set [2,[]];
_var set [3,[]];

_unit setVariable ["zade_boc_chestpack",_var,true];
