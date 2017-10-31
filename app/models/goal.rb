class Goal < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  def toggle_visibility
    self.visibility = !self.visibility
  end

  def toggle_completion
    self.completion = !self.completion
  end
end
