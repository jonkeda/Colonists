local isSetupColi = false

function setupColi()
	if isSetupColi then
		return
	end
	isSetupColi = true

	if not coli then coli = {} end
	if not coli.ticks then coli.ticks = {} end
	if not coli.on_added then coli.on_added = {} end
	if not coli.on_remove then coli.on_remove = {} end
	if not coli.on_adjust then coli.on_adjust = {} end
	if not coli.on_pick_up then coli.on_pick_up = {} end
	if not coli.on_entitydied then coli.on_entitydied = {} end

	if global ~= nil then

		if not global.coli then global.coli = {} end
		if not global.coli.fishing_inserters then global.coli.fishing_inserters = {} end
		if not global.players then global.players = {} end
		if not global.force then global.force = {} end
		if not global.coli.players then global.coli.players = {} end
		if not global.coli.days then global.coli.days = 0 end
		if not global.coli.jobs then global.coli.jobs = 0 end
		if not global.coli.housing then global.coli.housing = 0 end

		if not global.coli.totalWasteLastPeriod then global.coli.totalWasteLastPeriod = 0 end
		if not global.coli.totalFoodLastPeriod then global.coli.totalFoodLastPeriod = 0 end

		if not global.coli.foodneeded then global.coli.foodneeded = 0 end
		if not global.coli.foodeaten then global.coli.foodeaten = 0 end
		if not global.coli.hungerstate then global.coli.hungerstate = 5 end

	end
end
