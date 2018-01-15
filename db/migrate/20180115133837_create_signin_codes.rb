class CreateSigninCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :signin_codes do |t|
      t.references :baby, foreign_key: true, index: true, null: false
      t.string :code, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
