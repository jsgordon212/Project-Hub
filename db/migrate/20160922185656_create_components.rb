class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.boolean     :main_component
      t.string      :name
      t.string      :description
      t.references  :user, index: true, foreign_key: true
      t.references  :project, index: true, foreign_key: true


      t.timestamps
    end
  end
end
