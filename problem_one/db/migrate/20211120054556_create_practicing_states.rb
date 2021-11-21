class CreatePracticingStates < ActiveRecord::Migration[6.1]
  def change
    create_table :practicing_states do |t|
      t.bigint :advocate_id
      t.bigint :state_id

      t.timestamps
    end
  end
end
