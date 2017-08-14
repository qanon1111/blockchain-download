#!/bin/sh

#THIS SCRIPT AUTOMATCALLY DOWNLOADS THE BLOCKCHAIN FILES INTO YOUR YOUR ~/.bytecoind directory

#REGION NEEDS TO BE A VAULE OF "EU", "US", OR "AS"

#CURRENT TEST URL
#https://storage.googleapis.com/bcn-blockchain-test-us-east/blockchain-20170804.zip

#TO-DO ADD LOGIC TO AUTO GET THE CURRENT DATE
export BLOCKCHAIN_DATE="20170804"

export REGION="us-east"
export BUCKET="bcn-blockchain-test-$REGION"
export FILE1="blockchain-$BLOCKCHAIN_DATE.zip"
#export FILE2=""
export URL1="https://storage.googleapis.com/$BUCKET/$FILE1"
#export URL2="https://storage.googleapis.com/$BUCKET/"


cd ~/.bytecoin

#REMOVE THE CURRENT BLOCKCHAIN FILES
rm blocks.bin blockindexes.bin

#DOWNLOAD THE BLOCKCHAIN ZIP FILE
wget $URL

#UNZIP THE DOWNLOADED ZIP FILE
unzip $FILE1;

#MOVE THE UNZIPPED FILES TO THE PROPER LOCATION
mv blockchain-$BLOCKCHAIN_DATE/blockindexes.bin .
mv blockchain-$BLOCKCHAIN_DATE/blocks.bin .

#REMOVE LEFTOVER ARTIFACTS
rm $FILE1
rmdir blockchain-$BLOCKCHAIN_DATE

echo "The blockchain is now downloaded and installed."
echo "Please start your Bytecoin GUI and allow > 20 minutes for it to load the new blockchain properly"
