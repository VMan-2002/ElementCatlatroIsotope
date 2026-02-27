--	so uhhh yeah
--	this is catto isotopes!

local mod = SMODS.current_mod

--w: amount of items horizontally in the atlas
--o: order of isotopes within the atlas
elementcattos.isotopeSprites = {
	[1] = {
		w = 4,
		o = {2, 3, 4, 5, 6, 7, 8, 9}
	},
	[26] = {
		w = 1,
		o = {60}
	},
	[120] = {
		w = 1,
		o = {297}
	}
}

for k,v in pairs(elementcattos.isotopeSprites) do
	SMODS.Atlas({
		key = "iso" .. k,
		path = string.lower(SMODS.Centers[elementcattos.atomicnumber[k]].loc_txt.name) .. ".png",
		px = 71,
		py = 95
	})
end

elementcattos.applyIsotopeSprite = function(card, neutrons)
	local center = card.config.center
	if center and center.mod and center.original_mod.id == "ElementCatlatro" and center.atomic_number then
		local iso = elementcattos.isotopeSprites[center.atomic_number]
		if iso then
			local n = topuplib.getValueIndex(iso.o, neutrons)
			card.children.center.atlas = SMODS.Atlases[n and "ecattosi_iso"..center.atomic_number or center.atlas]
			card.children.center:set_sprite_pos(n and {x = n % iso.w, y = math.floor(n / iso.w)} or center.pos)
		end
	end
end