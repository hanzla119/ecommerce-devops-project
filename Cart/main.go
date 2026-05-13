package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

// Simple in-memory storage for our cart
var cartItems = []string{"DevOps Masterclass Book"}

func getCart(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string][]string{"items": cartItems})
}

func healthCheck(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"status": "Cart Service is healthy!"})
}

func main() {
	http.HandleFunc("/api/cart", getCart)
	http.HandleFunc("/health", healthCheck)

	port := ":8080"
	fmt.Printf("Cart service listening on port %s\n", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		log.Fatal(err)
	}
}
