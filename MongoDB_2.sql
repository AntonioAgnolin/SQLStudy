db.NeoFrota.insertOne({
modelo: "Ford Ka",
placa: "ABN5T89",
data_aquisicao: "28-02-2020",
ano_frabricao: "2016",
quilometragem: "17350"
});

db.NeoFrota.insertOne({
modelo: "VW Gol",
placa: "JEI4E54",
data_aquisicao: "15-05-2020",
ano_frabricao: "2018",
quilometragem: "65500"
});

db.NeoFrota.insertOne({
modelo: "Chevrolet Onix",
placa: "NTF7R45",
data_aquisicao: "01-10-2019",
ano_frabricao: "2018",
quilometragem: "75650"
});

db.NeoFrota.insertOne({
modelo: "Fiat Argo",
placa: "JHR9T34",
data_aquisicao: "28-02-2020",
ano_frabricao: "2016",
quilometragem: "85500"
});

db.NeoFrota.insertOne({
modelo: "Peugeot 208",
placa: "RVI7Y69",
data_aquisicao: "28-02-2020",
ano_frabricao: "2018",
quilometragem: "77570"
});

db.NeoFrota.insertOne({
nome: "Cláudio Ferreira",
email: "clferreira@email.com",
senha: "46578",
telefone: "991080287",
data_contratacao: "21-03-2021"
});

db.NeoFrota.insertOne({
nome: "Regina Marques",
email: "regmarques@email.com",
senha: "85643",
telefone: "991080287",
data_contratacao: "28-02-2020"
});

db.NeoFrota.insertOne({
nome: "Hugo Tavares",
email: "hugotav@email.com",
senha: "76497",
telefone: "991080287",
data_contratacao: "19-05-2019"
});

db.NeoFrota.insertOne({
nome: "Juliana Martins",
email: "jumartins@email.com",
senha: "09786",
telefone: "991080287",
data_contratacao: "14-04-2018"
});

db.NeoFrota.insertOne({
nome: "Fabrício Limeira",
email: "fablimeira@email.com",
senha: "57463",
telefone: "991080287",
data_contratacao: "18-03-2019"
});

db.createCollection("Carros", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["modelo", "ano_fabricacao"],
      properties: {
        modelo: {
          bsonType: "string",
          minLength: 3
        },
        placa: {
          bsonType: "string",
          pattern: "^[A-Z]{3}[0-9]{1}[A-Z]{1}[0-9]{2}$" 

        },
        ano_fabricacao: {
          bsonType: "int",
          minimum: 1980,
          maximum: 2025
        },
        quilometragem: {
          bsonType: "int",
          minimum: 0
        }
      }
    }
  }
});

db.createCollection("NeoFrota", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["nome", "email", "senha", "telefone", "data_contratacao"],
      properties: {
        nome: {
          bsonType: "string"
        },
        email: {
          bsonType: "string",
          pattern: "^\\S+@\\S+\\.\\S+$"
        },
        senha: {
          bsonType: "string",
          minLength: 5
        },
        telefone: {
          bsonType: "string",
          pattern: "^[0-9]{9}$"
        },
        data_contratacao: {
          bsonType: "string",
          pattern: "^[0-9]{2}-[0-9]{2}-[0-9]{4}$"
        }
      }
    }
  }
});
