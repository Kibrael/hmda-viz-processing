--------
-- SUBJECT:  HMDA A&D DATA LOAD
-- DESCRIPTION:  SQL SCRIPT TO CREATE DATA TABLES AND LOAD (1) 2009-2013 LAR DATA

-- DATE:  1/25/2015
-- BY:  David Roell, adapted from work by PAUL SALASZNYK
--------

--------
-- PRE-REQUISITES:  Transfer the following files to your local machine (from HMDA Pilot Google Drive)
--------
-- (1) Data -> 2010-2013 HMDA Data:
	 HMDAPub2009.txt
	 HMDAPub2010.txt
	 HMDAPub2011.txt
	 HMDAPub2012.txt
	 HMDAPub2013.txt


--------
-- STEP 1:  Search for “/users/roellk/desktop/HMDA/data2/“ in this code and replace with path where you saved the data files listed above

--------
-- STEP 2:  Run the code below in PGAdmin
--------
--------
—— CREATE 2009 through 2013 HMDA LAR DATA TABLES with Census/HUD data
--------


CREATE TABLE HMDApub2009
(
	AsOfDate varchar(4),
	RespondentID varchar(10),
	RespondentName varchar(60),
	AgencyCode varchar(1),
	LoanType varchar(1),
	PropertyType varchar(1),
	LoanPurpose varchar(1),
	Occupancy varchar(1),
	LoanAmount varchar(8),
	PreApproval varchar(1),
	ActionType varchar(1),
	MSAOfProperty varchar(5),
	StateCode varchar(2),
	StateName varchar(2),
	CountyCode varchar(3),
	CountyName varchar(50),
	CensusTractNumber varchar(7),
	ApplicantEthnicity varchar(1),
	CoApplicantEthnicity varchar(1),
	ApplicantRace1 varchar(1),
	ApplicantRace2 varchar(1),
	ApplicantRace3 varchar(1),
	ApplicantRace4 varchar(1),
	ApplicantRace5 varchar(1),
	CoApplicantRace1 varchar(1),
	CoApplicantRace2 varchar(1),
	CoApplicantRace3 varchar(1),
	CoApplicantRace4 varchar(1),
	CoApplicantRace5 varchar(1),
	ApplicantSex varchar(1),
	CoApplicantSex varchar(1),
	ApplicantIncome varchar(4),
	PurchaserType varchar(1),
	DenialReason1 varchar(1),
	DenialReason2 varchar(1),
	DenialReason3 varchar(1),
	RateSpread varchar(5),
	HOEPAStatus varchar(1),
	LienStatus varchar(1),
	AreaPopulation varchar(10),
	MinorityPopulationPct varchar(6),
	HUD_Median_Family_Income varchar(8),
	Tract_to_MSA_MD_Income varchar(6),
	Num_of_Owner_occupied_units varchar(8),
	Num_of_1_to_4_Family_units varchar(8),
	Application_Date_Indicator varchar(1),
	FipsCode varchar(12),
	Latitude decimal(18,8),
	Longitude decimal(18,8)
);



CREATE TABLE HMDApub2010
(
	AsOfDate varchar(4),
	RespondentID varchar(10),
	RespondentName varchar(60),
	AgencyCode varchar(1),
	LoanType varchar(1),
	PropertyType varchar(1),
	LoanPurpose varchar(1),
	Occupancy varchar(1),
	LoanAmount varchar(8),
	PreApproval varchar(1),
	ActionType varchar(1),
	MSAOfProperty varchar(5),
	StateCode varchar(2),
	StateName varchar(2),
	CountyCode varchar(3),
	CountyName varchar(50),
	CensusTractNumber varchar(7),
	ApplicantEthnicity varchar(1),
	CoApplicantEthnicity varchar(1),
	ApplicantRace1 varchar(1),
	ApplicantRace2 varchar(1),
	ApplicantRace3 varchar(1),
	ApplicantRace4 varchar(1),
	ApplicantRace5 varchar(1),
	CoApplicantRace1 varchar(1),
	CoApplicantRace2 varchar(1),
	CoApplicantRace3 varchar(1),
	CoApplicantRace4 varchar(1),
	CoApplicantRace5 varchar(1),
	ApplicantSex varchar(1),
	CoApplicantSex varchar(1),
	ApplicantIncome varchar(4),
	PurchaserType varchar(1),
	DenialReason1 varchar(1),
	DenialReason2 varchar(1),
	DenialReason3 varchar(1),
	RateSpread varchar(5),
	HOEPAStatus varchar(1),
	LienStatus varchar(1),
	AreaPopulation varchar(10),
	MinorityPopulationPct varchar(6),
	HUD_Median_Family_Income varchar(8),
	Tract_to_MSA_MD_Income varchar(6),
	Num_of_Owner_occupied_units varchar(8),
	Num_of_1_to_4_Family_units varchar(8),
	Application_Date_Indicator varchar(1),
	FipsCode varchar(12),
	Latitude decimal(18,8),
	Longitude decimal(18,8)
);


CREATE TABLE HMDApub2011
(
	AsOfDate varchar(4),
	RespondentID varchar(10),
	RespondentName varchar(60),
	AgencyCode varchar(1),
	LoanType varchar(1),
	PropertyType varchar(1),
	LoanPurpose varchar(1),
	Occupancy varchar(1),
	LoanAmount varchar(8),
	Preapproval varchar(1),
	ActionType varchar(1),
	MSAOfProperty varchar(5),
	StateCode varchar(2),
	StateName varchar(20),
	CountyCode varchar(3),
	CountyName varchar(50),
	CensusTractNumber varchar(7),
	ApplicantEthnicity varchar(1),
	CoApplicantEthnicity varchar(1),
	ApplicantRace1 varchar(1),
	ApplicantRace2 varchar(1),
	ApplicantRace3 varchar(1),
	ApplicantRace4 varchar(1),
	ApplicantRace5 varchar(1),
	CoApplicantRace1 varchar(1),
	CoApplicantRace2 varchar(1),
	CoApplicantRace3 varchar(1),
	CoApplicantRace4 varchar(1),
	CoApplicantRace5 varchar(1),
	ApplicantSex varchar(1),
	CoApplicantSex varchar(1),
	ApplicantIncome varchar(4),
	PurchaserType varchar(1),
	DenialReason1 varchar(1),
	DenialReason2 varchar(1),
	DenialReason3 varchar(1),
	RateSpread varchar(5),
	HOEPAStatus varchar(1),
	LienStatus varchar(1),
	AreaPopulation varchar(10),
	MinorityPopulationPct varchar(6),
	HUD_Median_Family_Income varchar(8),
	Tract_to_MSA_MD_Income varchar(6),
	Num_of_Owner_occupied_units varchar(8),
	Num_of_1_to_4_Family_units varchar(8),
	Application_Date_Indicator varchar(1),
	FipsCode varchar(12),
	Latitude decimal(18,8),
	Longitude decimal(18,8)
);




CREATE TABLE HMDApub2012
(
	AsOfDate varchar(4),
	RespondentID varchar(10),
	RespondentName varchar(60),
	AgencyCode varchar(1),
	LoanType varchar(1),
	PropertyType varchar(1),
	LoanPurpose varchar(1),
	Occupancy varchar(1),
	LoanAmount varchar(8),
	Preapproval varchar(1),
	ActionType varchar(1),
	MSAOfProperty varchar(5),
	StateCode varchar(2),
	StateName varchar(20),
	CountyCode varchar(3),
	CountyName varchar(50),
	CensusTractNumber varchar(7),
	ApplicantEthnicity varchar(1),
	Co_ApplicantEthnicity varchar(1),
	ApplicantRace1 varchar(1),
	ApplicantRace2 varchar(1),
	ApplicantRace3 varchar(1),
	ApplicantRace4 varchar(1),
	ApplicantRace5 varchar(1),
	CoApplicantRace1 varchar(1),
	CoApplicantRace2 varchar(1),
	CoApplicantRace3 varchar(1),
	CoApplicantRace4 varchar(1),
	CoApplicantRace5 varchar(1),
	ApplicantSex varchar(1),
	CoApplicantSex varchar(1),
	ApplicantIncome varchar(4),
	PurchaserType varchar(1),
	DenialReason1 varchar(1),
	DenialReason2 varchar(1),
	DenialReason3 varchar(1),
	RateSpread varchar(5),
	HOEPAStatus varchar(1),
	LienStatus varchar(1),
	SequenceNumber varchar(10),
	AreaPopulation varchar(10),
	MinorityPopulationPct varchar(6),
	FFIEC_Median_Family_Income varchar(8),
	Tract_to_MSA_MD_Income varchar(6),
	Num_of_Owner_occupied_units varchar(8),
	Num_of_1_to_4_Family_units varchar(8),
	Application_Date_Indicator varchar(1),
	FipsCode varchar(12),
	Latitude decimal(18,8),
	Longitude decimal(18,8)
);

CREATE TABLE HMDApub2013
(
	AsOfDate varchar(4),
	RespondentID varchar(10),
	RespondentName varchar(60),
	AgencyCode varchar(1),
	LoanType varchar(1),
	PropertyType varchar(1),
	LoanPurpose varchar(1),
	Occupancy varchar(1),
	LoanAmount varchar(8),
	Preapproval varchar(1),
	ActionType varchar(1),
	MSAOfProperty varchar(5),
	StateCode varchar(2),
	StateName varchar(20),
	CountyCode varchar(3),
	CountyName varchar(50),
	CensusTractNumber varchar(7),
	ApplicantEthnicity varchar(1),
	CoApplicantEthnicity varchar(1),
	ApplicantRace1 varchar(1),
	ApplicantRace2 varchar(1),
	ApplicantRace3 varchar(1),
	ApplicantRace4 varchar(1),
	ApplicantRace5 varchar(1),
	CoApplicantRace1 varchar(1),
	CoApplicantRace2 varchar(1),
	CoApplicantRace3 varchar(1),
	CoApplicantRace4 varchar(1),
	CoApplicantRace5 varchar(1),
	ApplicantSex varchar(1),
	CoApplicantSex varchar(1),
	ApplicantIncome varchar(4),
	PurchaserType varchar(1),
	DenialReason1 varchar(1),
	DenialReason2 varchar(1),
	DenialReason3 varchar(1),
	RateSpread varchar(5),
	HOEPAStatus varchar(1),
	LienStatus varchar(1),
	SequenceNumber varchar(10),
	AreaPopulation varchar(10),
	MinorityPopulationPct varchar(6),
	FFIEC_Median_Family_Income varchar(8),
	Tract_to_MSA_MD_Income varchar(6),
	Num_of_Owner_occupied_units varchar(8),
	Num_of_1_to_4_Family_units varchar(8),
	Application_Date_Indicator varchar(1),
	FipsCode varchar(12),
	Latitude decimal(18,8),
	Longitude decimal(18,8)
);

--------
-- LOAD DATA INTO TABLES CREATED ABOVE
--------
-- LAR Data --
SET CLIENT_ENCODING = 'LATIN1';
copy HMDAPub2009 from '/Users/roellk/Desktop/HMDA/data/HMDA2009Pub.txt' csv delimiter '|'; commit;
copy HMDAPub2010 from '/Users/roellk/Desktop/HMDA/data/HMDA2010Pub.txt' csv delimiter '|'; commit;
copy HMDAPub2011 from '/users/roellk/desktop/HMDA/data/HMDA2011Pub.txt' csv delimiter '|'; commit;
copy HMDAPub2012 from '/Users/roellk/Desktop/HMDA/data/HMDA2012Pub.txt' csv delimiter '|'; commit;
copy HMDAPub2013 from '/users/roellk/desktop/HMDA/data/HMDA2013Pub.txt' csv delimiter '|'; commit;






