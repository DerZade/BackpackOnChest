#define REDIRECT_PATH "\zade_boc\functions\zade_boc\fn_redirectFunction.sqf"

class CfgFunctions
{
	class zade_boc
	{
		tag = "zade_boc";
		class zade_boc
		{
			class actionOnBack{file=REDIRECT_PATH};
			class actionOnChest{file=REDIRECT_PATH};
			class actionSwap{file=REDIRECT_PATH};
			class addChestpack{file=REDIRECT_PATH};
			class addItemToChestpack{file=REDIRECT_PATH};
			class addMagToChestpack{file=REDIRECT_PATH};
			class canAddItemToChestpack{file=REDIRECT_PATH};
			class chestpack{file=REDIRECT_PATH};
			class chestpackContainer{file=REDIRECT_PATH};
			class chestpackItems{file=REDIRECT_PATH};
			class chestpackMagazines{file=REDIRECT_PATH};
			class clearAllItemsFromChestpack{file=REDIRECT_PATH};
			class loadChestpack{file=REDIRECT_PATH};
			class removeChestpack{file=REDIRECT_PATH};
			class removeItemFromChestpack{file=REDIRECT_PATH};
			class removeMagFromChestpack{file=REDIRECT_PATH};
			
			class moduleAdd{file=REDIRECT_PATH};
			class moduleOnChest{file=REDIRECT_PATH};
			class moduleDisable{file=REDIRECT_PATH};
		};
	};
	class grad_boc
	{
		tag = "grad_boc";
		class commands
		{
			file = "\zade_boc\functions\commands";
			class actionOnBack{};
			class actionOnChest{};
			class actionSwap{};
			class addChestpack{};
			class addItemToChestpack{};
			class addMagToChestpack{};
			class addWeaponToChestpack{};
			class canAddItemToChestpack{};
			class chestpack{};
			class chestpackContainer{};
			class chestpackItems{};
			class chestpackMagazines{};
			class clearAllItemsFromChestpack{};
			class chestpackLoadout{};
			class loadChestpack{};
			class removeChestpack{};
			class removeItemFromChestpack{};
			class removeMagFromChestpack{};
			class removeWeaponFromChestpack{};
			class setChestpackLoadout{};
		};
		class utility
		{
			file = "\zade_boc\functions\utility";
			class EHAnimDone{};
			class EHGetIn{};
			class EHGetOut{};
			class EHHandleDisconnect{};
			class EHKilled{};
			class modifyItemAmount{};
			class moduleAdd{};
			class moduleOnChest{};
			class moduleDisable{};
		};
		class arsenal
		{
			file = "\zade_boc\functions\arsenal";
			class arsenalOpened{};
			class arsenal_onButtonClick{};
			class arsenal_updateUI{};
			class arsenal_postInit{postInit = 1;};
		};
	};
};
