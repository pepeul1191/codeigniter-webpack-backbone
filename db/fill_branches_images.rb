require 'sequel'

# database and models config

Sequel::Model.plugin :json_serializer

DB = Sequel.connect('sqlite://coa.db')

class Branch < Sequel::Model(DB[:branches])

end

class BranchImage < Sequel::Model(DB[:branches_images])

end

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