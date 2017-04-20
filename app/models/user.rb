class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  has_many :resumes
  has_many :tutorials
  has_many :likes, :dependent => :destroy
  has_many :liked_tutorials, :through => :likes, :source => :tutorial

  def display_name
    self.email.split("@").first
  end
end
