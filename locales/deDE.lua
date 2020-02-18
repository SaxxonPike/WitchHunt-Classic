
local L = LibStub("AceLocale-3.0"):NewLocale("WitchHunt", "deDE")

if not L then return end

L["Witch Hunt"] = "Witch Hunt"
L["Witch Hunt Classic"] = "Witch Hunt Classic"
L["Simple spell alert."] = "Simpler Zauberalarm"

L["Message Output"] = "Nachrichten Ausgabe"
L["Message Colors"] = "Nachrichten Farbe"
L["Message Filter"] = "Nachrichten Filter"
L["Message Format"] = "Nachrichten Formatierung"
L["Spell Filter"] = "Zauber Filter"
L["Profiles"] = "Profile"

L["You can control the basic behaviour of Witch Hunt using the toggles below."] = "Du kannst das Verhalten von Witch Hunt durch die Optionen unten justieren."
L["The options below affect the built in Witch Hunt message frame. To select messages sent to this frame select the Message Display option from the tree on the left."] = "Die Optionen hier drunter beinflussen das Witch Hunt eigene Nachrichten Fenster. Damit die Nachrichten in diesem erscheinen must du es im Menü links unter Nachrichten Ausgabe erst auswählen."
L["Click the Test button to send a test message with your current settings."] = "Klick auf die Test Taste um eine Test Nachricht mit den gegenwärtigen Einstellungen anzeigen zu lassen."
L["You can select where you want Witch Hunt messages displayed from this screen."] = "Du kannst unten auswählen wo deine Witch Hunt Nachrichten angezeigt werden sollen."
L["You can select spells to be ignored in future messages from the list below. This list is automatically filled with currently filtered spells and spells you encountered during this session."] = "Du kannst unten auswählen welche Zauber in Nachrichten Ignoriert werden sollen. Diese Liste wird automatisch generiert und erweitert mit Zaubern auf die du triffst in dieser Sitzung."
L["You can change the color for the various messages below."] = "Du kannst die Farben für die verschiedenen Nachrichten unten einstellen."
L["You can select message types to ignore below."] = "Du kannst unten Nachrichtentypen auswählen die ignoriert werden sollen."
L["You can change the format for the various messages below. |cffeda55f$c|r will be replaced by the caster. |cffeda55f$e|r will be replaced by the effect or spell. |cffeda55f$i|r will be replaced by the icon."] = "Du kannst die Formatierung für die verschiedenen Nachrichten unten einstellen.  |cffeda55f$c|r wird durch den Zaubernden ersetzt. |cffeda55f$e|r wird durch den Effekt oder Zauber ersetzt. |cffeda55f$i|r wird durch das Symbol des Zaubers oder Effekts ersetzt."

L["Combat Only"] = "Nur im Kampf"
L["Toggle combat only mode."] = "Aktiviert das Anzeigen nur im Kampf."

L["Target Only"] = "Nur bei Ziel"
L["Toggle target only mode."] = "Aktiviert das Anzeigen nur vom Ziel."

L["Learning Mode"] = "Lernen Modus"
L["Learning mode, when enabled will fill the Spell Filter with spells Witch Hunt has detected. You can turn this off once you're satisfied with your filter."] = "Der Lernen Modus wird wenn aktiviert den Zauber Filter füllen mit Zaubern die Witch Hunt bemerkt. Du kannst dies deaktivieren wenn du zufrieden bist mit deinem Zauber Filter."

L["Icons"] = "Symbole"
L["Add skill icons to the messages. Might not work in some message output targets."] = "Fügt die Symbole von Effekten und Zaubern den Nachrichten hinzu. Dies kann mit manchen Nachrichten Ausgabe Fenstern inkompatibel sein."

L["Lock"] = "Sperren"
L["Toggle locking of the WitchHunt frame."] = "Sperrt das Witch Hunt Fenster gegen verschieben."

L["Font"] = "Schriftart"
L["Set the font for the display of messages in the Default frame."] = "Justiere die Schriftart der Nachrichten im Anzeigefenster."

L["Time Visible"] = "Sichtbare Zeit"
L["Set the number of seconds messages should be visible for in the Default frame."] = "Justiere die Zeit in Sekunden in der eine Nachricht im Witch Hunt eigenen Fenster sichtbar bleibt."

L["Fade Duration"] = "Ausblenden Zeit"
L["Set the fade duration for the Default frame."] = "Justiere die Zeit bis das Witch Hunt eigenen Fenster automatisch ausgeblendet wird."

L["Small"] = "Klein"
L["Normal"] = "Normal"
L["Large"] = "Groß"
L["Huge"] = "Riesig"

L["Test"] = "Test"
L["Test with a dummy WitchHunt message."] = "Test mit einer Probe WichtHunt Nachrichten."

L["Insert Mode"] = "Einfügen Methode"
L["Set the insert mode for the Default frame."] = "Justiere die einfügen Methode für das Anzeige Fenster."
L["Bottom"] = "Unten"
L["Top"] = "Oben"

L["DRAG HERE"] = "HIER BEWEGEN"

L["Totem"] = "Totem"
L["Nobody"] = "Nobody"

L["Format"] = "Formatierung"

-- format_* is used for the default formatting
L["format_cast"] = "$c beginnt $i$e zu wirken"
L["format_spell"] = "$c wirkt $i$e"
L["format_totem"] = "$c wirkt $i$e"
L["format_gain"] = "$c erhält $i$e"
L["format_fade"] = "$i$e schwindet von $c"
L["format_dispel"] = "$i$e entfernt von $c"

L["Witch Hunt Aura"] = "Witch Hunt Buff"
L["Witch Hunt Totem"] = "Witch Hunt Totem"

L["Character"] = "Spieler"
L["Text"] = "Text"
L["Spell"] = "Zauber"
L["Aura"] = "Buff"
