Pry.config.editor = "vim"

#Pry.commands.alias_command 'c', 'continue'
#Pry.commands.alias_command 's', 'step'
#Pry.commands.alias_command 'n', 'next'
#Pry.commands.alias_command 'f', 'finish'
#
#Pry::Commands.delete 'c'
#Pry::Commands.delete 'n'
#Pry::Commands.delete 's'
#Pry::Commands.delete 'f'

def show_screen
  if respond_to?(:save_screenshot)
    page.save_screenshot("screenshot.png")
    system("open 'screenshot.png'")
  end
end

begin
  require 'awesome_print' 
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts "no awesome_print :("
end

begin
  require 'pry-clipboard'
  # aliases
  Pry.config.commands.alias_command 'ch', 'copy-history'
  Pry.config.commands.alias_command 'cr', 'copy-result'
rescue LoadError => e
  warn "can't load pry-clipboard"
end
