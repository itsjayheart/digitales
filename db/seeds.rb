# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# lolilol
# Examples:
# 
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Node.destroy_all
Creatrix.destroy_all
Tale.destroy_all
WhatIf.destroy_all
MStatement.destroy_all
Setting.destroy_all
Digit.destroy_all
Achievement.destroy_all
Microservice.destroy_all
AchievementCategory.destroy_all
MicroserviceCategory.destroy_all
MicroserviceRequest.destroy_all
Fundraiser.destroy_all
DonatedSum.destroy_all
Digitale.destroy_all



achievements_categories = [["CREATIVE WRITING", "text"], ["2D DIGITAL ART", "image"], ["3D DIGITAL ART", "video"], ["ACTING", "sound"], ["EDITING", "video"], ["COMPOSING", "sound"]]

achievements_categories.each do |achiev|
	achievement_category = AchievementCategory.create(name: achiev[0])
end

writing_microservices_category = ["1.5k words synopsis", "10k words one-shot", "10k words one-shot: screenplay translation"]

flat_microservices_category = ["2D character design", "2D prop design", "50-150 panels webcomic : thumbnail", "50-150 panels webcomic :sketching", "50-150 panels webcomic : lineart", "50-150 panels webcomic : flats", "50-150 panels webcomic : shadows and highlights", "50-150 panels webcomic : backgrounds", "50-150 panels webcomic : cover"]

volume_microservices_category = ["3D modeling : character design", "3D modeling : prop design", "3D scenery artwork", "3D character artwork", "3D rigging of a character", "1-3 minutes animated scene"]

acting_microservices_category = ["1-3 minutes animated scene voice acting"]

editing_microservices_category = ["1-3 minutes animated scene editing"]

music_microservices_category = ["1-3 minutes music theme"] 

microservice_categories = [writing_microservices_category, flat_microservices_category, volume_microservices_category, acting_microservices_category, editing_microservices_category, music_microservices_category]

i = 0
microservice_categories.each do |achievement_microservices_category|
	achievement_microservices_category.each do |microservice_category_name|
		microservice_category = MicroserviceCategory.create(name: microservice_category_name, achievement_category: AchievementCategory.all[i], media_type: achievements_categories[i][1])
	end
	i += 1
end

Creatrix.create(email: "melon" + "@yopmail.com", password: "123123")
10.times do
    creatrix = Creatrix.create(hexanyme: Faker::Games::LeagueOfLegends.champion, email: Faker::Name.first_name + "@yopmail.com", password: "123123")
    MicroserviceCategory.all.each do |cat|
    	#micro = Microservice.create(creatrix: creatrix, price: rand(0.99e2..0.501e3), microservice_category: cat)
    end
end

30.times do |i|
	creatrix = Creatrix.all.sample
	digitale = Digitale.create(creatrix: creatrix)
	tale = Tale.create(creatrix: creatrix) 
	Node.create(nodeable: tale, title: Faker::Book.title, content: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..500)), creatrix: creatrix, digitale: digitale)
	what_if = WhatIf.create(creatrix: creatrix)
	Node.create(nodeable: what_if, title: Faker::GreekPhilosophers.quote , content: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..500)) , creatrix: creatrix, digitale: digitale)
	7.times do |x|
		m_statement = MStatement.create(creatrix: creatrix)
		Node.create(nodeable: m_statement, title: Faker::Games::LeagueOfLegends.quote , content: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..500)) , creatrix: creatrix, digitale: digitale)
	end
end










