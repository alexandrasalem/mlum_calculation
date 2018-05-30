#!/bin/bash

echo "Running oo_to_chron on the files in the folder salty_oo_files"
for file in ./salty_oo_files/*
do
	echo $file
	python ./oo_to_chron.py $file  ./salty_chron_files/${file##*/}
done

echo "Running desaltify on the folder salty_chron_files/"

./desaltify/desaltify2.pl -bPafkijUlc ./not_salty_files ./salty_chron_files

echo "Running mlum_csv.py on the folder not_salty_files"

python mlum_csv.py ./not_salty_files/ ./output.csv 


#################################################################################
###Version for our specific files:

: <<'END'
echo "Running oo_to_chron on the files in the folder salty_oo_files"

#UW_GENDAAR:
for file in /home/asd-lang/salem/transcription_pull/salty_oo_files/UW_GENDAAR/*
do
	echo $file
	python ./oo_to_chron.py $file  /home/asd-lang/salem/transcription_pull/salty_chron_files/UW_GENDAAR/${file##*/}
done

#FNL:
for file in /home/asd-lang/salem/transcription_pull/salty_oo_files/FNL/*
do
	echo $file
	python ./oo_to_chron.py $file  /home/asd-lang/salem/transcription_pull/salty_chron_files/FNL/${file##*/}
done

for file in /home/asd-lang/salem/transcription_pull/salty_oo_files/MIND_orig/*
do
	echo $file
	python ./oo_to_chron.py $file  /home/asd-lang/salem/transcription_pull/salty_chron_files/MIND_orig/${file##*/}
done

for file in /home/asd-lang/salem/transcription_pull/salty_oo_files/MIND_csluified/*
do
	echo $file
	python ./oo_to_chron.py $file  /home/asd-lang/salem/transcription_pull/salty_chron_files/MIND_csluified/${file##*/}
done

for file in /home/asd-lang/salem/transcription_pull/salty_oo_files/ERPA/*
do
	echo $file
	python ./oo_to_chron.py $file  /home/asd-lang/salem/transcription_pull/salty_chron_files/ERPA/${file##*/}
done

echo "Running desaltify on the folder salty_chron_files/"

./desaltify/desaltify2.pl -bPafkijUlc /home/asd-lang/salem/transcription_pull/not_salty_files/MIND_orig_desalinated /home/asd-lang/salem/transcription_pull/salty_chron_files/MIND_orig
./desaltify/desaltify2.pl -bPafkijUlc /home/asd-lang/salem/transcription_pull/not_salty_files/MIND_csluified_desalinated /home/asd-lang/salem/transcription_pull/salty_chron_files/MIND_csluified
./desaltify/desaltify2.pl -bPafkijUlc /home/asd-lang/salem/transcription_pull/not_salty_files/UW_GENDAAR_desalinated /home/asd-lang/salem/transcription_pull/salty_chron_files/UW_GENDAAR
./desaltify/desaltify2.pl -bPafkijUlc /home/asd-lang/salem/transcription_pull/not_salty_files/FNL_desalinated /home/asd-lang/salem/transcription_pull/salty_chron_files/FNL
./desaltify/desaltify2.pl -bPafkijUlc /home/asd-lang/salem/transcription_pull/not_salty_files/ERPA_desalinated /home/asd-lang/salem/transcription_pull/salty_chron_files/ERPA


echo "Running mlum_csv.py on the folder not_salty_files"

python mlum_csv.py /home/asd-lang/salem/transcription_pull/not_salty_files/FNL_desalinated/ /home/asd-lang/salem/transcription_pull/FNL_mlum.csv
python mlum_csv.py /home/asd-lang/salem/transcription_pull/not_salty_files/ERPA_desalinated/ /home/asd-lang/salem/transcription_pull/ERPA_mlum.csv
python mlum_csv.py /home/asd-lang/salem/transcription_pull/not_salty_files/MIND_csluified_desalinated/ /home/asd-lang/salem/transcription_pull/MIND_csluified_mlum.csv
python mlum_csv.py /home/asd-lang/salem/transcription_pull/not_salty_files/MIND_orig_desalinated/ /home/asd-lang/salem/transcription_pull/MIND_orig_mlum.csv
python mlum_csv.py /home/asd-lang/salem/transcription_pull/not_salty_files/UW_GENDAAR_desalinated/ /home/asd-lang/salem/transcription_pull/UW_GENDAAR_mlum.csv
END