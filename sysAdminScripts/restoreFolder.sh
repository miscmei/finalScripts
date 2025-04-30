echo ""
echo "----------Welcome to the Restore Folder Page----------"
echo ""

read -p "Enter the folder where the backup file is: " backup_dir

# check if the desired folder exists
if [ ! -d "$backup_dir" ]; then
    echo "Error: File '$backup_dir' not found."
    exit 1
else
    cd "$backup_dir" || {
        echo "Failed to change directory to '$backup_dir'."
        exit 1
    }
    echo "Changed to directory: $(pwd)"
    cd $backup_dir
fi

read -p "Enter the name of the .tar.gz file you want to restore: " backup_file
if [ ! -f "$backup_file" ]; then
    echo "Error: File '$backup_file' not found in '$backup_dir'."
    exit 1
fi



read -p "Enter directory you want to put the restored folder (or name a new folder): " restore_dir

# Create the destination directory if it doesn't exist
if [ ! -d "$restore_dir" ]; then
    echo "Directory '$restore_dir' does not exist. Creating it..."
    mkdir -p "$restore_dir" || {
        echo "Failed to create restore directory. Exiting."
        exit 1
    }
fi


echo "Restoring backup in $restore_dir..."
tar xvzpf "$backup_file" -C "$restore_dir" || {
    echo "Restore failed."
    exit 1
}

echo "Backup restored successfully!"
echo ""