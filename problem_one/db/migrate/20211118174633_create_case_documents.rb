class CreateCaseDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :case_documents do |t|
      t.string :attachment
      t.bigint :case_id

      t.timestamps
    end
  end
end
