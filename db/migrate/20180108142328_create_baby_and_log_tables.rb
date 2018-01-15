class CreateBabyAndLogTables < ActiveRecord::Migration[5.1]
  def change
    create_table :babies do |t|
      t.string :email, null: false, index: { unique: true }

      t.timestamps null: false
    end

    create_table :bath_logs do |t|
      t.references :baby, foreign_key: true, index: true, null: false
      t.integer :duration_min, null: false
      t.datetime :started_at, null: false

      t.timestamps null: false
    end

    create_table :breast_milk_logs do |t|
      t.references :baby, foreign_key: true, index: true, null: false
      t.integer :duration_min, null: false
      t.integer :side, default: 0, null: false
      t.datetime :started_at, null: false

      t.timestamps null: false
    end

    create_table :milk_logs do |t|
      t.references :baby, foreign_key: true, index: true, null: false
      t.integer :duration_min, null: false
      t.integer :milk_volume_ml, null: false
      t.datetime :started_at, null: false

      t.timestamps null: false
    end

    create_table :pee_logs do |t|
      t.references :baby, foreign_key: true, index: true, null: false
      t.integer :diaper_usage, default: 0, null: false
      t.datetime :started_at, null: false

      t.timestamps null: false
    end

    create_table :poo_logs do |t|
      t.references :baby, foreign_key: true, index: true, null: false
      t.integer :color, default: 0, null: false
      t.integer :diaper_usage, default: 0, null: false
      t.datetime :started_at, null: false

      t.timestamps null: false
    end
  end
end
