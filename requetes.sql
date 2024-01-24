-- mysql -h localhost -u root -p < requetes.sql

-- 1.

SELECT Deservir.horaire AS "Horaires à l'arrêt Madelaine (Lundi)"
FROM Deservir
JOIN Station ON Deservir.id_station = Station.id_station
WHERE Station.nom_station = "Madeleine"
ORDER BY horaire;

SELECT Deservir.horaire AS "Horaires à l'arrêt République (Lundi)"
FROM Deservir
JOIN Station ON Deservir.id_station = Station.id_station
WHERE Station.nom_station = "République"
ORDER BY horaire;

-- 2.

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT nom_station AS "Parcours de la ligne 2 Direction Kersec"
FROM Ligne
JOIN Deservir ON Ligne.id_ligne = Deservir.id_ligne
JOIN Station ON Deservir.id_station = Station.id_station
WHERE nom_ligne = "Direction Kersec"
GROUP BY nom_station
ORDER BY horaire;

-- 5.

SELECT
  nom_station AS "Horaires à l'arrêt Petit Tohannic (Lundi)",
  CASE 
    WHEN id_station_repli IS NOT NULL THEN CONCAT("Arrêt temporairement non desservi, veuillez vous reporter à l'arrêt ", (SELECT nom_station FROM Station WHERE id_station = s.id_station_repli))
    ELSE (
      SELECT GROUP_CONCAT(horaire ORDER BY horaire) 
      FROM Deservir
      JOIN Station ON Deservir.id_station = s.id_station
      WHERE nom_station = 'Petit Tohannic'
    )
  END AS resultat
FROM Station s
WHERE nom_station = 'Petit Tohannic';

-- 7.

SELECT nom_ligne AS "Ligne", GROUP_CONCAT(nom_station ORDER BY horaire) as "Arrêts desservis"
      FROM Deservir
      JOIN Ligne ON Deservir.id_ligne = Ligne.id_ligne
      JOIN Station ON Deservir.id_station = Station.id_station
      GROUP BY nom_ligne;

      -- 8.

-- Créer des index sur la table Deservir serait intéressant car elle sera souvent joint aux tables Lignes, Station, Horaires et Jours