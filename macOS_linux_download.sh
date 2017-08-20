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
export URL1="https://storage.googleapis.com/$BUCKET/$BLOCKCHAIN_DATE/blockindexes.bin"
export URL2="https://storage.googleapis.com/$BUCKET/$BLOCKCHAIN_DATE/blocks.bin"


cd ~/.bytecoin

#MOVE/BACKUP ANY CURRENTLY EXISTING INCOMPLETE BLOCKCHAIN FILES
mkdir BackupBlockchain
mv blockindexes.bin BackupBlockchain/
mv blocks.bin BackupBlockchain/

#DOWNLOAD THE ACTUAL BLOCKCHAIN FILES
wget $URL1
wget $URL2

echo "The Blockchain is now Downloaded!"
echo "Please open the Bytecoin GUI App and allow it up to an hour to officially load up and read the entire blockchain"
