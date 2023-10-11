CREATE 
(neo4j:Me:User{name:'Neo4J',location:'Graph Are Everywhere',followers:34507}),


(u1:User{name:'Pierre Lindenbaum',location:'Nantes, France',followers:5545}),
(u2:User{name:'Michael Hunger',location:'Dresden, Germany',followers:5161}),
(u3:User{name:'Kesavan Nair',location:'London, England',followers:647}),
(u4:User{name:'Fireball',location:'Senderwood, South Africa',followers:3432}),
(u5:User{name:'Joshua Tcode',location:'Lagos, Nigeria',followers:8768}),
(u6:User{name:'Emily Raun-Petersen',location: 'London, England',followers:3453}),
(u7:User{name:'Enrico Domenis',location:'Torino, Italy',followers:1109}),
(u8:User{name:'Eva Agrawal',location:'Bristol, England',followers:3242}),
(u9:User{name:'Emma Vestesson',location:'Paris, France',followers:3242}),
(u10:User{name:'Edowardo MD',location:'Paris, France',followers:3242}),


(u1)-[:FOLLOWS]->(neo4j),
(u2)-[:FOLLOWS]->(neo4j),
(u3)-[:FOLLOWS]->(neo4j),
(u6)-[:FOLLOWS]->(neo4j),
(u7)-[:FOLLOWS]->(neo4j),
(u8)-[:FOLLOWS]->(neo4j),
(u9)-[:FOLLOWS]->(neo4j),


(neo4j)-[:FOLLOWS]->(u1),
(neo4j)-[:FOLLOWS]->(u3),
(neo4j)-[:FOLLOWS]->(u4),
(neo4j)-[:FOLLOWS]->(u5),
(neo4j)-[:FOLLOWS]->(u6),


(t1:Tweet{text:'@insideBigData features Neo4js recently appointed VP of People, Kristin Thornby,initslatestnewsroundup.Link…https://t.co/XCnGFTld9M',favorites:452,created_at:datetime('2021-04-02T10:23:32.122+0100')}),
(t2:Tweet{text:'[Virtual Event] Connections: Graphs for Cybersecurity in APAC 1 April 2021 at 9 a.m. IST | 11:30 a.m. SGT/HKT | 2:… https://t.co/xNVwykxare',favorites:675,created_at:datetime('2021-06-06T10:23:32.122+0100')}),
(t3:Tweet{text:'Today is my day! Deal of the Day March 14: Half off my book Graph-Powered Machine Learning and selected titles:… https://t.co/JGXYroA2xu',favorites:2342,created_at:datetime('2021-03-05T10:23:32.122+0100')}),
(t4:Tweet{text:'Proud to help @educationgovuk deliver critical services across the #education sector with #Neo4jAuraEnterprise!',favorites:9789,created_at:datetime('2021-02-22T10:23:32.122+0100')}),
(t5:Tweet{text:'Open data API of #Politikus provides data researchers and journalists data to investigate and analyse complicated r… https://t.co/RBP925OoxI',favorites:234,created_at:datetime('2020-04-05T10:23:32.122+0100')}),


(t6:Tweet{text:'[Live Demo] Graph Algorithms Playground – Asia Pac Edition',favorites:675,created_at:datetime('2021-01-18T10:23:32.122+0100')}),
(t7:Tweet{text:'[Webinar] Graph Data Science with #Neo4j – Italy',favorites:241,created_at:datetime('2020-03-08T10:23:32.122+0100')}),
(t8:Tweet{text:'Is there an updated version of Neo4r library? The version I have does not call the @neo4j api in R Studio, even aft… https://t.co/IukVhlaTwg',favorites:5675,created_at:datetime('2021-02-12T10:23:32.122+0100')}),
(t9:Tweet{text:'Really great application of graphs for investigative journalism. Thanks so much for sharing!! https://t.co/sgyYU5Z3zp',favorites:4564,created_at:datetime('2020-08-07T10:23:32.122+0100')}),
(t10:Tweet{text:'New York-Presbyterian Hospital used graph data to proactively identify and contain diseases before they spread.…',favorites:765,created_at:datetime('2021-08-22T10:23:32.122+0100')}),


(h1:Hashtag{name:'apoc'}),
(h2:Hashtag{name:'bigdata'}),
(h3:Hashtag{name:'ml'}),


(neo4j)-[:POSTS]->(t10)-[:TAGS]->(h1),
(neo4j)-[:POSTS]->(t9)-[:TAGS]->(h2),
(neo4j)-[:POSTS]->(t8)-[:TAGS]->(h1),
(neo4j)-[:POSTS]->(t7)-[:TAGS]->(h1),
(neo4j)-[:POSTS]->(t6)-[:TAGS]->(h3),
(u1)-[:POSTS]->(t5)-[:TAGS]->(h2),
(u3)-[:POSTS]->(t4)-[:TAGS]->(h3),
(u2)-[:POSTS]->(t3)-[:TAGS]->(h2),
(u4)-[:POSTS]->(t2)-[:TAGS]->(h2),
(u1)-[:POSTS]->(t1)-[:TAGS]->(h1),


(s1:Source{name:'Twitter for iPhone'}),
(s2:Source{name:'TweetDeck'}),
(s3:Source{name:'Twitter Web App'}),


(t1)-[:USING]->(s1),
(t2)-[:USING]->(s1),
(t3)-[:USING]->(s2),
(t4)-[:USING]->(s1),
(t5)-[:USING]->(s3),
(t6)-[:USING]->(s1),
(t7)-[:USING]->(s3),
(t8)-[:USING]->(s2),
(t9)-[:USING]->(s1),
(t10)-[:USING]->(s2),


(l1:Link{url:'http://neo4j-contrib.github.io/cypher-dsl/current/#2021.1'}),
(l2:Link{url:'https://github.com/neo4j-contrib/cypher-dsl/releases/tag/2021.0.0'}),
(l3:Link{url:'https://twitter.com/i/web/status/1371815021265747970'}),
(l4:Link{url:'https://buff.ly/3chVnMM'}),
(l5:Link{url:'http://neo4j.com/aura/free'}),


(t1)-[:CONTAINS]->(l1),
(t2)-[:CONTAINS]->(l2),
(t3)-[:CONTAINS]->(l3),
(t4)-[:CONTAINS]->(l4),
(t5)-[:CONTAINS]->(l5),
(t6)-[:CONTAINS]->(l4),
(t7)-[:CONTAINS]->(l3),
(t8)-[:CONTAINS]->(l2),
(t9)-[:CONTAINS]->(l1),
(t10)-[:CONTAINS]->(l5)


MATCH(n) detach delete n

match(n) return n


-- 1. Listez l'identifiant et le nom des abonnés de Neo4J
MATCH (u:User)-[:FOLLOWS]->(neo4j:Me:User);

-- 2. Affichez l'emplacement (location) des abonnés de Neo4J.

-- 3. Affichez les noms et les emplacements des utilisateurs basés en France.

-- 4. Affichez tous les tweets de Neo4J qui contiennent le hashtag 'apoc'.

-- 5. Listez les utilisateurs qui font référence à Twitter Web App

-- 6. Fournissez le nombre d'utilisateurs pour chaque ville en Angleterre (cest-à-dire, le champ de localisation doit contenir 'england').

-- 7. Indiquez le nombre de tweets concernant Neo4J pendant la première moitié de 2021.

-- 8. Affichez le nombre de tweets tweetés par Neo4J chaque mois pour chaque année, trié par le nombre de tweets.

-- 9. Qui est l'utilisateur ayant le plus grand nombre d'abonnés ?

-- 10. Affichez le nombre total de favoris des tweets de Neo4J

-- 11. Fournissez les noms des utilisateurs dont le nom commence par 'E', triés par ordre alphabétique.

-- 12. Fournissez les noms des utilisateurs qui ne se terminent pas par 'd'.

-- 13. Fournissez les URLs des liens commençant par 'http' et contenant 'github' dans leur adresse (utilisez une expression régulière pour définir la chaîne de caractèresrecherchée).

-- 14. Indiquez parmi les utilisateurs 'Pierre Lindenbaum', 'Michael Hunger' et 'Peter Web-ber' ceux que Neo4J suit.

-- 15. Listez les utilisateurs qui ne suivent pas Neo4J.

