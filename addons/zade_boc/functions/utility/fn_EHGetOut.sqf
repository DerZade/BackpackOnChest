/*
 * Author: DerZade
 * Triggerd by GetOutMan-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: position <STRING>
 * 2: vehicle <OBJECT>
 * 3: turret path <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call zade_boc_fnc_EHGetOut;
 *
 * Public: No
 */
params ["_unit","_position","_veh"];

if (isNil "_unit" or isNil "_veh") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

private _chestpack = [_unit] call zade_boc_fnc_chestpackContainer;

[_chestpack, [_unit,[0,-0.03,-0.5],"pelvis"]] remoteExec ["attachTo", 0];
[_chestpack, [[-0.25,-1,0],[0,0,1]]] remoteExec ["setVectorDirAndUp", 0];
[_chestpack, false] remoteExec ["hideObjectGlobal", 0];

[_unit, "forceWalk", "BackpackOnChest", true] call ace_common_fnc_statusEffect_set;
