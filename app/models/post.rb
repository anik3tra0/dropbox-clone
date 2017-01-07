class Post < ActiveRecord::Base
	has_many :uploads, as: :uploadable, dependent: :destroy
	accepts_nested_attributes_for :uploads
end
