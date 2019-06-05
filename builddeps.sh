#!/bin/bash

#mkdir deps &> /dev/null
#cd deps
#    sudo apt-get update
#    sudo apt-get install -y libpcl-dev yasm

#exit 
#DLib for place recognition
git clone https://github.com/dorian3d/DLib.git
cd DLib
git reset --hard 330bdc10576f6bcb55e0bd85cd5296f39ba8811a
mkdir build
cd build
cmake ../
make -j8
sudo make install
cd ../..
rm -rf DLib

#DBoW2 for place recognition
git clone https://github.com/dorian3d/DBoW2.git
cd DBoW2
git reset --hard 4a6eed2b3ae35ed6837c8ba226b55b30faaf419d
mkdir build
cd build
cmake ../
make -j8
sudo make install
cd ../..
rm -rf DBoW2

#DLoopDetector for place recognition
git clone https://github.com/dorian3d/DLoopDetector.git
cd DLoopDetector
git reset --hard 84bfc56320371bed97cab8aad3aa9561ca931d3f
mkdir build
cd build
cmake ../
make -j8
sudo make install
cd ../..
rm -rf DLoopDetector

#iSAM for pose graph optimisation
wget http://people.csail.mit.edu/kaess/isam/isam_v1_7.tgz
tar -xvf isam_v1_7.tgz
rm isam_v1_7.tgz
cd isam_v1_7
mkdir build
cd build
cmake ..
make -j8
sudo make install
cd ../..
rm -rf isam_v1_7

#Actually build Kintinuous
cd ..
mkdir build
cd build
cmake ../src
make -j8
