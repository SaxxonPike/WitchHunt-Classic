
local L = LibStub("AceLocale-3.0"):NewLocale("WitchHunt", "enUS", true)

if not L then return end

L["Witch Hunt"] = true
L["Witch Hunt Classic"] = true
L["Simple spell alert."] = true

L["Message Output"] = true
L["Message Colors"] = true
L["Message Filter"] = true
L["Message Format"] = true
L["Spell Filter"] = true
L["Profiles"] = true

L["You can control the basic behaviour of Witch Hunt using the toggles below."] = true
L["The options below affect the built in Witch Hunt message frame. To select messages sent to this frame select the Message Display option from the tree on the left."] = true
L["Click the Test button to send a test message with your current settings."] = true
L["You can select where you want Witch Hunt messages displayed from this screen."] = true
L["You can select spells to be ignored in future messages from the list below. This list is automatically filled with currently filtered spells and spells you encountered during this session."] = true
L["You can change the color for the various messages below."] = true
L["You can select message types to ignore below."] = true
L["You can change the format for the various messages below. |cffeda55f$c|r will be replaced by the caster. |cffeda55f$e|r will be replaced by the effect or spell. |cffeda55f$i|r will be replaced by the icon."] = true

L["Combat Only"] = true
L["Toggle combat only mode."] = true

L["Target Only"] = true
L["Toggle target only mode."] = true

L["Players Only"] = true
L["Toggle players only mode. This will only alert for player controlled characters."] = true

L["Learning Mode"] = true
L["Learning mode, when enabled will fill the Spell Filter with spells Witch Hunt has detected. You can turn this off once you're satisfied with your filter."] = true

L["Icons"] = true
L["Add skill icons to the messages. Might not work in some message output targets."] = true

L["Lock"] = true
L["Toggle locking of the WitchHunt frame."] = true

L["Font"] = true
L["Set the font for the display of messages in the Default frame."] = true

L["Time Visible"] = true
L["Set the number of seconds messages should be visible for in the Default frame."] = true

L["Fade Duration"] = true
L["Set the fade duration for the Default frame."] = true

L["Small"] = true
L["Normal"] = true
L["Large"] = true
L["Huge"] = true

L["Test"] = true
L["Test with a dummy WitchHunt message."] = true

L["Insert Mode"] = true
L["Set the insert mode for the Default frame."] = true
L["Bottom"] = true
L["Top"] = true

L["DRAG HERE"] = true

L["Totem"] = true
L["Nobody"] = true

L["Format"] = true

-- format_* is used for the default formatting
L["format_cast"] = "$c begins to cast $i$e"
L["format_spell"] = "$c casts $i$e"
L["format_totem"] = "$c casts $i$e"
L["format_gain"] = "$c gains $i$e"
L["format_fade"] = "$i$e fades from $c"
L["format_dispel"] = "$i$e dispelled from $c"

L["Witch Hunt Aura"] = true
L["Witch Hunt Totem"] = true

L["Character"] = true
L["Text"] = true
L["Spell"] = true
L["Aura"] = true
