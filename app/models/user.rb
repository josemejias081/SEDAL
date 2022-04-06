class User < ApplicationRecord
  validates :picture, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :num_identification, presence: true
  validates :place_of_birth, presence: true
  validates :address, presence: true
  validates :appointment, presence: true
  validates :status, presence: true
  validates :phone_number, presence: true
  validates :disability, presence: true
  validates :permission_level, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  include PermissionsConcern

  belongs_to :group

  has_one_attached :picture

  has_many :evaluations
  has_many :evaluator_tests, foreign_key: "evaluator_id", class_name: "Test" # tests que yo he corrido siendo evaluador
  has_many :evaluated_tests, foreign_key: "evaluated_id", class_name: "Test" # tests que me han corrido siendo un evaluado
  
  has_many :groups, foreign_key: "responsible_id"
  has_many :users, through: :groups

  def self.search(term)
    self.where("lower(name) LIKE lower(?)", "%#{term}%")
  end     
end
