import karax/[karaxdsl, vdom]
import ../utils/boxicons
from ../components/navbarelem import navBar
from ../components/footerelem import createFooter

func app*: VNode =
  result = buildHtml(section(class="hero is-fullheight is-light")):
    tdiv(class="hero-head"):
      navBar()

    tdiv(class="hero-body"):
      main(class="container is-fullhd"):
        tdiv(class="columns is-centered is-vcentered"):
          tdiv(class="column is-2 is-invisible")

          for i in 0..<4:
            tdiv(class="column is-2"):
              tdiv(class="card"):
                tdiv(class="card-header"):
                  h2(class="card-header-title subtitle"):
                    if i == 0:
                      text "440 Hz"

                    else:
                      text "+" & $(i * 400) & " cent"

                tdiv(class="card-content"):
                  if i > 0:
                    tdiv(class="tabs is-small is-centered is-boxed"):
                      ul:
                        li(class="is-active"):
                          a(href="#"):
                            text "周波数比"

                        li:
                          a(href="#"):
                            text "平均律"

                    tdiv(class="field is-expanded"):
                      tdiv(class="field has-addons"):
                        tdiv(class="control"):
                          input(`type`="number", class="input", value=($i.succ(1)))

                        tdiv(class="control"):
                          button(class="button is-static"):
                            text " : "

                        tdiv(class="control"):
                          input(`type`="number", class="input", value=($i.succ(2)))

                    tdiv(class="level"):
                      tdiv(class="level-item"):
                        tdiv(class="field is-grouped is-grouped-centered"):
                          tdiv(class="control"):
                            button(class="button is-danger"):
                              span(class="icon"):
                                boxIcon("trash")

                          tdiv(class="control"):
                            button(class="button is-success"):
                              span(class="icon"):
                                boxIcon("play")

          tdiv(class="column is-2"):
            button(class="button is-fullwidth is-info is-medium is-outlined has-text-weight-bold is-size-3"):
              span(class="icon"):
                boxIcon("plus-circle", BoxIconType.solid)

        tdiv(class="level"):
          tdiv(class="level-item"):
            tdiv(class="field is-grouped is-grouped-centered is-align-items-center"):
              tdiv(class="control"):
                button(class="button is-medium is-success"):
                  span(class="icon"):
                    boxIcon("play")

              tdiv(class="control"):
                label(class="checkbox"):
                  input(`type`="checkbox")
                  text " 1 ショット"

    tdiv(class="hero-foot"):
      createFooter()
