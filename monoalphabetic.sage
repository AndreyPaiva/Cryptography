import numpy as np
import random as rd
attach("utils.sage")

def generate_random_monoalphabetic_key():
    key = ""
    num_key = np.arange(26)
    rd.shuffle(num_key)
    
    for i in range(len(num_key)):
        key += num_to_char(num_key[i])
    
    return key

def monoalphabetic_encrypt(key, plaintext):
    ciphertext = ""
    numerical_text = np.zeros(len(plaintext), dtype = int)
    
    for i in range(len(numerical_text)):

        if(is_alphabetic_char(plaintext[i])):
            numerical_text[i] = char_to_num(plaintext[i])
        else:
            numerical_text[i] = -1
    
    for i in range(len(plaintext)):

        if(numerical_text[i] >= 0):
            ciphertext += num_to_char(numerical_text[i], key)
        else:
            ciphertext += plaintext[i]
        
    return ciphertext

def monoalphabetic_decrypt(key, ciphertext):
    plaintext = ""
    numerical_text = np.zeros(len(ciphertext), dtype = int)
    
    for i in range(len(numerical_text)):

        if(is_alphabetic_char(ciphertext[i])):
            numerical_text[i] = char_to_num(ciphertext[i], key)
        else:
            numerical_text[i] = -1
    
    for i in range(len(numerical_text)):

        if(numerical_text[i] >= 0):
            plaintext += num_to_char(numerical_text[i])
        else:
            plaintext += ciphertext[i]
    
    return plaintext