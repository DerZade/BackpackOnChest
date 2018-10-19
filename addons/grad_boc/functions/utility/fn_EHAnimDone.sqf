/*
 * Author: DerZade
 * Triggerd by AnimDone-Eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: animtaion <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call grad_boc_fnc_EHAnimDone;
 *
 * Public: No
 */
params ["_unit","_anim"];

if (isNil "_unit") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

_weaponHolder = objectParent ([_unit] call grad_boc_fnc_chestpackContainer);

//freefall
if ((animationState _unit) find "halofreefall_" isEqualTo 0) then {
    [_weaponHolder, [_unit,[0,-0.5,-0.12],"pelvis"]] remoteExec ["attachTo", 0];
    [_weaponHolder, [[0,-1,0],[0,0,-1]]] remoteExec ["setVectorDirAndUp", 0];
};
