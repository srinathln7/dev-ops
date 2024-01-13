package main

import (
	"fmt"
	"log"
	"net/http"
)

const port = 8080

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello World!\n")
}

func main() {
	http.HandleFunc("/", handler)

	fmt.Printf("server is listening on port %d\n", port)
	err := http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
	if err != nil {
		log.Fatal("error:", err)
	}

}
