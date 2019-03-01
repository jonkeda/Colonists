local isLoadColi = false
function loadColi()
	if isLoadColi then
		return
	end
	isLoadColi = true

	if not coli then coli = {} end
	if not coli.ticks then coli.ticks = {} end
	if not coli.on_added then coli.on_added = {} end
	if not coli.on_changedPosition then coli.on_changedPosition = {} end
	if not coli.on_remove then coli.on_remove = {} end
	if not coli.on_adjust then coli.on_adjust = {} end
	if not coli.on_pick_up then coli.on_pick_up = {} end
	if not coli.on_entitydied then coli.on_entitydied = {} end
end

local isInitColi = false
function initColi()
	if isInitColi then
		return
	end
	isInitColi = true

	loadColi()

	if global ~= nil then

		if not global.coli then global.coli = {} end

	end
end