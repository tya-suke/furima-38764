class CreateItems < ActiveRecord::Migration[6.0]
  def change
      create_table :items do |t|
        t.string     :product,           null: false
        t.text       :info,              null: false
        t.integer    :price,             null: false
        t.integer    :category_id,       null: false
        t.integer    :condition_id ,     null: false
        t.integer    :postage_type_id ,  null: false
        t.integer    :days_to_ship_id,   null: false
        t.references :user,              null: false,foreign_key: true
        t.integer    :prefecture_id,     null: false
        t.timestamps
    end
  end
end
