$(wildcard spin-http/*): $(wildcard wit/*)
	wit-bindgen tiny-go -w http-trigger ./wit --out-dir=spin-http

main.wasm: $(wildcard **/*.go) $(wildcard spin-http/*)
	tinygo build -target=wasi -gc=leaking -no-debug -o main.wasm main.go

main.embed.wasm: main.wasm
	wasm-tools component embed --world http-trigger ./wit main.wasm -o main.embed.wasm

main.component.wasm: main.embed.wasm
	 wasm-tools component new main.embed.wasm --adapt wasi_snapshot_preview1.command.wasm -o main.component.wasm

build: main.component.wasm
