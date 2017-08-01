import os
from os.path import getmtime
from os import stat
from datetime import datetime
import time
import shutil

print ("Files Modified In Last 24 Hours Will Copy to FolderC")

src ="C:/Users/Owner/Desktop/FolderB/"
dst ="C:/Users/Owner/Desktop/FolderC/"

def main():
    for files in os.listdir(src):
        modTime=(os.path.getmtime(src+files))
        currentTime=time.time()
        updateTime=currentTime-modTime
        print(updateTime)
        if updateTime<86400:
            shutil.move(src+files,dst)
            print("Modified Files Moved to FolderC: "+files)
        
if __name__=="__main__":
    main()
 


                   















