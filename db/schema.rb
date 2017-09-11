
ActiveRecord::Schema.define(version: 20170909205548) do

  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.string "winner"
    t.string "pokemon_1"
    t.string "pokemon_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_battles", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "battle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_id"], name: "index_pokemon_battles_on_battle_id"
    t.index ["pokemon_id"], name: "index_pokemon_battles_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "power"
    t.integer "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "pokemon_battles", "battles"
  add_foreign_key "pokemon_battles", "pokemons"
end
