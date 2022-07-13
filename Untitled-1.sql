
#basic EDA on BEATAML1.0 patient cases dataset

#most deadly diesease in this dataset
with t as (select * from `isb-cgc-bq.BEATAML1_0.clinical_gdc_current`),
t1 as (select demo__vital_status, disease_type from t where demo__vital_status = "Dead")
select disease_type,count(*) from t1 group by disease_type;

#is Myeloid Leukemias more deadly to male or female
with t as 
(select * from `isb-cgc-bq.BEATAML1_0.clinical_gdc_current`),
t1 as 
(select * from t where demo__vital_status = "Dead" and disease_type = "Myeloid Leukemias")
select demo__gender,count(*) from t1 group by demo__gender;

#average documented Myeloid Leukemias death age
with t as
(select demo__age_at_index,disease_type,demo__vital_status from `isb-cgc-bq.BEATAML1_0.clinical_gdc_current`
where demo__age_at_index is not null)
select avg(demo__age_at_index) as avg_death_age from t;

