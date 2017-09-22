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

echo "=> Removing $gh_desc ..."
sudo rm -rf "/usr/share/claws-mail/themes/Papirus" \
  "/usr/share/claws-mail/themes/Papirus-Adapta" \
  "/usr/share/claws-mail/themes/Papirus-Adapta-Nokto" \
  "/usr/share/claws-mail/themes/ePapirus" \
  "/usr/share/claws-mail/themes/Papirus-Dark" \
  "/usr/share/claws-mail/themes/Papirus-Light"
echo "=> Done!"
