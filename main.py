class Film:
    def __init__(self, title, director, description, year, actors, duration):
        self.title = title
        self.director = director
        self.description = description
        self.year = year
        self.actors = actors
        self.duration = duration

    def get_title(self):
        return self.title

    def get_director(self):
        return self.director

    def get_description(self):
        return self.description

    def get_year(self):
        return self.year

    def get_actors(self):
        return self.actors

    def get_duration(self):
        return self.duration
class FilmModel:
    def __init__(self):
        self.films = []

    def add_film(self, film):
        self.films.append(film)

    def get_films(self):
        return self.films

    def get_film_by_title(self, title):
        for film in self.films:
            if film.get_title() == title:
                return film
        return None

    def get_films_by_year(self, year):
        return [film for film in self.films if film.get_year() == year]
class FilmView:
    def print_film_details(self, film):
        print(f"Название: {film.get_title()}")
        print(f"Режиссер: {film.get_director()}")
        print(f"Описание: {film.get_description()}")
        print(f"Год выпуска: {film.get_year()}")
        print(f"Актеры: {', '.join(film.get_actors())}")
        print(f"Длительность: {film.get_duration()} мин")

    def print_films_by_year(self, films, year):
        print(f"Фильмы {year} года:")
        for film in films:
            print(f"Название: {film.get_title()}")
class FilmController:
    def __init__(self, model, view):
        self.model = model
        self.view = view

    def add_film(self, title, director, description, year, actors, duration):
        film = Film(title, director, description, year, actors, duration)
        self.model.add_film(film)

    def show_film_details(self, title):
        film = self.model.get_film_by_title(title)
        if film:
            self.view.print_film_details(film)
        else:
            print("Фильм не найден")

    def show_films_by_year(self, year):
        films = self.model.get_films_by_year(year)
        self.view.print_films_by_year(films, year)
def execute_application():
    model = FilmModel()
    view = FilmView()
    controller = FilmController(model, view)

    controller.add_film("Фильм 1", "Режиссер 1", "Описание 1", 2020, ["Актер 1", "Актер 2"], 120)
    controller.add_film("Фильм 2", "Режиссер 2", "Описание 2", 2021, ["Актер 3", "Актер 4"], 95)

    controller.show_film_details("Фильм 1")

    controller.show_films_by_year(2021)


if __name__ == '__main__':
    execute_application()