# encoding: utf-8
require 'sequel'

Sequel::Model.plugin :json_serializer

DB = Sequel.connect('sqlite://coa.db')

class Branch < Sequel::Model(DB[:branches])

end

class Specialism < Sequel::Model(DB[:specialisms])
  
end

class Dentist < Sequel::Model(DB[:dentists])
  
end

class DentistBranch < Sequel::Model(DB[:dentists_branches])
  
end

class DentistSpecialism < Sequel::Model(DB[:dentists_specialisms])
  
end

def fill_doctores
  # todos menos los de la sede central - San Isidro
  f = File.open('doctors.csv', :encoding => 'UTF-8')
  DB.transaction do
    begin
      f.each_line do |line|
        array = line.split(':')
        apellido_paterno = array[0]
        apellido_materno = array[1]
        nombres = array[2]
        specialism = array[3]
        cop = array[4]
        rne = array[5]
        branch = array[6].strip
        # generate values
        name = apellido_paterno + ' ' + apellido_materno + ', ' +  nombres
        if rne == 'xyz' then  rne = '' end
        specialism_id = Specialism.where(name: specialism).first.id
        branch_id = Branch.where(name: branch).first.id
        image = 'assets/img/default-user.png'
        # insert to dentists
        dentist = Dentist.new(
          :name => name,
          :cop => cop,
          :rne => rne,
          :image => image,
        )
        dentist.save
        dentist_branch = DentistBranch.new(
          :dentist_id => dentist.id, 
          :branch_id => branch_id, 
        )
        dentist_branch.save
        dentists_specialism = DentistSpecialism.new(
          :dentist_id => dentist.id, 
          :specialism_id => specialism_id, 
        )
        dentists_specialism.save
      end
      f.close
    rescue Exception => e
      Sequel::Rollback
      puts 'error!'
      puts e.message
      puts e.backtrace
    end
  end
end

def sede_central
  # todos menos los de la sede central - San Isidro
  f = File.open('sede_central.csv', :encoding => 'UTF-8')
  DB.transaction do
    begin
      f.each_line do |line|
        array = line.split('::')
        name = array[0]
        specialism = array[1]
        cop = array[2]
        rne = array[3].strip
        branch_id = 1
        # generate values
        if rne == 'xyz' then  rne = '' end
        specialism_id = Specialism.where(name: specialism).first.id
        image = 'assets/img/default-user.png'
        # insert to dentists
        dentist = Dentist.new(
          :name => name,
          :cop => cop,
          :rne => rne,
          :image => image,
        )
        dentist.save
        dentist_branch = DentistBranch.new(
          :dentist_id => dentist.id, 
          :branch_id => branch_id, 
        )
        dentist_branch.save
        dentists_specialism = DentistSpecialism.new(
          :dentist_id => dentist.id, 
          :specialism_id => specialism_id, 
        )
        dentists_specialism.save
      end
      f.close
    rescue Exception => e
      Sequel::Rollback
      puts 'error!'
      puts e.message
      puts e.backtrace
    end
  end
end

sede_central