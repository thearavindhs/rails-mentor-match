class AddPersonalSkillReftoSkills < ActiveRecord::Migration[6.0]
  def change
    add_reference :skills, :personal_skill, foreign_key: true
  end
end
