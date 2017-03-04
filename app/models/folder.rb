class Folder < ActiveRecord::Base
	acts_as_tree
	belongs_to :user
	has_many :uploads, dependent: :destroy
	validates_presence_of :name
	validates_uniqueness_of :name
end
