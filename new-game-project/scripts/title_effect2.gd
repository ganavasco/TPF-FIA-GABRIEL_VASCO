@tool
extends RichTextEffect
class_name BounceEffect

var bbcode := "label"

func _process_custom_fx(char_fx : CharFXTransform) -> bool:
	# We need the TextServer to know how wide this specific letter is (e.g. 'W' is wider than 'i')
	var ts := TextServerManager.get_primary_interface()
	var time_scale := 0.5
	var max_sin_value := 0.5
	var char_fx_scale := time_scale/3.0
	var min_glyph_size := 0.9
	var max_glyph_size := 1.0
	# Scale character
	var scale := sin(fmod(char_fx.elapsed_time * time_scale + char_fx.range.x * char_fx_scale, max_sin_value) * TAU)
	var scale_v := Vector2.ONE * (pow(absf(scale), 2.0) * (max_glyph_size - min_glyph_size) + min_glyph_size)
	char_fx.transform = char_fx.transform.scaled(scale_v)
	#var scale_v := Vector2.ONE * ((scale * 0.5) + 0.5)
	
	#print("elapsed time = " + str(char_fx.elapsed_time))
	#print("char_fx.range.x = " + str(char_fx.range.x))
	#var  transform_scale := -20
	#var origin : Vector2 = char_fx.transform.origin
	#origin.x = origin.x + transform_scale * (pow(absf(scale), 2.0) * (max_glyph_size - min_glyph_size) + min_glyph_size)
	#char_fx.transform.origin = origin
	#char_fx.transform = char_fx.transform.translated(Vector2(-char_fx.range.x/4.0, 0))
	
	# --- CENTERING LOGIC ---
	
	# Attempt to get size from BBCode [label s=30], default to 16 if missing
	var font_size = char_fx.env.get("s", 96) 
	
	# Get physical dimensions of this character
	var glyph_width := ts.font_get_glyph_advance(char_fx.font, font_size, char_fx.glyph_index).x
	var glyph_height := ts.font_get_ascent(char_fx.font, font_size)
	
	# Calculate the pivot (Center of the character's bounding box)
	# Y is usually negative in font drawing (upwards from baseline)
	#var pivot := Vector2(glyph_width / 2.0, -glyph_height / 2.0)
	var pivot := Vector2(glyph_width / 2.0, 0.0)
	
	#Global.xposition_debug.emit(char_fx.transform.origin.x)
	# Calculate the shift: (1 - scale) * pivot
	# This moves the character back so the pivot stays in the same screen spot
	var test_multiplier := 10.0
	var correction_offset := pivot * (Vector2.ONE - scale_v) * test_multiplier
	
	# Apply to origin
	char_fx.transform.origin += correction_offset
	#print(char_fx.transform.origin.x)
	
	return true
