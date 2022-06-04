import karax/[vdom, karaxdsl]
from pitchitems import createInvisiblePitchItem, createRootPitchItem, createAdditionalPitchItem
from addpitchbuttonelem import createAddPitchButton

func createPitchList*: VNode =
  result = buildHtml(tdiv(class="columns is-centered is-vcentered")):
    tdiv(class="column is-2"):
      createInvisiblePitchItem()

    tdiv(class="column is-2"):
      createRootPitchItem()

    for i in 1..<4:
      tdiv(class="column is-2"):
        createAdditionalPitchItem(i)

    tdiv(class="column is-2"):
      createAddPitchButton(false)

