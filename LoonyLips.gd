extends Node2D

var player_words = [] 
var prompt = ["a name", " a food", "feeling", "something", ]
var story = "Once upon a time %s ate some %s and felt very %s. He/She went upstairs and got %s."
	
func _ready():
	$Blackboard/StoryText.text = story % prompt
	$Blackboard/StoryText.text = ("Welcome to Loony Lips!\n\nWe're going to tell a story and have a lovely time!\nCan I have " + prompt[player_words.size()] + ", please?")
	$Blackboard/TextBox.text = ""
	
	
func _on_TextureButton_pressed():
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)
		
func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	check_player_word_length()
		
func prompt_player():
	$Blackboard/StoryText.text = ("Can I have " + prompt[player_words.size()] + ", please?")
	
func check_player_word_length():
	if player_words.size() == prompt.size():
		tell_story()
	else:
		prompt_player()
	
func tell_story():
		$Blackboard/StoryText.text = story % player_words