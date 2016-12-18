class zade_boc_onChest
{
     displayName = $STR_zade_boc_OnChest;
     condition = "!(missionNamespace getVariable ['zade_boc_disabled',false]) && !(backpack _player isEqualTo '') && ([_player] call zade_boc_fnc_chestpack isEqualTo '')";
     exceptions[] = {"notOnMap", "isNotSitting"};
     statement = "[_player] call zade_boc_fnc_actionOnChest";
     showDisabled = 0;
     priority = 2.5;
     icon = "\zade_boc\data\actions\onchest_ca.paa";
};
class zade_boc_onBack : zade_boc_onChest
{
     displayName = $STR_zade_boc_OnBack;
     condition = "!(missionNamespace getVariable ['zade_boc_disabled',false]) && (backpack _player isEqualTo '') && !([_player] call zade_boc_fnc_chestpack isEqualTo '')";
     statement = "[_player] call zade_boc_fnc_actionOnBack";
     icon = "\zade_boc\data\actions\onback_ca.paa";
};
class zade_boc_swap : zade_boc_onChest
{
     displayName = $STR_zade_boc_swap;
     condition = "!(missionNamespace getVariable ['zade_boc_disabled',false]) && !(backpack _player isEqualTo '') && !([_player] call zade_boc_fnc_chestpack isEqualTo '')";
     statement = "[_player] call zade_boc_fnc_actionSwap";
     icon = "\zade_boc\data\actions\swap_ca.paa";
};
