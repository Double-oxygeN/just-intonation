import karax/[karax, karaxdsl, vdom, kdom]
import ../utils/boxicons
from ../components/navbarelem import createNavbar
from ../components/footerelem import createFooter
from ../components/pitchlist import createPitchList
import ../models/stores except store

proc appBody(store: Store): VNode =
  result = buildHtml(main(class="container is-fullhd")):
    createPitchList(store.rootPitch[], store.additionalPitches)

    tdiv(class="level"):
      tdiv(class="level-item"):
        tdiv(class="field is-grouped is-grouped-centered is-align-items-center"):
          tdiv(class="control"):
            button(class="button is-medium is-success"):
              proc onclick =
                echo store.oneShot

              span(class="icon"):
                boxIcon("play")

          tdiv(class="control"):
            label(class="checkbox", title="1 ショット"):
              span(class="ckbx-style-12"):
                input(`type`="checkbox", id="one-shot"):
                  proc onchange(ev: Event; node: VNode) =
                    store.oneShot = not store.oneShot

                label(`for`="one-shot")

proc app*(store: Store): VNode =
  result = buildHtml(section(class="hero is-fullheight is-light")):
    tdiv(class="hero-head"):
      createNavbar()

    tdiv(class="hero-body"):
      appBody(store)

    tdiv(class="hero-foot"):
      createFooter()
