package main

import (
	"fmt"
	"net/http"
	"log"
	"strconv"
)

func soma(x int, y int) int {
	return x + y
}

func main() {
	println(fmt.Sprintf("http://localhost:8080/soma?x=3&y=5"))

	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, `
		<html>
			Exemplo:</br></br>
			<a href=http://localhost:8080/soma?x=3&y=2>http://localhost:8080/soma?x=3&y=5</a>
		</html>
		`)
	})

	http.HandleFunc("/soma", func (w http.ResponseWriter, r *http.Request) {
		vars := r.URL.Query()
		x, _ := strconv.Atoi(vars.Get("x"))
		y, _ := strconv.Atoi(vars.Get("y"))
		z := soma(x, y)
		fmt.Fprintf(w, "Soma de %v + %v = %v", x, y, z)
		println(fmt.Sprintf("Soma de %v + %v = %v", x, y, z))
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}