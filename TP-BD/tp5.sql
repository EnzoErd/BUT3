CREATE (d1:Drinker {name:'Nils', sexe:'M', age:30}),
(d2:Drinker {name:'Bob', sexe:'M', age:25}),
(d3:Drinker {name:'Alice', sexe:'F', age:26}),
(d4:Drinker {name:'Marie', sexe:'F', age:24}),
(d5:Drinker {name:'Tom', sexe:'M', age:30}),
(d6:Drinker {name:'Barbara', sexe:'F', age:30}),
(d7:Drinker {name:'Peter', sexe:'M', age:31}),
(d8:Drinker {name:'Agripine', sexe:'F', age:31}),
(d9:Drinker {name:'Marc', sexe:'M', age:42}),
(d10:Drinker {name:'Jane', sexe:'F', age:40}),

(b1:Beer {name: 'Antarctica', type: 'pilsen'}),
(b2:Beer {name: 'Corona', type: 'lager'}),
(b3:Beer {name: 'Guinness', type: 'stout'}),
(b4:Beer {name: 'Bohemia', type: 'pilsen'}),
(b5:Beer {name: 'Leffe', type: 'abbaye'}),
(b6:Beer {name: 'Grimbergen', type: 'abbaye'}),
(c1: Bar {name: 'Ipanema', city:'Orleans',  rating_hygiene:5, rating_service:3}),
(c2: Bar {name: 'Brasil', city:'Paris',  rating_hygiene:5, rating_service:5}),
(c3: Bar {name: 'Lilas', city:'Paris',  rating_hygiene:3, rating_service:4}),
(c4: Bar {name: 'La Gare', city:'Orleans',  rating_hygiene:3, rating_service:2}),
(c5: Bar {name: 'Le bouillon', city:'Paris',  rating_hygiene:3, rating_service:3}),
(c6: Bar {name: 'Le syndicat', city:'Paris',  rating_hygiene:5, rating_service:5}),
(c7: Bar {name: 'La Coupole', city:'Paris',  rating_hygiene:4, rating_service:5}),
(c8: Bar {name: 'Lipp', city:'Paris',  rating_hygiene:4, rating_service:5}),
(c9: Bar {name: 'La Closerie de Lilas', city:'Paris',  rating_hygiene:4, rating_service:5}),

(cat1:Category {name: 'hygiene'}),
(cat2:Category {name: 'service'}),

(d1) -[:Likes]-> (b1),
(d1) -[:Likes]-> (b4),
(d2) -[:Likes]-> (b4),
(d3) -[:Likes]-> (b3),
(d3) -[:Likes]-> (b2),
(d4) -[:Likes]-> (b1),
(d4) -[:Likes]-> (b2),
(d4) -[:Likes]-> (b3),
(d4) -[:Likes]-> (b4),
(d4) -[:Likes]-> (b5),
(d4) -[:Likes]-> (b6),
(d10) -[:Likes]-> (b6),
(d9) -[:Likes]-> (b5),
(d9) -[:Likes]-> (b6),
(d9) -[:Likes]-> (b3),
(d9) -[:Likes]-> (b6),
(d7) -[:Likes]-> (b2),
(d6) -[:Likes]-> (b6),
(d6) -[:Likes]-> (b1),


(c1) -[:Sells]-> (b1),
(c1) -[:Sells]-> (b2),
(c1) -[:Sells]-> (b4),
(c2) -[:Sells]-> (b1),
(c2) -[:Sells]-> (b2),
(c2) -[:Sells]-> (b4),
(c3) -[:Sells]-> (b2),
(c4) -[:Sells]-> (b3),
(c5) -[:Sells]-> (b2),
(c5) -[:Sells]-> (b3),
(c6) -[:Sells]-> (b5),
(c6) -[:Sells]-> (b6),
(c7) -[:Sells]-> (b5),
(c7) -[:Sells]-> (b6),
(c8) -[:Sells]-> (b5),
(c8) -[:Sells]-> (b6),
(c9) -[:Sells]-> (b5),
(c9) -[:Sells]-> (b6),
(c9) -[:Sells]-> (b3),


(d1) -[:Goes {startYear:2022, weekF:4}]-> (c1),
(d1) -[:Goes {startYear:2021, weekF:2}]-> (c3),
(d2) -[:Goes {startYear:2020, weekF:3}]-> (c1),
(d2) -[:Goes {startYear:2022, weekF:2}]-> (c3),
(d1) -[:Goes {startYear:2023, weekF:4}]-> (c2),
(d3) -[:Goes {startYear:2021, weekF:5}]-> (c2),
(d4) -[:Goes {startYear:2021, weekF:6}]-> (c2),
(d8) -[:Goes {startYear:2021, weekF:2}]-> (c4),
(d7) -[:Goes {startYear:2021, weekF:2}]-> (c4),
(d9) -[:Goes {startYear:2021 ,weekF:7}]-> (c7),
(d10) -[:Goes {startYear:2021 ,weekF:7}]-> (c8),
(d10) -[:Goes {startYear:2021 ,weekF:7}]-> (c9),


(d1)-[:FriendOf]->(d2),
(d2)-[:FriendOf]->(d3),
(d3)-[:FriendOf]->(d6),
(d3)-[:FriendOf]->(d7),
(d6)-[:FriendOf]->(d7),
(d5)-[:FriendOf]->(d4),
(d4)-[:FriendOf]->(d5),
(d3)-[:FriendOf]->(d10),
(d6)-[:FriendOf]->(d9)




-- 1. Listez les buveurs qui aiment la bière Bohemia ou qui vont dans des bar à Orléans.
MATCH  (c1: Bar)<-[:Goes]-(d:Drinker)-[:Likes]-> (b1:Beer) WHERE b1.name = 'Bohemia' or c1.city='Orleans' RETURN d;

-- 2. Litez les buveurs qui aiment la bière Bohemia et la bière Corona.
MATCH   (b2:Beer)<-[:Likes]-(d:Drinker)-[:Likes]-> (b1:Beer) WHERE b1.name = 'Bohemia' and b2.name = 'Corona' RETURN d;


-- 3. Listez les buveurs (drinkers) qui fréquentent un bar vendant une bière qu’ils aiment.
-- Le résultat doit être dans la forme : nom du buveur, nom de la bière, nom du bar.
MATCH  (b2:Beer)<-[:Sells]-(c1: Bar)<-[:Goes]-(d:Drinker)-[:Likes]->(b1:Beer) WHERE b1.name=b2.name RETURN d.name, b1.name, c1.name;

-- 4. Donnez l’age moyen des buveurs de bière.
MATCH (d:Drinker) RETURN avg(d.age)

-- 5. Donnez l’age moyen des buveurs, par catégorie (homme/femme).
MATCH (d:Drinker) RETURN d.sexe,avg(d.age)

-- 6. Donnez l’age moyen des buveurs de plus de 30 ans par catégorie (homme/femme).
MATCH (d:Drinker) WHERE d.age>30 RETURN d.sexe,avg(d.age)

-- 7. Donnez l’ˆage maximal, minimum et moyen des buveurs de bière.
MATCH (d:Drinker) RETURN min(d.age),avg(d.age),max(d.age)


-- 8. Pour chaque buveur, affichez le nombre de bars qu’il fréquente et le nombre de bières
-- qu’il aime.
MATCH (c1:Bar)<-[:Goes]-(d:Drinker) WITH d.name AS drinker, count(c1) AS bar 
MATCH (d:Drinker)-[:Likes]->(b1:Beer) RETURN d.name, count(b1), bar



-- 9. Pour chaque buveur, donnez la liste des bières qu’il aime.

-- 10. Pour chaque bière, indiquez le nombre de buveurs qui l’aime

-- 11. Affichez le nom de la bière la plus populaire et son indice de popularité (= nombre
-- total de buveurs qui l’aiment)

-- 12. Affichez le nom des bières dont l’indice de popularité est supérieur à 2

-- 13. Pour chaque buveur, affichez le nombre de bars qu’il visite par semaine (en supposant
-- que toutes les visites habituelles sont faites).

-- 14. Nous partons du principe que chaque fois qu’une personne se rend dans un bar, elle
-- consomme en moyenne 3 bières. Pour chaque buveur, affichez le nombre de bières
-- consommées, en supposant que toutes les visites habituelles sont faites.

-- 15. Même question que la précédente, mais affichez seulement les 3 personnes que boivent
-- le plus.

-- 16. Soient les buveurs ayant au moins 30 ans. Considérez toujours que la consommation
-- moyenne de base pour une personne est de 3 bières par bar. Affichez leur moyenne
-- d’age ainsi que la moyenne de leur consommation hebdomadaire de bière.

-- 17. Listez les noms des bars de la ville de Paris qui vendent la bière Corona mais ne
-- vendent pas la bière Antactica.

-- 18. Listez les noms des bars qui vendent seulement la bière Corona.

-- 19. Affichez les buveurs qui fréquentent des bars qui vendent AU MOINS une bière qu’il
-- n’aime pas.

-- 20. Affichez les buveurs qui fréquentent des bars qui vendent seulement des bières qu’il
-- n’aime pas.

-- 21. Affichez les buveurs qui aiment TOUTES les bières.

-- 22. Affichez les buveurs de bières qui ne fréquentent aucun bar. Ils préfèrent boire à la
-- maison.

-- 23. Affichez les noms des buveurs (deux à deux) qui ne risquent pas de se rencontrer, car
-- bien qu’ils fréquentent un bar, ils ne fréquentent aucun bar en commun. Ordonnez le
-- résultat de manière à être facile à lire, en supprimant des résultats équivalents.

-- 24. Affichez pour chaque 2 personnes dans la base, la façon la plus courte de faire connais-
-- sance en passant par le réseaux d’amitiés. Autrement dit, le chemin de longueur
-- supérieur à 1 entre deux personnes dans le réseaux d’amitiés.

-- 25. Pour chaque bar dans la base, affichez la sortie dans le format suivant, en lui attribuant
-- la note 10. Passez par la construction d’une liste et ensuite utilisez UNWIND.

