class Tag
  include Mongoid::Document

  field :name, type: String

  has_many :ads

  validates :name, presence: true
end
