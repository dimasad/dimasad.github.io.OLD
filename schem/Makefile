all: divisor-tensao.svg pwm-led.svg motor-npn-pot.svg potenciometro-a0.svg \
     buck.svg boost.svg

%.svg: %.pdf
	pdftocairo -svg $< $@

include schem-base.makefile

clean:
	rm *.pdf *.aux *.synctex* *.log *.out *.md5 *.dep *.figlist *.dpth
	rm *.auxlock .figlist

