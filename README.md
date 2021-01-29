# BestGNotation
Projet de site de notation de jeux vidéos

Lien vers notre application sur heroku : https://bestgnotation.herokuapp.com/

Liste des fonctionnalités :
- Principe utilisateur/administrateur :
  - Authentification pour chaque page
  - Autorisation utilisateur :
    - Page accueil : liste des jeux et faire recherche sur 4 champs :
      - Nom
      - Categorie
      - Studio
      - Plateforme
    - Voir la fiche d'un jeu et les reviews assosié
    - Créer un review associé pour le jeu
    - Dashboard : informations personnels et voir ses reviews avec possibilité modification et suppression
  - Autorisation administrateur :
    - Même accés que l'utilisateur
    - Création, modification et suppression :
      - Jeux
      - Categorie
      - Studio
      - Plateforme
- Authentification :
  - Possibilité de connexion
  - Possibilité de s'inscrire
  - Possibilité de déconnexion
- Techniques :
  - Ajout/modification pour un jeu d'une image
  - Ajout service calcule note d'un jeu (moyenne des reviews)
  - Recherche en fonction de 4 paramétres :
    - Nom du jeu
    - Categorie du jeu
    - Studio du jeu
    - Plateforme du jeu
  - CRUD complet (sauf review) présent sur :
    - Games
    - Category
    - Studio
    - Platform
  - Ajout pages :
    - Dashboard (personnalisé pour l'utilisateur connecté)
    - Accueil (tous utilisateurs connectés)
- Job :
  - Attribution d'un status pour l'utilisateur en fonction du nombre de reviews (différent du status admin)
- Test :
  - Test système d'ajout d'un jeu
