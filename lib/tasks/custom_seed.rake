
namespace :db do
  namespace :seed do

    # Dynamically generate a task for each file under /db/seeds/
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').to_sym
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end

  end
end
