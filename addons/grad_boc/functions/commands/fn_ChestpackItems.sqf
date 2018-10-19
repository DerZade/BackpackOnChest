/*
 * Author: DerZade
 * Returns array with all items (of any kind, even weapons) in chestpack of the given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Return magazines aswell <BOOL> (optional | default: true)
 *
 * Return Value:
 * Items <ARRAY>
 *
 * Example:
 * [player] call grad_boc_fnc_chestpackItems;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]], ["_returnMags",true,[true]] ];

if (isNull _unit) exitWith {[]};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {[]};

private _items = [];

{
    _x params ["_item", "_amount"];

    if (count _x < 3 || _returnMags) then {
        // weapons are [[classname, ...], amount] so we have to extract the classname
        if (_item isEqualType []) then {
            _item = _item select 0;
        };

        for "_i" from 1 to _amount do {
            _items pushBack _item;
        };
    };

} forEach ([_unit] call grad_boc_fnc_chestpackLoadout);

// return items
_items
