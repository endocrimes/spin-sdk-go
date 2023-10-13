package main

import (
	wit "github.com/endocrimes/spin-sdk-go/http-trigger"
)

func main() {
	return
}

type HTTPHandler struct {
}

func (h *HTTPHandler) HandleRequest(req wit.FermyonSpinHttpTypesRequest) wit.FermyonSpinHttpTypesResponse {
	return wit.FermyonSpinHttpTypesResponse{
		Status: 200,
		Body:   wit.Some([]byte("hello fermyon")),
	}
}

func init() {
	wit.SetExportsFermyonSpinInboundHttp(&HTTPHandler{})
}
