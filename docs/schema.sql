

CREATE DATABASE ecommerce_mvc



CREATE TABLE categorie (
    id INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description VARCHAR(50),
    image VARCHAR(50)
     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



CREATE TABLE produit (
    id INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description text NOT NULL,
    prix DECIMAL(15,2),
    stock INT NOT NULL,
    image VARCHAR(50),
    categorie_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    CONSTRAINT fk_produit_categorie
        FOREIGN KEY (categorie_id)
        REFERENCES categorie(id)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

CREATE TABLE utilisateur (
    id INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    code_postal INT NOT NULL,
    role ENUM('client', 'admin', 'super_admin') NOT NULL 
            DEFAULT 'client',
    email VARCHAR(50) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(50) NOT NULL
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

);


CREATE TABLE commande (
    id INT  PRIMARY KEY,
    numero_commande INT NOT NULL UNIQUE,
    client_id INT NOT NULL,
    date_commande DATETIME,
    statut ENUM('en_attente','payee','expedie','livree','annulee') 
           DEFAULT 'en_attente',
    total DECIMAL(15,2),

    adresse_livraison VARCHAR(50) NOT NULL,
    ville_livraison VARCHAR(50) NOT NULL,
    code_postal_livraison INT NOT NULL

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
    prix_unitaire DECIMAL(15,2) NOT NULL ,
    sous_total DECIMAL(15,2) NOT NULL,

    PRIMARY KEY (commande_id, produit_id)

    
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

