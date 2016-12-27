params ["_player"];

//only if TFAR is loaded
if (isClass(configFile >> "cfgPatches" >> "task_force_radio")) exitWith {
     private _radio = _player call TFAR_fnc_backpackLr;

     //check wether _player has a backpack radio
     if !(_radio isEqualTo []) then {
          _player setVariable ["zade_boc_radioSettings",(_radio call TFAR_fnc_getLrSettings),true];
     };
};
