class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :manager, :admin]
  before_create { set_default_role }

  private

  def set_default_role
    self.role ||= :user
  end
end
