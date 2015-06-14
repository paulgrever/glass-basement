module RegionsHelper
  def regions
    @regions ||= Region.all
  end
end
