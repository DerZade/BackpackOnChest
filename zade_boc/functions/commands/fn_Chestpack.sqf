/*
 * Author: DerZade
 * Returns the classname of a unit's chestpack.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * classname <STRING>
 *
 * Example:
 * [player] call zade_boc_fnc_chestpack;
 *
 * Public: No
 */
params ["_unit"];

if (isNil "_unit") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _var = _unit getVariable ["zade_boc_chestpack",nil];

//return ""
if (isNil "_var") exitWith {""};
private _chestpackClass = (_var select 0) select 0;

//return classname
_chestpackClass
