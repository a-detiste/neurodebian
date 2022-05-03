family=$1
dist=$2

# basic settings
cowbuilderroot="/home/neurodebian"
buildplace="${cowbuilderroot}/build"

# all currently supported dists
allnddists="nd+debian-stretch nd+debian-buster nd+debian-bullseye nd+debian-bookworm nd+debian-sid \
            nd+ubuntu-bionic nd+ubuntu-focal nd+ubuntu-impish nd+ubuntu-jammy"
alldists="$allnddists debian-stretch debian-buster debian-bullseye debian-sid"

# default is debian
aptcache="${cowbuilderroot}/debian_aptcache"
components="main contrib non-free"
mirror="http://debian.lcs.mit.edu/debian"

# overwrite necessary bits for ubuntu
if [ "${family#nd+}" = "ubuntu" ]; then
  aptcache="${cowbuilderroot}/ubuntu_aptcache"
  components="main universe multiverse"
  mirror="http://ubuntu.media.mit.edu/ubuntu"
fi

if [ ! -d $aptcache ]; then mkdir -p $aptcache; fi
