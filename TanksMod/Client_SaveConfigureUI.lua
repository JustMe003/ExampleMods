require("DataConverter");

function Client_SaveConfigureUI(alert)
    local cost = costInputField.GetValue();
    if cost < 1 then alert("Cost to buy a tank must be positive"); end
    Mod.Settings.CostToBuyTank = cost;

    local power = powerInputField.GetValue();
    if power < 1 then alert("Tank must have at least one power"); end
    Mod.Settings.TankPower = power;

    local maxTanks = maxTanksField.GetValue();
    if maxTanks < 1 or maxTanks > 5 then alert("Max tanks must be between 1 and 5"); end
    Mod.Settings.MaxTanks = maxTanks;

    -- Always set the ModData field after the player clicks the [Save] button
    -- Since the text contains 2 variables (cost and max units) which can be changed
    -- This way we avoid using more resources (all unit descriptions will point to the same string / table)
    Mod.Settings.ModData = dataToString({
		UnitDescription = "This is a Tank unit. It is worth {{AttackPower}} armies and has to be killed in one, single blow.\n\nThis unit can be bought in the purchase menu, this is the same place where you build cities. It can be bought for " .. Mod.Settings.CostToBuyTank .. " gold.\n\nA player can have a maximum of " .. Mod.Settings.MaxTanks .. " Tank units, if you have reached the cap or are above it, you cannot buy anymore Tank units"
	});
    print(Mod.Settings.ModData);
end
