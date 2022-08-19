/*********************************** Rexx *****************************/
/* ISPF/PDF Edit macro to show only JCL EXEC records.                 */
/**********************************************************************/
Address ISREDIT "MACRO"
Address ISREDIT "(state) = USER_STATE"     /* Save User State         */
Address ISREDIT "BOUNDS"                   /* Reset Bounds            */
Address ISREDIT "X ALL"                    /* Exclude all lines       */
Address ISREDIT "F ALL C' EXEC ' "         /* Find all C' EXEC '      */
Address ISREDIT "(F1,F2) = FIND_COUNTS"    /* Save number/lines found */
Address ISREDIT "X ALL 1 '//*' "           /* Exclude JCL comments    */
Address ISREDIT "(X1,X2) = EXCLUDE_COUNTS" /* Save number/lines x'd   */
steps = f2 - x2                            /* Calculate steps         */
Address ISREDIT "HIDE X"                   /* Hide - - - lines        */
Address ISREDIT "USER_STATE = (state)"     /* Restore User State      */

zedsmsg = steps "steps found"              /* Set short/long messages */
zedlmsg = "There are "steps" steps in this job"
Address ISPEXEC "SETMSG MSG(ISRZ000)"      /* Set informational msg   */

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
