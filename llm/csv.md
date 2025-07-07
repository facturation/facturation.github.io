---
layout: default
title: 'Scinder un fichier CSV'
parent: Taches assistées par l'IA
nav_order: 100
---

Dans notre outil, lorsque vous importer des données CSV, le fichier CSV importé ne doit pas contenir plus de 500 lignes. Si votre fichier est plus gros, alors il faut le scinder en autant de fichiers de 500 lignes que nécessaire. Il vous suffit de transmettre votre fichier CSV à votre IA, accompagné du prompt suivant:

```text
Peux tu me séparer le fichier CSV joint en autant de fichiers CSV que nécessaire, chaque fichier doit reprendre la ligne d'entête du fichier original, et ne doit pas contenir plus de 500 lignes, en incluant la ligne d'entête (donc au plus 499 lignes de données)
```