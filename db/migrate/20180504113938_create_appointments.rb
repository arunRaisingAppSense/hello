class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :physician_id
      t.string :patient_id
      t.string :appointment_date

      t.timestamps
    end
  end
end
