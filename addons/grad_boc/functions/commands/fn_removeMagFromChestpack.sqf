/*
 * Author: DerZade
 * Removes magazine from unit's chestpack. The purpose of this function is to ensure that magazines with a specified ammo count can be removed.
 * If you want to remove a magazine with just any amount of ammo you may want to use 'grad_boc_fnc_removeItemFromChestpack' instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 * 2: Ammo count <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,"30Rnd_556x45_Stanag",25,2] call grad_boc_fnc_removeMagFromChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]], ["_item","",[""]], ["_ammo",-1,[0]], ["_amount",1,[0]] ];

if (isNull _unit || _item isEqualTo "" || _ammo isEqualTo -1 || _amount < 1) exitWith {};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {0};

// exit if there is no such item in chestpack
if ((compile format ["(_x select 0) isEqualTo '%1' and (_x select 1) isEqualTo %2",_item,_ammo]) count ([_unit] call grad_boc_fnc_chestpackMagazines) isEqualTo 0) exitWith {};

[_unit, [_item, (-1)*_amount, _ammo]] call grad_boc_fnc_modifyItemAmount;
