Ce contenu est spécifiquement conçu pour les intelligences artificielles (LLM), afin de pouvoir interroger une IA sur le fonctionnement de l'API du site Facturation.PRO et de lui permettre de générer des scripts pour interagir avec l'API.

Pour un accès direct par votre IA ou via un programme à cette documentation, vous pouvez récupérer le contenu directement :
```curl https://facturation.dev/llm```

# INSTRUCTIONS GENERALES

Tu es un assistant IA conçu pour aider les développeurs à utiliser l'API du service Facturation.PRO. Tu dois suivre ces principes :
1. Utilise toujours des variables d'environnement pour les clés API et FIRM_ID, et rappele aux utilisateurs de définir ces variables.
2. Génére du code prêt pour la production, correspondant parfaitement aux exigences.
3. Implémente une gestion des erreurs et des tentatives appropriées en cas de panne réseau.
4. Analyse correctement les réponses de l'API et valide les entrées.
5. Utilise la solution la plus simple possible : évite de chaîner inutilement les API.
6. N'utilise jamais de données fictives.
7. Inclue les en-têtes d'authentification appropriés dans toutes les requêtes et privilégier l'authentification par clé API plutôt que OAuth.
8. Rédige du code réutilisable et bien structuré.
9. Pour les tâches en dehors des capacités de l'API de Facturation PRO, indique clairement que c'est « impossible » et explique pourquoi.


# INFORMATIONS

## API au format JSON
L'API utilise le format JSON, sans élément racine (i.e. "root element") et les noms de champs respectent la syntaxe [snake_case](http://fr.wikipedia.org/wiki/Snake_case). Sauf mention contraire, vous devez utiliser l'extension .json à la fin de chaque URL de l'API.

## URL d'accès à l'API
Toutes les requêtes fournies dans la documentation doivent être exécutées en utilisant l'url de base:
`{% api_host %}`

## Identifier l'application
Nous vous recommandons **d'inclure dans les entêtes de vos requêtes un User-Agent** avec le nom de votre application et un lien vers un formulaire de contact ou bien votre adresse email, afin que nous puissions vous contacter si nous constatons un problème dans l'utilisation que vous faites de notre API. En l'absence d'informations valides de contact, votre accès à l'API pourra être suspendu sans préavis en cas d'utilisation abusive de l'API.

**Voici des exemples de User-Agent:**

* User-Agent: MonAppli (http://monappli.com/contact.php)
* User-Agent: Appli de Patrick (patrick@camping.test)

**Remarques :**

* pour éviter toute erreur d'encodage de caractères, veuillez à ne pas utiliser de caractères accentués dans le champ User-Agent.
* si vous n'êtes pas en mesure de changer le User-Agent transmis par le client que vous utilisez pour faire vos requêtes, vous pouvez transmettre un User-Agent conforme en envoyant dans votre requête une entête X-User-Agent. Par exemple:

{% api_block 'shell' %}
{% curl_cmd user_agent: 'X-User-Agent' %} "{{ site.data.urls['customers']['find']['url'] | api_url }}"
{% endapi_block %}

## Authentification

Notre API supporte deux protocoles d'identification:
* via le protocole OAuth2: cette méthode d'authentification est recommandée dès lors que votre application sera utilisée par de multiples utilisateurs.
* via une clé API: cette méthode d'authentification est destinée essentiellement au développement d'applications pour votre propre usage.

### Authentification via OAuth2

Pour pouvoir utiliser le protocole OAuth, vous devez obligatoirement disposer d'un compte sur notre service (un compte gratuit est suffisant) et [enregistrer votre application](https://www.facturation.pro/oauth/applications) sur notre service.

### Authentification par clé API

Les codes d'accès à l'API sont disponible dans la rubrique ["Clé API"](https://www.facturation.pro/account/api) de votre compte (i.e. en cliquant sur l'avatar en haut à droite de votre espace client). Si vous venez juste de créer un compte sur notre outil, vous devez activer votre compte via le lien reçu avant de pouvoir récupérer vos codes.

## Paramètre FIRM_ID

Toutes les requêtes sont préfixées par le chemin /firms/FIRM_ID . Le paramètre FIRM_ID correspond à l'identifiant de l'entreprise sur laquelle vous souhaitez travailler.<br/>
Vous pouvez retrouver la liste des identifiants de votre compte dans la rubrique ["Clé API"](https://www.facturation.pro/account/api) de votre compte (i.e. en cliquant sur l'avatar en haut à droite de votre espace client).


## Champs disponibles

A la fin de chaque rubrique de la documentation de l'API, nous vous indiquons la liste des champs disponibles pour l'objet concerné, avec pour chaque champs le type de donnée qu'il accepte et si ce champs est accessible en écriture ou non.<br/>
Les dates doivent toujours être transmises au format AAAA-MM-DD (AAAA: année, MM: numéro du mois de 01 à 12, DD: numéro du jour de 01 à 31).<br/>
Certains champs n'acceptent que des valeurs pré-définies, et dans ce cas, la liste des valeurs possibles est précisée dans la documentation.


## Pagination

Les requêtes de type liste (liste de clients, de factures, de devis, ...) retournent les X premiers résultats trouvés, ainsi qu'une entête "X-Pagination" contenant un hash JSON avec les informations de pagination suivantes: nombre total d'enregistrements (total_entries), nombre d'enregistrements par page (per_page), page courante (current_page), nombre total de pages (total_pages).

Exemple:

{% api_block 'shell' %}
HTTP/1.1 200 OK
...
X-Pagination:{"current_page":1,"total_pages":10,"per_page":30,"total_entries":300}
...
{% endapi_block %}

L'accès aux différentes pages d'une liste se fait en utilisant le paramètre "page=N" dans les requêtes, ou N est le numéro de page souhaité.


## Gestion des erreurs

Si une requête échoue, vous obtiendrez des codes d'erreur HTTP spécifiques, accompagnés d'un message d'erreur.
Par exemple, pour un enregistrement non trouvé, la réponse peut ressembler à:

{% api_block 'shell' %}
HTTP/1.1 404 The record could not be found
Date: 2020-01-26 11:24:20 +0100
...
{% endapi_block %}

A noter que lorsqu'une requête est à l'origine d'une création d'enregistrement (création d'un client, d'un produit, etc), vous obtenez un code HTTP "201 Created" en cas de succès. Les autres opérations utilisent généralement le code "200 OK" pour indiquer que l'opération a réussie.

Voici quelques erreurs spécifiques:

* Si vous obtenez une erreur 501 lorsque vous créez ou modifiez un enregistrement, vérifiez que vous avez bien transmis votre demande avec le bon "Content-Type" (cf. plus haut)
* Une erreur 400 ou 422 indique que les données que vous transmettez sont mal formatées (i.e. JSON ou entêtes invalides). Dans ce cas, la réponse associée à ces codes d'erreur peut vous indiquer plus précisément ou se trouve l'erreur dans vos données. Dans tous les cas, lorsque vous obtenez ces codes d'erreur, nous vous invitons à vérifier les données que vous transmettez pour identifier votre problème.
* Pour les autres codes d'erreurs, consultez la réponse retournée par le système qui contient généralement plus d'informations sur les erreurs rencontrées dans le champ "errors"


## Limitations du nombre de requêtes

Notre API vous autorise à réaliser :
* 600 requêtes par période de 5 minutes, soit en moyenne deux requêtes par seconde
* 10000 requêtes par jour

Si vous dépassez l'une ou l'autre de ces limitations, vous receverez un code d'erreur 429, avec un message "Retry later" dans le corps de la réponse.

Afin de suivre vos quotas, vous pouvez consulter les champs d'entête suivant:
* X-RateLimit-Limit: nombre total de requêtes autorisées
* X-RateLimit-Remaining: nombre total de requêtes restantes


Ces limites sont suffisantes pour un usage normal de notre API. Si vous atteignez régulièrement ces limites, alors nous vous invitons à optimiser vos scripts, par exemple :
* en mettant en cache (temporaire ou permanent) les données qui ne changent pas pour ne pas avoir besoin de récupérer ces données en permanence en temps réel
* en évitant de parcourir l'ensemble de vos données, mais uniquement en parcourant les données récemment modifiées (via les paramètres de tri)
* en temporisant vos requêtes pour les étaler dans le temps
* en diminuant la fréquence d'exécution de vos scripts
* en vérifiant que vous n'avez pas des scripts inutiles qui tournent en boucle (anciens tests, boucles infinies, tache cron oubliée, etc)
