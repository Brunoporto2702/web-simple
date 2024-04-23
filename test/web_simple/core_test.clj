(ns web-simple.core-test
  (:require [clojure.test :refer :all]
            [web-simple.core :refer :all]))

(deftest a-test
  (testing "I do not fail."
    (is (= 1 1)))
  (testing "I also do not fail."
    (is (= 2 2))))
