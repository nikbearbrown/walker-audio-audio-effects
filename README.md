# Walker Audio Effects

**What this is.** A separate local adaptation of Godot's `audio/audio_effects` demo, kept in Walker as a tech demo (not a game): music and seven sound buttons, plus 18 effect toggles on the Master bus. Only the project title changed.

**Why it is in Walker.** It is the source for two planned Liam films that demonstrate Godot's audio effects with real engine audio and matched dry/wet examples. Both films remain pending.

**What was found and verified.** Headless Godot 4.7.2 import and a bounded idle run exit cleanly. Mouse-input probes show all 18 effect toggles change and restore their bus flags, all seven sound buttons start their players, and the music toggle starts and stops its player. The three EQ effects (EQ6, EQ10, EQ21) load with every band at 0 dB, so enabling them is not a tonal change. These are state checks on the Dummy audio driver: audible results and capture have not been verified. See FRICTIONAL.md and CAPTURE-PLAN.md.

## How to run

Open `godot/project.godot` in Godot 4.7 and run the main scene (`audio_effects.tscn`).

Controls (mouse):

- **Music** toggle: start or stop the background music.
- **Ding, Glass, Meow, Beeps, Trombone, Static, Whistle**: play one sound.
- **18 effect toggles** (Amplify through StereoEnhance): enable or disable that effect on the Master bus. Effects apply to everything that plays.

The project defines no custom input actions.

## Design

- [GDD.md](GDD.md): recovered game design document. It describes what the code does, tagged `[OBSERVED]`, `[INFERRED]` or `[MISSING]`. It is a recovered, unapproved description, not an approved design; no design gate is signed.
- [design/DECK.html](design/DECK.html): slide deck of the recovered GDD.
- [design/IMPLEMENTATION-MAP.md](design/IMPLEMENTATION-MAP.md): every feature mapped to its scene, script and line.
- [design/decisions.md](design/decisions.md): open questions, starting with what this copy is for and who it is for.

## Source & license

Upstream MIT notice (Godot Engine contributors) is preserved in LICENSE.md. Asset exceptions and their original links are preserved in `godot/README.md`: music is **Monkeys Spinning Monkeys — Kevin MacLeod (incompetech.com), CC BY 3.0**; the listed Freesound effects and the equalizer icon are CC0. Include the music attribution in any film using it; do not treat the code license as a replacement for asset attribution.

## Status

- Both Liam films remain pending. Demonstrations must preserve real engine audio, use matched dry/wet examples and leave narration gaps so the effects can be heard.
- Audible results and capture are not verified; the capture plan in CAPTURE-PLAN.md has not been recorded.
- Repository: https://github.com/nikbearbrown/walker-audio-audio-effects
- No film publication performed.
