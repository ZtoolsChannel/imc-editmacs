//ISPFBAT PROC EXECNAME=
//ISPFBAT  EXEC PGM=IKJEFT01,TIME=1440,DYNAMNBR=30,PARM=&EXECNAME
//SYSPRINT DD  SYSOUT=*
//SYSTSPRT DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//ISPLOG   DD  SYSOUT=*,
//             DCB=(LRECL=120,RECFM=FB,BLKSIZE=2400)
//ISPMLIB  DD  DISP=SHR,DSN=DAND.ISPMLIB
//         DD  DISP=SHR,DSN=SYS1.ISP.SISPMENU
//ISPPLIB  DD  DISP=SHR,DSN=DAND.ISPPLIB
//         DD  DISP=SHR,DSN=SYS1.ISP.SISPPENU
//ISPSLIB  DD  DISP=SHR,DSN=DAND.ISPSLIB
//         DD  DISP=SHR,DSN=SYS1.ISP.SISPSENU
//ISPTABL  DD  DISP=SHR,DSN=DAND.ISPTLIB
//ISPTLIB  DD  DISP=SHR,DSN=DAND.ISPTLIB
//         DD  DISP=SHR,DSN=SYS1.ISP.SISPTENU
//SYSEXEC  DD  DISP=SHR,DSN=DAND.DEV.EXEC
//         DD  DISP=SHR,DSN=SYS1.ISP.SISPEXEC
//SYSPROC  DD  DISP=SHR,DSN=SYS1.ISP.SISPCLIB
//ISPPROF  DD  DISP=(NEW,DELETE),SPACE=(TRK,(1,5,5)),
//             UNIT=VIO,DCB=(LRECL=80,BLKSIZE=6160,DSORG=PO,RECFM=FB)
//SYSTSIN  DD  DUMMY
