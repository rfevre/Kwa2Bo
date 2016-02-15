# Projet WEB - Kwa2Bo : La messagerie de l'université
## Par LELEU Julien et FEVRE Rémy
---

### DONE :
- Déploiement
- Synthese
  - Objectif du travail
  - Ce qui a été fait
  - Les améliorations à apporter
  - En quoi ce projet était difficile
  - Conclusion
- Description technique
  - Objectif du travail
  - Technologies utilisées :
      - [x] CSS
      - [x] BootStrap
      - [x] JavaScript
      - [x] JQuery
      - [x] AJAX
      - [x] JSON
      - [x] JSP
      - [x] JSTL
      - [x] Servlet
      - [x] MAIL
      - [x] EL expression
      - [x] Pool
      - [x] Realm
      - [x] Valve
      - [x] SSL
  - Les améliorations à apporter
  - En quoi ce projet était difficile
  - Conclusion
- Documentation utilisateur(tutoriel)
  - Objectif de cette application
  - Du point de vue de l'utilisateur

---

### Déploiement :

Décrit l’installation et le déploiement de ce projet. Plus cette documentation sera courte, mieux
ce sera. Notamment, le déploiement sur une machine donnée, avec un nom de contexte donné et un nom de
base donné doit nécessiter le moins de travail possible.

==> WAR
==> Driver PostgreSQL,MAIL et modif META-INF/context.xml
==> Librairies et CLASSPATH
==> Spécification du CSS dans WEB-INF/web.xml

Pour commencer, placez le fichier `Kwa2Bo.war` dans le dossier `/webapps/` de votre tomcat.


---

### Synthèse :

- #### I/ Objectif du travail

- #### II/ Ce qui a été fait
  - Ce qui a été fait
    - [x] MCD/MLD
    - [x] Créer la base de données
    - [x] Maquette du site

- #### III/ Les améliorations à apporter

- #### IV/ En quoi ce projet était difficile

- #### V/ Conclusion

---

### Description technique du projet :

- #### I/ Objectif techniques du travail

- #### II/ Principe de réalisation

- #### III/ Difficultés techniques rencontrées et solutions apportées

- #### IV/ Conclusion

---

### Documentation utilisateur :

- #### I/ Qu'es acò Kwa2Bo ?

Kwa2Bo, tu ne sais pas ce que c'est !? et bien très chère, c'est **LA** messagerie de l'université !
Pour rentré dans les détails, Kwa2Bo c'est une messagerie (ou plus précisément un salon de discussion) simple, rapide et efficace, qui permet de se retrouver afin de discuter et s'envoyer des images. Tout cela de façon sécurisé bien sûr et dans la gratuité la plus totale.

- #### II/ Comment ça marche ?

Cette histoire vous sera conté ici en plusieurs actes.

##### Acte 1 - L'inscription

Comme tout bon site web de messagerie qui se respecte, la partie inscription est bien évidement obligatoire. Mais ici tout est très simple ! Lors de votre arrivé sur la page d'accueil du site, vous allez tout de suite pouvoir remarquer le formulaire d'inscription :

![alt tag](https://raw.githubusercontent.com/rfevre/Kwa2Bo/master/docs/screen/Accueil_Kwa2Bo.png)

Ici, il ne reste plus qu'a faire appel à vos petites mimines afin de remplir ce jolie formulaire d'inscription. Mais il n'est pas simplement jolie ! Il vous informera aussi si vous ne respectez pas ce qui est attendu dans chacun des champs.

Après avoir validé le formulaire, un mail vous sera envoyé sur l'adresse de messagerie que vous avez indiqué. Ce mail contient un lien qui permettra de valider votre inscription sur Kwa2Bo.

#### Acte 2 - La connexion

Vous voyez la barre en haut de l'image précédente, et bien grâce au champs qui se situe tout à droite, vous allez pouvoir vous connecter sur Kwa2Bo ! Il suffit juste de les remplirs avec le mail et le mot de passe utilisé lors de votre inscription.

Ici aussi c'est un peu magique, si vous rentrez des informations incorrect, vous aurez le droit à un message de la sorte afin de vous prévenir :

![Alt text](/home/fevrer/tomcat/webapps/Kwa2Bo/docs/screen/Login_Kwa2Bo.png "Se connecter au site Kwa2Bo")

#### Acte 3 - Les discussions

C'est votre 1ére connexion sur Kwa2Bo, vous êtes tout excité et vous vous dites : "Wouaw le designer de ce site à vraiment fait du bon boulot, je m'y retrouve parfaitement et je sais très clairement ou je doit cliquer pour créer une conversation ou discuter sur une conversation déjà existante !" et c'est normal. Mais je vais tout de même expliqué comment tout cela fonctionne (après tout on est bien ici dans le manuel utilisateur).

![Alt text](/home/fevrer/tomcat/webapps/Kwa2Bo/docs/screen/Discussion_Kwa2Bo.png "Discussion sur le site Kwa2Bo")

- La barre en haut à changé ! grâce à elle vous allez pouvoir naviguer sur le site et vous déconnecter en cliquant sur votre adresse mail tout à   droite.

- Sur votre gauche, les discussions auxquelles vous participez. Cliquez dessus, et hop ! Une fenetre s'ouvre sur la discussion concerné. Dans cette fenetre, vous allez pouvoir envoyer des messages et des photos de façon illimité !

- Sur votre droite, vous allez pouvoir créer un groupe. Un groupe c'est une discussion auquel on rattache un ou plusieurs membre(s). Choissisez un nom pour votre groupe, et les personnes avec lesquels vous voulez discuté. Quand tout est prêt, appuyez sur le bouton "Créer".

Comment !? la personne que vous voulez ajouter au groupe n'est pas présente dans la liste ... hummm ... c'est qu'elle ne doit pas encore être présente dans votre liste de contacts bien sur ! Il vous faut l'ajouter !

#### Acte 4 - Les contacts

Vous vous souvenez de la barre de navigation dont je vous ai parlé précédement, et bien cliquez sur l'image en forme de bonhomme. Et pouf ! vous voila sur la page de gestion des contacts :

![Alt text](/home/fevrer/tomcat/webapps/Kwa2Bo/docs/screen/Contacts_Kwa2Bo.png "Gestion des contacts du site Kwa2Bo")

- Sur votre gauche, vous pouvez rechercher dans la liste de tous les utilisateurs du site, une personne à ajouter a votre liste de contacts, par ce que vous la trouvez "cool".

- Sur votre droite, vous pouvez rechercher dans votre liste de contacts, une personnes que vous voulez supprimer par ce que vous ne l'aimez plus et que du coup c'est plus votre ami pour la vie.

#### Acte 5 - Le profil

Vous vous êtes trompé de "Pseudo" lors de l'inscription, ou alors vous êtes dans l'obligation de changer de mot de passe, et bien pas de panique ! La page de profil est la pour ça !

Encore une fois dans la barre de navigation que vous devez à présent connaitre, cliquez sur l'image qui représente un engrenage, et vous voila propulsé vers la page de profil :

![Alt text](/home/fevrer/tomcat/webapps/Kwa2Bo/docs/screen/Profil_Kwa2Bo.png "Page de profil du site Kwa2Bo")

- Tout est toujours très simple, renseignez les champs que vous voulez modifier puis cliquez sur le bouton "Enregistrer les modifications".

- Si par contre vous voulez modifier votre mot de passe, cliquez sur le bouton "Modifier le mot de passe", une fenetre va s'ouvrir en vous demandant votre ancien mot de passe, ainsi que le nouveau.

Pour chaque modification réussi, un message vous indiquant que tout c'est bien passé s'affichera devant vos yeux ébahis.
