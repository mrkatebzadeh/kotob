PREFIX = /usr/local

kotob: kotob.sh kotob.awk kotob.tsv
	cat kotob.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz kotob.awk kotob.tsv >> $@
	chmod +x $@

test: kotob.sh
	shellcheck -s sh kotob.sh

clean:
	rm -f kotob

install: kotob
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f kotob $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/kotob

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/kotob

.PHONY: test clean install uninstall
