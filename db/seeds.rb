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
  {first_name: 'Jane', last_name: 'Villanueva', role: 'Speech Language Pathologist', location: 'Florida', sector: 'Private', email: 'Jane@mac.com', password: 'abc123'},
  {first_name: 'Michael', last_name: 'Cordeiro', role: 'Occupational Therapist', location: 'Florida', sector: 'Public', email: 'Michael@mac.com', password: 'abc123'},
  {first_name: 'Raphael', last_name: 'Solano', role: 'Teacher', location: 'Florida', sector: 'Public', email: 'Raphael@mac.com', password: 'abc123'}
])

@patients = Patient.create([
    {first_name: 'Mateo', last_name: 'Solano', age: 2,  gender: 'male', home_session: true, school_session: false},
    {first_name: 'Xiomara', last_name: 'Villanueva', age: 32,  gender: 'female', home_session: true, school_session: false},
    {first_name: 'Rogelio', last_name: 'Vega', age: 33,  gender: 'male', home_session: true, school_session: false},
    {first_name: 'Alba', last_name: 'Villanueva', age: 60,  gender: 'female', home_session: false, school_session: true},
    {first_name: 'Nadine', last_name: 'Hasan', age: 3,  gender: 'female', home_session: true, school_session: true},
    {first_name: 'Billy', last_name: 'Cordeiro', age: 6,  gender: 'male', home_session: true, school_session: false},
    {first_name: 'Petra', last_name: 'Solano', age: 31,  gender: 'female', home_session: true, school_session: false},
    {first_name: 'Luisa', last_name: 'Alver', age: 30,  gender: 'female', home_session: true, school_session: false},
    {first_name: 'Rose', last_name: 'Smith', age: 5,  gender: 'female', home_session: false, school_session: true}
])

Observation.create([
    {user: @users[0], patient: @patients[0], date: '1/12/2017', activity: 'Speech', target_program: 'Phonetics', prompt: true, behaviors: 'tantrum', session_notes: 'progress made'},
    {user: @users[0], patient: @patients[1], date: '1/13/2017', activity: 'Speech', target_program: 'Accent Reduction', prompt: false, behaviors: 'none', session_notes: 'progress made'},
    {user: @users[0], patient: @patients[2], date: '1/17/2017', activity: 'Speech', target_program: 'Accent Reduction', prompt: false, behaviors: 'none', session_notes: 'no progress made'},
    {user: @users[1], patient: @patients[3], date: '12/12/2016', activity: 'OT', target_program: 'Gross Motor', prompt: false, behaviors: 'crying', session_notes: 'progress made'},
    {user: @users[1], patient: @patients[4], date: '1/13/2017', activity: 'OT', target_program: 'Fine Motor', prompt: true, behaviors: 'none', session_notes: 'progress made'},
    {user: @users[1], patient: @patients[5], date: '1/17/2017', activity: 'OT', target_program: 'Sensory Reduction', prompt: false, behaviors: 'tantrum', session_notes: 'no progress made'},
    {user: @users[2], patient: @patients[6], date: '12/12/2016', activity: 'General Education', target_program: 'Writing', prompt: false, behaviors: 'crying', session_notes: 'progress made'},
    {user: @users[2], patient: @patients[7], date: '1/13/2017', activity: 'General Education', target_program: 'Reading', prompt: true, behaviors: 'none', session_notes: 'progress made'},
    {user: @users[2], patient: @patients[8], date: '1/17/2017', activity: 'General Education', target_program: 'Math', prompt: false, behaviors: 'tantrum', session_notes: 'no progress made'}
])

puts "Created #{User.count} users.\nCreated #{Patient.count} patients.\nCreated #{Observation.count} observations."
