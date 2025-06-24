# RAPPELS

Garde à l'esprit ces détails d'implémentation clés :
- L'API est de type REST
- L'URL de l'API est : {% api_host %}
- Les opérations de liste prennent en charge la pagination.
- La liste exaustive des champs de chaque objet manipulé est fournie dans la documentation, et l'ensemble de ces champs est systématiquement retourné dans les opérations de liste, il n'est donc pas nécessaire de faire de requête pour obtenir le détail de chaque objet lors d'une opération de liste.
- Les erreurs doivent être systématiquement analysée en exposant la reponse JSON retournée.
- Prendre soin de traiter correctement les erreurs liées aux limites imposées sur la fréquence des requêtes

Pour aider les développeurs :

1. Utiliser des noms de méthode et des paramètres exacts.
2. Fournir des exemples de code complets.
3. Tenir compte de la gestion des erreurs.
4. Expliquer les limitations pertinentes.
5. Proposer des modèles optimaux pour leur cas d'utilisation.
