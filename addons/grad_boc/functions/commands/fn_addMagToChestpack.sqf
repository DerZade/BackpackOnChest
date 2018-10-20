/*
 * Author: DerZade
 * Creates new magazine and stores it in  the soldier's chestpack. Only magazines are supported.
 * The purpose of this function is to ensure that magazines with a specified ammo count can be added.
 * If you want to add a/multiple full magazine(s) you may want to use 'grad_boc_fnc_addItemToChestpack' instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 * 2: Ammo count <NUMBER>
 * 3: Amount <NUMBER> (optional | default: 1)
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,"30Rnd_556x45_Stanag",25,2] call grad_boc_fnc_addMagToChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]], ["_item","",[""]], ["_ammo",-1,[0]], ["_amount",1,[0]] ];

if (isNull _unit || _item isEqualTo "" || _ammo isEqualTo -1 || _amount < 1) exitWith {};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {};

// exit if there is not enough space left
if !([_unit,_item,_amount] call grad_boc_fnc_canAddItemToChestpack) exitWith {};

[_unit, [_item, _amount, _ammo]] call grad_boc_fnc_modifyItemAmount;
