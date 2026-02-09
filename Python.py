
import os
import requests

script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)

#créer dossier (s'il n'existe pas) pour suavegarder les images
dossier_images = "images_picsum"
if not os.path.exists(dossier_images):
    os.makedirs(dossier_images)

#demander à l'utilisateur le nombre d'images à souhaiter
nbimages=input("Combien d'images voulez-vous d'images? ")

#télécharger le nombre d'images aléatoires souhaité
for i in range(1, int(nbimages)+1):
    url = "https://picsum.photos/600/800?=random" + str(i)# URL pour obtenir une image aléatoire de 600x800
    try:
        reponse = requests.get(url, stream=True)
        if reponse.status_code == 200:
            path_image = os.path.join(dossier_images, f"image_{i}.jpg")
            fichier=open(path_image, 'wb')
            fichier.write(reponse.content)
            fichier.close()
            print(f"Téléchargement de l'image {i} réussi.")
    except Exception as e:
        print("Échec du téléchargement de l'image", str(i), ":", str(e))

        from PIL import Image

# Charger les images en mémoire
a = Image.open("images/photo1.jpg")
b = Image.open("images/photo2.jpg")
c = Image.open("images/photo3.jpg")

# Afficher une image
from PIL import Image

# Charger les images en mémoire
a = Image.open("images/photo1.jpg")
b = Image.open("images/photo2.jpg")
c = Image.open("images/photo3.jpg")

# Afficher une image
1=dossier_images
