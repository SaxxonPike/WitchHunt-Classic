------------------------------
--      Are you local?      --
------------------------------

local times = {}
local L = LibStub("AceLocale-3.0"):GetLocale("WitchHunt")
local db
local frame, sizehandle, msgframe, sizetexture, dragtext
local learned = {} -- contains learned spellIDs for filtering purposes
local formats = {}
local InSanctuary

-- local upvales
local fmt = string.format
local bitband = bit.band
local gsb = string.gsub

local function rgb2hex( r, g, b )
	return fmt("|cff%02x%02x%02x", r*255, g*255, b*255)
end

local WH_F_SPELL = "format_spell"
local WH_F_CAST = "format_cast"
local WH_F_TOTEM = "format_totem"
local WH_F_DISPEL = "format_dispel"
local WH_F_GAIN = "format_gain"
local WH_F_FADE = "format_fade"

local doomID = 42521

---------------------------------
--      Addon Declaration      --
---------------------------------

WitchHunt = LibStub("AceAddon-3.0"):NewAddon("WitchHunt", "AceEvent-3.0", "AceConsole-3.0", "LibSink-2.0")
local WitchHunt = WitchHunt

local defaults = {
	profile = {
		icons = true,
		combatonly = false,
		targetonly = false,
		font = "normal",
		lock = true,
		insertmode = "TOP",
		timevisible = 1,
		fadeduration = .5,		
		sinkOptions = {
			sink20OutputSink = "Witch"
		},
		width = 200,
		height = 160,
		learn = true,
		filtered = {},
		mfiltered = {
			format_spell = true,
		},
		colors = {
			format_cast = {
				text = { r =1, g = 1, b = 0 },
				["*"] = { r = 1, g = 1, b = 1 },
			},
			format_spell = {
				text = { r = 1, g = 0, b = 1 },
				["*"] = { r =1, g = 1, b = 1 },
			},
			format_totem = {
				text = { r = 0, g = 1, b = 0 },
				["*"] = { r =1, g = 1, b = 1 },
			},
			format_gain = {
				text = { r = 0, g = 1, b = 1 },
				["*"] = { r =1, g = 1, b = 1 },
			},
			format_fade = {
				text = { r = 0, g = 0, b = 1 },
				["*"] = { r =1, g = 1, b = 1 },
			},
			format_dispel = {
				text = { r = 1, g = 0, b = 0 },
				["*"] = { r =1, g = 1, b = 1 },
			},
		},
		formats = {
			format_cast = L["format_cast"],
			format_spell = L["format_spell"],
			format_gain = L["format_gain"],
			format_fade = L["format_fade"],
			format_dispel = L["format_dispel"],
			format_totem = L["format_totem"],
		},
		
	}
}

local function giveColorGroup( messageformat, caster, effect, icon, spellType, order, target )
	local t = {
		type = "group", inline = true, order = order,
		name = "",
		args = {
			title = {
				type = "header",
				name = function() return WitchHunt:GetFormatted( messageformat, caster, effect, icon, target) end,
				order = 0,
			},
			character = {
				type = "color",
				name = L["Character"],
				width = "half",
				order = 1,
			},
			text = {
				type = "color",
				name = L["Text"],
				width = "half",
				order = 2,
			},
			spell = {
				type = "color",
				name = spellType,
				width = "half",
				order = 3,
			},
		},
	}
	return t
end

local function giveColors()
	local colors = {
		type = "group",
		name = L["Message Colors"],
		get = function( info )
			local key = info[#info]
			local pkey = info[#info-1]
			return db.colors[pkey][key].r, db.colors[pkey][key].g, db.colors[pkey][key].b, db.colors[pkey][key].a 
		end,
		set = function( info, r, g, b, a )
			local key = info[#info]
			local pkey = info[#info-1]
			db.colors[pkey][key].r = r
			db.colors[pkey][key].g = g
			db.colors[pkey][key].b = b
			db.colors[pkey][key].a = a
			WitchHunt:BuildFormat(pkey, db.formats[pkey])
		end,		
		args = {
			title = {
				type = "description", order = 0,
				name = L["You can change the color for the various messages below."],
			},
		},
	}
	colors.args.format_cast = giveColorGroup("format_cast", "Ammo", L["Witch Hunt"], doomID, L["Spell"], 1)
	colors.args.format_spell = giveColorGroup("format_spell", "Ammo", L["Witch Hunt"], doomID, L["Spell"], 2)
	colors.args.format_totem = giveColorGroup("format_totem", "Ammo", L["Witch Hunt Totem"], doomID, L["Totem"], 3)
	colors.args.format_gain = giveColorGroup("format_gain", "Ammo", L["Witch Hunt Aura"], doomID, L["Aura"], 4)
	colors.args.format_fade = giveColorGroup("format_fade", "Ammo", L["Witch Hunt Aura"], doomID, L["Aura"], 5)
	colors.args.format_dispel = giveColorGroup("format_dispel", "Ammo", L["Witch Hunt Aura"], doomID, L["Aura"], 6)
	return colors
end

local function giveFormatGroup( messageformat, caster, effect, icon, order, target )
	local t = {
		type = "group", inline = true, order = order,
		name = "",
		args = {
			title = {
				type = "header",
				name = function() return WitchHunt:GetFormatted( messageformat, caster, effect, icon, target) end,
				order = 0,
			},
			text = {
				type = "input",
				name = "",
				width = "full",
				order = 1,
			},
		},
	}
	return t
end

local function giveFormats()
	local formats = {
		type = "group",
		name = L["Message Format"],
		get = function( info ) 
			return db.formats[info[#info-1]]
		end,
		set = function( info, v)
			local key  = info[#info-1]
			db.formats[key] = v
			WitchHunt:BuildFormat(key, v)
		end,
		args = {
			title = {
				type = "description", order = 0,
				name = L["You can change the format for the various messages below. |cffeda55f$c|r will be replaced by the caster. |cffeda55f$e|r will be replaced by the effect or spell. |cffeda55f$i|r will be replaced by the icon."],
			},
		},
	}
	formats.args.format_cast = giveFormatGroup("format_cast", "Ammo", L["Witch Hunt"], doomID, 1)
	formats.args.format_spell = giveFormatGroup("format_spell", "Ammo", L["Witch Hunt"], doomID,  2)
	formats.args.format_totem = giveFormatGroup("format_totem", "Ammo", L["Witch Hunt Totem"], doomID, 3)
	formats.args.format_gain = giveFormatGroup("format_gain", "Ammo", L["Witch Hunt Aura"], doomID, 4)
	formats.args.format_fade = giveFormatGroup("format_fade", "Ammo", L["Witch Hunt Aura"], doomID, 5)
	formats.args.format_dispel = giveFormatGroup("format_dispel", "Ammo", L["Witch Hunt Aura"], doomID, 6)	
	return formats
end

local function giveOptions()
	local options = {
		type = "group",
		name = L["Witch Hunt Classic"],
		desc = L["Simple spell alert."],
		get = function( k ) return db[k.arg] end,
		set = function( k, v )
			db[k.arg] = v
			if k.arg == "lock" or k.arg == "font" or k.arg == "insertmode" then
				WitchHunt:UpdateDisplay()
			end
		end,	
		args = {
			descoggle = {
				type = "description", order = 5,
				name = L["You can control the basic behaviour of Witch Hunt using the toggles below."],
			},
			combatonly = {
				name = L["Combat Only"], type = "toggle",
				desc = L["Toggle combat only mode."],
				arg = "combatonly",
				order = 10,
			},
			targetonly = {
				name = L["Target Only"], type = "toggle",
				desc = L["Toggle target only mode."],
				arg = "targetonly",
				order = 20,
			},
			playeronly = {
				name = L["Players Only"], type = "toggle",
				desc = L["Toggle players only mode. This will only alert for player controlled characters."],
				arg = "playeronly",
				order = 25,
			},
			learn = {
				name = L["Learning Mode"], type = "toggle",
				desc = L["Learning mode, when enabled will fill the Spell Filter with spells Witch Hunt has detected. You can turn this off once you're satisfied with your filter."],
				arg = "learn",
				order = 30,
			},
			icons = {
				name = L["Icons"], type = "toggle",
				desc = L["Add skill icons to the messages. Might not work in some message output targets."],
				arg = "icons",
				order = 31,
			},
			descframe = {
				name = L["The options below affect the built in Witch Hunt message frame. To select messages sent to this frame select the Message Display option from the tree on the left."],
				type = "description",
				order = 40,
			},
			insertmode = {
				name = L["Insert Mode"], type = "select",
				desc = L["Set the insert mode for the Default frame."],
				values = { TOP = L["Top"], BOTTOM = L["Bottom"]},
				arg = "insertmode",
				order = 60,
			},
			font = {
				name = L["Font"], type = "select",
				desc = L["Set the font for the display of messages in the Default frame."],
				values = {small = L["Small"], normal = L["Normal"], large = L["Large"], huge = L["Huge"]},
				arg = "font",
				order = 70,
			},
			timevisible = {
				name = L["Time Visible"], type = "range",
				desc = L["Set the number of seconds messages should be visible for in the Default frame."],
				min = .1,
				max = 10,
				step = .1,
				arg = "timevisible",
				order = 71,
			},
			fadeduration = {
				name = L["Fade Duration"], type = "range",
				desc = L["Set the fade duration for the Default frame."],
				min = 0,
				max = 2,
				step = .1,
				arg = "fadeduration",
				order = 72,
			},	
			lock = {
				name = L["Lock"], type = "toggle",
				desc = L["Toggle locking of the WitchHunt frame."],
				arg = "lock",
				order = 80,
			},
			desctest = {
				name = L["Click the Test button to send a test message with your current settings."], 
				type = "description",
				order = 90,
			},
			test = {
				name = L["Test"], type = "execute",
				desc = L["Test with a dummy WitchHunt message."],
				func = function()
					WitchHunt:SendMessage("WitchHunt_Message", WitchHunt:GetFormatted("format_cast", "Ammo", L["Witch Hunt"], doomID, "Saxxon"))
					WitchHunt:SendMessage("WitchHunt_Message", WitchHunt:GetFormatted("format_gain", "Ammo", L["Witch Hunt Aura"], doomID, nil))
				end,
				order= 100,
			}
		}	
	}
	return options
end

local function giveOutput()
	local output = {
		name = L["Message Output"],
		type = "group",
		args ={
			desc = {
				type = "description",
				name = L["You can select where you want Witch Hunt messages displayed from this screen."],
				order = 0,
			},
			sink = WitchHunt:GetSinkAce3OptionsDataTable(),
		}
	}
	-- haxy tricks to make this look good
	output.args.sink.order = 1
	output.args.sink.inline = true
	output.args.sink.name = ""
	return output
end

local filter -- local to the file to access it if needed
local filterArgs
local function giveOneFilter(spellID)
	if not filter then return end
	local name, _, icon = GetSpellInfo(spellID)
	local rank = GetSpellSubtext(spellId)
	-- if rank and rank ~= "" then rank = "("..rank..")" else rank = "" end
	filterArgs["s"..spellID] = {
		order = spellID,
		name = fmt("%s %s", name, rank),
		desc = fmt("spellID %d", spellID),
		icon = icon,
		type = "toggle",
		arg = spellID,
	}
end

local function giveFilter()
	filter = {
		name = L["Spell Filter"],
		type = "group",
		args = {
			filterdesc = {
				order = 0,
				type = "description",
				name = L["You can select spells to be ignored in future messages from the list below. This list is automatically filled with currently filtered spells and spells you encountered during this session."],
			},
			filters = {
				order = 1, type = "group", name = "", inline = true,
				get = function( k ) return db.filtered[k.arg] end,
				set = function( k, v ) db.filtered[k.arg] = v and v or nil end, -- do not set to false, we cleanup this way since nil values are actually removed
				args = {},
			},
		},
	}
	-- make sure we learn all filtered spells.
	for k, v in pairs(db.filtered) do
		learned[k] = true
	end
	-- fill filter args
	filterArgs = filter.args.filters.args
	for k, v in pairs( learned ) do
		giveOneFilter(k)
	end
	return filter
end

local function giveMFilter()
	local filter = {
		name = L["Message Filter"],
		type = "group",
		args = {
			filterdesc = {
				order = 0,
				type = "description",
				name = L["You can select message types to ignore below."],
			},
			filters = {
				order = 1, type = "group", name = "", inline = true,
				get = function( k ) return db.mfiltered[k.arg] end,
				set = function( k, v ) db.mfiltered[k.arg] = v end,
				args = {},
			},
		},
	}
	for k, v in pairs(db.formats) do
		filter.args.filters.args[k] = {
			type = "toggle",
			name = function()
				if k == "format_totem" then
					return WitchHunt:GetFormatted(k, "Ammo", L["Witch Hunt Totem"], doomID, nil)
                elseif k == "format_gain" or k == "format_fade" then
                    return WitchHunt:GetFormatted(k, "Ammo", L["Witch Hunt"], doomID, nil)
				else
					return WitchHunt:GetFormatted(k, "Ammo", L["Witch Hunt"], doomID, "Saxxon")
				end
			end,
			arg = k,
			width = "full",
		}
	end
	return filter
end

local function giveProfiles()
	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(WitchHunt.db)
	return profiles
end

------------------------------
--      Initialization      --
------------------------------

function WitchHunt:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("WitchHuntClassicDB", defaults, "Default")
	db = self.db.profile

	self:BuildFormats()
	
	self.db.RegisterCallback(self, "OnProfileChanged", "UpdateProfile")
	self.db.RegisterCallback(self, "OnProfileCopied", "UpdateProfile")
	self.db.RegisterCallback(self, "OnProfileReset", "UpdateProfile")	
	
	self:SetSinkStorage(self.db.profile.sinkOptions)
	self:RegisterSink("Witch", L["Witch Hunt"], nil, "WHFramePrint")

	local acreg = LibStub("AceConfigRegistry-3.0")
	
	acreg:RegisterOptionsTable("Witch Hunt Classic", giveOptions)
	acreg:RegisterOptionsTable("Witch Hunt Output", giveOutput)
	acreg:RegisterOptionsTable("Witch Hunt Filter", giveFilter)
	acreg:RegisterOptionsTable("Witch Hunt Profiles", giveProfiles)
	acreg:RegisterOptionsTable("Witch Hunt Colors", giveColors)
	acreg:RegisterOptionsTable("Witch Hunt MFilter", giveMFilter)
	acreg:RegisterOptionsTable("Witch Hunt Format", giveFormats)
	
	local acdia = LibStub("AceConfigDialog-3.0")
	
	local f = acdia:AddToBlizOptions("Witch Hunt Classic", L["Witch Hunt Classic"])

	acdia:AddToBlizOptions("Witch Hunt Colors", L["Message Colors"], L["Witch Hunt Classic"])
	acdia:AddToBlizOptions("Witch Hunt Format", L["Message Format"], L["Witch Hunt Classic"])
	acdia:AddToBlizOptions("Witch Hunt Output", L["Message Output"], L["Witch Hunt Classic"])
	acdia:AddToBlizOptions("Witch Hunt MFilter", L["Message Filter"], L["Witch Hunt Classic"])
	acdia:AddToBlizOptions("Witch Hunt Filter", L["Spell Filter"], L["Witch Hunt Classic"])
	acdia:AddToBlizOptions("Witch Hunt Profiles", L["Profiles"], L["Witch Hunt Classic"])

	self:RegisterChatCommand("witchhunt", function() InterfaceOptionsFrame_OpenToCategory(f) end)
	self:RegisterChatCommand("wh", function() InterfaceOptionsFrame_OpenToCategory(f) end)

end

function WitchHunt:OnEnable()
	-- Register our own events
	self:RegisterMessage("WitchHunt_Message")
	-- Register the WoW events
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("ZONE_CHANGED")
	self:RegisterEvent("ZONE_CHANGED_INDOORS", "ZONE_CHANGED")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ZONE_CHANGED")

	-- update pvp status
	self:ZONE_CHANGED()
	
	-- unlocked frame should be visible
	if not db.lock then self:UpdateDisplay() end
end

local iconformat = "|T%s::|t"
local noicon = ""
function WitchHunt:GetFormatted( format, caster, effect, spellID, target )
	if not formats[format] then self:BuildFormat(format) end
	if not target then target = L["Nobody"] end
	
	local icon,name,rank
	if db.icons then
		name,_,icon = GetSpellInfo(spellID)
		rank = GetSpellSubtext(spellID)
		if icon then icon = fmt(iconformat, icon) end
	end
	return gsb( gsb( gsb( gsb( formats[format], "$c", caster), "$e", effect), "$i", icon or noicon), "$t", target)
end

function WitchHunt:BuildFormats()
	for k, v in pairs(db.formats) do
		self:BuildFormat(k, v)
	end
end

function WitchHunt:BuildFormat( format, t )
	t = rgb2hex(db.colors[format].text.r, db.colors[format].text.g, db.colors[format].text.b) .. t .. "|r"
	t = gsb(t, "$t", "|r" .. rgb2hex(db.colors[format].character.r, db.colors[format].character.g, db.colors[format].character.b) .."$t|r" .. rgb2hex(db.colors[format].text.r, db.colors[format].text.g, db.colors[format].text.b) )
	t = gsb(t, "$c", "|r" .. rgb2hex(db.colors[format].character.r, db.colors[format].character.g, db.colors[format].character.b) .."$c|r" .. rgb2hex(db.colors[format].text.r, db.colors[format].text.g, db.colors[format].text.b) )
	t = gsb(t, "$e", "|r" .. rgb2hex(db.colors[format].spell.r, db.colors[format].spell.g, db.colors[format].spell.b) .."$e|r" .. rgb2hex(db.colors[format].text.r, db.colors[format].text.g, db.colors[format].text.b) )
	formats[format] = t
end

function WitchHunt:UpdateProfile()
	db = self.db.profile
	-- make sure we learn all filtered spells.
	for k, v in pairs(db.filtered) do
		learned[k] = true
	end
	self:UpdateDisplay()
	self:RestorePosition()
	self:BuildFormats()
end

function WitchHunt:UpdateDisplay()
	if not msgframe then self:SetupFrames() end
	frame:SetWidth(db.width)
	frame:SetHeight(db.height)
	self:UpdateLock()
	self:SetFont()
	msgframe:SetInsertMode(db.insertmode)
	msgframe:SetTimeVisible(db.timevisible)
	msgframe:SetFadeDuration(db.fadeduration)		
end

function WitchHunt:SetFont()
	if not msgframe then self:SetupFrames() end
	if db.font == "huge" then
		msgframe:SetFontObject(GameFontNormalHuge)
	elseif db.font == "small" then
		msgframe:SetFontObject(GameFontNormalSmall)
	elseif db.font == "large" then
		msgframe:SetFontObject(GameFontNormalLarge)
	else
		msgframe:SetFontObject(GameFontNormal)
	end
end

local function sizeMouseDown()
	frame.isResizing = true
	frame:StartSizing("BOTTOMRIGHT")
end

local function sizeMouseUp()
	frame:StopMovingOrSizing()
	WitchHunt:SaveSize()
	frame.isResizing = false
end

function WitchHunt:SaveSize()
	if not frame.isResizing then return end -- don't do anything on frame creation
	
	db.width = frame:GetWidth()
	db.height = frame:GetHeight()
	
end

function WitchHunt:SetupFrames()
	if frame then return end
	
	frame = CreateFrame("Frame", nil, UIParent)
	frame:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background"})
	frame:SetFrameStrata("BACKGROUND")
	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	frame:SetBackdropColor(0,1,0)
	frame:SetWidth(db.width)
	frame:SetHeight(db.height)
	frame:Show()
	frame:SetScript("OnDragStart", function() frame:StartMoving() end)
	frame:SetScript("OnDragStop", function()
		frame:StopMovingOrSizing()
		self:SavePosition()
	end)
	frame:SetClampedToScreen(true)
	frame:SetMinResize(50,20)
	
	sizehandle = CreateFrame("Frame", nil, frame)
	sizehandle:Show()
	sizehandle:SetFrameLevel(frame:GetFrameLevel() + 10) -- place this above everything
	sizehandle:SetWidth(16)
	sizehandle:SetHeight(16)
	sizehandle:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 1)
	sizehandle:EnableMouse(true)
	
	sizehandle:SetScript("OnMouseDown", sizeMouseDown)
	sizehandle:SetScript("OnMouseUp", sizeMouseUp)

	sizetexture = sizehandle:CreateTexture(nil,"BACKGROUND")
	sizetexture:SetTexture("Interface\\AddOns\\WitchHunt\\resize")
	sizetexture:SetWidth(16)
	sizetexture:SetHeight(16)
	sizetexture:SetBlendMode("ADD")
	sizetexture:SetPoint("CENTER", sizehandle, "CENTER", 0, 0)
	sizetexture:Show()

	dragtext = frame:CreateFontString(nil,"OVERLAY")
	dragtext:SetFont(GameFontNormal:GetFont())
	dragtext:SetPoint("CENTER", frame, "CENTER")
	dragtext:SetJustifyH("CENTER")
	dragtext:SetJustifyV("MIDDLE")
	dragtext:SetText(L["Witch Hunt"])
	dragtext:Show()
	
	msgframe = CreateFrame("MessageFrame", nil, frame)
	msgframe:ClearAllPoints()
	msgframe:SetAllPoints(frame)
	msgframe:Show()
	msgframe:SetInsertMode(db.insertmode)
	msgframe:SetFrameStrata("HIGH")
	msgframe:SetToplevel(true)
	msgframe:SetTimeVisible(db.timevisible)
	msgframe:SetFadeDuration(db.fadeduration)	
	
	self:UpdateLock()
	self:SetFont()

	self:RestorePosition()
	
end


function WitchHunt:UpdateLock()
	if db.lock then
		frame:RegisterForDrag()
		frame:EnableMouse(false)
		frame:SetMovable(false)
		frame:SetResizable(false)
		sizehandle:EnableMouse(false)
		frame:SetBackdropColor(0,1,0,0)
		sizetexture:Hide()
		dragtext:Hide()
	else
		frame:RegisterForDrag("LeftButton")
		frame:SetBackdropColor(0,1,0,1)
		frame:SetMovable(true)
		frame:EnableMouse(true)
		frame:SetResizable(true)
		sizehandle:EnableMouse(true)
		sizetexture:Show()
		dragtext:Show()
	end
end


function WitchHunt:SavePosition()
	if not frame then return end

	if not db.pos then db.pos = {} end
	
	local pos = db.pos
	
	local point, parent, relPoint, x, y = frame:GetPoint()
	local s = frame:GetEffectiveScale()
	x, y = x*s, y*s
	pos.x, pos.y = x, y
	pos.point, pos.relPoint = point, relPoint
end

function WitchHunt:RestorePosition()
	if not frame then return end
	if not db.pos then return end

	local pos = db.pos

	local x, y, s = pos.x, pos.y, frame:GetEffectiveScale()
	local point, relPoint = pos.point, pos.relPoint
	x, y = x/s, y/s
	frame:ClearAllPoints()
	frame:SetPoint(point, UIParent, relPoint, x, y)

end

-- Burn the witch!
function WitchHunt:Burn(format, caster, effect, spellID, target)
	if not caster or not effect then return end
	if spellID and db.filtered[spellID] then return end
	if format and db.mfiltered[format] then return end
	
	if spellID and db.learn and not learned[spellID] then
		learned[spellID] = true
		giveOneFilter(spellID)
	end

	local text = self:GetFormatted(format, caster, effect, spellID, target)

	local t = GetTime()
	if ( not times[text] ) or ( times[text] and (times[text] + 3) <= t ) then
		times[text] = t
		self:SendMessage("WitchHunt_Message", text)
	end
end

-- Our Sink interface
function WitchHunt:WHFramePrint(addon, message, r, g, b, _, _, _, _, _, icon)
	if not msgframe then self:SetupFrames() end
	if icon then message = fmt(iconformat, icon) .. message end
	msgframe:AddMessage(message, r, g, b, 1, UIERRORS_HOLD_TIME)
end

-- event handlers
function WitchHunt:WitchHunt_Message(event, msg)
	if not msg then return end
	self:Pour(msg, 1, 1, 1, nil, nil, nil, nil, nil, nil)
end

function WitchHunt:ZONE_CHANGED()
	local zonePVPType = GetZonePVPInfo()
	InSanctuary = zonePVPType == "sanctuary" and true or false
end

function WitchHunt:COMBAT_LOG_EVENT_UNFILTERED(...)
	local timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, spellID, spellName, spellSchool, eID, eName = CombatLogGetCurrentEventInfo()
	
	if InSanctuary then return end
	if db.combatonly and not UnitAffectingCombat("player") then return end
	
	local isSourceEnemy = (bitband(srcFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE)
	local isDestEnemy = (bitband(dstFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE)

	if db.targetonly  then
		local isSourceTarget = (bitband(srcFlags, COMBATLOG_OBJECT_TARGET) == COMBATLOG_OBJECT_TARGET)
		local isDestTarget = (bitband(dstFlags, COMBATLOG_OBJECT_TARGET) == COMBATLOG_OBJECT_TARGET)
		-- evil but it'll make sure it bails out afterwards :)
		if isSourceEnemy and not isSourceTarget then isSourceEnemy = false end
		if isDestEnemy and not isDestTarget then isDestEnemy = false end
	end
	
	if db.playeronly then
		local isSourcePC = (bitband(srcFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER)
		local isDestPC = (bitband(dstFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER)
		if isSourceEnemy and not isSourcePC then isSourceEnemy = false end
		if isDestEnemy and not isDestPC then isDestEnemy = false end
	end
	
	if not isDestEnemy and not isSourceEnemy then return end

	if eventType == "SPELL_AURA_APPLIED" and isDestEnemy and eID == "BUFF" then
		self:Burn( WH_F_GAIN, dstName, spellName, spellID, nil )
	elseif eventType == "SPELL_AURA_REMOVED" and isDestEnemy and eID == "BUFF" then
		self:Burn( WH_F_FADE, dstName, spellName, spellID, nil )
	elseif isDestEnemy and (eventType == "SPELL_AURA_DISPELLED" or eventType == "SPELL_DISPEL" or eventType == "SPELL_AURA_STOLEN") then
		self:Burn( WH_F_DISPEL, dstName, eName, eID, nil )
	elseif eventType == "SPELL_CAST_START" and isSourceEnemy then
		self:Burn( WH_F_CAST, srcName, spellName, spellID, dstName )
    elseif eventType == "SPELL_CAST_SUCCESS" and isSourceEnemy then
		if spellName:find(L["Totem"]) then
			self:Burn( WH_F_TOTEM, srcName, spellName, spellID, nil )
		else
			self:Burn( WH_F_SPELL, srcName, spellName, spellID, dstName )
		end
	end
end

