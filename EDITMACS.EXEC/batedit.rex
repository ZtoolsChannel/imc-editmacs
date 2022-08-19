/**************************** Rexx ************************************/
/* This exec is used to edit the data set defined to the EDITIN DD    */
/* and call an initial edit macro to perform a particular function.   */
/**********************************************************************/
ddname  = "EDITIN"
editmac = "CHANGEIT"

Address ISPEXEC "LMINIT DATAID(EDITID1) DDNAME("ddname") ENQ(SHRW)"

Address ISPEXEC "CONTROL ERRORS RETURN"

Address ISPEXEC "EDIT DATAID("editid1") MACRO("editmac")"
If rc > 4 Then
  Address ISPEXEC "SETMSG MSG(ISRZ002)"

Address ISPEXEC "LMFREE DATAID("editid1")"

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
