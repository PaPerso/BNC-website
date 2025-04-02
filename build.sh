#!/bin/bash

# Dossier de sortie
mkdir -p dist

# Lire les partials
HEADER=$(cat partials/header.html)
FOOTER=$(cat partials/footer.html)

# Pour chaque page source
for PAGE in index produits localisation commande contact
do
  # Lire le contenu sans header/footer
  CONTENT=$(sed -n '/<main/,/<\/main>/p' $PAGE.html)

  # Construire la page complète
  echo "<!DOCTYPE html>
<html lang=\"fr\">
<head>
  <meta charset=\"UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <title>Cakes & Brunchs - ${PAGE^}</title>
  <script src=\"https://cdn.tailwindcss.com\"></script>
</head>
<body class=\"bg-yellow-50 text-gray-800\">
  $HEADER
  $CONTENT
  $FOOTER
</body>
</html>" > dist/$PAGE.html

  echo "✅ Page $PAGE.html générée"
done
