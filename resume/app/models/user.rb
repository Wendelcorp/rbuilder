class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :profiles

  has_many :experiences
  has_many :educations
  has_many :skills
    # accepts_nested_attributes_for :skills
  # attr_accessor :current_user
  #
  # after_create :populate_content
  # def populate_content
  #   redirect_to url_for(:controller => :profiles, :action => :populate_content)
  # end

end
