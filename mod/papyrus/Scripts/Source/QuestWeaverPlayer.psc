scriptName QuestWeaverPlayer extends Actor

int PUSH_TO_TALK_KEY = 211 ; Delete
int TEXTBOX_OPEN_KEY = 210 ; Insert

event OnInit()
  Debug.Notification("Choose Your Own Adventure initialized")
  ListenForKeys()
endEvent

event OnPlayerLoadGame()
  Debug.Notification("Choose Your Own Adventure loaded")
  ListenForKeys()
endEvent

function ListenForKeys()
  UnregisterForAllKeys()
  RegisterForKey(PUSH_TO_TALK_KEY)
  RegisterForKey(TEXTBOX_OPEN_KEY)
endFunction

event OnKeyDown(int keyCode)
  if keyCode == TEXTBOX_OPEN_KEY
    Actor crosshairActor = Game.GetCurrentCrosshairRef() as Actor
    if crosshairActor
      OpenTextBoxPrompt()
    endIf
  endIf
endEvent

string function OpenTextBoxPrompt()
  UIExtensions.InitMenu("UITextEntryMenu")
  UIExtensions.OpenMenu("UITextEntryMenu")
  string result = UIExtensions.GetMenuResultString("UITextEntryMenu")
  Debug.Notification("Result: " + result)
  return result
endFunction
