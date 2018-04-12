# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :text
#  body       :text
#  votes      :integer          default(0)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
	has_many :votes, as: :voteable, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
end
