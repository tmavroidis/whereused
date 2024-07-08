**free
// Program WHEREUSEDR from the NTMTOOLS library
// Copyright NTM Consulting Incorporated, Markham, Ontario   416-258-3577  tmavroidis@ntm.net
// Use of this program is only for registered licencees of NTM Consulting Incorporated

ctl-Opt option(*SrcStmt :*NoDebugIO);
ctl-Opt datFmt(*ISO) timFmt(*ISO) datEdit(*YMD-);
ctl-Opt decPrec(63);
ctl-Opt copyRight('NTM Consulting Inc');

dcl-ds InDs extname('NTMTOOLS/NPGMREF') end-ds;

exec sql declare rd cursor for
         select * from ntmtools.npgmref for update with NC;
exec sql open rd;
exec sql fetch next from rd into :InDs  ;
dow sqlcod = *zero;
   if WHOBJT <> 'F';
      exec sql delete from ntmtools.npgmref WHERE CURRENT OF rd ;
   ENDIF;
   exec sql fetch next from rd into :InDs;
endDo;
exec sql close rd;

*inlr = *on  ;
return;                                               
