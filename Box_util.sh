#!/bin/bash 


gnome_pkg_remove=("aisleriot" "cheese" "evolution" "gnome-2048" "gnome-chess" "gnome-contacts" "gnome-games" "gnome-klotski" "gnome-mahjongg" "gnome-mines" "gnome-robots" "gnome-music" "gnome-nibbles" "gnome-sound-recorder" "gnome-sudoku" "gnome-sushi" "gnome-taquin" "gnome-tetravex" "gnome-software" "libreoffice-base-core" "libreoffice-core" "libreoffice-calc" "libreoffice-impress" "libreoffice-draw" "libreoffice-math" "libreoffice-writer" "rhythmbox" "shotwell")

tempfile=$(mktemp /tmp/package_remove.XXXXXX) || exit 1

gnome_remove() {
    dialog --title "Package Remover" \
       --checklist "Select packages to Remove" 15 40 4 \
       "${gnome_pkg_remove[@]}" 2>"$tempfile"

    # Read user choices from the temporary file
    selected_packages=$(<"$tempfile")

    # Remove the temporary file
    rm -f "$tempfile"

    # Check if user made selections and remove selected packages
    if [ -n "$selected_packages" ]; then
        apt-get remove "$selected_packages"
    else
        echo "No packages selected. Exiting."
    fi
}

# Call the function
gnome_remove

