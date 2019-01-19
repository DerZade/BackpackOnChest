/*
 * Author: DerZade
 * Triggered by the onChest-action. Handles removing backpack and adding chestpack with same content.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call grad_boc_fnc_actionOnChest;
 *
 * Public: No
 */
params [ ["_player",objNull,[objNull]] ];

if (isNull _player) exitWith {};

private _backpack = backpack _player;
private _backpackLoadout = +((getUnitLoadout _player) select 5 select 1);

// make sure the player has no chestpack and a backpack
if ((_backpack isEqualTo "") or !(([_player] call grad_boc_fnc_chestpack) isEqualTo "")) exitWith {};

// add pack
[_player, _backpack] call grad_boc_fnc_addChestpack;

// add items
[_player, _backpackLoadout] call grad_boc_fnc_setChestpackLoadout;

private _weaponHolder = objectParent ([_player] call grad_boc_fnc_chestpackContainer); 
 
clearBackpackCargoGlobal _weaponHolder; 
  
_player action ["DropBag", _weaponHolder, _backpack];

// TODO: use backpackContainer of player as chestpackContainer