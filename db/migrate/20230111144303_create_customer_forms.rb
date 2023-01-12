class CreateCustomerForms < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_forms do |t|

      t.timestamps
    end
  end
end
