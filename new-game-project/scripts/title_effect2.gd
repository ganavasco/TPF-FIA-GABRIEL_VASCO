@tool
extends RichTextEffect
class_name BounceEffect

var bbcode := "label"

func _process_custom_fx(char_fx : CharFXTransform) -> bool:
	#var text_server := TextServerManager.get_primary_interface()
	
	#Vary hue
	#var add := 0.7
	#var hue := char_fx.range.x /30.0 + add
	#char_fx.color = Color.from_hsv(hue, 1.0, 1.0)
	
	# Bounce character
	#var bounce := pow((fmod(6.0 * char_fx.elapsed_time + char_fx.range.x / 0.5, 4.0) - 2.0), 2.0) / 4.0
	#char_fx.offset.y = 18.0 * bounce - 24
	
	# Scale character
	#var scale := sin(fmod(char_fx.elapsed_time / 4.0 + char_fx.range.x / 4.0, 1.0) * TAU)
	#var scale_v := Vector2.ONE * (pow(absf(scale), 1.0) / 2.0 + 0.8)
	#char_fx.transform = char_fx.transform.scaled(scale_v)
	#char_fx.transform = char_fx.transform.translated(Vector2(-char_fx.range.x/4.0, 0))
	
	return true
