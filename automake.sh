#!/bin/sh
echo "Creating Build directory"
mkdir build 
cd build
echo "Creating Make Files"
if [ "$(uname)" = "Darwin" ]
then
        # Mac OS X
        cmake ../source -DCMAKE_BUILD_TYPE=Release -G"Unix Makefiles"
else 
then
cmake ../source -DCMAKE_BUILD_TYPE=Releaseelif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]
fi
cmake --build . --config Release
cp uox3 ../
cd ..
exit $ev
