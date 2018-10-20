/*
 * Author: DerZade
 * This function is for backwards compatibility. It redirects any of the
 * old function with the prefix 'zade_boc' to the new 'grad_boc' function.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Example:
 * N/A
 *
 * Public: No
 */
if (_fnc_scriptName isEqualTo "") exitWith {};

private _newFunction = format["grad%1",_fnc_scriptName select [4]];

diag_log text format ["[GRAD_BOC] WARN: '%1' is deprecated since version 1.3. Use '%2' instead!", _fnc_scriptName, _newFunction];

_this call (missionNamespace getVariable [_newFunction,{}]);