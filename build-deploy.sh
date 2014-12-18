#!/bin/bash
# deploy jars to oss.sonatype.org staging repository

RELEASE_VER=0.9-7

read -p "Insert GPG passphrase: " passphrase

if [ -z "$passphrase" ]; then
    echo "GPG passphrase is mandatory";
    exit 1;
fi

mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=JRI-${RELEASE_VER}.pom -Dfile=JRI-${RELEASE_VER}.jar -Dgpg.passphrase=$passphrase
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=JRI-${RELEASE_VER}.pom -Dfile=JRI-${RELEASE_VER}-sources.jar -Dclassifier=sources -Dgpg.passphrase=$passphrase
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=JRI-${RELEASE_VER}.pom -Dfile=JRI-${RELEASE_VER}-javadoc.jar -Dclassifier=javadoc -Dgpg.passphrase=$passphrase

mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=JRIEngine-${RELEASE_VER}.pom -Dfile=JRIEngine-${RELEASE_VER}.jar -Dgpg.passphrase=$passphrase
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=JRIEngine-${RELEASE_VER}.pom -Dfile=JRIEngine-${RELEASE_VER}-sources.jar -Dclassifier=sources -Dgpg.passphrase=$passphrase
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=JRIEngine-${RELEASE_VER}.pom -Dfile=JRIEngine-${RELEASE_VER}-javadoc.jar -Dclassifier=javadoc -Dgpg.passphrase=$passphrase

mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=REngine-${RELEASE_VER}.pom -Dfile=REngine-${RELEASE_VER}.jar -Dgpg.passphrase=$passphrase
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=REngine-${RELEASE_VER}.pom -Dfile=REngine-${RELEASE_VER}-sources.jar -Dclassifier=sources -Dgpg.passphrase=$passphrase
mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=sonatype-nexus-staging -DpomFile=REngine-${RELEASE_VER}.pom -Dfile=REngine-${RELEASE_VER}-javadoc.jar -Dclassifier=javadoc -Dgpg.passphrase=$passphrase
