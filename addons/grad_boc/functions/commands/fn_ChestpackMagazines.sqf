/*
 * Author: DerZade
 * Returns array with all magazines from chestpack of the given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Chestpack magazines <ARRAY> [classname,ammo count, amount of mags]
 * (this format does not match the normal loadout format, because this function
 *  existed before 'getUnitLoadout' was a thing and backwards compatibility and shit)
 *
 * Example:
 * [player] call grad_boc_fnc_chestpackMagazines;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]] ];

if (isNull _unit) exitWith {[]};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {[]};

private _mags = [];

// this could be replaced by a 'select {count _x > 2}' and then 'apply' to change
// the order but I guess iterating two times is slower than just one forEach
{
    if (count _x isEqualTo 3) then { // sort out magazines
        _x params ["_item", "_amount", "_ammo"];

        _mags pushBack [_item, _ammo, _amount];
    }
} forEach ([_unit] call grad_boc_fnc_chestpackLoadout);

// return mags
_mags

