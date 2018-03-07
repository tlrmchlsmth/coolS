all: coolS.sty coolS.pdf# coolS.tgz

coolS.tfm: coolS.mf
	mktextfm coolS

coolS.sty: coolS.tfm coolS.dtx coolS.ins
	rm -f coolS.sty
	latex coolS.ins

#	latex ${TEXFLAGS} coolS.ins

coolS.pdf: coolS.tfm coolS.dtx coolS.sty #userdoc.tex
	pdflatex coolS.dtx
	makeindex coolS.idx
	pdflatex  coolS.dtx

#	pdflatex ${TEXFLAGS} coolS.dtx
#
#coolS.tgz: README.md coolS.dtx coolS.ins coolS.pdf
#	mkdir coolS
#	cp $^ coolS
#	tar -czf $@ coolS
#	rm -r coolS

clean:
	rm -rf coolS.{sty,gls,glo,hd,idx,ilg,ind,out,toc,pdf,aux,log,tgz,tfm,*pk} *.log

#installlocal:
#	tlmgr install coolS.dtx
