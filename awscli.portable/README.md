# AWS Command-Line Interface v2

`awscli` permet d'interagir en terminal avec AWS. Le paquet `awscli.portable` s'installe sans les droits d'administration, dans le profil utilisateur.

> Le suffixe `.portable` est une convention Chocolatey qui identifie un paquet qui s'installe sans les droits d'administration, et est généralement distribué sous la forme d'une archive `zip`.

Le logiciel d'installation d'`awscli` nécessite les droits d'administration pour l'installer dans `C:\Program Files`. C'est toutefois un MSI, et on utilise `msiexec` pour extraire les fichiers sous `%LocalAppData%\Amazon\AWSCLIV2`. On ajoute ensuite le chemin au `PATH` utilisateur.

Ce paquet est basé sur celui de la communauté, [awscli](https://community.chocolatey.org/packages/awscli).
