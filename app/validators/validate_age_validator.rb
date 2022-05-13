class ValidateAgeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if valid_date_range.include?(value)

    record.errors.add(attribute, options[:message])
  end

  private

  def valid_date_range
    Date.new(Date.today.year - 120)..Date.new(Date.today.year - 12)
  end
end
