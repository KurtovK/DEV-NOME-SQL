import unittest
#Задание 2
#Создайте класс для числа. В классе должна быть реализована следующая функциональность:
#■ Запись и чтение значения.
#■ Перевод числа в восьмеричную систему исчисления.
#■ Перевод числа в шестнадцатеричную систему исчисления.
#■ Перевод числа в двоичную систему исчисления.
#Протестируйте все возможности созданного класса с помощью модульного тестирования(unittest).
class MyNumber:
    def __init__(self, number):
        self.number = number

    def get_value(self):
        return self.number

    def set_value(self, number):
        self.number = number

    def to_octal(self):
        return oct(self.number)

    def to_hexadecimal(self):
        return hex(self.number)

    def to_binary(self):
        return bin(self.number)
num = MyNumber(10)

print(num.get_value())

num.set_value(15)
print(num.get_value())

print(num.to_octal())
print(num.to_hexadecimal())
print(num.to_binary())
class TestMyNumber(unittest.TestCase):
    def setUp(self):
        self.num = MyNumber(10)

    def test_get_value(self):
        self.assertEqual(self.num.get_value(), 10)

    def test_set_value(self):
        self.num.set_value(15)
        self.assertEqual(self.num.get_value(), 15)

    def test_to_octal(self):
        self.assertEqual(self.num.to_octal(), '0o12')

    def test_to_hexadecimal(self):
        self.assertEqual(self.num.to_hexadecimal(), '0xa')

    def test_to_binary(self):
        self.assertEqual(self.num.to_binary(), '0b1010')

if __name__ == '__main__':
    unittest.main()