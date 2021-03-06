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
#  owner_id    :bigint           not null
#
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'#Pertenece a :owner, como esa tabla no existe hacemos referencia al modelo User
  has_many :participating_users, class_name: 'Participant'
  has_many :participants, through: :participating_users, source: :user #Aqui en lugar de source iria class_name, pero como se uso through usarmos resource para referirnos al modelo de :participants
  
  validates :participating_users, presence: true

  validates :name, :description, presence: true#Campos requeridos name  y decription
  validates :name, uniqueness: { case_sensitive: false }#Valores unicos en :name y diferencia entre mayusculas y minusculas
  validate :due_date_validity #Validando por medio de una funcion creada por mi, para ello hacemos uso de la funcion "validate"

  accepts_nested_attributes_for :participating_users, allow_destroy: true#El metodo "accepts_nested_attributes_for"Valida que Task.rb si es capas de validar informacion anidada de participating_users y ademas permite eliminarla

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, I18n.t('task.errors.invalid_due_date')
  end
end
