# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "testuser@test.com", password: "password", password_confirmation: "password")

user = User.find_by(email: "testuser@test.com")

require "faker"

# Contacts
# create some jobs
20.times do |i|
  Job.create!(
    company: "Company #{i + 1}",
    job_title: "Job Title #{i + 1}",
    job_board_link: "https://jobboardlink#{i + 1}.com",
    application_date: Date.today - i.days,
    job_description: Faker::Lorem.paragraphs.map { |pr| "<p>#{pr}</p>" }.join,
    job_position_type: rand(0..6),
    job_pay_type: rand(0..1),
    job_application_status: rand(0..5),
    user_id: 1
  )
end

# create some contacts
20.times do |i|
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    notes: Faker::Lorem.paragraphs.map { |pr| "<p>#{pr}</p>" }.join,
    user_id: 1
  )
end

# create some job contacts
50.times do
  JobContact.create!(
    job: Job.all.sample,
    contact: Contact.all.sample
  )
end

# create some interviews
20.times do
  Interview.create!(
    title: Faker::Job.title,
    notes: Faker::Lorem.paragraphs.map { |pr| "<p>#{pr}</p>" }.join,
    interview_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    interview_type: rand(0..3),
    job: Job.all.sample,
    user_id: 1
  )
end

# create some interview contacts
50.times do
  InterviewContact.create!(
    interview: Interview.all.sample,
    contact: Contact.all.sample
  )
end

p "Created #{User.count} users"
p "Created #{Job.count} jobs"
p "Created #{Contact.count} contacts"
p "Created #{Interview.count} interviews"
