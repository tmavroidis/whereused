             PGM        PARM(&LIB)
             DCL        VAR(&LIB) TYPE(*CHAR) LEN(10)

             DSPPGMREF  PGM(&lib/*ALL) OUTPUT(*OUTFILE) OBJTYPE(*ALL) +
                          OUTFILE(ntmtools/NPGMREF)
             MONMSG     MSGID(CPF3033) EXEC(DO)
                SNDPGMMSG  MSG('No references in library')
                goto       end
             enddo

             call       ntmtools/whereusedr

             taatool/dspdbf ntmtools/npgmref

 end:        endpgm                 
