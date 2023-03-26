Ceci est un projet flutter réalisé dans le cadre d'un cours sur les langages Dart et Flutter

L'objectif de cette projet est de parcourir différentes fonctionnalités que nous offre Flutter

Dans cette projet, vous retrouverez les fonctionnalités suivantes :
- Une nav bar
- Une bar de recherche (appelant une API à chaque changement de valeur)
- Un bouton clickable (appelant une API)

Ces fonctionnalités sont utilisées dans l'objectif de répondre à deux applications :
- Une application de blagues sur Chuck Norris
- Une application météo, donnant la météo du jour et celle des 7 prochains jours

Pour faire fonctionner cette application, il faut :
1. Cloner le répo git en local
2. Ouvrir le projet avec un IDE (la programmation a été réalisée sur VsCode.)
3. Ouvrir le fichier main.dart
4. Choisir son device (la programmation a été réalisée sur Chrome mis au format device avec l'élément inspecter.)
5. Lancer l'application avec le bouton "run without debugging" en haut à droite

App blague Chuck Norris : 
    Sur cette page vous trouverez un bouton qui en cliquant dessus vous affiche une blague sur Chuck nuris en anglais.
    Cette application m'a permis de comprendre comment fonctionne les appels d'API et comment afficher des informations sur le front

App météo : 
    Cette page est la deuxième partie du projet, il va contenir une barre de recherche pour la ville de notre choix.
    La météo du jour pour la ville recherchée
    La météo prévisionnelle des 7 prochains jours pour la ville recherchée
    De base, la météo affichée est celle de Rennes.
    
    Pour fonctionner cette app utilise 2 API
    - Une API prenant en paramètre une ville et renvoyant ses coordonnées
    - Une API prenant en paramètre des coordonnées et renvoyant les informations météo correspondant aux coordonnées

Architecture du projet
    main.dart                                       -> lancer le projet
    views/jokes_page.dart & views/meteo_page.dart   -> Partie front du projet (organisation du widgets, intéraction widget back, ...)
    service/remote_service.dart                     -> Partie back du projet (appels des API)
    routes/* navbar/* controller/                   -> La navigation entre les deux pages
    models/*                                        -> Définition des objets (joke, ville et meteo) pour stocker les appels des API
