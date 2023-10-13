class CreatePersonLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :contact_id

      t.timestamps
    end
  end
end
