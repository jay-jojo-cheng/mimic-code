-- ----------------------------------------------------------------
--
-- This is a script to add the MIMIC-III indexes for Postgres.
--
-- ----------------------------------------------------------------

-- The below command defines the schema where all the indexes are created
SET search_path TO mimiciii;

-- Restoring the search path to its default value can be accomplished as follows:
--  SET search_path TO "$user",public;

-------------
-- ADMISSIONS
-------------

drop index IF EXISTS ADMISSIONS_idx01;
CREATE INDEX ADMISSIONS_IDX01
  ON ADMISSIONS (SUBJECT_ID,HADM_ID);

drop index IF EXISTS ADMISSIONS_idx02;
CREATE INDEX ADMISSIONS_IDX02
  ON ADMISSIONS (ADMITTIME, DISCHTIME, DEATHTIME);

drop index IF EXISTS ADMISSIONS_idx03;
CREATE INDEX ADMISSIONS_IDX03
  ON ADMISSIONS (ADMISSION_TYPE);


-----------
--CALLOUT--
-----------

drop index IF EXISTS CALLOUT_idx01;
CREATE INDEX CALLOUT_IDX01
  ON CALLOUT (SUBJECT_ID, HADM_ID);

drop index IF EXISTS CALLOUT_idx02;
CREATE INDEX CALLOUT_IDX02
  ON CALLOUT (CURR_CAREUNIT);

drop index IF EXISTS CALLOUT_idx03;
CREATE INDEX CALLOUT_IDX03
  ON CALLOUT (CALLOUT_SERVICE);

drop index IF EXISTS CALLOUT_idx04;
CREATE INDEX CALLOUT_IDX04
  ON CALLOUT (CURR_WARDID, CALLOUT_WARDID,
    DISCHARGE_WARDID);

drop index IF EXISTS CALLOUT_idx05;
CREATE INDEX CALLOUT_IDX05
  ON CALLOUT (CALLOUT_STATUS,
    CALLOUT_OUTCOME);

drop index IF EXISTS CALLOUT_idx06;
CREATE INDEX CALLOUT_IDX06
  ON CALLOUT (CREATETIME, UPDATETIME,
    ACKNOWLEDGETIME, OUTCOMETIME);

---------------
-- CAREGIVERS
---------------

drop index IF EXISTS CAREGIVERS_idx01;
CREATE INDEX CAREGIVERS_IDX01
  ON CAREGIVERS (CGID, LABEL);

---------------
-- CHARTEVENTS
---------------
drop index IF EXISTS CHARTEVENTS_idx01;
CREATE INDEX CHARTEVENTS_idx01
  ON CHARTEVENTS (SUBJECT_ID, HADM_ID, ICUSTAY_ID);


drop index IF EXISTS CHARTEVENTS_idx02;
CREATE INDEX CHARTEVENTS_idx02
  ON CHARTEVENTS (ITEMID);


drop index IF EXISTS CHARTEVENTS_idx03;
CREATE INDEX CHARTEVENTS_idx03
  ON CHARTEVENTS (CHARTTIME, STORETIME);


drop index IF EXISTS CHARTEVENTS_idx04;
CREATE INDEX CHARTEVENTS_idx04
  ON CHARTEVENTS (CGID);

-- Perhaps not useful to index on just value? Index just for popular subset?
-- drop index IF EXISTS CHARTEVENTS_idx05;
-- CREATE INDEX CHARTEVENTS_idx05
--   ON CHARTEVENTS (VALUE);

---------------
-- CPTEVENTS
---------------

drop index IF EXISTS CPTEVENTS_idx01;
CREATE INDEX CPTEVENTS_idx01
  ON CPTEVENTS (SUBJECT_ID, HADM_ID);

drop index IF EXISTS CPTEVENTS_idx02;
CREATE INDEX CPTEVENTS_idx02
  ON CPTEVENTS (CPT_CD, TICKET_ID_SEQ);

-----------
-- D_CPT
-----------

-- Table is 134 rows - doesn't need an index.

--------------------
-- D_ICD_DIAGNOSES
--------------------

-- drop index IF EXISTS D_ICD_DIAG_idx01;
-- CREATE INDEX D_ICD_DIAG_idx01
--   ON D_ICD_DIAGNOSES (ICD9_CODE, DIAG_OR_PROC);

drop index IF EXISTS D_ICD_DIAG_idx02;
CREATE INDEX D_ICD_DIAG_idx02
  ON D_ICD_DIAGNOSES (SHORT_TITLE, LONG_TITLE);

--------------------
-- D_ICD_PROCEDURES
--------------------

-- drop index IF EXISTS D_ICD_PROC_idx01;
-- CREATE INDEX D_ICD_PROC_idx01
--   ON D_ICD_PROCEDURES (ICD9_CODE, DIAG_OR_PROC);

drop index IF EXISTS D_ICD_PROC_idx02;
CREATE INDEX D_ICD_PROC_idx02
  ON D_ICD_PROCEDURES (SHORT_TITLE, LONG_TITLE);

-----------
-- D_ITEMS
-----------

drop index IF EXISTS D_ITEMS_idx01;
CREATE INDEX D_ITEMS_idx01
  ON D_ITEMS (ITEMID);

drop index IF EXISTS D_ITEMS_idx02;
CREATE INDEX D_ITEMS_idx02
  ON D_ITEMS (LABEL, DBSOURCE);

drop index IF EXISTS D_ITEMS_idx03;
CREATE INDEX D_ITEMS_idx03
  ON D_ITEMS (CATEGORY);

---------------
-- D_LABITEMS
---------------

drop index IF EXISTS D_LABITEMS_idx01;
CREATE INDEX D_LABITEMS_idx01
  ON D_LABITEMS (ITEMID);

drop index IF EXISTS D_LABITEMS_idx02;
CREATE INDEX D_LABITEMS_idx02
  ON D_LABITEMS (LABEL, FLUID, CATEGORY);

drop index IF EXISTS D_LABITEMS_idx03;
CREATE INDEX D_LABITEMS_idx03
  ON D_LABITEMS (LOINC_CODE);

-------------------
-- DATETIMEEVENTS
-------------------

drop index IF EXISTS DATETIMEEVENTS_idx01;
CREATE INDEX DATETIMEEVENTS_idx01
  ON DATETIMEEVENTS (SUBJECT_ID,
    HADM_ID, ICUSTAY_ID);

drop index IF EXISTS DATETIMEEVENTS_idx02;
CREATE INDEX DATETIMEEVENTS_idx02
  ON DATETIMEEVENTS (ITEMID);

drop index IF EXISTS DATETIMEEVENTS_idx03;
CREATE INDEX DATETIMEEVENTS_idx03
  ON DATETIMEEVENTS (CHARTTIME);

drop index IF EXISTS DATETIMEEVENTS_idx04;
CREATE INDEX DATETIMEEVENTS_idx04
  ON DATETIMEEVENTS (CGID);

drop index IF EXISTS DATETIMEEVENTS_idx05;
CREATE INDEX DATETIMEEVENTS_idx05
  ON DATETIMEEVENTS (VALUE);

------------------
-- DIAGNOSES_ICD
------------------

drop index IF EXISTS DIAGNOSES_ICD_idx01;
CREATE INDEX DIAGNOSES_ICD_idx01
  ON DIAGNOSES_ICD (SUBJECT_ID, HADM_ID);

drop index IF EXISTS DIAGNOSES_ICD_idx02;
CREATE INDEX DIAGNOSES_ICD_idx02
  ON DIAGNOSES_ICD (ICD9_CODE, SEQ_NUM);

--------------
-- DRGCODES
--------------

drop index IF EXISTS DRGCODES_idx01;
CREATE INDEX DRGCODES_idx01
  ON DRGCODES (SUBJECT_ID, HADM_ID);

drop index IF EXISTS DRGCODES_idx02;
CREATE INDEX DRGCODES_idx02
  ON DRGCODES (DRG_CODE, DRG_TYPE);

drop index IF EXISTS DRGCODES_idx03;
CREATE INDEX DRGCODES_idx03
  ON DRGCODES (DESCRIPTION, DRG_SEVERITY);

------------------
-- ICUSTAYS
------------------

drop index IF EXISTS ICUSTAYS_idx01;
CREATE INDEX ICUSTAYS_idx01
  ON ICUSTAYS (SUBJECT_ID, HADM_ID);

drop index IF EXISTS ICUSTAYS_idx02;
CREATE INDEX ICUSTAYS_idx02
  ON ICUSTAYS (ICUSTAY_ID, DBSOURCE);

drop index IF EXISTS ICUSTAYS_idx03;
CREATE INDEX ICUSTAYS_idx03
  ON ICUSTAYS (LOS);

drop index IF EXISTS ICUSTAYS_idx04;
CREATE INDEX ICUSTAYS_idx04
  ON ICUSTAYS (FIRST_CAREUNIT);

drop index IF EXISTS ICUSTAYS_idx05;
CREATE INDEX ICUSTAYS_idx05
  ON ICUSTAYS (LAST_CAREUNIT);

-------------
-- INPUTEVENTS_CV
-------------

drop index IF EXISTS INPUTEVENTS_CV_idx01;
CREATE INDEX INPUTEVENTS_CV_idx01
  ON INPUTEVENTS_CV (SUBJECT_ID);

  drop index IF EXISTS INPUTEVENTS_CV_idx02;
  CREATE INDEX INPUTEVENTS_CV_idx02
    ON INPUTEVENTS_CV (HADM_ID);

drop index IF EXISTS INPUTEVENTS_CV_idx03;
CREATE INDEX INPUTEVENTS_CV_idx03
  ON INPUTEVENTS_CV (ICUSTAY_ID);

drop index IF EXISTS INPUTEVENTS_CV_idx04;
CREATE INDEX INPUTEVENTS_CV_idx04
  ON INPUTEVENTS_CV (CHARTTIME);

drop index IF EXISTS INPUTEVENTS_CV_idx05;
CREATE INDEX INPUTEVENTS_CV_idx05
  ON INPUTEVENTS_CV (ITEMID);

drop index IF EXISTS INPUTEVENTS_CV_idx06;
CREATE INDEX INPUTEVENTS_CV_idx06
  ON INPUTEVENTS_CV (RATE);

drop index IF EXISTS INPUTEVENTS_CV_idx07;
CREATE INDEX INPUTEVENTS_CV_idx07
  ON INPUTEVENTS_CV (AMOUNT);

drop index IF EXISTS INPUTEVENTS_CV_idx08;
CREATE INDEX INPUTEVENTS_CV_idx08
  ON INPUTEVENTS_CV (CGID);

drop index IF EXISTS INPUTEVENTS_CV_idx09;
CREATE INDEX INPUTEVENTS_CV_idx09
  ON INPUTEVENTS_CV (LINKORDERID, ORDERID);

-------------
-- INPUTEVENTS_MV
-------------

drop index IF EXISTS INPUTEVENTS_MV_idx01;
CREATE INDEX INPUTEVENTS_MV_idx01
  ON INPUTEVENTS_MV (SUBJECT_ID);

drop index IF EXISTS INPUTEVENTS_MV_idx02;
CREATE INDEX INPUTEVENTS_MV_idx02
  ON INPUTEVENTS_MV (HADM_ID);

drop index IF EXISTS INPUTEVENTS_MV_idx03;
CREATE INDEX INPUTEVENTS_MV_idx03
  ON INPUTEVENTS_MV (ICUSTAY_ID);

drop index IF EXISTS INPUTEVENTS_MV_idx04;
CREATE INDEX INPUTEVENTS_MV_idx04
  ON INPUTEVENTS_MV (ENDTIME, STARTTIME);

drop index IF EXISTS INPUTEVENTS_MV_idx05;
CREATE INDEX INPUTEVENTS_MV_idx05
  ON INPUTEVENTS_MV (ITEMID);

drop index IF EXISTS INPUTEVENTS_MV_idx06;
CREATE INDEX INPUTEVENTS_MV_idx06
  ON INPUTEVENTS_MV (RATE);

drop index IF EXISTS INPUTEVENTS_MV_idx07;
CREATE INDEX INPUTEVENTS_MV_idx07
  ON INPUTEVENTS_MV (VOLUME);

drop index IF EXISTS INPUTEVENTS_MV_idx08;
CREATE INDEX INPUTEVENTS_MV_idx08
  ON INPUTEVENTS_MV (CGID);

drop index IF EXISTS INPUTEVENTS_MV_idx09;
CREATE INDEX INPUTEVENTS_MV_idx09
  ON INPUTEVENTS_MV (LINKORDERID, ORDERID);

drop index IF EXISTS INPUTEVENTS_MV_idx10;
CREATE INDEX INPUTEVENTS_MV_idx10
  ON INPUTEVENTS_MV (ORDERCATEGORYDESCRIPTION,
    ORDERCATEGORYNAME, SECONDARYORDERCATEGORYNAME);

drop index IF EXISTS INPUTEVENTS_MV_idx11;
CREATE INDEX INPUTEVENTS_MV_idx101
  ON INPUTEVENTS_MV (ORDERCOMPONENTTYPEDESCRIPTION,
    ORDERCATEGORYDESCRIPTION);


--------------
-- LABEVENTS
--------------

drop index IF EXISTS LABEVENTS_idx01;
CREATE INDEX LABEVENTS_idx01
  ON LABEVENTS (SUBJECT_ID, HADM_ID);

drop index IF EXISTS LABEVENTS_idx02;
CREATE INDEX LABEVENTS_idx02
  ON LABEVENTS (ITEMID);

drop index IF EXISTS LABEVENTS_idx03;
CREATE INDEX LABEVENTS_idx03
  ON LABEVENTS (CHARTTIME);

drop index IF EXISTS LABEVENTS_idx04;
CREATE INDEX LABEVENTS_idx04
  ON LABEVENTS (VALUE, VALUENUM);

----------------------
-- MICROBIOLOGYEVENTS
----------------------

drop index IF EXISTS MICROBIOLOGYEVENTS_idx01;
CREATE INDEX MICROBIOLOGYEVENTS_idx01
  ON MICROBIOLOGYEVENTS (SUBJECT_ID, HADM_ID);

drop index IF EXISTS MICROBIOLOGYEVENTS_idx02;
CREATE INDEX MICROBIOLOGYEVENTS_idx02
  ON MICROBIOLOGYEVENTS (CHARTDATE, CHARTTIME);

drop index IF EXISTS MICROBIOLOGYEVENTS_idx03;
CREATE INDEX MICROBIOLOGYEVENTS_idx03
  ON MICROBIOLOGYEVENTS (SPEC_ITEMID,
    ORG_ITEMID, AB_ITEMID);

---------------
-- NOTEEVENTS
---------------

drop index IF EXISTS NOTEEVENTS_idx01;
CREATE INDEX NOTEEVENTS_idx01
  ON NOTEEVENTS (SUBJECT_ID, HADM_ID);

drop index IF EXISTS NOTEEVENTS_idx02;
CREATE INDEX NOTEEVENTS_idx02
  ON NOTEEVENTS (CHARTDATE);

drop index IF EXISTS NOTEEVENTS_idx03;
CREATE INDEX NOTEEVENTS_idx03
  ON NOTEEVENTS (CGID);

drop index IF EXISTS NOTEEVENTS_idx04;
CREATE INDEX NOTEEVENTS_idx04
  ON NOTEEVENTS (RECORD_ID);

drop index IF EXISTS NOTEEVENTS_idx05;
CREATE INDEX NOTEEVENTS_idx05
  ON NOTEEVENTS (CATEGORY, DESCRIPTION);


---------------
-- OUTPUTEVENTS
---------------
drop index IF EXISTS OUTPUTEVENTS_idx01;
CREATE INDEX OUTPUTEVENTS_idx01
  ON OUTPUTEVENTS (SUBJECT_ID, HADM_ID, ICUSTAY_ID);


drop index IF EXISTS OUTPUTEVENTS_idx02;
CREATE INDEX OUTPUTEVENTS_idx02
  ON OUTPUTEVENTS (ITEMID);


drop index IF EXISTS OUTPUTEVENTS_idx03;
CREATE INDEX OUTPUTEVENTS_idx03
  ON OUTPUTEVENTS (CHARTTIME, STORETIME);


drop index IF EXISTS OUTPUTEVENTS_idx04;
CREATE INDEX OUTPUTEVENTS_idx04
  ON OUTPUTEVENTS (CGID);

-- Perhaps not useful to index on just value? Index just for popular subset?
-- drop index IF EXISTS OUTPUTEVENTS_idx05;
-- CREATE INDEX OUTPUTEVENTS_idx05
--   ON OUTPUTEVENTS (VALUE);


-------------
-- PATIENTS
-------------

-- Note that SUBJECT_ID is already indexed as it is unique

drop index IF EXISTS PATIENTS_idx01;
CREATE INDEX PATIENTS_idx01
  ON PATIENTS (EXPIRE_FLAG);


------------------
-- PRESCRIPTIONS
------------------

drop index IF EXISTS PRESCRIPTIONS_idx01;
CREATE INDEX PRESCRIPTIONS_idx01
  ON PRESCRIPTIONS (SUBJECT_ID, HADM_ID);

drop index IF EXISTS PRESCRIPTIONS_idx02;
CREATE INDEX PRESCRIPTIONS_idx02
  ON PRESCRIPTIONS (ICUSTAY_ID);

drop index IF EXISTS PRESCRIPTIONS_idx03;
CREATE INDEX PRESCRIPTIONS_idx03
  ON PRESCRIPTIONS (DRUG_TYPE);

drop index IF EXISTS PRESCRIPTIONS_idx04;
CREATE INDEX PRESCRIPTIONS_idx04
  ON PRESCRIPTIONS (DRUG);

drop index IF EXISTS PRESCRIPTIONS_idx05;
CREATE INDEX PRESCRIPTIONS_idx05
  ON PRESCRIPTIONS (STARTTIME, ENDTIME);


---------------------
-- PROCEDUREEVENTS_MV
---------------------

drop index IF EXISTS PROCEDUREEVENTS_MV_idx01;
CREATE INDEX PROCEDUREEVENTS_MV_idx01
  ON PROCEDUREEVENTS_MV (SUBJECT_ID);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx02;
CREATE INDEX PROCEDUREEVENTS_MV_idx02
  ON PROCEDUREEVENTS_MV (HADM_ID);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx03;
CREATE INDEX PROCEDUREEVENTS_MV_idx03
  ON PROCEDUREEVENTS_MV (ICUSTAY_ID);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx04;
CREATE INDEX PROCEDUREEVENTS_MV_idx04
  ON PROCEDUREEVENTS_MV (ENDTIME, STARTTIME);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx05;
CREATE INDEX PROCEDUREEVENTS_MV_idx05
  ON PROCEDUREEVENTS_MV (ITEMID);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx06;
CREATE INDEX PROCEDUREEVENTS_MV_idx06
  ON PROCEDUREEVENTS_MV (VALUE);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx07;
CREATE INDEX PROCEDUREEVENTS_MV_idx07
  ON PROCEDUREEVENTS_MV (CGID);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx08;
CREATE INDEX PROCEDUREEVENTS_MV_idx08
  ON PROCEDUREEVENTS_MV (LINKORDERID, ORDERID);

drop index IF EXISTS PROCEDUREEVENTS_MV_idx09;
CREATE INDEX PROCEDUREEVENTS_MV_idx09
  ON PROCEDUREEVENTS_MV (ORDERCATEGORYDESCRIPTION,
    ORDERCATEGORYNAME, SECONDARYORDERCATEGORYNAME);

-------------------
-- PROCEDURES_ICD
-------------------

drop index IF EXISTS PROCEDURES_ICD_idx01;
CREATE INDEX PROCEDURES_ICD_idx01
  ON PROCEDURES_ICD (SUBJECT_ID, HADM_ID);

drop index IF EXISTS PROCEDURES_ICD_idx02;
CREATE INDEX PROCEDURES_ICD_idx02
  ON PROCEDURES_ICD (ICD9_CODE, SEQ_NUM);

-------------
-- SERVICES
-------------

drop index IF EXISTS SERVICES_idx01;
CREATE INDEX SERVICES_idx01
  ON SERVICES (SUBJECT_ID, HADM_ID);

drop index IF EXISTS SERVICES_idx02;
CREATE INDEX SERVICES_idx02
  ON SERVICES (TRANSFERTIME);

drop index IF EXISTS SERVICES_idx03;
CREATE INDEX SERVICES_idx03
  ON SERVICES (CURR_SERVICE, PREV_SERVICE);

-------------
-- TRANSFERS
-------------

drop index IF EXISTS TRANSFERS_idx01;
CREATE INDEX TRANSFERS_idx01
  ON TRANSFERS (SUBJECT_ID, HADM_ID);

drop index IF EXISTS TRANSFERS_idx02;
CREATE INDEX TRANSFERS_idx02
  ON TRANSFERS (ICUSTAY_ID);

drop index IF EXISTS TRANSFERS_idx03;
CREATE INDEX TRANSFERS_idx03
  ON TRANSFERS (CURR_CAREUNIT, PREV_CAREUNIT);

drop index IF EXISTS TRANSFERS_idx04;
CREATE INDEX TRANSFERS_idx04
  ON TRANSFERS (INTIME, OUTTIME);

drop index IF EXISTS TRANSFERS_idx05;
CREATE INDEX TRANSFERS_idx05
  ON TRANSFERS (LOS);
