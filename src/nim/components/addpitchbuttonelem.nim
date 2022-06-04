import karax/[vdom, karaxdsl]
from karax/karax import toDisabled
from ../utils/boxicons import boxIcon, BoxIconType

func createAddPitchButton*(disabled: bool): VNode =
  result = buildHtml(button(class="button is-fullwidth is-info is-medium is-outlined has-text-weight-bold is-size-3", disabled=toDisabled(disabled))):
    span(class="icon"):
      boxIcon("plus-circle", BoxIconType.solid)
