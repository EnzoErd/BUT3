-- create
--     (Clint:Person {name:'Clint eastwood',gender:'male'}),
--     (Anna:Person {name:'Anna Levine',gender:'female'}),
--     (Unforgiven:Movie {title:'Unforgiven'}),
--     (Peter:Person {name:'Peter Seller',gender:'female'}),
--     (Strangelover:Movie {title:'Dr. Stranglover'}),
--     (Clint)-[:ACTED_IN {role:'Bill',ref:'IMDb'}]->(Unforgiven),
--     (Clint)-[:directs]->(Unforgiven),
--     (Anna)-[:ACTED_IN {role:'Debilah',ref:'IMDb'}]->(Unforgiven),
--     (Peter)-[:ACTED_IN {role:'Lionel Mendrake',ref:'IMDb',Duration:'18min'}]->(Strangelover),
--     (Peter)-[:ACTED_IN {role:'Merkin Muffley',ref:'IMDb',Duration:'34min'}]->(Strangelover)

MATCH(n) detach delete n
create
    (Viande:Cate {titre:'Viande'}),
    (Oiseaux:Cate {titre:'Oiseaux'}),
    (Reste:Cate {titre:'Reste'}),
    (White:Produit {titre:'White',desc:'Vengue El Hadj Omar Bongo Ondimba International Airport',prix:39,dispo:57,expe:'True'}),
    (Coqui:Produit {titre:'Coqui',desc:'Misratah Airport',prix:36,dispo:36,expe:'False'}),
    (Tawny:Produit {titre:'Tawny',desc:'Eilat Airport',prix:68,dispo:100,expe:'True'}),
    (Macaw:Produit {titre:'Macaw',desc:'Yecheon Airbase',prix:77,dispo:47,expe:'False'}),
    (Glider:Produit {titre:'Glider',desc:'Borg El Arab International Airport',prix:99,dispo:13,expe:'True'}),
    (Cow:Produit {titre:'Cow',desc:'Labo Airport',prix:91,dispo:72,expe:'True'}),
    (Carpet:Produit {titre:'Carpet',desc:'Växjö Kronoberg Airport',prix:54,dispo:83,expe:'True'}),
    (Bulbul:Produit {titre:'Bulbul',desc:'Atlantic Municipal Airport',prix:41,dispo:45,expe:'True'}),
    (Nighthawk:Produit {titre:'Nighthawk',desc:'Nantucket Memorial Airport',prix:60,dispo:14,expe:'False'}),
    (Shrike:Produit {titre:'Shrike',desc:'Ninoy Aquino International Airport',prix:72,dispo:48,expe:'True'}),
    (Clea:Client {nom:'Clea',email:'mborrowman0@hhs.gov',dateEnregistement:'11/12/2022'}),
    (Lia:Client {nom:'Lia',email:'mjohannes1@un.org',dateEnregistement:'09/18/2023'}),
    (Annie:Client {nom:'Annie',email:'bgross2@163.com',dateEnregistement:'06/5/2023'}),
    (Mae:Client {nom:'Mae',email:'sormistone3@surveymonkey.com',dateEnregistement:'04/23/2023'}),
    (Lulu:Client {nom:'Lulu',email:'mkarpman4@buzzfeed.com',dateEnregistement:'08/23/2023'}),
    (Lulu)-[:WISHLIST]->(Cow),
    (Lia)-[:WISHLIST]->(Carpet),
    (Clea)-[:WISHLIST]->(Tawny),
    (Annie)-[:CLICK {nbClick: 15}]->(Nighthawk),
    (Mae)-[:CLICK {nbClick: 25}]->(Shrike),
    (Lia)-[:CLICK {nbClick: 4}]->(Macaw),
    (Lia)-[:ACHETER {nbACHETER:15}]->(Carpet),
    (Annie)-[:ACHETER {nbACHETER: 1}]->(Cow),
    (Lia)-[:ACHETER {nbACHETER: 91}]->(Bulbul),
    (Mae)-[:ACHETER {nbACHETER: 15}]->(Glider),
    (Lulu)-[:ACHETER {nbACHETER: 31}]->(Tawny),
    (White)-[:APPARTIENT]->(Viande),
    (Coqui)-[:APPARTIENT]->(Viande),
    (Tawny)-[:APPARTIENT]->(Viande),
    (Macaw)-[:APPARTIENT]->(Viande),
    (Glider)-[:APPARTIENT]->(Oiseaux),
    (Cow)-[:APPARTIENT]->(Reste),
    (Carpet)-[:APPARTIENT]->(Reste),
    (Bulbul)-[:APPARTIENT]->(Oiseaux),
    (Nighthawk)-[:APPARTIENT]->(Oiseaux),
    (Shrike)-[:APPARTIENT]->(Viande)

match(n) return n





