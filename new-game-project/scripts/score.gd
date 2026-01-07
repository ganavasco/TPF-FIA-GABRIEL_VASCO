extends Label

func _on_receiver_score_increased() -> void:
	Global.score += 1
	self.text = str(Global.score)
