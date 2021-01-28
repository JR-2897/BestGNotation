# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

platforms = Platform.create([{platformName: 'PC'} ,{platformName: 'Xbox one'} ,{platformName: 'PS4'} ,
                {platformName: 'Nintendo Switch'}, {platformName: 'PS5'}, {platformName: 'Xbox serie'} ,
                {platformName: 'Stadia'}])

categories = Category.create([{categoryName: 'RPG'}, {categoryName: 'MMORPG'}, {categoryName: 'Stratégie'},
                {categoryName: 'FPS'}, {categoryName: 'Horreur'}, {categoryName: 'VR'}, {categoryName: 'Combat'},
                {categoryName: 'Réflexion'}, {categoryName: 'Aventure'}, {categoryName: 'Action'}, {categoryName: 'Simulation'},
                {categoryName: 'Multijoueur'}])

studios = Studio.create([{nameStudio: 'Bethesda Game Studios', dateCreated: '2001-01-01'}, {nameStudio: 'Blizzard Entertainment', dateCreated: '1991-01-01'},
                            {nameStudio: 'Infinity Ward', dateCreated: '2003-01-01'}, {nameStudio: 'BioWare Edmonton Studio', dateCreated: '1995-01-01'},
                            {nameStudio: 'Steel Wool Studios', dateCreated: '2013-01-01'}, {nameStudio: 'Skull Games Studio', dateCreated: '2019-10-10'},
                            {nameStudio: 'Nintendo', dateCreated: '1889-01-01'}, {nameStudio: 'Motive Studios', dateCreated: '2015-01-01'} ])

users = User.create([{first_name: 'Admin', last_name: 'Admin', email: 'admin@gmail.com',is_admin: true,
                         password: 'adminadmin', password_confirmation: 'adminadmin'}, # mdp: adminadmin
                        {first_name: 'Toto', last_name: 'toto', email: 'toto@toto.com',is_admin: false,
                         password: '000000', password_confirmation: '000000'}, # mdp: 000000
                        {first_name: 'Test', last_name: 'test', email: 'test@test.com',is_admin: false,
                         password: '000000', password_confirmation: '000000'}])# mdp: 000000

games = Game.create([{name: 'The Elder Scrolls V: Skyrim', description: 'Sauver le monde du dragon Alduin le devoreur de monde.', note: 20.0,
                        datePublished: '2021-01-10', category: categories[0], studio: studios[0], platform: platforms[0] },
                     {name: 'Mass Effect 3', description: "L'avenir des races intelligentes est entre les mains du Commandant Shepard.", note: 18.0,
                        datePublished: '2020-07-10', category: categories[0], studio: studios[1], platform: platforms[0] },
                     {name: 'Mass Effect 3', description: "L'avenir des races intelligentes est entre les mains du Commandant Shepard.", note: 18.0,
                        datePublished: '2020-07-10', category: categories[0], studio: studios[1], platform: platforms[1] },
                     {name: 'Mass Effect 3', description: "L'avenir des races intelligentes est entre les mains du Commandant Shepard.", note: 18.0,
                        datePublished: '2020-07-10', category: categories[0], studio: studios[1], platform: platforms[2] },
                     {name: 'Portal Arena', description: "Combatter pour obtenir la gloire de votre espèce dans l'arène de Portal Arena.", note: 20.0,
                        datePublished: '2021-01-15', category: categories[6], studio: studios[5], platform: platforms[0] },
                     {name: 'Fallout 4', description: 'Retrouver votre fils dans un monde Post-apo.', note: 15.0,
                        datePublished: '2015-11-10', category: categories[0], studio: studios[0], platform: platforms[0] },
                     {name: 'Call of Duty: Warzone', description: 'Battle royal.', note: 15.0,
                        datePublished: '2020-03-10', category: categories[6], studio: studios[2], platform: platforms[0] },
                     {name: 'Starcraft 2: Wings of Liberty', description: "Combat tripartite dans l'espace.", note: 18.0,
                        datePublished: '2010-07-27', category: categories[2], studio: studios[1], platform: platforms[0] },
                     {name: 'The Legend of Zelda: Breath of the Wild', description: 'Sauver Hyrule et la princesse Zelda du Fléau.', note: 20.0,
                        datePublished: '2017-03-03', category: categories[0], studio: studios[6], platform: platforms[3] },
                     {name: 'Star Wars Battlefront II', description: 'Combatter dans une galaxie lointaine, très lointaine.', note: 15.5,
                        datePublished: '2017-11-17', category: categories[11], studio: studios[7], platform: platforms[0] },
                     {name: 'Star Wars: Squadrons', description: "Combatter tour à tour pour la nouvelle République et les vestiges de l'Empire.", note: 19.0,
                        datePublished: '2020-10-02', category: categories[10], studio: studios[7], platform: platforms[0] },
                     {name: 'Warcraft III: Reign of Chaos', description: 'Entrer dans le monde d Azeroth pour combattre pour la Horde ou l Alliance', note: 19.0,
                        datePublished: '2002-07-05', category: categories[2], studio: studios[1], platform: platforms[0] }
                    ])

reviews = Review.create([{noteReview: 20.0, description: 'Super cool', user: users[1], game: games[0]},
                     {noteReview: 18.0, description: "Cette version est la meilleur du jeu", user: users[2], game: games[1]},
                     {noteReview: 18.0, description: "J'ai bien aimé ce jeu", user: users[1], game: games[2]},
                     {noteReview: 18.0, description: 'Les bonus sont super', user: users[1], game: games[3]},
                     {noteReview: 20.0, description: 'Refonte graphique au top, histoire immersif, musique intense, un jeu en or', user: users[1], game: games[4]},
                     {noteReview: 15.0, description: "Un jeu super mais trop bugé", user: users[2], game: games[5]},
                     {noteReview: 15.0, description: "Un jeu sympa", user: users[2], game: games[6]},
                     {noteReview: 18.0, description: "Pas mal comme jeu de stratégie en temps réel et avec une campagne sympa", user: users[2], game: games[7]},
                     {noteReview: 20.0, description: "Un des meilleur jeu de la saga", user: users[1], game: games[8]},
                     {noteReview: 15.5, description: "Un jeu qui s'est amélioré depuis sa sortie mais qui aurais du encore bénéficier de contenu", user: users[2], game: games[9]},
                     {noteReview: 19.0, description: "J'ai adoré", user: users[1], game: games[10]},
                     {noteReview: 19.0, description: "Un excellent jeu de stratégie", user: users[2], game: games[11]}
                    ])
