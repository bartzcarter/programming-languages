; Function to count the number of atoms in a list using recursion
(defun countAtoms (list)
    (cond
        ((not list) 0)
        ((atom (first list)) (+ 1 (countAtoms (rest list))))
        (t (+ (countAtoms (first list)) (countAtoms (rest list))))
    )
)

; Function to sum the numbers in a list using recursion
(defun sumList (list)
    (if (not list) 0 (+ (first list) (sumList (rest list))))
)

; Testing countAtoms function
(format t "Testing countAtoms function:~%")

(format t "Input: '(1 (2 3) (4 (5 6))) -> Output: ~a~%" (countAtoms '(1 (2 3) (4 (5 6)))))
(format t "Input: '(a (b (c d)) e) -> Output: ~a~%" (countAtoms '(a (b (c d)) e)))
(format t "Input: '((1 2) (3 (4 5) 6) (7)) -> Output: ~a~%" (countAtoms '((1 2) (3 (4 5) 6) (7))))
(format t "Input: '() -> Output: ~a~%" (countAtoms '()))

; Testing sumList function
(format t "~%Testing sumList function:~%")

(format t "Input: '(1 2 3 4 5) -> Output: ~a~%" (sumList '(1 2 3 4 5)))
(format t "Input: '(10 20 30) -> Output: ~a~%" (sumList '(10 20 30)))
(format t "Input: '() -> Output: ~a~%" (sumList '()))
(format t "Input: '(7 -3 4) -> Output: ~a~%" (sumList '(7 -3 4)))