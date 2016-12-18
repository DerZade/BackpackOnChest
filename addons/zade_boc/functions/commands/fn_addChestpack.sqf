/*
 * Author: DerZade
 * Adds a chestpack to a unit. If a unit already has one, the old chestpack will be ignored and will be deleted completely.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: backpack classname <STRING>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [player,"B_Kitbag_rgr"] call zade_boc_fnc_addChestpack;
 *
 * Public: No
 */
params ["_unit","_chestpackClass"];

if (isNil "_unit" or isNil "_chestpackClass") exitWith {["No proper argument(s) given."] call BIS_fnc_error};

//delete existing chestpack, if there is one
if ([_unit] call zade_boc_fnc_chestpack != "") then {
     [_unit] call zade_boc_fnc_removeChestpack;
};

//add EHs
private _getInID = _unit addEventHandler ["GetInMan",zade_boc_fnc_EHGetIn];
private _getOutID = _unit addEventHandler ["GetOutMan",zade_boc_fnc_EHGetOut];
private _animID = _unit addEventHandler ["AnimDone",zade_boc_fnc_EHAnimDone];
private _killedID = _unit addEventHandler ["Killed",zade_boc_fnc_EHKilled];

//create chestpack itself
private _chestpack = createSimpleObject [_chestpackClass, getPos _unit];

_unit forceWalk true;

//set variable
_unit setVariable ["zade_boc_chestpack",[[_chestpackClass,_chestpack],[_getInID,_getOutID,_animID,_killedID],[],[]],true];

//execute vehicle shit
if (vehicle _unit != _unit) then {
	[_unit, "", vehicle _unit] call zade_boc_fnc_EHGetIn;
} else {
	[_unit, "", objNull] call zade_boc_fnc_EHGetOut;
};
