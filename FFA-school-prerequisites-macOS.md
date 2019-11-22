# FFA school prerequisites for macOS

## Install OPAL

In order to run the examples, you need to download them and also install OPAL
itself.
```
mkdir -p ~/path/to/working/dir && cd "$_"
 
wget http://amas.web.psi.ch/Downloads/OPAL/package/OPAL-2.0.2-1-x86_64-macos.tar.xz
tar -xf OPAL-2.0.1-1-x86_64-linux.tar.xz
```

## Install FFA school file

You need to install the FFA school files
```
cd ~/path/to/working/dir
git clone https://github.com/chrisrogers1234/ffa-school.git
```

## Python3 and required modules

In order to make plots, you will need python3 and the standard python3 
scientific libraries. 

### Using Python3 shipped with macOS

Python3 is shipped with current macOS. Most required libraries can be installed with `pip3`:
```
sudo pip3 install numpy matplotlib scipy
```

### Using Python3 from Macports
If you have Macports installed and want to use Python3 from Macports run
```
sudo port install python37 py-numpy py-matplotlib py-scipy
```

### Other Python libraries
We also use xboa library as a backend.
```
cd ~/path/to/working/dir
wget http://micewww.pp.rl.ac.uk/maus/xboa/xboa-0.17.0/xboa-0.17.0.tar.gz
tar -xzf xboa-0.17.0.tar.gz
cd xboa-0.17.0
sudo python3 setup.py install
```

## Setup environment

Finally, you need to set a few environment variables
```
cd ~/path/to/working/dir/ffa-school
export OPAL_BUILD_PATH=~/path/to/working/dir/OPAL-2.0.1/
source env.sh
```
The env.sh script also checks that the environment is okay and returns an error
message if it detects missing libraries. If the env.sh script ends with
```
ERROR: Setup failed
```
then the setup was not successful. If the env.sh script ends with
```
Setup looks okay!
```
then the setup was successful.