namespace :user_registration do

desc "csvファイルでレコードを読み込む(エラーレコードは排除)"
task csv_import_skip: :environment do 
  error_records = []
  
  CSV.foreach('personal_infomation.csv', headers: true) do |row|
    begin
      ActiveRecord::Base.transaction do
        department = Department.find_by!(name: row['department_name'])
        user = User.create!(
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
          department_id: department.id
        )
      end

    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e 
      error_records << { id: row['no'], name: row['namae'], error: e.message }
      next
    end   
  end
  error_records.each do |err|
    puts "保存失敗レコード ID: #{err[:id]}, Name: #{err[:name]}, Error: #{err[:error]}"
  end
  end 

end
