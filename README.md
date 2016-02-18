# Projet WEB - Kwa2Bo
## Par LELEU Julien et FEVRE Rémy
### La messagerie de l'université
---

### DONE :
- Déploiement
- Synthèse
  - Objectif du travail
  - Ce qui a été fait
  - Les améliorations à apporter
  - En quoi ce projet était difficile
  - Conclusion
- Description technique
  - Objectif du travail
  - Technologies utilisées :
      - CSS
      - BootStrap
      - JavaScript
      - JQuery
      - AJAX
      - JSON
      - JSP
      - JSTL
      - Servlet
      - JavaMail
      - EL
      - Pool
      - Realm
      - Valve
      - SSL
  - Les améliorations à apporter
  - En quoi ce projet était difficile
  - Conclusion
- Documentation utilisateur(tutoriel)
  - Objectif de cette application
  - Du point de vue de l'utilisateur

---

### Déploiement :
#### Les APIs nécessaires
Pour commencer, munissez-vous des APIs suivantes :
  - [postgresql.jar](https://jdbc.postgresql.org/download.html)
  - [mail.jar](http://www.oracle.com/technetwork/java/index-138643.html)
  - [commons-lang.jar](https://commons.apache.org/proper/commons-lang/)
  - [jstl-1.2.jar](http://search.maven.org/#browse|707331597)

#### La variable $CLASSPATH
- Démarrez votre serveur tomcat
- Placez le fichier `Kwa2Bo.war` dans le dossier `/webapps/` de votre serveur.
- Accèdez au dossier `/tomcat/webapps/Kwa2Bo/WEB-INF/lib` et vérifiez la présence des librairies `commons-lang.jar` et `jstl-1.2.jar`.
- Modifiez votre variable d'environnement `CLASSPATH` directement dans le fichier `~/.bashrc` en ajoutant les lignes suivantes (adaptez le chemin à votre environnement) :
```
  export CLASSPATH=$CLASSPATH:.
  export CLASSPATH=$CLASSPATH:$HOME/tomcat/webapps/Kwa2Bo/WEB-INF/lib/commons-lang.jar
  export CLASSPATH=$CLASSPATH:$HOME/tomcat/webapps/Kwa2Bo/WEB-INF/lib/jstl-1.2.jar
```

- Ensuite, placez les fichiers suivants(s'ils ne sont pas déjà présents) dans le dossier `tomcat/lib` :
  - servlet-api.jar
  - mail.jar

- Ajoutez les lignes suivantes dans le fichier `~/.bashrc` :
```
  export CLASSPATH=$CLASSPATH:$HOME/tomcat/lib/servlet-api.jar
  export CLASSPATH=$CLASSPATH:$HOME/tomcat/lib/mail.jar
```

#### Configurer sa base de données
- Pour configurer et se connecter avec sa propre base de données, munissez-vous du driver JDBC correspondant(Ici pour l'exemple : postgresql.jar).
- Placez votre driver dans le dossier `/tomcat/lib` et ajoutez au fichier `~/.bashrc` la ligne suivante :
  - `export CLASSPATH=$CLASSPATH:$HOME/tomcat/lib/postgresql.jar`

- Modifiez les lignes suivantes du contexte de l'application dans le fichier `Kwa2Bo/META-INF/context.xml` par vos informations pour la connexion à la base de données :

```
<Resource
    name="mabase"
    auth="Container"
    type="javax.sql.DataSource"
    maxActive="8"
    maxIdle="4"
    maxWait="10000"
    username="<Votre login>"
    password="<Votre password>"
    driverClassName="<Votre driver>"
    url="<Url de la BDD>"
/>
```

#### Initialisation des données
Pour créer les tables nécessaires au fonctionnement de l'application avec des exemples de données, chargez le fichier tomcat/webapps/Kwa2Bo/docs/Kwa2Bo_createTable.sql à l'aide de votre SGBD.

**Votre application est théoriquement prête à fonctionner**

#### Serveur sécurisé SSL
Pour la configuration du SSL il vous faut une clé privée. Pour ce faire, vous avez besoin de créer un Keystore(Fichier informatique qui stocke des certificats électroniques et éventuellement leurs clefs privées). Pour plus de clarté, il est conseillé de stocker ce dernier dans le répertoire de votre serveur tomcat. Pour le générer, on utilise la commande suivante :

```
keytool -genkey -alias tomcat -keyalg RSA -keystore <repertoire_de_votre_tomcat>/keystore
```

Vous devrez alors répondre à plusieurs questions pour générer votre Keystore.

Une fois le Keystore généré, vous devez indiquer à tomcat le connecteur qui sera utilisé pour communiquer via SSL. Par défaut, il s’agit du port 8443 mais celui-ci n’est pas activé. Allez dans le fichier **"conf/server.xml"** pour modifier la configuration de votre serveur tomcat.

La configuration du connecteur SSL est déjà présente dans le fichier **"conf/server.xml"** , il faut dé-commenter son paragraphe et y ajouter quelques informations :

```
<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
           maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
           keystoreFile="<le chemin de votre keystore>" keystorePass="<le mot de passe choisi>"
           clientAuth="false" sslProtocol="TLS" />
```

Vous pouvez à présent vous connecter en SSL sur l'application grâce à l'adresse suivante :

`https://<adresse_du_serveur>:8443/Kwa2Bo`

#### Personnaliser le style de la page(Optionnel)
L'application vous offre la possibilité de personnaliser facilement les couleurs du site. Pour cela, deux fichiers CSS sont à votre disposition, le fichier `Kwa2Bo/css/style.css` et le fichier `Kwa2Bo/css/style2.css`. Pour modifier le CSS, modifiez dans le fichier `Kwa2Bo/WEB-INF/web.xml` la valeur du chemin du paramètre(param-value) de la balise suivante :

```
<context-param>
  <param-name>style</param-name>
  <!-- Le chemin à modifier -->
  <param-value>/css/style.css</param-value>
</context-param>
```

#### Accèder à l'adresse de l'application
Une fois configuré correctement, lancez votre serveur. Vous avez désormais accès à l'application depuis votre navigateur à l'adresse suivante :

`http://<adresse du serveur>:8080/Kwa2Bo`

ou

`https://<adresse_du_serveur>:8443/Kwa2Bo`  en SSL

---

### Synthèse :

#### I) Objectif du travail

Nos principaux objectifs lors de ce projet ont été de proposer une interface à la fois :
  - simple
  - pratique
  - responsive
  - rapide
  - sécurisée

avec :
  - des technologies variées
  - un modèle(MCD) trés structuré et bien décomposé
  - une séparation du Modèle, du controleur et de la vue
  - un maximum de respect des fonctionnalités décrites dans le [cahier des charges](http://moodle.univ-lille1.fr/pluginfile.php/204483/mod_resource/content/2/ProjetWEB1516_WhatsApp.pdf).

D'un point de vue humain, nous avons choisi de développer ce projet à l'aide de la méthode agile étudiée en cours(Grâce à [trello](http://trello.com), une application web facilitant la gestion de projet de ce type). Celle-ci ayant pour but de réussir à coordonner facilement nos compétences en décomposant finement les tâches. Enfin, notre dernière volontée était de réussir à se familiariser avec de nouvelles technologies et approfondir nos connaissances dans certains langages(tel que JavaScript par exemple).

#### II) Ce qui a été fait

Voici les principales tâches effectuées lors de la réalisation du projet :

|Tâches|Réalisé par Julien(%)|Réalisé par Remy(%)|
|:-------|:----------|:----------|
|Créer un MCD structuré|50%|50%|
|Générer le MLD|50%|50%|
|Création des requêtes|-|100%|
|Réaliser les maquettes|100%|-|
|Configuration du contexte|50%|50%|
|Gestion et configuration des librairies|-|100%|
|Réalisation des vues(JSP, HTML, CSS/BootStrap)|90%|10%|
|Réalisation des Beans(Java)|40%|60%|
|Réalisation des Servlet(Java)|30%|70%|
|Requêtes ajax|80%|20%|
|Documentation|50%|50%|

**Pourquoi cette répartition ?**

Nous avons souhaité nous investir dans les domaines dans lesquelles nous étions le plus en difficulté plutôt que ceux dans lesquelles nous étions à l'aise pour pouvoir monter en compétence.
La cohésion dans notre équipe à toujours été au rendez-vous, le partage globale des tâches avoisine les 50%/50%.


**Le MCD de Kwa2Bo**

![alt tag](https://github.com/rfevre/Kwa2Bo/blob/master/docs/MCD-MLD/MCD_Kwa2Bo.PNG)

**Le MLD de Kwa2Bo**

![alt tag](https://github.com/rfevre/Kwa2Bo/blob/master/docs/MCD-MLD/MLD_Kwa2Bo.PNG)
#### III) Les améliorations à apporter

Bien que satisfaits de notre projet, en imaginant une deadline plus reculée, nous aurions pus apporter ces améliorations:
  - Améliorrer la page de profil de l'utilisateur:
    - Avoir la possibilité d'ajouter une photo de profil
    - Pouvoir consulter le profil de ses amis
    - Dissocier page de profil des paramètres
  - Pouvoir changer directement les couleurs de l'interface dans les paramètres
  - Pouvoir se connecter en SSO avec le CAS Lille 1 (portail de l'université)
  - Utiliser la technologie WebSocket pour plus de fluidité dans la messagerie instantannée
  - De gérer les mots de passes oubliés
  - Forcer la connexion en SSL
  - Avoir un site accessible pour les handicapés et respectant les critères Opquast V2
  - (Un peu plus compliqué) Pouvoir intéragir avec une webcam ...

#### IV) En quoi ce projet était difficile

Au premier abord, ce projet ne nous a pas semblé vraiment difficile. La difficulté s'est fait ressentir après plusieurs semaines, lorsque nous avons réalisé la charge réelle de travail à fournir.

Voici une liste des principales difficultés que nous avons pu rencontrer:
  - Intégrer un maximum de technologies(se familiariser en peu de temps à divers technologies inhabituelles)
  - Prise de décision commune(divergence de certains points de vues)
  - Trouver assez de temps pour travailler sur le projet(Nous avions en effet plusieurs projets en simultané)

#### V) Conclusion

Un projet tel que celui-là nous as paru trés intéressant. De part la multitude de technologies employées que par les difficultés à surmonter. Après 5 semaines de travails en équipe, nous sommes plutôt satisfait de notre efficacité et du rendu de l'application. La prochaine étape ? Le déploiement en ligne qui sait .. ? :)

---

### Description technique du projet :

Le but de se projet n'était pas de se concentrer sur une seule technologie, mais bien d'en utiliser plusieurs, afin d'en apprendre un peu plus sur toute les technologies qui sont disponibles pour le WEB.

#### I) Objectifs techniques du travail

Pour réaliser ce projet, nous souhaitions intégrer les technologies suivantes :
- [x] CSS
  - [x] BootStrap
- [x] JavaScript
- [x] JQuery (ou MooTools)
- [x] AJAX
- [x] JSON
- [ ] XML
- [x] JSP
- [x] JSTL
- [x] Servlet
- [ ] PHP
- [x] JavaMail
- [x] EL
- [x] Pool
- [x] Realm
- [x] Valve
- [x] SSL

#### II) Principe de réalisation

  - ##### JavaBeans

  JavaBeans est une technologie de composants logiciels écrits en langage Java, elle est utilisés pour encapsuler plusieurs objets dans un seul objet : le "bean". Le "bean" est un objet java issues du modele. Ces "beans" sont alors facilement accessible dans les JSP grâce aux EL Expression et sont manipulable soit par des JSTL, soit directement en JavaScript.

  - ##### Servlet

  Les servlets s'occupe de la partie "controller" du modele MVC. C'est elles qui on principalement accès à la base de données. Elles sont donc utilisées lors de l'envoie, la modification, ou la récupération de données en format JSON. Dans certain cas, elles sont aussi utilisées pour faire de la redirection.

  - ##### JSP

  Le JavaServer Pages ou JSP est une technique basée sur Java qui nous permet de créer dynamiquement du code HTML. Ainsi, il est très facile de communiquer avec les servlets, et d'agir sur la "vue" en fonction des réponses de celles-ci.

  - ##### EL

  Une EL (Expressions Languages) permet d'accéder simplement aux beans des différents scopes de l'application web (page, request, session et application).

  - ##### JSTL

  JSTL est l'acronyme de Java server page Standard Tag Library. C'est un ensemble de tags personnalisés qui propose des fonctionnalités souvent rencontrées dans les JSP. Beaucoup de choses sont ainsi possible en combinant les JSTL et EL.

  - ##### AJAX

  L'architecture AJAX nous a permis de construire un site web dynamiques et interactifs. En effet AJAX combine JavaScript, les CSS, JSON et le DOM afin d'améliorer maniabilité et confort d'utilisation :
    - DOM et JavaScript permettent de modifier l'information présentée dans le navigateur en respectant sa structure ;
    - JSON structure les informations transmises entre serveur Web et navigateur.

  - ##### JQuery

  JQuery est une bibliothèque JavaScript libre et multi-plateforme créée pour faciliter l'écriture de scripts côté client dans le code HTML des pages web. Elle nous à permit principalement de manipuler plus facilement le DOM.

  - ##### BootStrap

  Nous avons choisi d'utiliser BootStrap car c'est un framework CSS, mais pas seulement, puisqu'il embarque également des composants HTML et JavaScript. Il comporte un système de grille simple et efficace pour mettre en ordre l'aspect visuel d'une page web. Il apporte du style pour les boutons, les formulaires, la navigation… Il permet ainsi de concevoir un site web rapidement et avec peu de lignes de code ajoutées.

  - ##### CSS

  Les feuilles de style en cascade (CSS) nous on permis de faire 2 styles différent pour notre site. Il n'y a qu'à changer de feuille de style, et le tour est joué. Les couleurs changes et le positionnement des élèments sur le site peuvent l'être aussi.

  - ##### Realm

  Dans Tomcat, grâce aux Realms, il est possible de protéger l'accès aux ressources du serveur, en demandant aux utilisateurs de s'authentifier. Le principe est simple : lorsque l'utilisateur tente d'accéder à l'URL d'une ressource protégée, on le renvoie vers la page de login.

  - ##### JavaMail

  Pour la confirmation d'inscription nous avons besoin d'envoyer un mail à l'utilisateur, on a donc utilisé l'API JavaMail qui permet d'utiliser le courrier électronique (e-mail) dans une application écrite en Java. Son but est d'être facile à utiliser, de fournir une souplesse qui permette de la faire évoluer et de rester le plus indépendant possible des protocoles utilisés.

  - ##### Pool

  La configuration d'un Pool de connexion dans Tomcat permet de facilité la connexion à la BDD dans le reste de l'application et de restreindre les connexions en fonction de la façon dont le Pool à était configuré. Il n'y a donc pas besoin de rentrer de login et mot de passe pour la connexion à la BDD dans toute les servlets.

  - ##### Valve

  Un élément Valve à été configuré sous tomcat afin de logger les requêtes effectués par l'utilisateur dans un fichier. Cela permet d'avoir une traçabilité de ce que les utilisateurs on effectué derniérement, ce qui permetra de localiser plus rapidement des erreurs.

  - ##### SSL

  Pourquoi une connexion en SSL ?
  Car c'est un système qui permet d'échanger des informations entre 2 ordinateurs de façon sûre. SSL assure 3 choses:
    - Confidentialité: Il est impossible d'espionner les informations échangées.
    - Intégrité: Il est impossible de truquer les informations échangées.
    - Authentification: Il permet de s'assurer de l'identité du programme, de la personne ou de l'entreprise avec lequelle on communique.

#### III) Difficultés techniques rencontrées et solutions apportées

  - ##### Accés avec le realm

  Au départ du projet, la restriction d'accès grâce au Realm nous a posé problème. En effet, celle-ci été inéfficace. Le problème venant du fait que certaine ressources indispensable étaient inacesible pour les utilisateur non connecté. Nous avons résolu ce problème en donnant l'accés a tout les utilisateurs à certaine ressources non critique (les images,le css,...).

  - ##### Encodage lors de l'envoie d'une image avec du texte en AJAX

  Le problème qui nous a sans doute pris le plus de temps est celui-ci. Lors de l'envoie d'une image nous voulions en même temps envoyer du texte, le problème qui c'est donc posé à nous été l'encodage. Lors de l'upload d'une image, la requête AJAX envoyé à la servlet ne doit pas préciser de "contentType", nous avons donc dû contourner le problème, en passant le texte d'un format "iso-8859-1" à un format "UTF-8" directement dans la servlet grâce à une fonction JAVA.

  - ##### Rendre le site responsive

  Pour ce projet nous nous sommes donnés la contrainte de rendre toutes les "vues" responsive. A la main, cela aurait pû prendre beaucoup de temps. Mais l'utilisation de bootStrap à permis de palier à ce problème.

#### IV) Conclusion

  Bien que certains problèmes nous aient ralentis, grâce à la communauté de certains FrameWork et de l'aide de certains camarades, nous avons toujours su les résoudres.

---

### Documentation utilisateur :

#### I) Qu'es acò Kwa2Bo ?

Kwa2Bo, c'est quoi m'sieur !?? C'est **LA** messagerie de l'université !
Pour faire simple, Kwa2Bo est une messagerie instantanée(plus ou moins) s'apparentant à un salon de discussion. Kwa2Bo est simple, rapide et efficace. Il permet aux étudiants de se retrouver après ou pendant les cours pour discuter et illustrer leurs propos avec des images. Tout cela de façon sécurisé et dans la gratuité la plus totale.

#### II) Comment qu'cha marche ?

Cette histoire vous sera conté ici en plusieurs actes.

##### Acte 1 - L'inscription

Comme toute bonne appli de messagerie respectable, la partie inscription est bien évidement obligatoire. En plus elle est très simple ! Lors de votre navigation sur la page d'accueil du site, vous remarquerez instantanément le formulaire d'inscription (s'inspirant trés fortement de [facebook](http://www.facebook.com)) :

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Accueil_Kwa2Bo.png)

Il ne reste plus qu'a faire appel à vos petites mimines pour remplir vaillamment ce jolie formulaire d'inscription. En plus d'être relativement design, il vous tiendra également informé des erreurs survenues dans chacuns des champs.

Après la validation du formulaire, un mail vous sera envoyé sur l'adresse de messagerie renseignée. Ce mail contient un lien permettant de valider l'inscription sur Kwa2Bo.

##### Acte 2 - La connexion

Apercevez-vous le petit formulaire d'authentification en haut du screenshot précédent ? Et bien grâce à lui, vous allez pouvoir vous connecter sur Kwa2Bo ! Renseignez simplement votre adresse e-mail et le mot de passe utilisé lors de votre inscription.

Comme avec [Eric Antoine](https://fr.wikipedia.org/wiki/%C3%89ric_Antoine_%28magicien%29) c'est un peu magique. Si vous saisissez des informations fausses ou incorrectes, vous aurez le droit à une petite insulte de ce genre :

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Login_Kwa2Bo.png)

##### Acte 3 - Les discussions

C'est votre 1ére connexion sur Kwa2Bo, vous êtes excité et vous vous dites : "Wouaw le designer de ce site à vraiment fait du bon boulot! Je m'y retrouve parfaitement et je sais très clairement où cliquer pour démarrer une conversation et reprendre une conversation déjà existante !" et c'est normal. Mais je vais tout de même vous expliquer le fonctionnement de cette application(après tout on est pas dans le manuel utilisateur pour rien).

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Discussion_Kwa2Bo.png)

- La menu du haut à changé ! grâce à lui vous allez pouvoir naviguer sur le site et vous déconnecter en cliquant sur votre adresse e-mail sur la droite.

- Sur votre gauche, les discussions auxquelles vous participez. Cliquez dessus, et paf paf paf (Comme dirait Mohammed Nour) : Une fenêtre modal s'ouvre pour la discussion concerné. Dans cette fenetre, vous allez pouvoir envoyer des messages et des photos de manière illimité !

- Sur votre droite, vous allez pouvoir créer un groupe. Un groupe c'est une discussion auquel on implique un ou plusieurs membre(s). Choissisez un nom pour votre groupe et ajoutez les personnes avec lesquels vous voulez discuter. Quand tout est prêt, appuyez sur le bouton "Créer".

Comment !? la personne que vous voulez ajouter au groupe n'est pas présente dans la liste ... hummm ... c'est qu'elle ne doit pas encore être présente dans votre liste de contacts bien sur ! Il vous faut l'ajouter !

##### Acte 4 - Les contacts

Vous vous souvenez de la barre de navigation dont je vous ai parlé précédement ? Et bien cliquez sur l'onglet en forme de bonhomme. Et pouf ! vous êtes redirigés vers la page de gestion des contacts :

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Contacts_Kwa2Bo.png)

- Sur votre gauche, vous pouvez rechercher dans la liste de tous les utilisateurs du site, une personne à ajouter dans votre liste de contacts, (pour lui faire des avances peut-être ? :P).

- Sur votre droite, vous pouvez rechercher dans votre liste de contacts, une personnes que vous voulez supprimer parce que vous ne l'aimez plus (parce que vous venez de rompre .. ? :/).

##### Acte 5 - Le profil

Vous avez commis une erreur de frappe dans votre "Pseudo" lors de l'inscription, ou bien dans l'obligation de changer de mot de passe ? Pas de panique ! La page de profil est faîte pour ça !

Une fois de plus, dans le menu que vous devez à présent connaitre, cliquez sur l'onglet représentant un engrenage, pour vous propulser vers la page de profil :

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Profil_Kwa2Bo.png)

- Encore une fois trés simple, renseignez les champs à modifier puis cliquez sur le bouton "Enregistrer les modifications".

- Si vous souhaitez modifier votre mot de passe, cliquez sur le bouton "Modifier le mot de passe". Une fenetre modale s'ouvre en vous demandant de saisir l'ancien mot de passe, ainsi que le nouveau.

Pour chaque modification effectuée, un message vous informant du succès de la modification s'affichera devant vos yeux ébahis.
