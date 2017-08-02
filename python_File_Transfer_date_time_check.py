## Python 3.6
##
## Author - Lauren Barcik
##
## To create database and table with SQLite3 to provide recording time
## of the last instance a 'file check' process was performed.
##

from tkinter import *
from tkinter import ttk
from tkinter import filedialog
from tkinter import messagebox
import os.path
import os
from os.path import getmtime
from os import stat
from datetime import datetime
import time
import shutil
import sqlite3
import datetime as dt

## ======================================== DATABASE =================================================
conn=sqlite3.connect('fileCheck.db')
c=conn.cursor()
c.execute('CREATE TABLE IF NOT EXISTS tbl_File_Check(date TEXT, file TEXT)')


class SendCopy(Frame):
    def __init__(self,master):
## ======================================= GUI CONTENTS =============================================        
        master=master
        master.title('Run File Modification Check and Copy')
        master.resizable(False,False)
        master.geometry('650x300+250+200')
        master.config(relief=RAISED)

        self.frame_header=ttk.Frame(master)
        self.frame_header.pack()
    
        ttk.Label(self.frame_header,text=("Choose which folder to check for modified files in the last 24 hours and copy to selected folder:")).grid(row=0,column=0,columnspan=2,padx=25,pady=25)
            
        self.frame_contents=ttk.Frame(master)
        self.frame_contents.pack()

        ttk.Label(self.frame_contents,text='Click Browse to Search Modified Files:').grid(row=0,column=0,padx=10,pady=10,sticky='s')
        ttk.Label(self.frame_contents,text='Click Select to Select Folder to Send Copy:').grid(row=0,column=1,padx=10,pady=10,sticky='s')

      
        self.fileS=StringVar()
        self.fileD=StringVar()
        self.timeF=StringVar()
        
        browseEntry=ttk.Entry(self.frame_contents,width=45,text=self.fileS).grid(row=2,column=0,padx=10,pady=10)
        chooseEntry=ttk.Entry(self.frame_contents,width=45,text=self.fileD).grid(row=2,column=1,padx=10,pady=10)    
        browseButton=ttk.Button(self.frame_contents,text='Browse',command=self.browse).grid(row=1,column=0,padx=10,pady=10)
        chooseButton=ttk.Button(self.frame_contents,text='Select',command=self.choose).grid(row=1,column=1,padx=10,pady=10)

        ##clock label
        self.fetchTime()
        clock=ttk.Label(self.frame_contents,textvariable=self.timeF).grid(row=6,column=1,padx=5,sticky='sw')
        
        ##file copy button, click to run file check
        fileCopy=ttk.Button(self.frame_contents,text='Run Check',command=self.fileCopy).grid(row=10,column=0,columnspan=2,padx=5,pady=40)
        
        
        ##date/time for recording
        label1=ttk.Label(self.frame_contents,text='Date and Time of Last File Check :').grid(row=6,column=0,padx=5,sticky='se')
    
## ============================================= DEFINE FUNCTIONS =============================================        
    def browse(self):
        self.browseS=filedialog.askdirectory()
        self.fileS.set(self.browseS)
                  
    def choose(self):
        self.chooseD=filedialog.askdirectory()
        self.fileD.set(self.chooseD)

    def fileCopy(self): 
        for files in os.listdir(self.browseS):
            source=os.path.join(self.browseS,files)
            modTime=(os.path.getmtime(source))
            currentTime=time.time()
            updateTime=currentTime-modTime
            if updateTime<86400:
                shutil.move(source,self.chooseD)
                print("Copied: "+files)    
                self.copyTime()
        if files:
            messagebox.showinfo(title="Copy Update", message='Files have been copied')
        else:
            messagebox.showinfo(title="Copy Update", message='No files updated in last 24 hours')    
    
    def copyTime(self):
        now=dt.datetime.now()    
        c.execute('INSERT INTO tbl_File_Check(date)VALUES(?)',(now,))
        conn.commit()
        
    def fetchTime(self):        
        c.execute('SELECT date FROM tbl_File_Check ORDER by date DESC')
        cTime=c.fetchone()
        self.timeF.set(cTime)
        conn.commit()

   
def main():
    root=Tk()
    sendcopy=SendCopy(root)
    root.mainloop()



if __name__=="__main__":
    main()
              
            
  
