(ns regular-number)

;;trivial solution
(defn recur-mod [x n]
  (if (zero? (rem x n))
    (recur (quot x n) n)
    x))

(defn rns1 []
  (filter
   (fn [x]
     (= 1
        (-> x
            (recur-mod 2)
            (recur-mod 3)
            (recur-mod 5))))
   (iterate inc 1)))

;;lazy queue
