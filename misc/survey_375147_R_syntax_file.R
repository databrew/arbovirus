# MBR edit 7/31/2021: 
# commented out all attributes(data)$variable.labels settings to simplify things
# if there's a good reason to use these labels, speak up!

data <- read.csv("data/survey_375147_R_data_file.csv", quote = "'\"", na.strings=c("", "\"\""), stringsAsFactors=FALSE, fileEncoding="UTF-8-BOM")

# LimeSurvey Field type: F
data[, 1] <- as.numeric(data[, 1])
# attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"
# LimeSurvey Field type: DATETIME23.2
data[, 2] <- as.character(data[, 2])
# attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"
# LimeSurvey Field type: F
data[, 3] <- as.numeric(data[, 3])
# attributes(data)$variable.labels[3] <- "lastpage"
names(data)[3] <- "lastpage"
# LimeSurvey Field type: A
data[, 4] <- as.character(data[, 4])
# attributes(data)$variable.labels[4] <- "startlanguage"
names(data)[4] <- "startlanguage"
# LimeSurvey Field type: A
data[, 5] <- as.character(data[, 5])
# attributes(data)$variable.labels[5] <- "Seed"
names(data)[5] <- "q_"
# LimeSurvey Field type: A
data[, 6] <- as.character(data[, 6])
# attributes(data)$variable.labels[6] <- "token"
names(data)[6] <- "token"
# LimeSurvey Field type: A
data[, 7] <- as.character(data[, 7])
# attributes(data)$variable.labels[7] <- "1. Country:"
data[, 7] <- factor(data[, 7], levels=c("AFG","ALB","DZA","AND","AGO","ATG","ARG","ARM","AUS","AUT","AZE","BHS","BHR","BGD","BRB","BLR","BEL","BLZ","BEN","BTN","BOL","BIH","BWA","BRA","BRN","BGR","BFA","BDI","CPV","KHM","CMR","CAN","CAF","TCD","CHL","CHN","COL","COM","COG","COK","CRI","CIV","HRV","CUB","CYP","CZE","PRK","COD","DNK","DJI","DMA","DOM","ECU","EGY","SLV","GNQ","ERI","EST","SWZ","ETH","FJI","FIN","FRA","PF","GAB","GMB","GEO","DEU","GHA","GRC","GRD","GTM","GIN","GNB","GUY","HTI","HND","HUN","ISL","IND","IDN","IRN","IRQ","IRL","ISR","ITA","JAM","JPN","JOR","KAZ","KEN","KIR","KWT","KGZ","LAO","LVA","LBN","LSO","LBR","LBY","LTU","LUX","MDG","MWI","MYS","MDV","MLI","MLT","MHL","MRT","MUS","MEX","FSM","MCO","MNG","MNE","MAR","MOZ","MMR","NAM","NRU","NPL","NLD","NZL","NIC","NER","NGA","NIU","MKD","NOR","OMN","PAK","PLW","PAN","PNG","PRY","PER","PHL","POL","PRT","QAT","KOR","MDA","ROU","RUS","RWA","KNA","LCA","VCT","WSM","SMR","STP","SAU","SEN","SRB","SYC","SLE","SGP","SVK","SVN","SLB","SOM","ZAF","SSD","ESP","LKA","SDN","SUR","SWE","CHE","SYR","TJK","THA","TLS","TGO","TON","TTO","TUN","TUR","TKM","TUV","UGA","UKR","ARE","GBR","TZA","USA","URY","UZB","VUT","VEN","VNM","YEM","ZMB","ZWE"),labels=c("Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia (Plurinational State of)", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Cook Islands", "Costa Rica", "Côte d\'Ivoire", "Croatia", "Cuba", "Cyprus", "Czechia", "Democratic People\'s Republic of Korea", "Democratic Republic of the Congo", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France","French Polynesia", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Lao People\'s Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia (Federated States of)", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Republic of Korea", "Republic of Moldova", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syrian Arab Republic", "Tajikistan", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom of Great Britain and Northern Ireland", "United Republic of Tanzania", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela (Bolivarian Republic of)", "Viet Nam", "Yemen", "Zambia", "Zimbabwe"))
names(data)[7] <- "SI01"
# LimeSurvey Field type: A
data[, 8] <- as.character(data[, 8])
# attributes(data)$variable.labels[8] <- "2. Respondent/person to be contacted for clarification, if needed  (last name, first name, e-mail address)"
names(data)[8] <- "SI02"
# LimeSurvey Field type: A
data[, 9] <- as.character(data[, 9])
# attributes(data)$variable.labels[9] <- "3. Professional title and affiliation"
names(data)[9] <- "SI03"
# LimeSurvey Field type: DATETIME23.2
data[, 10] <- as.character(data[, 10])
# attributes(data)$variable.labels[10] <- "4. Date (dd/mm/yyyy):"
names(data)[10] <- "SI04"
# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
# attributes(data)$variable.labels[11] <- "[Chikungunya virus ] 5. Which arboviruses have circulated in your country at any time since the year 2000?  This refers only to arboviruses with autochthonous i.e., local mosquito-borne transmission. "
data[, 11] <- factor(data[, 11], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[11] <- "SII05_SQ001"
# LimeSurvey Field type: F
data[, 12] <- as.numeric(data[, 12])
# attributes(data)$variable.labels[12] <- "[Dengue viruses ] 5. Which arboviruses have circulated in your country at any time since the year 2000?  This refers only to arboviruses with autochthonous i.e., local mosquito-borne transmission. "
data[, 12] <- factor(data[, 12], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[12] <- "SII05_SQ002"
# LimeSurvey Field type: F
data[, 13] <- as.numeric(data[, 13])
# attributes(data)$variable.labels[13] <- "[Yellow fever virus ] 5. Which arboviruses have circulated in your country at any time since the year 2000?  This refers only to arboviruses with autochthonous i.e., local mosquito-borne transmission. "
data[, 13] <- factor(data[, 13], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[13] <- "SII05_SQ003"
# LimeSurvey Field type: F
data[, 14] <- as.numeric(data[, 14])
# attributes(data)$variable.labels[14] <- "[Zika virus] 5. Which arboviruses have circulated in your country at any time since the year 2000?  This refers only to arboviruses with autochthonous i.e., local mosquito-borne transmission. "
data[, 14] <- factor(data[, 14], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[14] <- "SII05_SQ004"
# LimeSurvey Field type: A
data[, 15] <- as.character(data[, 15])
# attributes(data)$variable.labels[15] <- "[Other] 5. Which arboviruses have circulated in your country at any time since the year 2000?  This refers only to arboviruses with autochthonous i.e., local mosquito-borne transmission. "
names(data)[15] <- "SII05_other"
# LimeSurvey Field type: F
data[, 16] <- as.numeric(data[, 16])
# attributes(data)$variable.labels[16] <- "6. Do you have any written arbovirus surveillance and control plan(s) and/or guideline(s) for your country?"
data[, 16] <- factor(data[, 16], levels=c(1,2,3,4),labels=c("Yes, we have arbovirus-specific plans(s) or guidelines(s)", "Yes. We do not have arbovirus-specific guidelines, but arboviruses are included within general surveillance guidelines.", "No", "I don\'t know"))
names(data)[16] <- "SII06"
# LimeSurvey Field type: F
data[, 17] <- as.numeric(data[, 17])
# attributes(data)$variable.labels[17] <- "[Chikungunya virus] 6b. For which of the following arboviruses do you have written surveillance and control plans for your country? Please choose all that apply:"
data[, 17] <- factor(data[, 17], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[17] <- "SII06b_SQ001"
# LimeSurvey Field type: F
data[, 18] <- as.numeric(data[, 18])
# attributes(data)$variable.labels[18] <- "[Dengue virus] 6b. For which of the following arboviruses do you have written surveillance and control plans for your country? Please choose all that apply:"
data[, 18] <- factor(data[, 18], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[18] <- "SII06b_SQ002"
# LimeSurvey Field type: F
data[, 19] <- as.numeric(data[, 19])
# attributes(data)$variable.labels[19] <- "[Yellow fever virus] 6b. For which of the following arboviruses do you have written surveillance and control plans for your country? Please choose all that apply:"
data[, 19] <- factor(data[, 19], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[19] <- "SII06b_SQ003"
# LimeSurvey Field type: F
data[, 20] <- as.numeric(data[, 20])
# attributes(data)$variable.labels[20] <- "[Zika virus] 6b. For which of the following arboviruses do you have written surveillance and control plans for your country? Please choose all that apply:"
data[, 20] <- factor(data[, 20], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[20] <- "SII06b_SQ004"
# LimeSurvey Field type: A
data[, 21] <- as.character(data[, 21])
# attributes(data)$variable.labels[21] <- "[Other] 6b. For which of the following arboviruses do you have written surveillance and control plans for your country? Please choose all that apply:"
names(data)[21] <- "SII06b_other"
# LimeSurvey Field type: A
data[, 22] <- as.character(data[, 22])
# attributes(data)$variable.labels[22] <- "6c. Please upload surveillance and control plan(s) or protocol(s), or guideline(s)"
names(data)[22] <- "SII06c"
# LimeSurvey Field type: A
data[, 23] <- as.character(data[, 23])
# attributes(data)$variable.labels[23] <- "filecount - 6c. Please upload surveillance and control plan(s) or protocol(s), or guideline(s)"
names(data)[23] <- "SII06c__filecount"
# LimeSurvey Field type: A
data[, 24] <- as.character(data[, 24])
# attributes(data)$variable.labels[24] <- "Since you answered that we use general surveillance guidelines that include arboviral diseases, please specify which guidelines these are:"
names(data)[24] <- "SII06o"
# LimeSurvey Field type: A
data[, 25] <- as.character(data[, 25])
# attributes(data)$variable.labels[25] <- "7. Is there a specific national programme for arboviral diseases surveillance or is it integrated in another programme?  Please select the appropriate answer:"
data[, 25] <- factor(data[, 25], levels=c("A1","A2","A3","A4"),labels=c("Specific programme", "Integrated in another programme", "No programme", "I don\'t know"))
names(data)[25] <- "SII07"
# LimeSurvey Field type: A
data[, 26] <- as.character(data[, 26])
# attributes(data)$variable.labels[26] <- "7b. Please specify the programme into which arboviral diseases is integrated. "
names(data)[26] <- "SII07b"
# LimeSurvey Field type: F
data[, 27] <- as.numeric(data[, 27])
# attributes(data)$variable.labels[27] <- "[Primary health care level] [Individual level] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 27] <- factor(data[, 27], levels=c(1,0),labels=c("1", "0"))
names(data)[27] <- "SII08_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 28] <- as.numeric(data[, 28])
# attributes(data)$variable.labels[28] <- "[Primary health care level] [Aggregated ] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 28] <- factor(data[, 28], levels=c(1,0),labels=c("1", "0"))
names(data)[28] <- "SII08_SQ001_SQ002"
# LimeSurvey Field type: F
data[, 29] <- as.numeric(data[, 29])
# attributes(data)$variable.labels[29] <- "[District level] [Individual level] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 29] <- factor(data[, 29], levels=c(1,0),labels=c("1", "0"))
names(data)[29] <- "SII08_SQ002_SQ001"
# LimeSurvey Field type: F
data[, 30] <- as.numeric(data[, 30])
# attributes(data)$variable.labels[30] <- "[District level] [Aggregated ] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 30] <- factor(data[, 30], levels=c(1,0),labels=c("1", "0"))
names(data)[30] <- "SII08_SQ002_SQ002"
# LimeSurvey Field type: F
data[, 31] <- as.numeric(data[, 31])
# attributes(data)$variable.labels[31] <- "[Regional level] [Individual level] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 31] <- factor(data[, 31], levels=c(1,0),labels=c("1", "0"))
names(data)[31] <- "SII08_SQ003_SQ001"
# LimeSurvey Field type: F
data[, 32] <- as.numeric(data[, 32])
# attributes(data)$variable.labels[32] <- "[Regional level] [Aggregated ] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 32] <- factor(data[, 32], levels=c(1,0),labels=c("1", "0"))
names(data)[32] <- "SII08_SQ003_SQ002"
# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
# attributes(data)$variable.labels[33] <- "[National level] [Individual level] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 33] <- factor(data[, 33], levels=c(1,0),labels=c("1", "0"))
names(data)[33] <- "SII08_SQ004_SQ001"
# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
# attributes(data)$variable.labels[34] <- "[National level] [Aggregated ] 8. For which level of the health structure are individual and aggregated  data available ?  (select all relevant levels)"
data[, 34] <- factor(data[, 34], levels=c(1,0),labels=c("1", "0"))
names(data)[34] <- "SII08_SQ004_SQ002"
# LimeSurvey Field type: A
data[, 35] <- as.character(data[, 35])
# attributes(data)$variable.labels[35] <- "[National] 9. What are the tools used for recording case data for surveillance purposes? Select all that apply."
data[, 35] <- factor(data[, 35], levels=c("A1","A2","A3"),labels=c("Paper-based", "Électronic", "Mixed methods"))
names(data)[35] <- "SII09_SQ001"
# LimeSurvey Field type: A
data[, 36] <- as.character(data[, 36])
# attributes(data)$variable.labels[36] <- "[State/provincial] 9. What are the tools used for recording case data for surveillance purposes? Select all that apply."
data[, 36] <- factor(data[, 36], levels=c("A1","A2","A3"),labels=c("Paper-based", "Électronic", "Mixed methods"))
names(data)[36] <- "SII09_SQ002"
# LimeSurvey Field type: A
data[, 37] <- as.character(data[, 37])
# attributes(data)$variable.labels[37] <- "[District] 9. What are the tools used for recording case data for surveillance purposes? Select all that apply."
data[, 37] <- factor(data[, 37], levels=c("A1","A2","A3"),labels=c("Paper-based", "Électronic", "Mixed methods"))
names(data)[37] <- "SII09_SQ003"
# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
# attributes(data)$variable.labels[38] <- "[One-time basic training on data capture and analysis (MS Excel, MS Access, EpiInfo) and/or geographic information systems (GIS)] 10. Which training has been provided to the staff working on arboviral disease surveillance data?"
data[, 38] <- factor(data[, 38], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[38] <- "SII10_SQ001"
# LimeSurvey Field type: F
data[, 39] <- as.numeric(data[, 39])
# attributes(data)$variable.labels[39] <- "[Repeated/continuing basic training on data capture, analysis, and/or GIS ] 10. Which training has been provided to the staff working on arboviral disease surveillance data?"
data[, 39] <- factor(data[, 39], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[39] <- "SII10_SQ002"
# LimeSurvey Field type: F
data[, 40] <- as.numeric(data[, 40])
# attributes(data)$variable.labels[40] <- "[One-time advanced training on statistical software for data analysis (e.g. STATA, R, SAS, Tableau, etc.) and GIS] 10. Which training has been provided to the staff working on arboviral disease surveillance data?"
data[, 40] <- factor(data[, 40], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[40] <- "SII10_SQ003"
# LimeSurvey Field type: F
data[, 41] <- as.numeric(data[, 41])
# attributes(data)$variable.labels[41] <- "[Repeated/continuing training on advance statistical software for data analysis (e.g. STATA, R, SAS, etc.)  and GIS ] 10. Which training has been provided to the staff working on arboviral disease surveillance data?"
data[, 41] <- factor(data[, 41], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[41] <- "SII10_SQ004"
# LimeSurvey Field type: F
data[, 42] <- as.numeric(data[, 42])
# attributes(data)$variable.labels[42] <- "[No training ] 10. Which training has been provided to the staff working on arboviral disease surveillance data?"
data[, 42] <- factor(data[, 42], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[42] <- "SII10_SQ005"
# LimeSurvey Field type: A
data[, 43] <- as.character(data[, 43])
# attributes(data)$variable.labels[43] <- "[Other] 10. Which training has been provided to the staff working on arboviral disease surveillance data?"
names(data)[43] <- "SII10_other"
# LimeSurvey Field type: A
data[, 44] <- as.character(data[, 44])
# attributes(data)$variable.labels[44] <- "11. Is reporting mandatory for any arboviral disease cases in your country? "
data[, 44] <- factor(data[, 44], levels=c("A1","A2"),labels=c("Yes", "No"))
names(data)[44] <- "SII11"
# LimeSurvey Field type: A
data[, 45] <- as.character(data[, 45])
# attributes(data)$variable.labels[45] <- "[Chikungunya virus disease] 11b. For which of the following arboviral disease cases is reporting mandatory in your country? "
data[, 45] <- factor(data[, 45], levels=c("A1","A2","A3"),labels=c("Mandatory reporting of all suspect cases", "Mandatory reporting of confirmed cases only", "Not reportable"))
names(data)[45] <- "SII11b_SQ002"
# LimeSurvey Field type: A
data[, 46] <- as.character(data[, 46])
# attributes(data)$variable.labels[46] <- "[Dengue virus disease] 11b. For which of the following arboviral disease cases is reporting mandatory in your country? "
data[, 46] <- factor(data[, 46], levels=c("A1","A2","A3"),labels=c("Mandatory reporting of all suspect cases", "Mandatory reporting of confirmed cases only", "Not reportable"))
names(data)[46] <- "SII11b_SQ003"
# LimeSurvey Field type: A
data[, 47] <- as.character(data[, 47])
# attributes(data)$variable.labels[47] <- "[Yellow fever virus disease] 11b. For which of the following arboviral disease cases is reporting mandatory in your country? "
data[, 47] <- factor(data[, 47], levels=c("A1","A2","A3"),labels=c("Mandatory reporting of all suspect cases", "Mandatory reporting of confirmed cases only", "Not reportable"))
names(data)[47] <- "SII11b_SQ004"
# LimeSurvey Field type: A
data[, 48] <- as.character(data[, 48])
# attributes(data)$variable.labels[48] <- "[Zika virus virus disease (non-congenital)] 11b. For which of the following arboviral disease cases is reporting mandatory in your country? "
data[, 48] <- factor(data[, 48], levels=c("A1","A2","A3"),labels=c("Mandatory reporting of all suspect cases", "Mandatory reporting of confirmed cases only", "Not reportable"))
names(data)[48] <- "SII11b_SQ005"
# LimeSurvey Field type: A
data[, 49] <- as.character(data[, 49])
# attributes(data)$variable.labels[49] <- "[Congenital Zika virus disease ] 11b. For which of the following arboviral disease cases is reporting mandatory in your country? "
data[, 49] <- factor(data[, 49], levels=c("A1","A2","A3"),labels=c("Mandatory reporting of all suspect cases", "Mandatory reporting of confirmed cases only", "Not reportable"))
names(data)[49] <- "SII11b_SQ006"
# LimeSurvey Field type: A
data[, 50] <- as.character(data[, 50])
# attributes(data)$variable.labels[50] <- "[Other ] 11b. For which of the following arboviral disease cases is reporting mandatory in your country? "
data[, 50] <- factor(data[, 50], levels=c("A1","A2","A3"),labels=c("Mandatory reporting of all suspect cases", "Mandatory reporting of confirmed cases only", "Not reportable"))
names(data)[50] <- "SII11b_SQ007"
# LimeSurvey Field type: A
data[, 51] <- as.character(data[, 51])
# attributes(data)$variable.labels[51] <- "[1] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[51] <- "SII11o_SQ001_SQ001"
# LimeSurvey Field type: A
data[, 52] <- as.character(data[, 52])
# attributes(data)$variable.labels[52] <- "[1] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[52] <- "SII11o_SQ001_SQ002"
# LimeSurvey Field type: A
data[, 53] <- as.character(data[, 53])
# attributes(data)$variable.labels[53] <- "[2] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[53] <- "SII11o_SQ002_SQ001"
# LimeSurvey Field type: A
data[, 54] <- as.character(data[, 54])
# attributes(data)$variable.labels[54] <- "[2] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[54] <- "SII11o_SQ002_SQ002"
# LimeSurvey Field type: A
data[, 55] <- as.character(data[, 55])
# attributes(data)$variable.labels[55] <- "[3] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[55] <- "SII11o_SQ003_SQ001"
# LimeSurvey Field type: A
data[, 56] <- as.character(data[, 56])
# attributes(data)$variable.labels[56] <- "[3] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[56] <- "SII11o_SQ003_SQ002"
# LimeSurvey Field type: A
data[, 57] <- as.character(data[, 57])
# attributes(data)$variable.labels[57] <- "[4] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[57] <- "SII11o_SQ004_SQ001"
# LimeSurvey Field type: A
data[, 58] <- as.character(data[, 58])
# attributes(data)$variable.labels[58] <- "[4] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[58] <- "SII11o_SQ004_SQ002"
# LimeSurvey Field type: A
data[, 59] <- as.character(data[, 59])
# attributes(data)$variable.labels[59] <- "[5] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[59] <- "SII11o_SQ005_SQ001"
# LimeSurvey Field type: A
data[, 60] <- as.character(data[, 60])
# attributes(data)$variable.labels[60] <- "[5] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[60] <- "SII11o_SQ005_SQ002"
# LimeSurvey Field type: A
data[, 61] <- as.character(data[, 61])
# attributes(data)$variable.labels[61] <- "[6] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[61] <- "SII11o_SQ006_SQ001"
# LimeSurvey Field type: A
data[, 62] <- as.character(data[, 62])
# attributes(data)$variable.labels[62] <- "[6] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[62] <- "SII11o_SQ006_SQ002"
# LimeSurvey Field type: A
data[, 63] <- as.character(data[, 63])
# attributes(data)$variable.labels[63] <- "[7] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[63] <- "SII11o_SQ007_SQ001"
# LimeSurvey Field type: A
data[, 64] <- as.character(data[, 64])
# attributes(data)$variable.labels[64] <- "[7] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[64] <- "SII11o_SQ007_SQ002"
# LimeSurvey Field type: A
data[, 65] <- as.character(data[, 65])
# attributes(data)$variable.labels[65] <- "[8] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[65] <- "SII11o_SQ008_SQ001"
# LimeSurvey Field type: A
data[, 66] <- as.character(data[, 66])
# attributes(data)$variable.labels[66] <- "[8] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[66] <- "SII11o_SQ008_SQ002"
# LimeSurvey Field type: A
data[, 67] <- as.character(data[, 67])
# attributes(data)$variable.labels[67] <- "[9] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[67] <- "SII11o_SQ009_SQ001"
# LimeSurvey Field type: A
data[, 68] <- as.character(data[, 68])
# attributes(data)$variable.labels[68] <- "[9] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[68] <- "SII11o_SQ009_SQ002"
# LimeSurvey Field type: A
data[, 69] <- as.character(data[, 69])
# attributes(data)$variable.labels[69] <- "[10] [Arbovirus] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[69] <- "SII11o_SQ010_SQ001"
# LimeSurvey Field type: A
data[, 70] <- as.character(data[, 70])
# attributes(data)$variable.labels[70] <- "[10] [All suspect cases/Confirmed cases only] 11c. For which other arboviral diseases is reporting mandatory? "
names(data)[70] <- "SII11o_SQ010_SQ002"
# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
# attributes(data)$variable.labels[71] <- "11d. Please upload document(s) containing surveillance case definitions used for reporting of arboviral diseases"
names(data)[71] <- "SII11d"
# LimeSurvey Field type: A
data[, 72] <- as.character(data[, 72])
# attributes(data)$variable.labels[72] <- "filecount - 11d. Please upload document(s) containing surveillance case definitions used for reporting of arboviral diseases"
names(data)[72] <- "SII11d__filecount"
# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
# attributes(data)$variable.labels[73] <- "12. In the last 2 years, did your country conduct national epidemiological surveillance for human cases of arboviral disease? "
data[, 73] <- factor(data[, 73], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[73] <- "SII12"
# LimeSurvey Field type: A
data[, 74] <- as.character(data[, 74])
# attributes(data)$variable.labels[74] <- "12b. How frequently are surveillance data reported to the national level? Please choose one of the following:"
data[, 74] <- factor(data[, 74], levels=c("A1","A2","A3","A4"),labels=c("Weekly", "Monthly", "Every 3 months", "Ad hoc"))
names(data)[74] <- "SII12b"
# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
# attributes(data)$variable.labels[75] <- "[Other] 12b. How frequently are surveillance data reported to the national level? Please choose one of the following:"
names(data)[75] <- "SII12b_other"
# LimeSurvey Field type: A
data[, 76] <- as.character(data[, 76])
# attributes(data)$variable.labels[76] <- "12c. What type of national epidemiological surveillance was conducted? Please choose one the following:     Definitions:  Active surveillance is defined as having dedicated systems and staff that routinely and with effort survey for cases of disease or detection of vectors and associated pathogens by the public health department.  Passive surveillance is defined as having a reporting system where physicians, laboratories, mosquito control districts, academic institutions or others routinely report cases of disease or detection of vectors and associated pathogens to the public health department."
data[, 76] <- factor(data[, 76], levels=c("A1","A2","A3"),labels=c("Primarily active", "Primarily passive", "Combination of active and passive"))
names(data)[76] <- "SII12c"
# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
# attributes(data)$variable.labels[77] <- "12d. If available, please upload upload the most recent report(s) on arboviral surveillance in humans."
names(data)[77] <- "SII12d"
# LimeSurvey Field type: A
data[, 78] <- as.character(data[, 78])
# attributes(data)$variable.labels[78] <- "filecount - 12d. If available, please upload upload the most recent report(s) on arboviral surveillance in humans."
names(data)[78] <- "SII12d__filecount"
# LimeSurvey Field type: A
data[, 79] <- as.character(data[, 79])
# attributes(data)$variable.labels[79] <- "13. Does your country provide regular training sessions for healthcare workers on notification of Aedes-borne arboviral diseases?"
data[, 79] <- factor(data[, 79], levels=c("A1","A2","A3"),labels=c("Yes. If so, please describe in the comments field:", "No", "I don\'t know"))
names(data)[79] <- "SII13"
# LimeSurvey Field type: A
data[, 80] <- as.character(data[, 80])
# attributes(data)$variable.labels[80] <- "[Comment] 13. Does your country provide regular training sessions for healthcare workers on notification of Aedes-borne arboviral diseases?"
names(data)[80] <- "SII13_comment"
# LimeSurvey Field type: A
data[, 81] <- as.character(data[, 81])
# attributes(data)$variable.labels[81] <- "14. What do the arboviral disease surveillance staff perceive as factors contributing to the a) success and b) barriers/challenges to arboviral disease surveillance in humans?"
names(data)[81] <- "SII14"
# LimeSurvey Field type: A
data[, 82] <- as.character(data[, 82])
# attributes(data)$variable.labels[82] <- "[Outbreak periods] 15. Is arbovirus diagnostic laboratory testing performed for confirmation of suspected cases in your country? (Please select the applicable option during outbreak periods and  during non-outbreak periods, respectively)    "
data[, 82] <- factor(data[, 82], levels=c("A1","A2","A3"),labels=c("All suspect cases tested", "Subset of suspect cases tested", "No suspect cases tested"))
names(data)[82] <- "SIII15_SQ001"
# LimeSurvey Field type: A
data[, 83] <- as.character(data[, 83])
# attributes(data)$variable.labels[83] <- "[Non-outbreak periods] 15. Is arbovirus diagnostic laboratory testing performed for confirmation of suspected cases in your country? (Please select the applicable option during outbreak periods and  during non-outbreak periods, respectively)    "
data[, 83] <- factor(data[, 83], levels=c("A1","A2","A3"),labels=c("All suspect cases tested", "Subset of suspect cases tested", "No suspect cases tested"))
names(data)[83] <- "SIII15_SQ002"
# LimeSurvey Field type: F
data[, 84] <- as.numeric(data[, 84])
# attributes(data)$variable.labels[84] <- "[Non-outbreak (routine) [percentage in a year]:] [Percentage] 15b. On average, for what percentage of suspected arboviral disease cases your country is laboratory confirmatory testing performed? Please indicate for outbreak and non-outbreak periods, respectively."
names(data)[84] <- "SIII15b_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 85] <- as.numeric(data[, 85])
# attributes(data)$variable.labels[85] <- "[During outbreaks [percentage per identifed cluster]:] [Percentage] 15b. On average, for what percentage of suspected arboviral disease cases your country is laboratory confirmatory testing performed? Please indicate for outbreak and non-outbreak periods, respectively."
names(data)[85] <- "SIII15b_SQ002_SQ001"
# LimeSurvey Field type: A
data[, 86] <- as.character(data[, 86])
# attributes(data)$variable.labels[86] <- "16. In the last two years, were the positive cases of arboviruses confirmed by a national reference laboratory?"
data[, 86] <- factor(data[, 86], levels=c("A1","A2","A3"),labels=c("Yes, for all arboviral infections. Please specify them:", "Yes, but only for some arboviral infections. Please specify them:", "No"))
names(data)[86] <- "SIII16"
# LimeSurvey Field type: A
data[, 87] <- as.character(data[, 87])
# attributes(data)$variable.labels[87] <- "[Comment] 16. In the last two years, were the positive cases of arboviruses confirmed by a national reference laboratory?"
names(data)[87] <- "SIII16_comment"
# LimeSurvey Field type: A
data[, 88] <- as.character(data[, 88])
# attributes(data)$variable.labels[88] <- "16b. If your country does not have capacity to type and serotype arboviruses, do you send samples for typing to other countries?"
data[, 88] <- factor(data[, 88], levels=c("A1","A2","A3"),labels=c("Yes. Please specify where:", "No", "I don\'t know"))
names(data)[88] <- "SIII16b"
# LimeSurvey Field type: A
data[, 89] <- as.character(data[, 89])
# attributes(data)$variable.labels[89] <- "[Comment] 16b. If your country does not have capacity to type and serotype arboviruses, do you send samples for typing to other countries?"
names(data)[89] <- "SIII16b_comment"
# LimeSurvey Field type: F
data[, 90] <- as.numeric(data[, 90])
# attributes(data)$variable.labels[90] <- "[Chikungunya] [Antigen testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 90] <- factor(data[, 90], levels=c(1,0),labels=c("1", "0"))
names(data)[90] <- "SIII17_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 91] <- as.numeric(data[, 91])
# attributes(data)$variable.labels[91] <- "[Chikungunya] [IgM  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 91] <- factor(data[, 91], levels=c(1,0),labels=c("1", "0"))
names(data)[91] <- "SIII17_SQ001_SQ002"
# LimeSurvey Field type: F
data[, 92] <- as.numeric(data[, 92])
# attributes(data)$variable.labels[92] <- "[Chikungunya] [IgG  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 92] <- factor(data[, 92], levels=c(1,0),labels=c("1", "0"))
names(data)[92] <- "SIII17_SQ001_SQ007"
# LimeSurvey Field type: F
data[, 93] <- as.numeric(data[, 93])
# attributes(data)$variable.labels[93] <- "[Chikungunya] [Neutralizing  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 93] <- factor(data[, 93], levels=c(1,0),labels=c("1", "0"))
names(data)[93] <- "SIII17_SQ001_SQ003"
# LimeSurvey Field type: F
data[, 94] <- as.numeric(data[, 94])
# attributes(data)$variable.labels[94] <- "[Chikungunya] [Virus  isolation] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 94] <- factor(data[, 94], levels=c(1,0),labels=c("1", "0"))
names(data)[94] <- "SIII17_SQ001_SQ004"
# LimeSurvey Field type: F
data[, 95] <- as.numeric(data[, 95])
# attributes(data)$variable.labels[95] <- "[Chikungunya] [RT-PCR or other  nucleic acid  amplification test] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 95] <- factor(data[, 95], levels=c(1,0),labels=c("1", "0"))
names(data)[95] <- "SIII17_SQ001_SQ005"
# LimeSurvey Field type: F
data[, 96] <- as.numeric(data[, 96])
# attributes(data)$variable.labels[96] <- "[Chikungunya] [Viral gene/ genome Sequencing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 96] <- factor(data[, 96], levels=c(1,0),labels=c("1", "0"))
names(data)[96] <- "SIII17_SQ001_SQ006"
# LimeSurvey Field type: F
data[, 97] <- as.numeric(data[, 97])
# attributes(data)$variable.labels[97] <- "[Dengue] [Antigen testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 97] <- factor(data[, 97], levels=c(1,0),labels=c("1", "0"))
names(data)[97] <- "SIII17_SQ002_SQ001"
# LimeSurvey Field type: F
data[, 98] <- as.numeric(data[, 98])
# attributes(data)$variable.labels[98] <- "[Dengue] [IgM  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 98] <- factor(data[, 98], levels=c(1,0),labels=c("1", "0"))
names(data)[98] <- "SIII17_SQ002_SQ002"
# LimeSurvey Field type: F
data[, 99] <- as.numeric(data[, 99])
# attributes(data)$variable.labels[99] <- "[Dengue] [IgG  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 99] <- factor(data[, 99], levels=c(1,0),labels=c("1", "0"))
names(data)[99] <- "SIII17_SQ002_SQ007"
# LimeSurvey Field type: F
data[, 100] <- as.numeric(data[, 100])
# attributes(data)$variable.labels[100] <- "[Dengue] [Neutralizing  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 100] <- factor(data[, 100], levels=c(1,0),labels=c("1", "0"))
names(data)[100] <- "SIII17_SQ002_SQ003"
# LimeSurvey Field type: F
data[, 101] <- as.numeric(data[, 101])
# attributes(data)$variable.labels[101] <- "[Dengue] [Virus  isolation] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 101] <- factor(data[, 101], levels=c(1,0),labels=c("1", "0"))
names(data)[101] <- "SIII17_SQ002_SQ004"
# LimeSurvey Field type: F
data[, 102] <- as.numeric(data[, 102])
# attributes(data)$variable.labels[102] <- "[Dengue] [RT-PCR or other  nucleic acid  amplification test] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 102] <- factor(data[, 102], levels=c(1,0),labels=c("1", "0"))
names(data)[102] <- "SIII17_SQ002_SQ005"
# LimeSurvey Field type: F
data[, 103] <- as.numeric(data[, 103])
# attributes(data)$variable.labels[103] <- "[Dengue] [Viral gene/ genome Sequencing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 103] <- factor(data[, 103], levels=c(1,0),labels=c("1", "0"))
names(data)[103] <- "SIII17_SQ002_SQ006"
# LimeSurvey Field type: F
data[, 104] <- as.numeric(data[, 104])
# attributes(data)$variable.labels[104] <- "[Yellow fever] [Antigen testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 104] <- factor(data[, 104], levels=c(1,0),labels=c("1", "0"))
names(data)[104] <- "SIII17_SQ003_SQ001"
# LimeSurvey Field type: F
data[, 105] <- as.numeric(data[, 105])
# attributes(data)$variable.labels[105] <- "[Yellow fever] [IgM  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 105] <- factor(data[, 105], levels=c(1,0),labels=c("1", "0"))
names(data)[105] <- "SIII17_SQ003_SQ002"
# LimeSurvey Field type: F
data[, 106] <- as.numeric(data[, 106])
# attributes(data)$variable.labels[106] <- "[Yellow fever] [IgG  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 106] <- factor(data[, 106], levels=c(1,0),labels=c("1", "0"))
names(data)[106] <- "SIII17_SQ003_SQ007"
# LimeSurvey Field type: F
data[, 107] <- as.numeric(data[, 107])
# attributes(data)$variable.labels[107] <- "[Yellow fever] [Neutralizing  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 107] <- factor(data[, 107], levels=c(1,0),labels=c("1", "0"))
names(data)[107] <- "SIII17_SQ003_SQ003"
# LimeSurvey Field type: F
data[, 108] <- as.numeric(data[, 108])
# attributes(data)$variable.labels[108] <- "[Yellow fever] [Virus  isolation] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 108] <- factor(data[, 108], levels=c(1,0),labels=c("1", "0"))
names(data)[108] <- "SIII17_SQ003_SQ004"
# LimeSurvey Field type: F
data[, 109] <- as.numeric(data[, 109])
# attributes(data)$variable.labels[109] <- "[Yellow fever] [RT-PCR or other  nucleic acid  amplification test] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 109] <- factor(data[, 109], levels=c(1,0),labels=c("1", "0"))
names(data)[109] <- "SIII17_SQ003_SQ005"
# LimeSurvey Field type: F
data[, 110] <- as.numeric(data[, 110])
# attributes(data)$variable.labels[110] <- "[Yellow fever] [Viral gene/ genome Sequencing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 110] <- factor(data[, 110], levels=c(1,0),labels=c("1", "0"))
names(data)[110] <- "SIII17_SQ003_SQ006"
# LimeSurvey Field type: F
data[, 111] <- as.numeric(data[, 111])
# attributes(data)$variable.labels[111] <- "[Zika] [Antigen testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 111] <- factor(data[, 111], levels=c(1,0),labels=c("1", "0"))
names(data)[111] <- "SIII17_SQ004_SQ001"
# LimeSurvey Field type: F
data[, 112] <- as.numeric(data[, 112])
# attributes(data)$variable.labels[112] <- "[Zika] [IgM  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 112] <- factor(data[, 112], levels=c(1,0),labels=c("1", "0"))
names(data)[112] <- "SIII17_SQ004_SQ002"
# LimeSurvey Field type: F
data[, 113] <- as.numeric(data[, 113])
# attributes(data)$variable.labels[113] <- "[Zika] [IgG  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 113] <- factor(data[, 113], levels=c(1,0),labels=c("1", "0"))
names(data)[113] <- "SIII17_SQ004_SQ007"
# LimeSurvey Field type: F
data[, 114] <- as.numeric(data[, 114])
# attributes(data)$variable.labels[114] <- "[Zika] [Neutralizing  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 114] <- factor(data[, 114], levels=c(1,0),labels=c("1", "0"))
names(data)[114] <- "SIII17_SQ004_SQ003"
# LimeSurvey Field type: F
data[, 115] <- as.numeric(data[, 115])
# attributes(data)$variable.labels[115] <- "[Zika] [Virus  isolation] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 115] <- factor(data[, 115], levels=c(1,0),labels=c("1", "0"))
names(data)[115] <- "SIII17_SQ004_SQ004"
# LimeSurvey Field type: F
data[, 116] <- as.numeric(data[, 116])
# attributes(data)$variable.labels[116] <- "[Zika] [RT-PCR or other  nucleic acid  amplification test] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 116] <- factor(data[, 116], levels=c(1,0),labels=c("1", "0"))
names(data)[116] <- "SIII17_SQ004_SQ005"
# LimeSurvey Field type: F
data[, 117] <- as.numeric(data[, 117])
# attributes(data)$variable.labels[117] <- "[Zika] [Viral gene/ genome Sequencing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 117] <- factor(data[, 117], levels=c(1,0),labels=c("1", "0"))
names(data)[117] <- "SIII17_SQ004_SQ006"
# LimeSurvey Field type: F
data[, 118] <- as.numeric(data[, 118])
# attributes(data)$variable.labels[118] <- "[Other:] [Antigen testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 118] <- factor(data[, 118], levels=c(1,0),labels=c("1", "0"))
names(data)[118] <- "SIII17_SQ005_SQ001"
# LimeSurvey Field type: F
data[, 119] <- as.numeric(data[, 119])
# attributes(data)$variable.labels[119] <- "[Other:] [IgM  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 119] <- factor(data[, 119], levels=c(1,0),labels=c("1", "0"))
names(data)[119] <- "SIII17_SQ005_SQ002"
# LimeSurvey Field type: F
data[, 120] <- as.numeric(data[, 120])
# attributes(data)$variable.labels[120] <- "[Other:] [IgG  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 120] <- factor(data[, 120], levels=c(1,0),labels=c("1", "0"))
names(data)[120] <- "SIII17_SQ005_SQ007"
# LimeSurvey Field type: F
data[, 121] <- as.numeric(data[, 121])
# attributes(data)$variable.labels[121] <- "[Other:] [Neutralizing  antibody  testing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 121] <- factor(data[, 121], levels=c(1,0),labels=c("1", "0"))
names(data)[121] <- "SIII17_SQ005_SQ003"
# LimeSurvey Field type: F
data[, 122] <- as.numeric(data[, 122])
# attributes(data)$variable.labels[122] <- "[Other:] [Virus  isolation] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 122] <- factor(data[, 122], levels=c(1,0),labels=c("1", "0"))
names(data)[122] <- "SIII17_SQ005_SQ004"
# LimeSurvey Field type: F
data[, 123] <- as.numeric(data[, 123])
# attributes(data)$variable.labels[123] <- "[Other:] [RT-PCR or other  nucleic acid  amplification test] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 123] <- factor(data[, 123], levels=c(1,0),labels=c("1", "0"))
names(data)[123] <- "SIII17_SQ005_SQ005"
# LimeSurvey Field type: F
data[, 124] <- as.numeric(data[, 124])
# attributes(data)$variable.labels[124] <- "[Other:] [Viral gene/ genome Sequencing] 17. Overall, what arboviral testing capacity(ies) is(are) available in your country? Please check all applicable boxes."
data[, 124] <- factor(data[, 124], levels=c(1,0),labels=c("1", "0"))
names(data)[124] <- "SIII17_SQ005_SQ006"
# LimeSurvey Field type: F
data[, 125] <- as.numeric(data[, 125])
# attributes(data)$variable.labels[125] <- "[Additional personnel. Estimate number of full-time staff:] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
data[, 125] <- factor(data[, 125], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[125] <- "SIII18_SQ001"
# LimeSurvey Field type: A
data[, 126] <- as.character(data[, 126])
# attributes(data)$variable.labels[126] <- "[Comment] [Additional personnel. Estimate number of full-time staff:] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
names(data)[126] <- "SIII18_SQ001comment"
# LimeSurvey Field type: F
data[, 127] <- as.numeric(data[, 127])
# attributes(data)$variable.labels[127] <- "[Additional training of personnel. Please specify:  ] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
data[, 127] <- factor(data[, 127], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[127] <- "SIII18_SQ002"
# LimeSurvey Field type: A
data[, 128] <- as.character(data[, 128])
# attributes(data)$variable.labels[128] <- "[Comment] [Additional training of personnel. Please specify:  ] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
names(data)[128] <- "SIII18_SQ002comment"
# LimeSurvey Field type: F
data[, 129] <- as.numeric(data[, 129])
# attributes(data)$variable.labels[129] <- "[Additional laboratory equipment, reagents, etc. Please specify:] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
data[, 129] <- factor(data[, 129], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[129] <- "SIII18_SQ003"
# LimeSurvey Field type: A
data[, 130] <- as.character(data[, 130])
# attributes(data)$variable.labels[130] <- "[Comment] [Additional laboratory equipment, reagents, etc. Please specify:] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
names(data)[130] <- "SIII18_SQ003comment"
# LimeSurvey Field type: F
data[, 131] <- as.numeric(data[, 131])
# attributes(data)$variable.labels[131] <- "[Other capacity needs. Please specify:] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
data[, 131] <- factor(data[, 131], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[131] <- "SIII18_SQ004"
# LimeSurvey Field type: A
data[, 132] <- as.character(data[, 132])
# attributes(data)$variable.labels[132] <- "[Comment] [Other capacity needs. Please specify:] 18. Which additional resources are most needed for your country to perform adequate testing for arboviral diseases? Please describe what would be needed for each checked resource in the adjacent comment field.   "
names(data)[132] <- "SIII18_SQ004comment"
# LimeSurvey Field type: F
data[, 133] <- as.numeric(data[, 133])
# attributes(data)$variable.labels[133] <- "[Yes, using virus isolation] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
data[, 133] <- factor(data[, 133], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[133] <- "SIII19_SQ001"
# LimeSurvey Field type: A
data[, 134] <- as.character(data[, 134])
# attributes(data)$variable.labels[134] <- "[Comment] [Yes, using virus isolation] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
names(data)[134] <- "SIII19_SQ001comment"
# LimeSurvey Field type: F
data[, 135] <- as.numeric(data[, 135])
# attributes(data)$variable.labels[135] <- "[Yes, using RT-PCR] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
data[, 135] <- factor(data[, 135], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[135] <- "SIII19_SQ002"
# LimeSurvey Field type: A
data[, 136] <- as.character(data[, 136])
# attributes(data)$variable.labels[136] <- "[Comment] [Yes, using RT-PCR] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
names(data)[136] <- "SIII19_SQ002comment"
# LimeSurvey Field type: F
data[, 137] <- as.numeric(data[, 137])
# attributes(data)$variable.labels[137] <- "[Yes, using other acid nucleic tests. Please specify:] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
data[, 137] <- factor(data[, 137], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[137] <- "SIII19_SQ003"
# LimeSurvey Field type: A
data[, 138] <- as.character(data[, 138])
# attributes(data)$variable.labels[138] <- "[Comment] [Yes, using other acid nucleic tests. Please specify:] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
names(data)[138] <- "SIII19_SQ003comment"
# LimeSurvey Field type: F
data[, 139] <- as.numeric(data[, 139])
# attributes(data)$variable.labels[139] <- "[Yes, using serological testing. Please specify:] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
data[, 139] <- factor(data[, 139], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[139] <- "SIII19_SQ004"
# LimeSurvey Field type: A
data[, 140] <- as.character(data[, 140])
# attributes(data)$variable.labels[140] <- "[Comment] [Yes, using serological testing. Please specify:] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
names(data)[140] <- "SIII19_SQ004comment"
# LimeSurvey Field type: F
data[, 141] <- as.numeric(data[, 141])
# attributes(data)$variable.labels[141] <- "[No] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
data[, 141] <- factor(data[, 141], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[141] <- "SIII19_SQ005"
# LimeSurvey Field type: A
data[, 142] <- as.character(data[, 142])
# attributes(data)$variable.labels[142] <- "[Comment] [No] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
names(data)[142] <- "SIII19_SQ005comment"
# LimeSurvey Field type: F
data[, 143] <- as.numeric(data[, 143])
# attributes(data)$variable.labels[143] <- "[I don\'t know] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
data[, 143] <- factor(data[, 143], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[143] <- "SIII19_SQ006"
# LimeSurvey Field type: A
data[, 144] <- as.character(data[, 144])
# attributes(data)$variable.labels[144] <- "[Comment] [I don\'t know] 19. Do you perform virological surveillance on humans, i.e., tracking of prevailing genotypes/serotypes? Please select all that apply"
names(data)[144] <- "SIII19_SQ006comment"
# LimeSurvey Field type: F
data[, 145] <- as.numeric(data[, 145])
# attributes(data)$variable.labels[145] <- "[Samples from suspected arboviral diseases routinely notified                     ] 19b. Which samples do you use for virological surveillance?"
data[, 145] <- factor(data[, 145], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[145] <- "SIII19b_SQ001"
# LimeSurvey Field type: F
data[, 146] <- as.numeric(data[, 146])
# attributes(data)$variable.labels[146] <- "[Samples routinely collected from patients with fever of unknown origin ] 19b. Which samples do you use for virological surveillance?"
data[, 146] <- factor(data[, 146], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[146] <- "SIII19b_SQ002"
# LimeSurvey Field type: A
data[, 147] <- as.character(data[, 147])
# attributes(data)$variable.labels[147] <- "[Other] 19b. Which samples do you use for virological surveillance?"
names(data)[147] <- "SIII19b_other"
# LimeSurvey Field type: F
data[, 148] <- as.numeric(data[, 148])
# attributes(data)$variable.labels[148] <- "[Chikungunya virus ] 19c. For which viruses do you perform virological surveillance? (check all that apply)"
data[, 148] <- factor(data[, 148], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[148] <- "SIII19c_SQ001"
# LimeSurvey Field type: F
data[, 149] <- as.numeric(data[, 149])
# attributes(data)$variable.labels[149] <- "[Dengue viruses ] 19c. For which viruses do you perform virological surveillance? (check all that apply)"
data[, 149] <- factor(data[, 149], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[149] <- "SIII19c_SQ002"
# LimeSurvey Field type: F
data[, 150] <- as.numeric(data[, 150])
# attributes(data)$variable.labels[150] <- "[Yellow fever virus ] 19c. For which viruses do you perform virological surveillance? (check all that apply)"
data[, 150] <- factor(data[, 150], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[150] <- "SIII19c_SQ003"
# LimeSurvey Field type: F
data[, 151] <- as.numeric(data[, 151])
# attributes(data)$variable.labels[151] <- "[Zika virus  ] 19c. For which viruses do you perform virological surveillance? (check all that apply)"
data[, 151] <- factor(data[, 151], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[151] <- "SIII19c_SQ004"
# LimeSurvey Field type: A
data[, 152] <- as.character(data[, 152])
# attributes(data)$variable.labels[152] <- "[Other] 19c. For which viruses do you perform virological surveillance? (check all that apply)"
names(data)[152] <- "SIII19c_other"
# LimeSurvey Field type: A
data[, 153] <- as.character(data[, 153])
# attributes(data)$variable.labels[153] <- "19d. Does your country provide regular training sessions for healthcare workers on arboviruses virological surveillance?"
data[, 153] <- factor(data[, 153], levels=c("A1","A2","A3"),labels=c("Yes", "No", "Don\'t know"))
names(data)[153] <- "SIII19d"
# LimeSurvey Field type: A
data[, 154] <- as.character(data[, 154])
# attributes(data)$variable.labels[154] <- "20. What do the arboviral diagnostic laboratory staff perceive as factors contributing to the a) success and b) barriers/challenges with respect to laboratory testing for arboviral infections? "
names(data)[154] <- "SIII20"
# LimeSurvey Field type: A
data[, 155] <- as.character(data[, 155])
# attributes(data)$variable.labels[155] <- "21. Does your country have clinical guidelines for healthcare workers on diagnosis and clinical management of cases and severe cases of Aedes-borne arboviral diseases?"
data[, 155] <- factor(data[, 155], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[155] <- "SIV21"
# LimeSurvey Field type: A
data[, 156] <- as.character(data[, 156])
# attributes(data)$variable.labels[156] <- "21b. Please upload the clinical guideline(s) for arboviral disease management. "
names(data)[156] <- "SIV21b"
# LimeSurvey Field type: A
data[, 157] <- as.character(data[, 157])
# attributes(data)$variable.labels[157] <- "filecount - 21b. Please upload the clinical guideline(s) for arboviral disease management. "
names(data)[157] <- "SIV21b__filecount"
# LimeSurvey Field type: A
data[, 158] <- as.character(data[, 158])
# attributes(data)$variable.labels[158] <- "22. Are severe cases of arboviral diseases managed in a special area  (part of the hospital, isolation beds)?"
data[, 158] <- factor(data[, 158], levels=c("A1","A2","A3"),labels=c("Yes", "No. If so, where are patients with severe disease treated? Please specify in comments field.", "I don\'t know"))
names(data)[158] <- "SIV22"
# LimeSurvey Field type: A
data[, 159] <- as.character(data[, 159])
# attributes(data)$variable.labels[159] <- "[Comment] 22. Are severe cases of arboviral diseases managed in a special area  (part of the hospital, isolation beds)?"
names(data)[159] <- "SIV22_comment"
# LimeSurvey Field type: F
data[, 160] <- as.numeric(data[, 160])
# attributes(data)$variable.labels[160] <- "23. How many hospital beds are available per 100,000 population?"
names(data)[160] <- "SIV23"
# LimeSurvey Field type: A
data[, 161] <- as.character(data[, 161])
# attributes(data)$variable.labels[161] <- "24. Does your country provide regular training sessions for healthcare workers on clinical diagnosis and management of Aedes-borne arboviral diseases?"
data[, 161] <- factor(data[, 161], levels=c("A1","A2","A3"),labels=c("Yes, specific training is provided. If so, please specify:", "No", "I don\'t know"))
names(data)[161] <- "SIV24"
# LimeSurvey Field type: A
data[, 162] <- as.character(data[, 162])
# attributes(data)$variable.labels[162] <- "[Comment] 24. Does your country provide regular training sessions for healthcare workers on clinical diagnosis and management of Aedes-borne arboviral diseases?"
names(data)[162] <- "SIV24_comment"
# LimeSurvey Field type: A
data[, 163] <- as.character(data[, 163])
# attributes(data)$variable.labels[163] <- "25. What do the arboviral disease surveillance/clinical staff perceive as factors contributing to the a) success and b) barriers/challenges with respect to case management?"
names(data)[163] <- "SIV25"
# LimeSurvey Field type: A
data[, 164] <- as.character(data[, 164])
# attributes(data)$variable.labels[164] <- "26. Is there a disease programme, agency, or service in charge of arbovirus vector surveillance in your country? "
data[, 164] <- factor(data[, 164], levels=c("A1","A2","A3"),labels=c("Yes. If so, please specify in the comment field.", "No", "I don\'t know"))
names(data)[164] <- "SV26"
# LimeSurvey Field type: A
data[, 165] <- as.character(data[, 165])
# attributes(data)$variable.labels[165] <- "[Comment] 26. Is there a disease programme, agency, or service in charge of arbovirus vector surveillance in your country? "
names(data)[165] <- "SV26_comment"
# LimeSurvey Field type: F
data[, 166] <- as.numeric(data[, 166])
# attributes(data)$variable.labels[166] <- "[State/provincial health agencies] 27. Which institution/department is in charge of reporting entomologic surveillance data to the national ministry of health/health department? (Check all that apply)"
data[, 166] <- factor(data[, 166], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[166] <- "SV27_SQ001"
# LimeSurvey Field type: F
data[, 167] <- as.numeric(data[, 167])
# attributes(data)$variable.labels[167] <- "[Other national agency] 27. Which institution/department is in charge of reporting entomologic surveillance data to the national ministry of health/health department? (Check all that apply)"
data[, 167] <- factor(data[, 167], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[167] <- "SV27_SQ002"
# LimeSurvey Field type: F
data[, 168] <- as.numeric(data[, 168])
# attributes(data)$variable.labels[168] <- "[City/country health departments] 27. Which institution/department is in charge of reporting entomologic surveillance data to the national ministry of health/health department? (Check all that apply)"
data[, 168] <- factor(data[, 168], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[168] <- "SV27_SQ003"
# LimeSurvey Field type: F
data[, 169] <- as.numeric(data[, 169])
# attributes(data)$variable.labels[169] <- "[Local mosquito control districts or similar organisations] 27. Which institution/department is in charge of reporting entomologic surveillance data to the national ministry of health/health department? (Check all that apply)"
data[, 169] <- factor(data[, 169], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[169] <- "SV27_SQ004"
# LimeSurvey Field type: F
data[, 170] <- as.numeric(data[, 170])
# attributes(data)$variable.labels[170] <- "[Universities or academic institutions] 27. Which institution/department is in charge of reporting entomologic surveillance data to the national ministry of health/health department? (Check all that apply)"
data[, 170] <- factor(data[, 170], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[170] <- "SV27_SQ005"
# LimeSurvey Field type: F
data[, 171] <- as.numeric(data[, 171])
# attributes(data)$variable.labels[171] <- "[Private companies ] 27. Which institution/department is in charge of reporting entomologic surveillance data to the national ministry of health/health department? (Check all that apply)"
data[, 171] <- factor(data[, 171], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[171] <- "SV27_SQ006"
# LimeSurvey Field type: A
data[, 172] <- as.character(data[, 172])
# attributes(data)$variable.labels[172] <- "[Other] 27. Which institution/department is in charge of reporting entomologic surveillance data to the national ministry of health/health department? (Check all that apply)"
names(data)[172] <- "SV27_other"
# LimeSurvey Field type: A
data[, 173] <- as.character(data[, 173])
# attributes(data)$variable.labels[173] <- "28. For the last 2 years, did your country conduct entomologic surveillance for arboviral infections in mosquito vectors?"
data[, 173] <- factor(data[, 173], levels=c("A1","A2","A3"),labels=c("Yes", "No", "Don\'t know"))
names(data)[173] <- "SV28"
# LimeSurvey Field type: A
data[, 174] <- as.character(data[, 174])
# attributes(data)$variable.labels[174] <- "28b. Please upload the most recent national vector surveillance report.  This may include entomological indices, insecticide resistance etc."
names(data)[174] <- "SV28b"
# LimeSurvey Field type: A
data[, 175] <- as.character(data[, 175])
# attributes(data)$variable.labels[175] <- "filecount - 28b. Please upload the most recent national vector surveillance report.  This may include entomological indices, insecticide resistance etc."
names(data)[175] <- "SV28b__filecount"
# LimeSurvey Field type: A
data[, 176] <- as.character(data[, 176])
# attributes(data)$variable.labels[176] <- "28c. Did the entomologic surveillance entail country wide programmes or was it restricted to specific locations? "
data[, 176] <- factor(data[, 176], levels=c("A1","A2","A3"),labels=c("Country wide", "Restricted to specific locations . Please specify where:", "Don’t know"))
names(data)[176] <- "SV28c"
# LimeSurvey Field type: A
data[, 177] <- as.character(data[, 177])
# attributes(data)$variable.labels[177] <- "[Comment] 28c. Did the entomologic surveillance entail country wide programmes or was it restricted to specific locations? "
names(data)[177] <- "SV28c_comment"
# LimeSurvey Field type: F
data[, 178] <- as.numeric(data[, 178])
# attributes(data)$variable.labels[178] <- "28d. How many sentinel surveillance sites do you have?"
names(data)[178] <- "SV28d"
# LimeSurvey Field type: A
data[, 179] <- as.character(data[, 179])
# attributes(data)$variable.labels[179] <- "28e. How often was the surveillance conducted? Please choose one of the following:"
data[, 179] <- factor(data[, 179], levels=c("A1","A2","A3"),labels=c("Once a year", "Every trimester", "Every semester"))
names(data)[179] <- "SV28e"
# LimeSurvey Field type: A
data[, 180] <- as.character(data[, 180])
# attributes(data)$variable.labels[180] <- "[Other] 28e. How often was the surveillance conducted? Please choose one of the following:"
names(data)[180] <- "SV28e_other"
# LimeSurvey Field type: A
data[, 181] <- as.character(data[, 181])
# attributes(data)$variable.labels[181] <- "29. Do you conduct adult mosquito surveillance?"
data[, 181] <- factor(data[, 181], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[181] <- "SV29"
# LimeSurvey Field type: A
data[, 182] <- as.character(data[, 182])
# attributes(data)$variable.labels[182] <- "30. Do you conduct larval/pupal mosquito surveillance?"
data[, 182] <- factor(data[, 182], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[182] <- "SV30"
# LimeSurvey Field type: A
data[, 183] <- as.character(data[, 183])
# attributes(data)$variable.labels[183] <- "31. Are trapped mosquitoes identified to species?"
data[, 183] <- factor(data[, 183], levels=c("A1","A2","A3","A4"),labels=c("Yes", "No", "Not applicable", "I don\'t know"))
names(data)[183] <- "SV31"
# LimeSurvey Field type: A
data[, 184] <- as.character(data[, 184])
# attributes(data)$variable.labels[184] <- "32. Does your country either calculate minimum infection rates (MIR) for any Aedes-borne arboviruses with your mosquito data or receive such data from other agencies?  Please choose only one of the following:"
data[, 184] <- factor(data[, 184], levels=c("A1","A2","A3","A4"),labels=c("Yes, our agency makes the MIR estimations", "Yes, the MIR are estimated by another institution.If so, please specify:", "No", "Don’t know"))
names(data)[184] <- "SV32"
# LimeSurvey Field type: A
data[, 185] <- as.character(data[, 185])
# attributes(data)$variable.labels[185] <- "[Comment] 32. Does your country either calculate minimum infection rates (MIR) for any Aedes-borne arboviruses with your mosquito data or receive such data from other agencies?  Please choose only one of the following:"
names(data)[185] <- "SV32_comment"
# LimeSurvey Field type: F
data[, 186] <- as.numeric(data[, 186])
# attributes(data)$variable.labels[186] <- "[National public health laboratory] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
data[, 186] <- factor(data[, 186], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[186] <- "SV33_SQ001"
# LimeSurvey Field type: F
data[, 187] <- as.numeric(data[, 187])
# attributes(data)$variable.labels[187] <- "[State/provincial/regional public health laboratory] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
data[, 187] <- factor(data[, 187], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[187] <- "SV33_SQ002"
# LimeSurvey Field type: F
data[, 188] <- as.numeric(data[, 188])
# attributes(data)$variable.labels[188] <- "[Local health department laboratory] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
data[, 188] <- factor(data[, 188], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[188] <- "SV33_SQ003"
# LimeSurvey Field type: F
data[, 189] <- as.numeric(data[, 189])
# attributes(data)$variable.labels[189] <- "[University or academic institution] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
data[, 189] <- factor(data[, 189], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[189] <- "SV33_SQ004"
# LimeSurvey Field type: F
data[, 190] <- as.numeric(data[, 190])
# attributes(data)$variable.labels[190] <- "[Local MCD (if different from county health dep’t)] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
data[, 190] <- factor(data[, 190], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[190] <- "SV33_SQ005"
# LimeSurvey Field type: F
data[, 191] <- as.numeric(data[, 191])
# attributes(data)$variable.labels[191] <- "[Mosquito surveillance done, but no testing done on mosquito pools] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
data[, 191] <- factor(data[, 191], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[191] <- "SV33_SQ006"
# LimeSurvey Field type: F
data[, 192] <- as.numeric(data[, 192])
# attributes(data)$variable.labels[192] <- "[Not applicable (no mosquito surveillance done)] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
data[, 192] <- factor(data[, 192], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[192] <- "SV33_SQ007"
# LimeSurvey Field type: A
data[, 193] <- as.character(data[, 193])
# attributes(data)$variable.labels[193] <- "[Other] 33. Which laboratories performed testing for arboviruses on mosquito pools collected in your country in the last two years? (check all that apply)"
names(data)[193] <- "SV33_other"
# LimeSurvey Field type: A
data[, 194] <- as.character(data[, 194])
# attributes(data)$variable.labels[194] <- "34. Is there a record of Aedes aegypti or Aedes albopictus being found in your country in the past 5 years? Please choose only one of the following."
data[, 194] <- factor(data[, 194], levels=c("A1","A2","A3","A4","A5"),labels=c("Yes, only Aedes aegypti", "Yes, only Aedes albopictus", "Yes, both Aedes aegypti and Aedes albopictus", "None found in the country at this time", "Unknown within the country at this time"))
names(data)[194] <- "SV34"
# LimeSurvey Field type: A
data[, 195] <- as.character(data[, 195])
# attributes(data)$variable.labels[195] <- "34b. Please describe the potential public health threat from Aedes aegypti in your country. Please choose only one of the following:"
data[, 195] <- factor(data[, 195], levels=c("A1","A2","A3","A4","A5"),labels=c("Aedes aegypti populations are abundant and arbovirus(es) is (are) circulating", "Aedes aegypti populations are spreading and pose a significant public health threat", "Aedes aegypti populations are restricted to few sites and do not yet pose a significant threat", "Aedes aegypti populations are stable in select areas and pose a significant threat", "Aedes aegypti mosquitoes are only occasionally found and do not pose a significant public health threat"))
names(data)[195] <- "SV34b"
# LimeSurvey Field type: A
data[, 196] <- as.character(data[, 196])
# attributes(data)$variable.labels[196] <- "[Other] 34b. Please describe the potential public health threat from Aedes aegypti in your country. Please choose only one of the following:"
names(data)[196] <- "SV34b_other"
# LimeSurvey Field type: A
data[, 197] <- as.character(data[, 197])
# attributes(data)$variable.labels[197] <- "34c. Please describe the potential public health threat from Aedes albopictus in your country. Please choose only one of the following:"
data[, 197] <- factor(data[, 197], levels=c("A1","A2","A3","A4","A5"),labels=c("Aedes albopictus populations are abundant and arbovirus(es) is (are) circulating", "Aedes albopictus populations are spreading and pose a significant public health threat", "Aedes albopictus populations are restricted to few sites and do not yet pose a significant threat", "Aedes albopictus populations are stable in select areas and pose a significant threat", "Aedes albopictus mosquitoes are only occasionally found and do not pose a significant public health threat"))
names(data)[197] <- "SV34c"
# LimeSurvey Field type: A
data[, 198] <- as.character(data[, 198])
# attributes(data)$variable.labels[198] <- "[Other] 34c. Please describe the potential public health threat from Aedes albopictus in your country. Please choose only one of the following:"
names(data)[198] <- "SV34c_other"
# LimeSurvey Field type: F
data[, 199] <- as.numeric(data[, 199])
# attributes(data)$variable.labels[199] <- "[Adulticiding (insecticide application against adult mosquitoes)] 35. Over the past two years, did your country use any of the following vector control methods in local jurisdictions (either using government staff and resources, or subcontracting to a different entity to do so)? Please select all that apply."
data[, 199] <- factor(data[, 199], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[199] <- "SV35_SQ001"
# LimeSurvey Field type: F
data[, 200] <- as.numeric(data[, 200])
# attributes(data)$variable.labels[200] <- "[Larviciding] 35. Over the past two years, did your country use any of the following vector control methods in local jurisdictions (either using government staff and resources, or subcontracting to a different entity to do so)? Please select all that apply."
data[, 200] <- factor(data[, 200], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[200] <- "SV35_SQ002"
# LimeSurvey Field type: F
data[, 201] <- as.numeric(data[, 201])
# attributes(data)$variable.labels[201] <- "[Insect growth regulators (e.g., pyriproxyfen)] 35. Over the past two years, did your country use any of the following vector control methods in local jurisdictions (either using government staff and resources, or subcontracting to a different entity to do so)? Please select all that apply."
data[, 201] <- factor(data[, 201], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[201] <- "SV35_SQ003"
# LimeSurvey Field type: F
data[, 202] <- as.numeric(data[, 202])
# attributes(data)$variable.labels[202] <- "[Wolbachia method] 35. Over the past two years, did your country use any of the following vector control methods in local jurisdictions (either using government staff and resources, or subcontracting to a different entity to do so)? Please select all that apply."
data[, 202] <- factor(data[, 202], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[202] <- "SV35_SQ004"
# LimeSurvey Field type: F
data[, 203] <- as.numeric(data[, 203])
# attributes(data)$variable.labels[203] <- "[Sterile insect release] 35. Over the past two years, did your country use any of the following vector control methods in local jurisdictions (either using government staff and resources, or subcontracting to a different entity to do so)? Please select all that apply."
data[, 203] <- factor(data[, 203], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[203] <- "SV35_SQ005"
# LimeSurvey Field type: F
data[, 204] <- as.numeric(data[, 204])
# attributes(data)$variable.labels[204] <- "[None] 35. Over the past two years, did your country use any of the following vector control methods in local jurisdictions (either using government staff and resources, or subcontracting to a different entity to do so)? Please select all that apply."
data[, 204] <- factor(data[, 204], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[204] <- "SV35_SQ006"
# LimeSurvey Field type: A
data[, 205] <- as.character(data[, 205])
# attributes(data)$variable.labels[205] <- "[Other] 35. Over the past two years, did your country use any of the following vector control methods in local jurisdictions (either using government staff and resources, or subcontracting to a different entity to do so)? Please select all that apply."
names(data)[205] <- "SV35_other"
# LimeSurvey Field type: A
data[, 206] <- as.character(data[, 206])
# attributes(data)$variable.labels[206] <- "35b. Would your country have conducted or financially supported adulticiding/larviciding or source reduction activities in the last two years if sufficient funding were available?"
data[, 206] <- factor(data[, 206], levels=c("A1","A2","A3"),labels=c("Yes", "No", "Don’t know"))
names(data)[206] <- "SV35b"
# LimeSurvey Field type: A
data[, 207] <- as.character(data[, 207])
# attributes(data)$variable.labels[207] <- "35c. Which adulticides and/or larvicides (brand and product name) were used? "
names(data)[207] <- "SV35c"
# LimeSurvey Field type: A
data[, 208] <- as.character(data[, 208])
# attributes(data)$variable.labels[208] <- "36. Does your country provide regular training sessions for staff in charge of vector control and vector surveillance?"
data[, 208] <- factor(data[, 208], levels=c("A1","A2","A3","A4","A5"),labels=c("Yes, for both", "Yes, only for vector surveillance", "Yes, only for vector control", "No", "Don’t know"))
names(data)[208] <- "SV36"
# LimeSurvey Field type: A
data[, 209] <- as.character(data[, 209])
# attributes(data)$variable.labels[209] <- "37. For the last two years, did your country have a plan for mosquito-borne disease control that includes a threshold (e.g. level of vector mosquito abundance or minimum infection rate) that would result in a recommendation for mosquito adulticiding/other mosquito reduction measures?"
data[, 209] <- factor(data[, 209], levels=c("A1","A5","A3","A4","A6"),labels=c("Yes, have a threshold that does not require concurrent human cases", "Yes, have a threshold that requires concurrent human cases", "No – have a plan but there is no specific threshold", "No – do not have a formal plan that includes adulticiding to control mosquito-borne diseases", "I don\'t know"))
names(data)[209] <- "SV37"
# LimeSurvey Field type: F
data[, 210] <- as.numeric(data[, 210])
# attributes(data)$variable.labels[210] <- "[Concurrent human cases] 37b. Which indicator(s) is(are) used as threshold(s) ?"
data[, 210] <- factor(data[, 210], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[210] <- "SV37b_SQ001"
# LimeSurvey Field type: F
data[, 211] <- as.numeric(data[, 211])
# attributes(data)$variable.labels[211] <- "[Minimum infection rate] 37b. Which indicator(s) is(are) used as threshold(s) ?"
data[, 211] <- factor(data[, 211], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[211] <- "SV37b_SQ002"
# LimeSurvey Field type: F
data[, 212] <- as.numeric(data[, 212])
# attributes(data)$variable.labels[212] <- "[Vector density] 37b. Which indicator(s) is(are) used as threshold(s) ?"
data[, 212] <- factor(data[, 212], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[212] <- "SV37b_SQ003"
# LimeSurvey Field type: F
data[, 213] <- as.numeric(data[, 213])
# attributes(data)$variable.labels[213] <- "[Breteau Index] 37b. Which indicator(s) is(are) used as threshold(s) ?"
data[, 213] <- factor(data[, 213], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[213] <- "SV37b_SQ004"
# LimeSurvey Field type: F
data[, 214] <- as.numeric(data[, 214])
# attributes(data)$variable.labels[214] <- "[House Index] 37b. Which indicator(s) is(are) used as threshold(s) ?"
data[, 214] <- factor(data[, 214], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[214] <- "SV37b_SQ005"
# LimeSurvey Field type: F
data[, 215] <- as.numeric(data[, 215])
# attributes(data)$variable.labels[215] <- "[Container Index] 37b. Which indicator(s) is(are) used as threshold(s) ?"
data[, 215] <- factor(data[, 215], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[215] <- "SV37b_SQ006"
# LimeSurvey Field type: A
data[, 216] <- as.character(data[, 216])
# attributes(data)$variable.labels[216] <- "[Other] 37b. Which indicator(s) is(are) used as threshold(s) ?"
names(data)[216] <- "SV37b_other"
# LimeSurvey Field type: F
data[, 217] <- as.numeric(data[, 217])
# attributes(data)$variable.labels[217] <- "[House Index] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
data[, 217] <- factor(data[, 217], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[217] <- "SV38_SQ001"
# LimeSurvey Field type: F
data[, 218] <- as.numeric(data[, 218])
# attributes(data)$variable.labels[218] <- "[Breteau Index] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
data[, 218] <- factor(data[, 218], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[218] <- "SV38_SQ002"
# LimeSurvey Field type: F
data[, 219] <- as.numeric(data[, 219])
# attributes(data)$variable.labels[219] <- "[Container Index] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
data[, 219] <- factor(data[, 219], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[219] <- "SV38_SQ003"
# LimeSurvey Field type: F
data[, 220] <- as.numeric(data[, 220])
# attributes(data)$variable.labels[220] <- "[Temperatures] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
data[, 220] <- factor(data[, 220], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[220] <- "SV38_SQ004"
# LimeSurvey Field type: F
data[, 221] <- as.numeric(data[, 221])
# attributes(data)$variable.labels[221] <- "[Rainfall] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
data[, 221] <- factor(data[, 221], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[221] <- "SV38_SQ005"
# LimeSurvey Field type: F
data[, 222] <- as.numeric(data[, 222])
# attributes(data)$variable.labels[222] <- "[Migration of a non-immune population] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
data[, 222] <- factor(data[, 222], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[222] <- "SV38_SQ006"
# LimeSurvey Field type: F
data[, 223] <- as.numeric(data[, 223])
# attributes(data)$variable.labels[223] <- "[None] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
data[, 223] <- factor(data[, 223], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[223] <- "SV38_SQ007"
# LimeSurvey Field type: A
data[, 224] <- as.character(data[, 224])
# attributes(data)$variable.labels[224] <- "[Other] 38. Overall, are data on any of the following arboviral outbreak risk factors routinely collected and analysed? (Select all that apply)"
names(data)[224] <- "SV38_other"
# LimeSurvey Field type: A
data[, 225] <- as.character(data[, 225])
# attributes(data)$variable.labels[225] <- "39. Is there a surveillance system in place for monitoring Aedes resistance to the insecticide(s) used?"
data[, 225] <- factor(data[, 225], levels=c("A1","A2","A3"),labels=c("Yes", "No", "Don’t know"))
names(data)[225] <- "SV39"
# LimeSurvey Field type: A
data[, 226] <- as.character(data[, 226])
# attributes(data)$variable.labels[226] <- "40. What do the vector surveillance staff perceive as factors contributing to the a) success and b) barriers/challenges with respect to vector surveillance and control in the country?"
names(data)[226] <- "SV40"
# LimeSurvey Field type: A
data[, 227] <- as.character(data[, 227])
# attributes(data)$variable.labels[227] <- "41. During the last 2 years, did your country conduct national epidemiological surveillance for arboviral disease in animals (e.g., epizootic surveillance for yellow fever in endemic areas)?"
data[, 227] <- factor(data[, 227], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[227] <- "SVI41"
# LimeSurvey Field type: A
data[, 228] <- as.character(data[, 228])
# attributes(data)$variable.labels[228] <- "41b. How often was the animal surveillance conducted? "
data[, 228] <- factor(data[, 228], levels=c("A1","A2","A3"),labels=c("Once a year", "Every trimester", "Every semester"))
names(data)[228] <- "SVI41b"
# LimeSurvey Field type: A
data[, 229] <- as.character(data[, 229])
# attributes(data)$variable.labels[229] <- "[Other] 41b. How often was the animal surveillance conducted? "
names(data)[229] <- "SVI41b_other"
# LimeSurvey Field type: A
data[, 230] <- as.character(data[, 230])
# attributes(data)$variable.labels[230] <- "41c. What type of surveillance was conducted in animals?      Definitions:   	Active surveillance is defined as having dedicated systems and staff that routinely and with effort survey for cases of disease or detection of vectors and associated pathogens by the public health department. 	Passive surveillance is defined as having a reporting system where physicians, laboratories, mosquito control districts, academic institutions or others routinely report cases of disease or detection of vectors and associated pathogens to the public health department."
data[, 230] <- factor(data[, 230], levels=c("A1","A2","A3"),labels=c("Primarily active", "Primarily passive", "Combination of active and passive"))
names(data)[230] <- "SVI41c"
# LimeSurvey Field type: A
data[, 231] <- as.character(data[, 231])
# attributes(data)$variable.labels[231] <- "41d. Please upload a report on the animal surveillance. "
names(data)[231] <- "SVI41d"
# LimeSurvey Field type: A
data[, 232] <- as.character(data[, 232])
# attributes(data)$variable.labels[232] <- "filecount - 41d. Please upload a report on the animal surveillance. "
names(data)[232] <- "SVI41d__filecount"
# LimeSurvey Field type: A
data[, 233] <- as.character(data[, 233])
# attributes(data)$variable.labels[233] <- "42. Does your country (or local jurisdictions within the country) perform sentinel animal surveillance or epizootic surveillance, e.g., for yellow fever in nonhuman primates in endemic regions? "
data[, 233] <- factor(data[, 233], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[233] <- "SVI42"
# LimeSurvey Field type: A
data[, 234] <- as.character(data[, 234])
# attributes(data)$variable.labels[234] <- "[Arbovirus 1] [Virus name] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[234] <- "SVI42b_SQ001_SQ001"
# LimeSurvey Field type: A
data[, 235] <- as.character(data[, 235])
# attributes(data)$variable.labels[235] <- "[Arbovirus 1] [Sentinel animal species (list all)] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[235] <- "SVI42b_SQ001_SQ002"
# LimeSurvey Field type: A
data[, 236] <- as.character(data[, 236])
# attributes(data)$variable.labels[236] <- "[Arbovirus 2] [Virus name] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[236] <- "SVI42b_SQ002_SQ001"
# LimeSurvey Field type: A
data[, 237] <- as.character(data[, 237])
# attributes(data)$variable.labels[237] <- "[Arbovirus 2] [Sentinel animal species (list all)] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[237] <- "SVI42b_SQ002_SQ002"
# LimeSurvey Field type: A
data[, 238] <- as.character(data[, 238])
# attributes(data)$variable.labels[238] <- "[Arbovirus 3] [Virus name] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[238] <- "SVI42b_SQ003_SQ001"
# LimeSurvey Field type: A
data[, 239] <- as.character(data[, 239])
# attributes(data)$variable.labels[239] <- "[Arbovirus 3] [Sentinel animal species (list all)] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[239] <- "SVI42b_SQ003_SQ002"
# LimeSurvey Field type: A
data[, 240] <- as.character(data[, 240])
# attributes(data)$variable.labels[240] <- "[Arbovirus 4] [Virus name] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[240] <- "SVI42b_SQ004_SQ001"
# LimeSurvey Field type: A
data[, 241] <- as.character(data[, 241])
# attributes(data)$variable.labels[241] <- "[Arbovirus 4] [Sentinel animal species (list all)] 42b. For which viruses is sentinel surveillance conducted and in which animal species?"
names(data)[241] <- "SVI42b_SQ004_SQ002"
# LimeSurvey Field type: A
data[, 242] <- as.character(data[, 242])
# attributes(data)$variable.labels[242] <- "42c. Please upload the most recent report(s) on sentinel animal surveillance."
names(data)[242] <- "SVI42c"
# LimeSurvey Field type: A
data[, 243] <- as.character(data[, 243])
# attributes(data)$variable.labels[243] <- "filecount - 42c. Please upload the most recent report(s) on sentinel animal surveillance."
names(data)[243] <- "SVI42c__filecount"
# LimeSurvey Field type: A
data[, 244] <- as.character(data[, 244])
# attributes(data)$variable.labels[244] <- "43. Does your country have a community outreach program that also covers arboviral diseases?"
data[, 244] <- factor(data[, 244], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[244] <- "SVII43"
# LimeSurvey Field type: A
data[, 245] <- as.character(data[, 245])
# attributes(data)$variable.labels[245] <- "43b. What entity(ies) is(are) in charge of the outreach program in your country ?"
names(data)[245] <- "SVII43b"
# LimeSurvey Field type: A
data[, 246] <- as.character(data[, 246])
# attributes(data)$variable.labels[246] <- "43c. What is the geographical coverage of the outreach program in your country?"
data[, 246] <- factor(data[, 246], levels=c("A1","A2","A3","A4"),labels=c("Countrywide", "Only selected areas. Please specify where:", "No outreach programme", "I don\'t know"))
names(data)[246] <- "SVII43c"
# LimeSurvey Field type: A
data[, 247] <- as.character(data[, 247])
# attributes(data)$variable.labels[247] <- "[Comment] 43c. What is the geographical coverage of the outreach program in your country?"
names(data)[247] <- "SVII43c_comment"
# LimeSurvey Field type: A
data[, 248] <- as.character(data[, 248])
# attributes(data)$variable.labels[248] <- "43d. Is the community outreach/social mobilization program sufficiently funded to cover staff time, prevention and outreach activities as needed?"
data[, 248] <- factor(data[, 248], levels=c("A1","A2","A3"),labels=c("Yes", "No", "Don\'t know"))
names(data)[248] <- "SVII43d"
# LimeSurvey Field type: F
data[, 249] <- as.numeric(data[, 249])
# attributes(data)$variable.labels[249] <- "[Educational materials for the public ] 43e. Which resources would help ensure adequate capacity?"
data[, 249] <- factor(data[, 249], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[249] <- "SVII43e_SQ001"
# LimeSurvey Field type: F
data[, 250] <- as.numeric(data[, 250])
# attributes(data)$variable.labels[250] <- "[Educational and reference materials for providers ] 43e. Which resources would help ensure adequate capacity?"
data[, 250] <- factor(data[, 250], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[250] <- "SVII43e_SQ002"
# LimeSurvey Field type: F
data[, 251] <- as.numeric(data[, 251])
# attributes(data)$variable.labels[251] <- "[Educational and reference materials for local health departments  ] 43e. Which resources would help ensure adequate capacity?"
data[, 251] <- factor(data[, 251], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[251] <- "SVII43e_SQ003"
# LimeSurvey Field type: F
data[, 252] <- as.numeric(data[, 252])
# attributes(data)$variable.labels[252] <- "[Additional staff  ] 43e. Which resources would help ensure adequate capacity?"
data[, 252] <- factor(data[, 252], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[252] <- "SVII43e_SQ004"
# LimeSurvey Field type: F
data[, 253] <- as.numeric(data[, 253])
# attributes(data)$variable.labels[253] <- "[Staff training   ] 43e. Which resources would help ensure adequate capacity?"
data[, 253] <- factor(data[, 253], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[253] <- "SVII43e_SQ005"
# LimeSurvey Field type: A
data[, 254] <- as.character(data[, 254])
# attributes(data)$variable.labels[254] <- "[Other] 43e. Which resources would help ensure adequate capacity?"
names(data)[254] <- "SVII43e_other"
# LimeSurvey Field type: F
data[, 255] <- as.numeric(data[, 255])
# attributes(data)$variable.labels[255] <- "[During outbreaks] [Issued by national public health agency] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 255] <- factor(data[, 255], levels=c(1,0),labels=c("1", "0"))
names(data)[255] <- "SVII44_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 256] <- as.numeric(data[, 256])
# attributes(data)$variable.labels[256] <- "[During outbreaks] [Issued by state/local health agencies] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 256] <- factor(data[, 256], levels=c(1,0),labels=c("1", "0"))
names(data)[256] <- "SVII44_SQ001_SQ002"
# LimeSurvey Field type: F
data[, 257] <- as.numeric(data[, 257])
# attributes(data)$variable.labels[257] <- "[During outbreaks] [No risk in the past two years] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 257] <- factor(data[, 257], levels=c(1,0),labels=c("1", "0"))
names(data)[257] <- "SVII44_SQ001_SQ003"
# LimeSurvey Field type: F
data[, 258] <- as.numeric(data[, 258])
# attributes(data)$variable.labels[258] <- "[During outbreaks] [No notifications even though risk was present] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 258] <- factor(data[, 258], levels=c(1,0),labels=c("1", "0"))
names(data)[258] <- "SVII44_SQ001_SQ004"
# LimeSurvey Field type: F
data[, 259] <- as.numeric(data[, 259])
# attributes(data)$variable.labels[259] <- "[During non-outbreak periods] [Issued by national public health agency] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 259] <- factor(data[, 259], levels=c(1,0),labels=c("1", "0"))
names(data)[259] <- "SVII44_SQ002_SQ001"
# LimeSurvey Field type: F
data[, 260] <- as.numeric(data[, 260])
# attributes(data)$variable.labels[260] <- "[During non-outbreak periods] [Issued by state/local health agencies] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 260] <- factor(data[, 260], levels=c(1,0),labels=c("1", "0"))
names(data)[260] <- "SVII44_SQ002_SQ002"
# LimeSurvey Field type: F
data[, 261] <- as.numeric(data[, 261])
# attributes(data)$variable.labels[261] <- "[During non-outbreak periods] [No risk in the past two years] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 261] <- factor(data[, 261], levels=c(1,0),labels=c("1", "0"))
names(data)[261] <- "SVII44_SQ002_SQ003"
# LimeSurvey Field type: F
data[, 262] <- as.numeric(data[, 262])
# attributes(data)$variable.labels[262] <- "[During non-outbreak periods] [No notifications even though risk was present] 44. Did your national arboviral disease program issue notifications to the public about local transmission risk and/or possible vector-control activities (e.g. larviciding, adulticiding, community mobilization and participation, etc.) as a prevention message for arboviral diseases within last 2 years? (Check all that apply)"
data[, 262] <- factor(data[, 262], levels=c(1,0),labels=c("1", "0"))
names(data)[262] <- "SVII44_SQ002_SQ004"
# LimeSurvey Field type: F
data[, 263] <- as.numeric(data[, 263])
# attributes(data)$variable.labels[263] <- "[Press releases to electronic and printed media  ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 263] <- factor(data[, 263], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[263] <- "SVII44b_SQ001"
# LimeSurvey Field type: F
data[, 264] <- as.numeric(data[, 264])
# attributes(data)$variable.labels[264] <- "[Public service announcements on television or radio  ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 264] <- factor(data[, 264], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[264] <- "SVII44b_SQ002"
# LimeSurvey Field type: F
data[, 265] <- as.numeric(data[, 265])
# attributes(data)$variable.labels[265] <- "[Passive distribution of informational brochures  ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 265] <- factor(data[, 265], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[265] <- "SVII44b_SQ003"
# LimeSurvey Field type: F
data[, 266] <- as.numeric(data[, 266])
# attributes(data)$variable.labels[266] <- "[Active distribution of informational brochures  ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 266] <- factor(data[, 266], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[266] <- "SVII44b_SQ004"
# LimeSurvey Field type: F
data[, 267] <- as.numeric(data[, 267])
# attributes(data)$variable.labels[267] <- "[Town, community, or neighborhood meetings  ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 267] <- factor(data[, 267], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[267] <- "SVII44b_SQ005"
# LimeSurvey Field type: F
data[, 268] <- as.numeric(data[, 268])
# attributes(data)$variable.labels[268] <- "[Posting information on the home page of your agency’s website ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 268] <- factor(data[, 268], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[268] <- "SVII44b_SQ006"
# LimeSurvey Field type: F
data[, 269] <- as.numeric(data[, 269])
# attributes(data)$variable.labels[269] <- "[Social media outlets (Facebook, Twitter, etc)  ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 269] <- factor(data[, 269], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[269] <- "SVII44b_SQ007"
# LimeSurvey Field type: F
data[, 270] <- as.numeric(data[, 270])
# attributes(data)$variable.labels[270] <- "[Door-to-door outreach in selected locations  ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 270] <- factor(data[, 270], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[270] <- "SVII44b_SQ008"
# LimeSurvey Field type: F
data[, 271] <- as.numeric(data[, 271])
# attributes(data)$variable.labels[271] <- "[Participation in community clean-ups ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 271] <- factor(data[, 271], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[271] <- "SVII44b_SQ009"
# LimeSurvey Field type: F
data[, 272] <- as.numeric(data[, 272])
# attributes(data)$variable.labels[272] <- "[Modification of messages for all local languages   ] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
data[, 272] <- factor(data[, 272], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[272] <- "SVII44b_SQ010"
# LimeSurvey Field type: A
data[, 273] <- as.character(data[, 273])
# attributes(data)$variable.labels[273] <- "[Other] 44b. Which means does your program use for community sensitization, mobilisation and acceptance of interventions in your country? (Check all that apply)"
names(data)[273] <- "SVII44b_other"
# LimeSurvey Field type: A
data[, 274] <- as.character(data[, 274])
# attributes(data)$variable.labels[274] <- "45. Does your country provide regular training sessions for staff in charge of community sensitization, mobilisation and acceptance of interventions dedicated to control arboviral diseases?"
data[, 274] <- factor(data[, 274], levels=c("A1","A2","A3"),labels=c("Yes. If yes, please describe in comments field:", "No", "I don\'t know"))
names(data)[274] <- "SVII45"
# LimeSurvey Field type: A
data[, 275] <- as.character(data[, 275])
# attributes(data)$variable.labels[275] <- "[Comment] 45. Does your country provide regular training sessions for staff in charge of community sensitization, mobilisation and acceptance of interventions dedicated to control arboviral diseases?"
names(data)[275] <- "SVII45_comment"
# LimeSurvey Field type: A
data[, 276] <- as.character(data[, 276])
# attributes(data)$variable.labels[276] <- "46. What do the community outreach staff perceive as factors contributing to the a) success and b) barriers/challenges with respect to community participation."
names(data)[276] <- "SVII46"
# LimeSurvey Field type: A
data[, 277] <- as.character(data[, 277])
# attributes(data)$variable.labels[277] <- "47. Is there either a surveillance and outbreak response committee in your country, or a steering committee for that purpose?"
data[, 277] <- factor(data[, 277], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[277] <- "SVIII47"
# LimeSurvey Field type: A
data[, 278] <- as.character(data[, 278])
# attributes(data)$variable.labels[278] <- "48. Does your country have a contingency plan to organize healthcare services during an outbreak (including outbreaks of arboviral diseases)?"
data[, 278] <- factor(data[, 278], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[278] <- "SVIII48"
# LimeSurvey Field type: A
data[, 279] <- as.character(data[, 279])
# attributes(data)$variable.labels[279] <- "48b. Please upload the contingency plan."
names(data)[279] <- "SVIII48b"
# LimeSurvey Field type: A
data[, 280] <- as.character(data[, 280])
# attributes(data)$variable.labels[280] <- "filecount - 48b. Please upload the contingency plan."
names(data)[280] <- "SVIII48b__filecount"
# LimeSurvey Field type: A
data[, 281] <- as.character(data[, 281])
# attributes(data)$variable.labels[281] <- "49. Are there defined or established criteria for declaring an outbreak of arboviral disease outbreak in your country?"
data[, 281] <- factor(data[, 281], levels=c("A1","A2","A3"),labels=c("Yes. If so, in the comments field, please briefly describe the criteria or reference the document in which those are sta", "No", "I don\'t know"))
names(data)[281] <- "SVIII49"
# LimeSurvey Field type: A
data[, 282] <- as.character(data[, 282])
# attributes(data)$variable.labels[282] <- "[Comment] 49. Are there defined or established criteria for declaring an outbreak of arboviral disease outbreak in your country?"
names(data)[282] <- "SVIII49_comment"
# LimeSurvey Field type: A
data[, 283] <- as.character(data[, 283])
# attributes(data)$variable.labels[283] <- "50. Do you have established collaborations with national/regional research institutions / international agencies that are planned to be activated in case of arboviral outbreak?"
data[, 283] <- factor(data[, 283], levels=c("A1","A2","A3"),labels=c("Yes. If so, please specify institutions/agencies in the comments field:", "No", "I don\'t know"))
names(data)[283] <- "SVIII50"
# LimeSurvey Field type: A
data[, 284] <- as.character(data[, 284])
# attributes(data)$variable.labels[284] <- "[Comment] 50. Do you have established collaborations with national/regional research institutions / international agencies that are planned to be activated in case of arboviral outbreak?"
names(data)[284] <- "SVIII50_comment"
# LimeSurvey Field type: A
data[, 285] <- as.character(data[, 285])
# attributes(data)$variable.labels[285] <- "51. What vector control interventions are deployed in case of an emergency?"
names(data)[285] <- "SVIII51"
# LimeSurvey Field type: F
data[, 286] <- as.numeric(data[, 286])
# attributes(data)$variable.labels[286] <- "[National level] 52. For the last 2 years, which of the following government levels had an emergency fund or a specified emergency funding mechanism for arbovirus outbreak response?"
data[, 286] <- factor(data[, 286], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[286] <- "SVIII52_SQ001"
# LimeSurvey Field type: F
data[, 287] <- as.numeric(data[, 287])
# attributes(data)$variable.labels[287] <- "[State/local level] 52. For the last 2 years, which of the following government levels had an emergency fund or a specified emergency funding mechanism for arbovirus outbreak response?"
data[, 287] <- factor(data[, 287], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[287] <- "SVIII52_SQ003"
# LimeSurvey Field type: F
data[, 288] <- as.numeric(data[, 288])
# attributes(data)$variable.labels[288] <- "[None] 52. For the last 2 years, which of the following government levels had an emergency fund or a specified emergency funding mechanism for arbovirus outbreak response?"
data[, 288] <- factor(data[, 288], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[288] <- "SVIII52_SQ002"
# LimeSurvey Field type: A
data[, 289] <- as.character(data[, 289])
# attributes(data)$variable.labels[289] <- "53. Does your country provide regular training sessions for staff/committee in charge of preparedness for arboviral outbreaks/epidemics?"
data[, 289] <- factor(data[, 289], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[289] <- "SVIII53"
# LimeSurvey Field type: A
data[, 290] <- as.character(data[, 290])
# attributes(data)$variable.labels[290] <- "54. What do the arboviral disease surveillance staff perceive as factors contributing to the a) success and b) barriers/challenges with respect to preparedness of arboviral diseases epidemics in your country?"
names(data)[290] <- "SVIII54"
# LimeSurvey Field type: F
data[, 291] <- as.numeric(data[, 291])
# attributes(data)$variable.labels[291] <- "[Dengue] [2015 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[291] <- "SIX55_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 292] <- as.numeric(data[, 292])
# attributes(data)$variable.labels[292] <- "[Dengue] [2015 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[292] <- "SIX55_SQ001_SQ002"
# LimeSurvey Field type: F
data[, 293] <- as.numeric(data[, 293])
# attributes(data)$variable.labels[293] <- "[Dengue] [2016 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[293] <- "SIX55_SQ001_SQ003"
# LimeSurvey Field type: F
data[, 294] <- as.numeric(data[, 294])
# attributes(data)$variable.labels[294] <- "[Dengue] [2016 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[294] <- "SIX55_SQ001_SQ004"
# LimeSurvey Field type: F
data[, 295] <- as.numeric(data[, 295])
# attributes(data)$variable.labels[295] <- "[Dengue] [2017 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[295] <- "SIX55_SQ001_SQ005"
# LimeSurvey Field type: F
data[, 296] <- as.numeric(data[, 296])
# attributes(data)$variable.labels[296] <- "[Dengue] [2017 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[296] <- "SIX55_SQ001_SQ006"
# LimeSurvey Field type: F
data[, 297] <- as.numeric(data[, 297])
# attributes(data)$variable.labels[297] <- "[Dengue] [2018 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[297] <- "SIX55_SQ001_SQ007"
# LimeSurvey Field type: F
data[, 298] <- as.numeric(data[, 298])
# attributes(data)$variable.labels[298] <- "[Dengue] [2018 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[298] <- "SIX55_SQ001_SQ008"
# LimeSurvey Field type: F
data[, 299] <- as.numeric(data[, 299])
# attributes(data)$variable.labels[299] <- "[Dengue] [2019 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[299] <- "SIX55_SQ001_SQ010"
# LimeSurvey Field type: F
data[, 300] <- as.numeric(data[, 300])
# attributes(data)$variable.labels[300] <- "[Dengue] [2019 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[300] <- "SIX55_SQ001_SQ009"
# LimeSurvey Field type: F
data[, 301] <- as.numeric(data[, 301])
# attributes(data)$variable.labels[301] <- "[Dengue] [2020 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[301] <- "SIX55_SQ001_SQ011"
# LimeSurvey Field type: F
data[, 302] <- as.numeric(data[, 302])
# attributes(data)$variable.labels[302] <- "[Dengue] [2020 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[302] <- "SIX55_SQ001_SQ012"
# LimeSurvey Field type: F
data[, 303] <- as.numeric(data[, 303])
# attributes(data)$variable.labels[303] <- "[Chikungunya] [2015 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[303] <- "SIX55_SQ002_SQ001"
# LimeSurvey Field type: F
data[, 304] <- as.numeric(data[, 304])
# attributes(data)$variable.labels[304] <- "[Chikungunya] [2015 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[304] <- "SIX55_SQ002_SQ002"
# LimeSurvey Field type: F
data[, 305] <- as.numeric(data[, 305])
# attributes(data)$variable.labels[305] <- "[Chikungunya] [2016 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[305] <- "SIX55_SQ002_SQ003"
# LimeSurvey Field type: F
data[, 306] <- as.numeric(data[, 306])
# attributes(data)$variable.labels[306] <- "[Chikungunya] [2016 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[306] <- "SIX55_SQ002_SQ004"
# LimeSurvey Field type: F
data[, 307] <- as.numeric(data[, 307])
# attributes(data)$variable.labels[307] <- "[Chikungunya] [2017 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[307] <- "SIX55_SQ002_SQ005"
# LimeSurvey Field type: F
data[, 308] <- as.numeric(data[, 308])
# attributes(data)$variable.labels[308] <- "[Chikungunya] [2017 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[308] <- "SIX55_SQ002_SQ006"
# LimeSurvey Field type: F
data[, 309] <- as.numeric(data[, 309])
# attributes(data)$variable.labels[309] <- "[Chikungunya] [2018 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[309] <- "SIX55_SQ002_SQ007"
# LimeSurvey Field type: F
data[, 310] <- as.numeric(data[, 310])
# attributes(data)$variable.labels[310] <- "[Chikungunya] [2018 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[310] <- "SIX55_SQ002_SQ008"
# LimeSurvey Field type: F
data[, 311] <- as.numeric(data[, 311])
# attributes(data)$variable.labels[311] <- "[Chikungunya] [2019 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[311] <- "SIX55_SQ002_SQ010"
# LimeSurvey Field type: F
data[, 312] <- as.numeric(data[, 312])
# attributes(data)$variable.labels[312] <- "[Chikungunya] [2019 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[312] <- "SIX55_SQ002_SQ009"
# LimeSurvey Field type: F
data[, 313] <- as.numeric(data[, 313])
# attributes(data)$variable.labels[313] <- "[Chikungunya] [2020 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[313] <- "SIX55_SQ002_SQ011"
# LimeSurvey Field type: F
data[, 314] <- as.numeric(data[, 314])
# attributes(data)$variable.labels[314] <- "[Chikungunya] [2020 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[314] <- "SIX55_SQ002_SQ012"
# LimeSurvey Field type: F
data[, 315] <- as.numeric(data[, 315])
# attributes(data)$variable.labels[315] <- "[Yellow fever] [2015 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[315] <- "SIX55_SQ003_SQ001"
# LimeSurvey Field type: F
data[, 316] <- as.numeric(data[, 316])
# attributes(data)$variable.labels[316] <- "[Yellow fever] [2015 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[316] <- "SIX55_SQ003_SQ002"
# LimeSurvey Field type: F
data[, 317] <- as.numeric(data[, 317])
# attributes(data)$variable.labels[317] <- "[Yellow fever] [2016 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[317] <- "SIX55_SQ003_SQ003"
# LimeSurvey Field type: F
data[, 318] <- as.numeric(data[, 318])
# attributes(data)$variable.labels[318] <- "[Yellow fever] [2016 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[318] <- "SIX55_SQ003_SQ004"
# LimeSurvey Field type: F
data[, 319] <- as.numeric(data[, 319])
# attributes(data)$variable.labels[319] <- "[Yellow fever] [2017 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[319] <- "SIX55_SQ003_SQ005"
# LimeSurvey Field type: F
data[, 320] <- as.numeric(data[, 320])
# attributes(data)$variable.labels[320] <- "[Yellow fever] [2017 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[320] <- "SIX55_SQ003_SQ006"
# LimeSurvey Field type: F
data[, 321] <- as.numeric(data[, 321])
# attributes(data)$variable.labels[321] <- "[Yellow fever] [2018 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[321] <- "SIX55_SQ003_SQ007"
# LimeSurvey Field type: F
data[, 322] <- as.numeric(data[, 322])
# attributes(data)$variable.labels[322] <- "[Yellow fever] [2018 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[322] <- "SIX55_SQ003_SQ008"
# LimeSurvey Field type: F
data[, 323] <- as.numeric(data[, 323])
# attributes(data)$variable.labels[323] <- "[Yellow fever] [2019 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[323] <- "SIX55_SQ003_SQ010"
# LimeSurvey Field type: F
data[, 324] <- as.numeric(data[, 324])
# attributes(data)$variable.labels[324] <- "[Yellow fever] [2019 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[324] <- "SIX55_SQ003_SQ009"
# LimeSurvey Field type: F
data[, 325] <- as.numeric(data[, 325])
# attributes(data)$variable.labels[325] <- "[Yellow fever] [2020 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[325] <- "SIX55_SQ003_SQ011"
# LimeSurvey Field type: F
data[, 326] <- as.numeric(data[, 326])
# attributes(data)$variable.labels[326] <- "[Yellow fever] [2020 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[326] <- "SIX55_SQ003_SQ012"
# LimeSurvey Field type: F
data[, 327] <- as.numeric(data[, 327])
# attributes(data)$variable.labels[327] <- "[Zika] [2015 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[327] <- "SIX55_SQ004_SQ001"
# LimeSurvey Field type: F
data[, 328] <- as.numeric(data[, 328])
# attributes(data)$variable.labels[328] <- "[Zika] [2015 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[328] <- "SIX55_SQ004_SQ002"
# LimeSurvey Field type: F
data[, 329] <- as.numeric(data[, 329])
# attributes(data)$variable.labels[329] <- "[Zika] [2016 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[329] <- "SIX55_SQ004_SQ003"
# LimeSurvey Field type: F
data[, 330] <- as.numeric(data[, 330])
# attributes(data)$variable.labels[330] <- "[Zika] [2016 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[330] <- "SIX55_SQ004_SQ004"
# LimeSurvey Field type: F
data[, 331] <- as.numeric(data[, 331])
# attributes(data)$variable.labels[331] <- "[Zika] [2017 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[331] <- "SIX55_SQ004_SQ005"
# LimeSurvey Field type: F
data[, 332] <- as.numeric(data[, 332])
# attributes(data)$variable.labels[332] <- "[Zika] [2017 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[332] <- "SIX55_SQ004_SQ006"
# LimeSurvey Field type: F
data[, 333] <- as.numeric(data[, 333])
# attributes(data)$variable.labels[333] <- "[Zika] [2018 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[333] <- "SIX55_SQ004_SQ007"
# LimeSurvey Field type: F
data[, 334] <- as.numeric(data[, 334])
# attributes(data)$variable.labels[334] <- "[Zika] [2018 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[334] <- "SIX55_SQ004_SQ008"
# LimeSurvey Field type: F
data[, 335] <- as.numeric(data[, 335])
# attributes(data)$variable.labels[335] <- "[Zika] [2019 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[335] <- "SIX55_SQ004_SQ010"
# LimeSurvey Field type: F
data[, 336] <- as.numeric(data[, 336])
# attributes(data)$variable.labels[336] <- "[Zika] [2019 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[336] <- "SIX55_SQ004_SQ009"
# LimeSurvey Field type: F
data[, 337] <- as.numeric(data[, 337])
# attributes(data)$variable.labels[337] <- "[Zika] [2020 Cases] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[337] <- "SIX55_SQ004_SQ011"
# LimeSurvey Field type: F
data[, 338] <- as.numeric(data[, 338])
# attributes(data)$variable.labels[338] <- "[Zika] [2020 Deaths] 55. Please provide total number of cases and deaths for the following arboviral diseases from 2015 to 2020 (if available)."
names(data)[338] <- "SIX55_SQ004_SQ012"
# LimeSurvey Field type: A
data[, 339] <- as.character(data[, 339])
# attributes(data)$variable.labels[339] <- "55b. Were cases of other mosquito-borne arboviruses, not listed in the previous question, reported in your country from 2015-2020?"
data[, 339] <- factor(data[, 339], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don\'t know"))
names(data)[339] <- "SIX55b"
# LimeSurvey Field type: F
data[, 340] <- as.numeric(data[, 340])
# attributes(data)$variable.labels[340] <- "[Barmah forest] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 340] <- factor(data[, 340], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[340] <- "SIX55c_SQ001"
# LimeSurvey Field type: F
data[, 341] <- as.numeric(data[, 341])
# attributes(data)$variable.labels[341] <- "[Bwamba ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 341] <- factor(data[, 341], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[341] <- "SIX55c_SQ002"
# LimeSurvey Field type: F
data[, 342] <- as.numeric(data[, 342])
# attributes(data)$variable.labels[342] <- "[Cache valley] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 342] <- factor(data[, 342], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[342] <- "SIX55c_SQ003"
# LimeSurvey Field type: F
data[, 343] <- as.numeric(data[, 343])
# attributes(data)$variable.labels[343] <- "[California encephalitis] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 343] <- factor(data[, 343], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[343] <- "SIX55c_SQ004"
# LimeSurvey Field type: F
data[, 344] <- as.numeric(data[, 344])
# attributes(data)$variable.labels[344] <- "[Chandipura] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 344] <- factor(data[, 344], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[344] <- "SIX55c_SQ005"
# LimeSurvey Field type: F
data[, 345] <- as.numeric(data[, 345])
# attributes(data)$variable.labels[345] <- "[Eastern equine encephalitis] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 345] <- factor(data[, 345], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[345] <- "SIX55c_SQ006"
# LimeSurvey Field type: F
data[, 346] <- as.numeric(data[, 346])
# attributes(data)$variable.labels[346] <- "[Everglades virus] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 346] <- factor(data[, 346], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[346] <- "SIX55c_SQ007"
# LimeSurvey Field type: F
data[, 347] <- as.numeric(data[, 347])
# attributes(data)$variable.labels[347] <- "[Eyach ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 347] <- factor(data[, 347], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[347] <- "SIX55c_SQ008"
# LimeSurvey Field type: F
data[, 348] <- as.numeric(data[, 348])
# attributes(data)$variable.labels[348] <- "[Inkoo] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 348] <- factor(data[, 348], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[348] <- "SIX55c_SQ009"
# LimeSurvey Field type: F
data[, 349] <- as.numeric(data[, 349])
# attributes(data)$variable.labels[349] <- "[Jamestown Canyon ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 349] <- factor(data[, 349], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[349] <- "SIX55c_SQ010"
# LimeSurvey Field type: F
data[, 350] <- as.numeric(data[, 350])
# attributes(data)$variable.labels[350] <- "[Japanese encephalitis] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 350] <- factor(data[, 350], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[350] <- "SIX55c_SQ011"
# LimeSurvey Field type: F
data[, 351] <- as.numeric(data[, 351])
# attributes(data)$variable.labels[351] <- "[Kunjin] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 351] <- factor(data[, 351], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[351] <- "SIX55c_SQ012"
# LimeSurvey Field type: F
data[, 352] <- as.numeric(data[, 352])
# attributes(data)$variable.labels[352] <- "[Kyasanur Forest] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 352] <- factor(data[, 352], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[352] <- "SIX55c_SQ013"
# LimeSurvey Field type: F
data[, 353] <- as.numeric(data[, 353])
# attributes(data)$variable.labels[353] <- "[La Crosse ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 353] <- factor(data[, 353], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[353] <- "SIX55c_SQ014"
# LimeSurvey Field type: F
data[, 354] <- as.numeric(data[, 354])
# attributes(data)$variable.labels[354] <- "[Mayaro ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 354] <- factor(data[, 354], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[354] <- "SIX55c_SQ015"
# LimeSurvey Field type: F
data[, 355] <- as.numeric(data[, 355])
# attributes(data)$variable.labels[355] <- "[Murray Valley encephalitis] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 355] <- factor(data[, 355], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[355] <- "SIX55c_SQ016"
# LimeSurvey Field type: F
data[, 356] <- as.numeric(data[, 356])
# attributes(data)$variable.labels[356] <- "[O\'nyong-nyong] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 356] <- factor(data[, 356], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[356] <- "SIX55c_SQ017"
# LimeSurvey Field type: F
data[, 357] <- as.numeric(data[, 357])
# attributes(data)$variable.labels[357] <- "[Oropouche] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 357] <- factor(data[, 357], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[357] <- "SIX55c_SQ018"
# LimeSurvey Field type: F
data[, 358] <- as.numeric(data[, 358])
# attributes(data)$variable.labels[358] <- "[Rift Valley fever] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 358] <- factor(data[, 358], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[358] <- "SIX55c_SQ019"
# LimeSurvey Field type: F
data[, 359] <- as.numeric(data[, 359])
# attributes(data)$variable.labels[359] <- "[Semliki Forest] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 359] <- factor(data[, 359], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[359] <- "SIX55c_SQ020"
# LimeSurvey Field type: F
data[, 360] <- as.numeric(data[, 360])
# attributes(data)$variable.labels[360] <- "[Sindbis ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 360] <- factor(data[, 360], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[360] <- "SIX55c_SQ021"
# LimeSurvey Field type: F
data[, 361] <- as.numeric(data[, 361])
# attributes(data)$variable.labels[361] <- "[Snowshoe hare ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 361] <- factor(data[, 361], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[361] <- "SIX55c_SQ022"
# LimeSurvey Field type: F
data[, 362] <- as.numeric(data[, 362])
# attributes(data)$variable.labels[362] <- "[Spondweni ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 362] <- factor(data[, 362], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[362] <- "SIX55c_SQ023"
# LimeSurvey Field type: F
data[, 363] <- as.numeric(data[, 363])
# attributes(data)$variable.labels[363] <- "[St Louis encephalitis] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 363] <- factor(data[, 363], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[363] <- "SIX55c_SQ024"
# LimeSurvey Field type: F
data[, 364] <- as.numeric(data[, 364])
# attributes(data)$variable.labels[364] <- "[Thogoto ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 364] <- factor(data[, 364], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[364] <- "SIX55c_SQ025"
# LimeSurvey Field type: F
data[, 365] <- as.numeric(data[, 365])
# attributes(data)$variable.labels[365] <- "[Trivittatus ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 365] <- factor(data[, 365], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[365] <- "SIX55c_SQ026"
# LimeSurvey Field type: F
data[, 366] <- as.numeric(data[, 366])
# attributes(data)$variable.labels[366] <- "[Usutu] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 366] <- factor(data[, 366], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[366] <- "SIX55c_SQ027"
# LimeSurvey Field type: F
data[, 367] <- as.numeric(data[, 367])
# attributes(data)$variable.labels[367] <- "[Venezuelan equine encephalitis] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 367] <- factor(data[, 367], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[367] <- "SIX55c_SQ028"
# LimeSurvey Field type: F
data[, 368] <- as.numeric(data[, 368])
# attributes(data)$variable.labels[368] <- "[West Nile ] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 368] <- factor(data[, 368], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[368] <- "SIX55c_SQ029"
# LimeSurvey Field type: F
data[, 369] <- as.numeric(data[, 369])
# attributes(data)$variable.labels[369] <- "[Western equine encephalitis] 55c. Please select any of the following other mosquito-borne viruses that have been reported in your country from 2015-2020. (Note - these are any mosquito-borne arboviruses that cause human disease, not just Aedes-borne viruses)"
data[, 369] <- factor(data[, 369], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[369] <- "SIX55c_SQ030"
# LimeSurvey Field type: F
data[, 370] <- as.numeric(data[, 370])
# attributes(data)$variable.labels[370] <- "[Barmah forest] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[370] <- "SIX55d_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 371] <- as.numeric(data[, 371])
# attributes(data)$variable.labels[371] <- "[Barmah forest] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[371] <- "SIX55d_SQ001_SQ002"
# LimeSurvey Field type: F
data[, 372] <- as.numeric(data[, 372])
# attributes(data)$variable.labels[372] <- "[Barmah forest] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[372] <- "SIX55d_SQ001_SQ003"
# LimeSurvey Field type: F
data[, 373] <- as.numeric(data[, 373])
# attributes(data)$variable.labels[373] <- "[Barmah forest] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[373] <- "SIX55d_SQ001_SQ004"
# LimeSurvey Field type: F
data[, 374] <- as.numeric(data[, 374])
# attributes(data)$variable.labels[374] <- "[Barmah forest] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[374] <- "SIX55d_SQ001_SQ005"
# LimeSurvey Field type: F
data[, 375] <- as.numeric(data[, 375])
# attributes(data)$variable.labels[375] <- "[Barmah forest] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[375] <- "SIX55d_SQ001_SQ006"
# LimeSurvey Field type: F
data[, 376] <- as.numeric(data[, 376])
# attributes(data)$variable.labels[376] <- "[Barmah forest] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[376] <- "SIX55d_SQ001_SQ007"
# LimeSurvey Field type: F
data[, 377] <- as.numeric(data[, 377])
# attributes(data)$variable.labels[377] <- "[Barmah forest] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[377] <- "SIX55d_SQ001_SQ008"
# LimeSurvey Field type: F
data[, 378] <- as.numeric(data[, 378])
# attributes(data)$variable.labels[378] <- "[Barmah forest] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[378] <- "SIX55d_SQ001_SQ009"
# LimeSurvey Field type: F
data[, 379] <- as.numeric(data[, 379])
# attributes(data)$variable.labels[379] <- "[Barmah forest] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[379] <- "SIX55d_SQ001_SQ010"
# LimeSurvey Field type: F
data[, 380] <- as.numeric(data[, 380])
# attributes(data)$variable.labels[380] <- "[Barmah forest] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[380] <- "SIX55d_SQ001_SQ011"
# LimeSurvey Field type: F
data[, 381] <- as.numeric(data[, 381])
# attributes(data)$variable.labels[381] <- "[Barmah forest] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[381] <- "SIX55d_SQ001_SQ012"
# LimeSurvey Field type: F
data[, 382] <- as.numeric(data[, 382])
# attributes(data)$variable.labels[382] <- "[Bwamba ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[382] <- "SIX55d_SQ002_SQ001"
# LimeSurvey Field type: F
data[, 383] <- as.numeric(data[, 383])
# attributes(data)$variable.labels[383] <- "[Bwamba ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[383] <- "SIX55d_SQ002_SQ002"
# LimeSurvey Field type: F
data[, 384] <- as.numeric(data[, 384])
# attributes(data)$variable.labels[384] <- "[Bwamba ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[384] <- "SIX55d_SQ002_SQ003"
# LimeSurvey Field type: F
data[, 385] <- as.numeric(data[, 385])
# attributes(data)$variable.labels[385] <- "[Bwamba ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[385] <- "SIX55d_SQ002_SQ004"
# LimeSurvey Field type: F
data[, 386] <- as.numeric(data[, 386])
# attributes(data)$variable.labels[386] <- "[Bwamba ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[386] <- "SIX55d_SQ002_SQ005"
# LimeSurvey Field type: F
data[, 387] <- as.numeric(data[, 387])
# attributes(data)$variable.labels[387] <- "[Bwamba ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[387] <- "SIX55d_SQ002_SQ006"
# LimeSurvey Field type: F
data[, 388] <- as.numeric(data[, 388])
# attributes(data)$variable.labels[388] <- "[Bwamba ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[388] <- "SIX55d_SQ002_SQ007"
# LimeSurvey Field type: F
data[, 389] <- as.numeric(data[, 389])
# attributes(data)$variable.labels[389] <- "[Bwamba ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[389] <- "SIX55d_SQ002_SQ008"
# LimeSurvey Field type: F
data[, 390] <- as.numeric(data[, 390])
# attributes(data)$variable.labels[390] <- "[Bwamba ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[390] <- "SIX55d_SQ002_SQ009"
# LimeSurvey Field type: F
data[, 391] <- as.numeric(data[, 391])
# attributes(data)$variable.labels[391] <- "[Bwamba ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[391] <- "SIX55d_SQ002_SQ010"
# LimeSurvey Field type: F
data[, 392] <- as.numeric(data[, 392])
# attributes(data)$variable.labels[392] <- "[Bwamba ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[392] <- "SIX55d_SQ002_SQ011"
# LimeSurvey Field type: F
data[, 393] <- as.numeric(data[, 393])
# attributes(data)$variable.labels[393] <- "[Bwamba ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[393] <- "SIX55d_SQ002_SQ012"
# LimeSurvey Field type: F
data[, 394] <- as.numeric(data[, 394])
# attributes(data)$variable.labels[394] <- "[Cache valley] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[394] <- "SIX55d_SQ003_SQ001"
# LimeSurvey Field type: F
data[, 395] <- as.numeric(data[, 395])
# attributes(data)$variable.labels[395] <- "[Cache valley] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[395] <- "SIX55d_SQ003_SQ002"
# LimeSurvey Field type: F
data[, 396] <- as.numeric(data[, 396])
# attributes(data)$variable.labels[396] <- "[Cache valley] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[396] <- "SIX55d_SQ003_SQ003"
# LimeSurvey Field type: F
data[, 397] <- as.numeric(data[, 397])
# attributes(data)$variable.labels[397] <- "[Cache valley] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[397] <- "SIX55d_SQ003_SQ004"
# LimeSurvey Field type: F
data[, 398] <- as.numeric(data[, 398])
# attributes(data)$variable.labels[398] <- "[Cache valley] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[398] <- "SIX55d_SQ003_SQ005"
# LimeSurvey Field type: F
data[, 399] <- as.numeric(data[, 399])
# attributes(data)$variable.labels[399] <- "[Cache valley] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[399] <- "SIX55d_SQ003_SQ006"
# LimeSurvey Field type: F
data[, 400] <- as.numeric(data[, 400])
# attributes(data)$variable.labels[400] <- "[Cache valley] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[400] <- "SIX55d_SQ003_SQ007"
# LimeSurvey Field type: F
data[, 401] <- as.numeric(data[, 401])
# attributes(data)$variable.labels[401] <- "[Cache valley] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[401] <- "SIX55d_SQ003_SQ008"
# LimeSurvey Field type: F
data[, 402] <- as.numeric(data[, 402])
# attributes(data)$variable.labels[402] <- "[Cache valley] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[402] <- "SIX55d_SQ003_SQ009"
# LimeSurvey Field type: F
data[, 403] <- as.numeric(data[, 403])
# attributes(data)$variable.labels[403] <- "[Cache valley] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[403] <- "SIX55d_SQ003_SQ010"
# LimeSurvey Field type: F
data[, 404] <- as.numeric(data[, 404])
# attributes(data)$variable.labels[404] <- "[Cache valley] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[404] <- "SIX55d_SQ003_SQ011"
# LimeSurvey Field type: F
data[, 405] <- as.numeric(data[, 405])
# attributes(data)$variable.labels[405] <- "[Cache valley] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[405] <- "SIX55d_SQ003_SQ012"
# LimeSurvey Field type: F
data[, 406] <- as.numeric(data[, 406])
# attributes(data)$variable.labels[406] <- "[California encephalitis] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[406] <- "SIX55d_SQ004_SQ001"
# LimeSurvey Field type: F
data[, 407] <- as.numeric(data[, 407])
# attributes(data)$variable.labels[407] <- "[California encephalitis] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[407] <- "SIX55d_SQ004_SQ002"
# LimeSurvey Field type: F
data[, 408] <- as.numeric(data[, 408])
# attributes(data)$variable.labels[408] <- "[California encephalitis] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[408] <- "SIX55d_SQ004_SQ003"
# LimeSurvey Field type: F
data[, 409] <- as.numeric(data[, 409])
# attributes(data)$variable.labels[409] <- "[California encephalitis] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[409] <- "SIX55d_SQ004_SQ004"
# LimeSurvey Field type: F
data[, 410] <- as.numeric(data[, 410])
# attributes(data)$variable.labels[410] <- "[California encephalitis] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[410] <- "SIX55d_SQ004_SQ005"
# LimeSurvey Field type: F
data[, 411] <- as.numeric(data[, 411])
# attributes(data)$variable.labels[411] <- "[California encephalitis] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[411] <- "SIX55d_SQ004_SQ006"
# LimeSurvey Field type: F
data[, 412] <- as.numeric(data[, 412])
# attributes(data)$variable.labels[412] <- "[California encephalitis] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[412] <- "SIX55d_SQ004_SQ007"
# LimeSurvey Field type: F
data[, 413] <- as.numeric(data[, 413])
# attributes(data)$variable.labels[413] <- "[California encephalitis] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[413] <- "SIX55d_SQ004_SQ008"
# LimeSurvey Field type: F
data[, 414] <- as.numeric(data[, 414])
# attributes(data)$variable.labels[414] <- "[California encephalitis] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[414] <- "SIX55d_SQ004_SQ009"
# LimeSurvey Field type: F
data[, 415] <- as.numeric(data[, 415])
# attributes(data)$variable.labels[415] <- "[California encephalitis] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[415] <- "SIX55d_SQ004_SQ010"
# LimeSurvey Field type: F
data[, 416] <- as.numeric(data[, 416])
# attributes(data)$variable.labels[416] <- "[California encephalitis] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[416] <- "SIX55d_SQ004_SQ011"
# LimeSurvey Field type: F
data[, 417] <- as.numeric(data[, 417])
# attributes(data)$variable.labels[417] <- "[California encephalitis] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[417] <- "SIX55d_SQ004_SQ012"
# LimeSurvey Field type: F
data[, 418] <- as.numeric(data[, 418])
# attributes(data)$variable.labels[418] <- "[Chandipura] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[418] <- "SIX55d_SQ005_SQ001"
# LimeSurvey Field type: F
data[, 419] <- as.numeric(data[, 419])
# attributes(data)$variable.labels[419] <- "[Chandipura] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[419] <- "SIX55d_SQ005_SQ002"
# LimeSurvey Field type: F
data[, 420] <- as.numeric(data[, 420])
# attributes(data)$variable.labels[420] <- "[Chandipura] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[420] <- "SIX55d_SQ005_SQ003"
# LimeSurvey Field type: F
data[, 421] <- as.numeric(data[, 421])
# attributes(data)$variable.labels[421] <- "[Chandipura] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[421] <- "SIX55d_SQ005_SQ004"
# LimeSurvey Field type: F
data[, 422] <- as.numeric(data[, 422])
# attributes(data)$variable.labels[422] <- "[Chandipura] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[422] <- "SIX55d_SQ005_SQ005"
# LimeSurvey Field type: F
data[, 423] <- as.numeric(data[, 423])
# attributes(data)$variable.labels[423] <- "[Chandipura] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[423] <- "SIX55d_SQ005_SQ006"
# LimeSurvey Field type: F
data[, 424] <- as.numeric(data[, 424])
# attributes(data)$variable.labels[424] <- "[Chandipura] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[424] <- "SIX55d_SQ005_SQ007"
# LimeSurvey Field type: F
data[, 425] <- as.numeric(data[, 425])
# attributes(data)$variable.labels[425] <- "[Chandipura] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[425] <- "SIX55d_SQ005_SQ008"
# LimeSurvey Field type: F
data[, 426] <- as.numeric(data[, 426])
# attributes(data)$variable.labels[426] <- "[Chandipura] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[426] <- "SIX55d_SQ005_SQ009"
# LimeSurvey Field type: F
data[, 427] <- as.numeric(data[, 427])
# attributes(data)$variable.labels[427] <- "[Chandipura] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[427] <- "SIX55d_SQ005_SQ010"
# LimeSurvey Field type: F
data[, 428] <- as.numeric(data[, 428])
# attributes(data)$variable.labels[428] <- "[Chandipura] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[428] <- "SIX55d_SQ005_SQ011"
# LimeSurvey Field type: F
data[, 429] <- as.numeric(data[, 429])
# attributes(data)$variable.labels[429] <- "[Chandipura] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[429] <- "SIX55d_SQ005_SQ012"
# LimeSurvey Field type: F
data[, 430] <- as.numeric(data[, 430])
# attributes(data)$variable.labels[430] <- "[Eastern equine encephalitis] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[430] <- "SIX55d_SQ006_SQ001"
# LimeSurvey Field type: F
data[, 431] <- as.numeric(data[, 431])
# attributes(data)$variable.labels[431] <- "[Eastern equine encephalitis] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[431] <- "SIX55d_SQ006_SQ002"
# LimeSurvey Field type: F
data[, 432] <- as.numeric(data[, 432])
# attributes(data)$variable.labels[432] <- "[Eastern equine encephalitis] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[432] <- "SIX55d_SQ006_SQ003"
# LimeSurvey Field type: F
data[, 433] <- as.numeric(data[, 433])
# attributes(data)$variable.labels[433] <- "[Eastern equine encephalitis] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[433] <- "SIX55d_SQ006_SQ004"
# LimeSurvey Field type: F
data[, 434] <- as.numeric(data[, 434])
# attributes(data)$variable.labels[434] <- "[Eastern equine encephalitis] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[434] <- "SIX55d_SQ006_SQ005"
# LimeSurvey Field type: F
data[, 435] <- as.numeric(data[, 435])
# attributes(data)$variable.labels[435] <- "[Eastern equine encephalitis] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[435] <- "SIX55d_SQ006_SQ006"
# LimeSurvey Field type: F
data[, 436] <- as.numeric(data[, 436])
# attributes(data)$variable.labels[436] <- "[Eastern equine encephalitis] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[436] <- "SIX55d_SQ006_SQ007"
# LimeSurvey Field type: F
data[, 437] <- as.numeric(data[, 437])
# attributes(data)$variable.labels[437] <- "[Eastern equine encephalitis] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[437] <- "SIX55d_SQ006_SQ008"
# LimeSurvey Field type: F
data[, 438] <- as.numeric(data[, 438])
# attributes(data)$variable.labels[438] <- "[Eastern equine encephalitis] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[438] <- "SIX55d_SQ006_SQ009"
# LimeSurvey Field type: F
data[, 439] <- as.numeric(data[, 439])
# attributes(data)$variable.labels[439] <- "[Eastern equine encephalitis] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[439] <- "SIX55d_SQ006_SQ010"
# LimeSurvey Field type: F
data[, 440] <- as.numeric(data[, 440])
# attributes(data)$variable.labels[440] <- "[Eastern equine encephalitis] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[440] <- "SIX55d_SQ006_SQ011"
# LimeSurvey Field type: F
data[, 441] <- as.numeric(data[, 441])
# attributes(data)$variable.labels[441] <- "[Eastern equine encephalitis] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[441] <- "SIX55d_SQ006_SQ012"
# LimeSurvey Field type: F
data[, 442] <- as.numeric(data[, 442])
# attributes(data)$variable.labels[442] <- "[Trivittatus ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[442] <- "SIX55d_SQ026_SQ001"
# LimeSurvey Field type: F
data[, 443] <- as.numeric(data[, 443])
# attributes(data)$variable.labels[443] <- "[Trivittatus ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[443] <- "SIX55d_SQ026_SQ002"
# LimeSurvey Field type: F
data[, 444] <- as.numeric(data[, 444])
# attributes(data)$variable.labels[444] <- "[Trivittatus ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[444] <- "SIX55d_SQ026_SQ003"
# LimeSurvey Field type: F
data[, 445] <- as.numeric(data[, 445])
# attributes(data)$variable.labels[445] <- "[Trivittatus ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[445] <- "SIX55d_SQ026_SQ004"
# LimeSurvey Field type: F
data[, 446] <- as.numeric(data[, 446])
# attributes(data)$variable.labels[446] <- "[Trivittatus ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[446] <- "SIX55d_SQ026_SQ005"
# LimeSurvey Field type: F
data[, 447] <- as.numeric(data[, 447])
# attributes(data)$variable.labels[447] <- "[Trivittatus ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[447] <- "SIX55d_SQ026_SQ006"
# LimeSurvey Field type: F
data[, 448] <- as.numeric(data[, 448])
# attributes(data)$variable.labels[448] <- "[Trivittatus ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[448] <- "SIX55d_SQ026_SQ007"
# LimeSurvey Field type: F
data[, 449] <- as.numeric(data[, 449])
# attributes(data)$variable.labels[449] <- "[Trivittatus ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[449] <- "SIX55d_SQ026_SQ008"
# LimeSurvey Field type: F
data[, 450] <- as.numeric(data[, 450])
# attributes(data)$variable.labels[450] <- "[Trivittatus ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[450] <- "SIX55d_SQ026_SQ009"
# LimeSurvey Field type: F
data[, 451] <- as.numeric(data[, 451])
# attributes(data)$variable.labels[451] <- "[Trivittatus ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[451] <- "SIX55d_SQ026_SQ010"
# LimeSurvey Field type: F
data[, 452] <- as.numeric(data[, 452])
# attributes(data)$variable.labels[452] <- "[Trivittatus ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[452] <- "SIX55d_SQ026_SQ011"
# LimeSurvey Field type: F
data[, 453] <- as.numeric(data[, 453])
# attributes(data)$variable.labels[453] <- "[Trivittatus ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[453] <- "SIX55d_SQ026_SQ012"
# LimeSurvey Field type: F
data[, 454] <- as.numeric(data[, 454])
# attributes(data)$variable.labels[454] <- "[Eyach ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[454] <- "SIX55d_SQ008_SQ001"
# LimeSurvey Field type: F
data[, 455] <- as.numeric(data[, 455])
# attributes(data)$variable.labels[455] <- "[Eyach ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[455] <- "SIX55d_SQ008_SQ002"
# LimeSurvey Field type: F
data[, 456] <- as.numeric(data[, 456])
# attributes(data)$variable.labels[456] <- "[Eyach ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[456] <- "SIX55d_SQ008_SQ003"
# LimeSurvey Field type: F
data[, 457] <- as.numeric(data[, 457])
# attributes(data)$variable.labels[457] <- "[Eyach ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[457] <- "SIX55d_SQ008_SQ004"
# LimeSurvey Field type: F
data[, 458] <- as.numeric(data[, 458])
# attributes(data)$variable.labels[458] <- "[Eyach ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[458] <- "SIX55d_SQ008_SQ005"
# LimeSurvey Field type: F
data[, 459] <- as.numeric(data[, 459])
# attributes(data)$variable.labels[459] <- "[Eyach ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[459] <- "SIX55d_SQ008_SQ006"
# LimeSurvey Field type: F
data[, 460] <- as.numeric(data[, 460])
# attributes(data)$variable.labels[460] <- "[Eyach ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[460] <- "SIX55d_SQ008_SQ007"
# LimeSurvey Field type: F
data[, 461] <- as.numeric(data[, 461])
# attributes(data)$variable.labels[461] <- "[Eyach ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[461] <- "SIX55d_SQ008_SQ008"
# LimeSurvey Field type: F
data[, 462] <- as.numeric(data[, 462])
# attributes(data)$variable.labels[462] <- "[Eyach ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[462] <- "SIX55d_SQ008_SQ009"
# LimeSurvey Field type: F
data[, 463] <- as.numeric(data[, 463])
# attributes(data)$variable.labels[463] <- "[Eyach ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[463] <- "SIX55d_SQ008_SQ010"
# LimeSurvey Field type: F
data[, 464] <- as.numeric(data[, 464])
# attributes(data)$variable.labels[464] <- "[Eyach ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[464] <- "SIX55d_SQ008_SQ011"
# LimeSurvey Field type: F
data[, 465] <- as.numeric(data[, 465])
# attributes(data)$variable.labels[465] <- "[Eyach ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[465] <- "SIX55d_SQ008_SQ012"
# LimeSurvey Field type: F
data[, 466] <- as.numeric(data[, 466])
# attributes(data)$variable.labels[466] <- "[Inkoo] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[466] <- "SIX55d_SQ009_SQ001"
# LimeSurvey Field type: F
data[, 467] <- as.numeric(data[, 467])
# attributes(data)$variable.labels[467] <- "[Inkoo] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[467] <- "SIX55d_SQ009_SQ002"
# LimeSurvey Field type: F
data[, 468] <- as.numeric(data[, 468])
# attributes(data)$variable.labels[468] <- "[Inkoo] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[468] <- "SIX55d_SQ009_SQ003"
# LimeSurvey Field type: F
data[, 469] <- as.numeric(data[, 469])
# attributes(data)$variable.labels[469] <- "[Inkoo] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[469] <- "SIX55d_SQ009_SQ004"
# LimeSurvey Field type: F
data[, 470] <- as.numeric(data[, 470])
# attributes(data)$variable.labels[470] <- "[Inkoo] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[470] <- "SIX55d_SQ009_SQ005"
# LimeSurvey Field type: F
data[, 471] <- as.numeric(data[, 471])
# attributes(data)$variable.labels[471] <- "[Inkoo] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[471] <- "SIX55d_SQ009_SQ006"
# LimeSurvey Field type: F
data[, 472] <- as.numeric(data[, 472])
# attributes(data)$variable.labels[472] <- "[Inkoo] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[472] <- "SIX55d_SQ009_SQ007"
# LimeSurvey Field type: F
data[, 473] <- as.numeric(data[, 473])
# attributes(data)$variable.labels[473] <- "[Inkoo] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[473] <- "SIX55d_SQ009_SQ008"
# LimeSurvey Field type: F
data[, 474] <- as.numeric(data[, 474])
# attributes(data)$variable.labels[474] <- "[Inkoo] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[474] <- "SIX55d_SQ009_SQ009"
# LimeSurvey Field type: F
data[, 475] <- as.numeric(data[, 475])
# attributes(data)$variable.labels[475] <- "[Inkoo] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[475] <- "SIX55d_SQ009_SQ010"
# LimeSurvey Field type: F
data[, 476] <- as.numeric(data[, 476])
# attributes(data)$variable.labels[476] <- "[Inkoo] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[476] <- "SIX55d_SQ009_SQ011"
# LimeSurvey Field type: F
data[, 477] <- as.numeric(data[, 477])
# attributes(data)$variable.labels[477] <- "[Inkoo] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[477] <- "SIX55d_SQ009_SQ012"
# LimeSurvey Field type: F
data[, 478] <- as.numeric(data[, 478])
# attributes(data)$variable.labels[478] <- "[Jamestown Canyon ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[478] <- "SIX55d_SQ010_SQ001"
# LimeSurvey Field type: F
data[, 479] <- as.numeric(data[, 479])
# attributes(data)$variable.labels[479] <- "[Jamestown Canyon ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[479] <- "SIX55d_SQ010_SQ002"
# LimeSurvey Field type: F
data[, 480] <- as.numeric(data[, 480])
# attributes(data)$variable.labels[480] <- "[Jamestown Canyon ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[480] <- "SIX55d_SQ010_SQ003"
# LimeSurvey Field type: F
data[, 481] <- as.numeric(data[, 481])
# attributes(data)$variable.labels[481] <- "[Jamestown Canyon ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[481] <- "SIX55d_SQ010_SQ004"
# LimeSurvey Field type: F
data[, 482] <- as.numeric(data[, 482])
# attributes(data)$variable.labels[482] <- "[Jamestown Canyon ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[482] <- "SIX55d_SQ010_SQ005"
# LimeSurvey Field type: F
data[, 483] <- as.numeric(data[, 483])
# attributes(data)$variable.labels[483] <- "[Jamestown Canyon ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[483] <- "SIX55d_SQ010_SQ006"
# LimeSurvey Field type: F
data[, 484] <- as.numeric(data[, 484])
# attributes(data)$variable.labels[484] <- "[Jamestown Canyon ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[484] <- "SIX55d_SQ010_SQ007"
# LimeSurvey Field type: F
data[, 485] <- as.numeric(data[, 485])
# attributes(data)$variable.labels[485] <- "[Jamestown Canyon ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[485] <- "SIX55d_SQ010_SQ008"
# LimeSurvey Field type: F
data[, 486] <- as.numeric(data[, 486])
# attributes(data)$variable.labels[486] <- "[Jamestown Canyon ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[486] <- "SIX55d_SQ010_SQ009"
# LimeSurvey Field type: F
data[, 487] <- as.numeric(data[, 487])
# attributes(data)$variable.labels[487] <- "[Jamestown Canyon ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[487] <- "SIX55d_SQ010_SQ010"
# LimeSurvey Field type: F
data[, 488] <- as.numeric(data[, 488])
# attributes(data)$variable.labels[488] <- "[Jamestown Canyon ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[488] <- "SIX55d_SQ010_SQ011"
# LimeSurvey Field type: F
data[, 489] <- as.numeric(data[, 489])
# attributes(data)$variable.labels[489] <- "[Jamestown Canyon ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[489] <- "SIX55d_SQ010_SQ012"
# LimeSurvey Field type: F
data[, 490] <- as.numeric(data[, 490])
# attributes(data)$variable.labels[490] <- "[Japanese encephalitis] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[490] <- "SIX55d_SQ011_SQ001"
# LimeSurvey Field type: F
data[, 491] <- as.numeric(data[, 491])
# attributes(data)$variable.labels[491] <- "[Japanese encephalitis] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[491] <- "SIX55d_SQ011_SQ002"
# LimeSurvey Field type: F
data[, 492] <- as.numeric(data[, 492])
# attributes(data)$variable.labels[492] <- "[Japanese encephalitis] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[492] <- "SIX55d_SQ011_SQ003"
# LimeSurvey Field type: F
data[, 493] <- as.numeric(data[, 493])
# attributes(data)$variable.labels[493] <- "[Japanese encephalitis] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[493] <- "SIX55d_SQ011_SQ004"
# LimeSurvey Field type: F
data[, 494] <- as.numeric(data[, 494])
# attributes(data)$variable.labels[494] <- "[Japanese encephalitis] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[494] <- "SIX55d_SQ011_SQ005"
# LimeSurvey Field type: F
data[, 495] <- as.numeric(data[, 495])
# attributes(data)$variable.labels[495] <- "[Japanese encephalitis] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[495] <- "SIX55d_SQ011_SQ006"
# LimeSurvey Field type: F
data[, 496] <- as.numeric(data[, 496])
# attributes(data)$variable.labels[496] <- "[Japanese encephalitis] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[496] <- "SIX55d_SQ011_SQ007"
# LimeSurvey Field type: F
data[, 497] <- as.numeric(data[, 497])
# attributes(data)$variable.labels[497] <- "[Japanese encephalitis] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[497] <- "SIX55d_SQ011_SQ008"
# LimeSurvey Field type: F
data[, 498] <- as.numeric(data[, 498])
# attributes(data)$variable.labels[498] <- "[Japanese encephalitis] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[498] <- "SIX55d_SQ011_SQ009"
# LimeSurvey Field type: F
data[, 499] <- as.numeric(data[, 499])
# attributes(data)$variable.labels[499] <- "[Japanese encephalitis] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[499] <- "SIX55d_SQ011_SQ010"
# LimeSurvey Field type: F
data[, 500] <- as.numeric(data[, 500])
# attributes(data)$variable.labels[500] <- "[Japanese encephalitis] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[500] <- "SIX55d_SQ011_SQ011"
# LimeSurvey Field type: F
data[, 501] <- as.numeric(data[, 501])
# attributes(data)$variable.labels[501] <- "[Japanese encephalitis] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[501] <- "SIX55d_SQ011_SQ012"
# LimeSurvey Field type: F
data[, 502] <- as.numeric(data[, 502])
# attributes(data)$variable.labels[502] <- "[Kunjin] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[502] <- "SIX55d_SQ012_SQ001"
# LimeSurvey Field type: F
data[, 503] <- as.numeric(data[, 503])
# attributes(data)$variable.labels[503] <- "[Kunjin] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[503] <- "SIX55d_SQ012_SQ002"
# LimeSurvey Field type: F
data[, 504] <- as.numeric(data[, 504])
# attributes(data)$variable.labels[504] <- "[Kunjin] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[504] <- "SIX55d_SQ012_SQ003"
# LimeSurvey Field type: F
data[, 505] <- as.numeric(data[, 505])
# attributes(data)$variable.labels[505] <- "[Kunjin] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[505] <- "SIX55d_SQ012_SQ004"
# LimeSurvey Field type: F
data[, 506] <- as.numeric(data[, 506])
# attributes(data)$variable.labels[506] <- "[Kunjin] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[506] <- "SIX55d_SQ012_SQ005"
# LimeSurvey Field type: F
data[, 507] <- as.numeric(data[, 507])
# attributes(data)$variable.labels[507] <- "[Kunjin] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[507] <- "SIX55d_SQ012_SQ006"
# LimeSurvey Field type: F
data[, 508] <- as.numeric(data[, 508])
# attributes(data)$variable.labels[508] <- "[Kunjin] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[508] <- "SIX55d_SQ012_SQ007"
# LimeSurvey Field type: F
data[, 509] <- as.numeric(data[, 509])
# attributes(data)$variable.labels[509] <- "[Kunjin] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[509] <- "SIX55d_SQ012_SQ008"
# LimeSurvey Field type: F
data[, 510] <- as.numeric(data[, 510])
# attributes(data)$variable.labels[510] <- "[Kunjin] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[510] <- "SIX55d_SQ012_SQ009"
# LimeSurvey Field type: F
data[, 511] <- as.numeric(data[, 511])
# attributes(data)$variable.labels[511] <- "[Kunjin] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[511] <- "SIX55d_SQ012_SQ010"
# LimeSurvey Field type: F
data[, 512] <- as.numeric(data[, 512])
# attributes(data)$variable.labels[512] <- "[Kunjin] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[512] <- "SIX55d_SQ012_SQ011"
# LimeSurvey Field type: F
data[, 513] <- as.numeric(data[, 513])
# attributes(data)$variable.labels[513] <- "[Kunjin] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[513] <- "SIX55d_SQ012_SQ012"
# LimeSurvey Field type: F
data[, 514] <- as.numeric(data[, 514])
# attributes(data)$variable.labels[514] <- "[Kyasanur Forest] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[514] <- "SIX55d_SQ013_SQ001"
# LimeSurvey Field type: F
data[, 515] <- as.numeric(data[, 515])
# attributes(data)$variable.labels[515] <- "[Kyasanur Forest] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[515] <- "SIX55d_SQ013_SQ002"
# LimeSurvey Field type: F
data[, 516] <- as.numeric(data[, 516])
# attributes(data)$variable.labels[516] <- "[Kyasanur Forest] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[516] <- "SIX55d_SQ013_SQ003"
# LimeSurvey Field type: F
data[, 517] <- as.numeric(data[, 517])
# attributes(data)$variable.labels[517] <- "[Kyasanur Forest] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[517] <- "SIX55d_SQ013_SQ004"
# LimeSurvey Field type: F
data[, 518] <- as.numeric(data[, 518])
# attributes(data)$variable.labels[518] <- "[Kyasanur Forest] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[518] <- "SIX55d_SQ013_SQ005"
# LimeSurvey Field type: F
data[, 519] <- as.numeric(data[, 519])
# attributes(data)$variable.labels[519] <- "[Kyasanur Forest] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[519] <- "SIX55d_SQ013_SQ006"
# LimeSurvey Field type: F
data[, 520] <- as.numeric(data[, 520])
# attributes(data)$variable.labels[520] <- "[Kyasanur Forest] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[520] <- "SIX55d_SQ013_SQ007"
# LimeSurvey Field type: F
data[, 521] <- as.numeric(data[, 521])
# attributes(data)$variable.labels[521] <- "[Kyasanur Forest] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[521] <- "SIX55d_SQ013_SQ008"
# LimeSurvey Field type: F
data[, 522] <- as.numeric(data[, 522])
# attributes(data)$variable.labels[522] <- "[Kyasanur Forest] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[522] <- "SIX55d_SQ013_SQ009"
# LimeSurvey Field type: F
data[, 523] <- as.numeric(data[, 523])
# attributes(data)$variable.labels[523] <- "[Kyasanur Forest] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[523] <- "SIX55d_SQ013_SQ010"
# LimeSurvey Field type: F
data[, 524] <- as.numeric(data[, 524])
# attributes(data)$variable.labels[524] <- "[Kyasanur Forest] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[524] <- "SIX55d_SQ013_SQ011"
# LimeSurvey Field type: F
data[, 525] <- as.numeric(data[, 525])
# attributes(data)$variable.labels[525] <- "[Kyasanur Forest] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[525] <- "SIX55d_SQ013_SQ012"
# LimeSurvey Field type: F
data[, 526] <- as.numeric(data[, 526])
# attributes(data)$variable.labels[526] <- "[La Crosse ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[526] <- "SIX55d_SQ014_SQ001"
# LimeSurvey Field type: F
data[, 527] <- as.numeric(data[, 527])
# attributes(data)$variable.labels[527] <- "[La Crosse ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[527] <- "SIX55d_SQ014_SQ002"
# LimeSurvey Field type: F
data[, 528] <- as.numeric(data[, 528])
# attributes(data)$variable.labels[528] <- "[La Crosse ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[528] <- "SIX55d_SQ014_SQ003"
# LimeSurvey Field type: F
data[, 529] <- as.numeric(data[, 529])
# attributes(data)$variable.labels[529] <- "[La Crosse ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[529] <- "SIX55d_SQ014_SQ004"
# LimeSurvey Field type: F
data[, 530] <- as.numeric(data[, 530])
# attributes(data)$variable.labels[530] <- "[La Crosse ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[530] <- "SIX55d_SQ014_SQ005"
# LimeSurvey Field type: F
data[, 531] <- as.numeric(data[, 531])
# attributes(data)$variable.labels[531] <- "[La Crosse ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[531] <- "SIX55d_SQ014_SQ006"
# LimeSurvey Field type: F
data[, 532] <- as.numeric(data[, 532])
# attributes(data)$variable.labels[532] <- "[La Crosse ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[532] <- "SIX55d_SQ014_SQ007"
# LimeSurvey Field type: F
data[, 533] <- as.numeric(data[, 533])
# attributes(data)$variable.labels[533] <- "[La Crosse ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[533] <- "SIX55d_SQ014_SQ008"
# LimeSurvey Field type: F
data[, 534] <- as.numeric(data[, 534])
# attributes(data)$variable.labels[534] <- "[La Crosse ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[534] <- "SIX55d_SQ014_SQ009"
# LimeSurvey Field type: F
data[, 535] <- as.numeric(data[, 535])
# attributes(data)$variable.labels[535] <- "[La Crosse ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[535] <- "SIX55d_SQ014_SQ010"
# LimeSurvey Field type: F
data[, 536] <- as.numeric(data[, 536])
# attributes(data)$variable.labels[536] <- "[La Crosse ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[536] <- "SIX55d_SQ014_SQ011"
# LimeSurvey Field type: F
data[, 537] <- as.numeric(data[, 537])
# attributes(data)$variable.labels[537] <- "[La Crosse ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[537] <- "SIX55d_SQ014_SQ012"
# LimeSurvey Field type: F
data[, 538] <- as.numeric(data[, 538])
# attributes(data)$variable.labels[538] <- "[Mayaro ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[538] <- "SIX55d_SQ015_SQ001"
# LimeSurvey Field type: F
data[, 539] <- as.numeric(data[, 539])
# attributes(data)$variable.labels[539] <- "[Mayaro ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[539] <- "SIX55d_SQ015_SQ002"
# LimeSurvey Field type: F
data[, 540] <- as.numeric(data[, 540])
# attributes(data)$variable.labels[540] <- "[Mayaro ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[540] <- "SIX55d_SQ015_SQ003"
# LimeSurvey Field type: F
data[, 541] <- as.numeric(data[, 541])
# attributes(data)$variable.labels[541] <- "[Mayaro ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[541] <- "SIX55d_SQ015_SQ004"
# LimeSurvey Field type: F
data[, 542] <- as.numeric(data[, 542])
# attributes(data)$variable.labels[542] <- "[Mayaro ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[542] <- "SIX55d_SQ015_SQ005"
# LimeSurvey Field type: F
data[, 543] <- as.numeric(data[, 543])
# attributes(data)$variable.labels[543] <- "[Mayaro ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[543] <- "SIX55d_SQ015_SQ006"
# LimeSurvey Field type: F
data[, 544] <- as.numeric(data[, 544])
# attributes(data)$variable.labels[544] <- "[Mayaro ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[544] <- "SIX55d_SQ015_SQ007"
# LimeSurvey Field type: F
data[, 545] <- as.numeric(data[, 545])
# attributes(data)$variable.labels[545] <- "[Mayaro ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[545] <- "SIX55d_SQ015_SQ008"
# LimeSurvey Field type: F
data[, 546] <- as.numeric(data[, 546])
# attributes(data)$variable.labels[546] <- "[Mayaro ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[546] <- "SIX55d_SQ015_SQ009"
# LimeSurvey Field type: F
data[, 547] <- as.numeric(data[, 547])
# attributes(data)$variable.labels[547] <- "[Mayaro ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[547] <- "SIX55d_SQ015_SQ010"
# LimeSurvey Field type: F
data[, 548] <- as.numeric(data[, 548])
# attributes(data)$variable.labels[548] <- "[Mayaro ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[548] <- "SIX55d_SQ015_SQ011"
# LimeSurvey Field type: F
data[, 549] <- as.numeric(data[, 549])
# attributes(data)$variable.labels[549] <- "[Mayaro ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[549] <- "SIX55d_SQ015_SQ012"
# LimeSurvey Field type: F
data[, 550] <- as.numeric(data[, 550])
# attributes(data)$variable.labels[550] <- "[Murray Valley encephalitis] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[550] <- "SIX55d_SQ016_SQ001"
# LimeSurvey Field type: F
data[, 551] <- as.numeric(data[, 551])
# attributes(data)$variable.labels[551] <- "[Murray Valley encephalitis] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[551] <- "SIX55d_SQ016_SQ002"
# LimeSurvey Field type: F
data[, 552] <- as.numeric(data[, 552])
# attributes(data)$variable.labels[552] <- "[Murray Valley encephalitis] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[552] <- "SIX55d_SQ016_SQ003"
# LimeSurvey Field type: F
data[, 553] <- as.numeric(data[, 553])
# attributes(data)$variable.labels[553] <- "[Murray Valley encephalitis] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[553] <- "SIX55d_SQ016_SQ004"
# LimeSurvey Field type: F
data[, 554] <- as.numeric(data[, 554])
# attributes(data)$variable.labels[554] <- "[Murray Valley encephalitis] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[554] <- "SIX55d_SQ016_SQ005"
# LimeSurvey Field type: F
data[, 555] <- as.numeric(data[, 555])
# attributes(data)$variable.labels[555] <- "[Murray Valley encephalitis] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[555] <- "SIX55d_SQ016_SQ006"
# LimeSurvey Field type: F
data[, 556] <- as.numeric(data[, 556])
# attributes(data)$variable.labels[556] <- "[Murray Valley encephalitis] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[556] <- "SIX55d_SQ016_SQ007"
# LimeSurvey Field type: F
data[, 557] <- as.numeric(data[, 557])
# attributes(data)$variable.labels[557] <- "[Murray Valley encephalitis] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[557] <- "SIX55d_SQ016_SQ008"
# LimeSurvey Field type: F
data[, 558] <- as.numeric(data[, 558])
# attributes(data)$variable.labels[558] <- "[Murray Valley encephalitis] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[558] <- "SIX55d_SQ016_SQ009"
# LimeSurvey Field type: F
data[, 559] <- as.numeric(data[, 559])
# attributes(data)$variable.labels[559] <- "[Murray Valley encephalitis] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[559] <- "SIX55d_SQ016_SQ010"
# LimeSurvey Field type: F
data[, 560] <- as.numeric(data[, 560])
# attributes(data)$variable.labels[560] <- "[Murray Valley encephalitis] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[560] <- "SIX55d_SQ016_SQ011"
# LimeSurvey Field type: F
data[, 561] <- as.numeric(data[, 561])
# attributes(data)$variable.labels[561] <- "[Murray Valley encephalitis] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[561] <- "SIX55d_SQ016_SQ012"
# LimeSurvey Field type: F
data[, 562] <- as.numeric(data[, 562])
# attributes(data)$variable.labels[562] <- "[O\'nyong-nyong] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[562] <- "SIX55d_SQ017_SQ001"
# LimeSurvey Field type: F
data[, 563] <- as.numeric(data[, 563])
# attributes(data)$variable.labels[563] <- "[O\'nyong-nyong] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[563] <- "SIX55d_SQ017_SQ002"
# LimeSurvey Field type: F
data[, 564] <- as.numeric(data[, 564])
# attributes(data)$variable.labels[564] <- "[O\'nyong-nyong] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[564] <- "SIX55d_SQ017_SQ003"
# LimeSurvey Field type: F
data[, 565] <- as.numeric(data[, 565])
# attributes(data)$variable.labels[565] <- "[O\'nyong-nyong] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[565] <- "SIX55d_SQ017_SQ004"
# LimeSurvey Field type: F
data[, 566] <- as.numeric(data[, 566])
# attributes(data)$variable.labels[566] <- "[O\'nyong-nyong] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[566] <- "SIX55d_SQ017_SQ005"
# LimeSurvey Field type: F
data[, 567] <- as.numeric(data[, 567])
# attributes(data)$variable.labels[567] <- "[O\'nyong-nyong] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[567] <- "SIX55d_SQ017_SQ006"
# LimeSurvey Field type: F
data[, 568] <- as.numeric(data[, 568])
# attributes(data)$variable.labels[568] <- "[O\'nyong-nyong] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[568] <- "SIX55d_SQ017_SQ007"
# LimeSurvey Field type: F
data[, 569] <- as.numeric(data[, 569])
# attributes(data)$variable.labels[569] <- "[O\'nyong-nyong] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[569] <- "SIX55d_SQ017_SQ008"
# LimeSurvey Field type: F
data[, 570] <- as.numeric(data[, 570])
# attributes(data)$variable.labels[570] <- "[O\'nyong-nyong] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[570] <- "SIX55d_SQ017_SQ009"
# LimeSurvey Field type: F
data[, 571] <- as.numeric(data[, 571])
# attributes(data)$variable.labels[571] <- "[O\'nyong-nyong] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[571] <- "SIX55d_SQ017_SQ010"
# LimeSurvey Field type: F
data[, 572] <- as.numeric(data[, 572])
# attributes(data)$variable.labels[572] <- "[O\'nyong-nyong] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[572] <- "SIX55d_SQ017_SQ011"
# LimeSurvey Field type: F
data[, 573] <- as.numeric(data[, 573])
# attributes(data)$variable.labels[573] <- "[O\'nyong-nyong] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[573] <- "SIX55d_SQ017_SQ012"
# LimeSurvey Field type: F
data[, 574] <- as.numeric(data[, 574])
# attributes(data)$variable.labels[574] <- "[Oropouche] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[574] <- "SIX55d_SQ018_SQ001"
# LimeSurvey Field type: F
data[, 575] <- as.numeric(data[, 575])
# attributes(data)$variable.labels[575] <- "[Oropouche] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[575] <- "SIX55d_SQ018_SQ002"
# LimeSurvey Field type: F
data[, 576] <- as.numeric(data[, 576])
# attributes(data)$variable.labels[576] <- "[Oropouche] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[576] <- "SIX55d_SQ018_SQ003"
# LimeSurvey Field type: F
data[, 577] <- as.numeric(data[, 577])
# attributes(data)$variable.labels[577] <- "[Oropouche] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[577] <- "SIX55d_SQ018_SQ004"
# LimeSurvey Field type: F
data[, 578] <- as.numeric(data[, 578])
# attributes(data)$variable.labels[578] <- "[Oropouche] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[578] <- "SIX55d_SQ018_SQ005"
# LimeSurvey Field type: F
data[, 579] <- as.numeric(data[, 579])
# attributes(data)$variable.labels[579] <- "[Oropouche] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[579] <- "SIX55d_SQ018_SQ006"
# LimeSurvey Field type: F
data[, 580] <- as.numeric(data[, 580])
# attributes(data)$variable.labels[580] <- "[Oropouche] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[580] <- "SIX55d_SQ018_SQ007"
# LimeSurvey Field type: F
data[, 581] <- as.numeric(data[, 581])
# attributes(data)$variable.labels[581] <- "[Oropouche] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[581] <- "SIX55d_SQ018_SQ008"
# LimeSurvey Field type: F
data[, 582] <- as.numeric(data[, 582])
# attributes(data)$variable.labels[582] <- "[Oropouche] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[582] <- "SIX55d_SQ018_SQ009"
# LimeSurvey Field type: F
data[, 583] <- as.numeric(data[, 583])
# attributes(data)$variable.labels[583] <- "[Oropouche] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[583] <- "SIX55d_SQ018_SQ010"
# LimeSurvey Field type: F
data[, 584] <- as.numeric(data[, 584])
# attributes(data)$variable.labels[584] <- "[Oropouche] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[584] <- "SIX55d_SQ018_SQ011"
# LimeSurvey Field type: F
data[, 585] <- as.numeric(data[, 585])
# attributes(data)$variable.labels[585] <- "[Oropouche] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[585] <- "SIX55d_SQ018_SQ012"
# LimeSurvey Field type: F
data[, 586] <- as.numeric(data[, 586])
# attributes(data)$variable.labels[586] <- "[Rift Valley fever] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[586] <- "SIX55d_SQ019_SQ001"
# LimeSurvey Field type: F
data[, 587] <- as.numeric(data[, 587])
# attributes(data)$variable.labels[587] <- "[Rift Valley fever] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[587] <- "SIX55d_SQ019_SQ002"
# LimeSurvey Field type: F
data[, 588] <- as.numeric(data[, 588])
# attributes(data)$variable.labels[588] <- "[Rift Valley fever] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[588] <- "SIX55d_SQ019_SQ003"
# LimeSurvey Field type: F
data[, 589] <- as.numeric(data[, 589])
# attributes(data)$variable.labels[589] <- "[Rift Valley fever] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[589] <- "SIX55d_SQ019_SQ004"
# LimeSurvey Field type: F
data[, 590] <- as.numeric(data[, 590])
# attributes(data)$variable.labels[590] <- "[Rift Valley fever] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[590] <- "SIX55d_SQ019_SQ005"
# LimeSurvey Field type: F
data[, 591] <- as.numeric(data[, 591])
# attributes(data)$variable.labels[591] <- "[Rift Valley fever] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[591] <- "SIX55d_SQ019_SQ006"
# LimeSurvey Field type: F
data[, 592] <- as.numeric(data[, 592])
# attributes(data)$variable.labels[592] <- "[Rift Valley fever] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[592] <- "SIX55d_SQ019_SQ007"
# LimeSurvey Field type: F
data[, 593] <- as.numeric(data[, 593])
# attributes(data)$variable.labels[593] <- "[Rift Valley fever] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[593] <- "SIX55d_SQ019_SQ008"
# LimeSurvey Field type: F
data[, 594] <- as.numeric(data[, 594])
# attributes(data)$variable.labels[594] <- "[Rift Valley fever] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[594] <- "SIX55d_SQ019_SQ009"
# LimeSurvey Field type: F
data[, 595] <- as.numeric(data[, 595])
# attributes(data)$variable.labels[595] <- "[Rift Valley fever] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[595] <- "SIX55d_SQ019_SQ010"
# LimeSurvey Field type: F
data[, 596] <- as.numeric(data[, 596])
# attributes(data)$variable.labels[596] <- "[Rift Valley fever] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[596] <- "SIX55d_SQ019_SQ011"
# LimeSurvey Field type: F
data[, 597] <- as.numeric(data[, 597])
# attributes(data)$variable.labels[597] <- "[Rift Valley fever] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[597] <- "SIX55d_SQ019_SQ012"
# LimeSurvey Field type: F
data[, 598] <- as.numeric(data[, 598])
# attributes(data)$variable.labels[598] <- "[Semliki Forest] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[598] <- "SIX55d_SQ020_SQ001"
# LimeSurvey Field type: F
data[, 599] <- as.numeric(data[, 599])
# attributes(data)$variable.labels[599] <- "[Semliki Forest] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[599] <- "SIX55d_SQ020_SQ002"
# LimeSurvey Field type: F
data[, 600] <- as.numeric(data[, 600])
# attributes(data)$variable.labels[600] <- "[Semliki Forest] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[600] <- "SIX55d_SQ020_SQ003"
# LimeSurvey Field type: F
data[, 601] <- as.numeric(data[, 601])
# attributes(data)$variable.labels[601] <- "[Semliki Forest] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[601] <- "SIX55d_SQ020_SQ004"
# LimeSurvey Field type: F
data[, 602] <- as.numeric(data[, 602])
# attributes(data)$variable.labels[602] <- "[Semliki Forest] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[602] <- "SIX55d_SQ020_SQ005"
# LimeSurvey Field type: F
data[, 603] <- as.numeric(data[, 603])
# attributes(data)$variable.labels[603] <- "[Semliki Forest] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[603] <- "SIX55d_SQ020_SQ006"
# LimeSurvey Field type: F
data[, 604] <- as.numeric(data[, 604])
# attributes(data)$variable.labels[604] <- "[Semliki Forest] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[604] <- "SIX55d_SQ020_SQ007"
# LimeSurvey Field type: F
data[, 605] <- as.numeric(data[, 605])
# attributes(data)$variable.labels[605] <- "[Semliki Forest] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[605] <- "SIX55d_SQ020_SQ008"
# LimeSurvey Field type: F
data[, 606] <- as.numeric(data[, 606])
# attributes(data)$variable.labels[606] <- "[Semliki Forest] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[606] <- "SIX55d_SQ020_SQ009"
# LimeSurvey Field type: F
data[, 607] <- as.numeric(data[, 607])
# attributes(data)$variable.labels[607] <- "[Semliki Forest] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[607] <- "SIX55d_SQ020_SQ010"
# LimeSurvey Field type: F
data[, 608] <- as.numeric(data[, 608])
# attributes(data)$variable.labels[608] <- "[Semliki Forest] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[608] <- "SIX55d_SQ020_SQ011"
# LimeSurvey Field type: F
data[, 609] <- as.numeric(data[, 609])
# attributes(data)$variable.labels[609] <- "[Semliki Forest] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[609] <- "SIX55d_SQ020_SQ012"
# LimeSurvey Field type: F
data[, 610] <- as.numeric(data[, 610])
# attributes(data)$variable.labels[610] <- "[Sindbis ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[610] <- "SIX55d_SQ021_SQ001"
# LimeSurvey Field type: F
data[, 611] <- as.numeric(data[, 611])
# attributes(data)$variable.labels[611] <- "[Sindbis ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[611] <- "SIX55d_SQ021_SQ002"
# LimeSurvey Field type: F
data[, 612] <- as.numeric(data[, 612])
# attributes(data)$variable.labels[612] <- "[Sindbis ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[612] <- "SIX55d_SQ021_SQ003"
# LimeSurvey Field type: F
data[, 613] <- as.numeric(data[, 613])
# attributes(data)$variable.labels[613] <- "[Sindbis ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[613] <- "SIX55d_SQ021_SQ004"
# LimeSurvey Field type: F
data[, 614] <- as.numeric(data[, 614])
# attributes(data)$variable.labels[614] <- "[Sindbis ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[614] <- "SIX55d_SQ021_SQ005"
# LimeSurvey Field type: F
data[, 615] <- as.numeric(data[, 615])
# attributes(data)$variable.labels[615] <- "[Sindbis ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[615] <- "SIX55d_SQ021_SQ006"
# LimeSurvey Field type: F
data[, 616] <- as.numeric(data[, 616])
# attributes(data)$variable.labels[616] <- "[Sindbis ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[616] <- "SIX55d_SQ021_SQ007"
# LimeSurvey Field type: F
data[, 617] <- as.numeric(data[, 617])
# attributes(data)$variable.labels[617] <- "[Sindbis ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[617] <- "SIX55d_SQ021_SQ008"
# LimeSurvey Field type: F
data[, 618] <- as.numeric(data[, 618])
# attributes(data)$variable.labels[618] <- "[Sindbis ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[618] <- "SIX55d_SQ021_SQ009"
# LimeSurvey Field type: F
data[, 619] <- as.numeric(data[, 619])
# attributes(data)$variable.labels[619] <- "[Sindbis ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[619] <- "SIX55d_SQ021_SQ010"
# LimeSurvey Field type: F
data[, 620] <- as.numeric(data[, 620])
# attributes(data)$variable.labels[620] <- "[Sindbis ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[620] <- "SIX55d_SQ021_SQ011"
# LimeSurvey Field type: F
data[, 621] <- as.numeric(data[, 621])
# attributes(data)$variable.labels[621] <- "[Sindbis ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[621] <- "SIX55d_SQ021_SQ012"
# LimeSurvey Field type: F
data[, 622] <- as.numeric(data[, 622])
# attributes(data)$variable.labels[622] <- "[Snowshoe hare ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[622] <- "SIX55d_SQ022_SQ001"
# LimeSurvey Field type: F
data[, 623] <- as.numeric(data[, 623])
# attributes(data)$variable.labels[623] <- "[Snowshoe hare ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[623] <- "SIX55d_SQ022_SQ002"
# LimeSurvey Field type: F
data[, 624] <- as.numeric(data[, 624])
# attributes(data)$variable.labels[624] <- "[Snowshoe hare ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[624] <- "SIX55d_SQ022_SQ003"
# LimeSurvey Field type: F
data[, 625] <- as.numeric(data[, 625])
# attributes(data)$variable.labels[625] <- "[Snowshoe hare ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[625] <- "SIX55d_SQ022_SQ004"
# LimeSurvey Field type: F
data[, 626] <- as.numeric(data[, 626])
# attributes(data)$variable.labels[626] <- "[Snowshoe hare ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[626] <- "SIX55d_SQ022_SQ005"
# LimeSurvey Field type: F
data[, 627] <- as.numeric(data[, 627])
# attributes(data)$variable.labels[627] <- "[Snowshoe hare ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[627] <- "SIX55d_SQ022_SQ006"
# LimeSurvey Field type: F
data[, 628] <- as.numeric(data[, 628])
# attributes(data)$variable.labels[628] <- "[Snowshoe hare ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[628] <- "SIX55d_SQ022_SQ007"
# LimeSurvey Field type: F
data[, 629] <- as.numeric(data[, 629])
# attributes(data)$variable.labels[629] <- "[Snowshoe hare ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[629] <- "SIX55d_SQ022_SQ008"
# LimeSurvey Field type: F
data[, 630] <- as.numeric(data[, 630])
# attributes(data)$variable.labels[630] <- "[Snowshoe hare ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[630] <- "SIX55d_SQ022_SQ009"
# LimeSurvey Field type: F
data[, 631] <- as.numeric(data[, 631])
# attributes(data)$variable.labels[631] <- "[Snowshoe hare ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[631] <- "SIX55d_SQ022_SQ010"
# LimeSurvey Field type: F
data[, 632] <- as.numeric(data[, 632])
# attributes(data)$variable.labels[632] <- "[Snowshoe hare ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[632] <- "SIX55d_SQ022_SQ011"
# LimeSurvey Field type: F
data[, 633] <- as.numeric(data[, 633])
# attributes(data)$variable.labels[633] <- "[Snowshoe hare ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[633] <- "SIX55d_SQ022_SQ012"
# LimeSurvey Field type: F
data[, 634] <- as.numeric(data[, 634])
# attributes(data)$variable.labels[634] <- "[Spondweni ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[634] <- "SIX55d_SQ023_SQ001"
# LimeSurvey Field type: F
data[, 635] <- as.numeric(data[, 635])
# attributes(data)$variable.labels[635] <- "[Spondweni ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[635] <- "SIX55d_SQ023_SQ002"
# LimeSurvey Field type: F
data[, 636] <- as.numeric(data[, 636])
# attributes(data)$variable.labels[636] <- "[Spondweni ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[636] <- "SIX55d_SQ023_SQ003"
# LimeSurvey Field type: F
data[, 637] <- as.numeric(data[, 637])
# attributes(data)$variable.labels[637] <- "[Spondweni ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[637] <- "SIX55d_SQ023_SQ004"
# LimeSurvey Field type: F
data[, 638] <- as.numeric(data[, 638])
# attributes(data)$variable.labels[638] <- "[Spondweni ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[638] <- "SIX55d_SQ023_SQ005"
# LimeSurvey Field type: F
data[, 639] <- as.numeric(data[, 639])
# attributes(data)$variable.labels[639] <- "[Spondweni ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[639] <- "SIX55d_SQ023_SQ006"
# LimeSurvey Field type: F
data[, 640] <- as.numeric(data[, 640])
# attributes(data)$variable.labels[640] <- "[Spondweni ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[640] <- "SIX55d_SQ023_SQ007"
# LimeSurvey Field type: F
data[, 641] <- as.numeric(data[, 641])
# attributes(data)$variable.labels[641] <- "[Spondweni ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[641] <- "SIX55d_SQ023_SQ008"
# LimeSurvey Field type: F
data[, 642] <- as.numeric(data[, 642])
# attributes(data)$variable.labels[642] <- "[Spondweni ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[642] <- "SIX55d_SQ023_SQ009"
# LimeSurvey Field type: F
data[, 643] <- as.numeric(data[, 643])
# attributes(data)$variable.labels[643] <- "[Spondweni ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[643] <- "SIX55d_SQ023_SQ010"
# LimeSurvey Field type: F
data[, 644] <- as.numeric(data[, 644])
# attributes(data)$variable.labels[644] <- "[Spondweni ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[644] <- "SIX55d_SQ023_SQ011"
# LimeSurvey Field type: F
data[, 645] <- as.numeric(data[, 645])
# attributes(data)$variable.labels[645] <- "[Spondweni ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[645] <- "SIX55d_SQ023_SQ012"
# LimeSurvey Field type: F
data[, 646] <- as.numeric(data[, 646])
# attributes(data)$variable.labels[646] <- "[St Louis encephalitis] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[646] <- "SIX55d_SQ024_SQ001"
# LimeSurvey Field type: F
data[, 647] <- as.numeric(data[, 647])
# attributes(data)$variable.labels[647] <- "[St Louis encephalitis] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[647] <- "SIX55d_SQ024_SQ002"
# LimeSurvey Field type: F
data[, 648] <- as.numeric(data[, 648])
# attributes(data)$variable.labels[648] <- "[St Louis encephalitis] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[648] <- "SIX55d_SQ024_SQ003"
# LimeSurvey Field type: F
data[, 649] <- as.numeric(data[, 649])
# attributes(data)$variable.labels[649] <- "[St Louis encephalitis] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[649] <- "SIX55d_SQ024_SQ004"
# LimeSurvey Field type: F
data[, 650] <- as.numeric(data[, 650])
# attributes(data)$variable.labels[650] <- "[St Louis encephalitis] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[650] <- "SIX55d_SQ024_SQ005"
# LimeSurvey Field type: F
data[, 651] <- as.numeric(data[, 651])
# attributes(data)$variable.labels[651] <- "[St Louis encephalitis] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[651] <- "SIX55d_SQ024_SQ006"
# LimeSurvey Field type: F
data[, 652] <- as.numeric(data[, 652])
# attributes(data)$variable.labels[652] <- "[St Louis encephalitis] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[652] <- "SIX55d_SQ024_SQ007"
# LimeSurvey Field type: F
data[, 653] <- as.numeric(data[, 653])
# attributes(data)$variable.labels[653] <- "[St Louis encephalitis] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[653] <- "SIX55d_SQ024_SQ008"
# LimeSurvey Field type: F
data[, 654] <- as.numeric(data[, 654])
# attributes(data)$variable.labels[654] <- "[St Louis encephalitis] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[654] <- "SIX55d_SQ024_SQ009"
# LimeSurvey Field type: F
data[, 655] <- as.numeric(data[, 655])
# attributes(data)$variable.labels[655] <- "[St Louis encephalitis] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[655] <- "SIX55d_SQ024_SQ010"
# LimeSurvey Field type: F
data[, 656] <- as.numeric(data[, 656])
# attributes(data)$variable.labels[656] <- "[St Louis encephalitis] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[656] <- "SIX55d_SQ024_SQ011"
# LimeSurvey Field type: F
data[, 657] <- as.numeric(data[, 657])
# attributes(data)$variable.labels[657] <- "[St Louis encephalitis] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[657] <- "SIX55d_SQ024_SQ012"
# LimeSurvey Field type: F
data[, 658] <- as.numeric(data[, 658])
# attributes(data)$variable.labels[658] <- "[Thogoto ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[658] <- "SIX55d_SQ025_SQ001"
# LimeSurvey Field type: F
data[, 659] <- as.numeric(data[, 659])
# attributes(data)$variable.labels[659] <- "[Thogoto ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[659] <- "SIX55d_SQ025_SQ002"
# LimeSurvey Field type: F
data[, 660] <- as.numeric(data[, 660])
# attributes(data)$variable.labels[660] <- "[Thogoto ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[660] <- "SIX55d_SQ025_SQ003"
# LimeSurvey Field type: F
data[, 661] <- as.numeric(data[, 661])
# attributes(data)$variable.labels[661] <- "[Thogoto ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[661] <- "SIX55d_SQ025_SQ004"
# LimeSurvey Field type: F
data[, 662] <- as.numeric(data[, 662])
# attributes(data)$variable.labels[662] <- "[Thogoto ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[662] <- "SIX55d_SQ025_SQ005"
# LimeSurvey Field type: F
data[, 663] <- as.numeric(data[, 663])
# attributes(data)$variable.labels[663] <- "[Thogoto ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[663] <- "SIX55d_SQ025_SQ006"
# LimeSurvey Field type: F
data[, 664] <- as.numeric(data[, 664])
# attributes(data)$variable.labels[664] <- "[Thogoto ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[664] <- "SIX55d_SQ025_SQ007"
# LimeSurvey Field type: F
data[, 665] <- as.numeric(data[, 665])
# attributes(data)$variable.labels[665] <- "[Thogoto ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[665] <- "SIX55d_SQ025_SQ008"
# LimeSurvey Field type: F
data[, 666] <- as.numeric(data[, 666])
# attributes(data)$variable.labels[666] <- "[Thogoto ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[666] <- "SIX55d_SQ025_SQ009"
# LimeSurvey Field type: F
data[, 667] <- as.numeric(data[, 667])
# attributes(data)$variable.labels[667] <- "[Thogoto ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[667] <- "SIX55d_SQ025_SQ010"
# LimeSurvey Field type: F
data[, 668] <- as.numeric(data[, 668])
# attributes(data)$variable.labels[668] <- "[Thogoto ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[668] <- "SIX55d_SQ025_SQ011"
# LimeSurvey Field type: F
data[, 669] <- as.numeric(data[, 669])
# attributes(data)$variable.labels[669] <- "[Thogoto ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[669] <- "SIX55d_SQ025_SQ012"
# LimeSurvey Field type: F
data[, 670] <- as.numeric(data[, 670])
# attributes(data)$variable.labels[670] <- "[Usutu] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[670] <- "SIX55d_SQ027_SQ001"
# LimeSurvey Field type: F
data[, 671] <- as.numeric(data[, 671])
# attributes(data)$variable.labels[671] <- "[Usutu] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[671] <- "SIX55d_SQ027_SQ002"
# LimeSurvey Field type: F
data[, 672] <- as.numeric(data[, 672])
# attributes(data)$variable.labels[672] <- "[Usutu] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[672] <- "SIX55d_SQ027_SQ003"
# LimeSurvey Field type: F
data[, 673] <- as.numeric(data[, 673])
# attributes(data)$variable.labels[673] <- "[Usutu] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[673] <- "SIX55d_SQ027_SQ004"
# LimeSurvey Field type: F
data[, 674] <- as.numeric(data[, 674])
# attributes(data)$variable.labels[674] <- "[Usutu] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[674] <- "SIX55d_SQ027_SQ005"
# LimeSurvey Field type: F
data[, 675] <- as.numeric(data[, 675])
# attributes(data)$variable.labels[675] <- "[Usutu] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[675] <- "SIX55d_SQ027_SQ006"
# LimeSurvey Field type: F
data[, 676] <- as.numeric(data[, 676])
# attributes(data)$variable.labels[676] <- "[Usutu] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[676] <- "SIX55d_SQ027_SQ007"
# LimeSurvey Field type: F
data[, 677] <- as.numeric(data[, 677])
# attributes(data)$variable.labels[677] <- "[Usutu] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[677] <- "SIX55d_SQ027_SQ008"
# LimeSurvey Field type: F
data[, 678] <- as.numeric(data[, 678])
# attributes(data)$variable.labels[678] <- "[Usutu] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[678] <- "SIX55d_SQ027_SQ009"
# LimeSurvey Field type: F
data[, 679] <- as.numeric(data[, 679])
# attributes(data)$variable.labels[679] <- "[Usutu] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[679] <- "SIX55d_SQ027_SQ010"
# LimeSurvey Field type: F
data[, 680] <- as.numeric(data[, 680])
# attributes(data)$variable.labels[680] <- "[Usutu] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[680] <- "SIX55d_SQ027_SQ011"
# LimeSurvey Field type: F
data[, 681] <- as.numeric(data[, 681])
# attributes(data)$variable.labels[681] <- "[Usutu] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[681] <- "SIX55d_SQ027_SQ012"
# LimeSurvey Field type: F
data[, 682] <- as.numeric(data[, 682])
# attributes(data)$variable.labels[682] <- "[Venezuelan equine encephalitis] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[682] <- "SIX55d_SQ028_SQ001"
# LimeSurvey Field type: F
data[, 683] <- as.numeric(data[, 683])
# attributes(data)$variable.labels[683] <- "[Venezuelan equine encephalitis] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[683] <- "SIX55d_SQ028_SQ002"
# LimeSurvey Field type: F
data[, 684] <- as.numeric(data[, 684])
# attributes(data)$variable.labels[684] <- "[Venezuelan equine encephalitis] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[684] <- "SIX55d_SQ028_SQ003"
# LimeSurvey Field type: F
data[, 685] <- as.numeric(data[, 685])
# attributes(data)$variable.labels[685] <- "[Venezuelan equine encephalitis] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[685] <- "SIX55d_SQ028_SQ004"
# LimeSurvey Field type: F
data[, 686] <- as.numeric(data[, 686])
# attributes(data)$variable.labels[686] <- "[Venezuelan equine encephalitis] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[686] <- "SIX55d_SQ028_SQ005"
# LimeSurvey Field type: F
data[, 687] <- as.numeric(data[, 687])
# attributes(data)$variable.labels[687] <- "[Venezuelan equine encephalitis] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[687] <- "SIX55d_SQ028_SQ006"
# LimeSurvey Field type: F
data[, 688] <- as.numeric(data[, 688])
# attributes(data)$variable.labels[688] <- "[Venezuelan equine encephalitis] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[688] <- "SIX55d_SQ028_SQ007"
# LimeSurvey Field type: F
data[, 689] <- as.numeric(data[, 689])
# attributes(data)$variable.labels[689] <- "[Venezuelan equine encephalitis] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[689] <- "SIX55d_SQ028_SQ008"
# LimeSurvey Field type: F
data[, 690] <- as.numeric(data[, 690])
# attributes(data)$variable.labels[690] <- "[Venezuelan equine encephalitis] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[690] <- "SIX55d_SQ028_SQ009"
# LimeSurvey Field type: F
data[, 691] <- as.numeric(data[, 691])
# attributes(data)$variable.labels[691] <- "[Venezuelan equine encephalitis] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[691] <- "SIX55d_SQ028_SQ010"
# LimeSurvey Field type: F
data[, 692] <- as.numeric(data[, 692])
# attributes(data)$variable.labels[692] <- "[Venezuelan equine encephalitis] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[692] <- "SIX55d_SQ028_SQ011"
# LimeSurvey Field type: F
data[, 693] <- as.numeric(data[, 693])
# attributes(data)$variable.labels[693] <- "[Venezuelan equine encephalitis] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[693] <- "SIX55d_SQ028_SQ012"
# LimeSurvey Field type: F
data[, 694] <- as.numeric(data[, 694])
# attributes(data)$variable.labels[694] <- "[West Nile ] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[694] <- "SIX55d_SQ029_SQ001"
# LimeSurvey Field type: F
data[, 695] <- as.numeric(data[, 695])
# attributes(data)$variable.labels[695] <- "[West Nile ] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[695] <- "SIX55d_SQ029_SQ002"
# LimeSurvey Field type: F
data[, 696] <- as.numeric(data[, 696])
# attributes(data)$variable.labels[696] <- "[West Nile ] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[696] <- "SIX55d_SQ029_SQ003"
# LimeSurvey Field type: F
data[, 697] <- as.numeric(data[, 697])
# attributes(data)$variable.labels[697] <- "[West Nile ] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[697] <- "SIX55d_SQ029_SQ004"
# LimeSurvey Field type: F
data[, 698] <- as.numeric(data[, 698])
# attributes(data)$variable.labels[698] <- "[West Nile ] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[698] <- "SIX55d_SQ029_SQ005"
# LimeSurvey Field type: F
data[, 699] <- as.numeric(data[, 699])
# attributes(data)$variable.labels[699] <- "[West Nile ] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[699] <- "SIX55d_SQ029_SQ006"
# LimeSurvey Field type: F
data[, 700] <- as.numeric(data[, 700])
# attributes(data)$variable.labels[700] <- "[West Nile ] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[700] <- "SIX55d_SQ029_SQ007"
# LimeSurvey Field type: F
data[, 701] <- as.numeric(data[, 701])
# attributes(data)$variable.labels[701] <- "[West Nile ] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[701] <- "SIX55d_SQ029_SQ008"
# LimeSurvey Field type: F
data[, 702] <- as.numeric(data[, 702])
# attributes(data)$variable.labels[702] <- "[West Nile ] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[702] <- "SIX55d_SQ029_SQ009"
# LimeSurvey Field type: F
data[, 703] <- as.numeric(data[, 703])
# attributes(data)$variable.labels[703] <- "[West Nile ] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[703] <- "SIX55d_SQ029_SQ010"
# LimeSurvey Field type: F
data[, 704] <- as.numeric(data[, 704])
# attributes(data)$variable.labels[704] <- "[West Nile ] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[704] <- "SIX55d_SQ029_SQ011"
# LimeSurvey Field type: F
data[, 705] <- as.numeric(data[, 705])
# attributes(data)$variable.labels[705] <- "[West Nile ] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[705] <- "SIX55d_SQ029_SQ012"
# LimeSurvey Field type: F
data[, 706] <- as.numeric(data[, 706])
# attributes(data)$variable.labels[706] <- "[Western equine encephalitis] [2015 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[706] <- "SIX55d_SQ030_SQ001"
# LimeSurvey Field type: F
data[, 707] <- as.numeric(data[, 707])
# attributes(data)$variable.labels[707] <- "[Western equine encephalitis] [2015 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[707] <- "SIX55d_SQ030_SQ002"
# LimeSurvey Field type: F
data[, 708] <- as.numeric(data[, 708])
# attributes(data)$variable.labels[708] <- "[Western equine encephalitis] [2016 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[708] <- "SIX55d_SQ030_SQ003"
# LimeSurvey Field type: F
data[, 709] <- as.numeric(data[, 709])
# attributes(data)$variable.labels[709] <- "[Western equine encephalitis] [2016 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[709] <- "SIX55d_SQ030_SQ004"
# LimeSurvey Field type: F
data[, 710] <- as.numeric(data[, 710])
# attributes(data)$variable.labels[710] <- "[Western equine encephalitis] [2017 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[710] <- "SIX55d_SQ030_SQ005"
# LimeSurvey Field type: F
data[, 711] <- as.numeric(data[, 711])
# attributes(data)$variable.labels[711] <- "[Western equine encephalitis] [2017 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[711] <- "SIX55d_SQ030_SQ006"
# LimeSurvey Field type: F
data[, 712] <- as.numeric(data[, 712])
# attributes(data)$variable.labels[712] <- "[Western equine encephalitis] [2018 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[712] <- "SIX55d_SQ030_SQ007"
# LimeSurvey Field type: F
data[, 713] <- as.numeric(data[, 713])
# attributes(data)$variable.labels[713] <- "[Western equine encephalitis] [2018 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[713] <- "SIX55d_SQ030_SQ008"
# LimeSurvey Field type: F
data[, 714] <- as.numeric(data[, 714])
# attributes(data)$variable.labels[714] <- "[Western equine encephalitis] [2019 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[714] <- "SIX55d_SQ030_SQ009"
# LimeSurvey Field type: F
data[, 715] <- as.numeric(data[, 715])
# attributes(data)$variable.labels[715] <- "[Western equine encephalitis] [2019 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[715] <- "SIX55d_SQ030_SQ010"
# LimeSurvey Field type: F
data[, 716] <- as.numeric(data[, 716])
# attributes(data)$variable.labels[716] <- "[Western equine encephalitis] [2020 Cases] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[716] <- "SIX55d_SQ030_SQ011"
# LimeSurvey Field type: F
data[, 717] <- as.numeric(data[, 717])
# attributes(data)$variable.labels[717] <- "[Western equine encephalitis] [2020 Deaths] 55d. Please provide total number of cases and deaths due to each of the following other arboviruses that you selected from 2015-2020."
names(data)[717] <- "SIX55d_SQ030_SQ012"
# LimeSurvey Field type: A
data[, 718] <- as.character(data[, 718])
# attributes(data)$variable.labels[718] <- "[Chikungunya] [Suspect cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[718] <- "SIX56_SQ002_SQ001"
# LimeSurvey Field type: A
data[, 719] <- as.character(data[, 719])
# attributes(data)$variable.labels[719] <- "[Chikungunya] [Probable cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[719] <- "SIX56_SQ002_SQ002"
# LimeSurvey Field type: A
data[, 720] <- as.character(data[, 720])
# attributes(data)$variable.labels[720] <- "[Chikungunya] [Confirmed cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[720] <- "SIX56_SQ002_SQ003"
# LimeSurvey Field type: A
data[, 721] <- as.character(data[, 721])
# attributes(data)$variable.labels[721] <- "[Chikungunya] [Deaths] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[721] <- "SIX56_SQ002_SQ004"
# LimeSurvey Field type: A
data[, 722] <- as.character(data[, 722])
# attributes(data)$variable.labels[722] <- "[Dengue] [Suspect cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[722] <- "SIX56_SQ004_SQ001"
# LimeSurvey Field type: A
data[, 723] <- as.character(data[, 723])
# attributes(data)$variable.labels[723] <- "[Dengue] [Probable cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[723] <- "SIX56_SQ004_SQ002"
# LimeSurvey Field type: A
data[, 724] <- as.character(data[, 724])
# attributes(data)$variable.labels[724] <- "[Dengue] [Confirmed cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[724] <- "SIX56_SQ004_SQ003"
# LimeSurvey Field type: A
data[, 725] <- as.character(data[, 725])
# attributes(data)$variable.labels[725] <- "[Dengue] [Deaths] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[725] <- "SIX56_SQ004_SQ004"
# LimeSurvey Field type: A
data[, 726] <- as.character(data[, 726])
# attributes(data)$variable.labels[726] <- "[Yellow Fever] [Suspect cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[726] <- "SIX56_SQ003_SQ001"
# LimeSurvey Field type: A
data[, 727] <- as.character(data[, 727])
# attributes(data)$variable.labels[727] <- "[Yellow Fever] [Probable cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[727] <- "SIX56_SQ003_SQ002"
# LimeSurvey Field type: A
data[, 728] <- as.character(data[, 728])
# attributes(data)$variable.labels[728] <- "[Yellow Fever] [Confirmed cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[728] <- "SIX56_SQ003_SQ003"
# LimeSurvey Field type: A
data[, 729] <- as.character(data[, 729])
# attributes(data)$variable.labels[729] <- "[Yellow Fever] [Deaths] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[729] <- "SIX56_SQ003_SQ004"
# LimeSurvey Field type: A
data[, 730] <- as.character(data[, 730])
# attributes(data)$variable.labels[730] <- "[Zika] [Suspect cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[730] <- "SIX56_SQ006_SQ001"
# LimeSurvey Field type: A
data[, 731] <- as.character(data[, 731])
# attributes(data)$variable.labels[731] <- "[Zika] [Probable cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[731] <- "SIX56_SQ006_SQ002"
# LimeSurvey Field type: A
data[, 732] <- as.character(data[, 732])
# attributes(data)$variable.labels[732] <- "[Zika] [Confirmed cases] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[732] <- "SIX56_SQ006_SQ003"
# LimeSurvey Field type: A
data[, 733] <- as.character(data[, 733])
# attributes(data)$variable.labels[733] <- "[Zika] [Deaths] 56. Please provide the number of cases of locally acquired, mosquito-borne Aedes-borne arbovirus infections by case classification for 2020 and, if not available, for 2019."
names(data)[733] <- "SIX56_SQ006_SQ004"
# LimeSurvey Field type: F
data[, 734] <- as.numeric(data[, 734])
# attributes(data)$variable.labels[734] <- "[Climate change (as evidenced by changes in meteorological data)] 57. Do arbovirus surveillance staff have any perceived reasons for increasing trends in arboviral disease incidence? Check all answers that apply."
data[, 734] <- factor(data[, 734], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[734] <- "SIX57_SQ001"
# LimeSurvey Field type: F
data[, 735] <- as.numeric(data[, 735])
# attributes(data)$variable.labels[735] <- "[Construction activities ] 57. Do arbovirus surveillance staff have any perceived reasons for increasing trends in arboviral disease incidence? Check all answers that apply."
data[, 735] <- factor(data[, 735], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[735] <- "SIX57_SQ002"
# LimeSurvey Field type: F
data[, 736] <- as.numeric(data[, 736])
# attributes(data)$variable.labels[736] <- "[Population migration (within the country or between countries)] 57. Do arbovirus surveillance staff have any perceived reasons for increasing trends in arboviral disease incidence? Check all answers that apply."
data[, 736] <- factor(data[, 736], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[736] <- "SIX57_SQ003"
# LimeSurvey Field type: F
data[, 737] <- as.numeric(data[, 737])
# attributes(data)$variable.labels[737] <- "[Increased availability of peri-domestic water-bearing containers suitable for mosquito egg deposition] 57. Do arbovirus surveillance staff have any perceived reasons for increasing trends in arboviral disease incidence? Check all answers that apply."
data[, 737] <- factor(data[, 737], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[737] <- "SIX57_SQ004"
# LimeSurvey Field type: A
data[, 738] <- as.character(data[, 738])
# attributes(data)$variable.labels[738] <- "[Other] 57. Do arbovirus surveillance staff have any perceived reasons for increasing trends in arboviral disease incidence? Check all answers that apply."
names(data)[738] <- "SIX57_other"
# LimeSurvey Field type: F
data[, 739] <- as.numeric(data[, 739])
# attributes(data)$variable.labels[739] <- "[Number of personnel] [Clinicians] 58. During 2019 (prior to the Covid-19 pandemic), indicate below the number of arbovirus surveillance staff at the national level. Surveillance staff include those who are responsible for human disease surveillance, mosquito (entomological) surveillance, and animal surveillance, e.g., monitoring of non-human primates for yellow fever in endemic regions. As the categories below are mutually exclusive, please place each staff person in only one column."
names(data)[739] <- "SX58_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 740] <- as.numeric(data[, 740])
# attributes(data)$variable.labels[740] <- "[Number of personnel] [Epidemiologists] 58. During 2019 (prior to the Covid-19 pandemic), indicate below the number of arbovirus surveillance staff at the national level. Surveillance staff include those who are responsible for human disease surveillance, mosquito (entomological) surveillance, and animal surveillance, e.g., monitoring of non-human primates for yellow fever in endemic regions. As the categories below are mutually exclusive, please place each staff person in only one column."
names(data)[740] <- "SX58_SQ001_SQ002"
# LimeSurvey Field type: F
data[, 741] <- as.numeric(data[, 741])
# attributes(data)$variable.labels[741] <- "[Number of personnel] [Laboratorians] 58. During 2019 (prior to the Covid-19 pandemic), indicate below the number of arbovirus surveillance staff at the national level. Surveillance staff include those who are responsible for human disease surveillance, mosquito (entomological) surveillance, and animal surveillance, e.g., monitoring of non-human primates for yellow fever in endemic regions. As the categories below are mutually exclusive, please place each staff person in only one column."
names(data)[741] <- "SX58_SQ001_SQ003"
# LimeSurvey Field type: F
data[, 742] <- as.numeric(data[, 742])
# attributes(data)$variable.labels[742] <- "[Number of personnel] [Entomologists/ vector control specialists ] 58. During 2019 (prior to the Covid-19 pandemic), indicate below the number of arbovirus surveillance staff at the national level. Surveillance staff include those who are responsible for human disease surveillance, mosquito (entomological) surveillance, and animal surveillance, e.g., monitoring of non-human primates for yellow fever in endemic regions. As the categories below are mutually exclusive, please place each staff person in only one column."
names(data)[742] <- "SX58_SQ001_SQ004"
# LimeSurvey Field type: F
data[, 743] <- as.numeric(data[, 743])
# attributes(data)$variable.labels[743] <- "[Number of personnel] [Support staff (administration; logistics; other)] 58. During 2019 (prior to the Covid-19 pandemic), indicate below the number of arbovirus surveillance staff at the national level. Surveillance staff include those who are responsible for human disease surveillance, mosquito (entomological) surveillance, and animal surveillance, e.g., monitoring of non-human primates for yellow fever in endemic regions. As the categories below are mutually exclusive, please place each staff person in only one column."
names(data)[743] <- "SX58_SQ001_SQ005"
# LimeSurvey Field type: F
data[, 744] <- as.numeric(data[, 744])
# attributes(data)$variable.labels[744] <- "[Number of personnel] [Clinicians] 59. Indicate below how many total staff persons are needed at the national level in your country to achieve full epidemiology and laboratory capacity* to conduct arbovirus surveillance.  *Full epidemiology and laboratory capacity are defined as:  i) ability to complete a standard case report form on every suspect arboviral disease case with laboratory criteria that meets the case definition and report it to the national health authority/ministry of health through appropriate mechanisms;  ii) regularly reporting timely surveillance data to local stakeholders;  iii) ability to test by IgM/other? for all locally transmitted and likely to be introduced Aedes-borne arboviruses on any serum specimen submitted to national or subnational lab on a suspected case of arboviral disease; and  iv) having an environmental surveillance system that includes Aedes mosquito surveillance to monitor vector activity when appropriate in all parts of the country in which there is the potential for human outbreaks of arboviral disease based on past experience."
names(data)[744] <- "SX59_SQ001_SQ001"
# LimeSurvey Field type: F
data[, 745] <- as.numeric(data[, 745])
# attributes(data)$variable.labels[745] <- "[Number of personnel] [Epidemiologists] 59. Indicate below how many total staff persons are needed at the national level in your country to achieve full epidemiology and laboratory capacity* to conduct arbovirus surveillance.  *Full epidemiology and laboratory capacity are defined as:  i) ability to complete a standard case report form on every suspect arboviral disease case with laboratory criteria that meets the case definition and report it to the national health authority/ministry of health through appropriate mechanisms;  ii) regularly reporting timely surveillance data to local stakeholders;  iii) ability to test by IgM/other? for all locally transmitted and likely to be introduced Aedes-borne arboviruses on any serum specimen submitted to national or subnational lab on a suspected case of arboviral disease; and  iv) having an environmental surveillance system that includes Aedes mosquito surveillance to monitor vector activity when appropriate in all parts of the country in which there is the potential for human outbreaks of arboviral disease based on past experience."
names(data)[745] <- "SX59_SQ001_SQ002"
# LimeSurvey Field type: F
data[, 746] <- as.numeric(data[, 746])
# attributes(data)$variable.labels[746] <- "[Number of personnel] [Laboratorians] 59. Indicate below how many total staff persons are needed at the national level in your country to achieve full epidemiology and laboratory capacity* to conduct arbovirus surveillance.  *Full epidemiology and laboratory capacity are defined as:  i) ability to complete a standard case report form on every suspect arboviral disease case with laboratory criteria that meets the case definition and report it to the national health authority/ministry of health through appropriate mechanisms;  ii) regularly reporting timely surveillance data to local stakeholders;  iii) ability to test by IgM/other? for all locally transmitted and likely to be introduced Aedes-borne arboviruses on any serum specimen submitted to national or subnational lab on a suspected case of arboviral disease; and  iv) having an environmental surveillance system that includes Aedes mosquito surveillance to monitor vector activity when appropriate in all parts of the country in which there is the potential for human outbreaks of arboviral disease based on past experience."
names(data)[746] <- "SX59_SQ001_SQ003"
# LimeSurvey Field type: F
data[, 747] <- as.numeric(data[, 747])
# attributes(data)$variable.labels[747] <- "[Number of personnel] [Entomologists/vector control specialists ] 59. Indicate below how many total staff persons are needed at the national level in your country to achieve full epidemiology and laboratory capacity* to conduct arbovirus surveillance.  *Full epidemiology and laboratory capacity are defined as:  i) ability to complete a standard case report form on every suspect arboviral disease case with laboratory criteria that meets the case definition and report it to the national health authority/ministry of health through appropriate mechanisms;  ii) regularly reporting timely surveillance data to local stakeholders;  iii) ability to test by IgM/other? for all locally transmitted and likely to be introduced Aedes-borne arboviruses on any serum specimen submitted to national or subnational lab on a suspected case of arboviral disease; and  iv) having an environmental surveillance system that includes Aedes mosquito surveillance to monitor vector activity when appropriate in all parts of the country in which there is the potential for human outbreaks of arboviral disease based on past experience."
names(data)[747] <- "SX59_SQ001_SQ004"
# LimeSurvey Field type: F
data[, 748] <- as.numeric(data[, 748])
# attributes(data)$variable.labels[748] <- "[Number of personnel] [Support staff (administration; logistics; other)] 59. Indicate below how many total staff persons are needed at the national level in your country to achieve full epidemiology and laboratory capacity* to conduct arbovirus surveillance.  *Full epidemiology and laboratory capacity are defined as:  i) ability to complete a standard case report form on every suspect arboviral disease case with laboratory criteria that meets the case definition and report it to the national health authority/ministry of health through appropriate mechanisms;  ii) regularly reporting timely surveillance data to local stakeholders;  iii) ability to test by IgM/other? for all locally transmitted and likely to be introduced Aedes-borne arboviruses on any serum specimen submitted to national or subnational lab on a suspected case of arboviral disease; and  iv) having an environmental surveillance system that includes Aedes mosquito surveillance to monitor vector activity when appropriate in all parts of the country in which there is the potential for human outbreaks of arboviral disease based on past experience."
names(data)[748] <- "SX59_SQ001_SQ005"
# LimeSurvey Field type: A
data[, 749] <- as.character(data[, 749])
# attributes(data)$variable.labels[749] <- "60. Optional comments to explain responses to questions 58 and 59 above."
names(data)[749] <- "SX60"
# LimeSurvey Field type: F
data[, 750] <- as.numeric(data[, 750])
# attributes(data)$variable.labels[750] <- "[Within the ministry of health (e.g., public health medical officers, clinicians in state hospitals)] 61. The national health authority/ministry of health has access to expertise in clinical management of arboviruses (Check all that apply)"
data[, 750] <- factor(data[, 750], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[750] <- "SX61_SQ001"
# LimeSurvey Field type: F
data[, 751] <- as.numeric(data[, 751])
# attributes(data)$variable.labels[751] <- "[Through other national agency with regulatory authority] 61. The national health authority/ministry of health has access to expertise in clinical management of arboviruses (Check all that apply)"
data[, 751] <- factor(data[, 751], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[751] <- "SX61_SQ002"
# LimeSurvey Field type: F
data[, 752] <- as.numeric(data[, 752])
# attributes(data)$variable.labels[752] <- "[Through academic institution(s)] 61. The national health authority/ministry of health has access to expertise in clinical management of arboviruses (Check all that apply)"
data[, 752] <- factor(data[, 752], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[752] <- "SX61_SQ003"
# LimeSurvey Field type: F
data[, 753] <- as.numeric(data[, 753])
# attributes(data)$variable.labels[753] <- "[Private hospitals] 61. The national health authority/ministry of health has access to expertise in clinical management of arboviruses (Check all that apply)"
data[, 753] <- factor(data[, 753], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[753] <- "SX61_SQ004"
# LimeSurvey Field type: F
data[, 754] <- as.numeric(data[, 754])
# attributes(data)$variable.labels[754] <- "[Does not have access] 61. The national health authority/ministry of health has access to expertise in clinical management of arboviruses (Check all that apply)"
data[, 754] <- factor(data[, 754], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[754] <- "SX61_SQ005"
# LimeSurvey Field type: A
data[, 755] <- as.character(data[, 755])
# attributes(data)$variable.labels[755] <- "[Other] 61. The national health authority/ministry of health has access to expertise in clinical management of arboviruses (Check all that apply)"
names(data)[755] <- "SX61_other"
# LimeSurvey Field type: F
data[, 756] <- as.numeric(data[, 756])
# attributes(data)$variable.labels[756] <- "[Within the ministry of health] 62. The national health authority/ministry of health has access to expertise in arbovirus epidemiology (Check all that apply)"
data[, 756] <- factor(data[, 756], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[756] <- "SX62_SQ001"
# LimeSurvey Field type: F
data[, 757] <- as.numeric(data[, 757])
# attributes(data)$variable.labels[757] <- "[Through other national agency with regulatory authority] 62. The national health authority/ministry of health has access to expertise in arbovirus epidemiology (Check all that apply)"
data[, 757] <- factor(data[, 757], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[757] <- "SX62_SQ002"
# LimeSurvey Field type: F
data[, 758] <- as.numeric(data[, 758])
# attributes(data)$variable.labels[758] <- "[Through academic institution(s)] 62. The national health authority/ministry of health has access to expertise in arbovirus epidemiology (Check all that apply)"
data[, 758] <- factor(data[, 758], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[758] <- "SX62_SQ003"
# LimeSurvey Field type: F
data[, 759] <- as.numeric(data[, 759])
# attributes(data)$variable.labels[759] <- "[Does not have access] 62. The national health authority/ministry of health has access to expertise in arbovirus epidemiology (Check all that apply)"
data[, 759] <- factor(data[, 759], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[759] <- "SX62_SQ004"
# LimeSurvey Field type: A
data[, 760] <- as.character(data[, 760])
# attributes(data)$variable.labels[760] <- "[Other] 62. The national health authority/ministry of health has access to expertise in arbovirus epidemiology (Check all that apply)"
names(data)[760] <- "SX62_other"
# LimeSurvey Field type: F
data[, 761] <- as.numeric(data[, 761])
# attributes(data)$variable.labels[761] <- "[Within the ministry of health (e.g. public health laboratory scientists)] 63. The national health authority/ministry of health has access to expertise in arbovirus laboratory diagnosis (Check all that apply)"
data[, 761] <- factor(data[, 761], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[761] <- "SX63_SQ001"
# LimeSurvey Field type: F
data[, 762] <- as.numeric(data[, 762])
# attributes(data)$variable.labels[762] <- "[Through other national agency with regulatory authority] 63. The national health authority/ministry of health has access to expertise in arbovirus laboratory diagnosis (Check all that apply)"
data[, 762] <- factor(data[, 762], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[762] <- "SX63_SQ002"
# LimeSurvey Field type: F
data[, 763] <- as.numeric(data[, 763])
# attributes(data)$variable.labels[763] <- "[Through academic institution(s)] 63. The national health authority/ministry of health has access to expertise in arbovirus laboratory diagnosis (Check all that apply)"
data[, 763] <- factor(data[, 763], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[763] <- "SX63_SQ003"
# LimeSurvey Field type: F
data[, 764] <- as.numeric(data[, 764])
# attributes(data)$variable.labels[764] <- "[Does not have access] 63. The national health authority/ministry of health has access to expertise in arbovirus laboratory diagnosis (Check all that apply)"
data[, 764] <- factor(data[, 764], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[764] <- "SX63_SQ004"
# LimeSurvey Field type: A
data[, 765] <- as.character(data[, 765])
# attributes(data)$variable.labels[765] <- "[Other] 63. The national health authority/ministry of health has access to expertise in arbovirus laboratory diagnosis (Check all that apply)"
names(data)[765] <- "SX63_other"
# LimeSurvey Field type: F
data[, 766] <- as.numeric(data[, 766])
# attributes(data)$variable.labels[766] <- "[Within the ministry of health] 64. The national health authority/ministry of health has access to expertise in entomology (Check all that apply)"
data[, 766] <- factor(data[, 766], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[766] <- "SX64_SQ001"
# LimeSurvey Field type: F
data[, 767] <- as.numeric(data[, 767])
# attributes(data)$variable.labels[767] <- "[Through other national agency with regulatory authority] 64. The national health authority/ministry of health has access to expertise in entomology (Check all that apply)"
data[, 767] <- factor(data[, 767], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[767] <- "SX64_SQ002"
# LimeSurvey Field type: F
data[, 768] <- as.numeric(data[, 768])
# attributes(data)$variable.labels[768] <- "[Through academic institution(s)] 64. The national health authority/ministry of health has access to expertise in entomology (Check all that apply)"
data[, 768] <- factor(data[, 768], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[768] <- "SX64_SQ003"
# LimeSurvey Field type: F
data[, 769] <- as.numeric(data[, 769])
# attributes(data)$variable.labels[769] <- "[Does not have access] 64. The national health authority/ministry of health has access to expertise in entomology (Check all that apply)"
data[, 769] <- factor(data[, 769], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[769] <- "SX64_SQ004"
# LimeSurvey Field type: A
data[, 770] <- as.character(data[, 770])
# attributes(data)$variable.labels[770] <- "[Other] 64. The national health authority/ministry of health has access to expertise in entomology (Check all that apply)"
names(data)[770] <- "SX64_other"
# LimeSurvey Field type: A
data[, 771] <- as.character(data[, 771])
# attributes(data)$variable.labels[771] <- "65. Optional comments to explain responses to any of Questions 61-64"
names(data)[771] <- "SX65"
# LimeSurvey Field type: A
data[, 772] <- as.character(data[, 772])
# attributes(data)$variable.labels[772] <- "66. If you have any further comments to add regarding arbovirus surveillance and control in your country, including whether arboviruses other than Aedes-borne arboviruses are of higher priority, please do so in the text field below. "
names(data)[772] <- "SC1"
# Variable name was incorrect and was changed from  to q_ .

