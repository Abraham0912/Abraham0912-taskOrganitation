# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_tasks #tiene muchas tareas #Se tuvo que cambiar de :tasks a :owned_tasks
  #has_many :participants #tiene muchas participants VER SI FUNCIONA ESTA LINEA, NO SE SI HACE REFERENCIA AL NOMBRE DEL MODELO O LA TABLA
  has_many :participations, class_name: 'Participant'
  has_many :tasks, through: :participations
end
