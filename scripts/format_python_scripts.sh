#! /bin/bash 
###########################################
# pip install autopep8==1.5
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)
export DATE=`date "+%Y%m%d"`
export DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"` #add %3N as we want millisecond too

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return

cd $baseDir/..

for x in `find . -name "*.py" -not -path "./venv/*" -not -path "./tmp/*"`; do 
    echo "Python script -->" $x
    autopep8 --in-place --aggressive --aggressive -r -v $x
    echo ""
    echo ""
done