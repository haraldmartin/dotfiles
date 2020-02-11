git_bundles = %q{
  # Appearance + file management
  Lokaltog/vim-powerline.git
  kien/ctrlp.vim
  mileszs/ack.vim.git
  scrooloose/nerdtree

  # For instance if you type an '(', ``autoclose`` will automatically insert a ')' and put the cursor between than
  Townk/vim-autoclose.git

  # Git
  airblade/vim-gitgutter
  tpope/vim-fugitive.git
  tpope/vim-git.git

  # Themes
  chriskempson/vim-tomorrow-theme.git

  # Ruby + Rails stuff
  dtyuan/vim-rspec.git
  henrik/vim-ruby-runner.git
  tpope/vim-rails.git
  vim-ruby/vim-ruby

  # Syntax supports
  groenewege/vim-less.git
  kchmck/vim-coffee-script.git
  othree/html5-syntax.vim.git
  tpope/vim-haml.git
  tpope/vim-markdown.git
  vim-scripts/Arduino-syntax-file.git

  # HTML
  tpope/vim-ragtag.git
  
  # Snippets
  haraldmartin/vim-snipmate.git
  scrooloose/snipmate-snippets.git

  # vim interface to Web API
  # mattn/webapi-vim
  
  # Bundle, Bopen etc
  tpope/vim-bundler.git

  # dispatch.vim: asynchronous build and test dispatcher
  tpope/vim-dispatch

  # Navigating, cs' etc
  tpope/vim-surround.git

  # Navigating and toggling optins, like [n, [ow etc
  tpope/vim-unimpaired.git

  vim-scripts/Align.git
  vim-scripts/ColorX.git
  vim-scripts/Gist.vim.git
  vim-scripts/JavaScript-Indent.git
  vim-scripts/camelcasemotion.git
  vim-scripts/endwise.vim.git
  vim-scripts/tComment.git
  chriskempson/base16-vim

  # sjl/vitality.vim.git
  # toyamarinyon/vim-swift
  rorymckinley/vim-symbols-strings
  christophermca/meta5

  #_new_color_schemes
  junegunn/seoul256.vim
  vim-scripts/peaksea
  joshdick/onedark.vim

  #_distraction_free_writing
  junegunn/goyo.vim
  junegunn/limelight.vim
  amix/vim-zenroom2

  #altercation/vim-colors-solarized
  #junegunn/vim-emoji
  #wavded/vim-stylus
  #ervandew/screen
  #elixir-lang/vim-elixir
  atelierbram/vim-colors_duotones

  # Python + Django
  tweekmonster/django-plus.vim
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
  end
  puts
end

git_bundles.each do |url|
  dirname = File.basename(url).sub(/\.git$/, '')
  puts "* Unpacking #{url} into #{dirname}"
  dir = File.join(bundle_dir, dirname)
  puts dir
  `cd #{dir} 2>/dev/null && git pull || git clone https://github.com/#{url} #{dir}`
  # puts "cd #{dir} 2>/dev/null && git pull || git clone https://github.com/#{url} #{dir}"
end

puts "* Updating to latest pathogen"
autoload_dir = File.expand_path('../autoload', __FILE__)
`curl -s --location http://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim > #{autoload_dir}/pathogen.vim`
