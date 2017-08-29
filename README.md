# blockchain-download

This Project allows you to download the entire Bytecoin blockchain in one shot so that you don't have to wait days or weeks for your wallet to sync.

Running the included scripts will automatically put the blockchain in the right place for your operating system.

Be sure to stop any running Bytecoin Gui Wallets or bytecoind processes before running these. Also, you must have at least ran your bytecoin wallet or processes at least one time before running any of the below.

### Windows:

Follow the below steps to download the blockchain using the PowerShell Command Line Utility built into all windows.

**1) Open up the traditional Command line utility cmd:**
* Press the Windows Button
* Type in `cmd` and press enter. A black screen window will open up awaiting your commands.

**2) Navigate to your bytecoin's Data Directory:**
* Type in: `cd c:\Users\%username%\AppData\Roaming\bytecoin\` and press Enter.

**3) Open up the PowerShell utility:**
* Type in: `powershell` and press Enter
* You will see a PS showing at the very left of the new line.

**4) Paste in the Region that is Closest to you to get Faster Download Speeds:**
* The Region needs to be a value of either `eu` for Europe, `us` for North America, or `as` for Asia.
* `$REGION = "as"`
* `$REGION = "us"`
* `$REGION = "eu"`

**5) Paste in All of the Below and Wait for the Full Blockchain to Download at Lightning Speed**

```
#AUTO GET THE CURRENT AVAILABLE BLOCKCHAIN DATE FROM http://download.bytecoindev.io/blockdate
$REQUEST=curl -Uri http://download.bytecoindev.io/blockdate
$BLOCKCHAIN_DATE=$REQUEST.Content

#MOVE/BACKUP ANY CURRENTLY EXISTING INCOMPLETE BLOCKCHAIN FILES
echo "Currently Backing up any already existing blockchain files to folder BackupBlockchain"
mkdir BackupBlockchain
mv blockindexes.bin BackupBlockchain/
mv blocks.bin BackupBlockchain/
echo "Done backing up existing blockchain files"

$BUCKET="bcn-blockchain-$REGION"
$URL1="https://storage.googleapis.com/$BUCKET/$BLOCKCHAIN_DATE/blockindexes.bin"
$URL2="https://storage.googleapis.com/$BUCKET/$BLOCKCHAIN_DATE/blocks.bin"

echo "Starting the downloads from the below locations:"
echo "$URL1"
echo "$URL2"

#DO THE ACTUAL BLOCKCHAIN DOWNLOAD
curl $URL1 -OutFile blockindexes.bin
echo "Done Downloading blockindexes.bin file and Starting the download of the actual blockchain file: blocks.bin"
echo "Please wait a few hours for the increasing number to reach above 8,910,111,213) (8+ Gigabytes)"
curl $URL2 -OutFile blocks.bin

echo "The Blockchain is now Downloaded!!!!"
echo "Please open the Bytecoin GUI App and allow it up to a few hours to officially load up and read the entire blockchain into the application"
```

### Mac OSX / Linux:

Open up a terminal / command line window

How to open on a Mac: https://youtu.be/zw7Nd67_aFw

Paste in the below commands and your blockchain download will begin.

```
git clone https://github.com/bytecoin-dev/blockchain-download.git
cd blockchain-download
./macOS_linux_download.sh eu
```

##### Note:

The last command above can be replaced by one of three regions that is cosed to you as in the below:

Replace `./macOS_linux_download.sh eu` with `./macOS_linux_download.sh us` for the Notrh America Region.  
OR  
Replace `./macOS_linux_download.sh eu` with `./macOS_linux_download.sh as` for the Asia Region.

### Dependencies: Mac / Linux

**Git:**  
Git is the foundation for this Github Site. You can download git from: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
