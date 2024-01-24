# Base de données Kicéo

- [Installation de la base](#installation-de-la-base)
  - [Création](#création)
  - [Ajout des données](#ajout-des-données)
  - [Requêtage](#requêtage)
- [Conception](#conception)
  - [Dictionnaire de données](#dictionnaire-de-données)
  - [Modèle relationnel de données](#modèle-relationnel-de-données)
- [Remarques](#remarques)
- [Références](#références)

## Installation de la base

### Création
Exécutez la commande suivante :
```p
--mysql -h localhost -u root -p < data.sql
```

### Ajout des données
Exécutez la commande suivante :
```p
--mysql -h localhost -u root -p < schema.sql
```

### Requêtage
Exécutez la commande suivante :
```p
--mysql -h localhost -u root -p < requetes.sql
```

<div style="border: 2px dashed #998529; padding: 10px; background-color: #f2d13d33;">
  <code>root</code> <b>est un utilisateur par défaut, il se peut qu'il n'existe pas dans votre système, veuillez vous référez à la liste d'utilisateurs de votre base de données. </b>
</div>

## Conception

### Dictionnaire de données

| Donnée | Type |
|-----------|-----------|
| id_ligne  | ```INT AUTO_INCREMENT``` |
| numero_ligne | ```INT``` |
| nom_ligne | ```VARCHAR(50)```  |
| horaire | ```TIME``` |
| jour | ```ENUM('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche')``` |
| id_station | ```INT AUTO_INCREMENT``` |
| nom_station | ```VARCHAR(50)``` |

### Modèle relationnel de données

| MCD | MLD |
|-----------|-----------|
| ![MCD]('https://kilianMalherbe.github.io/controleSQL/MCD/MCD.png') | ![MLD](https://kilianMalherbe.github.io/controleSQL/MCD/MLD.png) |

## Remarques

J'ai eu un peu de mal sur le MCD à cause de l'énoncé disant qu'on avait deux entités **Horaire** et **Jour**, j'ai eu du mal a leur trouvé une utilité dans mon MCD à croire que c'était pour rapeller le principe de normalisation des données ?

## Références

- La documentation MySQL (https://dev.mysql.com/doc/refman/8.0/en/)
- Merise par Developpez.com (https://ineumann.developpez.com/tutoriels/merise/initiation-merise/)
- ChatGPT (https://chat.openai.com/)