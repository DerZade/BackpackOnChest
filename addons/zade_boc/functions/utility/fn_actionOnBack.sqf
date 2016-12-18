params ["_player"];

private _chestpack = [_player] call zade_boc_fnc_chestpack;
private _chestpackitems =  [_player,false] call zade_boc_fnc_chestpackItems;
private _chestpackmags = [_player] call zade_boc_fnc_chestpackMagazines;

//add pack
_player addBackpackGlobal _chestpack;
clearAllItemsFromBackpack _player;
//add items
{
     _player addItemToBackpack _x;
} forEach _chestpackitems;

//add magazines
{
     (backpackContainer _player) addMagazineAmmoCargo [(_x select 0), (_x select 2), (_x select 1)];
} forEach _chestpackmags;

[_player] call zade_boc_fnc_removeChestpack;
