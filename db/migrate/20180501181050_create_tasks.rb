class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.column :description, :string
      t.column :list_id, :integer
    end
  end
end
