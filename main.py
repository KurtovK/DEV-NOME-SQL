from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Order(Base):
    __tablename__ = 'orders'

    id = Column(Integer, primary_key=True)
    pizza = Column(String)
    total_cost = Column(Float)


class Ingredient:
    def __init__(self, name, cost):
        self.name = name
        self.cost = cost

    def get_name(self):
        return self.name

    def get_cost(self):
        return self.cost


class Pizza:
    def __init__(self):
        self.ingredients = []
        self.cost = 0

    def add_ingredient(self, ingredient):
        self.ingredients.append(ingredient)
        self.cost += ingredient.cost

    def remove_ingredient(self, ingredient):
        self.ingredients.remove(ingredient)
        self.cost -= ingredient.cost

    def get_ingredients(self):
        return self.ingredients

    def get_cost(self):
        return self.cost


class Pizzeria:
    def __init__(self, discount_threshold, discount_amount):
        self.discount_threshold = discount_threshold
        self.discount_amount = discount_amount
        self.orders = []

    def create_order(self, pizza):
        self.orders.append(pizza)

    def calculate_discount(self):
        if len(self.orders) >= self.discount_threshold:
            return self.discount_amount
        else:
            return 0

    def get_orders(self):
        return self.orders


engine = create_engine('sqlite:///pizzeria.db')
Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)

# Creating ingredients
tomato = Ingredient('Tomato', 1)
cheese = Ingredient('Cheese', 2)
pepperoni = Ingredient('Pepperoni', 3)

# Creating pizza
pizza = Pizza()
pizza.add_ingredient(tomato)
pizza.add_ingredient(cheese)
pizza.add_ingredient(pepperoni)

# Creating pizzeria and placing an order
pizzeria = Pizzeria(2, 1)
pizzeria.create_order(pizza)

# Calculating discount and printing order information
discount = pizzeria.calculate_discount()
orders = pizzeria.get_orders()

for order in orders:
    print(f'Pizza: {", ".join([ingredient.get_name() for ingredient in order.get_ingredients()])}')
    print(f'Total cost: {order.get_cost() - discount}')