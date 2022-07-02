import karax/[karax, vdom]
from nim/pages/apppage import app
from nim/models/stores import store

proc init(data: RouterData): VNode =
  result = app(store)

setRenderer init, "app"
