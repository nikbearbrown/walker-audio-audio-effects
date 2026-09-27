extends SceneTree

func _initialize() -> void:
	run_probe.call_deferred()

func click_control(control: Control) -> void:
	var event := InputEventMouseButton.new()
	event.button_index = MOUSE_BUTTON_LEFT
	event.position = control.get_global_rect().get_center()
	event.pressed = true
	root.push_input(event, true)
	event.pressed = false
	root.push_input(event, true)
	await process_frame

func run_probe() -> void:
	var scene = load("res://audio_effects.tscn").instantiate()
	root.add_child(scene)
	current_scene = scene
	for i in range(3):
		await process_frame
	var toggle = scene.get_node("Control/AudioEffectButtons/ToggleAmplify")
	var original := AudioServer.is_bus_effect_enabled(0, 0)
	await click_control(toggle)
	var enabled_ok := AudioServer.is_bus_effect_enabled(0, 0) != original
	await click_control(toggle)
	var restored_ok := AudioServer.is_bus_effect_enabled(0, 0) == original
	print("AMPLIFY_TOGGLE ", enabled_ok, " RESTORED ", restored_ok, " EFFECT_COUNT ", AudioServer.get_bus_effect_count(0))
	var names := ["ToggleAmplify", "ToggleBandLimiter", "ToggleBandPassFilter", "ToggleChorus", "ToggleCompressor", "ToggleDelay", "ToggleDistortion", "ToggleEQ6", "ToggleEQ10", "ToggleEQ21", "ToggleHighPassFilter", "ToggleLowShelfFilter", "ToggleNotchFilter", "TogglePanner", "TogglePhaser", "TogglePitchShift", "ToggleReverb", "ToggleStereoEnhance"]
	var passed := 0
	for index in range(names.size()):
		var control = scene.get_node("Control/AudioEffectButtons/" + names[index])
		var before := AudioServer.is_bus_effect_enabled(0, index)
		await click_control(control)
		var changed := AudioServer.is_bus_effect_enabled(0, index) != before
		await click_control(control)
		var restored := AudioServer.is_bus_effect_enabled(0, index) == before
		if changed and restored:
			passed += 1
		print(names[index], " TOGGLE ", changed, " RESTORE ", restored)
	print("EFFECTS_PASSED ", passed, "/18")
	var sounds_passed := 0
	for sound in ["Ding", "Glass", "Meow", "Beeps", "Trombone", "Static", "Whistle"]:
		await click_control(scene.get_node("Control/SoundEffectButtons/" + sound + "Button"))
		var player = scene.get_node("SoundEffects/" + sound)
		print(sound, " PLAYING ", player.playing)
		if player.playing:
			sounds_passed += 1
		player.stop() # Diagnostic cleanup, not a simulated user action.
	await click_control(scene.get_node("Control/SoundEffectButtons/ToggleMusic"))
	var music_started: bool = scene.get_node("SoundEffects/Music").playing
	await click_control(scene.get_node("Control/SoundEffectButtons/ToggleMusic"))
	var music_stopped: bool = not scene.get_node("SoundEffects/Music").playing
	print("SOUNDS_PASSED ", sounds_passed, "/7 MUSIC_START ", music_started, " MUSIC_STOP ", music_stopped)
	await create_timer(0.2).timeout
	scene.queue_free()
	await process_frame
	await process_frame
	quit(0 if enabled_ok and restored_ok and passed == 18 and sounds_passed == 7 and music_started and music_stopped else 1)
