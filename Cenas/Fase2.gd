extends Node2D

var path_game_over = "res://Cenas/GameOver.tscn"

func _on_Area2D_body_entered(body):
	get_tree().change_scene(path_game_over)
