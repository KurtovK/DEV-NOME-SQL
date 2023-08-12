import unittest
#Задание 1
#Создайте класс, содержащий набор целых чисел.В классе должна быть реализована следующая функциональность:
#■ Сумма элементов набора.
#■ Среднеарифметическое элементов набора.
#■ Максимум из элементов набора.
#■ Минимум из элементов набора.
#Протестируйте все возможности созданного класса с помощью модульного тестирования(unittest).

class NumberSet:
    def __init__(self, numbers):
        self.numbers = numbers

    def sum(self):
        return sum(self.numbers)

    def average(self):
        return sum(self.numbers) / len(self.numbers)

    def maximum(self):
        return max(self.numbers)

    def minimum(self):
        return min(self.numbers)


class TestNumberSet(unittest.TestCase):
    def test_sum(self):
        num_set = NumberSet([1, 2, 3, 4, 5])
        self.assertEqual(num_set.sum(), 15)

    def test_average(self):
        num_set = NumberSet([1, 2, 3, 4, 5])
        self.assertEqual(num_set.average(), 3)

    def test_maximum(self):
        num_set = NumberSet([1, 2, 3, 4, 5])
        self.assertEqual(num_set.maximum(), 5)

    def test_minimum(self):
        num_set = NumberSet([1, 2, 3, 4, 5])
        self.assertEqual(num_set.minimum(), 1)


if __name__ == '__main__':
    unittest.main()