FactoryGirl.define do
	factory :user do 
		sequence :email do |n|
			"devtester#{n}@gmail.com"
		end
		password 'skolvikings'
		password_confirmation 'skolvikings'
	end

	factory :course do
		title "Tester Test"
		description "This is only a test"
		cost 0.00
		association :user
	end

	factory :section do
		title "Test Section Omega"
		association :user
	end

	
end