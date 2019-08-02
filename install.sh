sudo su

#requisitos para instalação dos softwares
apt-get install -y tcl-dev gtk2.0 tk-dev mesa-common-dev make libjpeg-dev libtogl-dev gperf flex g++ build-essential clang bison libreadline-dev gawk tcl-dev libffi-dev git mercurial graphviz xdot pkg-config python python3 libftdi-dev libboost-program-options-dev autoconf libgmp-dev cmake

#########instalação do icarus
apt install -y iverilog

#requisito para instalar GTWare
tar xzf xz-5.2.4.tar.gz
cd xz-5.2.4
./configure
make
sudo make install
cd ..
rm -rf xz-5.2.4

#########instalação do GTKWave
wget http://gtkwave.sourceforge.net/gtkwave-3.3.100.tar.gz
tar xzf gtkwave-3.3.100.tar.gz 
cd gtkwave-3.3.100/
./configure
make
sudo make install 
cd ..
rm -rf gtkwave-3.3.100.tar.gz 
rm -rf gtkwave-3.3.100
  
#########instalação do Verilator 
tar -xvzf verilator-4.012.tgz
cd verilator-4.012
./configure
sudo make
make test
sudo make install
cd ..
rm -rf verilator-4.012

#requisito para instalar SymbiYosys
git clone https://github.com/cliffordwolf/yosys.git yosys
cd yosys
make -j$(nproc)
sudo make install
cd ..
rm -rf yosys

git clone https://github.com/SRI-CSL/yices2.git yices2
cd yices2
autoconf
./configure
make -j$(nproc)
sudo make install
cd ..
rm -rf yices2

#########instalação do SymbiYosys
git clone https://github.com/cliffordwolf/SymbiYosys.git SymbiYosys
cd SymbiYosys
sudo make install
cd ..
rm -rf SymbiYosys

#atualizando ...
sudo apt update && sudo apt upgrade -y
sudo apt autoremove
