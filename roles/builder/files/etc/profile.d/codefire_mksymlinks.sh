if [ $UID -lt 5000 ]
then
       # skip users with low UIDs, since they're not in IPA
       return
fi

STORAGE_DIR="/mnt/nfs-fs1-nfshomes_storage"
DOWNLOADS_DIR="/mnt/datastore/downloads"
SKIP_FILE="/home/$USER/.skipsymlinks"


if [ -f $SKIP_FILE ]
then   
        return
        #echo "[bashrc] Not skipping link creation..."
fi

if [ ! -L ~/storage ]
then   
        echo "[bashrc] No storage symlink found! Creating one..."
        echo "[bashrc] Linking $STORAGE_DIR/$USER to ~/storage"
        ln -s $STORAGE_DIR/$USER ~/storage
        touch $SKIP_FILE
fi

if [ ! -L ~/downloads ]
then   
        echo "[bashrc] No downloads symlink found! Creating one..."
        echo "[bashrc] Linking $DOWNLOADS_DIR/$USER to ~/downloads"
        ln -s $DOWNLOADS_DIR/$USER ~/downloads
        touch $SKIP_FILE
fi

if [ ! -d ~/bin ]
then   
        echo "[bashrc] Creating ~/bin folder..."
        mkdir ~/bin
fi