class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.url :image
      t.string :text

      t.timestamps
    end
  end
end
