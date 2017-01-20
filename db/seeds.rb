# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Observation.destroy_all
Patient.destroy_all
User.destroy_all

puts Observation.count
puts Patient.count
puts User.count

@users = User.create([
  {first_name: 'Jane', last_name: 'Villanueva', role: 'Speech Language Pathologist', location: 'Florida', field: 'Speech', sector: 'Private', email: 'Jane@mac.com', password: 'abc123', image: File.new("#{Rails.root}/app/assets/images/users/brunette_woman.jpg")},
  {first_name: 'Michael', last_name: 'Cordeiro', role: 'Occupational Therapist', location: 'Florida', field: 'OT', sector: 'Public', email: 'Michael@mac.com', password: 'abc123', image: File.new("#{Rails.root}/app/assets/images/users/blonde_man.jpg")},
  {first_name: 'Raphael', last_name: 'Solano', role: 'Teacher', location: 'Florida', sector: 'Public', field: 'Special Education', email: 'Raphael@mac.com', password: 'abc123', image: File.new("#{Rails.root}/app/assets/images/users/bald_man.jpg")}
])

@patients = Patient.create([
  {first_name: 'Mateo', last_name: 'Solano', age: 2,  gender: 'Male', home_session: 'yes', school_session: 'no', parent: 'Magda Solano', parent_email: 'magda@mac.com', diagnosis: 'Autism', image: File.new("#{Rails.root}/app/assets/images/patients/big_smile_boy.jpg")},
  {first_name: 'Xiomara', last_name: 'Villanueva', age: 5,  gender: 'Female', home_session: 'no', school_session: 'yes', parent: 'Gina Rodriguez', parent_email: 'gina@mac.com', diagnosis: 'ADHD', image: File.new("#{Rails.root}/app/assets/images/patients/brunette_girl.jpg")},
  {first_name: 'Rogelio', last_name: 'Vega', age: 8,  gender: 'Male', home_session: 'yes', school_session: 'yes', parent: 'Carlos Pena', parent_email: 'carlos@mac.com', diagnosis: 'Autism', image: File.new("#{Rails.root}/app/assets/images/patients/mohawk_boy.jpg")},
  {first_name: 'Alba', last_name: 'Villanueva', age: 4,  gender: 'Female', home_session: 'yes', school_session: 'no', parent: 'Gina Rodriguez', parent_email: 'gina@mac.com', diagnosis: 'MS', image: File.new("#{Rails.root}/app/assets/images/patients/flower_girl.jpg")},
  {first_name: 'Nadine', last_name: 'Hasan', age: 6,  gender: 'Female', home_session: 'no', school_session: 'yes', parent: 'Amir Hasan', parent_email: 'amir@mac.com', diagnosis: 'Speech Delay', image: File.new("#{Rails.root}/app/assets/images/patients/brunette_girl_braids.jpg")},
  {first_name: 'Billy', last_name: 'Cordeiro', age: 6,  gender: 'Male', home_session: 'no', school_session: 'yes', parent: 'Jose Cordeiro', parent_email: 'jose@mac.com', diagnosis: 'ADHD', image: File.new("#{Rails.root}/app/assets/images/patients/sippy_cup_boy.jpg")},
  {first_name: 'Petra', last_name: 'Solano', age: 5,  gender: 'Female', home_session: 'yes', school_session: 'yes', parent: 'Magda Solano', parent_email: 'magda@mac.com', diagnosis: 'Speech Delay', image: File.new("#{Rails.root}/app/assets/images/patients/blonde_girl_side.jpg")},
  {first_name: 'Luisa', last_name: 'Alver', age: 3,  gender: 'Female', home_session: 'no', school_session: 'yes', parent: 'Emilio Alver', parent_email: 'emilio@mac.com', diagnosis: 'Autism', image: File.new("#{Rails.root}/app/assets/images/patients/sad_girl.jpg")},
  {first_name: 'Rose', last_name: 'Smith', age: 4,  gender: 'Female', home_session: 'yes', school_session: 'no', parent: 'Tim Smith', parent_email: 'tim@mac.com', diagnosis: 'MS', image: File.new("#{Rails.root}/app/assets/images/patients/brunette_girl.jpg")}
])

Observation.create([
  {user: @users[0], patient: @patients[0], date: '01/12/2017', goal: 'Speech', program: 'Phonetics', prompt: true, behavior: 'tantrum', session_notes: 'progress made'},
  {user: @users[0], patient: @patients[1], date: '01/13/2017', goal: 'Speech', program: 'Accent Reduction', prompt: false, behavior: 'none', session_notes: 'progress made'},
  {user: @users[0], patient: @patients[2], date: '01/17/2017', goal: 'Speech', program: 'Accent Reduction', prompt: false, behavior: 'none', session_notes: 'no progress made'},
  {user: @users[1], patient: @patients[3], date: '12/12/2016', goal: 'OT', program: 'Gross Motor', prompt: false, behavior: 'crying', session_notes: 'progress made'},
  {user: @users[1], patient: @patients[4], date: '01/13/2017', goal: 'OT', program: 'Fine Motor', prompt: true, behavior: 'none', session_notes: 'progress made'},
  {user: @users[1], patient: @patients[5], date: '01/17/2017', goal: 'OT', program: 'Sensory Reduction', prompt: false, behavior: 'tantrum', session_notes: 'no progress made'},
  {user: @users[2], patient: @patients[6], date: '12/12/2016', goal: 'Special Education', program: 'Writing', prompt: false, behavior: 'crying', session_notes: 'progress made'},
  {user: @users[2], patient: @patients[7], date: '01/13/2017', goal: 'Special Education', program: 'Reading', prompt: true, behavior: 'none', session_notes: 'progress made'},
  {user: @users[2], patient: @patients[8], date: '01/17/2017', goal: 'Special Education', program: 'Math', prompt: false, behavior: 'tantrum', session_notes: 'no progress made'}
])

puts "Created #{User.count} users.\nCreated #{Patient.count} patients.\nCreated #{Observation.count} observations."
