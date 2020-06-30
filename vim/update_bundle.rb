#!/usr/bin/env ruby

git_bundles = %q{
  # Appearance + file management
  powerline/powerline
  junegunn/fzf.vim
  scrooloose/nerdtree

  # For instance if you type an '(', ``autoclose`` will automatically insert a ')' and put the cursor between than
  " Townk/vim-autoclose.git

  # Git
  airblade/vim-gitgutter
  tpope/vim-fugitive.git
  tpope/vim-git.git

  # Ruby + Rails stuff
  tpope/vim-rails.git
  vim-ruby/vim-ruby
  tpope/vim-bundler.git

  # Syntax supports
  othree/html5-syntax.vim.git
  tpope/vim-markdown.git

  # HTML
  # ctrl-x tags for html php osv
  tpope/vim-ragtag.git
  
  # Snippets
  # haraldmartin/vim-snipmate.git
  # scrooloose/snipmate-snippets.git
  # SirVer/ultisnips.git
  
  # dispatch.vim: asynchronous build and test dispatcher
  tpope/vim-dispatch

  # Navigating, cs' etc
  tpope/vim-surround.git
  vim-scripts/camelcasemotion.git
  tpope/vim-unimpaired.git
  vim-scripts/Align.git
  tpope/vim-endwise
  vim-scripts/tComment.git

  # Languages
  vim-scripts/JavaScript-Indent.git

  # Colors
  junegunn/seoul256.vim
  vim-scripts/peaksea
  joshdick/onedark.vim
  drewtempelmeyer/palenight.vim

  # Python + Django
  tweekmonster/django-plus.vim

  # Formatters
  pappasam/vim-filetype-formatter

} .split(/\n/)
  .compact
  .reject { |i| i =~ /^\s*#/ || i.strip == "" }
  .map(&:strip)

require 'fileutils'

bundle_dir = File.expand_path('../bundle/', __FILE__)

# Find unlisted bundles (bundles not on disk will the script checkout)
bundles_listed   = git_bundles.map { |url| url.split('/').last.sub('.git', '')}.map &:downcase
bundles_on_disk  = Dir["#{bundle_dir}/*"].map { |path| File.basename(path) }.map &:downcase
bundles_unlisted = bundles_on_disk - bundles_listed

if bundles_unlisted.any?
  puts 
  puts "*** Some bundles found on disk but not on file ***"

  bundles_unlisted.each do |bundle|
    url = File.read("#{bundle_dir}/#{bundle}/.git/config").match(/url = (.+)$/)[1] rescue nil
    puts "#{bundle} (#{url})"
    puts "moving into bundles-disabled/"
  end

  puts
end

git_bundles.each do |url|
  dirname = File.basename(url).sub(/\.git$/, '')
  puts "* Unpacking #{url} into #{dirname}"
  dir = File.join(bundle_dir, dirname)
  `cd #{dir} 2>/dev/null && git pull || git clone https://github.com/#{url} #{dir}`
end

puts "* Updating to latest pathogen"
autoload_dir = File.expand_path('../autoload', __FILE__)
`curl -s --location http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim > #{autoload_dir}/pathogen.vim`
