standalone:
	curl https://rebrand.ly/getpact -Lso - | sh -s -- install-cli standalone

set_path:
	export PATH="${PWD}/pact/bin:${PATH}"

go_test_v1: pact_deps
	cd go-1 && go test main/consumer_test.go

# https://unix.stackexchange.com/questions/656437/export-env-variable-does-not-work-from-makefile
go_test: pact_deps
	export PATH=/opt/pact/bin:${PATH} && cd go-1 && go test main/consumer_test.go

pact_deps:
	echo "installing pact cli deps"
	curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-ruby-standalone/master/install.sh | bash
	@sudo cp -R pact /opt/pact
	ls /opt/pact