// Go service
package main

import (
        "encoding/json"
        "fmt"
        "net/http"
        "io/ioutil"
)

type LogRequest struct {
        Operation    string        `json:"operation"`
        StringInput  string        `json:"stringInput"`
        PythonResult []interface{} `json:"pythonSortResult"`
}

func logHandler(w http.ResponseWriter, r *http.Request) {
        body, err := ioutil.ReadAll(r.Body)
        if err != nil {
                http.Error(w, "Error reading request body", http.StatusInternalServerError)
                return
        }

        var logRequest LogRequest
        if err := json.Unmarshal(body, &logRequest); err != nil {
                http.Error(w, "Error decoding request body", http.StatusBadRequest)
                return
        }

        // Example logging
        fmt.Printf("Received request: %+v\n", logRequest)

        // Send confirmation back to Node.js service
        w.Write([]byte("Request logged successfully"))
}

func main() {
        http.HandleFunc("/log", logHandler)
        port := 8080
        fmt.Printf("Go service listening at http://localhost:%d\n", port)
        http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
}