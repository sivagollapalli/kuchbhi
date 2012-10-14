class Ad
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search
  
  field :description, type: String
  field :price, type: Float
  field :hits, type: Integer
  field :published, type: Boolean, default: false

  field :address, type: String
  field :locality, type: String
  field :country, type: String
  field :lat, type: Float 
  field :lng, type: Float

  belongs_to :category
  belongs_to :user

  has_many :images, autosave: true
  has_many :tags, autosave: true
  has_many :views, class_name: 'Viewer', dependent: :destroy

  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => :all_blank

  validates :description, :price, presence: true
  validates_numericality_of :price, greater_than: 0

  search_in :description, :category => :name, :tags => :name

end
