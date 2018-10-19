/*
 * Author: DerZade
 * Triggered by the onBack-action. Handles removing chestpack and adding backpack with same content.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call grad_boc_fnc_actionOnBack;
 *
 * Public: No
 */
params [ ["_player",objNull,[objNull]] ];

if (isNull _player) exitWith {};

private _chestpack = [_player] call grad_boc_fnc_chestpack;
private _chestpackLoadout = [_player] call grad_boc_fnc_chestpackLoadout;

// make sure the player has a chestpack and no backpack
if ((_chestpack isEqualTo "") or !(backpack _player isEqualTo "")) exitWith {};

private _unitLoadout = +(getUnitLoadout _player);

_unitLoadout set [5, [_chestpack, _chestpackLoadout]];

_player setUnitLoadout _unitLoadout;

[_player] call grad_boc_fnc_removeChestpack;
