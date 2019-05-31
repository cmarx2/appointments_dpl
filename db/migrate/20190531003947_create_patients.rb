class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :patient_name

      t.timestamps
    end
  end
end
