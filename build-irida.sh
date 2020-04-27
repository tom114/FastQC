#!/bin/bash

VERSION=0.11.7

echo "Creating build dir #####################################################"
mkdir -p irida

echo "Compiling Java #########################################################"
ant

echo "Building sources jar ###################################################"
jar cf irida/fastqc-$VERSION-src.jar uk

echo "Building compiled jar ##################################################"
pushd bin
jar cf ../irida/fastqc-$VERSION.jar uk Configuration
popd

echo "Copying depenencies ####################################################"
cp jbzip*.jar irida
cp sam*.jar irida

echo "Building pom file ######################################################"
sed  "s/FASTQCVERSION/$VERSION/" fastqc.pom > irida/fastqc-$VERSION.pom

echo "Build complete #########################################################"
