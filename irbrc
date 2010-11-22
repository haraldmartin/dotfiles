#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'
# require 'rubygems'
# require 'interactive_editor'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  
  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'script/rails' && defined?(Rails)

alias :x :exit

# http://judofyr.net/posts/copy-paste-irb.html
def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

# http://github.com/ryanb/dotfiles/commit/78c149fb7e9ac1f2d89ed3a7518aee293b63b747
def copy_session
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

def ep
  eval(paste)
end
