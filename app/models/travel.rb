class Travel < ActiveRecord::Base
  has_many :videos #, dependent: :destroy

  default_scope -> { order("id asc") }

  validates_uniqueness_of :name
end
