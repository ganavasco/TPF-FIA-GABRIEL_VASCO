extends RichTextLabel

func _ready() -> void:
	bbcode_enabled = true
	# Set the text using the 'bbcode_text' property
	# You must use 'bbcode_text' to parse the tags; using 'text' will strip the tags.
	var user_name = "GDScript_Master"
	var message_content = "Hello, [color=yellow]world[/color]! This is [b]bold[/b] text."
	var outra_msg = "Ola"
	#bbcode_text = "[center][color=aqua]%s[/color]: %s[/center]" % [user_name, message_content]
	append_text("[center][color=aqua]%s[/color]: %s[/center]" % [user_name, message_content]) 
	append_text("[center][color=aqua]%s[/color][/center]" % [outra_msg]) 
	print(text)
	#pop()
	# Alternatively, you can build the text dynamically:
	# bbcode_text = "[color=red]Warning![/color]"
	# append_bbcode(" New text appended.") # Use append_bbcode for appending
	# text = [hint="tooptip for this text"][font_size=40][center][color=2c00ec][outline_size=10]Teste[/hint][b]Teste[/b][i]Teste[/i][u]Teste[/u][s]Teste[/s][url=www.google.com]oii[/url]

func _on_meta_clicked(meta: Variant) -> void:
	OS.shell_open(String(meta))
