class Evaluation < ApplicationRecord
  belongs_to :user_id, dependent: :destroy
  belongs_to :book_id, dependent: :destroy
end
