/*
 * Author: DerZade
 * Triggered by the onButtonClick-EventHandler.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call grad_boc_fnc_arsenal_onButtonClick;
 *
 * Public: No
 */
private _center = missionnamespace getvariable ["BIS_fnc_arsenal_center", player];

private _chestpack = [_center] call grad_boc_fnc_chestpack;
private _backpack = backpack _center;

private _action = ["onback", "onchest"] select (_chestpack isEqualTo "");
if (!(_backpack isEqualTo "") and !(_chestpack isEqualTo "")) then {_action = "swap";};

//execute action
[_center] call (missionNamespace getVariable (format ["grad_boc_fnc_action%1",_action]));

//update arsenal
["ListSelectCurrent"] call BIS_fnc_arsenal;
