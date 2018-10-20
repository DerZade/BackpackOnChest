/*
 * Author: DerZade
 * Triggerd by GetInMan-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: position <STRING>
 * 2: vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call grad_boc_fnc_EHGetIn;
 *
 * Public: No
 */
params ["_unit","_position","_veh"];

if (isNil "_unit" or isNil "_veh") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _weaponHolder = objectParent ([_unit] call grad_boc_fnc_chestpackContainer);

_weaponHolder remoteExec ["detach", 0];
_weaponHolder remoteExec ["hideObjectGlobal", 0];
[_weaponHolder, [-10000,-10000,-100]] remoteExec ["setPos", 0];
