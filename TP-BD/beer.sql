CREATE (d1:Drinker {name:'Nils', sexe:'M', age:30}),
(d2:Drinker {name:'Bob', sexe:'M', age:25}),
(d3:Drinker {name:'Alice', sexe:'F', age:26}),
(d4:Drinker {name:'Marie', sexe:'F', age:24}),
(d5:Drinker {name:'Tom', sexe:'M', age:30}),
(d6:Drinker {name:'Barbara', sexe:'F', age:30}),
(d7:Drinker {name:'Peter', sexe:'M', age:31}),
(d8:Drinker {name:'Agripine', sexe:'F', age:31}),

(b1:Beer {name: 'Antarctica', type: 'pilsen'}),
(b2:Beer {name: 'Corona', type: 'lager'}),
(b3:Beer {name: 'Guinness', type: 'stout'}),
(b4:Beer {name: 'Bohemia', type: 'pilsen'}),
(c1: Bar {name: 'Ipanema', city:'Orleans',  rating_hygiene:5, rating_service:3}),
(c2: Bar {name: 'Brasil', city:'Paris',  rating_hygiene:5, rating_service:5}),
(c3: Bar {name: 'Lilas', city:'Paris',  rating_hygiene:3, rating_service:4}),
(c4: Bar {name: 'La Gare', city:'Orleans',  rating_hygiene:3, rating_service:2}),
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
(c1) -[:Sells]-> (b1),
(c1) -[:Sells]-> (b2),
(c1) -[:Sells]-> (b4),
(c2) -[:Sells]-> (b1),
(c2) -[:Sells]-> (b2),
(c2) -[:Sells]-> (b4),
(c3) -[:Sells]-> (b2),
(c4) -[:Sells]-> (b3),
(d1) -[:Goes {startYear:2022}]-> (c1),
(d1) -[:Goes {startYear:2021}]-> (c3),
(d2) -[:Goes {startYear:2020}]-> (c1),
(d2) -[:Goes {startYear:2022}]-> (c3),
(d1) -[:Goes {startYear:2023}]-> (c2),
(d3) -[:Goes {startYear:2021}]-> (c2),
(d4) -[:Goes {startYear:2021}]-> (c2),
(d8) -[:Goes {startYear:2021}]-> (c4),
(d1)-[:FriendOf]->(d2),
(d2)-[:FriendOf]->(d3),
(d3)-[:FriendOf]->(d6),
(d3)-[:FriendOf]->(d7),
(d6)-[:FriendOf]->(d7),
(d5)-[:FriendOf]->(d4),
(d4)-[:FriendOf]->(d5)


MATCH(n) detach delete n

match(n) return n


-- 1. Listez les buveurs (drinkers)
MATCH (d:Drinker) RETURN d;

-- 2. Listez les noms des buveurs.
MATCH (d:Drinker) RETURN d.name;

-- 3. Listez les identificateurs des buveurs.
MATCH (d:Drinker) RETURN ID(d);

-- 4. Listez le réseau de buveurs amis entre eux Le but ici est de pouvoir visualiser le réseau d’amitiés.
MATCH (d1:Drinker)-[:FriendOf]-(d2:Drinker) RETURN d1, d2;

-- 5. Meme question que la précédente, mais donnez les identificateurs des noeuds et desarcs.
MATCH (d1:Drinker)-[r:FriendOf]-(d2:Drinker) RETURN ID(d1), TYPE(r), ID(d2);

-- 6. Listez les noms des buveurs amis entre eux direct ou indirectement.
MATCH (d1:Drinker)-[:FriendOf*1..]-(d2:Drinker) RETURN d1.name, d2.name;

-- 7. Listez les noms des bières de type pilsen
MATCH (b:Beer) WHERE b.type = 'pilsen' RETURN b.name;

-- 8. Listez les noms des buveurs amis entre eux direct ou indirectement Cette liste ne doit pas indiquer un buveur comme ami de lui même.
MATCH (d1:Drinker)-[:FriendOf*1..]-(d2:Drinker) WHERE d1 <> d2 RETURN d1.name, d2.name;

-- 9. Listez les noms des buveurs (drinkers) qui aiment la bière Corona.
MATCH (d:Drinker)-[:Likes]->(b:Beer) WHERE b.name = 'Corona' RETURN d.name;

-- 10. Listez les noms des bars de la ville de Paris.
MATCH (c:Bar) WHERE c.city = 'Paris' RETURN c.name;

-- 11. Listez les noms des bars de la ville de Paris qui vendent de la bière Corona.
MATCH (c:Bar)-[:Sells]->(b:Beer) WHERE c.city = 'Paris' AND b.name = 'Corona' RETURN c.name;

-- 12. Listez les noms des bars de la ville de Paris qui vendent la bière Corona ou Antactica.
MATCH (c:Bar)-[:Sells]->(b:Beer) WHERE c.city = 'Paris' AND (b.name = 'Corona' OR b.name = 'Antarctica') RETURN c.name;

-- 13. Listez les noms des buveuses (seulement les femmes) qui fréquentent des bars à Paris.
MATCH (d:Drinker)-[:Goes]->(c:Bar) WHERE d.sexe = 'F' AND c.city = 'Paris' RETURN d.name;

-- 14. Listez les noms des buveuses (seulement les femmes) qui fréquentent des bars à Paris et aiment la bière Bohemia.
MATCH (x:Beer)<-[:Likes]-(d:Drinker)-[:Goes]->(b:Bar) where d.sexe = 'F' and b.city= 'Paris' and x.name = 'Corona' return  d.name

-- 15. Listez les noms des bar ayant un rating supérieur à 3 dans au moins une catégorie. Utiliser l’operateur 1 []Le résultat ne doit pas avoir des doublons.
MATCH (c:Bar) WHERE ANY(category IN ['hygiene', 'service'] WHERE c['rating_' + category] > 3) RETURN DISTINCT c.name;

-- 16. Pour chaque bar indiquez son rating moyen.
MATCH (c:Bar) RETURN c.name, (c.rating_hygiene + c.rating_service) / 2 AS average_rating;

-- 17. Listez les noms des bar ayant, toutes catégories confondues, un rating moyen supérieur à 4.
MATCH (c:Bar) WITH c, (c.rating_hygiene + c.rating_service) / 2 AS average_rating WHERE average_rating > 4 RETURN c.name;

-- 18. Affichez les noms des buveurs de mani`ere ordonn´ee, par age, et sexe.
MATCH (n:Drinker) RETURN n.name ORDER BY n.name, n.sexe, n.age;

-- 19. Listez les buveurs et les bars qu’ils fr´equentent. Ordonnez le r´esultat selon l’ann´ee ded´ebut de fr´equentation.


-- 20. Listez les personnes qui fr´equentent un bar depuis 2022.


-- 21. Affichez les buveurs qui fr´equentent le mˆeme bar.


-- 22. Listez les personnes qui ont des liens d’amiti´es avec des buveurs aimant la bi`ereAntarctica ou leurs amis.


-- 23. Le bar ’Brasil’ souhaite faire une fˆete et inviter tous les amis des personnes qui lefrequentent. Faites une requˆete pour informer qui sont ces personnes.


-- 24. Mˆeme question que la pr´ec´edente, mais en affichant les ’chemins d’amiti´es’.


-- 25. Donnez les noms des buveurs commen¸cant avec la lettre B et ayant un deuxi`eme bdans leur noms (utilisez une expression r´eguli`ere pour d´efinir la chaˆıne de caract`eresrecherch´ee).

