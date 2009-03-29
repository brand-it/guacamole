class CreateTableCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.column :kind,                 :string
      t.column :name,                 :string
      t.column :ablity,               :text
      t.column :flavor_text,          :text
      t.column :image_id,             :integer
      t.column :delta,                :boolean
      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
