attach("monoalphabetic.sage")
attach("hill.sage")
attach("vigenere.sage")

#Monoalphabetic cipher test

plaintext = "monoalphabetic cipher test"
print("Plaintext : {}".format(plaintext))

key = generate_random_monoalphabetic_key()
print("Key: {}".format(key))

ciphered = monoalphabetic_encrypt(key, plaintext)
print("Monoalphabetic encryption: {}".format(ciphered))

deciphered = monoalphabetic_decrypt(key, ciphered)
print("Monoalphabetic decryption: {}\n\n".format(deciphered))


#Hill cipher test

plaintext = "hill cipher test"
print("Plaintext : {}".format(plaintext))
plaintext = remove_spaces(plaintext)
print("Plaintext (spaces removed) : {}".format(plaintext))

key = generate_random_hill_key()
print("Key:\n{}".format(key))

ciphered = hill_encrypt(key, plaintext)
print("Hill encryption: {}".format(ciphered))

deciphered = hill_decrypt(key, ciphered)
print("Hill decryption: {}\n\n".format(deciphered))


#Vigenere cipher test

plaintext = "vigenere cipher test"
print("Plaintext : {}".format(plaintext))
plaintext = remove_spaces(plaintext)
print("Plaintext (spaces removed) : {}".format(plaintext))

key = "botafogo" #Biggest football club in Brazil
print("Key:{}".format(key))
key = extend_key_size(key, plaintext)
print("Extended key: {}".format(key))

ciphered = vigenere_encrypt(key, plaintext)
print("Vigenere encryption: {}".format(ciphered))

deciphered = vigenere_decrypt(key, ciphered)
print("Vigenere decryption: {}".format(deciphered))