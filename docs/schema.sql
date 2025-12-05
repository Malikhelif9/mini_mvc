CREATE DATABASE IF NOT EXISTS ecommerce_mvc
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE ecommerce_mvc;

CREATE TABLE categorie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    image VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(255),
    ville VARCHAR(100),
    code_postal VARCHAR(20),
    role ENUM('client', 'admin', 'super_admin') NOT NULL DEFAULT 'client',
    email VARCHAR(100) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE produit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    prix DECIMAL(15,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    image VARCHAR(255),
    actif TINYINT(1) NOT NULL DEFAULT 1,
    categorie_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_produit_categorie
        FOREIGN KEY (categorie_id)
        REFERENCES categorie(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE commande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_commande VARCHAR(50) NOT NULL UNIQUE,
    utilisateur_id INT NOT NULL,
    date_commande DATETIME DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('en_attente','payee','expedie','livree','annulee') DEFAULT 'en_attente',
    total DECIMAL(15,2) NOT NULL DEFAULT 0,
    adresse_livraison VARCHAR(255) NOT NULL,
    ville_livraison VARCHAR(100) NOT NULL,
    code_postal_livraison VARCHAR(20) NOT NULL,

    CONSTRAINT fk_commande_utilisateur
        FOREIGN KEY (utilisateur_id)
        REFERENCES utilisateur(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ligne_commande (
    commande_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL,
    prix_unitaire DECIMAL(15,2) NOT NULL,
    sous_total DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (commande_id, produit_id),

    CONSTRAINT fk_lc_commande
        FOREIGN KEY (commande_id)
        REFERENCES commande(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_lc_produit
        FOREIGN KEY (produit_id)
        REFERENCES produit(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
