#!/bin/bash

#Name of the job
#$ -N j2_4

#Queue
#$ -q muylarga

#Output stream
#$ -o large_output2_4.info

#Error stream
#$ -e large_error2_4.info

#Current working directory
#$ -cwd


#pip install --user --upgrade Cython
#pip install --user --upgrade pandas
#pip install --user --upgrade arff
#pip install --user --upgrade scikit-learn

python3.6 -m pip install --user --upgrade numpy
python3.6 -m pip install --user --upgrade pandas
python3.6 -m pip install --user --upgrade Cython
python3.6 -m pip install --user --upgrade arff
python3.6 -m pip install --user --upgrade scikit-learn
python3.6 -m pip install --user --upgrade matplotlib
python3.6 -m pip install --user --upgrade seaborn

python3.6 --version
python3.6 setup.py build_ext --inplace
export PYTHONPATH=`pwd`
python3.6 test/test_tfg2.py 4