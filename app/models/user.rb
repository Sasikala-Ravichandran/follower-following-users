class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  
  has_many :activerelations, class_name: "Relation", 
                            foreign_key: "follower_id", 
                            dependent: :destroy
  has_many :following, through: :activerelations, source: :followed

  has_many :passiverelations, class_name: "Relation", 
                              foreign_key: "followed_id", 
                              dependent: :destroy
  has_many :followers, through: :passiverelations

end