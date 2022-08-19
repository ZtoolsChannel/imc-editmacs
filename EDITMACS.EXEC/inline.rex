/******************************* Rexx *********************************/
/* Copies data from the DSN/DSNAME specified on the JCL line at the   */
/* cursor, comments out the line and adds an appropriate DD * line.   */
/**********************************************************************/
Address ISREDIT "MACRO"
Address ISREDIT "(state) = USER_STATE"     /* Save User State         */
Address ISREDIT "BOUNDS"                   /* Reset Bounds            */

error = "N"
target = ""
If Find_txt("DSN=") | Find_txt("DSNAME=") Then  /* Find DSN=/DSNAME=  */
  Do
    Address ISREDIT "(curr) = LINE .ZCSR"     /* Save line at cursor  */
    Address ISREDIT "(lnum) = LINENUM .ZCSR"  /* Save line number     */
    Call Allocate_and_read_data
    If error = "N" Then
      Do
        trunc   = 0
        /* Insert closing record and data in reverse after cursor     */
        newline = "/*"
        Address ISREDIT "LINE_AFTER .ZCSR = (newline)"
        Do i = in.0 To 1 By -1
          newline = Strip(in.i,"T")
          Address ISREDIT "LINE_AFTER .ZCSR = (newline)"
          If rc = 4 Then
            trunc = trunc + 1
        End

        /* Comment out the line                                       */
        Parse Var curr 3 remaining
        newline = "//*"Strip(remaining,"T")
        Address ISREDIT "LINE .ZCSR = (newline)"
        /* Insert a DD * line with original DD name                   */
        Parse Var curr pre " DD " .
        newline = pre" DD *"
        Address ISREDIT "LINE_AFTER .ZCSR = (newline)"
        If trunc = 0 Then
          Do
            zedsmsg = in.0 "lines copied"
            zedlmsg = in.0 "lines copied from "dsn" on line "lnum+0
            Address ISPEXEC "SETMSG MSG(ISRZ000)"
          End
        Else
          Do
            zedsmsg = trunc "lines truncated"
            zedlmsg = trunc "of the" in.0 "lines were truncated"
            Address ISPEXEC "SETMSG MSG(ISRZ001)"
          End
      End
  End
Else
  Do
    zedsmsg = "No DSN=/DSNAME= found"
    zedlmsg = "The cursor must be on a line with DSN=/DSNAME="
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    error = "Y"
  End
Address ISREDIT "USER_STATE = (state)"     /* Restore User State      */
If error = "Y" Then
  Exit 12                                  /* Keep macro on cmd line  */
Else
  Exit

/**********************************************************************/
/* Returns True if text found on current line with cursor.            */
/**********************************************************************/
Find_txt: Procedure Expose target
Arg text
found = 0
Address ISREDIT "FIND '"text"' .ZCSR .ZCSR FIRST "
If rc = 0 Then
  Do
    found = 1
    target = text
  End
Return found

/**********************************************************************/
/* Allocates data set and reads it into in. stem variables            */
/**********************************************************************/
Allocate_and_read_data:
Parse Var curr . (target) dsn .
Parse Var dsn dsn "," .

/* Check data set existence */
z = MSG("OFF")
dsstat = Sysdsn("'"dsn"'")
z = MSG("ON")
If dsstat = "OK" Then
  Do
    z = MSG("OFF")
    dsi_rc = Listdsi("'"dsn"'")
    z = MSG("ON")
    If sysdsorg = "PO" & Pos("(",dsn) = 0 Then
      Do
        zedsmsg = "Member Required"
        zedlmsg = "Data set is partitioned but no member present"
        Address ISPEXEC "SETMSG MSG(ISRZ001)"
        error = "Y"
      End
    Else If sysdsorg = "VS" Then
      Do
        zedsmsg = "VSAM Not Supported"
        zedlmsg = "Data set is a VSAM data set"
        Address ISPEXEC "SETMSG MSG(ISRZ001)"
        error = "Y"
      End
    Else
      Do
        Address TSO "ALLOC F(INLINEIN) DA('"dsn"') SHR REUSE"
        If rc = 0 Then
          Do
            Address TSO "EXECIO * DISKR INLINEIN (STEM IN. FINIS"
            If rc > 0 Then
              Do
                zedsmsg = "Read Error"
                zedlmsg = "Unable to read "dsn
                Address ISPEXEC "SETMSG MSG(ISRZ001)"
                error = "Y"
              End
            Address TSO "FREE F(INLINEIN)"
          End
        Else
          Do
            zedsmsg = "Allocation Error"
            zedlmsg = "Unable to allocate "dsn
            Address ISPEXEC "SETMSG MSG(ISRZ001)"
            error = "Y"
          End
      End
  End
Else If dsstat = "MEMBER NOT FOUND" Then
  Do
    zedsmsg = "Member Error"
    zedlmsg = "Member not found "dsn
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    error = "Y"
  End
Else
  Do
    zedsmsg = "Data Set Error"
    zedlmsg = "Invalid data set "dsn
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    error = "Y"
  End
Return
/**********************************************************************/
/* Send questions, suggestions and/or bug reports to:                 */
/*                         Dan Dirkse                                 */
/*                   ztools.channel@gmail.com                         */      */
/******************************************************************************/
/*                                                                    */      */
/*             (C) Copyright The Z Tools Company, 2022                */      */
/*                                                                    */
/**********************************************************************/
/* This program is free software: you can redistribute it and/or      */
/* modify it under the terms of the GNU General Public License as     */
/* published by the Free Software Foundation, either version 3 of     */
/* the License, or (at your option) any later version.                */
/*                                                                    */
/* This program is distributed in the hope that it will be useful,    */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of     */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the       */
/* GNU General Public License for more details.                       */
/*                                                                    */
/* You should have received a copy of the GNU General Public License  */
/* along with this program. If not, see https://www.gnu.org/licenses/ */
/**********************************************************************/
