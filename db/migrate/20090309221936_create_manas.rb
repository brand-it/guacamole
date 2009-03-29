class CreateManas < ActiveRecord::Migration
  def self.up
    create_table :manas do |t|
      t.column :color,        :integer
      t.column :colorless,    :integer
      t.column :card_id,      :integer
    end
  end

  def self.down
    drop_table :manas
  end
end
