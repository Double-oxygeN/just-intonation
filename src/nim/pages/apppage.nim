import karax/[karaxdsl, vdom]
import ../utils/boxicons
from ../components/navbarelem import createNavbar
from ../components/footerelem import createFooter
from ../components/pitchlist import createPitchList

func appBody: VNode =
  result = buildHtml(main(class="container is-fullhd")):
    createPitchList()

    tdiv(class="level"):
      tdiv(class="level-item"):
        tdiv(class="field is-grouped is-grouped-centered is-align-items-center"):
          tdiv(class="control"):
            button(class="button is-medium is-success"):
              span(class="icon"):
                boxIcon("play")

          tdiv(class="control"):
            label(class="checkbox", title="1 ショット"):
              span(class="ckbx-style-12"):
                input(`type`="checkbox", id="one-shot")
                label(`for`="one-shot")

func app*: VNode =
  result = buildHtml(section(class="hero is-fullheight is-light")):
    tdiv(class="hero-head"):
      createNavbar()

    tdiv(class="hero-body"):
      appBody()

    tdiv(class="hero-foot"):
      createFooter()
