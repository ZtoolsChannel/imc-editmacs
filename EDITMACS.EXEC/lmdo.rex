/******************************* Rexx *********************************/
/* ISPF/PDF Line Command Edit Macro to wrap a Do-End around one or    */
/* more lines of Rexx code.                                           */
/*  Use option 3.16 to add entry into an Edit line command table and  */
/*  use that table on the edit/view panels or service calls.          */
/*                                                                    */
/*       User     MACRO    Program  Block    Multi    Dest            */
/*       Command           Macro    format   line     Used            */
/*       ----+--- ----+--- ----+--- ----+--- ----+--- ----+---        */
/*       DO       LMDO     N        Y        Y        N               */
/**********************************************************************/
Address ISREDIT "MACRO (PARM) NOPROCESS"     /* Line cmd passed       */

Address ISPEXEC "CONTROL ERRORS RETURN"

lncmd = "DO"
Address ISREDIT "PROCESS RANGE "lncmd        /* Set range labels      */
If rc > 0 Then
  Do
    Address ISPEXEC "SETMSG MSG(ISRZ002)"
    Exit 12
  End

Address ISREDIT "(state) = USER_STATE"       /* Save User State       */
Address ISREDIT "(start) = LINENUM .ZFRANGE" /* Find start of range   */
Address ISREDIT "(stop)  = LINENUM .ZLRANGE" /* Find end of range     */
Address ISREDIT "(dw) = DATA_WIDTH"          /* Save width of data    */
Address ISREDIT "BOUNDS"                     /* Set default bounds    */

exitrc = 0
/* Determine column position of first character and set shiftamt      */
Address ISREDIT "(strtline) = LINE" start
shiftamt = Length(strtline) - Length(Strip(strtline,"L"))

/* Need to ensure column right shift will not shift anything off end  */
Address ISREDIT "SEEK P'^' ALL .ZFRANGE .ZLRANGE" dw-1 dw
If rc = 0 Then
  Do
    zedsmsg = "Cannot shift"
    zedlmsg = "One or more non-blank characters in columns "dw-1"-"dw-0
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    exitrc = 12
  End
Else
  Do
    Do i = start To stop
      Address ISREDIT "SHIFT ) "i              /* Column shift right 2*/
    End

    /* Add End after the last line in the range -- inserted before Do */
    newline = Copies(" ",shiftamt)"End"
    Address ISREDIT "LINE_AFTER "stop" = (NEWLINE)"

    /* Add Do line before the first line in the range                 */
    newline = Copies(" ",shiftamt)"Do"
    Address ISREDIT "LINE_BEFORE "start" = (NEWLINE)"

  End
Address ISREDIT "USER_STATE = (state)"           /* Restore User State*/
Exit exitrc
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
