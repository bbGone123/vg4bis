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
import time,sys

def main():
    qa_team = ['Bogdan','Deepika','Kevin','Kimtan','Megha','Sharlin','Svitlana','Xiaoqing']
    for i in range(random.randint(30,50)):
        volunteer = random.choice(qa_team)
        print volunteer,
        sys.stdout.flush()
        time.sleep(.3)
        print "\b" * (len(volunteer)+1),
        
    print "%s!" % volunteer

if __name__ == '__main__':
    main()
