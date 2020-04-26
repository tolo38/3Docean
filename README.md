# 3Docean

The project is just set up
ready to embed unit test with
google test library


### Requirement

gtest
```
sudo apt-get install libgtest-dev
cd /usr/src/googletest/googletest
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo cp libgtest* /usr/lib/
cd ..
sudo rm -rf build
```
### Note

do not have test named the same as any of your source,
it might corumpte the compilation

