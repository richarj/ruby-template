class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:enduser, :operator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :equipment
  

  

  def set_default_role
    self.role ||= :enduser
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
