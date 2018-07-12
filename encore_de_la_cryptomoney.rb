require 'nokogiri'
require'rest-client'

#méthode qui contient le scrapping et les tableaux

def crytomoney_scrap
#Bon on commence par récupérer les infos sur la page cible:
	page = Nokogiri::HTML(rest-client.get('https://coinmarketcap.com/all/views/all/'))

#On crée un array pour ranger les noms ( car après je risque d'oublier)
		money_name =[]

=begin 
On scrap les noms en uttilisant le .css de la page ( presque comme l'exo précédent)
Là tous les noms sont dans une même class donc on a juste la repéré grâce à magique F12.
=end 

			page.css('a.currency-name-container.link-secondary').each do |name_of_each_money|

#on leur demande d'aller dans l'array précédament créé en temps que chaines carractères:

				money_name << name_of_each_money.text

			end
#On recommence avec leurs valeurs (création array, on scrap et on range) La class se nomme price c'est cool!
		money_value =[]
			page.css('a.price').each do |value_of_each_money|
				money_value << value_of_each_money.text
			end
#On fusionne les deux arrays dans un hash

hash_moneys_values = Hash[money_name.zip(money_value)]

		crypto_hash.each do |a,b|
		  puts "La cryptomoney #{a} s'achète pour #{b} $."
		end
end

crytomoney_scrap

#Je n'ai pas réussi à faire la boucle qui revient toutes les heures...

