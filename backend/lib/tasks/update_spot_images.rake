namespace :spots do
  desc "seeds.rb の image_url をもとに既存スポット・レストランレコードを更新する"
  task update_images: :environment do
    spot_images = {
      "花見山公園" => "https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/20100418%E8%8A%B1%E8%A6%8B%E5%B1%B1%E5%85%AC%E5%9C%92%E5%85%A8%E6%99%AF.jpg/960px-20100418%E8%8A%B1%E8%A6%8B%E5%B1%B1%E5%85%AC%E5%9C%92%E5%85%A8%E6%99%AF.jpg",
      "飯坂温泉" => "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Iizaka_Onsen_26-Aug-2018.jpg/960px-Iizaka_Onsen_26-Aug-2018.jpg",
      "土湯温泉" => "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Tsuchiyu_Onsen_100808.jpg/960px-Tsuchiyu_Onsen_100808.jpg",
      "三春滝桜" => "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Miharu_Miharu-Takizakura_Front_1.jpg/960px-Miharu_Miharu-Takizakura_Front_1.jpg",
      "あぶくま洞" => "https://upload.wikimedia.org/wikipedia/commons/1/14/Flowstones_and_Mushroom_Rocks_inside_Abukuma-do_Cave.JPG",
      "安積国造神社" => "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Asakakunitsuko-jinja%2C_haiden-1.jpg/960px-Asakakunitsuko-jinja%2C_haiden-1.jpg",
      "開成山公園" => "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Kaiseizan_Park%2C_koriyama.Cto-75-31_c11b_7.jpg/960px-Kaiseizan_Park%2C_koriyama.Cto-75-31_c11b_7.jpg",
      "南湖公園" => "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Shirakawa_nanko.jpg/960px-Shirakawa_nanko.jpg",
      "白河小峰城" => "https://upload.wikimedia.org/wikipedia/commons/a/ab/Shirakawa_Komine_Castle_20100625-01.jpg",
      "鶴ヶ城（会津若松城）" => "https://upload.wikimedia.org/wikipedia/commons/3/3e/Aizuwakamatsu_Castle_03.jpg",
      "大内宿" => "https://upload.wikimedia.org/wikipedia/commons/d/d0/Ouchi-juku%2C_Fukushima_01.jpg",
      "猪苗代湖" => "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Lake_Inawashiro_view_from_Mt.Bandai.jpg/960px-Lake_Inawashiro_view_from_Mt.Bandai.jpg",
      "喜多方ラーメン館" => "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Kitakata_ramen_by_macyu_in_Yamagata.jpg/960px-Kitakata_ramen_by_macyu_in_Yamagata.jpg",
      "磐梯山ゴールドラインと五色沼" => "https://upload.wikimedia.org/wikipedia/commons/c/cf/Autumn_colours_at_Goshikinuma_%2837146437564%29.jpg",
      "会津武家屋敷" => "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Aizu_Bukeyashiki_Garden.jpg/960px-Aizu_Bukeyashiki_Garden.jpg",
      "裏磐梯レイクリゾート" => "https://upload.wikimedia.org/wikipedia/commons/2/2b/Lake-Onogawako-Urabandai-Japan.jpg",
      "塔のへつり" => "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/%E5%A1%94%E3%81%AE%E3%81%B8%E3%81%A4%E3%82%8A.JPG/960px-%E5%A1%94%E3%81%AE%E3%81%B8%E3%81%A4%E3%82%8A.JPG",
      "湯野上温泉" => "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Yunokamionsen_Station.png/960px-Yunokamionsen_Station.png",
      "スパリゾートハワイアンズ" => "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Spa_Resort_Hawaiians_Water_Park._A.JPG/960px-Spa_Resort_Hawaiians_Water_Park._A.JPG",
      "いわき市石炭・化石館（ほるる）" => "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/%E3%81%84%E3%82%8F%E3%81%8D%E5%B8%82%E7%9F%B3%E7%82%AD%E5%8C%96%E7%9F%B3%E9%A4%A8.JPG/960px-%E3%81%84%E3%82%8F%E3%81%8D%E5%B8%82%E7%9F%B3%E7%82%AD%E5%8C%96%E7%9F%B3%E9%A4%A8.JPG",
      "アクアマリンふくしま" => "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Aquamarine_Fukushima_20100124.JPG/960px-Aquamarine_Fukushima_20100124.JPG",
      "国営ひたち海浜公園（いわきからのアクセス）" => "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Ferris_wheel_of_the_Hitachi_beach_park%2Chitachi-kaihin-koen%2Chitachinaka-city%2Cjapan.JPG/960px-Ferris_wheel_of_the_Hitachi_beach_park%2Chitachi-kaihin-koen%2Chitachinaka-city%2Cjapan.JPG",
      "松川浦" => "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/20091011%E6%9D%BE%E5%B7%9D%E6%B5%A6.jpg/960px-20091011%E6%9D%BE%E5%B7%9D%E6%B5%A6.jpg",
      "相馬野馬追の里 相馬中村神社" => "https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Somanakamura_shrine.jpg/960px-Somanakamura_shrine.jpg"
    }

    restaurant_images = {
      "山女や" => "https://upload.wikimedia.org/wikipedia/commons/f/f7/Breakfast_at_Tamahan_Ryokan%2C_Kyoto.jpg",
      "喜楽" => "https://upload.wikimedia.org/wikipedia/commons/9/97/Japanese_Soba_Noodles_Tsuta.jpg",
      "カフェ杜" => "https://upload.wikimedia.org/wikipedia/commons/6/6d/Cafe_Muji_Shinjuku_Store_Interior_2013.jpg",
      "アクアパッツァ福島" => "https://upload.wikimedia.org/wikipedia/commons/7/70/Spaghetti_alle_vongole.jpg",
      "郡山フレンチ ル・シェーヌ" => "https://upload.wikimedia.org/wikipedia/commons/1/15/Salad_at_French_restaurant_in_Tokyo.jpg",
      "田村ラーメン 一心" => "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Kitakata_ramen_by_macyu_in_Yamagata.jpg/960px-Kitakata_ramen_by_macyu_in_Yamagata.jpg",
      "三春亭" => "https://upload.wikimedia.org/wikipedia/commons/9/97/Japanese_Soba_Noodles_Tsuta.jpg",
      "焼肉 安積苑" => "https://upload.wikimedia.org/wikipedia/commons/5/57/Yakiniku_001.jpg",
      "イタリアンカフェ ピアッツァ" => "https://upload.wikimedia.org/wikipedia/commons/7/70/Spaghetti_alle_vongole.jpg",
      "鶴ヶ城会館" => "https://upload.wikimedia.org/wikipedia/commons/f/f7/Breakfast_at_Tamahan_Ryokan%2C_Kyoto.jpg",
      "喜多方食堂 坂内" => "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Kitakata_ramen_by_macyu_in_Yamagata.jpg/960px-Kitakata_ramen_by_macyu_in_Yamagata.jpg",
      "大内宿三澤屋" => "https://upload.wikimedia.org/wikipedia/commons/9/97/Japanese_Soba_Noodles_Tsuta.jpg",
      "会津ワイナリー レストラン" => "https://upload.wikimedia.org/wikipedia/commons/1/15/Salad_at_French_restaurant_in_Tokyo.jpg",
      "中国料理 龍鳳" => "https://upload.wikimedia.org/wikipedia/commons/4/4d/Chinese_food_restaurant_SAIMENDO_03d.jpg",
      "猪苗代湖畔カフェ 天鏡" => "https://upload.wikimedia.org/wikipedia/commons/6/6d/Cafe_Muji_Shinjuku_Store_Interior_2013.jpg",
      "馬刺し・郷土料理 酔心" => "https://upload.wikimedia.org/wikipedia/commons/f/f7/Breakfast_at_Tamahan_Ryokan%2C_Kyoto.jpg",
      "いわき回転寿司 魚楽" => "https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg",
      "湯本温泉 割烹旅館 松葉" => "https://upload.wikimedia.org/wikipedia/commons/f/f7/Breakfast_at_Tamahan_Ryokan%2C_Kyoto.jpg",
      "スパリゾートハワイアンズ バイキング" => "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Spa_Resort_Hawaiians_Water_Park._A.JPG/960px-Spa_Resort_Hawaiians_Water_Park._A.JPG",
      "炭火居酒屋 蔵" => "https://upload.wikimedia.org/wikipedia/commons/4/4a/Quality_izakaya_in_Ebisu_5.jpg",
      "会津地酒と肴 本丸" => "https://upload.wikimedia.org/wikipedia/commons/4/4a/Quality_izakaya_in_Ebisu_5.jpg",
      "ブーランジェリー 麦の郷" => "https://upload.wikimedia.org/wikipedia/commons/9/93/Well_Bread_Artisan_Bakery%2C_High_Street_-_geograph.org.uk_-_4338261.jpg",
      "Pain de bois 土湯" => "https://upload.wikimedia.org/wikipedia/commons/9/93/Well_Bread_Artisan_Bakery%2C_High_Street_-_geograph.org.uk_-_4338261.jpg",
      "スパイスカレー ナマステ" => "https://upload.wikimedia.org/wikipedia/commons/1/12/Spicy_Anda_Curry.jpg",
      "薬膳カレー 会津漢方堂" => "https://upload.wikimedia.org/wikipedia/commons/1/12/Spicy_Anda_Curry.jpg",
      "相馬港直売所 海鮮食堂" => "https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg",
      "相馬中村 うなぎ 川富" => "https://upload.wikimedia.org/wikipedia/commons/f/f7/Breakfast_at_Tamahan_Ryokan%2C_Kyoto.jpg"
    }

    updated_spots = 0
    spot_images.each do |name, url|
      spot = Spot.find_by(name: name)
      if spot
        spot.update!(image_url: url)
        updated_spots += 1
        puts "  ✅ スポット更新: #{name}"
      else
        puts "  ⚠️  スポットが見つかりません: #{name}"
      end
    end

    updated_restaurants = 0
    restaurant_images.each do |name, url|
      restaurant = Restaurant.find_by(name: name)
      if restaurant
        restaurant.update!(image_url: url)
        updated_restaurants += 1
        puts "  ✅ グルメ更新: #{name}"
      else
        puts "  ⚠️  グルメが見つかりません: #{name}"
      end
    end

    puts "\n✅ 完了: スポット #{updated_spots}件、グルメ #{updated_restaurants}件 の画像URLを更新しました"
  end
end
