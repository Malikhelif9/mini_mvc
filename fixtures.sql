USE ecommerce_mvc;

INSERT INTO categorie (nom, description, image) VALUES
('Informatique', 'Matériel et accessoires PC', 'info.jpg'),
('Maison', 'Produits pour la maison', 'maison.jpg'),
('Sport', 'Articles de sport', 'sport.jpg'),
('Mode', 'Vêtements et accessoires', 'mode.jpg'),
('Gaming', 'Consoles et jeux vidéo', 'gaming.jpg');


INSERT INTO utilisateur (nom, prenom, adresse, ville, code_postal, role, email, mot_de_passe)
VALUES
('Admin', 'Super', 'Rue 1', 'Paris', '75001', 'super_admin', 'superadmin@mail.com', 'mdp123'),
('Admin', 'Normal', 'Rue 5', 'Paris', '75002', 'admin', 'admin@mail.com', 'password'),
('Doe', 'John', '12 rue A', 'Lyon', '69000', 'client', 'john@mail.com', '12345'),
('Smith', 'Anna', '18 rue B', 'Marseille', '13000', 'client', 'anna@mail.com', '12345'),
('Dupont', 'Marc', '22 rue C', 'Toulouse', '31000', 'client', 'marc@mail.com', '12345');



INSERT INTO produit (nom, description, prix, stock, image, categorie_id) VALUES
('PC Gamer', 'Ordinateur performant', 1299.99, 10, 'pc.jpg', 1),
('Souris Gaming', 'Souris RGB', 49.99, 100, 'souris.jpg', 1),
('Clavier mécanique', 'Switch Blue', 79.99, 50, 'clavier.jpg', 1),
('Aspirateur', 'Puissant et silencieux', 199.99, 25, 'aspirateur.jpg', 2),
('Lampe LED', 'Lampe décorative', 29.99, 100, 'lampe.jpg', 2),
('Ballon de foot', 'Taille 5', 19.99, 80, 'ballon.jpg', 3),
('Chaussures running', 'Confort absolu', 89.99, 40, 'run.jpg', 3),
('Raquette tennis', 'Graphite', 149.99, 20, 'tennis.jpg', 3),
('T-shirt', 'Coton 100%', 14.99, 200, 'tshirt.jpg', 4),
('Veste', 'Imperméable', 59.99, 60, 'veste.jpg', 4),
('Pantalon', 'Slim fit', 39.99, 90, 'pantalon.jpg', 4),
('Casque gamer', 'Son surround', 79.99, 30, 'casque.jpg', 5),
('Manette PS5', 'Sans fil', 69.99, 50, 'manette.jpg', 5),
('Jeu PS5', 'Action/aventure', 69.99, 100, 'jeu.jpg', 5),
('Nintendo Switch', 'Console portable', 299.99, 20, 'switch.jpg', 5),
('Table', 'Table en bois', 129.99, 15, 'table.jpg', 2),
('Chaise', 'Chaise confortable', 49.99, 70, 'chaise.jpg', 2),
('Tapis de sport', 'Antidérapant', 29.99, 60, 'tapis.jpg', 3),
('Short sport', 'Ultra léger', 24.99, 100, 'short.jpg', 3),
('Pull', 'Laine', 34.99, 70, 'pull.jpg', 4),
('Casquette', 'Coton', 19.99, 150, 'casquette.jpg', 4),
('Haut femme', 'Élégant', 29.99, 120, 'haut.jpg', 4),
('Chaussures femme', 'Mode', 69.99, 50, 'shoes.jpg', 4),
('Clé USB 128Go', 'Très rapide', 39.99, 150, 'usb.jpg', 1),
('Webcam HD', 'Haute qualité', 49.99, 80, 'webcam.jpg', 1);



INSERT INTO commande (numero_commande, utilisateur_id, statut, total, adresse_livraison, ville_livraison, code_postal_livraison)
VALUES
('CMD-0001', 3, 'payee', 149.97, '12 rue A', 'Lyon', '69000'),
('CMD-0002', 4, 'payee', 89.99, '18 rue B', 'Marseille', '13000'),
('CMD-0003', 5, 'en_attente', 299.99, '22 rue C', 'Toulouse', '31000'),
('CMD-0004', 3, 'livree', 79.99, '12 rue A', 'Lyon', '69000'),
('CMD-0005', 4, 'expedie', 129.99, '18 rue B', 'Marseille', '13000'),
('CMD-0006', 5, 'payee', 49.99, '22 rue C', 'Toulouse', '31000'),
('CMD-0007', 3, 'en_attente', 39.99, '12 rue A', 'Lyon', '69000'),
('CMD-0008', 4, 'annulee', 149.99, '18 rue B', 'Marseille', '13000'),
('CMD-0009', 5, 'expedie', 69.99, '22 rue C', 'Toulouse', '31000'),
('CMD-0010', 3, 'payee', 19.99, '12 rue A', 'Lyon', '69000');


INSERT INTO ligne_commande VALUES
(1, 2, 3, 49.99, 149.97),
(2, 7, 1, 89.99, 89.99),
(3, 15, 1, 299.99, 299.99),
(4, 3, 1, 79.99, 79.99),
(5, 4, 1, 129.99, 129.99),
(6, 5, 1, 49.99, 49.99),
(7, 24, 1, 39.99, 39.99),
(8, 1, 1, 149.99, 149.99),
(9, 13, 1, 69.99, 69.99),
(10, 6, 1, 19.99, 19.99);
