# ISPF Master Class - Edit Macros Examples
                           
The edit macros and execs in this package are related to the session **ISPF Master Class: Edit Macros** given by me on multiple occasions at SHARE and GSE-UK conferences.    

The following files make up the package and should be maintained with           
the GNU GENERAL PUBLIC LICENSE contained in the @LICENSE.TXT file.              
                                                                                
@LICENSE.TXT - GNU GENERAL PUBLIC LICENSE                                       
@README.TXT  - This file                                                        
BATEDIT.REX  - Exec to call the editor in batch                                 
BATJCL.JCL   - JCL to call BATEDIT                                              
CHANGEIT.REX - Example initial edit macro used by BATEDIT                       
COMPDSN.REX  - Edit macro to compare data sets (called by COMPJCL)              
COMPJCL.REX  - Edit macro to compare JCL member to the 'system' library         
INLINE.REX   - Edit macro to copy text from DSN on cursor line as a SYSIN DD *  
ISPFBAT.JCL  - JCL Procedure example to run ISPF in batch (used by BATJCL)      
LMCENTER.REX - Line command edit macro to center data line(s)                   
LMDO.REX     - Line command edit macro to wrap Do-End around data line(s)       
LMSPY.REX    - Line command edit macro to add an ISREMSPY line after data line  
MARKDIFF.REX - Edit macro to show differences between to lines in the data      
NXCOPY.REX   - Edit macro to copy source data after/before each NX data line    
RESC.REX     - Edit macro to reset after a COMPARE command                      
SETSTART.REX - Exec to set the ZSTART Profile variable to start multiple screens  
STEPS.REX    - Edit macro to show only JCL EXEC statements                      

Note: Due to character set changes while downloading/uploading the LMDO macro you may need to manually update the SEEK statement's picture string.  The character between the single quotes needs to be a not sign (hex 5F).
      
Please provide me with any suggestions and/or corrections.                           
---                                                                   
          Send questions, suggestions and/or bug reports to:          
                               Dan Dirkse                             
                         ztools.channel@gmail.com                     
---                                                                   
                (C) Copyright The Z Tools Company, 2022               
---                                                                   
                                                                      
This program is free software:  you can redistribute it and/or modify it under the terms of the GNU General Public License as published by 
the Free Software Foundation, either version 3 of the License, or (at your option) any later version.                                      
                                                                     
This program is distributed in the hope that it will be useful, but WITH ANY WARRANTY; without even the implied warranty of              
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.                             
                                                                     
You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/   
