require 'csv'

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Vinnyts'ka Oblast'").translation.update!(locale: "uk",name: "Вінницька")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Vinnyts'ka Oblast'").translation.update!(locale: "ru",name: "Винницкая")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Volyns'ka Oblast'").translation.update!(locale: "uk",name: "Волинська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Volyns'ka Oblast'").translation.update!(locale: "ru",name: "Волынская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Luhans'ka Oblast'").translation.update!(locale: "uk",name: "Луганська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Luhans'ka Oblast'").translation.update!(locale: "ru",name: "Луганская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Dnipropetrovs'ka Oblast'").translation.update!(locale: "uk",name: "Дніпропетровська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Dnipropetrovs'ka Oblast'").translation.update!(locale: "ru",name: "Днепропетровская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Donets'ka Oblast'").translation.update!(locale: "uk",name: "Донецька")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Donets'ka Oblast'").translation.update!(locale: "ru",name: "Донецкая")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zhytomyrs'ka Oblast'").translation.update!(locale: "uk",name: "Житомирська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zhytomyrs'ka Oblast'").translation.update!(locale: "ru",name: "Житомирская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zakarpats'ka Oblast'").translation.update!(locale: "uk",name: "Закарпатська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zakarpats'ka Oblast'").translation.update!(locale: "ru",name: "Закарпатская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zaporiz'ka Oblast'").translation.update!(locale: "uk",name: "Запорізька")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zaporiz'ka Oblast'").translation.update!(locale: "ru",name: "Запорожская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ivano-Frankivs'ka Oblast'").translation.update!(locale: "uk",name: "Івано-Франківська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ivano-Frankivs'ka Oblast'").translation.update!(locale: "ru",name: "Ивано-Франковская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka mis'ka rada").translation.update!(locale: "uk",name: "м.Київ")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka mis'ka rada").translation.update!(locale: "ru",name: "г.Киев")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka Oblast'").translation.update!(locale: "uk",name: "Київська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka Oblast'").translation.update!(locale: "ru",name: "Киевская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kirovohrads'ka Oblast'").translation.update!(locale: "uk",name: "Кіровоградська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kirovohrads'ka Oblast'").translation.update!(locale: "ru",name: "Кировоградская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sevastopol").translation.update!(locale: "uk",name: "м.Севастополь")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sevastopol").translation.update!(locale: "ru",name: "г.Севастополь")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Respublika Krym").translation.update!(locale: "uk",name: "Автономна Республіка Крим")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Respublika Krym").translation.update!(locale: "ru",name: "АР Крым")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "L'vivs'ka Oblast'").translation.update!(locale: "uk",name: "Львівська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "L'vivs'ka Oblast'").translation.update!(locale: "ru",name: "Львовская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Mykolaïvs'ka Oblast'").translation.update!(locale: "uk",name: "Миколаївська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Mykolaïvs'ka Oblast'").translation.update!(locale: "ru",name: "Николаевская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Odes'ka Oblast'").translation.update!(locale: "uk",name: "Одеська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Odes'ka Oblast'").translation.update!(locale: "ru",name: "Одесская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Poltavs'ka Oblast'").translation.update!(locale: "uk",name: "Полтавська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Poltavs'ka Oblast'").translation.update!(locale: "ru",name: "Полтавская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Rivnens'ka Oblast'").translation.update!(locale: "uk",name: "Рівненська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Rivnens'ka Oblast'").translation.update!(locale: "ru",name: "Ровенская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sums 'ka Oblast'").translation.update!(locale: "uk",name: "Сумська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sums 'ka Oblast'").translation.update!(locale: "ru",name: "Сумская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ternopil's'ka Oblast'").translation.update!(locale: "uk",name: "Тернопільська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ternopil's'ka Oblast'").translation.update!(locale: "ru",name: "Тернопольская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kharkivs'ka Oblast'").translation.update!(locale: "uk",name: "Харківська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kharkivs'ka Oblast'").translation.update!(locale: "ru",name: "Харьковская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khersons'ka Oblast'").translation.update!(locale: "uk",name: "Херсонська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khersons'ka Oblast'").translation.update!(locale: "ru",name: "Херсонская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khmel'nyts'ka Oblast'").translation.update!(locale: "uk",name: "Хмельницька")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khmel'nyts'ka Oblast'").translation.update!(locale: "ru",name: "Хмельницкая")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Cherkas'ka Oblast'").translation.update!(locale: "uk",name: "Черкаська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Cherkas'ka Oblast'").translation.update!(locale: "ru",name: "Черкасская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernihivs'ka Oblast'").translation.update!(locale: "uk",name: "Чернігівська")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernihivs'ka Oblast'").translation.update!(locale: "ru",name: "Черниговская")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernivets'ka Oblast'").translation.update!(locale: "uk",name: "Чернівецька")
#Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernivets'ka Oblast'").translation.update!(locale: "ru",name: "Черновицкая")


Spree::Store.current.update_attributes(default_currency: "UAH")
Spree::Store.current.update_attributes(name: "Знак якості")
Spree::Store.current.update(mail_from_address: "videoko2016@gmail.com")
Spree::Store.current.update(url: "videoko-test.devarena.lviv.ua")
Spree::Store.current.update(name: "Знак якості")
Spree::Country.find(230).translation.update(locale: "ru", name:"Украина")
Spree::Role.create(name: "rozdrib")
Spree::Role.create(name: "opt")
Spree::Role.create(name: "gold")
Spree::Role.create(name: "vip")
Spree::Role.create(name: "vip2")
Spree::Role.create(name: "vip1")
Spree::Role.find_by(name: "user").destroy

CSV.foreach("db/taxonomy.csv", headers: true)do |property|
Spree::Taxonomy.create! property.to_h
end
p "Taxonomy"

6.times do |t|
CSV.foreach("db/taxon_#{t+1}.csv", headers: true)do |taxon|
tax = Spree::Taxon.new(taxon.to_h)
  tax.update(taxonomy_id:Spree::Taxonomy.find("#{t+1}").id, parent_id: Spree::Taxonomy.find("#{t+1}").id)
    tax.save!
end
end
p "Taxons"

Spree::Config.rate = 26.8
Spree::Product.search_index.clean_indices
Spree::Product.search_index.delete
CSV.foreach("db/products_test.csv", headers: true) do |product|
if !product["post_title"].nil?
  Spree::Product.create!(name: ActionController::Base.helpers.sanitize(product["post_title"]), description: ActionController::Base.helpers.sanitize(product["post_content"]), short_description: ActionController::Base.helpers.sanitize(product["post_excerpt"]), available_on: Time.current)
else
  Spree::Product.create!(name: "назва", description: ActionController::Base.helpers.sanitize(product["post_content"]), short_description: ActionController::Base.helpers.sanitize(product["post_excerpt"]), available_on: Time.current)
end
end
Spree::Product.all.each do |pr|
  Spree::Price.create!(product_id: pr.id, amount_usd: 1, variant_id: pr.id, role_id:3)
  Spree::Price.create(product_id: pr.id, amount_usd: 1, variant_id: pr.id, role_id:4)
  Spree::Price.create(product_id: pr.id, amount_usd: 1, variant_id: pr.id, role_id:5)
  Spree::Price.create(product_id: pr.id, amount_usd: 1, variant_id: pr.id, role_id:6)
  Spree::Price.create(product_id: pr.id, amount_usd: 1, variant_id: pr.id, role_id:7)
  Spree::Price.create(product_id: pr.id, amount_usd: 1, variant_id: pr.id, role_id:8)
end

p "products"

option_types_attributes_camery = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Тип камери',
    presentation: 'Тип камери',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Роздільна Здатність',
    presentation: 'Роздільна Здатність',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Форм фактор',
    presentation: 'Форм фактор',
    position: 4
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: "Тип обʼєктива",
    presentation: "Тип обʼєктива",
    position: 5
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Дальність підсвітки',
    presentation: 'Дальність підсвітки',
    position: 6
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Камери").id,
    name: 'Ступінь захисту',
    presentation: 'Ступінь захисту',
    position: 7
  },
]

option_types_attributes_camery.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

option_types_attributes_ptz = [
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Тип камери',
    presentation: 'Тип камери',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Роздільна Здатність',
    presentation: 'Роздільна Здатність',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Форм фактор',
    presentation: 'Форм фактор',
    position: 4
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: "Тип обʼєктива",
    presentation: "Тип обʼєктива",
    position: 5
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Дальність підсвітки',
    presentation: 'Дальність підсвітки',
    position: 6
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id,
    name: 'Ступінь захисту',
    presentation: 'Ступінь захисту',
    position: 7
  },
]

option_types_attributes_ptz.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

"=============================================================================================================================="
manufacturer_option_type_camera = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
type_cam_option_type_camera = Spree::OptionType.find_by!(name: 'Тип камери', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
roz_ability_option_type_camera = Spree::OptionType.find_by!(name: 'Роздільна Здатність', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
form_option_type_camera = Spree::OptionType.find_by!(name: 'Форм фактор', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
object_option_type_camera = Spree::OptionType.find_by!(name: "Тип обʼєктива", taxon_id: Spree::Taxon.find_by(name: "Камери").id)
light_option_type_camera = Spree::OptionType.find_by!(name: 'Дальність підсвітки', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
grade_option_type_camera = Spree::OptionType.find_by!(name: 'Ступінь захисту', taxon_id: Spree::Taxon.find_by(name: "Камери").id)
"=============================================================================================================================="
manufacturer_option_type_ptz = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
type_cam_option_type_ptz = Spree::OptionType.find_by!(name: 'Тип камери', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
roz_ability_option_type_ptz = Spree::OptionType.find_by!(name: 'Роздільна Здатність', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
form_option_type_ptz = Spree::OptionType.find_by!(name: 'Форм фактор', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
object_option_type_ptz = Spree::OptionType.find_by!(name: "Тип обʼєктива", taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
light_option_type_ptz = Spree::OptionType.find_by!(name: 'Дальність підсвітки', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)
grade_option_type_ptz = Spree::OptionType.find_by!(name: 'Ступінь захисту', taxon_id: Spree::Taxon.find_by(name: "PTZ камери").id)

"=============================================================================================================================="
manufacturer = { dahua: "Dahua", hikvision: "Hikvision", ezviz: "EZVIZ", imou: "IMOU"}

type = {
  ip: 'IP',
  tvi: 'TVI',
  cvi: 'CVI',
  analogovi: 'Аналогові',
  panavu: 'PanaVu',
  ekshen: 'Екшн'
}

roz_ab = {
  mp_1: "1 МП",
  mp_2: "2 МП",
  mp_3: "3 МП",
  mp_4: "4 МП",
  mp_5: "5 МП",
  mp_6: "6 МП",
  mp_8: "8 МП",
  mp_12: "12 МП",
  mp_16: "16 МП",
  mp_18: "18 МП",
  mp_24: "24 МП"
}

form = {
  bezcorpusni: "Безкорпусні",
  cub: "Куб",
  corpusna_bullet: "Корпусна (bullet)",
  cupolna: "Купольна",
  pid_object: "Під об'єктив"
}

type_object = {
  fixovanuy: "Фіксований",
  var: "Варіофокальний",
  moto: "Моторизований",
  oko: "Риб'яче око",
  bez_object: "Без об'єктиву"
}
light = {
  m_30: "До 30 м",
  m_30_80: "30-80 м",
  m_100_400: "100-400 м",
  m_400_800: "400-800 м"
}
protection = {
  ip_54: "IP54",
  ip_65: "IP65",
  ip_66: "IP66",
  ip_67: "IP67",
  ik_7: "IK7",
  ik_8: "IK8",
  ik_10: "IK10",
  vnutrishni: "Внутрішні"
}
"=============================================================================================================================="
manufacturer.each_with_index do |manufacturer, index|
  manufacturer_option_type_camera.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type.each_with_index do |characteristic, index|
  type_cam_option_type_camera.option_values.find_or_create_by!(
    name: characteristic.first,
    presentation: characteristic.last,
    position: index + 1
  )
end

roz_ab.each_with_index do |specific, index|
  roz_ability_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

form.each_with_index do |color, index|
  form_option_type_camera.option_values.find_or_create_by!(
    name: color.first,
    presentation: color.last,
    position: index + 1
  )
end

type_object.each_with_index do |specific, index|
  object_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

light.each_with_index do |specific, index|
  light_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

protection.each_with_index do |specific, index|
  grade_option_type_camera.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end
"=============================================================================================================================="
manufacturer.each_with_index do |manufacturer, index|
  manufacturer_option_type_ptz.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type.each_with_index do |characteristic, index|
  type_cam_option_type_ptz.option_values.find_or_create_by!(
    name: characteristic.first,
    presentation: characteristic.last,
    position: index + 1
  )
end

roz_ab.each_with_index do |specific, index|
  roz_ability_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

form.each_with_index do |color, index|
  form_option_type_ptz.option_values.find_or_create_by!(
    name: color.first,
    presentation: color.last,
    position: index + 1
  )
end

type_object.each_with_index do |specific, index|
  object_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

light.each_with_index do |specific, index|
  light_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end

protection.each_with_index do |specific, index|
  grade_option_type_ptz.option_values.find_or_create_by!(
    name: specific.first,
    presentation: specific.last,
    position: index + 1
  )
end
p "option type 1"
"=============================================================================================================================="
option_types_attributes_reestrator = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Тип реєстратора',
    presentation: 'Тип реєстратора',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Аналогові канали',
    presentation: 'Аналогові канали',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'ІРС канали',
    presentation: 'ІРС канали',
    position: 4
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Максимальний Запис',
    presentation: 'Максимальний Запис',
    position: 5
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Кількість HDD',
    presentation: 'Кількість HDD',
    position: 6
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id,
    name: 'Аудіо входи',
    presentation: 'Аудіо входи',
    position: 7
  }
]
option_types_attributes_reestrator.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_reestrator = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
type_cam_option_type_camera = Spree::OptionType.find_by!(name: 'Тип реєстратора', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
canal_option_type_reestrator = Spree::OptionType.find_by!(name: 'Аналогові канали', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
ipc_option_type_camera = Spree::OptionType.find_by!(name: 'ІРС канали', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
zapus_option_type_reestrator = Spree::OptionType.find_by!(name: 'Максимальний Запис', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
hdd_option_type_reestrator = Spree::OptionType.find_by!(name: 'Кількість HDD', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)
audio_option_type_reestrator = Spree::OptionType.find_by!(name: 'Аудіо входи', taxon_id: Spree::Taxon.find_by(name: "Реєстратори").id)


manufacturer_reestrator = { dahua: "Dahua", hikvision: "Hikvision"}

type_cam = {
  nvr: 'NVR',
  hdcvi: 'HDCVI',
  turbo: 'TurboHD',
  hd_sdi: 'HD-SDI',
  analogovuy: 'Аналоговий'
}
canal = {
  c_4: '4',
  c_8: '8',
  c_16: '16',
  c_24: '24',
  c_32: '32'
}

ip = {
  c_1: '1',
  c_2: '2',
  c_4: '4',
  c_6: '6',
  c_8: '8',
  c_16: '16',
  c_32: '32',
  c_64: '64',
  c_128: '128',
  c_256: '256'
}

max = {
  mp_4: 'до 4Мп',
  mp_5: 'до 5Мп',
  mp_6: 'до 6Мп',
  mp_8: 'до 8Мп',
  mp_12: 'до 12Мп',
  mp_16: 'до 16Мп'
}

hdd = {
  hdd_1: '1',
  hdd_2: '2',
  hdd_4: '4',
  hdd_8: '8',
  hdd_16: '16',
  hdd_24: '24'
}

audio = {
  audio_1: '1',
  audio_4: '4',
  audio_8: '8',
  audio_16: '16',
  audio_vid: 'Відсутні'
}

manufacturer_reestrator.each_with_index do |manufacturer, index|
  manufacturer_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type_cam.each_with_index do |manufacturer, index|
  type_cam_option_type_camera.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

canal.each_with_index do |manufacturer, index|
  canal_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ip.each_with_index do |manufacturer, index|
  ipc_option_type_camera.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

max.each_with_index do |manufacturer, index|
  zapus_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

hdd.each_with_index do |manufacturer, index|
  hdd_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

audio.each_with_index do |manufacturer, index|
  audio_option_type_reestrator.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 2"
"=============================================================================================================================="
option_types_attributes_cron = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 2
  }
]
option_types_attributes_cron.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_cron = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id)
type_option_type_cron = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Кронштейни").id)

manufacturer_cron = { dahua: "Dahua", hikvision: "Hikvision", zj: "ZJ"}

type_cron = {
  box: 'Розп. Коробки',
  zyvlennja: 'Під блоки живлення',
  stina: 'На стіну',
  stelja: 'На стелю',
  stovp: 'Кріплення на стовп',
  adapt: 'Адаптери',
  cojuh: 'Кожухи',
  vynosni: 'Виносні',
  kytovi: 'Кутові'
}
manufacturer_cron.each_with_index do |manufacturer, index|
  manufacturer_option_type_cron.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type_cron.each_with_index do |manufacturer, index|
  type_option_type_cron.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 3"
"=============================================================================================================================="
option_types_attributes_acum = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id,
    name: 'Ємність',
    presentation: 'Ємність',
    position: 3
  }
]
option_types_attributes_acum.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_acum = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id)
type_option_type_acum = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id)
em_option_type_acum = Spree::OptionType.find_by!(name: 'Ємність', taxon_id: Spree::Taxon.find_by(name: "Накопичувачі").id)

manufacturer_acum = { hikvision: "Hikvision", seagate: "Seagate", w_digital: "Western Digital"}

type_acum = {
  hdd: 'HDD',
  micro: 'microSD'
}
em = {
  gb_16: '16Гб',
  gb_32: '32Гб',
  gb_64: '64Гб',
  t_1: '1Тб',
  t_2: '2Тб',
  t_3: '3Тб',
  t_4: '4Тб ',
  t_6: '6Тб ',
  t_8: '8Тб '
}
manufacturer_acum.each_with_index do |manufacturer, index|
  manufacturer_option_type_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

type_acum.each_with_index do |manufacturer, index|
  type_option_type_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

em.each_with_index do |manufacturer, index|
  em_option_type_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 4"
"=============================================================================================================================="
option_types_attributes_mic = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Зовнішні мікрофони").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  }
]
option_types_attributes_mic.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_mic = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Зовнішні мікрофони").id)

manufacturer_mic = { dahua: "Dahua", hikvision: "Hikvision"}

manufacturer_mic.each_with_index do |manufacturer, index|
  manufacturer_option_type_mic.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 5"
"=============================================================================================================================="
option_types_attributes_pult = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id,
    name: 'Інтерфейси',
    presentation: 'Інтерфейси',
    position: 2
  }
]
option_types_attributes_pult.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_option_type_pult = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id)
type_option_type_pult = Spree::OptionType.find_by!(name: 'Інтерфейси', taxon_id: Spree::Taxon.find_by(name: "Пульти керування").id)

manufacturer_pult = { dahua: "Dahua", hikvision: "Hikvision"}

inter = {
  lan: 'Lan',
  rs: 'RS-485 & RS-232',
  usb: 'USB'
}
manufacturer_pult.each_with_index do |manufacturer, index|
  manufacturer_option_type_pult.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

inter.each_with_index do |manufacturer, index|
  type_option_type_pult.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 6"
"=============================================================================================================================="
"=============================================================================================================================="
vyluchi_paneli_vyrobnuk = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id,
    name: 'К-сть абонентів',
    presentation: 'К-сть абонентів',
    position: 4
  }
]
vyluchi_paneli_vyrobnuk.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

vyl_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)
vyl_pr = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)
vyl_pid = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)
vyl_ab = Spree::OptionType.find_by!(name: 'К-сть абонентів', taxon_id: Spree::Taxon.find_by(name: "Викличні панелі").id)

manufacturer_vyl = { dahua: "Dahua", hikvision: "Hikvision", qualvision: "Qualvision", slinex: "Slinex", arny: "Arny", kocom: "Kocom"}

pr_vyl = {
  v_p: "Виклична панель",
  vid_dz: "Відеодзвінок",
  dz: "Дзвінок"
}
pid_vyl = {
  an: "Аналоговий",
  mez: "Мережевий",
  dr: "2х дротовий"
}
ab_vyl ={
  one: "1",
  two: "2",
  four: "4",
  bag: "багатоквартирні"
}
manufacturer_vyl.each_with_index do |manufacturer, index|
  vyl_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

pr_vyl.each_with_index do |manufacturer, index|
  vyl_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

pid_vyl.each_with_index do |manufacturer, index|
  vyl_pid.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ab_vyl.each_with_index do |manufacturer, index|
  vyl_ab.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 7"
"=============================================================================================================================="
"=============================================================================================================================="
monitory = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Монітори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Монітори").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Монітори").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 3
  }
]
monitory.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

mor_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Монітори").id)
mon_pid = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Монітори").id)
mon_pr = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Монітори").id)

manufacturer_mon = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  qualvision: "Qualvision",
  slinex: "Slinex",
  arny: "Arny",
  kocom: "Kocom"}

pid_mon = {
  an: "Аналоговий",
  mez: "Мережевий",
  dr: "2х дротовий"
}
typ_mon ={
  mon: "Монітор",
  mas: "Майстер станція",
}
manufacturer_mon.each_with_index do |manufacturer, index|
  mor_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

pid_mon.each_with_index do |manufacturer, index|
  mon_pid.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

typ_mon.each_with_index do |manufacturer, index|
  mon_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 8"
"=============================================================================================================================="
"=============================================================================================================================="
pereg_vyrobnuk = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Переговорні пристрої").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  }

]
pereg_vyrobnuk.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

per_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Переговорні пристрої").id)

manufacturer_per = { dahua: "Dahua", hikvision: "Hikvision", qualvision: "Qualvision", slinex: "Slinex", arny: "Arny", kocom: "Kocom"}


manufacturer_per.each_with_index do |manufacturer, index|
  per_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 9"
"=============================================================================================================================="
"=============================================================================================================================="
tp = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  }

]
tp.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

ax_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id)
ax_pid = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Аксесуари").id)


manufacturer_tp = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  qualvision: "Qualvision",
  slinex: "Slinex",
  arny: "Arny",
  kocom: "Kocom"}

tp_p = {
  mod_poz: "Модуль розширення",
  pass: "Passive POE комутатор",
  con: "Конвертер",
  ram: "Рамки для врізного монтажу",
  ram_mon: "Рамки для накладного монтажу",
  cronsh: "Кронштейн",
  sug: "Розподілювач сигналу"
}

manufacturer_tp.each_with_index do |manufacturer, index|
  ax_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_p.each_with_index do |manufacturer, index|
  ax_pid.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 10"
"=============================================================================================================================="
"=============================================================================================================================="
cont = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'К-сть зчитувачів',
    presentation: 'К-сть зчитувачів',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Контролери").id,
    name: 'Інтерфейс зчитувачів',
    presentation: 'Інтерфейс зчитувачів',
    position: 4
  }

]
cont.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

con_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)
con_pr = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)
con_zch = Spree::OptionType.find_by!(name: 'К-сть зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)
con_int = Spree::OptionType.find_by!(name: 'Інтерфейс зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Контролери").id)


manufacturer_con = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  fortnet: "Fortnet",
  prox: "U-Prox",
  orbita: "Orbita",
  satel: "Satel",
  seven: "Seven"
}

tp_con = {
  stn: "Стандартний",
  avt: "Автономний",
  lift: "Для ліфта"
}
kl_con = {
  a: "1",
  b: "2",
  c: "4",
  d: "8",
  i: "16"
}
int_con = {
  rs: "RS485",
  wi: "Wiegand",
  sh: "Шина"
}

manufacturer_con.each_with_index do |manufacturer, index|
  con_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_con.each_with_index do |manufacturer, index|
  con_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end


kl_con.each_with_index do |manufacturer, index|
  con_zch.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

int_con.each_with_index do |manufacturer, index|
  con_int.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 11"
"=============================================================================================================================="
"=============================================================================================================================="
zch = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id,
    name: 'Тип карт',
    presentation: 'Тип карт',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id,
    name: 'Інтерфейс зчитувачів',
    presentation: 'Інтерфейс зчитувачів',
    position: 3
  }

]
zch.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

zch_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id)
zch_tp = Spree::OptionType.find_by!(name: 'Тип карт', taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id)
zch_in = Spree::OptionType.find_by!(name: 'Інтерфейс зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Зчитувачі").id)


manufacturer_zch = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  fortnet: "Fortnet",
  prox: "U-Prox",
  orbita: "Orbita",
  satel: "Satel",
  seven: "Seven"
}

zch_typ = {
  em: "EM Marine",
  mir: "Mifare",
  bl: "Bluetooth"
}
zch_int = {
  rs4: "RS485",
  w: "Wiegand",
  shyn: "Шина"
}

manufacturer_zch.each_with_index do |manufacturer, index|
  zch_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zch_typ.each_with_index do |manufacturer, index|
  zch_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zch_int.each_with_index do |manufacturer, index|
  zch_in.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 12"
"=============================================================================================================================="
"=============================================================================================================================="
tern = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Термінали").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Термінали").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Термінали").id,
    name: 'Інтерфейс зчитувачів',
    presentation: 'Інтерфейс зчитувачів',
    position: 3
  }

]
tern.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

ter_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Термінали").id)
ter_tp = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Термінали").id)
ter_zch = Spree::OptionType.find_by!(name: 'Інтерфейс зчитувачів', taxon_id: Spree::Taxon.find_by(name: "Термінали").id)

manufacturer_ter = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  fortnet: "Fortnet",
  prox: "U-Prox",
  orbita: "Orbita",
  satel: "Satel",
  seven: "Seven"
}

mer_typ = {
  mer: "Мережевий",
  avt: "Автономний"
}

tern_z = {
  rs: "RS485",
  wi: "Wiegand",
  sh: "Шина",
  nm: "Нема"
}

manufacturer_ter.each_with_index do |manufacturer, index|
  ter_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mer_typ.each_with_index do |manufacturer, index|
  ter_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tern_z.each_with_index do |manufacturer, index|
  ter_zch.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 13"
"=============================================================================================================================="
"=============================================================================================================================="
zam = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Замки").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Замки").id,
    name: 'Тип замка',
    presentation: 'Тип замка',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Замки").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 3
  }

]
zam.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

zam_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Замки").id)
zam_tpz = Spree::OptionType.find_by!(name: 'Тип замка', taxon_id: Spree::Taxon.find_by(name: "Замки").id)
zam_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Замки").id)

manufacturer_zam = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  zkteco: "ZKTeco",
  orbita: "Orbita",
  smartlock: "SmartLock",
  ci: "CISA"
}

zam_z = {
  el: "Електромеханічний",
  em: "Електромагнітний"
}
zam_x = {
  zam: "Замок",
  zas: "Защіпка",
  int: "Інт. Замок",
  kr: "Кріплення"
}

manufacturer_zam.each_with_index do |manufacturer, index|
  zam_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zam_z.each_with_index do |manufacturer, index|
  zam_tpz.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

zam_x.each_with_index do |manufacturer, index|
  zam_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 14"
"=============================================================================================================================="
"=============================================================================================================================="
kn = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Кнопки").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Кнопки").id,
    name: 'Тип монтажу',
    presentation: 'Тип монтажу',
    position: 2
  }
]
kn.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

kn_t = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Кнопки").id)
kn_m = Spree::OptionType.find_by!(name: 'Тип монтажу', taxon_id: Spree::Taxon.find_by(name: "Кнопки").id)

kn_tp = {
  kon: "Контактна",
  bezk: "Безконтактна"
}

kn_n = {
  nak: "Накладний",
  vr: "Врізний"
}

kn_tp.each_with_index do |manufacturer, index|
  kn_t.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

kn_n.each_with_index do |manufacturer, index|
  kn_m.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 15"
"=============================================================================================================================="
"=============================================================================================================================="
tyrnic = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id,
    name: 'Комплектуючі',
    presentation: 'Комплектуючі',
    position: 3
  }

]
tyrnic.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

tyrnic_vur = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id)
tyrnic_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id)
tyrnic_com = Spree::OptionType.find_by!(name: 'Комплектуючі', taxon_id: Spree::Taxon.find_by(name: "Турнікети, шлагбауми").id)

manufacturer_tyrnic = {
  zkteco: "ZKTeco",
  gant: "Gant",
  nice: "Nice",
  proteco: "Proteco",
  roger: "Roger"
}

tp_tyrnic = {
  tyr: "Турнікет",
  sl: "Шлагбаум",
  av: "Автоматика на ворота"
}
comp_tyrnic = {
  pr: "Привід",
  ich: "ІЧ бар’єр",
  sp: "Лампа спалах",
  ker: "Керування",
  st: "Стріла",
  re: "Рейка"
}

manufacturer_tyrnic.each_with_index do |manufacturer, index|
  tyrnic_vur.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_tyrnic.each_with_index do |manufacturer, index|
  tyrnic_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

comp_tyrnic.each_with_index do |manufacturer, index|
  tyrnic_com.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 16"
"=============================================================================================================================="
dot = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id,
    name: 'Вага дотягування',
    presentation: 'Вага дотягування',
    position: 2
  }
]
dot.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_dot = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id)
dot_vag = Spree::OptionType.find_by!(name: 'Вага дотягування', taxon_id: Spree::Taxon.find_by(name: "Дотягувачі").id)

dot_manufacturer = {
  ry: "RYOBI",
  ci: "CISA"
}

dot_v = {
  v_65: 'До 65 кг',
  v_80: 'До 80 кг',
  d_100: 'До 100 кг'
}
dot_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_dot.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

dot_v.each_with_index do |manufacturer, index|
  dot_vag.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 17"
"=============================================================================================================================="
kart_brel = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id,
    name: 'Тип',
    presentation: 'Тип',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id,
    name: 'Протокол',
    presentation: 'Протокол',
    position: 2
  }
]
kart_brel.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

cart_tp = Spree::OptionType.find_by!(name: 'Тип', taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id)
cart_pr = Spree::OptionType.find_by!(name: 'Протокол', taxon_id: Spree::Taxon.find_by(name: "Карти, брелоки").id)

cart_t = {
  car: "Карта",
  br: "Брелок",
  klch: "Ключ"
}

car_m = {
  em: 'EM Marine',
  mr: 'Mifare',
  ib: 'iButton',
  bl: 'Bluetooth'
}
cart_t.each_with_index do |manufacturer, index|
  cart_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

car_m.each_with_index do |manufacturer, index|
  cart_pr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 18"
"=============================================================================================================================="
com = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Кіл-сть портів',
    presentation: 'Кіл-сть портів',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Порти POE',
    presentation: 'Порти POE',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Комутатори").id,
    name: 'Порти SFP',
    presentation: 'Порти SFP',
    position: 4
  }
]
com.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_com = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)
com_port = Spree::OptionType.find_by!(name: 'Кіл-сть портів', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)
com_poe = Spree::OptionType.find_by!(name: 'Порти POE', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)
com_pfs = Spree::OptionType.find_by!(name: 'Порти SFP', taxon_id: Spree::Taxon.find_by(name: "Комутатори").id)

com_manufacturer = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  micro: "MikroTik",
  ut: "UTEPO"
}

com_v = {
  v_5: '5-8',
  v_9: '9-14',
  v_18: '18-20',
  v_25: "25-36"
}
port_poe ={
  poe_4: "4",
  poe_8: "8",
  poe_16: "16",
  poe_24: "24",
  poe_0: "нема"
}
port_sfp ={
  s_1: "1",
  s_2: "2",
  s_4: "4",
  s_10: "10",
  s_16: "16",
  s_24:"24",
  s_0: "нема"
}

com_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_com.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

com_v.each_with_index do |manufacturer, index|
  com_port.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

port_poe.each_with_index do |manufacturer, index|
  com_poe.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

port_sfp.each_with_index do |manufacturer, index|
  com_pfs.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 19"
"=============================================================================================================================="
mar = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Кіл-сть портів',
    presentation: 'Кіл-сть портів',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Порти POE',
    presentation: 'Порти POE',
    position: 3
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id,
    name: 'Порти SFP',
    presentation: 'Порти SFP',
    position: 4
  }
]
mar.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_mar = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)
mar_port = Spree::OptionType.find_by!(name: 'Кіл-сть портів', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)
mar_poe_port = Spree::OptionType.find_by!(name: 'Порти POE', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)
mar_pfs = Spree::OptionType.find_by!(name: 'Порти SFP', taxon_id: Spree::Taxon.find_by(name: "Маршрутизатори").id)

mar_manufacturer = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  micro: "MikroTik",
  ut: "UTEPO",
  link: "TP-Link"
}

mar_v = {
  v_5: '5-8',
  v_9: '9-14',
  v_18: '18-20',
  v_25: "25-36"
}
mar_poe ={
  poe_4: "4",
  poe_8: "8",
  poe_16: "16",
  poe_24: "24",
  poe_0: "нема"
}
mar_sfp ={
  s_1: "1",
  s_2: "2",
  s_4: "4",
  s_10: "10",
  s_16: "16",
  s_24:"24",
  s_0: "нема"
}

mar_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_mar.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mar_v.each_with_index do |manufacturer, index|
  mar_port.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mar_poe.each_with_index do |manufacturer, index|
  mar_poe_port.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

mar_sfp.each_with_index do |manufacturer, index|
  mar_pfs.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end
p "option type 20"
"=============================================================================================================================="
inz = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  }
]
inz.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_inz = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id)
inz_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Інжектори, медіаконвертери").id)

inz_manufacturer = {
  dahua: "Dahua",
  ut: "UTEPO"
}

tp_inz = {
  inzec: 'Інжектор',
  med: 'Медіаконвертер',
  roz: 'Розгалужувач'
}

inz_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_inz.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_inz.each_with_index do |manufacturer, index|
  inz_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 21"
"=============================================================================================================================="
sygnal = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id,
    name: 'Тип пристрою',
    presentation: 'Тип пристрою',
    position: 2
  }
]
sygnal.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_sygnal = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id)
sygnal_tp = Spree::OptionType.find_by!(name: 'Тип пристрою', taxon_id: Spree::Taxon.find_by(name: "Передача сигналу").id)

sygnal_manufacturer = {
  dahua: "Dahua",
  hikvision: "Hikvision",
  mic: "MikroTik",
  ut: "UTEPO"
}

tp_sygnal = {
  conv: 'Конвертер',
  mod: 'SFP модуль'
}

sygnal_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_sygnal.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_sygnal.each_with_index do |manufacturer, index|
  sygnal_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 22"
"=============================================================================================================================="
ppk = [
  {
    taxon_id: Spree::Taxon.find_by(name: "ППК").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "ППК").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "ППК").id,
    name: 'Елементи ППК',
    presentation: 'Елементи ППК',
    position: 3
  }
]
ppk.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_ppk = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "ППК").id)
ppk_typ = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "ППК").id)
ppk_el = Spree::OptionType.find_by!(name: 'Елементи ППК', taxon_id: Spree::Taxon.find_by(name: "ППК").id)

ppk_manufacturer = {
  satel: "Satel",
  hikvision: "Hikvision",
  max: "Maks",
  ajax: "Ajax",
  jablotron: "Jablotron",
  orion: "Оріон",
  tipas: "Тірас"
}

ppk_tp = {
  drot: 'Дротовий',
  bez: 'Бездротовий'
}

ppk_el_pp ={
  com: "Комплект",
  box: "Бокс",
  plata: "Головна плата",
  clav: "Клавіатура",
  roz: "Розширювачі"
}

ppk_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_ppk.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ppk_tp.each_with_index do |manufacturer, index|
  ppk_typ.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ppk_el_pp.each_with_index do |manufacturer, index|
  ppk_el.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 23"

"=============================================================================================================================="
sp = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id,
    name: 'Тип підключення',
    presentation: 'Тип підключення',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id,
    name: 'Тип сповіщувача',
    presentation: 'Тип сповіщувача',
    position: 3
  }
]
sp.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_sp = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id)
sp_typ = Spree::OptionType.find_by!(name: 'Тип підключення', taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id)
sp_el = Spree::OptionType.find_by!(name: 'Тип сповіщувача', taxon_id: Spree::Taxon.find_by(name: "Сповіщувачі").id)

sp_manufacturer = {
  satel: "Satel",
  hikvision: "Hikvision",
  max: "Maks",
  ajax: "Ajax",
  jablotron: "Jablotron",
  orion: "Оріон",
  tipas: "Тірас"
}

sp_tp = {
  drot: 'Дротовий',
  bez: 'Бездротовий'
}

sp_el_pp ={
  ryx: "Рух",
  ryxsh: "Рух (штора)",
  roz: "Розбиття",
  comb: "Комбінований",
  mag: "Магнітоконтакт",
  vib: "Вібро",
  ich: "ІЧ бар’єр",
  zatop: "Затоплення",
  pozez: "Пожежний"
}

sp_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_sp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

sp_tp.each_with_index do |manufacturer, index|
  sp_typ.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

sp_el_pp.each_with_index do |manufacturer, index|
  sp_el.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 24"
"=============================================================================================================================="
sr = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Сирени").id,
    name: 'Виробник',
    presentation: 'Виробник',
    position: 1
  }
]
sr.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_sr = Spree::OptionType.find_by!(name: 'Виробник', taxon_id: Spree::Taxon.find_by(name: "Сирени").id)

sr_manufacturer = {
  satel: "Satel",
  hikvision: "Hikvision",
  max: "Maks",
  ajax: "Ajax",
  jablotron: "Jablotron",
  orion: "Оріон",
  tipas: "Тірас"
}

sr_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_sr.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 25"
"=============================================================================================================================="
cabel = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Кабель").id,
    name: 'Тип кабелю',
    presentation: 'Тип кабелю',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Кабель").id,
    name: 'Екран',
    presentation: 'Екран',
    position: 2
  }
]
cabel.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_cabel = Spree::OptionType.find_by!(name: 'Тип кабелю', taxon_id: Spree::Taxon.find_by(name: "Кабель").id)
ekran_cabel = Spree::OptionType.find_by!(name: 'Екран', taxon_id: Spree::Taxon.find_by(name: "Кабель").id)

cabel_manufacturer = {
  cat: "CAT5E",
  sug: "Сигнальний",
  el: "Електричний",
  vg: "VGA",
  hd: "HDMI"
}
ek = {
  tac: "Так",
  ni: "Ні"
}

cabel_manufacturer.each_with_index do |manufacturer, index|
  manufacturer_cabel.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

ek.each_with_index do |manufacturer, index|
  ekran_cabel.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 26"
"=============================================================================================================================="
block = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id,
    name: 'Підтримка АКБ',
    presentation: 'Підтримка АКБ',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id,
    name: 'Струм А',
    presentation: 'Струм А',
    position: 2
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id,
    name: 'Тип живлення',
    presentation: 'Тип живлення',
    position: 3
  }
]
block.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_block = Spree::OptionType.find_by!(name: 'Підтримка АКБ', taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id)
ekran_block = Spree::OptionType.find_by!(name: 'Струм А', taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id)
block_tp = Spree::OptionType.find_by!(name: 'Тип живлення', taxon_id: Spree::Taxon.find_by(name: "Блоки живлення").id)

pid = {
  tac: "Так",
  ni: "Ні"
}

s_numb = {
  s_1: "1",
  s_3: "3",
  s_5: "5",
  s_10: "10",
  s_15: "15",
  s_20: "20"
}
acd = {
  ac: "АС",
  dc: "DC"
}

pid.each_with_index do |manufacturer, index|
  manufacturer_block.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

s_numb.each_with_index do |manufacturer, index|
  ekran_block.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

acd.each_with_index do |manufacturer, index|
  block_tp.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 27"
"=============================================================================================================================="
acum = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Акумулятори").id,
    name: 'Ємність',
    presentation: 'Ємність',
    position: 1
  }
]
acum.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_acum = Spree::OptionType.find_by!(name: 'Ємність', taxon_id: Spree::Taxon.find_by(name: "Акумулятори").id)

acum_num = {
  a_1: "1 а/г",
  a_2: "2,2 а/г",
  a_4: "4,5 а/г",
  a_7: "7 а/г",
  a_18: "18 а/г"
}

acum_num.each_with_index do |manufacturer, index|
  manufacturer_acum.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 28"
"=============================================================================================================================="
roz_syg = [
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id,
    name: 'Тип передачі',
    presentation: 'Тип передачі',
    position: 1
  },
  {
    taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id,
    name: 'Тип перетворення',
    presentation: 'Тип перетворення',
    position: 2
  }
]
roz_syg.each do |attrs|
  Spree::OptionType.where(attrs).first_or_create!
end

manufacturer_roz_syg = Spree::OptionType.find_by!(name: 'Тип передачі', taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id)
roz_syg_typ = Spree::OptionType.find_by!(name: 'Тип перетворення', taxon_id: Spree::Taxon.find_by(name: "Передача, перетворення, розгалуження сигналу").id)

roz_syg_num = {
  tvi: "TVI, CVI по UTP",
  vga: "VGA по UTP",
  hd: "HDMI по UTP",
  us: "USB по UTP",
  lan: "LAN по Coaxial"
}

tp_roz = {
  cv: "CVBS-VGA",
  hdm: "HDMI-VGA",
  vga: "VGA-HDMI",
  vgac: "VGA-CVBS",
  hdmi: "HDMI 1-2",
  hdm1: "HDMI 1-4",
  hdmi8: "HDMI 1-8"
}

roz_syg_num.each_with_index do |manufacturer, index|
  manufacturer_roz_syg.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

tp_roz.each_with_index do |manufacturer, index|
  roz_syg_typ.option_values.find_or_create_by!(
    name: manufacturer.first,
    presentation: manufacturer.last,
    position: index + 1
  )
end

p "option type 29"

Spree::Product.all.each do |prod|
  prod.classifications.create!(taxon_id: Spree::Taxon.find(1).id, product_id: prod.id)
    end
p "product"
Spree::Taxonomy.find_by(name: "Відеоспостереження").update!(position: 1)
Spree::Taxonomy.find_by(name: "Охоронна сигналізація").update!(position:2)
Spree::Taxonomy.find_by(name: "Домофони").update!(position:3)
Spree::Taxonomy.find_by(name: "Контроль доступу").update!(position:4)
Spree::Taxonomy.find_by(name: "Мережеве обладнання").update!(position:5)
Spree::Taxonomy.find_by(name: "Додаткове обладнання").update!(position:6)
Spree::Taxonomy.all.each{|c|c.root.update!(position: c.position)}
p "position"
