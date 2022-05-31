import karax/[karaxdsl, vdom]
import ../utils/boxicons

func app*: VNode =
  result = buildHtml(section(class="hero is-fullheight is-light")):
    tdiv(class="hero-head"):
      nav(class="navbar has-shadow"):
        tdiv(class="navbar-brand"):
          h1(class="navbar-item title has-text-left"):
            text "純正律和音の実験台"

        tdiv(class="navbar-menu"):
          tdiv(class="navbar-end"):
            tdiv(class="navbar-item has-dropdown is-hoverable"):
              a(href="#", class="navbar-link"):
                text "メニュー"

              tdiv(class="navbar-dropdown is-right"):
                a(href="#", class="navbar-item"):
                  text "説明"

                a(href="#", class="navbar-item"):
                  text "設定"

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
      footer(class="section"):
        tdiv(class="content is-small has-text-centered"):
          p:
            span(class="icon-text"):
              text "© 2022 Double-oxygeN "
              a(href="https://github.com/Double-oxygeN/just-intonation", class="has-text-weight-semibold"):
                span(class="icon"):
                  boxIcon("github", BoxIconType.logo)
