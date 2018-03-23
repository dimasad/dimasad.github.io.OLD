all: divisor-tensao.svg pwm-led.svg motor-npn-pot.svg potenciometro-a0.svg

%.dep: schem-base.tex
	lualatex -synctex=1 -interaction=batchmode $<

%.svg: %.pdf
	inkscape $< --export-plain-svg=$@

include schem-base.makefile
