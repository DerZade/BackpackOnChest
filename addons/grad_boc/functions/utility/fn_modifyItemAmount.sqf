/*
 * Author: DerZade
 * Helper function for adding/removing items from chespackLoadout.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: params (depeding on type) <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * _this call grad_boc_fnc_modifyItemAmount;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]], ["_params",[],[[]],[2,3]]];
private _loadout = [_unit] call grad_boc_fnc_chestpackLoadout;

private _paramsWithoutAmount = +_params;
private _loadoutWithoutAmount = +_loadout;

// remove amounts from _loadout and _params
_paramsWithoutAmount deleteAt 1;
_loadoutWithoutAmount = _loadoutWithoutAmount apply {_x deleteAt 1; _x};

private _index = _loadoutWithoutAmount find _paramsWithoutAmount;

// add completely new item
if (_index isEqualTo -1) then {

	_index = _loadout pushBack _params;

} else {
	_params params ["_item", "_amount"];
	private _prevAmount = (_loadout select _index) select 1;
	(_loadout select _index) set [1, _prevAmount + _amount];
};


// delete item if the new amount is below 1
if ((_loadout select _index) select 1 < 1) then {
    _loadout deleteAt _index;
};

// update variable
[_unit, _loadout] call grad_boc_fnc_setChestpackLoadout;
