/*
 * Author: DerZade
 * Applies given radio-settings to the backpack radio of the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Radio-settings <Depending on used Radio-Modification>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, player getVariable "zade_boc_radioSettings"] call zade_boc_fnc_pasteRadioSettings;
 *
 * Public: No
 */
params ["_player","_settings"];

//only if TFAR is loaded

if (isClass(configFile >> "cfgPatches" >> "task_force_radio")) exitWith {
     //apply settings
     private _radio = _player call TFAR_fnc_backpackLr;
     //Changed API in TFAR 1.0
     if (isClass(configFile >> "cfgPatches" >> "tfar_core")) then {
         [_radio, _settings] call TFAR_fnc_setLrSettings;     
     } else {
         [_radio select 0, _radio select 1, _settings] call TFAR_fnc_setLrSettings;
     };
};
