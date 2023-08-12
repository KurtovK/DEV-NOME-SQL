import unittest


class Calculator:
    def add(self, a, b):
        return a + b

    def subtract(self, a, b):
        return a - b

    def multiply(self, a, b):
        return a * b

    def divide(self, a, b):
        if b != 0:
            return a / b
        else:
            raise ValueError("Деление на ноль невозможно")

    def maximum(self, a, b):
        return max(a, b)

    def minimum(self, a, b):
        return min(a, b)

    def percentage(self, a, percent):
        return a * percent / 100

    def exponentiate(self, a, power):
        return a ** power


class TestCalculator(unittest.TestCase):
    def setUp(self):
        self.calculator = Calculator()

    def test_add(self):
        self.assertEqual(self.calculator.add(2, 3), 5)

    def test_subtract(self):
        self.assertEqual(self.calculator.subtract(5, 3), 2)

    def test_multiply(self):
        self.assertEqual(self.calculator.multiply(2, 3), 6)

    def test_divide(self):
        self.assertEqual(self.calculator.divide(6, 2), 3)
        self.assertRaises(ValueError, self.calculator.divide, 6, 0)

    def test_maximum(self):
        self.assertEqual(self.calculator.maximum(2, 3), 3)

    def test_minimum(self):
        self.assertEqual(self.calculator.minimum(2, 3), 2)

    def test_percentage(self):
        self.assertEqual(self.calculator.percentage(50, 10), 5)

    def test_exponentiate(self):
        self.assertEqual(self.calculator.exponentiate(2, 3), 8)


if __name__ == '__main__':
    unittest.main()