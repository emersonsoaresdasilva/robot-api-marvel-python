# Cria massa de testes, utilizando a biblioteca faker
# from faker import Faker
# faker = Faker()

def factory_star_lord():
    return {
            "name": "Peter Quill",
            "aliases": "Star Lord",
            "age": 30,
            "team": "Guardians of the Galaxy",
            "active": True
        }

def factory_groot():
    return{
            "name": "Groot",
            "aliases": "Groot",
            "age": 29,
            "team": "Guardians of the Galaxy",
            "active": True
        }

def factory_deadpool():
    return {
            "name": "Wade Wilson",
            "aliases": "Deadpool",
            "age": 40,
            "team": "X Force",
            "active": False
        }

def factory_thanos():
    return {
            "name": "Thanos de Titã",
            "aliases": "Thanos",
            "age": 3000,
            "team": "Ordem Negra",
            "active": False
        }