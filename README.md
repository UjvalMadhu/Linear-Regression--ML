# Linear-Regression- Predicting Life Expectancies of Different Countries

This is a simple linear regression and Normal equation implementation to calculate the average life expectancies of different countries.
The life expectancies are caluclated by using the GDP per capita, Exponential Pollution scale index, and population density per km^2 as the parameters.
The above constraints are selected to demonstrate their impact on the health of the citizens of a respected country.
The purpose of this project however is not to create an accurate representation, as there are many other design constraints that need to be taken into account like the efficiency of the ruling government, climatic conditions, healthcare development, lifestyle factors like exercise rate, food consumption etc.

Motivation: This project is solely intended for Algorithm learning purposes.

Data Preparation: 
The data for this project was collected from different sources as a single source with all neccessary data was unavailable.
The data sources are:
1) https://www.who.int
2) https://www.worldometers.info/
3) https://www.numbeo.com
4) https://en.wikipedia.org
5) https://data.worldbank.org

The data that was prepared is as follows:
| Sl No. |	Country |	Density (P/Km²) |	GDP Per capita ($) |	Exp Pollution Scale Index |	Life Expectancy |
|:-------|:---------|:----------------|:-------------------|:---------------------------|:----------------
| 1	| Afghanistan |	60 |	538.00 	| 160	 | 63.2 |
| 2	| Albania| 	105		| 4,521.00		| 138	| 	78	|
| 3	| Algeria| 	18	| 	4,048.00		| 114		| 77.1	| 
| 4	| Andorra	| 164	| 	39,128.00	| 	55	|  	83.3	| 
| 5	| Angola | 	26		| 4,096.00		| 176		| 63.1	| 
| 6	| Antigua and Barbuda | 	223		| 15,825.00		| 116		| 76.5	|
| 7	| Argentina	| 17	| 	14,508.00		| 87	| 	76.6	| 
| 8	| Armenia	| 104	| 	3,918.00		| 108	| 	76	| 
| 9	| Australia	| 3		| 53,831.00		| 37		| 83	|
| 10 | Austria	| 109		| 47,261.00		| 33	| 	81.6	| 
| 11	| Azerbaijan| 	123	| 	4,139.00	| 	130	| 	71.4	| 
| 12	| Bahrain	| 2,239		| 23,715.00	| 129		| 75.8	| 
| 13	| Bangladesh	| 	1,265		| 1,564.00		| 152		| 74.3	| 
| 14	| Barbados	| 668	| 	16,328.00		| 49	| 	76	| 
| 15	| Belarus	| 	47	| 	5,762.00	| 	74	| 	74.8	| 
| 16	| Belgium	| 	383	| 	43,325.00	| 	84	| 	81.4	| 
| 17	| Belize	| 	17	| 	4,957.00	| 	96	| 	74.4	| 
| 18	| Bhutan	| 	20	| 	3,391.00	| 	93	| 	73.1	| 
| 19	| Bolivia	| 	11	| 	3,351.00	| 	128	| 	72.1	| 
| 20	| Bosnia and Herzegovina	| 	64	| 	5,387.00	| 	108	| 	76.8	| 
| 21	| Brazil	| 	25	| 	9,881.00	| 	93	| 	75.9	| 
| 22	| Bulgaria	| 	64	| 	8,197.00	| 	116	| 	75.1	| 
| 23	| Cambodia	| 	95	| 	1,384.00	| 	138	| 	70.1	| 
| 24	| Cameroon	| 	56	| 	1,422.00	| 	162	| 	62.4	| 
| 25	| Canada	| 	4		| 44,841.00	| 	46	| 	82.2	| 
| 26	| Chile	| 	26	| 	15,001.00	| 	141	| 	80.7	| 
| 27	| China	| 	153	| 	8,612.00	| 	148	| 	77.4	| 
| 28	| Colombia	| 	46	| 	6,429.00	| 	112	| 	79.3	| 
| 29	| Congo (Congo-Brazzaville)	| 	16	| 	1,703.00	| 	175	| 	64.7	| 
| 30	| Costa Rica	| 	100	| 	11,573.00	| 	91	| 	80.8	| 
| 31	| Croatia	| 	73	| 	13,200.00	| 	50	| 	78.6	| 
| 32	| Cuba	| 	106	| 	8,541.00	| 	114	| 	77.8	| 
| 33	| Cyprus	| 	131	| 	18,695.00	| 	93	| 	83.1	| 
| 34	| Czechia (Czech Republic)	| 	139	| 	20,291.00	| 	60	| 	79.1	| 
| 35	| Denmark		| 137	| 	57,545.00	| 	32		| 81.3	| 
| 36	| Dominican Republic	| 	225	| 	7,223.00	| 	132	| 	72.8	| 
| 37	| Ecuador	| 	71	| 	6,214.00	| 	99	| 	78.4	| 
| 38	| Egypt	| 	103	| 	2,441.00	| 	149	| 	71.8	| 
| 39	| Estonia		| 31	| 	20,170.00	| 	32	| 	78.9	| 
| 40	| Ethiopia	| 	115		| 757.00	| 	136		| 68.7	| 
| 41	| Fiji	| 	49	| 	5,768.00	| 	90	| 	68	| 
| 42	| Finland	| 	18	| 	45,778.00	| 	20	| 	81.6	| 
| 43	| France	| 	119	| 	39,827.00	| 	70	| 	82.5	| 
| 44	| Georgia	| 	57	| 	3,762.00	| 	125	| 	73.3	| 
| 45	| Germany	| 240	| 	44,680.00	| 	45	| 	81.7	| 
| 46	| Ghana	| 	137	| 	2,026.00	| 	159	| 	66.3	| 
| 47	| Greece	| 	81	| 	19,214.00	| 	90	| 	81.1	| 
| 48	| Guatemala	| 	167	| 	4,471.00	| 	127	| 	72	| 
| 49	| Haiti	| 	414		| 766.00	| 	155	| 	64.1	| 
| 50	| Hong Kong	| 	6,670	| 	46,733.00	| 	120		| 71.9	| 
| 51	| Honduras	| 	89	| 	2,405.00	| 	140	| 	85	| 
| 52	| Hungary	| 	107	| 	14,364.00	| 	83	| 	76.4	| 
| 53	| Iceland	| 	3	| 	73,233.00	| 	27	| 	82.3	| 
| 54	| India		| 464	| 	1,980.00	| 	141	| 	70.8	| 
| 55	| Indonesia	| 	151	| 	3,837.00	| 	115	| 	71.3	| 
| 56	| Iran	| 	52	| 	5,628.00	| 	138	| 	77.3	| 
| 57	| Iraq	| 	93	| 	5,114.00	| 	128	| 	72.4	| 
| 58	| Ireland	| 	72	| 	69,727.00	| 	56	| 	81.8	| 
| 59	| Israel	| 	400	| 	42,852.00	| 	103	| 	82.6	| 


The data was then extracted and made into comma seperated format in the form of a text file 'D1.txt"




