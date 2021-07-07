#!/bin/bash
for currentDir in functions/*/ functions/**/*/ ; do
    fullPath=$(realpath $currentDir)/

    cd $fullPath

    parentDir=$(basename $PWD)
    functionPath=../../../build/$parentDir

    if [ ! -d ../../../build/ ]
    then
        mkdir ../../../build/
    fi

    if [ ! -d $functionPath ]
    then
        mkdir $functionPath
    fi

    if [ $(ls -1 package.json 2>/dev/null | wc -l) != 0 ]
    then
        npm i
        npm run build
        rm -rf $functionPath
        mv -f build $functionPath
        cp package.json $functionPath
        cp package-lock.json $functionPath
    else 
        echo $parentDir package.json not found
    fi

    cd ${fullPath//$currentDir/}
done
