standalone:
	curl https://rebrand.ly/getpact -Lso - | sh -s -- install-cli standalone

set_path:
	export PATH="${PWD}/pact/bin:${PATH}"

go_test_v1:
	cd go-1 && go test main/consumer_test.go