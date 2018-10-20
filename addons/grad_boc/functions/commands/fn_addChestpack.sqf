/*
 * Author: DerZade
 * Adds a chestpack to a unit. If a unit already has one, the old chestpack will be ignored and will be deleted completely.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Backpack Classname <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,"B_Kitbag_rgr"] call grad_boc_fnc_addChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]], ["_chestpackClass","",[""]] ];

if (isNull _unit || _chestpackClass isEqualTo "") exitWith {};

// add HandleDisconnect-EH on server if not done yet
if !(missionNamespace getVariable ["grad_boc_HDCEHadded",false]) then {
    ["HandleDisconnect",grad_boc_fnc_EHHandleDisconnect] remoteExecCall ["addMissionEventHandler", 2];
    grad_boc_HDCEHadded = true;
    publicVariable "grad_boc_HDCEHadded";
};

// delete existing chestpack, if there is one
if !([_unit] call grad_boc_fnc_chestpack isEqualTo "") then {
    [_unit] call grad_boc_fnc_removeChestpack;
};

// add EHs
private _getInID = _unit addEventHandler ["GetInMan",grad_boc_fnc_EHGetIn];
private _getOutID = _unit addEventHandler ["GetOutMan",grad_boc_fnc_EHGetOut];
private _animID = _unit addEventHandler ["AnimDone",grad_boc_fnc_EHAnimDone];
private _killedID = _unit addEventHandler ["Killed",grad_boc_fnc_EHKilled];

// create chestpack itself
private _weaponHolder = createVehicle ["grad_boc_weaponHolder", getPos _unit, [], 0, "CAN_COLLIDE"];
_weaponHolder addBackpackCargoGlobal [_chestpackClass, 1];

[_unit, "forceWalk", "grad_boc", true] call ace_common_fnc_statusEffect_set;

// set variable
_unit setVariable ["grad_boc_chestpack",[[_chestpackClass, _weaponHolder],[_getInID,_getOutID,_animID,_killedID],[]], true];

// execute vehicle shit
if !(vehicle _unit isEqualTo _unit) then {
	[_unit, "", vehicle _unit] call grad_boc_fnc_EHGetIn;
} else {
	[_unit, "", objNull] call grad_boc_fnc_EHGetOut;
};
