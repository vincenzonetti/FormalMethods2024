(set-option :produce-models true)

(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-const x8 Int)

(assert (and (>= x1 0) (< x1 8)))
(assert (and (>= x2 0) (< x2 8)))
(assert (and (>= x3 0) (< x3 8)))
(assert (and (>= x4 0) (< x4 8)))
(assert (and (>= x5 0) (< x5 8)))
(assert (and (>= x6 0) (< x6 8)))
(assert (and (>= x7 0) (< x7 8)))
(assert (and (>= x8 0) (< x8 8)))


(assert (not(or (= x1 x2) (= x1 x3))))
(assert (not(or (= x2 x1) (= x2 x3) (= x2 x4))))
(assert (not(or (= x3 x2) (= x3 x1) (= x3 x4) (= x3 x5) (= x3 x6) (= x3 x8))))
(assert (not(or (= x4 x2) (= x4 x5) (= x4 x3))))
(assert (not(or (= x5 x3) (= x5 x4) (= x5 x6) (= x5 x7))))
(assert (not(or (= x6 x3) (= x6 x5) (= x6 x7) (= x6 x8))))
(assert (not(or (= x7 x6) (= x7 x8) (= x7 x5))))
(assert (not(or (= x8 x3) (= x8 x6) (= x8 x7))))

(define-fun color ((x Int)) Int (ite (
    or 
    (= x1 x)
    (= x2 x)
    (= x3 x)
    (= x4 x)
    (= x5 x)
    (= x6 x)
    (= x7 x)
    (= x8 x)
) 1 0))

(minimize (+ 
    (color 0)
    (color 1)
    (color 2)
    (color 3)
    (color 4)
    (color 5)
    (color 6)
    (color 7)
    ))

(check-sat)
(get-objectives)
(get-model)