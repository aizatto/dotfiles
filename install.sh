#!/bin/sh

FILES=`ls $PWD`

for i in $FILES; do
  if [ "$i" == "README" ]; then
    echo "skip $i"
    continue
  fi

  if [ "$i" == "install.sh" ]; then
    echo "skip $i"
    continue
  fi

  if [ -a "$HOME/.$i" ]; then
    echo "exists $i"
    continue
  fi


  ln -nsf $PWD/$i $HOME/.$i 
  echo $i
done
