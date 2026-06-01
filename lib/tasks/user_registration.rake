namespace :import do
  
  desc "csvファイルでレコードを読み込む(エラーレコードは排除)"
  task :csv_import_skip, [:file_path] => :environment do |task, args| 
    file_path = args[:file_path]

    if file_path.blank?
      abort "エラー: CSVファイルのパスを引数として指定してください。"
    end
    unless File.exist?(file_path)
      abort "エラー: 指定されたファイルが見つかりません: #{file_path}"
    end

    error_records = []
    departments = Department.all.pluck(:name, :id).to_h

    CSV.foreach(file_path, headers: true) do |row|
      begin
        department_id = departments[row['department_name']]
        raise ActiveRecord::RecordNotFound, "部署が見つかりません: #{row['department_name']}" if department_id.nil?

        User.create!(
          name: row['namae'],
          furigana: row['rubi'],
          gender: row['seibetu'],
          tel: row['denwa'],
          phone: row['keitai'],
          email: row['mairu'],
          post_number: row['yuubinbango'],
          birthday: row['tanjobi'],
          prefecture: row['jusho1'],
          city: row['jusho2'],
          town: row['jusho3'],
          street_address: row['jusho4'],
          building: row['jusho5'],
          department_id: department_id
        )
      rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
        error_records << { id: row['no'], name: row['namae'], error: e.message }
      end
    end
    error_records.each do |err|
      puts "保存失敗レコード ID: #{err[:id]}, Name: #{err[:name]}, Error: #{err[:error]}"
    end
  end 
end