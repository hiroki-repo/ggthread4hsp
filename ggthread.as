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
ggthgotoidptrx=*ggthloopidptr
dupptr ggthloopidstr,lpeek(ggthgotoidptrx,0),256,2:ggthloopidbct=wpeek(ggthloopidstr,0)
ggthgotoidptrx=*ggthrepeatidptr
dupptr ggthrepeatidstr,lpeek(ggthgotoidptrx,0),256,2:ggthrepeatidbct=wpeek(ggthrepeatidstr,0)
ggthgotoidptrx=*ggthcntidptr
dupptr ggthcntidstr,lpeek(ggthgotoidptrx,0),256,2:ggthcntidbct=wpeek(ggthcntidstr,0)
ggthgotoidptrx=*ggthcontinueidptr
dupptr ggthcontinueidstr,lpeek(ggthgotoidptrx,0),256,2:ggthcontinueidbct=wpeek(ggthcontinueidstr,0)
ggthgotoidptrx=*ggthifidptr
dupptr ggthifidstr,lpeek(ggthgotoidptrx,0),256,2:ggthifidbct=wpeek(ggthifidstr,0)
ggthgotoidptrx=*ggthelseidptr
dupptr ggthelseidstr,lpeek(ggthgotoidptrx,0),256,2:ggthelseidbct=wpeek(ggthelseidstr,0)
ggthgotoidptrx=*ggthexgotoidptr
dupptr ggthexgotoidstr,lpeek(ggthgotoidptrx,0),256,2:ggthexgotoidbct=wpeek(ggthexgotoidstr,0)
ggthgotoidptrx=*ggthlooplevidptr
dupptr ggthlooplevidstr,lpeek(ggthgotoidptrx,0),256,2:ggthlooplevidbct=wpeek(ggthlooplevidstr,0)
ggthgotoidptrx=*ggthsublevidptr
dupptr ggthsublevidstr,lpeek(ggthgotoidptrx,0),256,2:ggthsublevidbct=wpeek(ggthsublevidstr,0)
ggthgotoxefptr=*ggthgotoxef
dupptr ggthgotoxefstr,lpeek(ggthgotoxefptr,0),256,2:if wpeek(ggthgotoxefstr,0)&0x8000{ggthgotoxefptrpls=6}else{ggthgotoxefptrpls=4}
dupptr ggthgotoxefstr2,lpeek(ggthgotoxefptr,0)+ggthgotoxefptrpls,256,2::if wpeek(ggthgotoxefstr2,0)&0x8000{ggthgotoxefptrpls+=6}else{ggthgotoxefptrpls+=4}
ggthgotoidptrx=*ggthonsubslblptr
dupptr ggthexonidstr,lpeek(ggthgotoidptrx,0),256,2:ggthexonidbct=wpeek(ggthexonidstr,0)
ggthgotoidptrx=*ggthonef
dupptr ggthexon2idstr,lpeek(ggthgotoidptrx,0),256,2:ggthexon2idbct=wpeek(ggthexon2idstr,0)
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
if lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0)!0{lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0,lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0)+1}
lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0,0
return

#deffunc local ggthread_loop// label labellies_0
//labelliesx=labellies_0
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)-1
if lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0)!0{lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0,lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0)+1}
if ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2)<ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+1) or ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+1)<0{
lpoke ggthreadctx,4*0,lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0)
}else{lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0,0}
return

#deffunc local ggthread_repeat label labellies_0,int rpt_1,int rpt_2
labelliesx=labellies_0
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
if lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0)=0{
if rpt_1=0{lpoke ggthreadctx,4*0,lpeek(labelliesx,0)}else{
lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0,mcsbak//lpeek(ggthreadctx,4*0)
if rpt_1<0{
lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+1),0,-1
lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0,rpt_2
}else{
lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+1),0,rpt_1+rpt_2
lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0,rpt_2
}
//lpoke ggthreadctx,4*0,lpeek(labelliesx,0)
}
}
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)+1
return

#defcfunc local ggthread_cnt
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)-1
retcnt=ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2)
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)+1
return retcnt

#deffunc local ggthread_continue label labellies_0,int rpt_1
labelliesx=labellies_0
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
lpoke ggthreadctx_gsar(0),0,ggthreadctx_gsar(0)-1
/*lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0,rpt_1
if ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2)<ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+1){
lpoke ggthreadctx,4*0,lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0)
}else{lpoke ggthreadctx,4*0,lpeek(labelliesx,0)}*/
if lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0)!0{lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2),0,rpt_1}
if ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+2)<ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+1) or ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1+1)<0{
lpoke ggthreadctx,4*0,lpeek(ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0)
}else{lpoke ggthreadctx_gsar((ggthreadctx_gsar(0)*3)+1),0,0:lpoke ggthreadctx,4*0,lpeek(labelliesx,0)}
return

#deffunc local ggthread_if int rpt_0, int rpt_1
//lpoke ggthreadctx,4*20,(rpt_1!0)
if rpt_1=0{lpoke ggthreadctx,4*0,ifelseptrtmp+(rpt_0*2)}
return
#deffunc local ggthread_else int rpt_0
lpoke ggthreadctx,4*0,ifelseptrtmp+(rpt_0*2)
return

#deffunc local ggthread_exgoto var rpt_0,int rpt_1,int rpt_2,label labellies_0
labelliesx=labellies_0
exgoto rpt_0,rpt_1,rpt_2,*ggthreadexg1
return
*ggthreadexg1
lpoke ggthreadctx,4*0,lpeek(labelliesx,0)
return

#defcfunc local ggthread_looplev
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*2),4096,4
return ggthreadctx_gsar(0)

#defcfunc local ggthread_sublev
dupptr ggthreadctx_gsar,lpeek(ggthreadctx,4*1),4096,4
return ggthreadctx_gsar(0)

#deffunc local ggthread_onsubsituate int rpt_0
if (oninsmode4exec){ggthread_gosub ggthreadonsubsituatelbl(rpt_0)}else{ggthread_goto ggthreadonsubsituatelbl(rpt_0)}
return

#deffunc ggthreadsetpc var ggthreadctxtmp,label labellies_0
dupptr ggthreadctx,varptr(ggthreadctxtmp),4096,2
labelliesx=labellies_0
lpoke ggthreadctxtmp,4*0,lpeek(labelliesx,0)
return

#deffunc ggthreadsetstks var ggthreadctxtmp,int prm_0,int prm_1
dupptr ggthreadctx,varptr(ggthreadctxtmp),4096,2
lpoke ggthreadctx,4*1,prm_0
lpoke ggthreadctx,4*2,prm_1
return

#deffunc ggthreadloadenv var ggthreadctxtmp
dupptr ggthreadctx,varptr(ggthreadctxtmp),4096,2
mref hspctx,68
memcpy ggthreadctx,hspctx,8,4*3,864
memcpy ggthreadctx,hspctx,4*14,4*5,780
return

#deffunc ggthreadrun var ggthreadctxtmp
dupptr ggthreadctx,varptr(ggthreadctxtmp),4096,2
retflag=0
dupptr bytecodefrom,lpeek(ggthreadctx,4*0),65536,2
mref hspctx,68
sdim bytecodeto,4096
firstcount=0:bytecodetocnt=0:repins=0:contins=0:cntins=0:mcsbak=0:ifelse=0:ifins=0:elseins=0:skpoffset=0:isskp6=0:ifelseptrtmp=0:onins=0:ldim ggthreadonsubsituatelbl,1:oninsmode4exec=0
repeat:bctype=wpeek(bytecodefrom,cnt):ifelse=0:bctypemain=lpeek(bctype,0)
if (bctype&0x2000)!0{firstcount+=1}
if cntins=1{wpoke bytecodeto,bytecodetocnt+0,0:wpoke bytecodeto,bytecodetocnt+2,40:bytecodetocnt+=4:wpoke bytecodeto,bytecodetocnt+0,0:wpoke bytecodeto,bytecodetocnt+2,41:bytecodetocnt+=4:cntins=0}
if firstcount>=2{if repins=2{wpoke bytecodeto,bytecodetocnt,0x5004|0x8000:lpoke bytecodeto,bytecodetocnt+2,-1:bytecodetocnt+=6}:if contins=2{wpoke bytecodeto,bytecodetocnt,0x400C|0x8000:if ggthcntidbct&0x8000{lpoke bytecodeto,bytecodetocnt+2,lpeek(ggthcntidstr,2)}else{lpoke bytecodeto,bytecodetocnt+2,wpeek(ggthcntidstr,2)}:bytecodetocnt+=6:wpoke bytecodeto,bytecodetocnt+0,0:wpoke bytecodeto,bytecodetocnt+2,40:bytecodetocnt+=4:wpoke bytecodeto,bytecodetocnt+0,0:wpoke bytecodeto,bytecodetocnt+2,41:bytecodetocnt+=4:wpoke bytecodeto,bytecodetocnt+0,4:wpoke bytecodeto,bytecodetocnt+2,2:bytecodetocnt+=4:wpoke bytecodeto,bytecodetocnt+0,0:wpoke bytecodeto,bytecodetocnt+2,0:bytecodetocnt+=4}:cntend=cnt:break}
if repins>1{if (bctype&0x4000){wpoke bytecodeto,bytecodetocnt,0x5004|0x8000:lpoke bytecodeto,bytecodetocnt+2,-1:bytecodetocnt+=6}:repins=0}
if contins>1{contins=0}
wpoke bytecodeto,bytecodetocnt+0,bctype
if (bctype&0x8000){opmain=lpeek(bytecodefrom,cnt+2)}else{opmain=wpeek(bytecodefrom,cnt+2)}
if onins=2{onins=0:firstcount+=1:bctype&=(-1)-0x4000:if (bctype&0xfff)=3 or (bctype&0xfff)=4{bctype|=0x1000} }
if onins=1{
bctype=0:opmain=8
if opmain>65535{wpoke bytecodeto,bytecodetocnt,bctype|0x8000}else{wpoke bytecodeto,bytecodetocnt,bctype}
if (wpeek(bytecodeto,bytecodetocnt)&0x8000){lpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=6}else{wpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=4}
cnt4onins=cnt:firstcount4onins=0:cnt4oninsret=0:oninscammerchk=0
repeat
bctype4onins=wpeek(bytecodefrom,cnt+cnt4onins):bctypemain4onins=lpeek(bctype4onins,0)
if (bctype4onins&0x8000){opmain4onins=lpeek(bytecodefrom,cnt+cnt4onins+2)}else{opmain4onins=wpeek(bytecodefrom,cnt+cnt4onins+2)}
if (bctype4onins&0xfff)=15 and opmain4onins<2 {oninsmode4exec=opmain4onins}
if (bctype4onins&0xfff)=7 or (bctype4onins&0xfff)=1{
if oninscammerchk>=1{
if oninscammerchk=1{bctype4onins&=(-1)-0x4000}
if opmain4onins>65535{wpoke bytecodeto,bytecodetocnt,bctype4onins|0x8000}else{wpoke bytecodeto,bytecodetocnt,bctype4onins}
if (wpeek(bytecodeto,bytecodetocnt)&0x8000){lpoke bytecodeto,bytecodetocnt+2,opmain4onins:bytecodetocnt+=6}else{wpoke bytecodeto,bytecodetocnt+2,opmain4onins:bytecodetocnt+=4}
}
oninscammerchk+=1
}
if (bctype4onins&0x2000)!0{firstcount4onins+=1}
if firstcount4onins>=1{cnt4oninsret=cnt+2+((((bctypemain4onins&0x8000)!0)+1)*2):break}
continue cnt+2+((((bctypemain4onins&0x8000)!0)+1)*2)
loop
onins=2
bctype=wpeek(ggthexon2idbct,0):if bctype&0x8000{opmain=lpeek(ggthexon2idstr,2)}else{opmain=wpeek(ggthexon2idstr,2)}
if opmain>65535{wpoke bytecodeto,bytecodetocnt,bctype|0x8000}else{wpoke bytecodeto,bytecodetocnt,bctype}
if (wpeek(bytecodeto,bytecodetocnt)&0x8000){lpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=6}else{wpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=4}
continue cnt
//continue cnt4oninsret+cnt
}
if ifins=1{bctype|=0x4000:ifins=0}
switch (bctype&0xfff)
case 0x1
if repins=1{repins=2}
if contins=1{contins=2}
swbreak
case 0x6
if repins=1{repins=2}
if contins=1{contins=2}
swbreak
case 0x7
if repins=1{repins=2}
if contins=1{contins=2}
swbreak
case 0xb
ifelse=1
if (bctype&0x8000){skpoffset=wpeek(bytecodefrom,cnt+6):ifelseptrtmp=lpeek(ggthreadctx,4*0)+8:isskp6=1}else{skpoffset=wpeek(bytecodefrom,cnt+4):ifelseptrtmp=lpeek(ggthreadctx,4*0)+6:isskp6=0}
	switch opmain
		case 0
		bctype=wpeek(ggthifidbct,0)|(bctype&0x7000):if bctype&0x8000{opmain=lpeek(ggthifidstr,2)}else{opmain=wpeek(ggthifidstr,2)}:ifins=1
		swbreak
		case 1
		bctype=wpeek(ggthelseidbct,0)|(bctype&0x7000):if bctype&0x8000{opmain=lpeek(ggthelseidstr,2)}else{opmain=wpeek(ggthelseidstr,2)}:elseins=1
		swbreak
	swend
swbreak
case 0xe
	switch opmain
		case 4
		bctype=(wpeek(ggthcntidbct,0)&0x8fff)|(bctype&0x7000):if bctype&0x8000{opmain=lpeek(ggthcntidstr,2)}else{opmain=wpeek(ggthcntidstr,2)}:cntins=1
		swbreak
		case 7
		bctype=(wpeek(ggthlooplevidbct,0)&0x8fff)|(bctype&0x7000):if bctype&0x8000{opmain=lpeek(ggthlooplevidstr,2)}else{opmain=wpeek(ggthlooplevidstr,2)}:cntins=1
		swbreak
		case 8
		bctype=(wpeek(ggthsublevidbct,0)&0x8fff)|(bctype&0x7000):if bctype&0x8000{opmain=lpeek(ggthsublevidstr,2)}else{opmain=wpeek(ggthsublevidstr,2)}:cntins=1
		swbreak
	swend
swbreak
case 0xf
	switch opmain
		case 0
		if (wpeek(bytecodefrom,cnt)&0x2000)!0{bctype=lpeek(ggthgotoidbct,0):if bctype&0x8000{opmain=lpeek(ggthgotoidstr,2)}else{opmain=wpeek(ggthgotoidstr,2)}}
		swbreak
		case 1
		if (wpeek(bytecodefrom,cnt)&0x2000)!0{bctype=lpeek(ggthgosubidbct,0):if bctype&0x8000{opmain=lpeek(ggthgosubidstr,2)}else{opmain=wpeek(ggthgosubidstr,2)}}
		swbreak
		case 2
		retflag=1
		swbreak
		case 3
		bctype=lpeek(ggthbreakidbct,0):if bctype&0x8000{opmain=lpeek(ggthbreakidstr,2)}else{opmain=wpeek(ggthbreakidstr,2)}
		swbreak
		case 4
		bctype=lpeek(ggthrepeatidbct,0):if bctype&0x8000{opmain=lpeek(ggthrepeatidstr,2)}else{opmain=wpeek(ggthrepeatidstr,2)}:repins=1
		swbreak
		case 5
		bctype=lpeek(ggthloopidbct,0):if bctype&0x8000{opmain=lpeek(ggthloopidstr,2)}else{opmain=wpeek(ggthloopidstr,2)}
		swbreak
		case 6
		bctype=lpeek(ggthcontinueidbct,0):if bctype&0x8000{opmain=lpeek(ggthcontinueidstr,2)}else{opmain=wpeek(ggthcontinueidstr,2)}:contins=1
		swbreak
		case 0x18
		bctype=lpeek(ggthexgotoidbct,0):if bctype&0x8000{opmain=lpeek(ggthexgotoidstr,2)}else{opmain=wpeek(ggthexgotoidstr,2)}:contins=1
		swbreak
		case 0x19
		bctype=lpeek(ggthexonidbct,0):if bctype&0x8000{opmain=lpeek(ggthexonidstr,2)}else{opmain=wpeek(ggthexonidstr,2)}:onins=1
		swbreak
	swend
swbreak
swend
if opmain>65535{wpoke bytecodeto,bytecodetocnt,bctype|0x8000}else{wpoke bytecodeto,bytecodetocnt,bctype}
if (wpeek(bytecodeto,bytecodetocnt)&0x8000){lpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=6}else{wpoke bytecodeto,bytecodetocnt+2,opmain:bytecodetocnt+=4}
if ifelse=1{wpoke bytecodeto,bytecodetocnt,0x1004:wpoke bytecodeto,bytecodetocnt+2,skpoffset:bytecodetocnt+=4}
continue cnt+2+((((bctypemain&0x8000)!0)+1)*2)+((ifelse!0)*2):loop
memcpy bytecodeto,ggthgotoxefstr,ggthgotoxefptrpls,bytecodetocnt,0
mcsbak=lpeek(ggthreadctx,4*0)
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
*ggthloopidptr
ggthread_loop
return
*ggthrepeatidptr
ggthread_repeat
return
*ggthcntidptr
ggthread_cnt
return
*ggthcontinueidptr
ggthread_continue
return
*ggthifidptr
ggthread_if
return
*ggthelseidptr
ggthread_else
return
*ggthexgotoidptr
ggthread_exgoto
return
*ggthlooplevidptr
ggthread_looplev
return
*ggthsublevidptr
ggthread_sublev
return

*ggthgotoxef
goto *reteh

*ggthonsubslblptr
ggthreadonsubsituatelbl=*ggthonsubslblptr
return

*ggthonef
ggthread_onsubsituate
return

#global
ggthreadinit@ggthreadacc
#endif
