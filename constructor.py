import json
import os
import csv
import psycopg2
import psycopg2.extras
from collections import OrderedDict
#import the parse_inputs class to store the 'inputs' dictionary
from A_D_library import parse_inputs as parse
from A_D_library import connect_DB as connect
from A_D_library import build_JSON as build
from A_D_library import aggregate as agg
from A_D_library import queries
from A_D_library import report_selector as selector

class constructor(object):
	pass

class report_4x(constructor):
	def __init__(self, report, selector):
		self.year = selector.report_list['year'][1]
		self.parsed = parse() #for parsing inputs from rows
		self.connection = connect() #connects to the DB
		self.queries = queries() #query text for all tables
		self.agg = agg() #aggregation functions for all tables
		self.json_builder = self.JSON_constructor_return(report)
		self.parse_function = self.parse_return(report)
		self.query_string = self.query_return(self.year, report)
		self.aggregation = self.aggregation_return(self.year, report)
		self.count_string = self.count_return(self.year, report)
		self.report_number = report

	def report_x(self, MSA, cur):
		table_number = self.report_number[2:]
		if self.report_number[0] == 'A':
			report_type = 'Aggregate'
		elif self.report_number[0] == 'D':
			report_type = 'Disclosure'
		elif self.report_number[0] == 'N':
			report_type = 'National'

		#cur = self.connection.connect() #creates cursor object connected to HMDAPub2012 sql database, locally hosted postgres

		#for MSA in selector.report_list[report_number]: #take this loop out
		build_X = build()
		build_X.set_msa_names(cur) #builds a list of msa names as a dictionary
		location = (MSA,) #pass the MSA nubmers as a tuple to Psycopg2 (doesn't take singletons)

		SQL = getattr(self.queries, self.count_string)()
		cur.execute(SQL, location)
		count = int(cur.fetchone()[0])

		if count > 0:
			print count, 'LAR rows in MSA %s, for report %s, in %s' %(MSA, self.report_number, self.year)

			SQL = getattr(self.queries, self.query_string)()
			cur.execute(SQL, location)

			for num in range(0, count):
				row = cur.fetchone()
				getattr(self.parsed, self.parse_function)(row)
				if num == 0:
					build_X.set_header(self.parsed.inputs, MSA, report_type, table_number)
					table_X = getattr(build_X, self.json_builder)()

				#this line needs generalization
				getattr(self.agg, self.aggregation)(table_X, self.parsed.inputs)

			path = "json" + "/" +table_X['type']+"/"+table_X['year']+"/"+build_X.get_state_name(table_X['msa']['state']).replace(' ', '-').lower()+"/"+build_X.msa_names[MSA].replace(' ', '-').lower()+"/"+table_X['table']
			if not os.path.exists(path): #check if path exists
				os.makedirs(path) #if path not present, create it
			build_X.write_JSON(table_X['table']+'.json', table_X, path)
			#use an if exists check for jekyll files
			build_X.jekyll_for_report(path) #create and write jekyll file to report path
			#year in the path is determined by the asofdate in the LAR entry
			path2 = "json"+"/"+table_X['type']+"/"+table_X['year']+"/"+build_X.get_state_name(table_X['msa']['state']).replace(' ', '-').lower()+"/"+build_X.msa_names[MSA].replace(' ', '-').lower() #set path for writing the jekyll file to the msa directory
			build_X.jekyll_for_msa(path2) #create and write jekyll file to the msa path


	def aggregation_return(self, year, report_number):
		if report_number == 'A 3-1':
			return 'build_report_31'
		elif report_number == 'A 3-2':
			return 'build_report_32'
		elif report_number[:3] == 'A 4':
			return 'build_report4x'

	def JSON_constructor_return(self, report_number):
		if report_number == 'A 3-1':
			return 'table_31_builder'
		elif report_number == 'A 3-2':
			return 'table_32_builder'
		elif report_number[:3] == 'A 4':
			return 'table_4x_builder'

	def parse_return(self, report_number):
		if report_number == 'A 3-1':
			return 'parse_t31'
		elif report_number == 'A 3-2':
			return 'parse_t32'
		elif report_number[:3] == 'A 4':
			return 'parse_t4x'

	def query_return(self, year, report_number):
		if year == '2013':
			if report_number == 'A 3-1':
				return 'table_3_1_2013'
			elif report_number == 'A 3-2':
				return 'table_3_2_2013'
			elif report_number == 'A 4-1':
				return 'table_4_1_2013'
			elif report_number == 'A 4-2':
				return 'table_4_2_2013'
			elif report_number == 'A 4-3':
				return 'table_4_3_2013'
			elif report_number == 'A 4-4':
				return 'table_4_4_2013'
			elif report_number == 'A 4-5':
				return 'table_4_5_2013'
			elif report_number == 'A 4-6':
				return 'table_4_6_2013'
			elif report_number == 'A 4-7':
				return 'table_4_7_2013'
		elif year == '2012':
			if report_number == 'A 3-1':
				return 'table_3_1_2012'
			elif report_number == 'A 3-2':
				return 'table_3_2_2012'
			elif report_number == 'A 4-1':
				return 'table_4_1_2012'
			elif report_number == 'A 4-2':
				return 'table_4_2_2012'
			elif report_number == 'A 4-3':
				return 'table_4_3_2012'
			elif report_number == 'A 4-4':
				return 'table_4_4_2012'
			elif report_number == 'A 4-5':
				return 'table_4_5_2012'
			elif report_number == 'A 4-6':
				return 'table_4_6_2012'
			elif report_number == 'A 4-7':
				return 'table_4_7_2012'

	def count_return(self, year, report_number):
		if year == '2013':
			if report_number == 'A 3-1':
				return 'count_rows_2013'
			elif report_number == 'A 3-2':
				return 'count_rows_2013'
			elif report_number == 'A 4-1':
				return 'count_rows_41_2013'
			elif report_number == 'A 4-2':
				return 'count_rows_42_2013'
			elif report_number == 'A 4-3':
				return 'count_rows_43_2013'
			elif report_number == 'A 4-4':
				return 'count_rows_44_2013'
			elif report_number == 'A 4-5':
				return 'count_rows_45_2013'
			elif report_number == 'A 4-6':
				return 'count_rows_46_2013'
			elif report_number == 'A 4-7':
				return 'count_rows_47_2013'
		elif year == '2012':
			if report_number == 'A 3-1':
				return 'count_rows_2012'
			elif report_number == 'A 3-2':
				return 'count_rows_2012'
			elif report_number == 'A 4-1':
				return 'count_rows_41_2012'
			elif report_number == 'A 4-2':
				return 'count_rows_42_2012'
			elif report_number == 'A 4-3':
				return 'count_rows_43_2012'
			elif report_number == 'A 4-4':
				return 'count_rows_44_2012'
			elif report_number == 'A 4-5':
				return 'count_rows_45_2012'
			elif report_number == 'A 4-6':
				return 'count_rows_46_2012'
			elif report_number == 'A 4-7':
				return 'count_rows_47_2012'

