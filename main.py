# Модель (Model)
class Recipe:
    def __init__(self, title, author, description, ingredients, cuisine):
        self.title = title
        self.author = author
        self.description = description
        self.ingredients = ingredients
        self.cuisine = cuisine

# Представление (View)
class RecipeView:
    def display_recipe(self, recipe):
        print("Название рецепта:", recipe.title)
        print("Автор рецепта:", recipe.author)
        print("Описание рецепта:", recipe.description)
        print("Ингредиенты:", recipe.ingredients)
        print("Название кухни:", recipe.cuisine)

# Контроллер (Controller)
class RecipeController:
    def __init__(self, model, view):
        self.model = model
        self.view = view

    def get_recipe(self):
        # Логика получения рецепта из базы данных или другого источника
        return self.model

    def update_recipe(self, recipe):
        # Логика обновления рецепта в базе данных или другом источнике
        self.model = recipe

    def display_recipe(self):
        recipe = self.get_recipe()
        self.view.display_recipe(recipe)

# Клиентский код
model = Recipe("Пирог с яблоками", "Иван Иванов", "Изумительный пирог с сочными яблоками",  ["яблоки", "мука", "сахар"], "русская кухня")
view = RecipeView()
controller = RecipeController(model, view)

controller.display_recipe()