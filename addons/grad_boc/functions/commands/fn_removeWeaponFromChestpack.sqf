/*
 * Author: DerZade
 * Removes weapon from unit's chestpack. The purpose of this function is to ensure that weapons with specific attachments and magazines can be removed.
 * If you want to remove a weapon with just any attachments/magazines you may want to use 'grad_boc_fnc_removeItemFromChestpack' instead.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <ARRAY> [<CLASSNAME>, <SILENCER>, <POINTER>, <OPTIC>, <PRIMARY MAG>, <SECONDARY MAG>, <BIPOD>]
 * 		0: Weapon classname <STRING>
 * 		1: Silencer classname <STRING>
 * 		2: Pointer classname <STRING>
 * 		3: Optic classname <STRING>
 * 		4: Primary magazine [Classname <STRING>, Ammo count <NUMBER>] or []
 * 		5: Secondary magazine [Classname <STRING>, Ammo count <NUMBER>] or []
 * 		6: Bipod classname <STRING>
 * 2: Ammo count <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player,["arifle_MX_GL_F","","acc_pointer_IR","optic_Aco",["30Rnd_65x39_caseless_mag",30],["1Rnd_SmokeOrange_Grenade_shell",1],""],2] call grad_boc_fnc_removeWeaponFromChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]], ["_weapon",[],[[]],[7]], ["_amount",1,[0]] ];

if (isNull _unit || count _wepaon isEqualTo 0 || _amount < 1) exitWith {};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {};

// exit if there is no such item in chestpack
if ([_unit] call grad_boc_fnc_chestpackItems find _item isEqualTo -1) exitWith {};

[_unit, [_weapon, (-1)*_amount]] call grad_boc_fnc_modifyItemAmount;
