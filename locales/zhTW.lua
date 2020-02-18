local L = LibStub("AceLocale-3.0"):NewLocale("WitchHunt", "zhTW")

if not L then return end

L["Witch Hunt"] = "Witch Hunt"
L["Witch Hunt Classic"] = "Witch Hunt Classic"
L["Simple spell alert."] = "簡單的施法警告"

L["Message Output"] = "訊息輸出"
L["Message Colors"] = "訊息顏色"
L["Message Filter"] = "訊息過濾"
L["Message Format"] = "訊息格式"
L["Spell Filter"] = "法術過濾"
L["Profiles"] = "設定檔"

L["You can control the basic behaviour of Witch Hunt using the toggles below."] = "你可以用下列選項來控制 Witch Hunt 的基本設定"
L["The options below affect the built in Witch Hunt message frame. To select messages sent to this frame select the Message Display option from the tree on the left."] = "下面的選項影響 Witch Hunt 內建的訊息框架。要選擇訊息發送方式須先從左邊的選單樹中選擇訊息輸出選項。"
L["Click the Test button to send a test message with your current settings."] = "點擊測試按鈕來發送你目前設定的測試訊息"
L["You can select where you want Witch Hunt messages displayed from this screen."] = "你可以選擇你希望 Witch Hunt 訊息顯示在何種框架"
L["You can select spells to be ignored in future messages from the list below. This list is automatically filled with currently filtered spells and spells you encountered during this session."] = "你可以從下列選擇以後要忽略的法術訊息。這清單是以你目前過濾的法術及此次你遭遇過的法術自動填入的。"
L["You can change the color for the various messages below."] = "你可以改變下列個別訊息的顏色"
L["You can select message types to ignore below."] = "你可以選擇忽略下列何種訊息類別"
L["You can change the format for the various messages below. |cffeda55f$c|r will be replaced by the caster. |cffeda55f$e|r will be replaced by the effect or spell. |cffeda55f$i|r will be replaced by the icon."] = "你可以在下面改變消息的格式。|cffeda55f$c|r將被替換為施法者，|cffeda55f$e|r將被替換為效果或技能。"

L["Combat Only"] = "只限戰鬥"
L["Toggle combat only mode."] = "切換只限戰鬥模式"

L["Target Only"] = "只限目標"
L["Toggle target only mode."] = "切換只限目標模式"

L["Learning Mode"] = "學習模式"
L["Learning mode, when enabled will fill the Spell Filter with spells Witch Hunt has detected. You can turn this off once you're satisfied with your filter."] = "開啟時將會填入偵測到的法術在法術過濾器。當你的過濾器設定完成，你可以關閉此選項。"

L["Icons"] = "技能圖示"
L["Add skill icons to the messages. Might not work in some message output targets."] = "在提示訊息中添加技能圖示。可能在一些輸出模式中無法使用。"

L["Lock"] = "鎖定"
L["Toggle locking of the WitchHunt frame."] = "切換鎖定 WitchHunt 框架"

L["Font"] = "字型"
L["Set the font for the display of messages in the Default frame."] = "設定預設框架的字型"

L["Time Visible"] = "可見時間"
L["Set the number of seconds messages should be visible for in the Default frame."] = "調整提示訊息的預設可見時間"

L["Fade Duration"] = "漸隱時間"
L["Set the fade duration for the Default frame."] = "調整預設漸隱時間"

L["Small"] = "小"
L["Normal"] = "正常"
L["Large"] = "大"
L["Huge"] = "極大"

L["Test"] = "測試"
L["Test with a dummy WitchHunt message."] = "測試 WitchHunt。"

L["Insert Mode"] = "插入模式"
L["Set the insert mode for the Default frame."] = "設定預設框架的插入模式"
L["Bottom"] = "底部"
L["Top"] = "頂部"

L["DRAG HERE"] = "在此拖動"

L["Totem"] = "圖騰"

L["Format"] = "格式"

-- format_* is used for the default formatting
L["format_cast"] = "$c 開始施放 $i$e"
L["format_spell"] = "$c 施放 $i$e"
L["format_totem"] = "$c 施放 $i$e"
L["format_gain"] = "$c 獲得 $i$e"
L["format_fade"] = "$c 的 $i$e 消失"
L["format_dispel"] = "$c 的 $i$e 被驅散"

L["Witch Hunt Aura"] = "提示增益法術"
L["Witch Hunt Totem"] = "提示圖騰"

L["Character"] = "角色"
L["Text"] = "字串"
L["Spell"] = "法術"
L["Aura"] = "光環"
