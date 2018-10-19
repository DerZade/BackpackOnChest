/*
 * Author: DerZade
 * Removes unit's chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call grad_boc_fnc_removeChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]] ];

if (isNull _unit) exitWith {};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {};

private _var = _unit getVariable ["grad_boc_chestpack",nil];

// delete weaponHolder holding chestpack
deleteVehicle objectParent ([_unit] call grad_boc_fnc_chestpackContainer);

// remove all EHs
_unit removeEventHandler ["GetInMan",(_var select 1) select 0];
_unit removeEventHandler ["GetOutMan",(_var select 1) select 1];
_unit removeEventHandler ["AnimDone",(_var select 1) select 2];
_unit removeEventHandler ["Killed",(_var select 1) select 3];

[_unit, "forceWalk", "grad_boc", false] call ace_common_fnc_statusEffect_set;

// reset variable
_unit setVariable ["grad_boc_chestpack",nil,true];
