import json
import requests
import psycopg2
import psycopg2.extras
import os
def write_JSON(name, data, path): #writes a json object to file
	with open(path+name, 'w') as outfile:
		json.dump(data, outfile, indent=4, ensure_ascii = False)

def connect():
	#parameter format for local use
	params = {
	'dbname':'hmdamaster',
	'user':'roellk',
	'password':'',
	'host':'localhost',
	}
	try:
		conn = psycopg2.connect(**params)
		print "i'm connected"
	except psycopg2.Error as e: #if database connection results in an error print the following
		print "I am unable to connect to the database: ", e
	return conn.cursor(cursor_factory=psycopg2.extras.DictCursor) #return a dictionary cursor object

def get_age(state, county, tract):
	try:
		try:
			with open('/Users/roellk/Documents/api_key.txt', 'r') as f:
				key = f.read()

			api_key = key.strip("'")
			field = 'B25035_001E'
		except:
			print "Error loading API key from file"
		#documentation on ACS 5 year is here: http://www.census.gov/data/developers/data-sets/acs-survey-5-year-data.html
		#the 2013 A&D reports use the ACS 2010 API
		r = requests.get('http://api.census.gov/data/2010/acs5?get=NAME,'+field+'&for=tract:'+tract+'&in=state:'+state+'+county:'+county+'&key='+api_key)
		median_list =  r.text
		return_list = median_list.split(',')
		return return_list[8]
	except:
		print "Unable to connect to Census API"

def median_tract_age(cur):
	tract_string = "SELECT DISTINCT(tract) FROM tract_to_cbsa_2010"
	cur.execute(tract_string,)
	tract_age_list = cur.fetchall()
	tract_ages = {}

	if len(tract_age_list) > 0:
		for i in range (0, len(tract_age_list)):
			state = tract_age_list[i][0][0:2]
			county = tract_age_list[i][0][2:5]
			tract = tract_age_list[i][0][5:]
			age = get_age(state,county,tract)

			print tract_age_list[i][0], age
			#print age.strip('"')
			try:
				if age is not None:
					tract_ages[tract_age_list[i][0]] = age.strip('"')
			except:
				write_JSON("tract_housing_ages.json", tract_ages, '/Users/roellk/Desktop/HMDA/data/')#/Users/roellk/Desktop/HMDA
	write_JSON("tract_housing_ages.json", tract_ages, '/Users/roellk/Desktop/HMDA/data/')#/Users/roellk/Desktop/HMDA

median_tract_age(connect())

