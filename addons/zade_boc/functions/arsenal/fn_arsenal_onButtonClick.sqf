private _center = missionnamespace getvariable ["BIS_fnc_arsenal_center",player];

private _chestpack = [_center] call zade_boc_fnc_chestpack;
private _backpack = backpack _center;

private _action = ["onback", "onchest"] select (_chestpack isEqualTo "");
if (!(_backpack isEqualTo "") and !(_chestpack isEqualTo "")) then {_action = "swap";};

//exec action
[_center] call (missionNamespace getVariable (format ["zade_boc_fnc_action%1",_action]));

//update arsenal
["ListSelectCurrent"] call BIS_fnc_arsenal;
