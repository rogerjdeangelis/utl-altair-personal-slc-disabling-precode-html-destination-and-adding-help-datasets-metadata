%let pgm=utl-altair-personal-slc-disabling-precode-html-destination-and-adding-help-datasets-metadata;

%stop_submission;

Altair personal slc disabling precode html destination and adding help datasets metadata;

 CONTENTS  ( I found it difficlt to turn off the precoded html destination)

  0 slc html & listing;
  1 slc only listing
  2 slc streamlining disablig precode
  3 slc acessing help and user datasets and dictionaries
    librefs )in autoxec)
      wpsuser -- like sasuser   - all are wpd objects (nat sas objects)
      wpshelp -- like sashelp   - all are wpd objects (nat sas objects)

FYI:
TEMPORARY FILES
  D:\wpsa\.metadata\.plugins\com.wpc.wps\Temporary Files\22928@T7610
ALSO (.metadata)
  D:\wpsa\.metadata\.plugins\com.wpc.wps\Temporary Files

Too long to post on a listserv, see github

github
https://github.com/rogerjdeangelis/utl-altair-personal-slc-disabling-precode-html-destination-and-adding-help-datasets-metadata

/*___    _     _             _    ___     _ _     _   _                          _               _
 / _ \  | |__ | |_ _ __ ___ | |  ( _ )   | (_)___| |_(_)_ __   __ _   ___  _   _| |_ _ __  _   _| |_
| | | | | `_ \| __| `_ ` _ \| |  / _ \/\ | | / __| __| | `_ \ / _` | / _ \| | | | __| `_ \| | | | __|
| |_| | | | | | |_| | | | | | | | (_>  < | | \__ \ |_| | | | | (_| || (_) | |_| | |_| |_) | |_| | |_
 \___/  |_| |_|\__|_| |_| |_|_|  \___/\/ |_|_|___/\__|_|_| |_|\__, | \___/ \__,_|\__| .__/ \__,_|\__|
                                                              |___/                 |_|
*/

ods listing;
proc print data=wpshelp.cursescolor(obs=3);
run;quit;

/*       _                    _         _ _     _   _              _                   _               _
/ |  ___| | ___    ___  _ __ | |_   _  | (_)___| |_(_)_ __   __ _ | |__   __ _ _ __ __| | ___ ___   __| | ___
| | / __| |/ __|  / _ \| `_ \| | | | | | | / __| __| | `_ \ / _` || `_ \ / _` | `__/ _` |/ __/ _ \ / _` |/ _ \
| | \__ \ | (__  | (_) | | | | | |_| | | | \__ \ |_| | | | | (_| || | | | (_| | | | (_| | (_| (_) | (_| |  __/
|_| |___/_|\___|  \___/|_| |_|_|\__, | |_|_|___/\__|_|_| |_|\__, ||_| |_|\__,_|_|  \__,_|\___\___/ \__,_|\___|
                                |___/                       |___/
*/

1 DISABLING PRECODE HTML BY  HARDCODING
=======================================
*/

If yow place this code before EVERY submission you will getjust the listing in the
'Listing for local Server', clicking on 'Print out in lower console may not work'.

/*--- delete the latest precode ----*/
/*--- disable html              ----*/
/*--- WPSWBHTM is in precode    ----*/

%utlfkil(%sysfunc(pathname(WPSWBHTM)));

%let _init_= %str(
  filename wpswbhtm clear;
  ods _all_ close;
  ods listing;
  options ls=255 ps=65
    nofmterr nocenter
    nodate nonumber
    noquotelenmax
    validvarname=upcase
    compress=no
    formchar='|----|+|---+=|-/\<>*');

libname hlp wpd (sashelp);

&_init_;
proc print data=wpshelp.cursescolor(obs=3);
run;quit;

OUTPUT ('Listing for local server' automatically  updated)
==========================================================
NO HTML OUTPUT;

hlp.cursescolor

Altair SLC

Obs    Id     R       G       B

 1      1    1000    1000    1000
 2      2       0       0       0
 3      3     480     576     960

LOG
===

OUTPUT/CONSOLE LOWER PANEL DOES NOT HAVE HTML OUTPUT
  -----
  [LOG]
  -----
     > The PRINT Procedure
      > Data Set WPSHELP.CURSESCOLOR
        *** NO HTML ***

218       ODS _ALL_ CLOSE;
219       FILENAME WPSWBHTM TEMP;
NOTE: Writing HTML(WBHTML) BODY file d:\wpswrk\_TD7988\#LN00018
220       ODS HTML(ID=WBHTML) BODY=WPSWBHTM GPATH="d:\wpswrk\_TD7988";
221       %utlfkil(%sysfunc(pathname(WPSWBHTM)));
222
223       %let _init_= %str(
224         filename wpswbhtm clear;
225         ods _all_ close;
226         ods listing;
227         options ls=255 ps=65
228           nofmterr nocenter
229           nodate nonumber
230           noquotelenmax
231           validvarname=upcase
232           compress=no
233           formchar='|----|+|---+=|-/\<>*');
234
235       &_init_;
WARNING: The filename "wpswbhtm" has not been assigned
236       libname hlp wpd (sashelp);
NOTE: Library hlp assigned as follows:
      Engine:        WPD
      Physical Name: C:\Program Files\Altair\SLC\2025\sashelp

237
238       proc print data=hlp.cursescolor(obs=3);
239       run;quit;
NOTE: 3 observations were read from "HLP.cursescolor"
NOTE: Procedure print step took :
      real time : 0.003
      cpu time  : 0.000


240
241       quit; run;
242       ODS _ALL_ CLOSE;
243       FILENAME WPSWBHTM CLEAR;


/*       _                    _         _ _     _   _                  _                            _       _
/ |  ___| | ___    ___  _ __ | |_   _  | (_)___| |_(_)_ __   __ _  ___| |_ _ __ ___  __ _ _ __ ___ (_)_ __ (_)_ __   __ _
| | / __| |/ __|  / _ \| `_ \| | | | | | | / __| __| | `_ \ / _` |/ __| __| `__/ _ \/ _` | `_ ` _ \| | `_ \| | `_ \ / _` |
| | \__ \ | (__  | (_) | | | | | |_| | | | \__ \ |_| | | | | (_| |\__ \ |_| | |  __/ (_| | | | | | | | | | | | | | | (_| |
|_| |___/_|\___|  \___/|_| |_|_|\__, | |_|_|___/\__|_|_| |_|\__, ||___/\__|_|  \___|\__,_|_| |_| |_|_|_| |_|_|_| |_|\__, |
                                |___/                       |___/                                                   |___/
2 SLC STREAMLINING DISABLIG PRECODE
===================================
*/

PREP
----

Place this code in your autoexec (see autoexec file in this repo)

%let _init_= %str(
  ods _all_ close;
  ods listing;
  options ls=255 ps=65
    nofmterr nocenter
    nodate nonumber
    noquotelenmax
    validvarname=upcase
    compress=no
    formchar='|----|+|---+=|-/\<>*');

libname wpshelp wpd (sashelp);

PROCESS
=======

/*---- you need to put this in front of all submissions ----*/
%utlfkil(%sysfunc(pathname(WPSWBHTM)));
&_init_;

proc print data=wpshelp.cursescolor(obs=3);
run;quit;

/*___    _          _         ___        _ _      _   _
|___ \  | |__   ___| |_ __   ( _ )    __| (_) ___| |_(_) ___  _ __   __ _ _ __ _   _
  __) | | `_ \ / _ \ | `_ \  / _ \/\ / _` | |/ __| __| |/ _ \| `_ \ / _` | `__| | | |
 / __/  | | | |  __/ | |_) || (_>  <| (_| | | (__| |_| | (_) | | | | (_| | |  | |_| |
|_____| |_| |_|\___|_| .__/  \___/\/ \__,_|_|\___|\__|_|\___/|_| |_|\__,_|_|   \__, |
                     |_|                                                       |___/
3 slc acessing help sample datasets and dictionaries
*/

%utlfkil(%sysfunc(pathname(WPSWBHTM)));
&_init_;

proc contents data=hlp._all_;
run;quit;

proc print data=wpshelp.zipcode(obs=3);
run;quit;

The CONTENTS Procedure
                        Directory
Libref           HLP
Engine           WPD
Physical Name    C:\Program Files\Altair\SLC\2025\sashelp
Access           Readonly
                                  Members
                            Member
 Number    Member Name     Type           File Size      Date Last Modified
---------------------------------------------------------------------------

      1    APP             CATALOG            45056      07MAR2025:22:38:50
      2    AUTHLIB         DATA                8192      07MAR2025:22:37:36
      3    CORE            CATALOG            28672      07MAR2025:22:38:50
      4    CURSESCOLOR     DATA                8192      07MAR2025:22:38:52
      5    FSP             CATALOG            28672      07MAR2025:22:38:52
      6    HOST            CATALOG            32768      07MAR2025:22:38:50
      7    LOCALE          CATALOG          3555328      07MAR2025:22:38:48
      8    MIMETYPES       DATA               49152      07MAR2025:22:37:36
      9    REGISTRY        REGISTRY          593920      07MAR2025:22:35:14
     10    SMTPRESPONSE    DATA                8192      07MAR2025:22:37:36
     11    SVRTDIST        CATALOG            36864      07MAR2025:22:38:52
     12    TMPLMST         ITEMSTOR        18345984      07MAR2025:22:38:56
     13    VCATALG         VIEW                 100      07MAR2025:22:37:36
     14    VCFORMAT        VIEW                 117      07MAR2025:22:37:36
     15    VCOLUMN         VIEW                  98      07MAR2025:22:37:36
     16    VDCTNRY         VIEW                 108      07MAR2025:22:37:36
     17    VDEST           VIEW                 108      07MAR2025:22:37:36
     18    VEXTFL          VIEW                 100      07MAR2025:22:37:36
     19    VFORMAT         VIEW                  98      07MAR2025:22:37:36
     20    VGOPT           VIEW                 100      07MAR2025:22:37:36
     21    VINDEX          VIEW                  98      07MAR2025:22:37:36
     22    VLIBNAM         VIEW                 100      07MAR2025:22:37:36
     23    VMACRO          VIEW                  96      07MAR2025:22:37:36
     24    VMEMBER         VIEW                  98      07MAR2025:22:37:36
     25    VOPTION         VIEW                  98      07MAR2025:22:37:36
     26    VSACCES         VIEW                 138      07MAR2025:22:37:36
     27    VSCATLG         VIEW                 139      07MAR2025:22:37:36
     28    VSELIB          VIEW                 170      07MAR2025:22:38:50
     29    VSEMEM          VIEW                 178      07MAR2025:22:38:50
     30    VSLIB           VIEW                 119      07MAR2025:22:37:36
     31    VSTABLE         VIEW                 136      07MAR2025:22:37:36
     32    VSTABVW         VIEW                 165      07MAR2025:22:37:36
     33    VSVIEW          VIEW                 136      07MAR2025:22:37:36
     34    VTABLE          VIEW                  96      07MAR2025:22:37:36
     35    VTITLE          VIEW                  96      07MAR2025:22:37:36
     36    VVIEW           VIEW                  94      07MAR2025:22:37:36
     37    ZIPCODE         DATA            12189696      07MAR2025:22:37:40
     38    ZIPCODE         INDEX             516096      07MAR2025:22:37:38


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
