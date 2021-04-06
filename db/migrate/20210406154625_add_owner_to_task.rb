class AddOwnerToTask < ActiveRecord::Migration[5.2]
  def change
    #Agregar una referencia a tabla :tasks, de nombre :owner, no null, llave foranea, 
    add_reference :tasks, :owner, null: false, foreign_key: { to_table: :users }, index: true
  end
end
