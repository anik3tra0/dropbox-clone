class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
end
