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
 * [player] call zade_boc_fnc_actionOnChest;
 *
 * Public: No
 */
params [ ["_player",objNull,[objNull]] ];

if (isNull _player) exitWith {};

private _backpack = backpack _player;
private _backpackLoadout = +((getUnitLoadout _player) select 5 select 1);

//make sure the player has no chestpack and a backpack
if ((_backpack isEqualTo "") or !(([_player] call zade_boc_fnc_chestpack) isEqualTo "")) exitWith {};

//add pack
[_player, _backpack] call zade_boc_fnc_addChestpack;

//add items
[_player, _backpackLoadout] call zade_boc_fnc_setChestpackLoadout;

//remove backpack
removeBackpackGlobal _player;

// TODO: use backpackContainer of player as chestpackContainer