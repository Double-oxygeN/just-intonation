import karax/[vdom, karaxdsl]

func createNavbar*: VNode =
  result = buildHtml(nav(class="navbar has-shadow")):
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
