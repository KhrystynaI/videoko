class StateTranslate < SpreeExtension::Migration[4.2]
  def change
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Vinnyts'ka Oblast'").translation.update!(locale: "uk",name: "Вінницька")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Vinnyts'ka Oblast'").translation.update!(locale: "ru",name: "Винницкая")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Volyns'ka Oblast'").translation.update!(locale: "uk",name: "Волинська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Volyns'ka Oblast'").translation.update!(locale: "ru",name: "Волынская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Luhans'ka Oblast'").translation.update!(locale: "uk",name: "Луганська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Luhans'ka Oblast'").translation.update!(locale: "ru",name: "Луганская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Dnipropetrovs'ka Oblast'").translation.update!(locale: "uk",name: "Дніпропетровська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Dnipropetrovs'ka Oblast'").translation.update!(locale: "ru",name: "Днепропетровская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Donets'ka Oblast'").translation.update!(locale: "uk",name: "Донецька")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Donets'ka Oblast'").translation.update!(locale: "ru",name: "Донецкая")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zhytomyrs'ka Oblast'").translation.update!(locale: "uk",name: "Житомирська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zhytomyrs'ka Oblast'").translation.update!(locale: "ru",name: "Житомирская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zakarpats'ka Oblast'").translation.update!(locale: "uk",name: "Закарпатська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zakarpats'ka Oblast'").translation.update!(locale: "ru",name: "Закарпатская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zaporiz'ka Oblast'").translation.update!(locale: "uk",name: "Запорізька")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Zaporiz'ka Oblast'").translation.update!(locale: "ru",name: "Запорожская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ivano-Frankivs'ka Oblast'").translation.update!(locale: "uk",name: "Івано-Франківська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ivano-Frankivs'ka Oblast'").translation.update!(locale: "ru",name: "Ивано-Франковская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka mis'ka rada").translation.update!(locale: "uk",name: "м.Київ")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka mis'ka rada").translation.update!(locale: "ru",name: "г.Киев")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka Oblast'").translation.update!(locale: "uk",name: "Київська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kyïvs'ka Oblast'").translation.update!(locale: "ru",name: "Киевская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kirovohrads'ka Oblast'").translation.update!(locale: "uk",name: "Кіровоградська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kirovohrads'ka Oblast'").translation.update!(locale: "ru",name: "Кировоградская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sevastopol").translation.update!(locale: "uk",name: "м.Севастополь")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sevastopol").translation.update!(locale: "ru",name: "г.Севастополь")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Respublika Krym").translation.update!(locale: "uk",name: "Автономна Республіка Крим")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Respublika Krym").translation.update!(locale: "ru",name: "АР Крым")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "L'vivs'ka Oblast'").translation.update!(locale: "uk",name: "Львівська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "L'vivs'ka Oblast'").translation.update!(locale: "ru",name: "Львовская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Mykolaïvs'ka Oblast'").translation.update!(locale: "uk",name: "Миколаївська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Mykolaïvs'ka Oblast'").translation.update!(locale: "ru",name: "Николаевская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Odes'ka Oblast'").translation.update!(locale: "uk",name: "Одеська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Odes'ka Oblast'").translation.update!(locale: "ru",name: "Одесская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Poltavs'ka Oblast'").translation.update!(locale: "uk",name: "Полтавська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Poltavs'ka Oblast'").translation.update!(locale: "ru",name: "Полтавская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Rivnens'ka Oblast'").translation.update!(locale: "uk",name: "Рівненська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Rivnens'ka Oblast'").translation.update!(locale: "ru",name: "Ровенская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sums 'ka Oblast'").translation.update!(locale: "uk",name: "Сумська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Sums 'ka Oblast'").translation.update!(locale: "ru",name: "Сумская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ternopil's'ka Oblast'").translation.update!(locale: "uk",name: "Тернопільська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Ternopil's'ka Oblast'").translation.update!(locale: "ru",name: "Тернопольская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kharkivs'ka Oblast'").translation.update!(locale: "uk",name: "Харківська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Kharkivs'ka Oblast'").translation.update!(locale: "ru",name: "Харьковская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khersons'ka Oblast'").translation.update!(locale: "uk",name: "Херсонська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khersons'ka Oblast'").translation.update!(locale: "ru",name: "Херсонская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khmel'nyts'ka Oblast'").translation.update!(locale: "uk",name: "Хмельницька")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Khmel'nyts'ka Oblast'").translation.update!(locale: "ru",name: "Хмельницкая")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Cherkas'ka Oblast'").translation.update!(locale: "uk",name: "Черкаська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Cherkas'ka Oblast'").translation.update!(locale: "ru",name: "Черкасская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernihivs'ka Oblast'").translation.update!(locale: "uk",name: "Чернігівська")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernihivs'ka Oblast'").translation.update!(locale: "ru",name: "Черниговская")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernivets'ka Oblast'").translation.update!(locale: "uk",name: "Чернівецька")
    Spree::Country.find(Spree::Config[:default_country_id]).states.find_by(name: "Chernivets'ka Oblast'").translation.update!(locale: "ru",name: "Черновицкая")
  end
end
