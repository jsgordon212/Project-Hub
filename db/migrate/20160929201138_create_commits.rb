class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.string      :commit_message
      t.references  :project, index: true, foreign_key: true

      t.timestamps null:false
    end
  end
end
