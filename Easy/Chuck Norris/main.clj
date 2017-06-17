(ns Solution
  (:gen-class))

(require '[clojure.string :as str])
(require '[clojure.pprint :refer (cl-format)])

(defn encodeBlock [lst]
    (str (if (= (first lst) \1) "0" "00") " " (apply str (repeat (count lst) \0))))

(defn -main [& args]
    (->> (read-line)
         ; Convert each character to 7-bit binary
         (map (fn [i] (cl-format nil "~7,'0',B" (int i))))
         ; Join into one large string
         (str/join)
         ; Group consecutive 0's and 1's
         (partition-by identity)
         ; Encode each group then join with spaces
         (map encodeBlock)
         (str/join " ")
    (println)))

; (binding [*out* *err*]
;   (println "Debug messages..."))

; Cool solution by someone else
; (ns Solution
;   (:gen-class))
;
; ; Auto-generated code below aims at helping you parse
; ; the standard input according to the problem statement.
;
; (defn -main [& args]
;   (let [MESSAGE (read-line)]
;
;     ;(binding [*out* *err*]
;     ;  (println "Debug messages..."))
;
;     ; Write answer to stdout
;
;     (->> MESSAGE
;          (mapcat #(map (partial bit-test (int %)) (reverse (range 7))))
;          (partition-by identity)
;          (map #(apply str (if (first %) "0 " "00 ")
;                           (repeat (count %) "0")))
;          (clojure.string/join " ")
;          (println))))
