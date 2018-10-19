class grad_boc_onChest
{
    displayName = $STR_grad_boc_OnChest;
    condition = "!(missionNamespace getVariable ['grad_boc_disabled',false]) && !(backpack _player isEqualTo '') && ([_player] call grad_boc_fnc_chestpack isEqualTo '')";
    exceptions[] = {"isNotInside"};
    statement = "[_player] call grad_boc_fnc_actionOnChest";
    showDisabled = 0;
    priority = 2.5;
    icon = "\grad_boc\data\actions\onchest_ca.paa";
};
class grad_boc_onBack : grad_boc_onChest
{
    displayName = $STR_grad_boc_OnBack;
    condition = "!(missionNamespace getVariable ['grad_boc_disabled',false]) && (backpack _player isEqualTo '') && !([_player] call grad_boc_fnc_chestpack isEqualTo '')";
    statement = "[_player] call grad_boc_fnc_actionOnBack";
    icon = "\grad_boc\data\actions\onback_ca.paa";
};
class grad_boc_swap : grad_boc_onChest
{
    displayName = $STR_grad_boc_swap;
    condition = "!(missionNamespace getVariable ['grad_boc_disabled',false]) && !(backpack _player isEqualTo '') && !([_player] call grad_boc_fnc_chestpack isEqualTo '')";
    statement = "[_player] call grad_boc_fnc_actionSwap";
    icon = "\grad_boc\data\actions\swap_ca.paa";
};
