import unittest
#Задание 1
#Создайте класс по работе с дробями. В классе должна быть реализована следующая функциональность:
#■ Сложение дробей;
#■ Вычитание дробей;
#■ Умножение дробей;
#Деление дробей.
#Протестируйте все возможности созданного класса с помощью модульного тестирования (unittest).
class Fraction:
    def __init__(self, numerator, denominator):
        self.numerator = numerator
        self.denominator = denominator

    def __add__(self, other):
        new_numerator = self.numerator * other.denominator + other.numerator * self.denominator
        new_denominator = self.denominator * other.denominator
        return Fraction(new_numerator, new_denominator)

    def __sub__(self, other):
        new_numerator = self.numerator * other.denominator - other.numerator * self.denominator
        new_denominator = self.denominator * other.denominator
        return Fraction(new_numerator, new_denominator)

    def __mul__(self, other):
        new_numerator = self.numerator * other.numerator
        new_denominator = self.denominator * other.denominator
        return Fraction(new_numerator, new_denominator)

    def __truediv__(self, other):
        new_numerator = self.numerator * other.denominator
        new_denominator = self.denominator * other.numerator
        return Fraction(new_numerator, new_denominator)

    def __str__(self):
        return f"{self.numerator}/{self.denominator}"


# Пример использования класса и модульного тестирования



class FractionTest(unittest.TestCase):
    def test_addition(self):
        fraction1 = Fraction(1, 2)
        fraction2 = Fraction(1, 3)
        result = fraction1 + fraction2
        self.assertEqual(str(result), "5/6")

    def test_subtraction(self):
        fraction1 = Fraction(3, 4)
        fraction2 = Fraction(1, 4)
        result = fraction1 - fraction2
        self.assertEqual(str(result), "1/2")

    def test_multiplication(self):
        fraction1 = Fraction(2, 3)
        fraction2 = Fraction(3, 4)
        result = fraction1 * fraction2
        self.assertEqual(str(result), "1/2")

    def test_division(self):
        fraction1 = Fraction(3, 5)
        fraction2 = Fraction(2, 1)
        result = fraction1 / fraction2
        self.assertEqual(str(result), "3/10")

if __name__ == "__main__":
    unittest.main()