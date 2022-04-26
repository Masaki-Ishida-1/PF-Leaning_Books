class Book < ApplicationRecord
  has_one_attached :book_image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  # has_many :evaluation_id, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :star ,presence: true

  def get_book_image(width, height)
    unless book_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      book_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
    book_image.variant(resize_to_fill:[width, height])
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
