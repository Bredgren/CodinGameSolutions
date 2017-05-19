(ns Solution
  (:gen-class))

(require 'clojure.string)

(def rad #(* (/ % 180) Math/PI))
(def parse-num #(rad (read-string (clojure.string/replace % "," "."))))

(defn distance [lonA latA lonB latB]
    (let [x (* (- lonB lonA) (Math/cos (/ (+ latA latB) 2)))
          y (- latB latA) ]
        (* (Math/sqrt (+ (* x x) (* y y))) 6371)))

(defn name-dist [lon lat line]
    (->> (clojure.string/split line #";")
         (#(list (nth % 1) (distance lon lat (parse-num (nth % 4)) (parse-num (nth % 5)))))))

(defn answer [lon lat n]
    (->> (repeatedly n read-line)
         (map (partial name-dist lon lat))
         (apply min-key #(nth % 1))
         first))

(defn -main [& args]
  (let [lon (parse-num (read-line)) lat (parse-num (read-line)) n (read) _ (read-line)]
    (println (answer lon lat n))))

; (binding [*out* *err*]
;   (println "Debug messages..."))


; Cool solutions by others

; (defn defib-to-map [s]
;     (zipmap [:num :name :addr :phone :lon :lat]
;             (clojure.string/split s #";")))
;
; (defn str-to-rad [s]
;     (->> (clojure.string/replace s #"," ".")
;          read-string
;          Math/toRadians))
;
; (defn distance [& args]
;   (let [[lonA latA lonB latB] (map str-to-rad args)
;         x (* (- lonB lonA) (Math/cos (/ (+ latA latB) 2)))
;         y (- latB latA)]
;         (* (Math/sqrt (+ (* x x) (* y y))) 6371)))
;
; (defn -main [& args]
;   (let [LON (read-line)
;         LAT (read-line)
;         N (read) _ (read-line)]
;     (->> (repeatedly N read-line)
;          (map defib-to-map)
;          (apply min-key #(distance LON LAT (:lon %) (:lat %)))
;          (:name)
;          (println))))

; (defn -main [& args]
;   (let [LON (read-string (clojure.string/replace (read-line) #"," ".")) LAT (read-string (clojure.string/replace (read-line) #"," ".")) N (read-string (read-line)) ]
;     (binding [*out* *err*] (println LON LAT N))
;     (loop [i N bestName "" bestDist 10000000]
;       (if (> i 0)
;         (let [
;               DEFIB (clojure.string/split (read-line) #";")
;               defibName (DEFIB 1)
;               lon (read-string (clojure.string/replace (DEFIB 4) #"," "."))
;               lat (read-string (clojure.string/replace (DEFIB 5) #"," "." ))
;               dist (+ (* (- lon LON) (- lon LON)) (* (- lat LAT) (- lat LAT)))
;              ]
;             (binding [*out* *err*] (println defibName lon lat))
;
;             (recur (dec i) (if (< dist bestDist) defibName bestName) (if (< dist bestDist) dist bestDist))
;         )
;         (println bestName)
;       )
;     )
;   )
; )
