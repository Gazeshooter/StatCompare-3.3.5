function StatCompare_CountSelectedTalents()
	local tree = { 0, 0, 0 }

	for tabIndex = 1, GetNumTalentTabs() do
		local selectedTalents = 0

		for talentIndex = 1, GetNumTalents(tabIndex) do
			local _, _, _, _, rank = GetTalentInfo(tabIndex, talentIndex)
			selectedTalents = selectedTalents + (rank or 0)
		end

		tree[tabIndex] = selectedTalents
	end

	return tree
end

function StatCompare_GetTalentSynopsis()
	local synopsis = ""

	for _, count in ipairs(StatCompare_CountSelectedTalents()) do
		if synopsis ~= "" then
			synopsis = synopsis.."/"..count
		else
			synopsis = tostring(count)
		end
	end

	return synopsis
end

function StatCompare_GetMainTalentSpecName()
	local selectedTalents = StatCompare_CountSelectedTalents()
	local highestPoints = -1
	local highestTab = 1

	for tabIndex, points in ipairs(selectedTalents) do
		if points > highestPoints then
			highestPoints = points
			highestTab = tabIndex
		end
	end

	local specName = GetTalentTabInfo(highestTab)
	return specName or ""
end

function StatCompare_GetTalentSpecToolTipText()
	local synopsis = StatCompare_GetTalentSynopsis()
	local specName = StatCompare_GetMainTalentSpecName()
	local displayText = synopsis

	if specName ~= "" then
		displayText = specName.." ("..synopsis..")"
	end

	return GREEN_FONT_COLOR_CODE
		.."\n\n"
		..STATCOMPARE_TALENT_SPECIALIZATION
		..":"
		..FONT_COLOR_CODE_CLOSE
		.."\n"
		..STATCOMPARE_TEXT_INDENT1
		..displayText
end
