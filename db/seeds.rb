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



achievements_categories = [["CREATIVE WRITING", "text"], ["2D DIGITAL ART", "image"], ["3D DIGITAL ART", "video"], ["ACTING", "sound"], ["COMPOSING", "sound"], ["EDITING", "video"]]

achievements_categories.each do |achievement_category|
	achievement_category = AchievementCategory.create(name: achievement_category[0])
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

pictures_array = ["seed_pic1.png", "seed_pic2.png", "seed_pic3.png", "seed_pic4.png", "seed_pic5.png", "seed_pic6.png", "seed_pic7.png", "seed_pic8.png", "seed_pic9.png", "seed_pic10.png"]
youtube_array = ["https://www.youtube.com/watch?v=cZc6cr6G2E4&t","https://www.youtube.com/watch?v=6bgi5STRe8E", "https://www.youtube.com/watch?v=DVXEYksoE6c", "https://www.youtube.com/watch?v=0Ah4MKgqwa4", "https://www.youtube.com/watch?v=jkj8KmxYpkQ", "https://www.youtube.com/watch?v=4V_PYDlfTDU&t", "https://www.youtube.com/watch?v=pQYtbAnRy98", "https://www.youtube.com/watch?v=y4t9wx5_lg0","https://www.youtube.com/watch?v=zB0O6E_DH-s","https://www.youtube.com/watch?v=iQZobAhgayA&t"]
soundcloud_array = ['<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/499480059&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/i-am-the-king" title="I am the king" target="_blank" style="color: #cccccc; text-decoration: none;">I am the king</a></div>','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/606667269&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/sdfclan-dagda-la-terre-des-secrets" title="SDFclan / Dagda - La terre des secrets" target="_blank" style="color: #cccccc; text-decoration: none;">SDFclan / Dagda - La terre des secrets</a></div>','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/887914678&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/beatruffmaga94bpm-freedl" title="Beat - Ruffmaga *94bpm ( Free DL )" target="_blank" style="color: #cccccc; text-decoration: none;">Beat - Ruffmaga *94bpm ( Free DL )</a></div>','https://soundcloud.com/keurk-beats/beat-6-aout-2015','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/847880338&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/beat-k7" title="Beat -  K7" target="_blank" style="color: #cccccc; text-decoration: none;">Beat -  K7</a></div>','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/845899240&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/beat-poe-83bpm" title="Beat - POE *83bpm" target="_blank" style="color: #cccccc; text-decoration: none;">Beat - POE *83bpm</a></div>','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/842984446&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/beat-el-pero-3-82bpm" title="Beat - El Pero 3 *82bpm" target="_blank" style="color: #cccccc; text-decoration: none;">Beat - El Pero 3 *82bpm</a></div>','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/821630608&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/gothic-badtrip-4-rem" title="Gothic Badtrip 4 REM" target="_blank" style="color: #cccccc; text-decoration: none;">Gothic Badtrip 4 REM</a></div,>','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/827166739&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/keurk-beats" title="Keurk&#x27;s Beats" target="_blank" style="color: #cccccc; text-decoration: none;">Keurk&#x27;s Beats</a> · <a href="https://soundcloud.com/keurk-beats/beat-creature-86-bpm" title="Beat - Creature *86 Bpm" target="_blank" style="color: #cccccc; text-decoration: none;">Beat - Creature *86 Bpm</a></div>']

AchievementCategory.all.each do |achievement_category|
	achievement_category.microservice_categories.each do |microservice_category|
		rand(3..10).times do |y|
			microservice = Microservice.create(price: rand(1..50), microservice_category: microservice_category, creatrix: Creatrix.all[y], )
			case microservice.microservice_category.media_type
			when "image"
				picture = pictures_array.sample
				microservice.picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'seed', picture)), filename: picture, content_type: 'image/png')
			when "video"
				microservice.update(youtube: "<iframe width='100%' height='100%' src='#{youtube_array.sample.sub("https://www.youtube.com/watch?v=","http://www.youtube.com/embed/")}' frameborder='0'></iframe>")
			when "sound"
				microservice.update(soundcloude: soundcloud_array.sample)
			when "text"
				h = "h#{rand(1..6)}"
				microservice.update(quill:"<#{h}>"+Faker::Book.title+"</#{h}><p>"+Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..500))+"</p><i>"+Faker::Games::LeagueOfLegends.quote+"</i><p>"+Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..500))+"</p>")
			end
		end
	end
end

Digitale.all.each do |digitale|
  nodes_length = rand(0..7)
  nodes_length.times do |x|
    nodes_length-1 == x ? microservice_category_length = rand(MicroserviceCategory.all.length) : microservice_category_length = MicroserviceCategory.all.length
    microservice_category_length.times do |id|
      achievement = digitale.nodes[2+x].non_achieved
      microservice_category = MicroserviceCategory.all[id]
      microservice = Microservice.where(microservice_category: microservice_category).sample
      microservice_request = MicroserviceRequest.create(achievement: achievement, microservice: microservice, microservice_category: microservice_category, accepted?: true, delivered?: true)
      case microservice_request.microservice_category.media_type
      when "image"
        picture = pictures_array.sample
        microservice_request.art_work.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'seed', picture)), filename: picture, content_type: 'image/png')
      when "video"
        microservice_request.update(youtube: "<iframe width='100%' height='100%' src='#{youtube_array.sample.sub("https://www.youtube.com/watch?v=","http://www.youtube.com/embed/")}' frameborder='0'></iframe>")
      when "sound"
        microservice_request.update(soundcloude: soundcloud_array.sample)
      when "text"
        h = "h#{rand(1..6)}"
        microservice_request.update(quill:"<#{h}>"+Faker::Book.title+"</#{h}><p>"+Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..500))+"</p><i>"+Faker::Games::LeagueOfLegends.quote+"</i><p>"+Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..500))+"</p>")
      end
      microservice_request.achievement.update(achieved?: true) if microservice_request.microservice_category.id == microservice_request.achievement.achievement_category.microservice_categories.last.id
    end
  end
end









