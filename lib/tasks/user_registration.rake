# frozen_string_literal: true

namespace :import do
  desc 'csvファイルでレコードを読み込む(エラーレコードは排除)'
  task :user_csv, [:file_path] => :environment do |_task, args|
    file_path = args[:file_path]

    abort 'エラー: CSVファイルのパスを引数として指定してください。' if file_path.blank?
    abort "エラー: 指定されたファイルが見つかりません: #{file_path}" unless File.exist?(file_path)

    error_records = []
    users = []
    departments = Department.all.pluck(:name, :id).to_h

    CSV.foreach(file_path, headers: true) do |row|
      users << User.new(
        name: row['namae'],
        furigana: row['rubi'],
        gender: row['seibetu'],
        tel: row['denwa'],
        phone: row['keitai'],
        email: row['mairu'],
        post_number: row['yuubinbango'],
        prefecture: row['jusho1'],
        city: row['jusho2'],
        town: row['jusho3'],
        street_address: row['jusho4'],
        building: row['jusho5'],
        birthday: row['tanjobi'],
        department_id: departments[row['department_name']]
      )
    end
    users.each do |user|
      user.save!
    rescue ActiveRecord::RecordInvalid => e
      error_records << { name: user.name, error: e.message }
    end

    error_records.each do |err|
      puts "保存失敗レコード Name: #{err[:name]}, Error: #{err[:error]}"
    end
  end
end
