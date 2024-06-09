(ns web-simple.core
  (:require [io.pedestal.http :as http]
            [io.pedestal.http.route :as route])
  (:gen-class))

(defn respond-hello [request]
  {:status 200 :body "Hello, world 2!"})

(def routes
  (route/expand-routes
   #{["/greet" :get respond-hello :route-name :greet]}))

(defn create-server []
  (http/create-server
   {::http/routes routes
    ::http/type :jetty
    ::http/host "0.0.0.0"
    ::http/port 8890}))

(defn start []
  (http/start (create-server)))

(defn -main
  []
  (start))
