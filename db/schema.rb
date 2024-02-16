# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_16_042335) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accreditation_school_lists", force: :cascade do |t|
    t.string "akreditasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "achievement_kategori_lists", force: :cascade do |t|
    t.string "kategori"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "achievement_tingkat_lists", force: :cascade do |t|
    t.string "tingkat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "achievements", force: :cascade do |t|
    t.string "nama_prestasi"
    t.date "tahun"
    t.string "tingkat"
    t.string "kategori"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "address_kabupaten_lists", force: :cascade do |t|
    t.string "kabupaten"
    t.bigint "address_province_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_province_list_id"], name: "index_address_kabupaten_lists_on_address_province_list_id"
  end

  create_table "address_kecamatan_lists", force: :cascade do |t|
    t.string "kecamatan"
    t.bigint "address_kabupaten_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_kabupaten_list_id"], name: "index_address_kecamatan_lists_on_address_kabupaten_list_id"
  end

  create_table "address_province_lists", force: :cascade do |t|
    t.string "provinsi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "provinsi"
    t.string "kabupaten"
    t.string "kecamatan"
    t.string "kelurahan"
    t.string "alamat"
    t.integer "kode_pos"
    t.bigint "no_telepon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "all_school_lists", force: :cascade do |t|
    t.string "sekolah"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batch_lists", force: :cascade do |t|
    t.string "gelombang"
    t.boolean "aktif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extra_lists", force: :cascade do |t|
    t.string "predikat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extras", force: :cascade do |t|
    t.string "nama_kegiatan"
    t.date "mulai"
    t.date "berakhir"
    t.string "predikat"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_extras_on_user_id"
  end

  create_table "high_school_major_lists", force: :cascade do |t|
    t.string "jurusan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_degree_lists", force: :cascade do |t|
    t.string "tingkat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_name_lists", force: :cascade do |t|
    t.string "bahasa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "nama_bahasa"
    t.string "tingkat"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "major_lists", force: :cascade do |t|
    t.string "jurusan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string "jurusan1"
    t.string "jurusan2"
    t.string "jurusan3"
    t.string "gelombang"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_majors_on_user_id"
  end

  create_table "organization_degree_lists", force: :cascade do |t|
    t.string "jabatan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "nama_organisasi"
    t.date "mulai"
    t.date "berakhir"
    t.string "jabatan"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "parent_education_lists", force: :cascade do |t|
    t.string "pendidikan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parent_job_lists", force: :cascade do |t|
    t.string "pekerjaan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "nama_ayah"
    t.string "nama_ibu"
    t.string "pendidikan_ayah"
    t.string "pendidikan_ibu"
    t.string "pekerjaan_ayah"
    t.string "pekerjaan_ibu"
    t.bigint "nik_ayah"
    t.bigint "nik_ibu"
    t.date "tanggal_lahir_ayah"
    t.date "tanggal_lahir_ibu"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "personal_gender_lists", force: :cascade do |t|
    t.string "jenis_kelamin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_religion_lists", force: :cascade do |t|
    t.string "agama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personals", force: :cascade do |t|
    t.string "nama_lengkap"
    t.string "agama"
    t.string "tempat_lahir"
    t.string "jenis_kelamin"
    t.string "domisili"
    t.bigint "no_kps"
    t.bigint "nik"
    t.bigint "nisn"
    t.date "tanggal_lahir"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_personals_on_user_id"
  end

  create_table "pmdk_each_score_informations", force: :cascade do |t|
    t.decimal "matematika1"
    t.decimal "matematika2"
    t.decimal "matematika3"
    t.decimal "matematika4"
    t.decimal "matematika5"
    t.decimal "fisika1"
    t.decimal "fisika2"
    t.decimal "fisika3"
    t.decimal "fisika4"
    t.decimal "fisika5"
    t.decimal "kimia1"
    t.decimal "kimia2"
    t.decimal "kimia3"
    t.decimal "kimia4"
    t.decimal "kimia5"
    t.decimal "inggris1"
    t.decimal "inggris2"
    t.decimal "inggris3"
    t.decimal "inggris4"
    t.decimal "inggris5"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pmdk_each_score_informations_on_user_id"
  end

  create_table "pmdk_school_informations", force: :cascade do |t|
    t.string "asal_sekolah"
    t.string "akreditas"
    t.string "jurusan_sekolah"
    t.integer "jumlah_pelajaran_un"
    t.decimal "jumlah_nilai_un"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pmdk_school_informations_on_user_id"
  end

  create_table "pmdk_school_lists", force: :cascade do |t|
    t.string "sekolah"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pmdk_total_score_informations", force: :cascade do |t|
    t.decimal "jumlah_nilai_semester1"
    t.decimal "jumlah_nilai_semester2"
    t.decimal "jumlah_nilai_semester3"
    t.decimal "jumlah_nilai_semester4"
    t.decimal "jumlah_nilai_semester5"
    t.integer "jumlah_pelajaran_semester1"
    t.integer "jumlah_pelajaran_semester2"
    t.integer "jumlah_pelajaran_semester3"
    t.integer "jumlah_pelajaran_semester4"
    t.integer "jumlah_pelajaran_semester5"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pmdk_total_score_informations_on_user_id"
  end

  create_table "source_information_lists", force: :cascade do |t|
    t.string "informasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_motivation_lists", force: :cascade do |t|
    t.string "motivasi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.integer "jumlah_n"
    t.string "sumber_informasi"
    t.string "motivasi"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sources_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
  end

  create_table "usm_school_informations", force: :cascade do |t|
    t.string "asal_sekolah"
    t.string "akreditas"
    t.string "jurusan_sekolah"
    t.integer "jumlah_pelajaran_un"
    t.decimal "jumlah_nilai_un"
    t.integer "jumlah_pelajaran_semester5"
    t.decimal "jumlah_nilai_semester5"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_usm_school_informations_on_user_id"
  end

  create_table "utbk_school_informations", force: :cascade do |t|
    t.string "asal_sekolah"
    t.string "akreditas"
    t.string "jurusan_sekolah"
    t.integer "jumlah_pelajaran_un"
    t.decimal "jumlah_nilai_un"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_utbk_school_informations_on_user_id"
  end

  create_table "utbk_scores", force: :cascade do |t|
    t.string "no_peserta"
    t.date "tanggal_ujian"
    t.decimal "nilai_penalaran_umum"
    t.decimal "nilai_pengetahuan_kuantitatif"
    t.decimal "nilai_pengetahuan_dan_pemahaman_umum"
    t.decimal "nilai_kemampuan_memahami_bacaan_dan_menulis"
    t.decimal "jumlah_nilai_semester6"
    t.integer "jumlah_pelajaran_semester6"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_utbk_scores_on_user_id"
  end

  add_foreign_key "achievements", "users"
  add_foreign_key "address_kabupaten_lists", "address_province_lists"
  add_foreign_key "address_kecamatan_lists", "address_kabupaten_lists"
  add_foreign_key "addresses", "users"
  add_foreign_key "extras", "users"
  add_foreign_key "languages", "users"
  add_foreign_key "majors", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "parents", "users"
  add_foreign_key "personals", "users"
  add_foreign_key "pmdk_each_score_informations", "users"
  add_foreign_key "pmdk_school_informations", "users"
  add_foreign_key "pmdk_total_score_informations", "users"
  add_foreign_key "sources", "users"
  add_foreign_key "usm_school_informations", "users"
  add_foreign_key "utbk_school_informations", "users"
  add_foreign_key "utbk_scores", "users"
end
