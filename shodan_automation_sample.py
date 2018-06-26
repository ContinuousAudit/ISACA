# This is where the resulting file will be saved.
File = open('C:\Python27\Shodan_Results.csv', 'w')
resultList = []

import shodan

#Sway this item with your Shodan API key.
SHODAN_API_KEY = "Your_API_KEY"

api = shodan.Shodan(SHODAN_API_KEY)

try:
    # Search\Monitor Item - Fun fact, you should get no results. But if you remove the port item you'll get about 34 results.
    results = api.search('os:"XP", city:"Tallahassee", port:"3389"')

    # Gather Info - Only IP Addresses returned in this version. Other data can be called if wanted.
    for result in results['matches']:
        resultList.append(result['ip_str'])

except shodan.APIError, e:
    print 'Error: %s' % e

for item in resultList:
  File.write("%s\n" % item)
