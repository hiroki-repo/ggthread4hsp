//ggthread green thread for hsp
//This module is unlicensed,so you can use freely!
//codename: gramocove
#ifndef ggthreadacc
#module ggthreadacc
#deffunc local ggthreadinit
ggthgotoidptrx=*ggthgotoidptr
dupptr ggthgotoidstr,lpeek(ggthgotoidptrx,0),256,2:ggthgotoidbct=wpeek(ggthgotoidstr,0)
ggthgotoidptrx=*ggthgosubidptr
dupptr ggthgosubidstr,lpeek(ggthgotoidptrx,0),256,2:ggthgosubidbct=wpeek(ggthgosubidstr,0)
ggthgotoidptrx=*ggthbreakidptr
dupptr ggthbreakidstr,lpeek(ggthgotoidptrx,0),256,2:ggthbreakidbct=wpeek(ggthbreakidstr,0)
ggthgotoxefptr=*ggthgotoxef
dupptr ggthgotoxefstr,lpeek(ggthgotoxefptr,0),256,2:if wpeek(ggthgotoxefstr,0)&0x8000{ggthgotoxefptrpls=6}else{ggthgotoxefptrpls=4}
dupptr ggthgotoxefstr2,lpeek(ggthgotoxefptr,0)+ggthgotoxefptrpls,256,2::if wpeek(ggthgotoxefstr2,0)&0x8000{ggthgotoxefptrpls+=6}else{ggthgotoxefptrpls+=4}
return


#deffunc local ggthread_goto label labellies_0
labelliesx=labellies_0
lpoke ggthreadctx,4*0,lpeek(labelliesx,0)
return
#deffunc local ggthread_gosub label labellies_0
labelliesx=labellies_0
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*1),4096,4
lpoke ggthreadctx_gsar(ggthreadctx_gsar(0)+1),0,lpeek(ggthreadctx,4*0)
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)+1
lpoke ggthreadctx,4*0,lpeek(labelliesx,0)
return

#deffunc local ggthread_break label labellies_0
labelliesx=labellies_0
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)-1
lpoke ggthreadctx,4*0,lpeek(labelliesx,0)
return

#deffunc local ggthread_loop label labellies_0
labelliesx=labellies_0
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)-1
lpoke ggthreadctx,4*0,lpeek(ggthreadctx_gsar(ggthreadctx_gsar(0)+1),0)
return

#deffunc local ggthread_repeat label labellies_0,int rpt_1,int rpt_2
labelliesx=labellies_0
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
lpoke ggthreadctx_gsar(ggthreadctx_gsar(0)+1),0,lpeek(ggthreadctx,4*0)
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)+1
lpoke ggthreadctx,4*0,lpeek(labelliesx,0)
return


#deffunc ggthreadsetpc var ggthreadctxtmp,label labellies_0
dupptr ggthreadctx,varptr(ggthreadctxtmp),4096,2
labelliesx=labellies_0
lpoke ggthreadctxtmp,4*0,lpeek(labelliesx,0)
return

#deffunc ggthreadrun var ggthreadctxtmp
dupptr ggthreadctx,varptr(ggthreadctxtmp),4096,2
retflag=0
dupptr bytecodefrom,lpeek(ggthreadctx,4*0),256,2
mref hspctx,68
sdim bytecodeto,4096
firstcount=0:bytecodetocnt=0
repeat:bctype=wpeek(bytecodefrom,cnt)
if (bctype&0x2000)!0{firstcount+=1}
if firstcount>=2{cntend=cnt:break}
wpoke bytecodeto,bytecodetocnt+0,bctype
if (bctype&0x8000){opmain=lpeek(bytecodefrom,cnt+2)}else{opmain=wpeek(bytecodefrom,cnt+2)}
switch (bctype&0xfff)
case 0xf
	switch opmain
		case 0
		bctype=lpeek(ggthgotoidbct,0):if bctype&0x8000{opmain=lpeek(ggthgotoidstr,2)}else{opmain=wpeek(ggthgotoidstr,2)}
		swbreak
		case 1
		bctype=lpeek(ggthgosubidbct,0):if bctype&0x8000{opmain=lpeek(ggthgosubidstr,2)}else{opmain=wpeek(ggthgosubidstr,2)}
		swbreak
		case 2
		retflag=1
		swbreak
		/*case 3
		bctype=lpeek(ggthbreakidbct,0):if bctype&0x8000{opmain=lpeek(ggthbreakidstr,2)}else{opmain=wpeek(ggthbreakidstr,2)}
		swbreak*/
	swend
swbreak
swend
if opmain>65535{wpoke bytecodeto,bytecodetocnt,bctype|0x8000}else{wpoke bytecodeto,bytecodetocnt,bctype}
if (wpeek(bytecodeto,bytecodetocnt)&0x8000){lpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=6}else{wpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=4}
continue cnt+2+((((bctype&0x8000)!0)+1)*2):loop
memcpy bytecodeto,ggthgotoxefstr,ggthgotoxefptrpls,bytecodetocnt,0
lpoke ggthreadctx,4*0,lpeek(ggthreadctx,4*0)+cntend
ldim gotx,1:lpoke gotx,0,varptr(bytecodeto)
memcpy hspctx,ggthreadctx,8,864,4*3
memcpy hspctx,ggthreadctx,4*14,780,4*5
if retflag=0{goto gotx}else{
gosub gotx
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*1),4096,4
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)-1
lpoke ggthreadctx,4*0,lpeek(ggthreadctx_gsar(ggthreadctx_gsar(0)+1),0)
}
*reteh
memcpy ggthreadctx,hspctx,8,4*3,864
memcpy ggthreadctx,hspctx,4*14,4*5,780

return

*ggthgotoidptr
ggthread_goto
return
*ggthgosubidptr
ggthread_gosub
return
*ggthbreakidptr
ggthread_break
return

*ggthgotoxef
goto *reteh

#global
ggthreadinit@ggthreadacc
#endif
