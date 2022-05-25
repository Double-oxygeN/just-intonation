import karax/[karaxdsl, vdom]

func app*: VNode =
  result = buildHtml(tdiv):
    h1:
      text "👑"
