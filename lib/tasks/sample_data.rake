NUM_PACIENTS= 20
MAX_TELEPHONES_PER_PACIENT = 3
MAX_INSURANCES_PER_PACIENT = 2
MAX_TREATMENTS_PER_PACIENT = 8
MAX_CONSULTS_PER_TREATMENT = 4
MAX_INDICATEDS_PER_PACIENT = 2
NUM_INSURANCES = 10
NUM_PROCEDURES_TYPE = 5
NUM_PROCEDURES = 20
NUM_INDICATIONS = 5

namespace :db do

    desc "Fill database with sample data"
    task :populate => :environment do
        require 'ffaker'

        Rake::Task['db:reset'].invoke
    
        NUM_PACIENTS.times do |n|
          name  = Faker::Name.name
          address = Faker::Address.street_address + " " + Faker::Address.city
          email = name + "@email.com"
          RG = "%08d" % rand(1000000)
          CPF = "%08d" % rand(1000000)
          Pacient.create!(:name => name,
                        :address => address,
                        :email => email,
                        :rg => RG,
                        :cpf => CPF,
                        :birthday => Date.today-(10000*rand()))
        end

        desc "Criacao dos Telefones"
        Pacient.all.each do |pacient|
            number_telephones = rand(1..MAX_TELEPHONES_PER_PACIENT)
            number_telephones.times do |t|
                if t == 1                    
                    ddd = "%03d" %rand(10..99)
                    number = "%09d" % rand(11111111..99999999)
                    preferred = true
                    Telephone.create!(:pacient_id => pacient.id,
                            :number => number,
                            :ddd => ddd,
                            :preferred => preferred)
                   else
                    ddd = "%03d" %rand(10..99)
                    number = "%09d" % rand(11111111..99999999)
                    preferred = false 
                    Telephone.create!(:pacient_id => pacient.id,
                                :number => number,
                                :ddd => ddd,
                                :preferred => preferred)
                    end
                end
        end

        desc "Criacao dos Convenios"
        NUM_INSURANCES.times do |n|
            Insurance.create!(:name => Faker::Company.name,
                    :description => Faker::Company.bs)
        end

        desc "Atribuicoes dos convenios aos pacientes"
        Pacient.all.each do |pacient|
            number_insurances = rand(1..MAX_INSURANCES_PER_PACIENT)
            number_insurances.times do |t|
                Insured.create!(:pacient_id => pacient.id,
                                :insurance_id => rand(1..NUM_INSURANCES))
            end
        end

        desc "Criacao das listas de especializacoes"
        NUM_PROCEDURES_TYPE.times do |n|
            Proceduretype.create!(:name => Faker::Product.brand.to_s.ljust(5,'_'),
                                  :followup => rand(1..12))
        end

        desc "Criacao dos procedimentos"
        NUM_PROCEDURES.times do |n|
            Procedure.create!(:proceduretype_id => rand(1..NUM_PROCEDURES_TYPE),
                              :insurance_id => rand(1..NUM_INSURANCES),
                              :name => Faker::Product.product_name.to_s.ljust(3,'_'),
                              :description => Faker::Lorem.words(rand(5..15)).join(' '),
                              :value => rand(30..500),
                              :followup => rand(0..12)) 
        end     


        desc "Criacao dos tratamentos"
        Pacient.all.each do |pacient|
            number_treatments = rand(1..MAX_TREATMENTS_PER_PACIENT)
            number_treatments.times do |t|
                Treatment.create!(:pacient_id => pacient.id,
                                  :procedure_id => rand(1..NUM_PROCEDURES),
                                  :discount => rand(1..100),
                                  :done => false,
                                  :tooth => Treatment.list_tooths.sample,
                                  :face => Treatment.list_faces.sample)
            end
        end

        
        desc "Criacao das consultas. Atualizacoes de tratamentos finalizados"
        Treatment.all.each do |treatment|
            number_consults = rand(1..MAX_CONSULTS_PER_TREATMENT)
                if rand(1..3) == 1
                    number_consults.times do |t|                    
                        Consultation.create!(:treatment_id => treatment.id,
                                            :date => Date.today-(10000*rand()),
                                            :description => Faker::Lorem.words(rand(5..15)).join(' '),
                                            :canceled => "false",
                                            :canceled_reason => "0")
                    end
                    treatment.update_attributes!(:done => true)
                else
                    number_consults.times do |t|                    
                        Consultation.create!(:treatment_id => treatment.id,
                                             :date => Date.today+(10000*rand()),
                                             :description => Faker::Lorem.words(rand(5..15)).join(' '),
                                             :canceled => "false",
                                             :canceled_reason => "0")
                    end
            end
        end

        desc "Criacao dos tipos de indicao"
        NUM_INDICATIONS.times do |n|
            Indication.create!(:name => Faker::Lorem.word())
        end

        desc "Atribuicoes das indicacoes ao pacientes"
        Pacient.all.each do |pacient|
            number_indicated = rand(1..MAX_INDICATEDS_PER_PACIENT)
            number_indicated.times do |t|
                Indicated.create!(:pacient_id => pacient.id ,
                                  :indication_id => rand(1..NUM_INDICATIONS),
                                  :description => Faker::Name.name)
            end
        end

     end
end
