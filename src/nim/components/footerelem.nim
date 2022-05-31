import karax/[vdom, karaxdsl]
from ../utils/boxicons import boxIcon, BoxIconType

func createFooter*: VNode =
  result = buildHtml(footer(class="section")):
    tdiv(class="content is-small has-text-centered"):
      p:
        span(class="icon-text"):
          text "© 2022 Double-oxygeN "
          a(href="https://github.com/Double-oxygeN/just-intonation", class="has-text-weight-semibold"):
            span(class="icon"):
              boxIcon("github", BoxIconType.logo)
