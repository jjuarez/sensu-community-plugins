VERSION=1.0
TARGET=deb
NAME=sensu-community-plugins
PREFIX=/etc/sensu/plugins
MAINTAINER="$(USER)@$(shell hostname)"
VENDOR="Community"
URL=$(shell git config remote.origin.url)
LICENSE="MIT"
CATEGORY="Monitoring"
DESCRIPTION="Collection of plugins for Sensu maintained by the community"

SOURCES=extensions handlers mutators plugins

.PHONY=package

package:
	fakeroot fpm -t $(TARGET) -s dir --prefix $(PREFIX) --force --verbose --log info --name $(NAME) --version $(VERSION) --license $(LICENSE) --vendor $(VENDOR) --url $(URL) --maintainer $(MAINTAINER) --description $(DESCRIPTION) --category $(CATEGORY) $(SOURCES)
