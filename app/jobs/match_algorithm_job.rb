class MatchAlgorithmJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    puts "Hi this is my test for #{user.first_name}"
  end
end
