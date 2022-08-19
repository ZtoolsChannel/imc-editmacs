/******************************* Rexx *********************************/
/* ISPF/PDF Line Command Edit Macro to insert Address TSO "ISREMSPY"  */
/*   Use option 3.16 to add entry into Edit line command table and    */
/*   use that table on the edit/view panels or service calls.         */
/*                                                                    */
/*       User     MACRO    Program  Block    Multi    Dest            */
/*       Command           Macro    format   line     Used            */
/*       ----+--- ----+--- ----+--- ----+--- ----+--- ----+---        */
/*       SPY      LMSPY    N        N        N        N               */
/**********************************************************************/
Address ISREDIT "MACRO (PARM) NOPROCESS"     /* Line cmd passed       */

Address ISPEXEC "CONTROL ERRORS RETURN"

lncmd = "SPY"
Address ISREDIT "PROCESS RANGE "lncmd        /* Set range labels      */
If rc > 0 Then
  Do
    Address ISPEXEC "SETMSG MSG(ISRZ002)"
    Exit 12
  End

/* SPY is a single line command only so no need to check .ZLRANGE     */
Address ISREDIT "(start) = LINENUM .ZFRANGE"

Address ISREDIT "(strt) = LINE" start          /* Look at start line  */

ind = Length(Strip(strt,"T")) - Length(Strip(strt,"B")) /* Calc indent*/

new = Copies(" ",ind)'Address TSO "ISREMSPY"'  /* Set line to insert  */

Address ISREDIT "LINE_AFTER "start "= (new)"   /* Insert line after   */

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
