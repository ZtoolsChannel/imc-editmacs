/******************************* Rexx *********************************/
/* Initial edit macro used to perform changes.                        */
/*                                                                    */
/* This macro contains an ISREDIT END command so it will make the     */
/* change without displaying the edit panel.                          */
/**********************************************************************/
Address ISREDIT "MACRO"

Address ISREDIT "(state) = USER_STATE"     /* Save User State         */
Address ISREDIT "BOUNDS"                   /* Reset Bounds            */

Address ISREDIT "CHANGE ALL ABC DEF"       /* Make changes            */

Address ISREDIT "USER_STATE = (state)"     /* Restore User State      */

Address ISREDIT "END"                      /* Exit before display     */
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
