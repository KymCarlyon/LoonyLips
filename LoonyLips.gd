 extends Node2D

var player_words = [] 
var template = [
		{
		"prompt" :["a name", "a thing", "a feeling", "some food"],
		"story" :"A child called %s had a %s he/she was %s it and the child adored %s!"
		},
		{
		"prompt" :["a fruit", "an unhealthy thing", "more fruits"],
		"story" :"A %s ate a %s to make the world healthy and added %s!"
		},
		{
		"prompt" :["An insect", "your insect with man on the end", "a feeling", "your insect with man on the end"],
		"story" :"A boy was bitten by a/an %s and turned into %s he %s being %s"
		},
		{
		"prompt" :["An insect", "your insect with girl on the end", "a feeling", "your insect with girl on the end" ],
		"story" :"A girl was bitten by a/an %s and turned into %s she %s being %s!"
		},
		{
		"prompt" :["You write in warm or cold", "a name","Yoy write in too cold or happy", "you write in he/she jumped in or so he/she went home"],
		"story" :"The water was %s someone called %s was %s to jump in %s!!!!!!!!!!"
		},
		{
		"prompt" :["you write in jump or sit", "you write in you not able to do magic or I was able to do magic", "If you wrote able to do magic write in surprised or shocked if you wrote no then write in annoyed or sad"],
		"story" :"If you want to do magic you have too %s I tried and I was %s I was %s over it!"
		}
		] 
var current_story

func _ready():
		randomize()
		current_story = template [randi() % template.size()]
		$Blackboard/StoryText.text = ("Welcome to Loony Lips!\n\nWe're going to tell a story and have a lovely time!\nCan I have " + current_story.prompt[player_words.size()] + ", please")
		$Blackboard/TextBox.text = ""


func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)
		
func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	check_player_word_length()
	
func is_story_done():
	return player_words.size() == current_story.prompt.size()
	

func prompt_player():
	$Blackboard/StoryText.text = ("Can I have " +current_story.prompt[player_words.size()] + ", please?")
	
func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()
	
func tell_story():
		$Blackboard/StoryText.text = current_story.story % player_words
		$Blackboard/TextureButton/ButtonLabel.text = "Again!"
		end_game()

func end_game():
	$Blackboard/TextBox.queue_free()
