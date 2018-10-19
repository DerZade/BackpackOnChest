if (_fnc_scriptName isEqualTo "") exitWith {};

private _newFunction = format["grad%1",_fnc_scriptName select [4]];

diag_log text format ["[GRAD_BOC] WARN: '%1' is deprecated since version 1.3. Use '%2' instead!", _fnc_scriptName, _newFunction];

_this call (missionNamespace getVariable [_newFunction,{}]);