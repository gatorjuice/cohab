require 'rails_helper'

describe Partnership do
	
	it "cannot have the same name as an existing Partnership" do
		Partnership.create(
			name: "unique"
		)
		@partnership = Partnership.create(
			name: "unique"
		)
		expect(@partnership).to_not be_valid
	end

	it "must be at least 6 characters long" do
		@partnership = Partnership.create(
			name: "short"
		)
		expect(@partnership).to_not be_valid
	end

	it "cannot be more than 32 characters long" do
		@partnership = Partnership.create(
			name: "loooooooooooooooooooooooooooooong"
		)
		expect(@partnership).to_not be_valid
	end

	it "should be between 6 and 32 characters long" do
		@partnership = Partnership.create(
			name: "just right"
		)
		expect(@partnership).to be_valid
	end
	
end