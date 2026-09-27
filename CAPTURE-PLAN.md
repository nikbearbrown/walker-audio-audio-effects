# Audio Effects evidence plan

Status: not recorded. Normal-input state tests pass, but no audible result is
verified. The existing recording-window interruption blocker remains in effect.

Use actual Godot output at native3840×2160, with its engine stereo mix captured
alongside timestamped frames and normal mouse events. Check disk reserve15GB,
viewport framing and audio driver first. Do not substitute the original WAV for
the processed engine mix: doing so would erase the very effect being explained.

## Comparison protocol

1. Reset through actual checkbuttons so all effects are off. Record the enabled
   bus flags as observations, then click Ding and let its tail finish.
2. Enable exactly one effect, replay the same source from its beginning, and
   allow the complete effect tail. Repeat for all18 controls, with longer gaps
   for delay/reverb. Use music or another source when Ding does not expose the
   effect clearly. Do not claim that an inaudible difference is obvious.
3. Preserve stereo for Panner and StereoEnhance. Inspect channel measurements
   and listen; a mono export cannot demonstrate the stereo result faithfully.
4. Keep source and master gain fixed between paired takes. Amplify explicitly
   adds5dB; separately normalizing dry/wet would conceal this. Check clipping.
5. Label source-backed settings: PitchShift0.75, Panner−1, Compressor threshold
   −24dB, Distortion pre-gain−26dB/drive0.5. Do not invent defaults for properties
   absent from the saved resource. Actual loaded EQ6/EQ10/EQ21 gains were checked
   by test_eq_defaults.gd: all37 bands are0dB. Explain the flat configuration;
   do not promise a deliberate tonal change merely from enabling these toggles.
6. Only after single effects, demonstrate a deliberate combination and explain
   ordered processing on Master. Show the exact resource/controller code and
   immediately play its actual result, with narration silent during listening.

## Evidence and film boundaries

- Record driver, sample rate, source hashes, start times, effect states and WAV
  sample counts. Preserve raw takes; mark any editing gap or gain adjustment.
- Music: Monkeys Spinning Monkeys, Kevin MacLeod (incompetech.com), CC BY3.0;
  include attribution in film sources and description when used. Original
  Freesound CC0 credits remain in godot/README.md.
- Local Liam voice belongs on its own narration track after evidence capture;
  it must not pass through the demonstrated game-effect bus. Keep the regular
  stock outro separate. No burned captions, paid services or publication.
- State tests are not audio-quality tests. Both Walker films remain pending
  until the actual input-driven visuals and heard output have been reviewed.
