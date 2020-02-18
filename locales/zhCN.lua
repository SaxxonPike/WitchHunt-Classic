local L = LibStub("AceLocale-3.0"):NewLocale("WitchHunt", "zhCN")

if not L then return end

L["Witch Hunt"] = "Witch Hunt"
L["Simple spell alert."] = "简单施法预警"

L["Message Output"] = "消息输出"
L["Message Colors"] = "消息颜色"
L["Message Filter"] = "消息过滤器"
L["Message Format"] = "消息格式"
L["Spell Filter"] = "技能过滤器"
L["Profiles"] = "配置文件"

L["You can control the basic behaviour of Witch Hunt using the toggles below."] = "你可以使用下面的选项控制 Witch Hunt 的基本喜好设置。"
L["The options below affect the built in Witch Hunt message frame. To select messages sent to this frame select the Message Display option from the tree on the left."] = "下面的选项影响构建在 Witch Hunt 内的消息框架。在左侧树上选择想要显示消息的框架，选择 消息显示 选项。"
L["Click the Test button to send a test message with your current settings."] = "点击 测试 按钮使用当前设置发送一个测试消息。"
L["You can select where you want Witch Hunt messages displayed from this screen."] = "你可以选择想显示 Witch Hunt 消息的位置。"
L["You can select spells to be ignored in future messages from the list below. This list is automatically filled with currently filtered spells and spells you encountered during this session."] = "你可以在下面的列表中选择将被忽略的技能。这个列表是使用当前已经过滤的技能和你在这次登录中遇到的技能自动填充的。"
L["You can change the color for the various messages below."] = "你可以在下面改变消息的颜色。"
L["You can select message types to ignore below."] = "你可以在下面选择忽略的消息类型。"
L["You can change the format for the various messages below. |cffeda55f$c|r will be replaced by the caster. |cffeda55f$e|r will be replaced by the effect or spell. |cffeda55f$i|r will be replaced by the icon."] = "你可以在下面改变消息的格式。|cffeda55f$c|r将被替换为施法者，|cffeda55f$e|r将被替换为效果或技能。"

L["Combat Only"] = "仅战斗状态"
L["Toggle combat only mode."] = "选择是否仅仅在战斗状态下才显示。"

L["Target Only"] = "仅目标"
L["Toggle target only mode."] = "选择是否仅显示目标的施法预警"

L["Learning Mode"] = "学习模式"
L["Learning mode, when enabled will fill the Spell Filter with spells Witch Hunt has detected. You can turn this off once you're satisfied with your filter."] = "学习模式，当启用的时候将使用 Witch Hunt 发现的技能自动填充技能过滤器。你可以在你对过滤器满意的时候关闭它。"

L["Icons"] = "技能图标"
L["Add skill icons to the messages. Might not work in some message output targets."] = "在提示信息中添加技能图标. 可能在一些输出模式中不可用."

L["Lock"] = "锁定"
L["Toggle locking of the WitchHunt frame."] = "选择是否锁定 WitchHunt 窗体"

L["Font"] = "字体"
L["Set the font for the display of messages in the Default frame."] = "设置显示在默认框架中的消息的字体。"

L["Time Visible"] = "可见时间"
L["Set the number of seconds messages should be visible for in the Default frame."] = "设置提示信息的默认可见时间."

L["Fade Duration"] = "渐隐时间"
L["Set the fade duration for the Default frame."] = "设置默认渐隐时间."

L["Small"] = "小"
L["Normal"] = "中"
L["Large"] = "大"
L["Huge"] = "很大"

L["Test"] = "测试"
L["Test with a dummy WitchHunt message."] = "测试 WitchHunt 消息"

L["Insert Mode"] = "插入模式"
L["Set the insert mode for the Default frame."] = "设置默认框架的插入模式"
L["Bottom"] = "下"
L["Top"] = "上"

L["DRAG HERE"] = "点击拖曳"

L["Totem"] = "图腾"

L["Format"] = "格式"

-- format_* is used for the default formatting
L["format_cast"] = "$c 开始施放 $i$e"
L["format_spell"] = "$c 施放 $i$e"
L["format_totem"] = "$c 施放 $i$e"
L["format_gain"] = "$c 获得 $i$e"
L["format_fade"] = "$c 的 $i$e 消失"
L["format_dispel"] = "$c 的 $i$e 被驱散 "

L["Witch Hunt Aura"] = "提示增益法术"
L["Witch Hunt Totem"] = "提示图腾"

L["Character"] = "人物"
L["Text"] = "文本"
L["Spell"] = "技能"
L["Aura"] = "光环"
