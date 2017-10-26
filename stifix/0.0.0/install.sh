#!/bin/sh

start=$(date +%s)

# Use RVM
source ~/.rvm/scripts/rvm

# Install Package
gem install jekyll bundler

# Create New Site
mkdir -p ~/project/ruby/
cd ~/project/ruby/
git clone https://github.com/andrewbanchich/highlights-jekyll-theme
mv highlights-jekyll-theme stifix

# install app
rm -rf ~/project/ruby/stifix/README.md
rm -rf ~/project/ruby/stifix/_includes/*
rm -rf ~/project/ruby/stifix/_layouts/*
rsync -zavr ~/Cloud/Dropbox/Programming/Ruby/Jekyll/stifix/0.0.0/ ~/project/ruby/stifix/

# Serve Site
cd stifix
bundle exec jekyll serve --host 0.0.0.0

# Access Server via Browser
#http://localhost:4000

# Generated Static Site is on _site folder
jekyll build

# check public folder change external js and css into internal (save) then concat and minify it

end=$(date +%s)
diff=$(( $end - $start ))

echo Duration = $diff Seconds
echo Finished at = `date +%Y-%m-%d\ %H:%M:%S`
