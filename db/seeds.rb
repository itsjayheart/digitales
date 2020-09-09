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


10.times do
    creatrix = Creatrix.create(email: Faker::Name.first_name + "@yopmail.com", password: "123123")
    MicroserviceCategory.all.each do |cat|
    	micro = Microservice.create(creatrix: creatrix, price: rand(0.99e2..0.501e3), microservice_category: cat)
    end

end




# creating  t a l e . s

	end_of_time = Tale.create(title: 't a l e s | f r o m | t h e | e n d | o f | t i m e', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	atlantis = Tale.create(title: 't a l e s | o f | a t l a n t i s', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	galathea = Tale.create(title: 't a l e s | o f | g a l a t h e a', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	harrisson_davis = Tale.create(title: 't a l e s | o f | h a r r i s s o n | d a v i s', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	barbara_sand = Tale.create(title: 't a l e s | o f | b a r b a r a | s a n d', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	sobbing_heart = Tale.create(title: 't a l e s | o f | a | s o b b i n g | h e a r t', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	kuku_e = Tale.create(title: 't a l e s | o f | k u k u | e', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	broken_dream = Tale.create(title: 't a l e s | o f | a | b r o k e n | d r e a m', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	dying_earth = Tale.create(title: 't a l e s | o f | a | d y i n g | e a r t h', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	bliss = Tale.create(title: 't a l e s | o f | b l i s s', creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])


# creating  w h a t | i f . s

	creatrixes = WhatIf.create(sentence: 'a tiny zillion beings tricked us into oblivion', creatrix: Creatrix.all.sample)
	trois_mondes = WhatIf.create(sentence: 'three worlds ended all at once', creatrix: Creatrix.all.sample)
	qui_est_jerome = WhatIf.create(sentence: 'i was the last human left on earth', creatrix: Creatrix.all.sample)


# creating  m | s t a t e m e n t . s


# creating s e t t i n g . s 
	
	maamny = Setting.create(full_name: "m a ' a m | n ÿ'", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "w r a a t h", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "t h e | e l d e r", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "b l a n c h e", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "t h e | b l u e | c r e a t r i x", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "t h e | r e d | c r e a t r i x", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "s a l i m | u l t i m a t u m", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "k a m i l | u l t i m a t u m", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "s t a c e y | e n d e r s o n", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "c l a y t o n | n o l a n", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "k a t b o b", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "b a t m o o n", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "a | g i g a n t i c | e y e", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "t h e | d a r k e s t | o f | a l l", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "d e s t i n e e", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])
	maamny = Setting.create(full_name: "m a l i k | f i r s t | o f | h i s | n a m e", creatrix: Creatrix.all.sample, description: Faker::Books::Lovecraft.paragraphs(number: rand(1..3))[0])


# creating a  n o d e  for each nodeable

	tales = Tale.all
	what_if_s = WhatIf.all
	settings = Setting.all

	all_nodeables = [tales, what_if_s, settings].flatten

	all_nodeables.each do |nodeable|
		node = Node.create(creatrix: nodeable.creatrix, nodeable: nodeable)
		i = 0
		node_achievements = []
		rand(1..5).times do
			ach = Achievement.create(achievement_category: AchievementCategory.all[i], achieved?: true, node: node)
			node_achievements << ach
			i += 1
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





