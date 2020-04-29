class Company < ApplicationRecord
  # Added to soft delete the company
  acts_as_paranoid
  has_rich_text :description

  # Add validation on email if the email present than check for format and check uniqueness
  validates :email, format: { with: /\A([^@\s]+)@(getmainstreet.com)\z/i }, allow_blank: true, uniqueness: true
  # call check_zip_code method to check the validity of zip_code
  validate :zip_code, :check_zip_code

  private
  # Added validation for valid zip code and if found add city and state code in related object otherwise add error.
  def check_zip_code
    zipcode = ZipCodes.identify(self.zip_code.to_s)
    if zipcode
      # Assign value of city and state
      self.city = zipcode[:city]
      self.state = zipcode[:state_code]
    else
      self.errors[:base] << "Zip code is not Valid!"
    end
  end
end
