extends CanvasLayer

#Add new ones for other scenes
const mainmenu = ("res://Scenes/MainMenu.tscn")
const tutorial = ("res://Scenes/MainMenu.tscn")

func _ready():
	get_node("ColorRect").hide()

func changeScene(scenePath):
	get_tree().paused = true
	get_node("ColorRect").show()
	get_node("AnimationPlayer").play("Transition")

	await get_node("AnimationPlayer").animation_finished
	get_node("AnimationPlayer").play_backwards("Transition")
	get_tree().change_scene_to_file(scenePath)
	get_tree().paused = false
	await get_node("AnimationPlayer").animation_finished
	get_node("ColorRect").hide()
