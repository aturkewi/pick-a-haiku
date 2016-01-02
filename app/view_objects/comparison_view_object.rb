class ComparisonViewObject

  attr_reader :haikus_array

  def initialize(haikus_array)
    @haikus_array = haikus_array
  end

  def to_json
    @haikus_array.collect do |haiku|
      haiku.convert_to_hash
    end
  end

end
