/*
 * Author: DerZade
 * Returns the classname of a unit's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Classname <STRING>
 *
 * Example:
 * [player] call grad_boc_fnc_chestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]] ];

if (isNull _unit) exitWith {};

private _var = _unit getVariable ["grad_boc_chestpack",nil];

//return ""
if (isNil "_var") exitWith {""};
private _chestpackClass = (_var select 0) select 0;

//return classname
_chestpackClass
