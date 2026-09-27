extends SceneTree

# Inspect actual loaded defaults without changing them or generating sound.
func _initialize() -> void:
	var flat_count := 0
	for index in [7, 8, 9]:
		var effect := AudioServer.get_bus_effect(0, index) as AudioEffectEQ
		if effect == null:
			push_error("Expected equalizer at bus index " + str(index))
			quit(1)
			return
		var gains := PackedFloat32Array()
		var flat := true
		for band in range(effect.get_band_count()):
			var gain := effect.get_band_gain_db(band)
			gains.append(gain)
			flat = flat and is_zero_approx(gain)
		print(effect.get_class(), " GAINS_DB ", gains, " FLAT ", flat)
		if flat:
			flat_count += 1
	print("FLAT_EQS ", flat_count, "/3; not an audible comparison")
	quit(0 if flat_count == 3 else 1)
