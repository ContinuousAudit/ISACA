import shodan

SHODAN_API_KEY = "YOUR API KEY IN THESE QUOTES"

api = shodan.Shodan(SHODAN_API_KEY)

try:
	#Search\Monitor Item
	results = api.search('whatever you want')

	#Gather Info
	for result in results['matches']
		print '%s' % result['ip_str']

import csv
