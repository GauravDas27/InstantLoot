class UIScreenListener_MCM_InstantLoot extends UIScreenListener;

`include(InstantLoot/Src/ModConfigMenuAPI/MCM_API_Includes.uci)
`include(InstantLoot/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci)

var localized string PageTitle;
var localized string GroupDefaultLabel;

var localized string DisablePopupLabel;
var localized string DisablePopupTooltip;
var localized string DisableSoldierAnimationLabel;
var localized string DisableSoldierAnimationTooltip;
var localized string DisableLootAnimationLabel;
var localized string DisableLootAnimationTooltip;

var Settings Settings;

event OnInit(UIScreen Screen)
{
	// Everything out here runs on every UIScreen. Not great but necessary.
	if (MCM_API(Screen) != none)
	{
		// Everything in here runs only when you need to touch MCM.
		`MCM_API_Register(Screen, ClientModCallback);
	}
}

simulated function ClientModCallback(MCM_API_Instance ConfigAPI, int GameMode)
{
	local MCM_API_SettingsPage Page;
	local MCM_API_SettingsGroup GroupDefault;

	LoadSettings();

	Page = ConfigAPI.NewSettingsPage(PageTitle);
	Page.SetPageTitle(PageTitle);
	Page.SetSaveHandler(SaveSettings);

	GroupDefault = Page.AddGroup('GroupDefault', GroupDefaultLabel);
	GroupDefault.AddCheckbox('DisablePopup', DisablePopupLabel, DisablePopupTooltip, Settings.IsPopupDisabled(), DisablePopupHandler);
	GroupDefault.AddCheckbox('DisableSoldierAnimation', DisableSoldierAnimationLabel, DisableSoldierAnimationTooltip, Settings.IsSoldierAnimationDisabled(), DisableSoldierAnimationHandler);
	GroupDefault.AddCheckbox('DisableLootAnimation', DisableLootAnimationLabel, DisableLootAnimationTooltip, Settings.IsLootAnimationDisabled(), DisableLootAnimationHandler);

	Page.ShowSettings();
}

function LoadSettings()
{
	Settings = new class'Settings';
}

simulated function SaveSettings(MCM_API_SettingsPage Page)
{
	Settings.Save();
}

simulated function DisablePopupHandler(MCM_API_Setting Setting, bool SettingValue)
{
	Settings.SetPopupDisabled(SettingValue);
}

simulated function DisableSoldierAnimationHandler(MCM_API_Setting Setting, bool SettingValue)
{
	Settings.SetSoldierAnimationDisabled(SettingValue);
}

simulated function DisableLootAnimationHandler(MCM_API_Setting Setting, bool SettingValue)
{
	Settings.SetLootAnimationDisabled(SettingValue);
}

defaultproperties
{
	ScreenClass = none;
}
