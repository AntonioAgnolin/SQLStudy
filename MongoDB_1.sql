1. Calcular a quantidade total de restaurantes no conjunto de dados.
db.restaurante.find().count();

2. Encontrar os restaurantes com classificação "A" em uma determinada cozinha.
db.restaurante.find({"cuisine":"Italian","grades.grade":"A"});

3. Calcular a média de avaliação (score) dos restaurantes em cada bairro.
db.restaurante.aggregate([{$group:{_id:"$borough",mediaAvaliacao:{$avg:"$score"}}}]);

4. Calcular a quantidade de restaurantes em cada categoria de cozinha.
db.restaurante.aggregate([{$group:{_id:"$cuisine",count:{$sum:1}}}]);

5. Calcular a quantidade de restaurantes por bairro e por cozinha.
db.restaurante.aggregate([{$group:{_id:{cuisine:"$cuisine",borough:"$borough"},count:{$sum:1}}}]);

6. Encontrar os restaurantes que estão abertos às segundas-feiras.
db.restaurante.aggregate([{$match:{"hours.Monday":{$ne:null}}}]);

7. Encontrar os restaurantes que possuem uma determinada palavra-chave em seu nome.
db.restaurante.aggregate([{$match:{name:/Yogurt/}}]);

8. Encontrar todos os restaurantes localizados em um bairro específico.
db.restaurante.aggregate([{$match:{borough:"Brooklyn"}}]);

9. Encontrar os restaurantes que possuem uma cozinha específica.
db.restaurante.aggregate([{$match:{cuisine:"Japanese"}}]);

10. Encontrar os restaurantes que têm uma classificação (grade) específica.
db.restaurante.aggregate([{$match:{grade:"A"}}]);

11. Encontrar os restaurantes que possuem um determinado código de inspeção.
db.restaurante.aggregate([{$match:{inspectionCode:"06C"}}]);

12. Encontrar os restaurantes que possuem uma avaliação com uma determinada pontuação.
db.restaurante.aggregate([{$match:{"grades.score":12}}]);

13. Encontrar os restaurantes que possuem uma avaliação com uma pontuação superior a um valor específico.
db.restaurante.aggregate([{$match:{"grades.score":{$gt:12}}}]);

14. Encontrar os restaurantes que possuem uma avaliação com uma pontuação entre dois valores específicos.
db.restaurante.find({"grades.score":{$gte:8,$lte:12}});

15. Calcular o número total de restaurantes em cada bairro.
db.restaurante.aggregate([{$group:{_id:"$borough",count:{$sum:1}}}]);

16. Calcular a contagem de restaurantes por cozinha.
db.restaurante.aggregate([{$group:{_id:"$cuisine",count:{$sum:1}}}]);

17. Calcular a média de pontuação (score) de cada cozinha de restaurante.
db.restaurante.aggregate([{$unwind:"$grades"},{$group:{_id:"$cuisine",mediaScore:{$avg: "$grades.score"}}}]);

18. Calcular a soma total de pontuações (score) de cada bairro.
db.restaurante.aggregate([{$unwind:"$grades"},{$group:{_id:"$borough",somaScore:{$sum: "$grades.score"}}}]);

19. Calcular a contagem de restaurantes por classificação (grade).
db.restaurante.aggregate([{$unwind:"$grades"},{$group:{_id:"$grades.grade",count:{$sum:1}}}]);

20. Calcular a contagem de restaurantes por cozinha, considerando apenas os restaurantes com cozinha italiana.
db.restaurante.aggregate([{$match:{cuisine:"Italian"}},{$group:{_id:"$cuisine",count:{$sum:1}}}]);

21. Encontrar a média de pontuação (score) de cada cozinha de restaurante, considerando apenas os restaurantes com pontuação maior que 8.
db.restaurante.aggregate([{$unwind:"$grades"},{$match:{"grades.score":{$gt:8}}},{$group:{_id:"$cuisine",avgScore:{$avg:"$grades.score"}}}]);

22. Calcular a soma total de pontuações (score) de cada bairro, considerando apenas os restaurantes com pelo menos uma avaliação "A".
db.restaurante.aggregate([{$unwind:"$grades"},{$match:{"grades.grade":"A"}},{$group:{_id:"$cuisine",somaScore:{$sum:"$grades.score"}}}]);

23. Encontrar a menor pontuação (score) em cada bairro, considerando apenas os restaurantes de Manhattan.
db.restaurante.aggregate([{$match:{borough:"Manhattan"}},{$group:{_id:"$borough",menorScore:{$min:"$grades.score"}}}]);

24. Calcular a média de pontuação (score) por ano de inspeção, considerando apenas os restaurantes com inspeções em 2020.
db.restaurante.aggregate([{$match:{"grades.date":{$gte:ISODate("2020-01-01"),$lte:ISODate("2020-12-31")}}},{$group:{_id:{$year:"$grades.date"},avgScore:{$avg:"$grades.score"}}}]);

25. Calcular a média de pontuação (score) para cada combinação de bairro e cozinha de restaurante, considerando apenas os restaurantes de Manhattan.
db.restaurante.aggregate([{$unwind:"$grades"},{$match:{borough:"Manhattan"}},{$group:{_id:{borough:"$borough",cuisine:"$cuisine"},avgScore:{$avg:"$grades.score"}}}]);

