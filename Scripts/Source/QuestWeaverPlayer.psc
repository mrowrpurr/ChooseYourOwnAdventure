scriptName QuestWeaverPlayer extends Actor

event OnInit()
  Debug.Notification("Quest Weaver initialized")
  ListenForKeys()
endEvent

event OnPlayerLoadGame()
  Debug.Notification("Quest Weaver loaded")
  ListenForKeys()
endEvent

function ListenForKeys()
  UnregisterForAllKeys()
  RegisterForKey(197) ; Pause
endFunction

event OnKeyDown(int a_key)
  if a_key == 197 ; Pause
    Actor crosshairActor = Game.GetCurrentCrosshairRef() as Actor
    if crosshairActor
      Debug.MessageBox("Crosshair actor: " + crosshairActor.GetActorBase().GetName())
    endIf
  endIf
endEvent
