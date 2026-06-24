xml.instruct! :xml, version: "1.0"
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc departments_url
  end
  xml.url do
    xml.loc skills_url
  end
  xml.url do
    xml.loc root_url
  end

  @users.each do |user|
    xml.url do
      xml.loc user_url(user)
      xml.lastmod user.updated_at.iso8601
    end
  end

  @skills.each do |skill|
    xml.url do
      xml.loc skill_url(skill) 
      xml.lastmod skill.updated_at.iso8601
    end
  end

  @departments.each do |department|
    xml.url do
      xml.loc department_url(department) 
      xml.lastmod department.updated_at.iso8601
    end
  end

end