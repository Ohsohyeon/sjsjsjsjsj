class CreateWebtoons < ActiveRecord::Migration
  def change
    create_table :webtoons do |t|
      t.string :url
      t.string :pre_day
      t.timestamps null: false
    end
  end
end
