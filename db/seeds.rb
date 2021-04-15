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

flat_microservices_category = ["2D character design", "2D prop design", "50-150 panels webcomic: thumbnail", "50-150 panels webcomic: sketching", "50-150 panels webcomic: lineart", "50-150 panels webcomic: flats", "50-150 panels webcomic: shadows and highlights", "50-150 panels webcomic: backgrounds", "50-150 panels webcomic: cover"]

volume_microservices_category = ["3D modeling: character design", "3D modeling: prop design", "3D scenery artwork", "3D character artwork", "3D rigging of a character", "1-3 minutes animated scene"]

acting_microservices_category = ["1-3 minutes animated scene voice acting"]

editing_microservices_category = ["1-3 minutes animated scene editing"]

music_microservices_category = ["1-3 minutes music theme"] 

microservice_categories = [writing_microservices_category, flat_microservices_category, volume_microservices_category, acting_microservices_category, music_microservices_category, editing_microservices_category]

i = 0
microservice_categories.each do |achievement_microservices_category|
	achievement_microservices_category.each do |microservice_category_name|
		microservice_category = MicroserviceCategory.create(name: microservice_category_name, achievement_category: AchievementCategory.all[i], media_type: achievements_categories[i][1])
	end
	i += 1
end


=begin
creatrix = Creatrix.create(email: "melon" + "@yopmail.com", password: "123123")
avatar = rand(9)
creatrix.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'seed', "avatar_#{avatar}.png")), filename: "avatar_#{avatar}.png", content_type: 'image/png')

10.times do |x|
    creatrix = Creatrix.create(hexanyme: Faker::Games::LeagueOfLegends.champion, email: Faker::Name.first_name + "@yopmail.com", password: "123123")
	creatrix.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'seed', "avatar_#{x}.png")), filename: "avatar_#{x}.png", content_type: 'image/png')
end

30.times do |i|
	creatrix = Creatrix.all.sample
	digitale = Digitale.create(creatrix: creatrix)
	tale = Tale.create(creatrix: creatrix) 
	Node.create(nodeable: tale, title: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(6..20)), content: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..255)), creatrix: creatrix, digitale: digitale)
	what_if = WhatIf.create(creatrix: creatrix)
	Node.create(nodeable: what_if, title: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(6..20)) , content: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..255)) , creatrix: creatrix, digitale: digitale)
	7.times do |x|
		m_statement = MStatement.create(creatrix: creatrix)
		Node.create(nodeable: m_statement, title: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(6..20)) , content: Faker::Books::Lovecraft.paragraph_by_chars(characters: rand(200..255)) , creatrix: creatrix, digitale: digitale)
	end
end

pictures_array = ["seed_pic1.png", "seed_pic2.png", "seed_pic3.png", "seed_pic4.png", "seed_pic5.png", "seed_pic6.png", "seed_pic7.png", "seed_pic8.png", "seed_pic9.png", "seed_pic10.png"]
youtube_array = ['<iframe width="100%" height="100%" src="https://www.youtube.com/embed/6bgi5STRe8E?controls=0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','<iframe width="100%" height="100%" src="https://www.youtube.com/embed/DVXEYksoE6c" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','<iframe width="100%" height="100%" src="https://www.youtube.com/embed/JjaYW5Cnr5k" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','<iframe width="100%" height="100%" src="https://www.youtube.com/embed/cZc6cr6G2E4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','<iframe width="100%" height="100%" src="https://www.youtube.com/embed/wogleLdPk38" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','<iframe width="100%" height="100%" src="https://www.youtube.com/embed/jkj8KmxYpkQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/4V_PYDlfTDU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/1qiuuxmWncY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/zR_OWN1dQ-s" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','<iframe width="100%" height="100%" src="https://www.youtube.com/embed/8CalT_WR9wA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>']
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
				microservice.update(youtube: youtube_array.sample)
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
  nodes_length = rand(0..6)
  nodes_length.times do |x|
    nodes_length-1 == x ? microservice_category_length = rand(MicroserviceCategory.all.length) : microservice_category_length = MicroserviceCategory.all.length
    microservice_category_length.times do |id|
      achievement = digitale.nodes[2 + x].non_achieved
      microservice_category = MicroserviceCategory.all[id]
      microservice = Microservice.where(microservice_category: microservice_category).sample
      microservice_request = MicroserviceRequest.create(achievement: achievement, microservice: microservice, microservice_category: microservice_category, accepted?: true, delivered?: true)
      case microservice_request.microservice_category.media_type
      when "image"
        picture = pictures_array.sample
        microservice_request.art_work.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'seed', picture)), filename: picture, content_type: 'image/png')
      when "video"
        microservice_request.update(youtube: youtube_array.sample)
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
=end








