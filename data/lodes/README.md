### LODES
[Longitudinal Employer-Household Dynamics from the US Census Bureau](https://lehd.ces.census.gov/data/). The dataset contains employment information linked to a US census tract. 

### Structure
* the dataset contains and OD matrix of job commuters. 
* referenced to the census tract level -- really interesting.
* JT00 means that we have data for all jobs.

![Table Structure](,,/doc/structure.png)

### Data Processing
* download data from urls
	* http://lehd.ces.census.gov/data/lodes/LODES7/ca/od/ca_od_aux_JT00_2014.csv.gz
	* http://lehd.ces.census.gov/data/lodes/LODES7/ca/od/ca_od_main_JT00_2014.csv.gz
	* http://lehd.ces.census.gov/data/lodes/LODES7/ca/ca_xwalk.csv.gz

* decompress using

```
$ gzip -d *.gz
```

* data ingestion in database using `cstore_fdw` as follows: 

```sql
psql 'postgres://rawdata:flowflow@0.0.0.0:9001/brain' -f ingest.sql
psql 'postgres://rawdata:flowflow@0.0.0.0:9001/brain' -f ingest_xwalk.sql
```

### Methodology
The total number of people.
Very rough approximations.
This does not count for inflows and outflows.

### Conversation with LODES (Mark)
* people who are self-employed are not in the LODES data. 
* another caution with LODES: 
	* it could be many different things
	* only work there occasionally
	* only hold that job and goes once a month
	* representative of an administrative office, than
	  a place of a worker where they regularly shows up.
* LHED / LODES: 301-763-8303
* origin-destination flow, people may cross from States.
* just use both.
* they should be complimentary.

* use JT01: use primary job -- NOT JT00 (all jobs)

* Confidence Intervals: this is a non-traditional sampling data.
* We don't represent the uncertainty due to sampling. 
* There are other aspects of uncertainty in the data that are important to represent:
	* edits and inputations: instances where data is incomplete. maybe their work-place location
	  is imprecise. They apply edits and inputations to complete the data.
	* confidenciality protection measures: one of the challenges here is that 
	  this can be very concentrated with specific firms.
* With a traditional housing sample the error is mode difuse.
* With something like LODES, its more difficult to apply traditional CI.


### CTPP: Census Transportation Planning Package
* an additional tabulation that the Census Bureau produces.
* AshTo publishes this series.
* they have files 
* they take the ACS and release communiting statistics for that 5-year period. 
* some of those are a lot more detailed than the county level.

