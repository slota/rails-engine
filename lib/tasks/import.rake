require 'csv'
desc "Imports csv file into database"
task :import, [:filename] => :environment do
  CSV.foreach('myfile.csv', :headers => true) do |row|
    MyModel
end
