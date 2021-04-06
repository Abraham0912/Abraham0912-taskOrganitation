# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    has_many :tasks


    validates :name, :description, presence: true#Campos requeridos name  y decription
    validates :name, uniqueness: { case_sensitive: false }#Valores unicos en :name y diferencia entre mayusculas y minusculas
end
