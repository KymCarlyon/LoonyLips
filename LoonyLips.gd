extends Node2D

func _ready():
	var prompt = ["Myka", "popcorn", "full", "book", ]
	var story = "Once upon a time %s ate some %s and felt very %s. She went upstairs and read a %s."
	$Blackboard/StoryText.bbcode_text = story % prompt
	$Blackboard/TextBox.text = ""

func _on_TextureButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)


func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.text = new_text
	$Blackboard/TextBox.text = ""
