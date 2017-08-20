#!/bin/sh

#THIS SCRIPT AUTOMATCALLY DOWNLOADS THE BLOCKCHAIN FILES INTO YOUR YOUR ~/.bytecoind directory

#REGION NEEDS TO BE A VAULE OF "EU", "US", OR "AS"
export VALID_REGION=FALSE

if [ $1 == "us" ]
then
    VALID_REGION=TRUE
fi

if [ $1 == "eu" ]
then
    VALID_REGION=TRUE
fi

if [ $1 == "as" ]
then
    VALID_REGION=TRUE
fi

if [ $VALID_REGION == FALSE ]
then
    echo "ERROR: No valid region was passed into the script"
    echo "Please try again with a valid region like in the below examples"
    echo ""
    echo "./macOS_linux_download.sh eu"
    echo "./macOS_linux_download.sh us"
    echo "./macOS_linux_download.sh as"
    exit 1
fi

#AUTO GET THE CURRENT DATE
export BLOCKCHAIN_DATE=`curl -s http://download.bytecoindev.io/blockdate`

export REGION=$1
export BUCKET="bcn-blockchain-$REGION"
export FILE1="blockchain-$BLOCKCHAIN_DATE.zip"
#export FILE2=""
export URL1="https://storage.googleapis.com/$BUCKET/$FILE1"
#export URL2="https://storage.googleapis.com/$BUCKET/"


cd ~/.bytecoin

#MOVE/BACKUP ANY CURRENTLY EXISTING INCOMPLETE BLOCKCHAIN FILES
mkdir BackupBlockchain
mv blockindexes.bin BackupBlockchain/
mv blocks.bin BackupBlockchain/

#DOWNLOAD THE BLOCKCHAIN ZIP FILE
wget $URL1
sleep 10

#UNZIP THE DOWNLOADED ZIP FILE
unzip $FILE1;
sleep 10

#MOVE THE UNZIPPED FILES TO THE PROPER LOCATION
mv blockchain-$BLOCKCHAIN_DATE/blockindexes.bin .
mv blockchain-$BLOCKCHAIN_DATE/blocks.bin .

#REMOVE LEFTOVER ARTIFACTS
rm $FILE1
rmdir blockchain-$BLOCKCHAIN_DATE

echo "The blockchain is now downloaded and installed."
echo "Please start your Bytecoin GUI and allow > 20 minutes for it to load the new blockchain properly"
