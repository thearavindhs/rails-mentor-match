class MatchAlgorithmJob < ApplicationJob
  queue_as :default

  def perform(user)
    # User must be in the DB saved in order for this to work.
    # Experience preference is a string mb. Use .to_i pls

    mentors = User.where("user_type = 'mentor' AND maximum_mentee <= maximum_mentee + 1")


    # # Weights
    industryWeight = 8
    roleWeight = 2

    cityWeight = 1
    countryWeight = 1
    languageWeight = 2
    experienceWeight = 4
    genderWeight = 2

    perfectValue = cityWeight + countryWeight + languageWeight + experienceWeight + genderWeight
    minValue = 75
    result = 0
    selected_mentor = ""

    while result < minValue
      mentors.each do |mentor|
        selected_mentor = mentor
        industryValue = bool_to_int( user.industry_preference.capitalize == mentor.industry.capitalize ) * industryWeight
        roleValue = bool_to_int( user.role_preference.capitalize == mentor.role.capitalize ) * roleWeight
        countryValue = bool_to_int( user.country_preference == mentor.country ) * countryWeight
        languageValue = bool_to_int( user.language_preference == mentor.language ) * languageWeight
        experienceValue = bool_to_int( user.experience_preference.to_i == mentor.experience ) * experienceWeight
        genderValue = bool_to_int( user.gender_preference == mentor.gender ) * genderWeight

        similarityValue = industryValue + roleValue + countryValue + languageValue + experienceValue + genderValue

        result = (similarityValue * 100) / perfectValue
        minValue -= 1
      end
    end
    user.mentor = selected_mentor
    user.save
  end

  private

  def bool_to_int(boolean)

    if boolean
      return 1
    else
      return 0
    end

  end

end
