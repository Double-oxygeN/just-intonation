import karax/[karax, vdom, karaxdsl]
from pitchitems import createInvisiblePitchItem, createRootPitchItem, createAdditionalPitchItem
from addpitchbuttonelem import createAddPitchButton
import ../models/stores except store

proc createPitchList*(rootPitch: var float; additionalPitches: var seq[AdditionalPitch]): VNode =
  result = buildHtml(tdiv(class="columns is-centered is-vcentered is-desktop")):
    tdiv(class="column is-2-desktop"):
      createInvisiblePitchItem()

    tdiv(class="column is-2-desktop"):
      createRootPitchItem(rootPitch)

    for pitch in mitems(additionalPitches):
      tdiv(class="column is-2-desktop", index=pitch.idx):
        createAdditionalPitchItem(pitch, additionalPitches)

    tdiv(class="column is-2-desktop"):
      createAddPitchButton(additionalPitches)
