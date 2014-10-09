class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name

      t.timestamps
    end
  end
end
