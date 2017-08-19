# blockchain-download

This Project allows you to download the entire Bytecoin blockchain in one shot so that you don't have to wait days or weeks for your wallet to sync.

Running the included scripts will automatically put the blockchain in the right place for your operating system.

### Windows:

Follow the below steps to download the blockchain using the PowerShell Command Line Utility built into all windows.

1) Open up the traditional Command line utility cmd:
* Press the Windows Button
* Type in `cmd` and press enter. A black screen window will open up awaiting your commands.

2) Navigate to your bytecoin's Data Directory:
* Type in: `cd c:\Users\%username%\AppData\Roaming\bytecoin\` and press Enter.

3) Open up the PowerShell utility:
* Type in: `powershell` and press Enter
* You will see a PS showing at the very left of the new line.

4) Paste in the Region that is Closest to you to get Faster Download Speeds:
* The Region needs to be a value of either `eu` for Europe, `us` for North America, or "as" for Asia.
* `$REGION = "as"`
* `$REGION = "us"`
* `$REGION = "eu"`

5) Paste in All of the Below and Wait for the Full Blockchain to Download at Lightning Speed

```
#TO-DO ADD LOGIC TO AUTO GET THE CURRENT DATE
$BLOCKCHAIN_DATE="2017-20-04"

#MOVE/BACKUP ANY CURRENTLY EXISTING INCOMPLETE BLOCKCHAIN FILES
mkdir BackupBlockchain
mv blockindexes.bin BackupBlockchain/
mv blocks.bin BackupBlockchain/

$BUCKET = "bcn-blockchain-$REGION"
$URL1="https://storage.googleapis.com/$BUCKET/$BLOCKCHAIN_DATE/blockindexes.bin"
$URL2="https://storage.googleapis.com/$BUCKET/$BLOCKCHAIN_DATE/blocks.bin"

#DO THE ACTUAL BLOCKCHAIN DOWNLOAD
curl $URL1
curl $URL2

echo "The Blockchain is now Downloaded. Please open the Bytecoin GUI App and allow it up to an hour to officially load up and read the entire blockchain"
```

### Mac OSX / Linux:

Open up a terminal / command line window

How to open on a Mac: https://youtu.be/zw7Nd67_aFw

Paste in the below commands and your blockchain download will begin.

```
git clone https://github.com/bytecoin-dev/blockchain-download.git
cd blockchain-download
./macOS_linux_download.sh
```

Dependencies: unzip
You might get the error "./macOS_linux_download.sh: unzip: not found"

If you do, then run the below to resolve the dependency:

ubuntu: `sudo apt-get install unzip`
