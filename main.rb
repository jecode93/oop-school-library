require './app'

def all_options
  puts "\nPlease choose and option by entering a number:
1 - List all books\n2 - List all people\n3 - Create a person
4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person id
7 - Exit"
end

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    all_options
    option = gets.chomp.to_i
    break puts 'Thank you for using this app!' if option == 7

    app.actions(option)
  end
end

main
