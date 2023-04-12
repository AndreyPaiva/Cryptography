import numpy as np
attach("utils.sage")

R = IntegerModRing(len(alphabet))

m = 2

def generate_random_hill_key():
    key = random_matrix(R, m, m)
    if(det(key)%2 == 0 or det(key) == 13):
        key = generate_random_hill_key()    
    return key

def hill_encrypt(key, plaintext):
    ciphertext = ""
    
    if(len(plaintext)%m):
        rows = len(plaintext)//m + 1
    else:
        rows = len(plaintext)//m
    
    columns = m
    numerical_text = np.zeros((rows, columns), dtype = int)

    for i in range(len(plaintext)//m):
        term = plaintext[m*i : m*i + m]
        
        for j in range(m):
            numerical_text[i][j] = char_to_num(term[j])
    
    if(len(plaintext)%m):
        for i in range(len(plaintext)%m):
            numerical_text[-1][i] = char_to_num(plaintext[m*(len(plaintext)//m) + i])
    
    numerical_text = np.transpose(numerical_text)
    encrypted_matrix = np.dot(key, numerical_text)

    for i in range(rows):
        for j in range(columns):
            ciphertext += num_to_char(encrypted_matrix[j][i])
    
    return ciphertext

def hill_decrypt(key, ciphertext):
    plaintext = ""

    if(len(ciphertext)%m):
        rows = len(ciphertext)//m + 1
    else:
        rows = len(ciphertext)//m
    
    columns = m
    numerical_text = np.zeros((rows, columns), dtype = int)

    for i in range(len(ciphertext)//m):
        term = ciphertext[m*i : m*i + m]
        
        for j in range(m):
            numerical_text[i][j] = char_to_num(term[j])
    
    if(len(ciphertext)%m):
        for i in range(len(ciphertext)%m):
            numerical_text[-1][i] = char_to_num(ciphertext[m*(len(ciphertext)//m) + i])
    
    numerical_text = np.transpose(numerical_text)
    key = key**-1
    decrypted_matrix = np.dot(key, numerical_text)

    for i in range(rows):
        for j in range(columns):
            plaintext += num_to_char(decrypted_matrix[j][i])

    return plaintext