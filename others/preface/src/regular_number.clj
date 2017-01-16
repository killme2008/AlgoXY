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

;;one queue
(defn unique-insert [v x]
  (if (some #{x} v)
    v
    (let [[l u] (split-with #(< % x) v)]
      (apply conj (vec l) x u))))

(defn rns2
  {:test (fn []
           (assert
            (=
             859963392
             (time (rns2 1500)))))}
  [n]
  (loop [m (dec n)
         q [1]]
    (if (zero? m)
      (first q)
      (recur
       (dec m)
       (let [[x & xst] q]
         (-> xst
             (unique-insert (* 2 x))
             (unique-insert (* 3 x))
             (unique-insert (* 5 x))))))))
;;three queues
(defn rns3
  {:test (fn []
           (assert
            (=
             859963392
             (time (rns3 1500)))))}
  [n]
  (if (= 1 n)
    1
    (loop [m (dec n)
           q1 [2]
           q2 [3]
           q3 [5]]
      (let [x (apply min (map first [q1 q2 q3]))]
        (if (= m 1)
          x
          (let [[x1 & xst1] q1
                [x2 & xst2] q2
                [x3 & xst3] q3]
            (condp = x
              x1 (recur (dec m)
                        (conj (vec xst1) (* 2 x))
                        (conj q2 (* 3 x))
                        (conj q3 (* 5 x)))
              x2 (recur (dec m)
                        q1
                        (conj (vec xst2) (* 3 x))
                        (conj q3 (* 5 x)))
              x3 (recur (dec m)
                        q1
                        q2
                        (conj (vec xst3) (* 5 x))))))))))

(time (rns2 1500))
(time (rns3 1500))
