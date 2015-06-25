module RegionsHelper
  def regions
    @regions ||= Region.all
  end

  def regions_name
    region = Region.all.map do |region|
      [region.place]
    end
    region.unshift(["Select An Existing Region"])
  end
end
