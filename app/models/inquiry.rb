class Inquiry < ApplicationRecord
   validates :name, :email, :content, presence: true
   validates :name, length: {maximum: 20}
   validates :email, length: {maximum: 50}
   validates :content, length: {maximum: 200}
end
