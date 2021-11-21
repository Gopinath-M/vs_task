class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|
      t.string :name
      t.string :case_no
      t.bigint :state_id
      t.text :description
      t.bigint :case_status_id

      t.timestamps
    end
  end
end
