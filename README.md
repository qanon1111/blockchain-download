# blockchain-download

This Project allows you to download the entire Bytecoin blockchain in one shot so that you don't have to wait days or weeks for your wallet to sync.

Running the insluded scripts will automatically put the blockchain in the right place for your operating system.

### Windows:
Coming soon...

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
