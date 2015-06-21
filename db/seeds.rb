class Seeds
  def self.create
    Region.create(place: "Denver")
    Region.create(place: "Boston")
    Region.create(place: "San Francisco")

    Company.create(name: "QuickLeft")
    Company.create(name: "Thoughtbot")
    Company.create(name: "Pivotal Labs")

    CompanyRegion.create(company_id: 1, region_id: 1)
    CompanyRegion.create(company_id: 2, region_id: 2)
    CompanyRegion.create(company_id: 3, region_id: 3)

    User.create(uid: "123455", name: "Paul Grever", email: "paulgrever@gmail.com", image: "https://avatars.githubusercontent.com/u/3664281?v=3")

    (1..6).to_a.each do |num|
      Job.create(title: "Web Developer #{num}", job_description: "Build stuff", company_id: ((num % 3) + 1))
    end

    10.times do 
      User.first.interviews.create(job_id: (1..6).to_a.sample,
                                   title: "Interview #{rand(1..10)}",
                                   number: rand(1..3),
                                   date: Time.at(rand * Time.now.to_i),
                                   interview_type: ["phone", "in-person", "technical", "video", "other"].sample,
                                   details: "This interview was great. They were friendly and asked me alot about my passion for coding",
                                   time_between: "1 week",
                                   questions: "They focused alot of their questions about TDD and JavaScript",
                                   interviewer_name: "Miriam Moser", 
                                   interviewer_email: "miriam.moser@gmail.com",
                                   interviewer_phone: "555-555-5555")
    end
  end


end

Seeds.create
puts "creating seeds"
