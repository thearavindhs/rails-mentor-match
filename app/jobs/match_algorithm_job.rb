class MatchAlgorithmJob < ApplicationJob
  queue_as :default

  def perform(user)

    # User must be in the DB saved in order for this to work.
    # Experience preference is a string mb. Use .to_i pls

    mentors = []
    m = User.where("user_type = 'mentor'")
    m.each do |mentor|
      mentors << mentor if mentor.mentees.count + 1 <= mentor.maximum_mentee
    end

    return 0 if mentors.count == 0
    # Weights
    roleWeight = 10
    cityWeight = 1
    countryWeight = 1
    languageWeight = 2
    experienceWeight = 4
    genderWeight = 2

    perfectValue = roleWeight + cityWeight + countryWeight + languageWeight + experienceWeight + genderWeight
    minValue = 75
    result = 0
    selected_mentor = ""

    while result < minValue
      mentors.each do |mentor|
        selected_mentor = mentor
        roleValue = bool_to_int( user.role_preference == mentor.role ) * roleWeight
        countryValue = bool_to_int( user.country_preference == mentor.country ) * countryWeight
        languageValue = bool_to_int( user.language_preference == mentor.language ) * languageWeight
        experienceValue = bool_to_int( user.experience_preference == mentor.experience ) * experienceWeight
        genderValue = bool_to_int( user.gender_preference == mentor.gender ) * genderWeight
        cityValue = bool_to_int( user.city_preference.downcase == mentor.city.downcase ) * cityWeight

        similarityValue = roleValue + countryValue + languageValue + experienceValue + genderValue + cityValue

        result = (similarityValue * 100) / perfectValue
        minValue -= 1
      end
    end
    user.mentor = selected_mentor
    user.save
    return 1
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
