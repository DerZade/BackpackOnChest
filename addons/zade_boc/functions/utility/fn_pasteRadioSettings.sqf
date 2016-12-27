params ["_player","_settings"];

//only if TFAR is loaded
if (isClass(configFile >> "cfgPatches" >> "task_force_radio")) exitWith {
     //apply settings
     private _radio = _player call TFAR_fnc_backpackLr;
     [_radio select 0, _radio select 1, _settings] call TFAR_fnc_setLrSettings;
};
