/*
 * Author: DerZade
 * Returns current sum of mass from items stored in a chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Mass <NUMBER>
 *
 * Example:
 * [player] call grad_boc_fnc_loadChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]] ];

if (isNull _unit) exitWith {0};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {0};

private _items = [_unit] call grad_boc_fnc_chestpackItems;
private _mass = 0;

{
    _mass = _mass + [_x] call grad_boc_fnc_itemMass;
} forEach _items;

_mass
