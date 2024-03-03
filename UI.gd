extends CanvasLayer

var coins = 0

onready var coinsCollectedText: Label = $CoinsColletedText  # Asegúrate de que coinsCollectedText sea del tipo correcto

func _ready():
	
	$CoinsColletedText.text = String(coins)

func handleCoincollected():
	print("Coin Collected")
	coins += 1
	$CoinsColletedText.text = String(coins)
	
	if coins == 3:
		## Cambio de nivel
		##get_tree().change_scene("res://Scenes/Mundo2.tscn")
		get_tree().change_scene("res://Scenes/Mundo" + str(int(get_tree().current_scene.name)+1)+".tscn")
