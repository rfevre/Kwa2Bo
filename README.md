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
|Gestion et configuration des librairies|45%|55%|
|Réalisation des vues(JSP, HTML, CSS/BootStrap)|90%|10%|
|Réalisation des Beans(Java)|50%|50%|
|Réalisation des Servlet(Java)|35%|65%|
|Requêtes ajax|80%|20%|
|Documentation|65%|35%|

**Pourquoi cette répartition ?**

Nous avons souhaité nous investir dans les domaines dans lesquelles nous étions le plus en difficulté plutôt que ceux dans lesquelles nous étions à l'aise pour monter en compétence.
La cohésion dans notre équipe à toujours été au rendez-vous, le partage globale des tâches avoisine les 50%.


**Le MCD de Kwa2Bo**

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/MCD-MLD/MCD_Kwa2Bo.PNG)

**Le MLD de Kwa2Bo**

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/MCD-MLD/MLD_Kwa2Bo.PNG)
#### III) Les améliorations à apporter

Bien que satisfaits de notre projet, en imaginant une deadline plus reculée, nous aurions pus apporter ces améliorations:
  - Améliorrer la page de profil de l'utilisateur:
    - Possibilité d'ajouter une photo de profil
    - Consulter le profil de ses amis
    - Dissocier page de profil des paramètres
  - Modifier directement les couleurs de l'interface depuis les paramètres
  - Se connecter en SSO avec le CAS Lille 1 (portail de l'université)
  - Utiliser la technologie WebSocket pour plus de fluidité dans la messagerie instantannée
  - Gérer les mots de passes oubliés
  - Forcer la connexion en SSL
  - Un site accessible pour les personnes handicapées respectant la norme Opquast V2
  - (Plus compliqué) Intéragir avec une webcam
  - ...

#### IV) En quoi ce projet était difficile

Au premier abord, ce projet ne nous a pas semblé vraiment difficile. La difficulté s'est fait ressentir après plusieurs semaines, lorsque nous avons réalisé la charge réelle de travail à fournir.

Voici une liste des principales difficultés que nous avons pu rencontrer:
  - Intégrer un maximum de technologies(se familiariser en peu de temps à des technologies inhabituelles)
  - Prise de décision commune(divergence de certains points de vues, notamment pour le MCD)
  - Gérer 4 projets en simultané(Projet d'accessibilité, de réseau, d'Administration Système et de BDD)

#### V) Conclusion

Un projet tel que celui-là nous as paru trés intéressant. De part la multitude de technologies employées que par les difficultés à surmonter. Après 5 semaines de travails en équipe, nous sommes plutôt satisfait de notre efficacité et du rendu de l'application. La prochaine étape ? Le déploiement en ligne qui sait .. ?

---

### Description technique du projet :

Le but de ce projet n'était pas de se contenter d'une seule technologie, mais bien d'en utiliser un maximum. Ceci afin d'en apprendre davantage sur les technologies disponibles pour le WEB.

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

Malheureusement, par manque de temps et parce que nous n'en ressentions pas le besoin, nous avons choisi de ne pas intégrer de PHP ni d'XML. A la place d'XML, nous avons utilisés le format JSON pour la transmission d'objet(qui est plus explicite et ressemble davantage à un "format objet")

#### II) Principe de réalisation

  ##### Les technologies employées

  - ###### JavaBeans

  JavaBeans est une technologie qui nous a permis de récupèrer et manipuler trés facilement les objets JAVA transmis par la requête HTTP.
  Nous avons notamment utilisé cette technologie dans la page `Kwa2Bo/logged/parametres.jsp`.

  - ###### Servlet

  Dans notre projet, les servlets s'occupent principalement de la partie "controller" du modele MVC. C'est elles qui on principalement accès à la base de données. Elles sont donc utilisées lors de l'envoie, la modification, ou la récupération de données en format JSON. Dans certain cas, elles sont aussi utilisées pour faire de la redirection. Chaque page de notre site fait appel directement ou indirectement(avec AJAX) à des Servlets.

  - ###### JSP

  Le JavaServer Pages ou JSP nous a permis de gérer dynamiquement le code HTML. Nous avons donc choisis d'utiliser les JSP pour matérialiser la "Vue", qui contiennent 90% de code HTML. Certaines JSP comme `header.jsp` ou `footer.jsp` contiennent des blocs de code HTML utilisés dans la majorité des JSP. On fait donc appel à ces 2 pages avec des includes pour éviter une redondance de code HTML.

  - ###### EL

  Les EL (Expressions Languages) nous ont servis à accéder simplement aux beans et aux variables des différents scopes de l'application web (page, request, session et application). Elles sont utilisés dans presques toutes les pages JSP.

  - ###### JSTL

  JSTL est un ensemble de taglibs personnalisés qui propose des fonctionnalités souvent rencontrées dans les JSP. Cette technologie n'est pas omniprésente dans nos pages. En effet, nous avons jugés que les fonctionnalités proposés par ce taglib (faire des boucles, introduire des conditions dans le code html ...) étaient facilement réalisables avec les JSP. Cette technologie est utilisée dans la page `login.jsp`.

  - ###### AJAX

  L'architecture AJAX nous a permis de construire un site web dynamique et interactif. En effet AJAX nous permet de modifier dynamiquement le contenu de la page sans réactualiser la page et surtout sans redirections. On peut donc à la suite d'une requête AJAX :
    - Récupérer des "objets"/informations sous un format de donnée spécifique(ici JSON).
    - Modifier le DOM et donner une impression de mise à jour instantannée notamment pour le Tchat.

  - ###### JQuery

  JQuery est donc utilisé pour effectuer les requêtes AJAX et modifier les élements du DOM. JQuery simplifie considérablement le code JavaScript pour le rendre minimaliste et plus explicite. Il est également requis pour utiliser certaines fonctionnalités de BootStrap.
  Cette bibliothéque est utilisée dans quasiment toutes les pages JSP.

  - ###### BootStrap

  Nous avons choisi d'utiliser BootStrap comme Framework CSS/JavaScript. Il comporte un système de grille simple qui nous a permis de placer facilement les composants graphiques de notre site et le rendre responsive. Il apporte du style pour les boutons, les formulaires, la navigation... Il permet ainsi de concevoir le style d'un site web facilement sans nécessiter de grandes connaissances en CSS. Chaque page JSP intègre ce Framework.

  - ###### CSS

  Les feuilles de style nous on surtout servis à affiner le positionnement des élements et personnaliser les couleurs de notre application. Deux styles différents sont proposés pour notre site.

  - ###### Realm

  Tomcat intègre une fonctionnalité trés intéressante : les Realm. Grâce à cette fonction, nous avons pu protéger l'accès aux ressources du serveur, en demandant aux utilisateurs de s'authentifier. Le principe est simple : lorsque l'utilisateur tente d'accéder à l'URL d'une ressource protégée, le serveur s'occupe de vérifier le rôle de l'utilisateurs en le redirigeant vers une page de login personnalisée.
  Ainsi toutes les pages de notre applications sont protégées sauf la page `login.jsp`. Les pages contenues dans le dossier `logged` sont accessibles uniquement par les personnes ayant le rôle `logged` dans la table de notre BDD, c'est à dire aux personnes connectés. Une personne aura un rôle `undef` si la personne est inscrite mais n'a pas validé son compte.

  - ###### JavaMail

  Pour la confirmation d'inscription nous avons décidés d'envoyer un e-mail à l'utilisateur. Nous avons donc utilisés l'API JavaMail qui permet d'envoyer un courrier électronique dans une application écrite en Java. L'utilisateur reçoit alors un mail de confirmation contenant un lien d'activation de son compte.

  - ###### Pool

  Nous avons utilisés le pool de connexion pour éviter la redondance d'information et faciliter le déploiement de notre application. Après avoir renseigner les informations dans le fichier `META-INF/context.xml`, il nous a suffit d'utiliser le code suivant pour établir une connexion à la base de données :

  ```
  Context initCtx = new InitialContext();
  Context envCtx = (Context) initCtx.lookup("java:comp/env");
  DataSource ds = (DataSource) envCtx.lookup("mabase");
  con = ds.getConnection();
  ```

  - ###### Valve

  La valve nous est utile pour avoir une traçabilité des requêtes effectuées par les utilisateurs potentiels, qui permet notamment de repérer les erreurs éventuelles.

  - ###### SSL

  La connexion SSL nous permet d'échanger les informations entre plusieurs machines de façon sécurisée. Dans l'hypothése d'un déploiement sur serveur dédié ou de commercialisation de l'application, la connexion SSL serait indispensable.

  ##### Le fonctionnement des pages

  Les pages principales seront détaillées ci-dessous :

  - ##### `/`

  Lorsque l'utilisateur tente d'accèder à l'application via l'url `<adresse_du_serveur>/Kwa2Bo/`, il tente alors d'accèder à la racine de l'application. Grâce au fichier web.xml, nous avons pus definir une "Welcome page" pour cette racine. La page affichée par défaut est donc la page des conversations : `logged/conversations.jsp`.
  Si l'utilisateur n'est pas identifié, le serveur redirige celui-ci vers la page de login grâce au realm.

  - ##### `conversations.jsp`

  La page conversations.jsp se trouve dans le dossier `logged`, qui est donc accessible uniquement par les personnes ayant un rôle `logged` dans la table kwa2bo_utilisateur.
  Cette page contient un formulaire de saisie pour la création de groupes de discussions. Lorsque le bouton "Créer" est pressé, une requête AJAX est envoyé à la servlet `InsertGroupe` qui reçoit en paramètres un nom de groupe, ainsi qu'une liste de membres(on renseigne simplement l'adresse mail de chaque membre qui sert d'id).
  Toutes les 2 secondes, la liste des groupes est actualisée grâce à une nouvelle requête AJAX. Cette dernière reçoit une liste de groupes sous format JSON, puis appel une fonction "callback" qui met en forme la liste des groupes. Ensuite, lorsque l'utilisateur clique sur un des groupes de  conversations listées sur la gauche, une fenêtre modale s'ouvre. Il n'y a en effet qu'une seule fenêtre modale dans le code HTML qui est actualisée en fonction de la conversation désirée (en AJAX).

  - ##### `contacts.jsp`
  La page de contacts permet de rechercher des utilisateurs et de les ajouter à sa propre liste d'amis.
  La partie gauche de la page contient une liste des utilisateurs qui peut-être affinée par critères. La partie droite de la page contient la liste des contacts de l'utilisateur courant. Ces deux listes ont tous les deux un principe de fonctionnement similaire. Lorsque l'utilisateur presse une touche dans la zone de recherche, la liste s'actualise grâce à une requête AJAX. L'utilisateur peut ensuite choisir d'ajouter un utilisateur en cliquant sur le bouton avec un "+".


  - ##### `parametres.jsp`
  Avant d'être amené sur cette page, le serveur fait appel à une servlet `SelectProfil`. Cette servlet liste les informations sur l'utilisateur courant, et effectue une redirection vers `parametres.jsp` avec comme parametre un objet utilisateur récupérable grâce aux jspBeans dans la page parametres.jsp. Le changement de mot de passe s'effectue dans une formulaire séparé du formulaire de modification de profil. Ces deux formulaires font tous les deux appels à des servlet qui effectuent un UPDATE sur la table des utilisateurs.


Les pages développées ci-dessus font beaucoup d'appels AJAX. L'avantage de cette technologie est qu'elle permet d'éviter les redirections incessantes. Elle apporte donc un confort à l'utilisateur.

#### III) Difficultés techniques rencontrées et solutions apportées

  - ##### Accés avec le realm

  Au début, le contrôle d'accès par le Realm nous a posé problème. Le problème venant du fait que certaines ressources indispensable étaient inaccessibles pour les utilisateurs hors-ligne (notamment les images et le CSS pour la page d'accueil). Nous avons contournés ce problème en autorisant l'accés publiquement à certaines ressources non sensibles (les images,le css).

  - ##### Encodage lors de l'envoie d'une image avec du texte en AJAX

  Voici le problème qui nous a sans doute pris le plus de temps à résoudre. Lors de l'upload d'une image nous voulions envoyer en simultané du texte dans un même formulaire. Le problème est alors survenu fut celui de l'encodage du texte. Lors de l'upload d'une image, la requête AJAX envoyée à la servlet ne doit pas préciser de "contentType". Nous avons donc contourné ce problème, en encodant le texte d'un format "iso-8859-1" à un format "UTF-8" directement côté serveur grâce à une fonction JAVA.

  - ##### Rendre le site responsive

  Pour ce projet nous nous sommes imposés une contrainte de taille(sans jeux de mots) : rendre le site 100% responsive. En CSS natif, le développement aurait été long et compliqué à mettre en place. L'utilisation de bootStrap à permis de palier à ce problème.

#### IV) Conclusion

  Bien que certains problèmes nous aient ralentis, grâce à la communauté de certains FrameWork et de l'aide de certains camarades, nous avons toujours su les résoudres rapidement. Ce projet nous a donc permis de monter en compétence dans plusieurs technologies qui nous seront certainnement utiles pour notre stage de fin d'année.

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

Comme dit le célèbre [Eric Antoine](https://fr.wikipedia.org/wiki/%C3%89ric_Antoine_%28magicien%29) c'est un peu magique ! Si vous saisissez des informations fausses ou incorrectes, vous aurez le droit à une petite insulte de ce genre :

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Login_Kwa2Bo.png)

##### Acte 3 - Les discussions

C'est votre 1ére connexion sur Kwa2Bo, vous êtes excité et vous vous dites : "Wouaw le designer de ce site à vraiment fait du bon boulot! Je m'y retrouve parfaitement et je sais très clairement où cliquer pour démarrer une conversation et reprendre une conversation déjà existante !" et c'est normal. Mais je vais tout de même vous expliquer le fonctionnement de cette application(après tout on est pas dans le manuel utilisateur pour rien).

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Discussion_Kwa2Bo.png)

- La menu du haut à changé ! grâce à lui vous allez pouvoir naviguer sur le site et vous déconnecter en cliquant sur votre adresse e-mail sur la droite.

- Sur votre gauche, les discussions auxquelles vous participez. Cliquez dessus, et paf paf paf (Comme dirait Mohammed Nour) : Une fenêtre modal s'ouvre pour la discussion concerné. Dans cette fenetre, vous allez pouvoir envoyer des messages et des photos de manière illimité !

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/capture_conversation_en_cours.png)

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
