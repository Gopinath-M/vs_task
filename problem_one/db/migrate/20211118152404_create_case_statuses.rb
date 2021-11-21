class CreateCaseStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :case_statuses do |t|
      t.string :name
      t.string :short_name
      t.boolean :is_active

      t.timestamps
    end
  end
end
