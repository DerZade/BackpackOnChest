/*
 * Author: DerZade
 * Triggered by the swap-action. Handles removing backpack and adding chestpack with same content.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call grad_boc_fnc_actionSwap;
 *
 * Public: No
 */
params [ ["_player",objNull,[objNull]] ];

if (isNull _player) exitWith {};

private _backpack = backpack _player;
private _chestpack = [_player] call grad_boc_fnc_chestpack;
private _backpackLoadout = +((getUnitLoadout _player) select 5 select 1);
private _chestpackLoadout = [_player] call grad_boc_fnc_chestpackLoadout;

// make sure the player has chest- and backpack
if ((_backpack isEqualTo "") or (_chestpack isEqualTo "")) exitWith {};

removeBackpackGlobal _player;

private _unitLoadout = +(getUnitLoadout _player);
_unitLoadout set [5, [_chestpack, _chestpackLoadout]];
_player setUnitLoadout _unitLoadout;

// add chestpack
[_player, _backpack] call grad_boc_fnc_addChestpack;
[_player, _backpackLoadout] call grad_boc_fnc_setChestpackLoadout;