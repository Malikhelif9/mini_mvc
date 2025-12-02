

1. Le prix unitaire est stocké dans la table ligne_commande pour figer le prix du produit au moment de la commande.
En effet, le prix d’un produit peut changer, une facture doit toujours refléter le prix exact payé par le client, le commerçant doit conserver l'historique des tarifs appliqués et cela garantit qu’une commande reste correcte même si le produit change plus tard. Enfin, le champ prix_unitaire permet de conserver un prix immuable associé à chaque vente


2. categorie → produit

ON DELETE RESTRICT
On empêche la suppression d’une catégorie si des produits y sont associés.

produit → ligne_commande
ON DELETE RESTRICT
Un produit utilisé dans une commande ne peut pas être supprimé.


utilisateur → commande

ON DELETE CASCADE
Si un utilisateur est supprimé, toutes ses commandes sont supprimées automatiquement.

commande → ligne_commande

ON DELETE CASCADE
Si une commande est supprimée, ses lignes le sont aussi.


Remarque sur les rôles:  L’utilisateur possède un champ role (client, admin, super_admin).


3. Gestion des stocks
Que se passe-t-il si un client commande un produit en rupture de stock ?

Le système doit empêcher la commande d’un produit si :
➡ stock < quantite_commandee.

En interface : bouton désactivé + message "Produit indisponible".

Quand décrémente-t-on le stock ?
Je choisis la stratégie la plus logique pour le projet :
On décremente au moment du paiement de la commande

car un panier n’est pas définitif → inutile de bloquer du stock

plusieurs utilisateurs peuvent ajouter un produit au panier sans le payer

seule la commande validée doit impacter le stock.

4. Index prévus
Index automatiques (FK)

produit.categorie_id

commande.client_id

ligne_commande.commande_id

ligne_commande.produit_id

Index uniques

utilisateur.email

commande.numero_commande


5. Comment assurer l’unicité du numéro de commande ?

Le champ numero_commande est :

UNIQUE en base

généré automatiquement dans le code (ex. CMD-0123)

Même si deux commandes sont créées en même temps, la contrainte UNIQUE garantit l’unicité.

6. Extensions possibles du modèle
 Plusieurs adresses par client

Table adresse + relation utilisateur_id.

 Historique des prix

Table historique_prix qui permet d'avoir une visu sur l'ensemble du changement des prix

Avis clients

Table avis
note + commentaire + date.

Images multiples par produit

Table image_produit
→ plusieurs photos pour une fiche produit.


Suivi des stocks

Table mouvement_stock.