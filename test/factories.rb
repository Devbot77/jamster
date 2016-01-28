FactoryGirl.define do  factory :enrollment do
    
  end
  

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

	factory :lesson do
		title "Test lesson Beta"
		subtitle "Hope it works"
		association :section
	end

	
end