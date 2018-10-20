/*
 * Author: DerZade
 * Called by postInit. Adds local "arsenalOpened" scriptedEventhandler.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call grad_boc_fnc_arsenal_postInit;
 *
 * Public: No
 */
if !(hasInterface) exitWith {};

[missionNamespace, "arsenalOpened", grad_boc_fnc_arsenal_opened] call BIS_fnc_addScriptedEventHandler;
