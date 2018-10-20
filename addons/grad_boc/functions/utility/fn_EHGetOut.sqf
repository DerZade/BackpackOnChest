/*
 * Author: DerZade
 * Triggerd by GetOutMan-Eventhandler
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
 * _this call grad_boc_fnc_EHGetOut;
 *
 * Public: No
 */
params ["_unit","_position","_veh"];

if (isNil "_unit" or isNil "_veh") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _weaponHolder = objectParent ([_unit] call grad_boc_fnc_chestpackContainer);

[_weaponHolder, [_unit,[0.04,0.12,-0.5],"pelvis"]] remoteExec ["attachTo", 0]; 
[_weaponHolder, [[0,0,-1],[0.6,1,0]]] remoteExec ["setVectorDirAndUp", 0];

[_weaponHolder, false] remoteExec ["hideObjectGlobal", 0];

[_unit, "forceWalk", "grad_boc", true] call ace_common_fnc_statusEffect_set;
