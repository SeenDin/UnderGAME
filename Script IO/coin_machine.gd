extends Area2D  # (или Area2D, если логика в зоне)

var can_play_sound := false  # Можно ли проиграть звук?
@onready var audio_player = $AudioStreamPlayer  # Аудиоплеер

func _input(event):
	# Если нажата E (ui_accept) и персонаж в зоне
	if event.is_action_pressed("ui_interact") and can_play_sound:
		audio_player.play()  # Проиграть звук

func _on_body_entered(body: CharacterBody2D):
	can_play_sound = true

func _on_body_exited(body):
	can_play_sound = false  # Персонаж вышел из зоны
