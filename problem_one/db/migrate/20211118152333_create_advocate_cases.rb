class CreateAdvocateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :advocate_cases do |t|
      t.bigint :advocate_id
      t.bigint :case_id
      t.bigint :case_status_id
      t.bigint :assign_to_id

      t.timestamps
    end
  end
end
