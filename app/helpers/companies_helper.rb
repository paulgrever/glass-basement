module CompaniesHelper
  def companies_name
    comp = Company.all.map do |company|
      [company.name]
    end
    comp.unshift(["Select An Existing Company"])
  end
end
