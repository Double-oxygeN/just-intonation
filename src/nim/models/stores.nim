type
  PitchKind* {.pure.} = enum
    intRatio
    equalTemperament

  AdditionalPitch* = tuple
    idx: int
    kind: PitchKind
    rootRate, thisRate: Positive # rootRate : thisRate
    step: Natural
    tones: Positive # 1 : 2^(step / tones)

  Store* = ref object
    rootPitch*: ref float
    additionalPitches*: seq[AdditionalPitch]
    oneShot*: bool

let store* = Store(
  rootPitch: (var v = new(ref float); v[] = 440.0; v),
  additionalPitches: @[],
  oneShot: off
)

proc generateIndex: int =
  var ctr {.global.} = 0
  result = ctr
  inc ctr

proc initPitch*: AdditionalPitch =
  result = (idx: generateIndex(), kind: PitchKind.intRatio, rootRate: 1.Positive, thisRate: 1.Positive,
    step: 0.Natural, tones: 12.Positive)
