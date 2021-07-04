#!/bin/bash
for currentDir in functions/*/ functions/**/*/ ; do
    realPath=$(realpath $currentDir)/
    parentDir=$(basename $PWD)

    cd $realPath

    if [ ! -d ../../../build/ ]
    then
        mkdir ../../../build/
    fi

    if [ ! -d ../../../build/$parentDir ]
    then
        mkdir ../../../build/$parentDir
    fi

    mv build ../../../build/$parentDir

    cd ${realPath//$currentDir/}
done
