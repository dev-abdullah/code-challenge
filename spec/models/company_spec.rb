require "rails_helper"

RSpec.describe Company, type: :model do

  context "Company emails" do
    it "When email is invalid" do
      company = Company.new(name: 'Test', zip_code: '85004', phone: "123-456-6789", email: "test@test.com")
      expect(company.save).to be false
    end

    it "When email is empty" do
      company = Company.new(name: 'Test', zip_code: '85004', phone: "123-456-6789")
      expect{company.save}.to change{Company.count}.by (1)
    end

    it "When email is valid" do
      company = Company.new(name: 'Test', zip_code: '85004', phone: "123-456-6789", email: "test@getmainstreet.com")
      expect{company.save}.to change{Company.count}.by (1)
    end
  end

  context "Company zip_code" do
    it "When zip_code is invalid" do
      company = Company.new(name: 'Test', zip_code: '54000', phone: "123-456-6789")
      expect(company.save).to be false
    end

    it "When zip_code is valid" do
      company = Company.new(name: 'Test', zip_code: '85004', phone: "123-456-6789")
      expect{company.save}.to change{Company.count}.by (1)
    end
  end
end
