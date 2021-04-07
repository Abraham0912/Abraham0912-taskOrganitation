# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'#Pertenece a :owner, como esa tabla no existe hacemos referencia al modelo User
  
  validates :name, :description, presence: true#Campos requeridos name  y decription
  validates :name, uniqueness: { case_sensitive: false }#Valores unicos en :name y diferencia entre mayusculas y minusculas
  validate :due_date_validity #Validando por medio de una funcion creada por mi, para ello hacemos uso de la funcion "validate"
  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, I18n.t('task.errors.invalid_due_date')
  end
end
