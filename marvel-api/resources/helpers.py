import bson

def get_unique_id():
    # Gerar um ID único automaticamente
    return bson.objectid.ObjectId()