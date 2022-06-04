import karax/[vdom, karaxdsl]
from ../utils/boxicons import boxIcon, BoxIconType

func createInvisiblePitchItem*: VNode =
  result = buildHtml(tdiv(class="card is-invisible"))

func createRootPitchItem*: VNode =
  result = buildHtml(tdiv(class="card")):
    tdiv(class="card-header"):
      h2(class="card-header-title subtitle"):
        text "440 Hz"

    tdiv(class="card-content"):
      tdiv(class="level"):
        tdiv(class="level-item"):
          tdiv(class="control"):
            button(class="button is-success"):
              span(class="icon"):
                boxIcon("play")

func createAdditionalPitchItem*(i: int): VNode =
  result = buildHtml(tdiv(class="card")):
    tdiv(class="card-header"):
      h2(class="card-header-title subtitle"):
        text "+" & $(i * 400) & " cent"

    tdiv(class="card-content"):
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

