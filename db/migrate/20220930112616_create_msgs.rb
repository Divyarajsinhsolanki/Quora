class CreateMsgs < ActiveRecord::Migration[7.0]
  def change
    create_table :msgs do |t|
      t.string :text

      t.timestamps
    end
  end
end
