alphabet = "abcdefghijklmnopqrstuvwxyz"

def is_alphabetic_char(character):
	return character in alphabet

def num_to_char(number, ruler = alphabet):
	return ruler[number]

def char_to_num(character, ruler = alphabet):
	return ruler.find(character)