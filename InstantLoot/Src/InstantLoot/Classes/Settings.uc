class Settings extends Settings_Defaults config(InstantLoot);

function Save()
{
	default.DISABLE_POPUP = DISABLE_POPUP;
	default.DISABLE_SOLDIER_ANIMATION = DISABLE_SOLDIER_ANIMATION;
	default.DISABLE_LOOT_ANIMATION = DISABLE_LOOT_ANIMATION;

	StaticSaveConfig();
}

static function bool IsPopupDisabled()
{
	return default.DISABLE_POPUP;
}

static function bool IsSoldierAnimationDisabled()
{
	return default.DISABLE_SOLDIER_ANIMATION;
}

static function bool IsLootAnimationDisabled()
{
	return default.DISABLE_LOOT_ANIMATION;
}

function SetPopupDisabled(bool Disabled)
{
	DISABLE_POPUP = Disabled;
}

function SetSoldierAnimationDisabled(bool Disabled)
{
	DISABLE_SOLDIER_ANIMATION = Disabled;
}

function SetLootAnimationDisabled(bool Disabled)
{
	DISABLE_LOOT_ANIMATION = Disabled;
}
