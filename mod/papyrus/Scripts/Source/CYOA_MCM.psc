scriptName CYOA_MCM extends SKI_ConfigBase

event OnConfigInit()
  ModName = "Choose Your Own Adventure"

  Pages = new string[1]
  Pages[0] = "Settings"
endEvent

event OnPageReset(string page)
  if page == "Settings"
    AddHeaderOption("Choose Your Own Adventure")
  endIf
endEvent
