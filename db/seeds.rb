# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
docs = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
pats = [1, 2, 3, 4, 5]

5.times do p = Physician.create( dr_name: Faker::FunnyName.name ) end

5.times do pa = Patient.create( patient_name: Faker::FunnyName.name ) end

5.times do Appointment.create( date: Faker::Date.between(Date.today, 14.days.from_now), physician_id: docs.sample, patient_id: pats.sample ) end

