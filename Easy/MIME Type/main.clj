(ns Solution
  (:gen-class))

(require '[clojure.string :as str])

(defn makeMap [n m]
    (if (= n 0) m
        (let [ext (read) mt (read) _ (read-line)]
             (recur (- n 1) (assoc m (str/lower-case ext) mt)))))

(defn -main [& args]
  (let [numElems (read)
        numFiles (read)
        _ (read-line)
        table (makeMap numElems {})]
    (loop [i numFiles]
      (when (> i 0)
        (let [fname (read-line)
              indx (+ (.lastIndexOf fname ".") 1)
              ext (if (> indx 0) (subs fname indx) "")
              mime (table (str/lower-case ext))]
            (println (if (= mime nil) "UNKNOWN" mime))
            (recur (dec i)))))))

; (binding [*out* *err*]
;   (println "Debug messages..."))

; Cool solution by someone else
; (ns Solution
;   (:gen-class))
;
; (def uc clojure.string/upper-case)
;
; (defn read-mt []
;   (let [EXT (read) MT (read) _ (read-line)]
;     [(uc EXT) MT]))
;
; (defn -main [& args]
;   (let [N (read)
;         Q (read)
;         m (into {} (repeatedly N read-mt))]
;
;     (dotimes [_ Q]
;       ((fnil println "UNKNOWN")
;         (if-let [EXT (re-find #"(?!^)[^\\.]+$" (read-line))]
;           (if-let [MT (find m (uc EXT))]
;             (val MT)))))))
