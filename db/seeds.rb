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
                {categoryName: 'Réflexion'}, {categoryName: 'Aventure'}, {categoryName: 'Action'}, {categoryName: 'Simulation'}])

studios = Studio.create([{nameStudio: 'Bethesda Game Studios', dateCreated: '2001'}, {nameStudio: 'Blizzard Entertainment', dateCreated: '1991'},
                            {nameStudio: 'Infinity Ward', dateCreated: '2003'}, {nameStudio: 'BioWare Edmonton Studio', dateCreated: '1995'},
                            {nameStudio: 'Steel Wool Studios', dateCreated: '2013'}, {nameStudio: 'Skull Games Studio',dateCreated: '2019-10-10'} ])

users = User.create([{first_name: 'Admin', last_name: 'Admin', email: 'admin@gmail.com',is_admin: true,
                         password: 'adminadmin', password_confirmation: 'adminadmin'}, # mdp: adminadmin
                        {first_name: 'Toto', last_name: 'toto', email: 'toto@toto.com',is_admin: false,
                         password: '000000', password_confirmation: '000000'}, # mdp: 000000
                        {first_name: 'Test', last_name: 'test', email: 'test@test.com',is_admin: false,
                         password: '000000', password_confirmation: '000000'}])# mdp: 000000

games = Game.create([{name: 'Elder Scroll 10 : Landersbram', description: 'Une nouvelle terre à découvrir et à dominer.', note: 5.0,
                        datePublished: '2021-01-10', category: categories[0], studio: studios[0], platform: platforms[0] },
                     {name: 'Mass Effect 3', description: "L'avenir des races intelligentes est entre les mains du Commandant Shepard.", note: 4.5,
                        datePublished: '2020-07-10', category: categories[0], studio: studios[1], platform: platforms[0] },
                        {name: 'Mass Effect 3', description: "L'avenir des races intelligentes est entre les mains du Commandant Shepard.", note: 4.5,
                        datePublished: '2020-07-10', category: categories[0], studio: studios[1], platform: platforms[1] },
                        {name: 'Mass Effect 3', description: "L'avenir des races intelligentes est entre les mains du Commandant Shepard.", note: 4.5,
                        datePublished: '2020-07-10', category: categories[0], studio: studios[1], platform: platforms[2] },
                        {name: 'Portal Arena', description: "Combatter pour obtenir la gloire de votre espèce dans l'arène de Portal Arena.", note: 5.0,
                        datePublished: '2021-01-15', category: categories[6], studio: studios[5], platform: platforms[0] }
                    ])
reviews = Review.create([{noteReview: 5, description: 'Super cool', user: users[1], game: games[0]},{noteReview: 4.5, description: "Cette version est la meilleur du jeu", user: users[2], game: games[1]},
                     {noteReview: 4.5, description: "J'ai bien aimé ce jeu", user: users[1], game: games[2]}, {noteReview: 4.5, description: 'Les bonus sont super', user: users[1], game: games[3]},
                     {noteReview: 5, description: 'Refonte graphique au top, histoire immersif, musique intense, un jeu en or', user: users[1], game: games[4]}
                    ])
