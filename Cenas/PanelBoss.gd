extends Panel

signal resposta_correta
signal resposta_incorreta

var perguntas = [
	{"pergunta": "Qual é a soma de 123 e 456", "opcoes": ["750", " 579", "432"], "resposta_correta": 1},
]

var pergunta_atual

func _ready():
	hide()
	randomize() 
	pergunta_atual = perguntas[randi() % perguntas.size()]
	update_pergunta() 
	$VBoxContainer/Button.connect("pressed", self, "_on_Button_pressed", [0])
	$VBoxContainer/Button2.connect("pressed", self, "_on_Button_pressed", [1])
	$VBoxContainer/Button3.connect("pressed", self, "_on_Button_pressed", [2])

func update_pergunta():
	$Label.text = pergunta_atual["pergunta"]
	$VBoxContainer/Button.text = pergunta_atual["opcoes"][0]
	$VBoxContainer/Button2.text = pergunta_atual["opcoes"][1]
	$VBoxContainer/Button3.text = pergunta_atual["opcoes"][2]

func _on_Button_pressed(button_index):
	if button_index == pergunta_atual["resposta_correta"]:
		emit_signal("resposta_correta")
	else:
		emit_signal("resposta_incorreta")
	hide() 
