extends Area2D

var entered = false
@export var target_scene: String = ""  # Путь к сцене

func _on_body_entered(body: CharacterBody2D):
	entered = true

func _on_body_exited(body):
	entered = false

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_interact"):
			get_tree().change_scene_to_file(target_scene)
