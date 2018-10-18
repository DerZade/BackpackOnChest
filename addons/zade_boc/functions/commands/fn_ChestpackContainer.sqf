/*
 * Author: DerZade
 * Returns the cargo container of a unit's chestpack. Note that this is only a prop and does not contain any items. Items which
 * were added with vanilla commands like 'addWeaponCargo' etc.  will be ignored. You have to use the provided functions instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Cargo container or objNull <OBJECT>
 *
 * Example:
 * [player] call zade_boc_fnc_chestpackContainer;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]] ];

if (isNull _unit) exitWith {objNull};

private _var = _unit getVariable ["zade_boc_chestpack",nil];
private _weaponHolder = (_var select 0) select 1;

//return objNull
if (isNil "_var" or isNil "_weaponHolder") exitWith {objNull};

//return object
firstBackpack _weaponHolder
