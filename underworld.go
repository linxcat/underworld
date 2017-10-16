package main

import (
	"net/http"
	"github.com/urfave/negroni"
	"github.com/gorilla/mux"
)

func exampleHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Gorilla!\n"))
}

func main() {
	r := mux.NewRouter()
	//mux.HandleFunc("/", ).Methods("GET")
	r.PathPrefix("/").Handler(http.StripPrefix("/", http.FileServer(http.Dir("./"))))

	n := negroni.Classic()
	n.UseHandler(r)
	n.Run(":8080")
}
