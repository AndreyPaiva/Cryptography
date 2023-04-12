alphabet = "abcdefghijklmnopqrstuvwxyz"

def is_alphabetic_char(character):  #Checks if the input is an alphabet letter
	return character in alphabet

def num_to_char(number, ruler = alphabet):  #Returns the correspondent letter to the input number
	return ruler[number]

def char_to_num(character, ruler = alphabet):   #Returns the correspondent number to the input letter (a = 0, z = 25)
	return ruler.find(character)

def remove_spaces(plaintext):   #Removes the spaces from the plain text
    plaintext = plaintext.split()
    auxiliar = ""

    for i in range(len(plaintext)):
        auxiliar += plaintext[i]
    
    return auxiliar