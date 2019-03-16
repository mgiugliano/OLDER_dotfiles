#!/usr/bin/env bash

# Install "z", "jump around" - https://github.com/rupa/z/
rm -f ~/tmp/z
git clone --depth 1 https://github.com/rupa/z/ ~/tmp/z
chmod +x ~/tmp/z/z.sh
command mv ~/tmp/z/z.sh /usr/local/bin/
command mv ~/tmp/z/z.1 /usr/local/share/man/man1
command rm -rf ~/tmp/z

rm -f ~/tmp/fff
git clone --depth 1 https://github.com/dylanaraps/fff ~/tmp/fff
chmod +x ~/tmp/fff/fff
command mv ~/tmp/fff/fff /usr/local/bin
command mv ~/tmp/fff/fff.1 /usr/local/share/man/man1
command rm -rf ~/tmp/fff


npm install wikit -g

# Download and installs "PubMed Utils"

# Download scihub2pdf
#sudo pip install scihub2pdf
#npm install -g phantomjs

#sudo pip install bibcure


# Dowload and install Jekyll (for static websites)
gem install bundler jekyll
