class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string      :title, null: false
      t.string      :description, null: false
      t.string      :last_update, null: false
      t.references  :type, index: true, foreign_key: true
      t.references  :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
