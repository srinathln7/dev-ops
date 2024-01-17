package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

const port = 8080

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello AWS!\n")
}

type HealthResponse struct {
	Status string `json:"status"`
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	// Create a HealthResponse struct
	response := HealthResponse{
		Status: "OK",
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
	http.HandleFunc("/", handler)
	http.HandleFunc("/health", healthHandler)

	fmt.Printf("server is listening on port %d\n", port)
	err := http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
	if err != nil {
		log.Fatal("error:", err)
	}
}
