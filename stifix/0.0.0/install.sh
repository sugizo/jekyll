#!/bin/sh

start=$(date +%s)

# Use RVM
source ~/.rvm/scripts/rvm

# Install Package
source ~/.rvm/scripts/rvm
gem install jekyll bundler jekyll-minifier jekyll-sitemap

# Create New Site
mkdir -p ~/project/ruby/
cd ~/project/ruby/
git clone https://github.com/andrewbanchich/highlights-jekyll-theme
rm -rf ~/project/ruby/stifix
mv highlights-jekyll-theme stifix

# install app
rm -f ~/project/ruby/stifix/README.md
rm -rf ~/project/ruby/stifix/_data/*
rm -rf ~/project/ruby/stifix/_includes/*
rm -rf ~/project/ruby/stifix/_layouts/*
rm -rf ~/project/ruby/stifix/asseets/*
rsync -zavr ~/Cloud/Dropbox/Programming/Ruby/Jekyll/stifix/0.0.0/ ~/project/ruby/stifix/

# Serve Site
source ~/.rvm/scripts/rvm
cd ~/project/ruby/stifix
bundle exec jekyll serve --host 0.0.0.0

# Access Server via Browser
#http://localhost:4000

# Generated Static Site is on _site folder
source ~/.rvm/scripts/rvm
jekyll build

# check public folder change external js and css into internal (save) then concat and minify it

end=$(date +%s)
diff=$(( $end - $start ))

echo Duration = $diff Seconds
echo Finished at = `date +%Y-%m-%d\ %H:%M:%S`
