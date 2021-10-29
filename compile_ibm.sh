#!/bin/bash

xlc_r -g -fPIC -O2 -Wall -Wstrict-aliasing -fstrict-aliasing -lm -qsmp=omp -qoffload test.c
jsrun -n 1 -a 1 -c 1 -g 1 ./a.out

