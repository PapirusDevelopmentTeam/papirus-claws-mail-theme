#!/bin/sh

set -e

gh_repo="papirus-claws-mail-theme"
gh_desc="Papirus icons for Claws Mail"

cat <<- EOF



      ppppp                         ii
      pp   pp     aaaaa   ppppp          rr  rrr   uu   uu     sssss
      ppppp     aa   aa   pp   pp   ii   rrrr      uu   uu   ssss
      pp        aa   aa   pp   pp   ii   rr        uu   uu      ssss
      pp          aaaaa   ppppp     ii   rr          uuuuu   sssss
                          pp
                          pp


  $gh_desc
  https://github.com/PapirusDevelopmentTeam/$gh_repo


EOF

temp_dir=$(mktemp -d)

echo "=> Getting the latest version from GitHub ..."
wget -O "/tmp/$gh_repo.tar.gz" \
  https://github.com/PapirusDevelopmentTeam/$gh_repo/archive/master.tar.gz
echo "=> Unpacking archive ..."
tar -xzf "/tmp/$gh_repo.tar.gz" -C "$temp_dir"
echo "=> Deleting old $gh_desc ..."
sudo rm -rf "/usr/share/claws-mail/themes/Papirus" \
  "/usr/share/claws-mail/themes/ePapirus" \
  "/usr/share/claws-mail/themes/Papirus-Dark" \
  "/usr/share/claws-mail/themes/Papirus-Light"
echo "=> Installing ..."
sudo mkdir -p /usr/share/claws-mail/themes
sudo cp --no-preserve=mode,ownership -r \
  "$temp_dir/$gh_repo-master/Papirus" \
  "$temp_dir/$gh_repo-master/ePapirus" \
  "$temp_dir/$gh_repo-master/Papirus-Dark" \
  "$temp_dir/$gh_repo-master/Papirus-Light" \
  /usr/share/claws-mail/themes
echo "=> Clearing cache ..."
rm -rf "/tmp/$gh_repo.tar.gz" "$temp_dir"
echo "=> Done!"
