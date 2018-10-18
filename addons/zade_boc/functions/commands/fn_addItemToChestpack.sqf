/*
 * Author: DerZade
 * Creates a new item and stores it in the soldier's chestpack. The item can also be a weapon or a magazine.
 * The item(s) won't be added, if adding them would cause an overflow of the backpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item/magazine/weapon classname <STRING>
 * 2: Amount <NUMBER> (optional | default: 1)
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,"FirstAidKit"] call zade_boc_fnc_addItemToChestpack;
 *
 * Public: No
 */
params [ ["_unit", objNull, [objNull]], ["_item","",[""]], ["_amount",1,[0]] ];

if (isNull _unit || _item isEqualTo "" || _amount < 1) exitWith {};

if ([_unit] call zade_boc_fnc_chestpack isEqualTo "") exitWith {};

// exit if there is not enough space left
if !([_unit,_item,_amount] call zade_boc_fnc_canAddItemToChestpack) exitWith {};

// exit if is magazine
if (isClass (configFile >> "CfgMagazines" >> _item)) exitWith {
    for "_i" from 1 to _amount do {
        [_unit,_item,(getNumber (configFile >> "CfgMagazines" >> _item >> "count"))] call zade_boc_fnc_addMagToChestpack;
    };
};

// TODO: exit if is weapon and add as weapon

[_unit, [_item, _amount]] call zade_boc_fnc_modifyItemAmount;