#!/bin/bash
root=$(realpath $PWD)

for currentDir in functions/*/ functions/**/*/ ; do
    fullPath=$root/$currentDir
    
    cd $fullPath

    parentDir=$(basename $PWD)
    functionPath=$root/build/$parentDir

    if [ $(ls -1 package.json 2>/dev/null | wc -l) != 0 ]
    then
        if [ ! -d $root/build/ ]
        then
            mkdir $root/build/
        fi

        if [ ! -d $functionPath ]
        then
            mkdir $functionPath
        fi

        npm i
        npm run build
        rm -rf $functionPath
        mv -f build $functionPath
        cp package.json $functionPath
        cp package-lock.json $functionPath
    else 
        echo $parentDir package.json not found
    fi
done
