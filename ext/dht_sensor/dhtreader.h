
/* for usleep */
//#define _BSD_SOURCE

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <dirent.h>
#include <fcntl.h>
#include <assert.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <bcm2835.h>
#include <unistd.h>

int readDHT(int type, int pin, float *temp_p, float *hum_p);
int readDHT2(int type, int pin, float *temp_p, float *hum_p);

