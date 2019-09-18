# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_18_095533) do

  create_table "bigcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "category_index_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_index_id"], name: "index_bigcategories_on_category_index_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_indices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creditcards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "card_id", null: false
    t.string "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_creditcards_on_user_id"
  end

  create_table "product_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
ActiveRecord::Schema.define(version: 2019_09_18_080813) do

  create_table "bigcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_indices_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_indices_id"], name: "index_bigcategories_on_category_indices_id"
  end

  create_table "category_indices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deploy_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.string "fresh_status"
    t.integer "user_id"
    t.string "sell_status", default: "出品中"
    t.integer "price"
    t.string "deliver_person"
    t.string "from_area"
    t.string "deliver_leadtime"
    t.string "deliver_way"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "category_index_id"
    t.bigint "bigcategory_id"
    t.bigint "smallcategory_id"
    t.bigint "size_id"
    t.index ["bigcategory_id"], name: "index_products_on_bigcategory_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_index_id"], name: "index_products_on_category_index_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["smallcategory_id"], name: "index_products_on_smallcategory_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "avatar"
    t.integer "birthyear", null: false
    t.integer "birthmonth", null: false
    t.integer "birthday", null: false
    t.string "family_name", null: false
    t.string "personal_name", null: false
    t.string "family_name_kana", null: false
    t.string "personal_name_kana", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building", null: false
    t.integer "tel"
    t.string "post_family_name", null: false
    t.string "post_personal_name", null: false
    t.string "post_family_name_kana", null: false
    t.string "post_personal_name_kana", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smallcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "bigcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigcategory_id"], name: "index_smallcategories_on_bigcategory_id"
  end

  create_table "smallcategories_has_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "smallcategory_id"
    t.bigint "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_id"], name: "index_smallcategories_has_sizes_on_size_id"
    t.index ["smallcategory_id"], name: "index_smallcategories_has_sizes_on_smallcategory_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bigcategories", "category_indices"
  add_foreign_key "creditcards", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "bigcategories"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "category_indices"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "smallcategories"
  add_foreign_key "profiles", "users"
  add_foreign_key "smallcategories", "bigcategories"
  add_foreign_key "smallcategories_has_sizes", "sizes"
  add_foreign_key "smallcategories_has_sizes", "smallcategories"
  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "text", null: false
    t.integer "fresh_status_id", null: false
    t.integer "user_id"
    t.integer "sell_status_id", null: false
    t.integer "size_id"
    t.bigint "category_indices_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_indices_id"], name: "index_products_on_category_indices_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smallcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "bigcategories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigcategories_id"], name: "index_smallcategories_on_bigcategories_id"
  end

  create_table "smallcategory_has_sizetables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "smallcategories_id"
    t.bigint "sizes_id"
    t.index ["sizes_id"], name: "index_smallcategory_has_sizetables_on_sizes_id"
    t.index ["smallcategories_id"], name: "index_smallcategory_has_sizetables_on_smallcategories_id"
  end

  add_foreign_key "bigcategories", "category_indices", column: "category_indices_id"
  add_foreign_key "products", "category_indices", column: "category_indices_id"
  add_foreign_key "smallcategories", "bigcategories", column: "bigcategories_id"
  add_foreign_key "smallcategory_has_sizetables", "sizes", column: "sizes_id"
  add_foreign_key "smallcategory_has_sizetables", "smallcategories", column: "smallcategories_id"
end
