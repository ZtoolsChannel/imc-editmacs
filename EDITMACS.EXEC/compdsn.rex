/******************************* Rexx *********************************/
/* ISPF/PDF Edit Macro to compare the edited data to the data set     */
/* passed.  An alternate member and/or X option can be also passed.   */
/**********************************************************************/
Address ISREDIT "MACRO (dsn, mem, option)"
mem = Translate(mem)
option = Translate(option)
/* If member of X is passed, move to the option variable              */
If mem = "X" Then
  Do
    option = mem option
    mem = ""
  End

If mem = "" Then                             /* Let member default    */
  Address ISREDIT "COMP '"dsn"'" option
Else                                         /* Provide alternate mem */
  Address ISREDIT "COMP '"dsn"("mem")'" option
If rc > 0 Then
  Address ISPEXEC "SETMSG MSG(ISRZ002)"
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
