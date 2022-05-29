from jsffi import require
import karax/vdom

discard require("boxicons")

type
  BoxIconType* {.pure.} = enum
    regular
    solid
    logo

template boxIcon*(name: string, iconType = BoxIconType.regular): VNode =
  const typeAttr = if iconType == BoxIconType.regular: "" else: "type='" & $iconType & "'"
  verbatim "<box-icon " & typeAttr & " name='" & name & "' color='currentColor' />"
