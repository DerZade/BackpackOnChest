params ["_display"];

//exit if BOC is disabled
if (missionNamespace getVariable ['zade_boc_disabled',false]) exitWith {};

//get lowest button that is hidden
private _notshown = 948;
for "_i" from 948 to 945 step -1 do {
    if !(ctrlShown (_display displayCtrl _i)) then {
         _notshown = _i;
    };
};

//default offset of two buttons
private _offset = ((ctrlPosition (_display displayCtrl 932)) select 1) - ((ctrlPosition (_display displayCtrl 930)) select 1);

private _btn = _display ctrlCreate ["RscButtonArsenal", 9233];

//set pos
private _pos = ctrlPosition (_display displayCtrl (_notshown - 1));
_pos set [1, (_pos select 1) + _offset];
_btn ctrlSetPosition _pos;
_btn ctrlCommit 0;

//set color
_btn ctrlSetBackgroundColor [0,0,0,0.5];

//add EH to backpack list and button
(_display displayCtrl 965) ctrlAddEventHandler ["LBSelChanged",zade_boc_fnc_arsenal_updateUI];
_btn ctrlAddEventHandler ["ButtonClick",zade_boc_fnc_arsenal_onButtonClick];

_display displayAddEventHandler ["KeyDown", "params ['_disp','_key']; if (_key isEqualTo 14) then {[_disp] spawn {sleep 0.02; ((_this select 0) displayCtrl 9233) ctrlShow (ctrlShown ((_this select 0) displayCtrl 932));};};"];

[_display] call zade_boc_fnc_arsenal_updateUI;
