My bash helper scripts
======================


Introduction
------------

This is a library of shell scripts which provide helper functions I find myself
copy-n-pasting across machines. It makes sense to combine those I can release
in a common version controlled place.

I use this from my .bashrc script as::

    LIBDIR=<path to checkout lib dir> source <path to checkout lib dir>/all.sh

    # E.g.
    # LIBDIR=~/src/my-bash-helpers/lib source ~/src/my-bash-helpers/all.sh

Individual scripts live inside the lib folder and all.sh sources the files from
here.
