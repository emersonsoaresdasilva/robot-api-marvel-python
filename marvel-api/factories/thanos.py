# Cria massa de testes, utilizando a biblioteca faker
from faker import Faker
faker = Faker()

# Método para cadastro de personagem
def factory_thanos():
    return {
            "name": faker.name(),
            "aliases": "Thanos",
            "age": 3000,
            "team": "Ordem Negra",
            "active": False
        }