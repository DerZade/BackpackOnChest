params ["_player"];

private _backpack = backpack _player;
private _backpackitems = (itemCargo (backpackContainer _player) + weaponCargo (backpackContainer _player));
private _backpackmags = [_player] call zade_boc_fnc_backpackMagazines;
private _chestpack = [_player] call zade_boc_fnc_chestpack;
private _chestpackitems =  [_player,false] call zade_boc_fnc_chestpackItems;
private _chestpackmags = [_player] call zade_boc_fnc_chestpackMagazines;

//remove packs
[_player] call zade_boc_fnc_removeChestpack;
removeBackpackGlobal _player;

//add backpack
_player addBackpackGlobal _chestpack;
clearAllItemsFromBackpack _player;
//add backpack items
{
     _player addItemToBackpack _x;
} forEach _chestpackitems;

//add backpack magazines
{
     (backpackContainer _player) addMagazineAmmoCargo [(_x select 0), (_x select 2), (_x select 1)];
} forEach _chestpackmags;

//add chestpack
[_player,_backpack] call zade_boc_fnc_addChestpack;

//add chestpack items
{
     [_player,_x] call zade_boc_fnc_addItemToChestpack;
} forEach _backpackitems;

//add chestpack magazines
{
     for "_i" from 1 to (_x select 2) do {
          [_player,(_x select 0),(_x select 1)] call zade_boc_fnc_addMagToChestpack;
     };
} forEach _backpackmags;
