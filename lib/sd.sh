#!/bin/bash
#
# Wrap "python setup.py <XYZ>". By default it will run a python setup.py
# develop. If there is a BASKET environment variable set it will use this as
# the source for egg dependancies.
#
# The function will first test for the presence of the setup.py file. If its
# not present it will exit print an error.
#
# Oisin Mulvihill
# 2014-08-20
#
function sd() {
    if [ "$1" == "" ]; then
        COMMAND="develop"
    else
        COMMAND=$1
    fi

    if [ -e setup.py ]; then
        if [ -z "$BASKET" ]; then
            # No basket defined so don't use it as a source
            python setup.py $COMMAND
        else
            # The BASKET if set will need to specify -i/-f.
            # For example: BASKET="-i http...."
            # For example: BASKET="-f http...."
            #
            if [ $COMMAND == "develop" ]; then
                # only use basket for develop. It does not work
                # with other options.
                python setup.py develop $BASKET
            else
                python setup.py $COMMAND
            fi
        fi
    else
        echo "No setup.py found here: '"`pwd`"'"
    fi
}
