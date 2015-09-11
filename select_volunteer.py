#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      bitglass
#
# Created:     11/09/2015
# Copyright:   (c) bitglass 2015
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import random
import time

def main():
    qa_team = ['Bogdan','David','Deepika','Natalia','Sharlin','Xiaoqing']
    for i in range(random.randint(20,40)):
        volunteer = random.choice(qa_team)
        print volunteer,
        print "\b" * (len(volunteer)+1),
        time.sleep(.3)
    print "%s!" % volunteer

if __name__ == '__main__':
    main()
