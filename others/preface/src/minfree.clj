(ns minfree)

(defn binary-search
  [lst l u]
  (if (seq lst)
    (let [m (quot (+ l u) 2)
          [as bs] ((juxt filter remove) #(<= % m) lst)]
      (if (= (count as)
             (inc (- m l)))
        (recur bs (inc m) u)
        (recur as l m)))
    l))

(defn min-free
  [lst]
  (binary-search lst 0 (dec (count lst))))


(defn test
  []
  (min-free [8, 23, 9, 0, 12, 11, 1, 10, 13, 7, 41, 4, 14, 21, 5, 17, 3, 19, 2, 6]))
