class Seeds
  def self.create

    companies = ["QuickLeft", "Thoughtbot", "Pivotal Labs", "Sphero",
      "Rally", "AlchemyAPI", "IBM", "CartaSite", "Get Outfitted",
      "Project Helping", "Project Travel", "Kapost", "Sovrn", "Invoca",
      "CaptainU", "MojoTech", "Dojo4", "Twitter", "Gnip", "Craftsy"]

    companies.each_with_index do |company|
      a = Company.create(name: company)
      Job.create(title: "Web Developer 1", job_description: "Build stuff", company_id: a.id)
      Job.create(title: "Sr Web Developer", job_description: "Build stuff", company_id: a.id)
    end

    cities = ["Denver", "Boston", "San Francisco", "New York",
      "Philadelphia", "St. Louis", "Salt Lake City", "Boulder",
      "Fort Collins", "Miami", "Austin", "Dallas", "Providence",
      "Chicago", "Minneapolis", "Los Angeles", "San Diego", "Madison",
      "Washington D.C."]

    cities.each_with_index do |city, index|
      a = Region.create(place: city)
      CompanyRegion.create(company_id: (index + 1), region_id: a.id)
    end

    user = User.create(uid: "123455", name: "Paul Grever", email: "paulgrever@gmail.com", image: "https://avatars.githubusercontent.com/u/3664281?v=3")
    job_ids = (1..Job.count).to_a

    Job.count.times do
      Interview.create(job_id: job_ids.sample,
       title: "Interview #{rand(1..10)}",
       number: rand(1..3),
       date: Time.at(rand * Time.now.to_i),
       interview_type: ["phone", "in-person", "technical", "video", "other"].sample,
       details: "This interview was great. They were friendly and asked me alot about my passion for coding",
       time_between: "1 week",
       questions: "They focused alot of their questions about TDD and JavaScript",
       interviewer_name: "Miriam Moser",
       interviewer_email: "miriam.moser@gmail.com",
       interviewer_phone: "555-555-5555",
       user_id: user.id)
    end
  end
end

Seeds.create
puts "creating seeds"
