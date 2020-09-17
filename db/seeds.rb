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

# creating AchievementCategory and MicroServiceCategory lists


achievs = [["CREATIVE WRITING", "text"], ["2D DIGITAL ART", "image"], ["3D DIGITAL ART", "video"], ["ACTING", "sound"], ["EDITING", "video"], ["COMPOSING", "sound"]]

achievs.each do |achiev|
	ach_cat = AchievementCategory.create(name: achiev[0])
end

writing_microservices = ["1.5k words synopsis", "10k words one-shot", "10k words one-shot: screenplay translation"]

flat_microservices = ["2D character design", "2D prop design", "50-150 panels webcomic : thumbnail", "50-150 panels webcomic :sketching", "50-150 panels webcomic : lineart", "50-150 panels webcomic : flats", "50-150 panels webcomic : shadows and highlights", "50-150 panels webcomic : backgrounds", "50-150 panels webcomic : cover"]

volume_microservices = ["3D modeling : character design", "3D modeling : prop design", "3D scenery artwork", "3D character artwork", "3D rigging of a character", "1-3 minutes animated scene"]

acting_microservices = ["1-3 minutes animated scene voice acting"]

editing_microservices = ["1-3 minutes animated scene editing"]

music_microservices = ["1-3 minutes music theme"] 

micros = [writing_microservices, flat_microservices, volume_microservices, acting_microservices, editing_microservices, music_microservices]

i = 0

micros.each do |arr|
	arr.each do |micro|
		cat = MicroserviceCategory.create(name: micro, achievement_category: AchievementCategory.all[i], media_type: achievs[i][1])
	end
	i += 1
end

Creatrix.create(email: "melon" + "@yopmail.com", password: "123123")
10.times do
    creatrix = Creatrix.create(email: Faker::Name.first_name + "@yopmail.com", password: "123123")
    MicroserviceCategory.all.each do |cat|
    	#micro = Microservice.create(creatrix: creatrix, price: rand(0.99e2..0.501e3), microservice_category: cat)
    end
end





