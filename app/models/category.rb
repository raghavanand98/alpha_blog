class Category < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 4, maximum: 25 },
            uniqueness: { case_sensitive: false }
end