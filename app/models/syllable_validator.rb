class SyllableValidator < ActiveModel::Validator

  def validate(record)
    if record.line1 == "" || record.line1.to_phrase.syllables != 5
      record.errors[:line1] << "The first line must have 5 syllables"
    end
    if record.line2 == "" || record.line2.to_phrase.syllables != 7
      record.errors[:line2] << "The second line must have 7 syllables"
    end
    if record.line3 == "" || record.line3.to_phrase.syllables != 5
      record.errors[:line3] << "The third line must have 5 syllables"
    end
  end
end
