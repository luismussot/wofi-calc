# Description: Generates a new aur release.
# WARNING: If this script fail, run the next command. If you cannot clone it means
#          You have permission errors, or most likely, you exceeded the AUR daily quota.
#
#          git clone ssh://aur.archlinux.org/wofi-calc-git.git

# Generate the checksums automatically
sed -i "s/^sha256sums=.*/$(makepkg -g -f -p PKGBUILD)/" ./PKGBUILD

# Generate pagkage metadata
makepkg --printsrcinfo > ./.SRCINFO

# Push it to AUR
git add ./PKGBUILD ./.SRCINFO
git commit -m "New version"
git push ssh://aur@aur.archlinux.org/wofi-calc-git.git master

# Bye
echo -e "\n-------------------------------------------------------------------"
echo -e "NEW VERSION GENERATED\n"