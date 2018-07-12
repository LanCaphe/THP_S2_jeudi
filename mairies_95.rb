require 'Nokogiri'
require 'rest-client'

=begin
Création d'une méthode qui récupère l'adresse mail d'une seule mairie à
partir de l'url de la fiche d'une mairie issus d'un annuaire 
=end

def get_the_email_of_a_townhal_from_its_webpage(url_townhal)

# On demande a Nokogiri d'ouvrir la page où récupéré des infos
		page_cible = Nokogiri::HTML(rest-client.get(url_townhal))  
#On demande de scrapper  une info de la page ici,le mail
		email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text  
end

=begin
Pour récupérer, les mails de toutes les mairies de 95, on va récupérer l'url de chaque pages des mairies 
du 95 de ce même annuaire en ligne.	
=end

def get_all_the_urls_of_townhalls_95

# On va d'abord positionner Nokogiri sur la page qui concentre les urls de toutes les mairies du 95
	page = Nokogiri::HTML(rest-client.get("http://annuaire-des-mairies.com/val-d-oise.html"))
# On demande (gentillement )de scapper les urls des pages des mairies grace au css. On les range dans un hash.
		page.css(".lientxt").each do |lien|
			
			url = "http://annuaire-des-mairies.com" + lien["href"][1..-1]
				#nom de la ville
				town = lien.text
				# l'adresse mail de la mairie grace à la premiere méthode qu'on a créé
				email = get_the_email_of_a_townhal_from_its_webpage(url_townhal)
				# Le hash s'il veux bien fonctionner car je détesteeeeeee les hash
				hash_town_and_email = {:name => town, :email => email}
		puts hash_town_and_email
	end

end


# On lance le tout ensemble dans une méthode:

def perform
	puts get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")
	puts get_all_the_urls_of_townhalls_95
end

perform

