#!/bin/sh

set -e

if [ -z "$1" ]
  then
    echo "No host is supplied to set up."
    exit 1
fi

if [ -z "$2" ]
  then
    rootdir=
  else
    rootdir=$2
fi

host=$1

hostconf=host/$host.nix

if [ ! -f $rootdir/household-conf/$hostconf ]; then
    echo "There no such host '$host'"
    exit 2
fi

systemver=$(cat functions/system-version.nix | sed 's/"//g')

nix-channel --add https://github.com/nix-community/home-manager/archive/release-$systemver.tar.gz home-manager
nix-channel --update

mkdir -p $rootdir/etc/nixos

cat > $rootdir/etc/nixos/configuration.nix <<- EOM
{ config, pkgs, ... }: {
    imports = [
        ../../household-conf/$hostconf
        ./hardware-configuration.nix
    ];
}
EOM
