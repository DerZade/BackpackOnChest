/*
 * Author: DerZade
 * Removes all items (includes weapons and magazines) from a unit's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call grad_boc_fnc_clearAllItemsFromChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]] ];

if (isNull _unit) exitWith {};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {};

[_unit, []] call grad_boc_fnc_setChestpackLoadout;
