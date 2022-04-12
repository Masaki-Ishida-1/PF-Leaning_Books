class Book < ApplicationRecord
  has_one_attached :book_image
  belongs_to :user

  def get_book_image(width, height)
    unless book_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      book_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type:'image/jpeg')
    end
    book_image.variant(resize_to_fill:[width, height])
  end
end
