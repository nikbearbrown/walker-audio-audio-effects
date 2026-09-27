# Frictional

2026-09-19 22:46UTC: Prepared source copy while earlier demo captures remain
externally blocked. Read README, full controller and config. Preserved notices,
asset credits and original files; renamed project only. No import, playback,
input checks or films yet. No visible window opened. Earlier items not retired.

2026-09-19 23:17UTC: Headless Godot4.7.2 editor import session83527 completed
exit0. Bounded120-frame headless runtime also exits0 without warnings. This
checks loading and idle startup/shutdown only: no buttons pressed, no heard
audio or effect output verified. Next normal-input bus wiring diagnostics.

2026-09-19 23:49UTC: test_bus_input.gd clicks the actual Amplify checkbutton
using viewport-local mouse press/release events. Bus effect0 changes state and
returns to its original state on the second click. EFFECT_COUNT18; both
assertions true, exit0 without warnings. No direct handler or bus setter calls
in the test. This proves wiring only, not audible amplification or other effects.

2026-09-20 00:20UTC: Expanded mouse-input probe across all18 effect checkbuttons
and their corresponding bus indices. Every toggle and restore assertion passes,
EFFECTS_PASSED18/18, exit0 without warnings. Actual processing sound remains
unverified; an enabled flag is not an audible dry/wet comparison.

2026-09-20 00:52UTC: All seven actual sound buttons clicked by mouse events
activate their corresponding AudioStreamPlayers; music toggle starts and stops
its player. EFFECTS18/18, SOUNDS7/7, MUSIC_START/STOP true; exit0 cleanly.
Sound players are explicitly stopped between tests as diagnostic cleanup, not
claimed user behavior.200ms audio drain precedes scene cleanup. Headless Dummy
audio playback state is not evidence of audible quality or recorded sound.

2026-09-20 01:23UTC: Read complete saved bus layout and prepared CAPTURE-PLAN.md.
It preserves actual processed stereo audio, fixed-gain dry/wet comparisons,
effect tails and source attribution. Flat/default EQ settings must not be
described as audible changes without evidence. No new capture or film yet.

2026-09-20 01:55UTC: test_eq_defaults.gd inspected actual loaded EQ6/EQ10/EQ21
resources: all37 band gains are0dB, FLAT_EQS3/3, exit0 clean. Nothing changed.
Narration should explain that enabling these flat EQs does not demonstrate a
deliberate tonal adjustment. An altered-gain demonstration would require an
explicitly labelled adaptation; do not silently pretend it is the source demo.
