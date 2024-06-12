#!/bin/bash

# Définir les variables
SOURCE_DIR="/root/ceremonyclient/node/.config"
BACKUP_DIR="/home/ubuntu/backup_temp"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
ARCHIVE_NAME="nod5_quil_$TIMESTAMP.zip"
LOCAL_ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"
LOCAL_COPY_DIR="$BACKUP_DIR/dossier_temp_$TIMESTAMP"
GDRIVE_FOLDER_ID=""

# Créer une copie locale du dossier
echo "Copie locale du dossier..."
cp -r $SOURCE_DIR $LOCAL_COPY_DIR

# Vérifier si la copie a été effectuée avec succès
if [ $? -eq 0 ]; then
    echo "Copie locale réussie: $LOCAL_COPY_DIR"
else
    echo "Erreur lors de la copie locale"
    exit 1
fi

# Créer l'archive zip à partir de la copie locale
echo "Création de l'archive zip..."
zip -r $LOCAL_ARCHIVE_PATH $LOCAL_COPY_DIR

# Vérifier si l'archive a été créée avec succès
if [ $? -eq 0 ]; then
    echo "Archive zip créée avec succès: $LOCAL_ARCHIVE_PATH"
else
    echo "Erreur lors de la création de l'archive zip"
    exit 1
fi

# Copier l'archive zip sur Google Drive
echo "Copie de l'archive zip sur Google Drive..."
gdrive files upload --parent $GDRIVE_FOLDER_ID $LOCAL_ARCHIVE_PATH

# Vérifier si la copie a été effectuée avec succès
if [ $? -eq 0 ]; then
    echo "Copie sur Google Drive réussie"
else
    echo "Erreur lors de la copie sur Google Drive"
    exit 1
fi

# Supprimer l'archive zip après la copie
rm $LOCAL_ARCHIVE_PATH

# Optionnel : Supprimer la copie locale du dossier
rm -r $LOCAL_COPY_DIR

echo "Sauvegarde terminée avec succès"
