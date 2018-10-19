class CfgVehicles
{
    class ReammoBox;
	class grad_boc_weaponHolder: ReammoBox
	{
		scope = 1;
		author = "DerZade";
		_generalMacro = "grad_boc_weaponHolder";
		scopeCurator = 0;
		model = "grad_boc\model.p3d";
		accuracy = 0.2;
		mapSize = 1.39;
		class TransportMagazines {};
		forceSupply = 0;
		memoryPointSupply = "";
		supplyRadius = 0;
		showWeaponCargo = 1;
		transportMaxMagazines = 1e+009;
		transportMaxWeapons = 1e+009;
		displayName = "BackpackOnChest WH";
		destrType = "DestructNo";
		transportMaxBackpacks = 0;
		isGround = 0;
		icon = "iconObject_1x1";
	};


    class Logic;
    class Module_F: Logic
    {
        class ArgumentsBaseUnits
        {
            class Units;
        };
        class ModuleDescription
        {
            class AnyBrain;
        };
    };
    class grad_boc_moduleDisable: Module_F
    {
        scope = 2;
        displayName = $STR_grad_boc_moduleDisable_disp;
        icon ="grad_boc\data\moduleDisable.paa";
        category = "grad_boc";
        function = "grad_boc_fnc_moduleDisable";
        functionPriority = 0;
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 0;
        is3DEN = 0;
        author = "DerZade";
        class Arguments : ArgumentsBaseUnits
        {

        };
        class ModuleDescription : ModuleDescription
        {
            description = $STR_grad_boc_moduleDisable_desc;
        };
    };
    class grad_boc_moduleAdd: Module_F
    {
        scope = 2;
        displayName = $STR_grad_boc_moduleAdd_disp;
        icon ="grad_boc\data\moduleAdd.paa";
        category = "grad_boc";
        function = "grad_boc_fnc_moduleAdd";
        functionPriority = 0;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 0;
        is3DEN = 0;
        author = "DerZade";
        class Arguments : ArgumentsBaseUnits
        {
            class Units: Units {};
            class classname
            {
                displayName = "Chestpack classname"; // Argument label
                description = "Classname of the disered chestpack"; // Tooltip description
                typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
                defaultValue = "B_Carryall_cbr";
            };
            class items
            {
                displayName = "Chestpack items";
                description = "Items (includes mags, weapons, ...) which should be contained in the chestpack. Items sperated by a ','. Item can either be just a classname (for a single) or an array [classname,amount].";
                typeName = "STRING";
                defaultValue = "[""FirstAidKit"",3], ""hgun_P07_F"", [""16Rnd_9x21_Mag"",2]";
            };
            class mags
            {
                displayName = "Chestpack magazines";
                description = "Just for adding partially loaded mags. Mags seperated by a ','. Syntax of single mag.: [magazine, ammo count]";
                typeName = "STRING";
                defaultValue = "[""30Rnd_65x39_caseless_mag"",20], [""30Rnd_65x39_caseless_mag_Tracer"",10]";
            };
            class code
            {
                displayName = "Additional code";
                description = "Any addition code to modify the chestpack. '_this' referes to the chestpack itself."; // Argument label
                typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
                defaultValue = "_this setObjectTextureGlobal [0, ""#(rgb,8,8,3)color(0,0,1,1)""];";
            };
        };
        class ModuleDescription : ModuleDescription
        {
            sync[]={"AnyPerson1","AnyPerson2"};
            description = $STR_grad_boc_moduleAdd_desc;
            class AnyPerson1
        {
            description = "Short description";
            displayName = "Any BLUFOR unit"; // Custom name
            icon = "iconMan"; // Custom icon (can be file path or CfgVehicleIcons entry)
            side = 1; // Custom side (will determine icon color)
        };
            class AnyPerson2 : AnyPerson1 {};
        };
    };
    class grad_boc_moduleOnChest: Module_F
    {
        scope = 2;
        displayName = $STR_grad_boc_moduleOnChest_disp;
        icon ="grad_boc\data\moduleOnChest.paa";
        category = "grad_boc";
        function = "grad_boc_fnc_moduleOnChest";
        functionPriority = 0;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 0;
        is3DEN = 0;
        author = "DerZade";
        class Arguments : ArgumentsBaseUnits
        {
            class Units: Units {};
            class classname
            {
                displayName = "Backpack classname"; // Argument label
                description = "Classname of the backpack which should be added after putting the backpack on chest."; // Tooltip description
                typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
                defaultValue = "B_Parachute";
            };
            class delay
            {
                displayName = "Delay"; // Argument label
                description = ""; // Tooltip description
                typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
                defaultValue = 0;
            };
        };
        class ModuleDescription : ModuleDescription
        {
            sync[]={"AnyPerson1","AnyPerson2"};
            description = $STR_grad_boc_moduleOnChest_desc;
            class AnyPerson1
            {
                description = "Short description";
                displayName = "Any BLUFOR unit"; // Custom name
                icon = "iconMan"; // Custom icon (can be file path or CfgVehicleIcons entry)
                side = 1; // Custom side (will determine icon color)
            };
            class AnyPerson2 : AnyPerson1 {};
        };
    };


    class zade_boc_moduleDisable: grad_boc_moduleDisable
    {
        scope = 1;
        function = "zade_boc_fnc_moduleDisable";
    }
    class zade_boc_moduleAdd: grad_boc_moduleAdd
    {
        scope = 1;
        function = "zade_boc_fnc_moduleDisable";
    }
    class zade_boc_moduleOnChest: grad_boc_moduleOnChest
    {
        scope = 1;
        function = "zade_boc_fnc_moduleDisable";
    }

    class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class ACE_Equipment {
                #include "ACE_SelfActions.hpp"
            };
        };
    };
};

class CfgFactionClasses
{
    class NO_CATEGORY;
    class grad_boc: NO_CATEGORY
    {
        displayName = "Gruppe Adler BackpackOnChest";
        priority = 2;
        side = 7;
    };
};
