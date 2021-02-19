# This file makes tables for the concepts in the aline subfolder.
# Be sure to run postgres-functions.sql first, as the concepts rely on those function definitions.
# Note that this may take a large amount of time and hard drive space.

# string replacements are necessary for some queries
export REGEX_DATETIME_DIFF="s/DATETIME_DIFF\((.+?),\s?(.+?),\s?(DAY|MINUTE|SECOND|HOUR|YEAR)\)/DATETIME_DIFF(\1, \2, '\3')/g"
export REGEX_SCHEMA='s/`physionet-data.(mimiciii_clinical|mimiciii_derived|mimiciii_notes).(.+?)`/\2/g'
export CONNSTR='-U mimicuser -d mimic'
# may have to replace -U mimicuser with -U <insert your mimic db username here>

# this is set as the search_path variable for psql
# a search path of "public,mimiciii" will search both public and mimiciii
# schemas for data, but will create tables on the public schema
export PSQL_PREAMBLE='SET search_path TO public,mimiciii'

echo ''
echo '==='
echo 'Beginning to create tables for MIMIC database.'
echo 'Any notices of the form "NOTICE: TABLE "XXXXXX" does not exist" can be ignored.'
echo 'The scripts drop views before creating them, and these notices indicate nothing existed prior to creating the view.'
echo '==='
echo ''

echo 'aline_vaso_flag.sql'
{ echo "${PSQL_PREAMBLE};"; cat aline_vaso_flag.sql; } | sed -r -e "${REGEX_DATETIME_DIFF}" | sed -r -e "${REGEX_SCHEMA}" | psql ${CONNSTR}

echo 'Finished creating tables.'
