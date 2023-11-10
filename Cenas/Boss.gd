extends KinematicBody2D

var player_close = false
var path_game_over = "res://Cenas/GameOver.tscn"

func _ready():
	$Panel.hide()
	$Panel.connect("resposta_correta", self, "_on_resposta_correta")
	$Panel.connect("resposta_incorreta", self, "_on_resposta_incorreta")

func _process(delta):
	if player_close and Input.is_action_just_pressed("ui_start"):
		$Panel.show()

func _on_Area2D_body_entered(body):
	if body.name == "Player": 
		player_close = true

func _on_Area2D_body_exited(body):
	if body.name == "Player": 
		player_close = false
		$Panel.hide()

func _on_resposta_correta():
	queue_free() 

func _on_resposta_incorreta():
	get_tree().change_scene(path_game_over)
