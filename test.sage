attach("monoalphabetic.sage")
attach("hill.sage")

plaintext = "monoalphabetic cipher test"
print("Plaintext : {}".format(plaintext))

key = generate_random_monoalphabetic_key()
print("Key: {}".format(key))

ciphered = monoalphabetic_encrypt(key, plaintext)
print("Monoalphabetic encryption: {}".format(ciphered))

deciphered = monoalphabetic_decrypt(key, ciphered)
print("Monoalphabetic decryption: {}".format(deciphered))

plaintext = "hill cipher test"
print("Plaintext : {}".format(plaintext))
plaintext = remove_spaces(plaintext)
print("Plaintext (spaces removed) : {}".format(plaintext))

key = generate_random_hill_key()
print("Key:\n{}".format(key))

ciphered = hill_encrypt(key, plaintext)
print("Hill encryption: {}".format(ciphered))

deciphered = hill_decrypt(key, ciphered)
print("Hill decryption: {}".format(deciphered))