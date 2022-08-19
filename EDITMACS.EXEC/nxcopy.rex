/******************************* Rexx *********************************/
/* ISPF/PDF Edit Macro to copy a data source before or after each     */
/* non-excluded line.                                                 */
/* First parameter is required and is either a member name, a         */
/* data set name, or a z/OS Unix file name.                           */
/* The second is optional (A/AFTER or B/BEFORE) -- default is BEFORE. */
/**********************************************************************/
Address ISREDIT "MACRO (src2copy,dest)"
Address ISREDIT "(state) = USER_STATE"       /* Save User State       */
Address ISREDIT "BOUNDS"                     /* Reset Bounds          */
dest = Translate(dest)                       /* Fold to Uppercase     */

If src2copy = "" Then
  Do
    zedsmsg = "No source provided"
    zedlmsg = "NXCOPY needs a member name, data set, or z/OS Unix file"
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    exitrc = 12
  End
Else If dest <> "" & Wordpos(dest,"A AFT AFTER B BEF BEFORE") = 0 Then
  Do
    zedsmsg = "Invalid destination"
    zedlmsg = "Specify whether to copy A (After) or B (Before)"
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    exitrc = 12
  End
Else
  Do
    /* Set up destination for copy and directions for searching       */
    If dest = "" | Wordpos(dest,"B BEF BEFORE") > 0 Then
      Do
        dest = "BEFORE"
        dir1 = "FIRST"
        dir2 = "NEXT"
      End
    Else
      Do
        dest = "AFTER"
        dir1 = "LAST"
        dir2 = "PREV"
      End

    exitrc = 0

    Address ISPEXEC "CONTROL ERRORS RETURN"  /* Capture copy error    */

    /* Find each non-excluded line and copy source based on dest      */
    Address ISREDIT "FIND NX P'=' 1" dir1

    Do While rc = 0 & exitrc = 0
      Address ISREDIT "COPY "src2copy dest ".ZCSR"
      If rc = 0 Then
        Address ISREDIT "FIND NX P'=' 1" dir2
      Else
        Do
          Address ISPEXEC "SETMSG MSG(ISRZ002)"
          exitrc = 12
        End
    End
  End

Address ISREDIT "USER_STATE = (state)"       /* Restore User State    */

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
