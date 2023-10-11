CREATE (p1:Person {name:'Lia', sexe:'F', age:65}),
(p2:Person {name:'Nils', sexe:'M', age:30}),
(p3:Person {name:'Ana', sexe:'F', age:27}),
(p4:Person {name:'Alice', sexe:'F', age:10}),
(p5:Person {name:'Mia', sexe:'F', age:4}),
(p6:Person {name:'Mario', sexe:'M', age:72}),
(p7:Person {name:'Antonia', sexe:'F', age:42}),
(p8:Person {name:'Peter', sexe:'M', age:35}),
(p9:Person {name:'Tom', sexe:'M', age:37}),
(p10:Person {name:'Chiara', sexe:'F', age:22}),
(p11:Person {name:'Lisette', sexe:'F', age:1}),
(p12:Person {name:'Mary', sexe:'F', age:10}),
(p13:Person {name:'Amelia', sexe:'F', age:14}),
(p14:Person {name:'Bob', sexe:'M', age:24}),
(p15:Person {name:'Thomas', sexe:'M', age:3}),
(p1) -[:isParentOf]-> (p2),
(p1) -[:isParentOf]-> (p3),
(p2) -[:isParentOf]-> (p4),
(p3) -[:isParentOf]-> (p5),
(p6) -[:isParentOf]-> (p7),
(p6) -[:isParentOf]-> (p8),
(p6) -[:isParentOf]-> (p9),
(p7) -[:isParentOf]-> (p10),
(p10) -[:isParentOf]-> (p11),
(p8) -[:isParentOf]-> (p12),
(p9) -[:isParentOf]-> (p13),
(p7) -[:isParentOf]-> (p14),
(p14) -[:isParentOf]-> (p15)

-- 1
MATCH(p:Person)-[:isParentOf]->(p2:Person) WHERE p2.name = 'Lisette' return p

-- 2
MATCH(p:Person)-[:isParentOf*2..2]->(p2:Person) WHERE p2.name = 'Lisette' return p

-- 3
MATCH(p:Person)-[:isParentOf*]->(p2:Person) WHERE p2.name = 'Lisette' return p

-- 4
MATCH (e2:Person)<-[:isParentOf]-(p1:Person)-[:isParentOf]->(e1:Person) return e1.name, e2.name, p1.name

-- 5
MATCH (e2:Person)<-[:isParentOf*]-(p1:Person)-[:isParentOf*]->(e1:Person) return e1.name, e2.name, p1.name

-- 6
MATCH path=(m)<-[:isParentOf*]-(p) return m.name, p.name, length(path)

-- 7
MATCH path=(m)-[:isParentOf*]-(p) return m.name, p.name, length(path)

-- 8
MATCH (e2:Person)<-[:isParentOf*2..2]-(p1:Person)-[:isParentOf*2..2]->(e1:Person) return DISTINCT e2.name, e1.name

-- 9
MATCH p=(n)-[*]-(m) return n,m,length(p)

-- 10
MATCH p=(n)-[*]-(m) where (length(p)%2)=0 return n,m,length(p)

-- 11
MATCH p=(n)-[*]-(m) where (length(p)%2)<>0 return n,m,length(p)

match(n) return n
MATCH(n) detach delete n
