function init()
    m.background = m.top.findNode("background")
    m.label = m.top.findNode("label")

    m.top.observeField("text", "onTextChanged")
    m.top.observeField("hasFocus", "onFocusChanged")
end function

function onTextChanged()
    m.label.text = m.top.text
end function

function onFocusChanged()
    if m.top.hasFocus()
        m.background.color = "0xA0A0A0FF" ' Lighter grey for focus
    else
        m.background.color = "0x808080FF" ' Original grey
    end if
end function

function onKeyEvent(key as string, press as boolean) as boolean
  if press then
    if key = "OK"
      print "Button Clicked"
      m.top.buttonSelected = true
      return true
    end if
  end if
  return false
end function
