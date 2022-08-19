/******************************* Rexx *********************************/
/* ISPF/PDF Line Command Edit Macro to center one or more lines.      */
/*   Use option 3.16 to add entry into Edit line command table and    */
/*   use that table on the edit/view panels or service calls.         */
/*                                                                    */
/*       User     MACRO    Program  Block    Multi    Dest            */
/*       Command           Macro    format   line     Used            */
/*       ----+--- ----+--- ----+--- ----+--- ----+--- ----+---        */
/*       CE       LMCENTER N        Y        Y        N               */
/**********************************************************************/
Address ISREDIT "MACRO (PARM) NOPROCESS"     /* Line cmd passed       */

Address ISPEXEC "CONTROL ERRORS RETURN"

lncmd = "CE"
Address ISREDIT "PROCESS RANGE "lncmd        /* Set range labels      */
If rc > 0 Then
  Do
    Address ISPEXEC "SETMSG MSG(ISRZ002)"
    Exit 12
  End

Address ISREDIT "(start) = LINENUM .ZFRANGE" /* Find start of range   */
Address ISREDIT "(stop)  = LINENUM .ZLRANGE" /* Find end of range     */
Address ISREDIT "(dw)    = DATA_WIDTH"       /* Store data width      */

Do i = start To stop
  Address ISREDIT "(LINE) = LINE" i          /* Store data from line i*/
  line = Center(Strip(line),dw)              /* Center the data       */
  Address ISREDIT "LINE "i" = (LINE)"        /* Replace line i        */
End
Exit
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
