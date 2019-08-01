.PHONY: build
build: build-docker

.PHONY: build-docker
build-docker: snapcraft

.PHONY: snapcraft
snapcraft: snap/snapcraft.yaml
	docker run -v "$$PWD":/build -w /build snapcore/snapcraft:stable snapcraft $(ARGS)

.PHONY: try
try:
	snap try --devmode
