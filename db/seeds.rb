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
MicroserviceAchievementRelation.destroy_all
Fundraiser.destroy_all
DonatedSum.destroy_all

# creating AchievementCategory and MicroServiceCategory lists


	achievs = ["CREATIVE WRITING", "2D DIGITAL ART", "3D DIGITAL ART", "ACTING", "EDITING", "COMPOSING"]

achievs.each do |achiev|
	ach_cat = AchievementCategory.create(name: achiev)
end

wri_micros = ["1.5k synopsis", "10k words one-shot", "10k words one-shot: screenplay translation"]

flat_micros = ["2D character design", "2D prop design", "50-150 panels webcomic : thumbnail", "50-150 panels webcomic :sketching", "50-150 panels webcomic : lineart", "50-150 panels webcomic : flats", "50-150 panels webcomic : shadows and highlights", "50-150 panels webcomic : backgrounds", "50-150 panels webcomic : cover"]

volume_micros = ["3D modeling : character design", "3D modeling : prop design", "3D scenery artwork", "3D character artwork", "3D rigging of a character", "1-3 minutes animated scene"]

act_micros = ["1-3 minutes animated scene voice acting"]

editing_micros = ["1-3 minutes animated scene editing"]

music_micros = ["1-3 minutes music theme"] 

micros = [wri_micros, flat_micros, volume_micros, act_micros, editing_micros, music_micros]

i = 0

micros.each do |arr|
	arr.each do |micro|
		cat = MicroserviceCategory.create(name: micro, achievement_category: AchievementCategory.all[i])
	end
	i += 1
end

Creatrix.create(email: "melon" + "@yopmail.com", password: "123123")
10.times do
    creatrix = Creatrix.create(email: Faker::Name.first_name + "@yopmail.com", password: "123123")
    MicroserviceCategory.all.each do |cat|
    	micro = Microservice.create(creatrix: creatrix, price: rand(0.99e2..0.501e3), microservice_category: cat)
    end

end




# creating  t a l e . s

	end_of_time = Tale.create(title: 'TALES FROM THE END OF TIME', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	atlantis = Tale.create(title: 'TALES OF ATLANTIS', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	galathea = Tale.create(title: 'TALES OF GALATHEA', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	harrisson_davis = Tale.create(title: 'TALES OF HARRISSON DAVIS', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	barbara_sand = Tale.create(title: 'TALES OF BARBARA SAND', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	sobbing_heart = Tale.create(title: 'TALES OF A SOBBING HEART', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	kuku_e = Tale.create(title: 'TALES OF KUKU-E', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	broken_dream = Tale.create(title: 'TALES OF A BROKEN DREAM', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	dying_earth = Tale.create(title: 'TALES OF A DYING EARTH', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	bliss = Tale.create(title: 'TALES OF BLISS', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])


# creating  w h a t | i f . s

	creatrixes = WhatIf.create(sentence: 'a tiny zillion beings tricked us into oblivion', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	trois_mondes = WhatIf.create(sentence: 'three worlds ended all at once', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	qui_est_jerome = WhatIf.create(sentence: 'i was the last human left on earth', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])


# creating  m | s t a t e m e n t . s


# creating s e t t i n g . s 
	
	maamny = Setting.create(full_name: "MA'AM NY'", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "WRAATH", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "THE ELDER", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "BLANCHE", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "THE BLUE CREATRIX", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "THE RED CREATRIX", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "SALIM ULTIMATUM", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "KAMIL ULTIMATUM", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "STACEY ENDERSON", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "CLAYTON NOLAN", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "KATBOB", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "BATMOON", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "A GIGANTIC EYE", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "THE DARKEST OF ALL", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "DESTINEE", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "MALIK FIRST OF HIS NAME", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])


# creating a  n o d e  for each nodeable

	tales = Tale.all
	what_if_s = WhatIf.all
	settings = Setting.all

	all_nodeables = [tales, what_if_s, settings].flatten

	all_nodeables.each do |nodeable|
		case nodeable.class.name
		when "Tale"
			n = nodeable.title
			d = nodeable.description
		when "WhatIf"
			n = "WHAT IF " + nodeable.sentence
			d = nodeable.description
		when "Setting"
			n = nodeable.full_name
			d = nodeable.description
		end
		node = Node.create(creatrix: nodeable.creatrix, nodeable: nodeable, title: n, content: d)
		i = 0
		node_achievements = []
		rand(0..5).times do
			ach = Achievement.create(achievement_category: AchievementCategory.all[i], achieved?: true, node: node)
			node_achievements << ach
			i += 1
		end

		i = node.achievements.count

		non_achieved = Achievement.create(achievement_category: AchievementCategory.all[i], achieved?: false, node: node)
		i = 0
		rand(0..non_achieved.achievement_category.microservice_categories.count - 1).times do
			micro = Microservice.where(microservice_category: non_achieved.achievement_category.microservice_categories[i]).sample
			non_achieved.microservices << micro
			i += 1
			raiser = Fundraiser.create(goal: micro.price, funded?: true, microservice_achievement_relation: MicroserviceAchievementRelation.where(achievement: non_achieved, microservice: micro)[0])
			sum = raiser.goal / 3
			3.times do
				DonatedSum.create(sum: sum, creatrix: Creatrix.all.sample, fundraiser: raiser)
			end
		end

		current_micro = Microservice.where(microservice_category: non_achieved.achievement_category.microservice_categories[i]).sample
		non_funded = Fundraiser.create(goal: current_micro.price, funded?: false, microservice_achievement_relation: MicroserviceAchievementRelation.where(achievement: non_achieved, microservice: current_micro)[0])
		sum = non_funded.goal / 3
		2.times do
			DonatedSum.create(sum: sum, creatrix: Creatrix.all.sample, fundraiser: non_funded)
		end

		i = 0
		node_achievements.each do |ach|
			ach.achievement_category.microservice_categories.each do |mic_cat|
				ach.microservices << Microservice.where(microservice_category: mic_cat).sample
			end
			ach.microservices.each do |micro|
				raiser = Fundraiser.create(goal: micro.price, funded?: true, microservice_achievement_relation: MicroserviceAchievementRelation.where(achievement: ach, microservice: micro)[0])
				sum = raiser.goal / 3
				3.times do
					DonatedSum.create(sum: sum, creatrix: Creatrix.all.sample, fundraiser: raiser)
				end
			end
		end
	end





