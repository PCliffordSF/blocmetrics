class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable, :rememberable
         
  def remember_me
    false
  end
end
