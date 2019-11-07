require 'sequel'

Sequel::Model.plugin :json_serializer

DB = Sequel.connect('sqlite://coa.db')

class Branch < Sequel::Model(DB[:branches])

end

class BranchImage < Sequel::Model(DB[:branches_images])

end

class Technology < Sequel::Model(DB[:technologies])

end

class TechnologyImage < Sequel::Model(DB[:technologies_images])

end

def fill_branches_images
  branches = Branch.all.to_a
  DB.transaction do
    begin
      for branch in branches
        for i in 1..8 do
          n = BranchImage.new(
            :branch_id => branch.id,
            :image_id => 3,
          )
          n.save
        end
      end
    rescue Exception => e
      Sequel::Rollback
      puts 'error!'
      puts e.message
    end
  end
end

def fill_techonlogies_images
  technologies = Technology.all.to_a
  puts '1 ++++++++++++++++++++++++++'
  puts technologies
  puts '2 ++++++++++++++++++++++++++'
  DB.transaction do
    begin
      puts '3 ++++++++++++++++++++++++++'
      for technology in technologies
        puts '4 ++++++++++++++++++++++++++'
        for i in 1..8 do
          puts '5 ++++++++++++++++++++++++++'
          n = TechnologyImage.new(
            :technology_id => technology.id,
            :image_id => 4,
          )
          puts n.technology_id
          puts n.image_id
          puts '6 ++++++++++++++++++++++++++'
          n.save
          puts 'X ++++++++++++++++++++++++++'
        end
        puts '7 ++++++++++++++++++++++++++'
      end
    rescue Exception => e
      Sequel::Rollback
      puts 'error!'
      puts e.message
      puts e.backtrace
    end
  end
end

fill_techonlogies_images