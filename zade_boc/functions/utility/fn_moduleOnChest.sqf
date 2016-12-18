/*
 * Author: DerZade
 * Triggerd by OnChest-Module
 *
 * Arguments:
 * 0: module <OBJECT>
 * 1: synchronized units <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * n/a
 *
 * Public: No
 */
params ["_module","_units"];

private _backpackClass = _module getVariable "classname";
private _delay = _module getVariable "delay";

_null = [_units,_backpackClass,_delay] spawn {
     params ["_units","_backpackClass","_delay"];
     sleep _delay;
     {
          private _unit = _x;


          private _backpack = backpack _unit;
          if (_backpack != "") then {
               private _backpackitems = (itemCargo (backpackContainer _unit) + weaponCargo (backpackContainer _unit));
               private _backpackmags = [_unit] call zade_boc_fnc_backpackMagazines;
               //remove all mags out of items to prevent adding mags two times
               {
                    for "_i" from 1 to (_x select 2) do {
                         _backpackitems deleteAt (_backpackitems find (_x select 0));
                    };
               } forEach _backpackmags;

               //add pack
               [_unit,_backpack] call zade_boc_fnc_addChestpack;

               //add items
               {
                    [_unit,_x] call zade_boc_fnc_addItemToChestpack;
               } forEach _backpackitems;

               //add magazines
               {
                    for "_i" from 1 to (_x select 2) do {
                         [_unit,(_x select 0),(_x select 1)] call zade_boc_fnc_addMagToChestpack;
                    };
               } forEach _backpackmags;

               removeBackpackGlobal _unit;
          };

          if (_backpackClass != "") then {
               _unit addBackpackGlobal _backpackClass;
          };
     } forEach _units;
};
