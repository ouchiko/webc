
# Price Paid Data from UK Government
You can find more on the data here.
https://data.gov.uk/dataset/land-registry-monthly-price-paid-data/resource/661fa5b9-99cf-4fa9-9b07-84f2fae00198

# Description of process
The resulting file is 3GIGs and most of that data is a large primary key
and resulting address data.  The logical way to reduce that is to only record
the postcode, price, typing, house number and then use the Street Data sets
from the UK Ord as an address lookup.  (IT has better data anyway).

This script offers three different options:
   1. Remove all data files - good for new runs.
   2. Parses downloaded data set into smaller subset of data
   3. Takes parsed data and builds mysql insert.



# Post Process

Once completed, you need to ensure you table is generated and then load the file
into MySQL.

Example:

```LOAD DATA INFILE 'data.txt' INTO TABLE PricePaid  FIELDS TERMINATED BY '\t' ```
