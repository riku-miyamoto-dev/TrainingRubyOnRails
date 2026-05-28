namespace :user_registration do

  desc "csvファイルを読み込む"
  task csv_import: :environment do 
    ActiveRecord::Base.transaction do

      CSV.foreach('personal_infomation.csv', headers: true) do |row|
        departments = Department.find_by!(name: row['department_name'])
        skills = Skill.find_by!(name: row['skill_name'])
        begin
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
          department_id: departments.id
        )
        UsersSkill.create!(
          user_id: row['no'],
          skill_id: skills.id
        )
        rescue => e
          puts "エラーは#{row['namae']}さんのレコードで起こっています"
          Rails.logger.error("エラーが発生しました: #{e.message}")
          raise
        end   
      end
    end 
  end
end
