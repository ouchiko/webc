#!/bin/bash
#
#   Price Paid Data from UK Government
#   https://data.gov.uk/dataset/land-registry-monthly-price-paid-data/resource/661fa5b9-99cf-4fa9-9b07-84f2fae00198
#
#   The resulting file is 3GIGs and most of that data is a large primary key
#   and resulting address data.  The logical way to reduce that is to only record
#   the postcode, price, typing, house number and then use the Street Data sets
#   from the UK Ord as an address lookup.  (IT has better data anyway).
#
#   This script offers three different options,
#       1. Remove all data files - good for new runs.
#       2. Parses downloaded data set into smaller subset of data
#       3. Takes parsed data and builds mysql insert.
#
echo;
echo "Price Paid Download Utility; (c)17, webcoding.co.uk"
echo;
####
# Sanity check.
if [ "$1" = "" ]; then
    echo "usage: ./getdata.sh"
    echo;
    echo "  --download  Removes existing downloads and starts again (3Gig..)"
    echo "  --parse     Parses the datasets into a reduced format"
    echo "  --gensql    Generates the SQL inserts for the db"
    echo;
    exit;
fi

echo "> $1"

####
# Removes data
# Removes any datasets which have been created thus far
if [ "$1" = "--download" ]; then
    ./run_default_prune
    wget "http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-complete.txt"
fi


####
# Prune: We want to process the data into a smaller dataset, postcode+houseNo is
# enough to generate an address from the uk-gov street data sets. Recording this
# information is pointless.
if [ "$1" = "--parse" ]; then
    echo "Calculating data..."
    LINES=`cat pp-complete.txt | wc -l`
    echo "Processing $LINES from price paid root file, this could take a lot of time... get some tea?"
    # take file.
    # present to awk, ensure we seperate by , and print out cols
    # present to sed, remove any quotes.
    # send to reduced.
    `cat pp-complete.txt | awk -F, '{print $2, $3, $4, $5, $6, $7, $8}' OFS='\t'| sed 's/"//g' > pp-complete-reduced.txt`
fi
