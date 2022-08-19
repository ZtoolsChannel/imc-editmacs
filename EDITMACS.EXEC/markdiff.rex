/******************************* Rexx *********************************/
/* ISPF/PDF Edit macro to scan two lines and mark where the           */
/* differences are.  Lines must be labeled .OLD and .NEW              */
/**********************************************************************/
Address ISREDIT "MACRO"
Address ISPEXEC "CONTROL ERRORS RETURN"      /* Catch rc=12 - no label*/
Address ISREDIT "(OLDLINE) = LINE .OLD"      /* Store .OLD line data  */
oldrc = rc                                   /* Save return code      */
Address ISREDIT "(NEWLINE) = LINE .NEW"      /* Store .NEW line data  */
newrc = rc                                   /* Save return code      */

exitrc = 0
If oldrc + newrc > 0 Then                    /* Check if missing label*/
  Do
    zedsmsg = "No .NEW or .OLD label"
    zedlmsg = "The lines to be compared must be labeled .NEW and .OLD"
    Address ISPEXEC "SETMSG MSG(ISRZ001)"
    exitrc = 12
  End
Else
  Do
    marker = ""
    markcount = 0
    /* Loop through string comparing each character                   */
    Do i = 1 To Max(Length(oldline),Length(newline))
      If Substr(newline,i,1) == Substr(oldline,i,1) Then
        marker = marker" "
      Else
        Do
          marker = marker"*"
          markcount = markcount + 1
        End
    End
    /* Add an information line after the line labeled .OLD            */
    If markcount > 0 Then
      Address ISREDIT "LINE_AFTER .OLD = INFOLINE (marker)"

    zedsmsg = markcount" differences found"
    zedlmsg = markcount" differences were found between" ,
              "line .NEW and line .OLD"
    Address ISPEXEC "SETMSG MSG(ISRZ000)"
  End
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
