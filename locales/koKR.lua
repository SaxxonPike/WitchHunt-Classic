local L = LibStub("AceLocale-3.0"):NewLocale("WitchHunt", "koKR")

if not L then return end

L["Witch Hunt"] = "Witch Hunt"
L["Witch Hunt Classic"] = "Witch Hunt Classic"
L["Simple spell alert."] = "간단한 주문 경고입니다."

L["Message Output"] = "메세지 출력"
L["Message Colors"] = "메세지 색상"
L["Message Filter"] = "메세지 선별"
L["Message Format"] = "메세지 형식"
L["Spell Filter"] = "주문 선별"
L["Profiles"] = "프로필"

L["You can control the basic behaviour of Witch Hunt using the toggles below."] = "하단에 토글하여 Witch Hunt의 기본적인 작동을 제어할 수 있습니다."
L["The options below affect the built in Witch Hunt message frame. To select messages sent to this frame select the Message Display option from the tree on the left."] = "하단은 Witch Hunt의 메세지 프레임을 쌓아올리거나 내리는 것과 글꼴을 설정합니다. 선택한 메세지 설정을 표시하기 위하여 좌측 구조의 메세지 출력 옵션에서 표시 선택을 해야 합니다."
L["Click the Test button to send a test message with your current settings."] = "현재 설정의 테스트 메세지를 보려면 테스트 버튼을 클릭하세요."
L["You can select where you want Witch Hunt messages displayed from this screen."] = "Witch Hunt의 메세지를 어디 화면에 표시 할것인지 선택합니다."
L["You can select spells to be ignored in future messages from the list below. This list is automatically filled with currently filtered spells and spells you encountered during this session."] = "하단의 주문 목록에서 무시하기 위한 주문 메세지를 선택할수 있습니다. 습득 모드가 활성화 되었을시, 당신과 주위에 교전하는 주문&현재 필터된 주문과 함께 자동적으로 목록을 채웁니다."
L["You can change the color for the various messages below."] = "하단에서 각종 메세지를 위한 색을 변경할 수 있습니다."
L["You can select message types to ignore below."] = "하단에서 무시할 메세지 종류를 선택할 수 있습니다."
L["You can change the format for the various messages below. |cffeda55f$c|r will be replaced by the caster. |cffeda55f$e|r will be replaced by the effect or spell. |cffeda55f$i|r will be replaced by the icon."] = "하단에서 여러가지의 메세지의 형식을 변경할 수 있습니다. 시전자는 |cffeda55f$c|r로 대신합니다. 효과 또는 주문은  |cffeda55f$e|r로 대신합니다."

L["Combat Only"] = "전투에 한정"
L["Toggle combat only mode."] = "전투에 한정 모드를 전환 합니다."

L["Target Only"] = "대상에 한정"
L["Toggle target only mode."] = "대상에 한정 모드를 전환 합니다."

L["Players Only"] = "플레이어에 한정"
L["Toggle players only mode. This will only alert for player controlled characters."] = "플레이어에 한정 모드를 전환 합니다. 플레이어 케릭터만 경고합니다."

L["Learning Mode"] = "습득 모드"
L["Learning mode, when enabled will fill the Spell Filter with spells Witch Hunt has detected. You can turn this off once you're satisfied with your filter."] = "습득 모드에서는 활성화시, Witch Hunt가 찾아낸 주문으로 주문 선별 목록이 채워지게 됩니다. 이 선별 목록에 만족하지 않으면 이 옵션을 끌 수 있습니다."

L["Icons"] = "아이콘"
L["Add skill icons to the messages. Might not work in some message output targets."] = "메세지에 스킬 아이콘을 추가합니다. 대상의 일부 메세지에 출력이 되지 않을 수도 있습니다."

L["Lock"] = "고정"
L["Toggle locking of the WitchHunt frame."] = "WitchHunt 프레임 고정 기능을 전환 합니다"

L["Font"] = "글꼴"
L["Set the font for the display of messages in the Default frame."] = "기본 프레임에 표시할 메세지의 글꼴을 설정합니다"

L["Time Visible"] = "보이는 시간"
L["Set the number of seconds messages should be visible for in the Default frame."] = "기본 프레임에 메세지가 보여질 초수를 설정합니다."

L["Fade Duration"] = "사라지는 시간"
L["Set the fade duration for the Default frame."] = "기본 프레임에 사라지는 시간을 설정합니다."

L["Small"] = "작게"
L["Normal"] = "보통"
L["Large"] = "크게"
L["Huge"] = "매우 크게"

L["Test"] = "테스트"
L["Test with a dummy WitchHunt message."] = "몇개의 가짜 WitchHunt 메세지로 테스트를 합니다."

L["Insert Mode"] = "추가 모드"
L["Set the insert mode for the Default frame."] = "기본 프레임에 추가 모드를 설정합니다."
L["Bottom"] = "하단"
L["Top"] = "상단"

L["DRAG HERE"] = "여기를 끌면 됩니다."

L["Totem"] = "토템"

L["Format"] = "형식"

-- format_* is used for the default formatting
L["format_cast"] = "$c : $i$e 시전 시작"
L["format_spell"] = "$c : $i$e 시전"
L["format_totem"] = "$c : $i$e 시전"
L["format_gain"] = "$c : $i$e 획득"
L["format_fade"] = "$c : $i$e 사라짐"
L["format_dispel"] = "$c : $i$e 해제"

L["Witch Hunt Aura"] = "Witch Hunt 오라"
L["Witch Hunt Totem"] = "Witch Hunt 토템"

L["Character"] = "캐릭터"
L["Text"] = "문자"
L["Spell"] = "주문"
L["Aura"] = "오라"
