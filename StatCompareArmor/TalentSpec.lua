local function StatCompare_GetTalentGroup_335(isInspect)
	if GetActiveTalentGroup then
		return GetActiveTalentGroup(isInspect, false) or 1
	end

	return 1
end

function StatCompare_CountSelectedTalents(isInspect)
	local tree = { 0, 0, 0 }
	local talentGroup = StatCompare_GetTalentGroup_335(isInspect)
	local numTabs = GetNumTalentTabs(isInspect, false) or 0

	for tabIndex = 1, numTabs do
		local _, _, pointsSpent =
			GetTalentTabInfo(tabIndex, isInspect, false, talentGroup)

		tree[tabIndex] = pointsSpent or 0
	end

	return tree
end

function StatCompare_GetTalentSynopsis(isInspect)
	local synopsis = ""

	for _, count in ipairs(StatCompare_CountSelectedTalents(isInspect)) do
		if synopsis ~= "" then
			synopsis = synopsis.."/"..count
		else
			synopsis = tostring(count)
		end
	end

	return synopsis
end

function StatCompare_GetMainTalentSpecName(isInspect)
	local selectedTalents = StatCompare_CountSelectedTalents(isInspect)
	local talentGroup = StatCompare_GetTalentGroup_335(isInspect)
	local highestPoints = -1
	local highestTab = 1

	for tabIndex, points in ipairs(selectedTalents) do
		if points > highestPoints then
			highestPoints = points
			highestTab = tabIndex
		end
	end

	local specName = GetTalentTabInfo(highestTab, isInspect, false, talentGroup)
	return specName or ""
end

function StatCompare_GetTalentSpecToolTipText(isInspect)
	local selectedTalents = StatCompare_CountSelectedTalents(isInspect)
	local totalPoints = 0

	for _, count in ipairs(selectedTalents) do
		totalPoints = totalPoints + count
	end

	-- Inspected talents arrive asynchronously. Hide the target talent section
	-- until the server has returned a meaningful result.
	if isInspect and totalPoints == 0 then
		return ""
	end

	local synopsis = StatCompare_GetTalentSynopsis(isInspect)
	local specName = StatCompare_GetMainTalentSpecName(isInspect)
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
