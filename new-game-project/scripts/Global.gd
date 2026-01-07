extends Node

const PATH : String = "user://"
const file_name : String = "save.json"

enum ItemType{COLOR, HATS, PANTS}

var score : int = 10
var dic1 := {"CHAVE_1" : [], "CHAVE_2" : [], "CHAVE_3" : []}
var dic2 := {"CHAVE_1" : "", "CHAVE_2" : "", "CHAVE_3" : ""}

var data : Dictionary
var access : FileAccess

func save_game() -> void:
	data = {"score" : score, "nome_dicionario_1" : dic1, "nome_dicionario_2" : dic2}
	access = FileAccess.open(PATH + file_name, FileAccess.WRITE)
	access.store_string(JSON.stringify(data))
	access.close()

func load_game() -> void:
	for node in get_tree().get_nodes_in_group("persist"):
		#if node.scene_file_path.is_empty():
		#	print("persistent node '%s' is not an instanced scene, skipped" % node.name)
		#	continue
		# Check the node has a save function.
		if !node.has_method("reset"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
		node.reset()
	if FileAccess.file_exists(PATH + file_name):
		access = FileAccess.open(PATH + file_name, FileAccess.READ)
		data = JSON.parse_string(access.get_as_text())
		score = data["score"]
		dic1 = data["nome_dicionario_1"]
		dic2 = data["nome_dicionario_2"]
		access.close()
		print("game load successfull")
	else:
		print("file not found")

func new_game():
	for node in get_tree().get_nodes_in_group("persist"):
		if !node.has_method("reset"):
			print("persistent node '%s' is missing a reset() function, skipped" % node.name)
			continue
		node.reset()
