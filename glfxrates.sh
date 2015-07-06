echo ===========================
echo Welcome to GL FX Rate Fixer
echo Enter .out file name:
read filename </dev/tty
echo 
echo 

# == VARIABLES ==
newfile="NEW-"$filename
truetrue=TRUE\,TRUE
truefalse=TRUE\,FALSE
declare -a curr=(ISOCODE ARS AUD CAD CHF CNY DKK EUR GBP HKD IDR INR MYR NOK NZD RUB SEK SGD ZAR)

# == Trim currency lines we don't need and dump into new var==
outfilecontents="$(awk '/ISOCODE|ARS|AUD|CAD|CHF|CNY|DKK|EUR|GBP|HKD|IDR|INR|MYR|NOK|NZD|RUB|SEK|SGD|ZAR/' $filename)"

# == Echo with quotes to maintain line breaks, replacing ISCORPORATE TRUE with FALSE, save to new file ==
# echo "$outfilecontents"
echo "${outfilecontents//$truetrue/$truefalse}" >$newfile
echo COMPLETE!
