import karax/[karax, karaxdsl, vdom]

proc app: VNode =
  result = buildHtml(tdiv):
    h1:
      text "👑"

setRenderer app, "app"
