import karax/[karax, vdom, karaxdsl]
from ../utils/boxicons import boxIcon, BoxIconType
import ../models/stores except store

const maxChordPitchCount = 4

proc createAddPitchButton*(additionalPitches: var seq[AdditionalPitch]): VNode =
  let disabled = additionalPitches.len >= pred(maxChordPitchCount)
  result = buildHtml(button(class="button is-fullwidth is-info is-medium is-outlined has-text-weight-bold is-size-3", disabled=toDisabled(disabled))):
    proc onclick =
      additionalPitches.add(initPitch())

    span(class="icon"):
      boxIcon("plus-circle", BoxIconType.solid)
