python features-to-vw.py < train_features.csv > train.vw
python features-to-vw.py < test_features.csv > test.vw

vw train.vw -c -k --passes 40 -l 0.85 -f model.vw --loss_function quantile --quantile_tau 0.6
vw test.vw -t -i model.vw -p shop.preds.txt

python vw-preds-to-csv.py < shop.preds.txt > submission-4.csv