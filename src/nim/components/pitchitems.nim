import std/strformat
import karax/[karax, vdom, karaxdsl]
from ../utils/boxicons import boxIcon, BoxIconType
import ../models/stores except store
from sequtils import mapIt

func createInvisiblePitchItem*: VNode =
  result = buildHtml(tdiv(class="card is-invisible"))

func createRootPitchItem*(rootPitch: var float): VNode =
  result = buildHtml(tdiv(class="card")):
    tdiv(class="card-header"):
      h2(class="card-header-title subtitle"):
        text fmt"{rootPitch:.3f} Hz"

    tdiv(class="card-content"):
      tdiv(class="level"):
        tdiv(class="level-item"):
          tdiv(class="control"):
            button(class="button is-success"):
              span(class="icon"):
                boxIcon("play")

proc createAdditionalPitchItem*(pitch: var AdditionalPitch; pitches: var seq[AdditionalPitch]): VNode =
  result = buildHtml(tdiv(class="card")):
    tdiv(class="card-header"):
      h2(class="card-header-title subtitle"):
        text "+400 cent"

    tdiv(class="card-content"):
      tdiv(class="tabs is-small is-centered is-boxed"):
        ul:
          li(class=(if pitch.kind == PitchKind.intRatio: "is-active" else: "")):
            a(href="#"):
              proc onclick =
                pitch.kind = PitchKind.intRatio

              text "周波数比"

          li(class=(if pitch.kind == PitchKind.equalTemperament: "is-active" else: "")):
            a(href="#"):
              proc onclick =
                pitch.kind = PitchKind.equalTemperament

              text "平均律"

      tdiv(class="field is-expanded"):
        tdiv(class="field has-addons"):
          tdiv(class="control"):
            input(`type`="number", class="input", value=($pitch.rootRate))

          tdiv(class="control"):
            button(class="button is-static"):
              text " : "

          tdiv(class="control"):
            input(`type`="number", class="input", value=($pitch.thisRate))

      tdiv(class="level"):
        tdiv(class="level-item"):
          tdiv(class="field is-grouped is-grouped-centered"):
            tdiv(class="control"):
              button(class="button is-danger"):
                proc onclick =
                  echo pitches.mapIt(it == pitch)
                  pitches.delete(pitches.find(pitch))

                span(class="icon"):
                  boxIcon("trash")

            tdiv(class="control"):
              button(class="button is-success"):
                span(class="icon"):
                  boxIcon("play")
