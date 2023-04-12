attach("utils.sage")

vigenere_matrix = "abcdefghijklmnopqrstuvwxyz",\
                "bcdefghijklmnopqrstuvwxyza",\
                "cdefghijklmnopqrstuvwxyzab",\
                "defghijklmnopqrstuvwxyzabc",\
                "efghijklmnopqrstuvwxyzabcd",\
                "fghijklmnopqrstuvwxyzabcde",\
                "ghijklmnopqrstuvwxyzabcdef",\
                "hijklmnopqrstuvwxyzabcdefg",\
                "ijklmnopqrstuvwxyzabcdefgh",\
                "jklmnopqrstuvwxyzabcdefghi",\
                "klmnopqrstuvwxyzabcdefghij",\
                "lmnopqrstuvwxyzabcdefghijk",\
                "mnopqrstuvwxyzabcdefghijkl",\
                "nopqrstuvwxyzabcdefghijklm",\
                "opqrstuvwxyzabcdefghijklmn",\
                "pqrstuvwxyzabcdefghijklmno",\
                "qrstuvwxyzabcdefghijklmnop",\
                "rstuvwxyzabcdefghijklmnopq",\
                "stuvwxyzabcdefghijklmnopqr",\
                "tuvwxyzabcdefghijklmnopqrs",\
                "uvwxyzabcdefghijklmnopqrst",\
                "vwxyzabcdefghijklmnopqrstu",\
                "wxyzabcdefghijklmnopqrstuv",\
                "xyzabcdefghijklmnopqrstuvw",\
                "yzabcdefghijklmnopqrstuvwx",\
                "zabcdefghijklmnopqrstuvwxy"

def extend_key_size(key, plaintext):
    new_key = key
    ring = IntegerModRing(len(key))
    i = ring(0)
    while(len(new_key) != len(plaintext)):
        new_key += key[i]
        i += 1
    return new_key

def vigenere_encrypt(key, plaintext):
    ciphertext = ""

    for i in range(len(plaintext)):
        row = char_to_num(plaintext[i])
        column = char_to_num(key[i])
        ciphertext += vigenere_matrix[row][column]
    
    return ciphertext

def vigenere_decrypt(key, ciphertext):
    plaintext = ""

    for i in range(len(ciphertext)):
        column = char_to_num(key[i])
        row = 0

        for j in vigenere_matrix[:][column]:
            if(j == ciphertext[i]):
                plaintext += vigenere_matrix[row][0]
            row += 1
    
    return plaintext
