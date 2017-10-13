SOURCE="/home/hellrich/tmp/jedisem"
TARGET="/home/hellrich/tmp/jedisem/jeseme_v2_import"
EMOPATH="/home/hellrich/JeSemE/pipeline/transform_models/notgit"
EN_EMO=$EMOPATH/Ratings_Warriner_et_al.csv
DE_EMO=$EMOPATH/13428_2013_426_MOESM1_ESM.xlsx  

mkdir -p $TARGET

for x in google_fiction coha50
do 
   python vectors2similarity.py $TARGET/$x 10000 $EN_EMO en $SOURCE/$x/*
done

python vectors2similarity.py $TARGET/rsc 5000 $EN_EMO en $SOURCE/royal_society_corpus/models/*

for x in google_german dta50
do
   python vectors2similarity.py $TARGET/$x 10000 de $DE_EMO $SOURCE/$x/*
done
