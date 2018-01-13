class CreateVerificationCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :verification_codes do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :email, null: false

      t.timestamps
    end
  end
end
