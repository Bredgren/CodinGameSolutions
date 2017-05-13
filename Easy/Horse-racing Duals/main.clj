(ns Solution
  (:gen-class))

(defn readN [N]
    "Read N values from stdin and return as a list"
    (loop [i N items []]
          (if (<= i 0)
              items
              (recur (dec i) (conj items (read))))))

(defn -main [& args]
    "Read numbers from and sort"
    (let [strengths (sort (readN (read)))]
        "Find min difference between adjacent pairs"
        (println (apply min (map - (rest strengths) strengths)))))

; Cool solution by someone else
; (defn -main [& args]
;     (->> (repeatedly (read) read) ; reads all numbers
;          sort                     ; sort numbers
;          (#(map - (next %) %))    ; # creates a funtion, next offests by 1, % is the function argument (sorted list)
;          (apply min)
;          println))

; Crappy old solution
; (ns Solution
;   (:gen-class))
;
; (defn diff [s]
;     (map - (rest s) s))
;
; (defn -main [& args]
;   (let [N (read) strengths (atom []) ]
;     (loop [i N]
;       (when (> i 0)
;         (let [Pi (read)]
;              (swap! strengths conj Pi)
;         (recur (dec i)))))
;     (swap! strengths sort)
;     (swap! strengths diff)
;     (binding [*out* *err*]
;         (println "strenths: " @strengths))
;
;     ; (binding [*out* *err*]
;     ;   (println "Debug messages..."))
;
;     (println (apply min @strengths))))
