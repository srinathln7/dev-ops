package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
)

type Response struct {
	Status  string `json:"status"`
	Message string `json:"message"`
}

func handler(w http.ResponseWriter, r *http.Request) {
	var msg = "Hello ci-cd-test server"

	response := Response{
		Status:  "OK",
		Message: msg,
	}

	// Marshal the struct to JSON
	jsonResponse, err := json.Marshal(response)
	if err != nil {
		http.Error(w, "internal Server Error", http.StatusInternalServerError)
		return
	}

	// Set Content-Type header to application/json
	w.Header().Set("Content-Type", "application/json")

	// Write the JSON response with a 200 status code
	w.WriteHeader(http.StatusOK)
	w.Write(jsonResponse)
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	// Create a Response struct
	response := Response{
		Status:  "OK",
		Message: "healthy",
	}

	// Marshal the struct to JSON
	jsonResponse, err := json.Marshal(response)
	if err != nil {
		http.Error(w, "internal Server Error", http.StatusInternalServerError)
		return
	}

	// Set Content-Type header to application/json
	w.Header().Set("Content-Type", "application/json")

	// Write the JSON response with a 200 status code
	w.WriteHeader(http.StatusOK)
	w.Write(jsonResponse)
}

func main() {

	var p = os.Getenv("PORT")
	if len(p) == 0 {
		p = "8080"
	}

	port, err := strconv.Atoi(p)
	if err != nil {
		panic("port not yet set")
	}

	http.HandleFunc("/", handler)
	http.HandleFunc("/health", healthHandler)

	fmt.Printf("ci-cd-test server listening on port %d\n", port)
	err = http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
	if err != nil {
		log.Fatal("error:", err)
	}
}
