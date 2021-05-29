from num2words import num2words
import random


def get_sucessful_random_value():

    num = random.randrange(1000, 10000)
    return num


def get_word_from_number(num, lang):
    return num2words(number=num, lang=lang)


def get_invalid_random_value():
    num1 = random.randrange(-2147483648, -10000)
    num2 = random.randint(10000, 2147483647)
    num_list = [num1, num2]
    return random.choice(num_list)
